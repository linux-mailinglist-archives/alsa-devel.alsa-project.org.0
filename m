Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8661757393
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 23:24:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A863E16B5;
	Wed, 26 Jun 2019 23:23:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A863E16B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561584282;
	bh=u62Enih6rDMbmQfP2nLvQ9n6xoaEAcRr+iKNzQeDhtE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pnVHO6YHiMpmgSw3qEocPEFc2pwzThmaCY13yEfUZS2cjJEAUguUbVFZUt0MWDCzp
	 82A/zea8JMO/VWbtNJZDPQdt7tGHAJnnJhzSpObl5CLz2nd+P6bpl+GSURmBARyT4D
	 tRFX/EogI2E9vF4ltpD7AReGEIuUenRAoKRWobNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60841F896CB;
	Wed, 26 Jun 2019 23:22:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33F65F8070C; Wed, 26 Jun 2019 23:22:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57689F8070C
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 23:22:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57689F8070C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Q9RJWtgY"
Received: by mail-pf1-x441.google.com with SMTP id y15so79369pfn.5
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 14:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CIHEr6pS5Yaz5tj/cecHQfeHv+bLX+kAKCJatdVo7Hc=;
 b=Q9RJWtgYJVX/wG4BhsG7WvOXfYW3HXB4ved5h9VXrgtI6gkTj5Bm76LfrzLe+t6Wo1
 4wr+yXnjIDT5FgZiyBhSH6XYqw2Nz9Gif8SE/ZPDjhADl9PWFrhWrFX/AAVPm7cE8fGT
 mlJxbnUCOnNWGaMu01qinLedTAMS786MzHwkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CIHEr6pS5Yaz5tj/cecHQfeHv+bLX+kAKCJatdVo7Hc=;
 b=eg2if75FDZX9r8Wmro8FlCLpTncWHjAmVEggFuww8nA/CZqYdMN22uAKHKXnURMUqs
 RFs26YPvj2J1kXx9/c8JLTj8RDJhHsskZaXsGcuyTiedig+ibl/lnXBkS7VhRROtcWyh
 vxmlVOmaHAmUzl7xOhQxVHWsuKYBXsLr+onkGd9t7EYyDNlJas5kDTLJOf2pYKc9i2xG
 sMQw5XQLmTffXbdMbS/eGuEE1DN8S8cR+cBvefoPPIePz/nRTj5O9r7Zz7FOQNw+LMQV
 RHuaZkIFYxTNhRPF8cI6W6/Vcsxh5jS5aiupA1n56RIOu+q8WSBEO1iGfzLQBK8q2Kl5
 p6ZQ==
X-Gm-Message-State: APjAAAU9wJBm0GJ3sei/d6nSH0JX4OSxkNd/bd5N4e9blU5+6sKy+I05
 m0tOTcaeNYhtEOzk0H3qPqOr7w==
X-Google-Smtp-Source: APXvYqx250n1zZ/0STWhLJjOX1YUjpfVkyfh0hEXV5CrbhPg0iU5VnEooYk15KlqzNZzC4v9rCB/Sg==
X-Received: by 2002:a63:6155:: with SMTP id v82mr79009pgb.304.1561584170430;
 Wed, 26 Jun 2019 14:22:50 -0700 (PDT)
Received: from evgreen2.mtv.corp.google.com
 ([2620:15c:202:201:ffda:7716:9afc:1301])
 by smtp.gmail.com with ESMTPSA id h6sm170323pfn.79.2019.06.26.14.22.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 26 Jun 2019 14:22:49 -0700 (PDT)
From: Evan Green <evgreen@chromium.org>
To: Takashi Iwai <tiwai@suse.com>
Date: Wed, 26 Jun 2019 14:22:20 -0700
Message-Id: <20190626212220.239897-3-evgreen@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626212220.239897-1-evgreen@chromium.org>
References: <20190626212220.239897-1-evgreen@chromium.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: [alsa-devel] [PATCH v2 2/2] ALSA: hda: Use correct start/count for
	sysfs init
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The normal flow through the widget sysfs codepath is that
snd_hdac_refresh_widgets() is called once without the sysfs bool set
to set up codec->num_nodes and friends, then another time with the
bool set to actually allocate all the sysfs widgets. However, during
the first time allocation, hda_widget_sysfs_reinit() ignores the new
num_nodes passed in via parameter and just calls hda_widget_sysfs_init(),
using whatever was in codec->num_nodes before the update. This is not
correct in cases where num_nodes changes. Here's an example:

