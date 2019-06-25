Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 068DE55A69
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2019 23:56:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BDC215F2;
	Tue, 25 Jun 2019 23:55:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BDC215F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561499801;
	bh=CC89f7sfuduN7xjkvP/6qGh06va5ni1IwUw7jY5SGXA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lRFnBUHQWNiF8itAF9vhS2nnzRAprdRLcbB3CYiRNTndlIYcqkPt26aSTxSnIOMcp
	 mDa+Dz/yTAgneSDW/A9zVnqZ5+ogbW0yfg/ku3LYy4le96CUF/12atWVtcT543pvJH
	 U+YKdKZdqSNdXdSMLNW+mJIJKDZBd2OpMlVI8WXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88ED7F896F0;
	Tue, 25 Jun 2019 23:54:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1111F896F9; Tue, 25 Jun 2019 23:54:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35BCFF8071F
 for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2019 23:54:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35BCFF8071F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="UesSR29a"
Received: by mail-pg1-x541.google.com with SMTP id z19so88277pgl.12
 for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2019 14:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vsGWDFoWq4uZ/izmiqzm3s9U3XUZ/ujUeAWfcSTnPsI=;
 b=UesSR29a5IFIuc0hyMCBgsdCpOxynypkCiFRqYozIgNG/K/lWoaIv8Q0k5evk2YCOg
 a7x2+Wfn2fpF+ZZzuk1XBLAkUF94JvNMR6wnfMrzpOYgARROrAjfxTtBXD9VflGseCh0
 RVUqMA8jClZ+MVwTPckC253koxYm9b1uT7WJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vsGWDFoWq4uZ/izmiqzm3s9U3XUZ/ujUeAWfcSTnPsI=;
 b=Xn3U+JlWANAFRiFrC5zUfmdQRxREOeczD4UE+hgkkZjwEHS0pop0XPiHKsuOmgB77L
 LBZmHej4vHGfdSGdOi8gC67FPjZe2Ow/wR8N+WinZvkd2n3cdEev/H6mfh8Up3pG0P/S
 vii58cA4sDKXla5x61mCj71+PWXLycDY4/22E/M/eON5ZuQSXhYiOs3uiE7X7u++IYN7
 BPdtmtr169tyaFjJOjfwYZ5lPoVL8ySsHU8U+G2QZlEaBw98ZnLWcgEW8B8kJUOoNVmI
 wSoIcJAVcQQUatr25LbDU7Eb9aN5ZCu4ofRQqwtaTF9nZNibDgILPUEyA91rZTOeXsjz
 vEDw==
X-Gm-Message-State: APjAAAVB9RH40vRkg4mkiSNBx+Ca9dHjajEYG/JmNcQUDZtKHjeXsMJp
 OcBBBputpMvcIG7YTaRUQt4gjg==
X-Google-Smtp-Source: APXvYqzrbRCyU6uNFX4Fzu3bs7912MYOeqI57YLkIIa0Rj6Wth90r/dxWvgegP/mrMUDw701GVwUvQ==
X-Received: by 2002:a63:1322:: with SMTP id i34mr41786825pgl.424.1561499674675; 
 Tue, 25 Jun 2019 14:54:34 -0700 (PDT)
Received: from evgreen2.mtv.corp.google.com
 ([2620:15c:202:201:ffda:7716:9afc:1301])
 by smtp.gmail.com with ESMTPSA id w22sm16669343pfi.175.2019.06.25.14.54.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 25 Jun 2019 14:54:34 -0700 (PDT)
From: Evan Green <evgreen@chromium.org>
To: Takashi Iwai <tiwai@suse.com>
Date: Tue, 25 Jun 2019 14:54:18 -0700
Message-Id: <20190625215418.17548-1-evgreen@chromium.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: [alsa-devel] [PATCH] ALSA: hda: Use correct start/count for sysfs
	init
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

 sound/hda/hdac_device.c |  2 +-
 sound/hda/hdac_sysfs.c  | 14 ++++++++------
 sound/hda/local.h       |  3 ++-
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index 6907dbefd08c..5e74acf45c81 100644
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
index 909d5ef1179c..1c4b98929d9c 100644
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
