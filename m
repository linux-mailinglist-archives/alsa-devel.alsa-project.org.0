Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EC4639CB4
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Nov 2022 21:05:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61AB316B0;
	Sun, 27 Nov 2022 21:04:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61AB316B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669579545;
	bh=s1hlyXlFMcsbbpy4qR3m3W7fS0UNSJO46JANbYHIp7k=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IxHsipTHGudmkeZgeeysZVoTjt0J/1FROAf7vN1Iw08sHgVlDHRDjbMAQi/CrI5/U
	 Z4MA9P3HnZIRhIIB7sbd4BzeSgiLAdzGuzR0H2iRWVeOmj8L+SApZ/r4dl1w7hkYne
	 yNZIUWY1sxWDtq9h4MYiSULxInPBwptbglZH0o6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DE48F80424;
	Sun, 27 Nov 2022 21:04:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B87B4F8027D; Sun, 27 Nov 2022 21:04:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDCCDF800B6
 for <alsa-devel@alsa-project.org>; Sun, 27 Nov 2022 21:04:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDCCDF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="U7ppHaFy"
Received: by mail-ej1-x629.google.com with SMTP id n21so21256847ejb.9
 for <alsa-devel@alsa-project.org>; Sun, 27 Nov 2022 12:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+PQ8C4HY8GI4Ih4606HRpgDC5j1lzCXOLCR0j10k4og=;
 b=U7ppHaFyl2uoDpwagB2uxHAl3qXc867gSP+EYCeh+Ekig4WP0Bj22uBXpJjS8d8vEE
 LfkOFhLIy9pJy18/nyFhYljoO5jFByJETKBHVuWQFPnFRy774YGv7VpFp+RRKYcrp1if
 819lzsJqo5p6Lm3XpekIHPbmMZ0zCSiwwxfNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+PQ8C4HY8GI4Ih4606HRpgDC5j1lzCXOLCR0j10k4og=;
 b=dqy0ZYzRkDyws3lPgGIAx9R6yMxU3YQoMM4bgiKoA2PmNCv++AV60iOpWCURzl4yED
 YCXg1NdnevfPJjPIezB35GN3Wd697GDexTe2XFBYHqsnVsruC9Qbc2NpFbtq+PV2x421
 ssnbWdH5dNx/pENal6lhG/peLY52bh2gi6bOk7Get7WFmxxSxa4Hj5p+xC+gL2Zn/eXr
 1IplZl/lU7NQeQCVPxSwBBgahH7pq7oIdFcrmEexx26MWwLUmli6SZNhkZtuM3roOaIv
 OQu4l8t5jTHJjSL5gR/JH8PhoWe8i1CKS4jdIC2pCu/8IjqovqOCAa12DijeHMF3RxcV
 mGQw==
X-Gm-Message-State: ANoB5plYijfeKEIGaEyDyCzlOL4bZE5dwcNNVdVA6f6RgNBQEL8hTVY/
 e/Eci0c+UwyzMCQ1g+lOrZK3kg==
X-Google-Smtp-Source: AA0mqf42mS5Gm+YoLaWqTwXnCwIMBQWeQRJjTw5H5MATSu9YOsyjAoJB9z+d52K7UVjI1cU0rqhGNg==
X-Received: by 2002:a17:907:2c45:b0:7b8:bbbe:5ca with SMTP id
 hf5-20020a1709072c4500b007b8bbbe05camr23250340ejc.544.1669579483314; 
 Sun, 27 Nov 2022 12:04:43 -0800 (PST)
Received: from alco.roam.corp.google.com (80.71.134.83.ipv4.parknet.dk.
 [80.71.134.83]) by smtp.gmail.com with ESMTPSA id
 y5-20020aa7ccc5000000b0045b3853c4b7sm4365211edt.51.2022.11.27.12.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 12:04:42 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 27 Nov 2022 21:04:15 +0100
