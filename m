Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 356B516089B
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 04:19:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC06483B;
	Mon, 17 Feb 2020 04:19:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC06483B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581909597;
	bh=+h9J4DdLpuGrvvL6X4pzmKS9Em6q2y5z4mUMCypiwMw=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ixh9UuuSNvB7mSsuChDRSQTJVuOnP0Q/nGcS7wFKnk3d2uNCi6eIMHgY+4IdQHFb+
	 cf/KooF0BG6x/lEqRF7GkCCeOrqA6Zqx+jAkTWinCrOgDgfC2LM6d+lR1mGr7Tw/Ur
	 Y5k7dM9Cf6X+fCQWmVkqEJKu8G0IfMKHmtQQixn4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5C6CF80276;
	Mon, 17 Feb 2020 04:17:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD85AF8025F; Mon, 17 Feb 2020 04:17:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADB08F801F5
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 04:17:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADB08F801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="NS+hvD7V"
Received: by mail-pg1-x54a.google.com with SMTP id m18so10841668pgn.18
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 19:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=E5BCGldRe7eFAGLQVFmcBimFYUghF+IzwiWzbxZYe7o=;
 b=NS+hvD7VZRtKE2R/Xq1U75r1q6HgBSXd3k2OLQjZfHV8YaUAHr1smXbLENNirFdHsj
 PtSomq4XOq1mVdmGlECgRU5iTiJHjiRBYDjMPhCsUSgwRhxV1WnmYjht+97oXpYXp5a3
 kZHl4MHCDRntHydqUWIj6KHo0KmUBhC5b1yTRVfM5/0q/UXBC//Xx9Gtpc6ekyaG1Hk0
 eZpoybGZzoHdV2kgPX9L3vVhZ3WvtqnE0cvx+IktBq2MYvS0Yx6UgWqflya9nUMrr63U
 98DLX1iN+RwZH0ZxFfNuSUFkcM55pIzjwkxZsvbbBH25fTgYKgHTKKIUHPcW9YIXIKlb
 /MUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=E5BCGldRe7eFAGLQVFmcBimFYUghF+IzwiWzbxZYe7o=;
 b=MgBVqmjkuqN5uDcxDMLBqAxKLn6GU8kvlUdIwkx8M0AL+uzhWR7jGV4cNv1PROo1Aa
 DIdPwZNdWLmF8PKbXucSXCerm2sXGzqkCpaNCGOb8pMsEiDnodgsiUbOVc0ZcKRk0xdA
 295J49sWpr3zT0EzoowTAqaiIKASiKzU7gLF+fTmbAzu6RtYtapJ5cBplmwD9n3QA2uL
 zxrGSUvhsdLeWrOuOA17mSiyk7PD65eCJCTECTN9HT1PIyorlRjgy7u5MGODZ5Jd7ip2
 cwPOpLVp+qTqdRKPgwqRmHsm0eQGDvTRKLWVY29Cc2YK1Ha2fc5b9ucPCI4zB7tNa599
 mGyQ==
X-Gm-Message-State: APjAAAV3wPzEf3yvTr9R8gnpbRgVXNTOR0s3dSoowNip78dft+llRFwI
 HhxccWzWFjNVAtZKm+pEU/7aODpyc6Ax
X-Google-Smtp-Source: APXvYqwFBo1TW5OKjVbnTeWNYS7iTLxNwp5AqpuvTgk8sGrNAAP3BgmmBO1Yc/QvcgfKirYdziuDCiuk48HH
X-Received: by 2002:a63:de54:: with SMTP id y20mr15796824pgi.79.1581909431033; 
 Sun, 16 Feb 2020 19:17:11 -0800 (PST)
Date: Mon, 17 Feb 2020 11:16:53 +0800
In-Reply-To: <20200217031653.52345-1-tzungbi@google.com>
Message-Id: <20200217105513.2.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
Mime-Version: 1.0
References: <20200217031653.52345-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, airlied@linux.ie, daniel@ffwll.ch
Cc: alsa-devel@alsa-project.org, cychiang@google.com, tzungbi@google.com,
 dri-devel@lists.freedesktop.org, ck.hu@mediatek.com,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, dgreid@google.com,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v2 2/2] drm/mediatek: fix race condition for
	HDMI jack status reporting
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

hdmi_conn_detect and mtk_hdmi_audio_hook_plugged_cb would be called
by different threads.

Imaging the following calling sequence:
           Thread A                            Thread B
--------------------------------------------------------------------
mtk_hdmi_audio_hook_plugged_cb()
mtk_cec_hpd_high() -> disconnected
                                     hdmi_conn_detect()
                                     mtk_cec_hpd_high() -> connected
                                     plugged_cb(connected)
plugged_cb(disconnected)

The latest disconnected is false reported.  Makes mtk_cec_hpd_high
and plugged_cb atomic to fix.

Also uses the same lock to protect read/write of plugged_cb and codec_dev.

Fixes: 5d3c64477392 ("drm/mediatek: support HDMI jack status reporting")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 03aeb73005ef..d80017e3d84a 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
+#include <linux/mutex.h>
 #include <linux/of_platform.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
@@ -171,6 +172,7 @@ struct mtk_hdmi {
 	bool enabled;
 	hdmi_codec_plugged_cb plugged_cb;
 	struct device *codec_dev;
+	struct mutex update_plugged_status_lock;
 };
 
 static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
@@ -1199,10 +1201,13 @@ static void mtk_hdmi_clk_disable_audio(struct mtk_hdmi *hdmi)
 static enum drm_connector_status
 mtk_hdmi_update_plugged_status(struct mtk_hdmi *hdmi)
 {
-	bool connected = mtk_cec_hpd_high(hdmi->cec_dev);
+	bool connected;
 
+	mutex_lock(&hdmi->update_plugged_status_lock);
+	connected = mtk_cec_hpd_high(hdmi->cec_dev);
 	if (hdmi->plugged_cb && hdmi->codec_dev)
 		hdmi->plugged_cb(hdmi->codec_dev, connected);
+	mutex_unlock(&hdmi->update_plugged_status_lock);
 
 	return connected ?
 	       connector_status_connected : connector_status_disconnected;
@@ -1669,8 +1674,11 @@ static int mtk_hdmi_audio_hook_plugged_cb(struct device *dev, void *data,
 {
 	struct mtk_hdmi *hdmi = data;
 
+	mutex_lock(&hdmi->update_plugged_status_lock);
 	hdmi->plugged_cb = fn;
 	hdmi->codec_dev = codec_dev;
+	mutex_unlock(&hdmi->update_plugged_status_lock);
+
 	mtk_hdmi_update_plugged_status(hdmi);
 
 	return 0;
@@ -1729,6 +1737,7 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	mutex_init(&hdmi->update_plugged_status_lock);
 	platform_set_drvdata(pdev, hdmi);
 
 	ret = mtk_hdmi_output_init(hdmi);
-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
