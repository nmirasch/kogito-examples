/**
 *  Copyright 2021 Red Hat, Inc. and/or its affiliates.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package org.acme.publishing;

public class Article {

    private String title;
    private String subtitle;
    private String content;
    private String status;

    public Article() {
    }

    public Article(String title, String subtitle, String content, String status) {
        this.title = title;
        this.subtitle = subtitle;
        this.content = content;
        this.status = status;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    /*  public boolean isDiscarded() {
            return discarded;
        }

        public void setDiscarded(boolean discarded) {
            this.discarded = discarded;
        }

        public boolean isPublished() {
            return published;
        }

        public void setPublished(boolean published) {
            this.published = published;
        }

        public boolean isOnReview() {
            return onReview;
        }

        public void setOnReview(boolean onReview) {
            this.onReview = onReview;
        }
    */
    @Override
    public String toString() {
        return "Article [title=" + title + ", subtitle=" + subtitle + ", content=" + content + ", status=" + status + "]";
       // + discarded + ", published=" + published + ", onReview=" + onReview + "]";
    }
}