Sometime earlier:
snd_hdac_refresh_widgets(hdac, false)
  sets codec->num_nodes to 2, widgets is still not allocated

Now:
snd_hdac_refresh_widgets(hdac, true)
  hda_widget_sysfs_reinit(num_nodes=7)
    hda_widget_sysfs_init()
      widget_tree_create()
        alloc(codec->num_nodes) // this is still 2
  codec->num_nodes = 7

Pass num_nodes and start_nid down into widget_tree_create() so that
the right number of nodes are allocated in all cases.

Signed-off-by: Evan Green <evgreen@chromium.org>
---

Changes in v2: None

 sound/hda/hdac_device.c |  2 +-
 sound/hda/hdac_sysfs.c  | 14 ++++++++------
 sound/hda/local.h       |  3 ++-
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index ff3420c5cdc8..b06a698c88a1 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -144,7 +144,7 @@ int snd_hdac_device_register(struct hdac_device *codec)
 	if (err < 0)
 		return err;
 	mutex_lock(&codec->widget_lock);
-	err = hda_widget_sysfs_init(codec);
+	err = hda_widget_sysfs_init(codec, codec->start_nid, codec->num_nodes);
 	mutex_unlock(&codec->widget_lock);
 	if (err < 0) {
 		device_del(&codec->dev);
diff --git a/sound/hda/hdac_sysfs.c b/sound/hda/hdac_sysfs.c
index 400ca262e2f8..41aa4b98162a 100644
--- a/sound/hda/hdac_sysfs.c
+++ b/sound/hda/hdac_sysfs.c
@@ -358,7 +358,8 @@ static int add_widget_node(struct kobject *parent, hda_nid_t nid,
 	return 0;
 }
 
-static int widget_tree_create(struct hdac_device *codec)
+static int widget_tree_create(struct hdac_device *codec,
+			      hda_nid_t start_nid, int num_nodes)
 {
 	struct hdac_widget_tree *tree;
 	int i, err;
@@ -372,12 +373,12 @@ static int widget_tree_create(struct hdac_device *codec)
 	if (!tree->root)
 		return -ENOMEM;
 
-	tree->nodes = kcalloc(codec->num_nodes + 1, sizeof(*tree->nodes),
+	tree->nodes = kcalloc(num_nodes + 1, sizeof(*tree->nodes),
 			      GFP_KERNEL);
 	if (!tree->nodes)
 		return -ENOMEM;
 
-	for (i = 0, nid = codec->start_nid; i < codec->num_nodes; i++, nid++) {
+	for (i = 0, nid = start_nid; i < num_nodes; i++, nid++) {
 		err = add_widget_node(tree->root, nid, &widget_node_group,
 				      &tree->nodes[i]);
 		if (err < 0)
@@ -396,14 +397,15 @@ static int widget_tree_create(struct hdac_device *codec)
 }
 
 /* call with codec->widget_lock held */
-int hda_widget_sysfs_init(struct hdac_device *codec)
+int hda_widget_sysfs_init(struct hdac_device *codec,
+			  hda_nid_t start_nid, int num_nodes)
 {
 	int err;
 
 	if (codec->widgets)
 		return 0; /* already created */
 
-	err = widget_tree_create(codec);
+	err = widget_tree_create(codec, start_nid, num_nodes);
 	if (err < 0) {
 		widget_tree_free(codec);
 		return err;
@@ -428,7 +430,7 @@ int hda_widget_sysfs_reinit(struct hdac_device *codec,
 	int i;
 
 	if (!codec->widgets)
-		return hda_widget_sysfs_init(codec);
+		return hda_widget_sysfs_init(codec, start_nid, num_nodes);
 
 	tree = kmemdup(codec->widgets, sizeof(*tree), GFP_KERNEL);
 	if (!tree)
diff --git a/sound/hda/local.h b/sound/hda/local.h
index 877631e39373..8936120ab4d9 100644
--- a/sound/hda/local.h
+++ b/sound/hda/local.h
@@ -28,7 +28,8 @@ static inline unsigned int get_wcaps_channels(u32 wcaps)
 }
 
 extern const struct attribute_group *hdac_dev_attr_groups[];
-int hda_widget_sysfs_init(struct hdac_device *codec);
+int hda_widget_sysfs_init(struct hdac_device *codec,
+			  hda_nid_t start_nid, int num_nodes);
 int hda_widget_sysfs_reinit(struct hdac_device *codec, hda_nid_t start_nid,
 			    int num_nodes);
 void hda_widget_sysfs_exit(struct hdac_device *codec);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
