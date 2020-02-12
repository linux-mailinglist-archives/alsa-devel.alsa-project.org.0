Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DD015A7E8
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 12:31:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DEBE167B;
	Wed, 12 Feb 2020 12:30:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DEBE167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581507083;
	bh=ZScPrYEYGjUs+sPrTbbh3MRQZw1Ke+rrBerLBa9A2Rk=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uhJAOJ+X3PKzXNuwMLx5UQrr38O9PWoz8c1JRC+CCiXZpUq2e6o5u69sMwaAoaB6x
	 Hhb3eGSuFRe5SNXFu9HeqXa/A58VEFezjHhniylS51fBDqql/UpcJca88KN/UiERHA
	 tl0D7ynEBtJYAXVNCmAYNpQyLyz16BfZz6PDm3U0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7BB6F80125;
	Wed, 12 Feb 2020 12:29:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D22BBF80157; Wed, 12 Feb 2020 12:29:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-vk1-xa49.google.com (mail-vk1-xa49.google.com
 [IPv6:2607:f8b0:4864:20::a49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 811D5F80125
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 12:29:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 811D5F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="nyH6pgf9"
Received: by mail-vk1-xa49.google.com with SMTP id s4so550836vkk.7
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 03:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=SoC6rVFw6F86jiDloCCVTNvG0+gKemeB0EmmXCP7Dqg=;
 b=nyH6pgf9J7jaOR4zodSFCo3vHMcfatUXwv5n7EHIEZbmRrQN+0sIsCn6NSi7ItZBzY
 D/cMkzBlGf5EtGq2wYbkshowisriEzSCbb1Fm+rGXDC5UwWt9g+6IITPIUDddcapovlT
 RjvkKv2xZQ9ShYTeIG2lniDAvvyhIq3sujIr03QpCMcmFtm2dS+v0iTr5Hb04MZy5H6P
 IZyVwIakftF3kEqIS9c9cSzlS7kay0muLEipZmyxcWeu4c/R+r1Py+bHs8wRgHgnpeh8
 6YYFhX3MntuPRW9adOTAk6Ng43es7I7dTb03xVA9sjLDnbA+gp+D7ibFk9xIFeZi60w1
 Icdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=SoC6rVFw6F86jiDloCCVTNvG0+gKemeB0EmmXCP7Dqg=;
 b=R6dQgSpD/QWa5pvpYgwOe0zuNLeaLe/U7K6KNa/u4Xu6A+lX8FB01SXdfcd4e3ETA/
 qjKuB+iO1xqK5/WSsFMG3PhbeTBOJfyvWu/t4zaPDg14dwUomdS6e8ouB7NfBIB5TBch
 wPkbJ0gWZOWJG69i0oUgNtx8r6OWmltw/tHGrcgeUrEGno1lboFf0VWS6uovwCTj9XV6
 pTszw2nETGZBErK4KoooYWZmct+2U60eTIpmzOsQqDst+eQckcSAL49FDKB0RW7VYLgc
 1baQ1OO1ad58fv8A/fK57vJmdMdnNfN4wRtkm1crhpE1gS0UCqOSfuK6b6Z67/iQJNWn
 t2kA==
X-Gm-Message-State: APjAAAW1vYm0+LijmofuzDENxmmCSDBk2rkfNa0eDLRBaGO+1VlTS+0q
 MfQlbpgwc+7AkGeDVRrneKkmfLv10Nns
X-Google-Smtp-Source: APXvYqwyE18TjD5fW1MmWZFJv3Wb2a8JX+p8pSY+ifSY8r0QabHqn8yasFBmFMDQqG/e+oN4hNYjpMz/g3u3
X-Received: by 2002:a1f:328a:: with SMTP id y132mr7449492vky.60.1581506968242; 
 Wed, 12 Feb 2020 03:29:28 -0800 (PST)
Date: Wed, 12 Feb 2020 19:29:16 +0800
Message-Id: <20200212192707.PATCH.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, airlied@linux.ie, daniel@ffwll.ch
Cc: alsa-devel@alsa-project.org, cychiang@google.com, tzungbi@google.com,
 dri-devel@lists.freedesktop.org, ck.hu@mediatek.com,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, dgreid@google.com,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH] drm/mediatek: fix race condition of plugged_cb
	and codec_dev
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

hdmi_conn_detect and mtk_hdmi_audio_hook_plugged_cb woule be called
by different threads.  plugged_cb and codec_dev are in danger of race
condition.

Fixes by:
- Checks NULLs first.
- Uses WRITE_ONCE() to prevent store tearing (i.e. write to plugged_cb
  after codec_dev).
- Uses codec_dev as a signal to report HDMI jack status.

The patch intends to not use mutex to protect the shared variables.
In runtime, mtk_hdmi_audio_hook_plugged_cb would be called only once
if no one rebinds the sound card.  In contrast, hdmi_conn_detect could
be called multiple times.  Uses a mutex within hdmi_conn_detect calling
path is a waste (no lock contention).

Fixes: 5d3c64477392 ("drm/mediatek: support HDMI jack status reporting")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 03aeb73005ef..746567c91bb7 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1201,7 +1201,7 @@ mtk_hdmi_update_plugged_status(struct mtk_hdmi *hdmi)
 {
 	bool connected = mtk_cec_hpd_high(hdmi->cec_dev);
 
-	if (hdmi->plugged_cb && hdmi->codec_dev)
+	if (hdmi->codec_dev)
 		hdmi->plugged_cb(hdmi->codec_dev, connected);
 
 	return connected ?
@@ -1669,8 +1669,12 @@ static int mtk_hdmi_audio_hook_plugged_cb(struct device *dev, void *data,
 {
 	struct mtk_hdmi *hdmi = data;
 
-	hdmi->plugged_cb = fn;
-	hdmi->codec_dev = codec_dev;
+	if (!fn || !codec_dev)
+		return -EINVAL;
+
+	/* Use WRITE_ONCE() to prevent store tearing. */
+	WRITE_ONCE(hdmi->plugged_cb, fn);
+	WRITE_ONCE(hdmi->codec_dev, codec_dev);
 	mtk_hdmi_update_plugged_status(hdmi);
 
 	return 0;
-- 
2.25.0.225.g125e21ebc7-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