Subject: [PATCH] ASoC: SOF: mediatek: add shutdown callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221127-mtk-snd-v1-0-b7886faa612b@chromium.org>
To: Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=2277; i=ribalda@chromium.org; 
 h=from:subject:message-id;
 bh=s1hlyXlFMcsbbpy4qR3m3W7fS0UNSJO46JANbYHIp7k=; 
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjg8LGMFtVpE68zXEwJMlnmGcwIe5eTlR8bzX79ra4
 AxIafBCJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4PCxgAKCRDRN9E+zzrEiFtXEA
 Cf5Sg6YXeWg5yplb+YZwdBmNJiO11ksXUZ3IaGKVDn17qaPvhSLMD/2JjzzMLAh20rsOEke/qO/fjK
 341aMOWWArQ0zVwVdBdnDuC6xqfzdUJbH3DxKiElpYI9Zi6R2v6T8U+CRLhVLl6pWc917giiYK1AUI
 cuxoIhteEClZYg+9lIehzMJszaHDDPY6upPC1Dc2sOmHh1zfjqHB1vZAqMc0qXW8rsRUQMmkhvShs/
 kV+AtdLGWzdvE0jx8KN0XtUWIcwQg5O2EdN0xYbE4AkKaXCskBhKanLbblN6ajBDnh/qKb+6vwsWiB
 UBT2+KVYWh22KI3ry5+hx4O7KNixHflRtNZ8+67TmFEizc9EC+m5TGT98ek84Gr99KZo9YSXAom571
 QuAJ7RMaEcFmUJWo5lwZM0rRnAxaLp4UmA8QgpR0CqPDsA3VDMWmRVoYb0hNFBRPXAgPPju9S4wnWJ
 ma9Eug+OfJBSaJrVzFX7QUJC3h2XL2AeddGWR8ztI3d2gK/PNHMzbR35taHoM+E1nHOz3SnsWzB/N3
 eTYnx1sAnYNbNHqko7qj3c4CF2yp6J2emRGKTw9XnsAfrqXtNMJd8+eqBsV1pCMM6n9vP2X0Y0LAnV
 ooib9iObWJi/rL13BKkBNmNtEWN0VmDYGopctoP8eP79KJxn6iNehmddVjrw==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>,
 linux-arm-kernel@lists.infradead.org, sound-open-firmware@alsa-project.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

If we do not shutdown the peripheral properly at shutdown, the whole system
crashes after kexec() on the first io access.

Let's implement the appropriate callback.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: sound-open-firmware@alsa-project.org
Cc: alsa-devel@alsa-project.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 181189e00e02..79da25725987 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -430,6 +430,11 @@ static int mt8186_dsp_remove(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+static int mt8186_dsp_shutdown(struct snd_sof_dev *sdev)
+{
+	return snd_sof_suspend(sdev->dev);
+}
+
 static int mt8186_dsp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 {
 	mt8186_sof_hifixdsp_shutdown(sdev);
@@ -538,6 +543,7 @@ static struct snd_sof_dsp_ops sof_mt8186_ops = {
 	/* probe and remove */
 	.probe		= mt8186_dsp_probe,
 	.remove		= mt8186_dsp_remove,
+	.shutdown	= mt8186_dsp_shutdown,
 
 	/* DSP core boot */
 	.run		= mt8186_run,
@@ -629,6 +635,7 @@ MODULE_DEVICE_TABLE(of, sof_of_mt8186_ids);
 static struct platform_driver snd_sof_of_mt8186_driver = {
 	.probe = sof_of_probe,
 	.remove = sof_of_remove,
+	.shutdown = sof_of_shutdown,
 	.driver = {
 	.name = "sof-audio-of-mt8186",
 		.pm = &sof_of_pm,

---
base-commit: 4312098baf37ee17a8350725e6e0d0e8590252d4
change-id: 20221127-mtk-snd-e0abf36be4c0

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>
