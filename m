Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C409D5C201
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2019 19:32:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 493DC1696;
	Mon,  1 Jul 2019 19:31:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 493DC1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562002358;
	bh=xeB61s49OdLDT1ZggR/nWkww0tg3nx3Q+3mCaXqHe8k=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LSq0Kdt//MMs6byu/h7vAASZWw/HdSRPk6DDWc7CZ6ukxTJZgVdxo0LJqEU6HcQ5b
	 D9fCJwfEvT/ugFrItj/OKc7u6cdjuDZFA2XuDRwITD+vMK1WGZ8f4oKJ4xurkUo166
	 CNoLXPT+ARafrgBX5K5xUszgK29T6+SHuD48Y+zc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87100F80090;
	Mon,  1 Jul 2019 19:30:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 503F3F80096; Mon,  1 Jul 2019 19:30:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3244EF8008E
 for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2019 19:30:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3244EF8008E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="awfBR53c"
Received: by mail-pl1-x644.google.com with SMTP id m7so7665780pls.8
 for <alsa-devel@alsa-project.org>; Mon, 01 Jul 2019 10:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SbjyLgOhtDSopoLbQRya8z6cDiEX3QnPAyeC6iTDsA0=;
 b=awfBR53cYYeNdAmUC6qRCyNuCBq5Gn2U5ktWi0DUNSiBQWFot1XhV5VGK4sbk/MFwU
 ky2Sa+/a0NTwiIPa3hqvnAIkkzfBsqD7ZoJzBHJSfgMx1jdZDX8fSsuRzuqN7G8putue
 XmUQwpNoeWMI32y5wZq6n5r4jpu73EXLoMtdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SbjyLgOhtDSopoLbQRya8z6cDiEX3QnPAyeC6iTDsA0=;
 b=Sanw6HP7RoZ1O5F71dlkjKleN+iUTvzglHF8G0TSBtD9fiJa5ojfK6J0sBVb5FiVJu
 v5+jo316dyRs2fxP5XFvV7iJgLW/AbFRKPB0fdtmv/R998sPvXSG2/EjVjhUQt/n6o6e
 Opiq3QsNt+mAHSH5fav3uDdmp02qs5Tzj8Kq6yeZQMlyMNKIFpdxAu+7r3ULeni8ari2
 VxjN8QbCLpwC2DzenL/bg47wdBKQx4KsZ9ZZ6cTfTVDvZounAxqWZ75hPJCr6wJNABvw
 iphRFRb4mKrrrgaEdXigHggRW3fw+pOBzwrlwYqOCB8byOFeRzSVlTkJHG5MOmb2JsGR
 aGGg==
X-Gm-Message-State: APjAAAXiouq5DhKYfI7WcoC8w0AvwH9OEJARJwmZGHcdDXYMQnE/wR56
 hHvaqJOTPnN8YyXC3z1qlFAmrw==
X-Google-Smtp-Source: APXvYqwJmfJtaeEEUAjJY21fEcsc6H+J501S5pJOv3Ogy74WItHaVtEmV14wGfUAV6Z+V1lvyGiIDw==
X-Received: by 2002:a17:902:8d97:: with SMTP id
 v23mr3403051plo.157.1562002246821; 
 Mon, 01 Jul 2019 10:30:46 -0700 (PDT)
Received: from evgreen2.mtv.corp.google.com
 ([2620:15c:202:201:ffda:7716:9afc:1301])
 by smtp.gmail.com with ESMTPSA id h11sm11791289pfn.170.2019.07.01.10.30.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 01 Jul 2019 10:30:45 -0700 (PDT)
From: Evan Green <evgreen@chromium.org>
To: Takashi Iwai <tiwai@suse.com>
Date: Mon,  1 Jul 2019 10:30:30 -0700
Message-Id: <20190701173030.168346-1-evgreen@chromium.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: [alsa-devel] [PATCH v3] ALSA: hda: Fix widget_mutex incomplete
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

Fixes: ed180abba7f1 ("ALSA: hda: Fix race between creating and refreshing sysfs entries")

Signed-off-by: Evan Green <evgreen@chromium.org>

---

Changes in v3:
- Moved locking back into callers (Takashi)
- Combined update_widgets exit flow (Takashi)

Changes in v2:
- Introduced widget_mutex relocation

 sound/hda/hdac_device.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index 6907dbefd08c..3842f9d34b7c 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -400,27 +400,33 @@ static void setup_fg_nodes(struct hdac_device *codec)
 int snd_hdac_refresh_widgets(struct hdac_device *codec, bool sysfs)
 {
 	hda_nid_t start_nid;
-	int nums, err;
+	int nums, err = 0;
 
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
-	return 0;
+unlock:
+	mutex_unlock(&codec->widget_lock);
+	return err;
 }
 EXPORT_SYMBOL_GPL(snd_hdac_refresh_widgets);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
