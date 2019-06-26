Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 612B857398
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 23:26:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5785169E;
	Wed, 26 Jun 2019 23:25:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5785169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561584371;
	bh=bBu7Kzrfg43H4gLRYTUo1NjlMbRXuV+dgP0ZaDwEOzI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pRKCPSgW5o7XKK4WXFrZXwBJx147/2s80CihpEppJC72zjThmlP5kmt9mAJ6ir2QN
	 dnkJznRahesWzhmf6DVuxjCH6EXTOINWjOdpF9NR43lqKAnmaakVYMo3kvY5axp1iB
	 icn9uojLo2FIpVHCwdbihJMjzcz0jzDX8oeMW42w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2743BF89733;
	Wed, 26 Jun 2019 23:23:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFBB8F8972F; Wed, 26 Jun 2019 23:22:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0A56F806F0
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 23:22:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0A56F806F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="WlFb+XcF"
Received: by mail-pg1-x542.google.com with SMTP id f25so1796711pgv.10
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 14:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dEZUtEk4Wr+4uxHPyA7rQK9pE3KfX4I0BusWmU//o/Y=;
 b=WlFb+XcFK/WW24W9BaFlFf8pYRdZUjLAudlL9bHKJBO9g8ODeas3KvAuOA9xW4zWE0
 ZcDvk07jLU8hkd3wuHatwQh5+O+YKkI97qomvROXoPtqUuwHSONDTEjEouoyRDaJPOo/
 ar02aygC8rSm0ZiCs/bEK+ruuZAomniz7GTdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dEZUtEk4Wr+4uxHPyA7rQK9pE3KfX4I0BusWmU//o/Y=;
 b=DZldd6Z5c9aWm7HvlNLABT/9wKCv6ORoIsAla7IZAXhUWEtlapzsySiWrC2jyN2Kkk
 i5WIhE1K7CV/KL+dxogPRWzPPWfXzHyEo9nxfAbkdTlzi2Kcfp/6VxD+JlPQXeqi0U79
 uUscVlHEBs+iFUSElxSegEd4w29En/nhoAQCfGGgZdTRe9y4kb+IBbxZHhdBAqPonHMB
 W7HoSsuEN3Avt4YlUVcOnkaJ93rHFQhF9pLIReud6nrrNvDUmH0qgr50wlmf/zZiZ7v3
 hcNRV5w4VTfKU+61n49FYtwusE1aZHYx+KqeHmk7zWFmu9F/JfwNbPiDQFYM3stPbfRq
 l2oQ==
X-Gm-Message-State: APjAAAWMOL5SB35w0pzZS5QPOA4YAFMeG55PHxAurkgTMUWmSpW7hVmT
 K92c7focKxWW2/GoohNyDnpfZQ==
X-Google-Smtp-Source: APXvYqwjeDGgN9CC2QLmMm598fKAAPZtXYp0rQllm/ojsEZvV+uu/iI8Ar3zaJWldFR99/jYBi0PCQ==
X-Received: by 2002:a63:6b07:: with SMTP id g7mr43019pgc.325.1561584166923;
 Wed, 26 Jun 2019 14:22:46 -0700 (PDT)
Received: from evgreen2.mtv.corp.google.com
 ([2620:15c:202:201:ffda:7716:9afc:1301])
 by smtp.gmail.com with ESMTPSA id h6sm170323pfn.79.2019.06.26.14.22.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 26 Jun 2019 14:22:46 -0700 (PDT)
From: Evan Green <evgreen@chromium.org>
To: Takashi Iwai <tiwai@suse.com>
Date: Wed, 26 Jun 2019 14:22:19 -0700
Message-Id: <20190626212220.239897-2-evgreen@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626212220.239897-1-evgreen@chromium.org>
References: <20190626212220.239897-1-evgreen@chromium.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: [alsa-devel] [PATCH v2 1/2] ALSA: hda: Fix widget_mutex incomplete
	protection
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

The widget_mutex was introduced to serialize callers to
hda_widget_sysfs_{re}init. However, its protection of the sysfs widget array
is incomplete. For example, it is acquired around the call to
hda_widget_sysfs_reinit(), which actually creates the new array, but isn't
still acquired when codec->num_nodes and codec->start_nid is updated. So
the lock ensures one thread sets up the new array at a time, but doesn't
ensure which thread's value will end up in codec->num_nodes. If a larger
num_nodes wins but a smaller array was set up, the next call to
refresh_widgets() will touch free memory as it iterates over codec->num_nodes
that aren't there.

The widget_lock really protects both the tree as well as codec->num_nodes,
start_nid, and end_nid, so make sure it's held across that update. It should
also be held during snd_hdac_get_sub_nodes(), so that a very old read from that
function doesn't end up clobbering a later update.

While in there, move the exit mutex call inside the function. This moves the
mutex closer to the data structure it protects and removes a requirement of
acquiring the somewhat internal widget_lock before calling sysfs_exit.

Fixes: ed180abba7f1 ("ALSA: hda: Fix race between creating and refreshing sysfs entries")

Signed-off-by: Evan Green <evgreen@chromium.org>

---

Changes in v2:
- Introduced widget_mutex relocation

 sound/hda/hdac_device.c | 19 +++++++++++++------
 sound/hda/hdac_sysfs.c  |  4 ++--
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index 6907dbefd08c..ff3420c5cdc8 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -162,9 +162,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_device_register);
 void snd_hdac_device_unregister(struct hdac_device *codec)
 {
 	if (device_is_registered(&codec->dev)) {
-		mutex_lock(&codec->widget_lock);
 		hda_widget_sysfs_exit(codec);
-		mutex_unlock(&codec->widget_lock);
 		device_del(&codec->dev);
 		snd_hdac_bus_remove_device(codec->bus, codec);
 	}
@@ -402,25 +400,34 @@ int snd_hdac_refresh_widgets(struct hdac_device *codec, bool sysfs)
 	hda_nid_t start_nid;
 	int nums, err;
 
+	/*
+	 * Serialize against multiple threads trying to update the sysfs
+	 * widgets array.
+	 */
+	mutex_lock(&codec->widget_lock);
 	nums = snd_hdac_get_sub_nodes(codec, codec->afg, &start_nid);
 	if (!start_nid || nums <= 0 || nums >= 0xff) {
 		dev_err(&codec->dev, "cannot read sub nodes for FG 0x%02x\n",
 			codec->afg);
-		return -EINVAL;
+		err = -EINVAL;
+		goto unlock;
 	}
 
 	if (sysfs) {
-		mutex_lock(&codec->widget_lock);
 		err = hda_widget_sysfs_reinit(codec, start_nid, nums);
-		mutex_unlock(&codec->widget_lock);
 		if (err < 0)
-			return err;
+			goto unlock;
 	}
 
 	codec->num_nodes = nums;
 	codec->start_nid = start_nid;
 	codec->end_nid = start_nid + nums;
+	mutex_unlock(&codec->widget_lock);
 	return 0;
+
+unlock:
+	mutex_unlock(&codec->widget_lock);
+	return err;
 }
 EXPORT_SYMBOL_GPL(snd_hdac_refresh_widgets);
 
diff --git a/sound/hda/hdac_sysfs.c b/sound/hda/hdac_sysfs.c
index 909d5ef1179c..400ca262e2f8 100644
--- a/sound/hda/hdac_sysfs.c
+++ b/sound/hda/hdac_sysfs.c
@@ -412,13 +412,13 @@ int hda_widget_sysfs_init(struct hdac_device *codec)
 	return 0;
 }
 
-/* call with codec->widget_lock held */
 void hda_widget_sysfs_exit(struct hdac_device *codec)
 {
+	mutex_lock(&codec->widget_lock);
 	widget_tree_free(codec);
+	mutex_unlock(&codec->widget_lock);
 }
 
-/* call with codec->widget_lock held */
 int hda_widget_sysfs_reinit(struct hdac_device *codec,
 			    hda_nid_t start_nid, int num_nodes)
 {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
