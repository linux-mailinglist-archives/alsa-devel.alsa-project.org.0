Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD1F59E487
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 15:35:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB325166A;
	Tue, 23 Aug 2022 15:34:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB325166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661261701;
	bh=KvyKH4tCG8wypTKHfM32t7GmFM5Vps/K2+Zv0yTNZQE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pfp3mLN2NrdBTIEi5VpcijlZbf/kL65fdADQhpa2y+seOibOpF8tV75IWVT94p6+y
	 qSvms2m54flILQPutVyToSwPTJc/j6bM81gf6shyLRrYGQfntyTNMp/oCuJvdaZblA
	 LMsS5U5Fb8h6xW1V7FcJt4Enu2jEerOC2skDSqNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E034F800A7;
	Tue, 23 Aug 2022 15:34:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3720CF8020D; Tue, 23 Aug 2022 15:34:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B92D2F8014E
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 15:33:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B92D2F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="kdS3FbP7"
Received: from localhost (unknown [188.27.54.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 98CF96601DD8;
 Tue, 23 Aug 2022 14:33:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661261632;
 bh=KvyKH4tCG8wypTKHfM32t7GmFM5Vps/K2+Zv0yTNZQE=;
 h=From:To:Cc:Subject:Date:From;
 b=kdS3FbP71jZnKLHgNZwZBQS46dupsSqvw9DWB5BNUOzjUySdQ6r+bqMoc+sqAz44s
 qjJWmqi5bqgX/7dIBRRJvxPODJIEsvbnOA8DDCSiRgGOroIFxOo+FPJ2BW+oSuCvdE
 ylDlVpBfOrbtrXZJwKlpXR2RHHACYreRm9sSH4e8GD09lSjGB2IEvTrc97LdxDKJyT
 dLcde+uhV19i56WX2mNmZyBKi4/yxHAJwfN7ngOVN52ub9vsL15udkmxqWhliG+fXu
 x5zbj7XloC35j948sYbZiim+TPSPUjdpR6MqY1JGoqcBDLzrzmxZGy8bcUR+Q2A/68
 REpeg05rWLfVA==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Vlad Karpovich <Vlad.Karpovich@cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH] ASoC: wm_adsp: Silent parsing error on loading speaker
 protection fw
Date: Tue, 23 Aug 2022 16:33:47 +0300
Message-Id: <20220823133347.919706-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 kernel@collabora.com, linux-kernel@vger.kernel.org
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

The tracing capabilities for the speaker protection fw enabled via
commit c55b3e46cb99 ("ASoC: wm_adsp: Add trace caps to speaker
protection FW") are not be available on all platforms, such as the
Valve's Steam Deck which is based on the Halo Core DSP.

As a consequence, whenever the firmware is loaded, a rather misleading
'Failed to parse legacy: -19' error message is written to the kernel
ring buffer:

[  288.977412] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: Firmware version: 3
[  288.978002] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: cs35l41-dsp1-spk-prot.wmfw: Fri 02 Apr 2021 21:03:50 W. Europe Daylight Time
[  289.094065] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: Firmware: 400a4 vendor: 0x2 v0.33.0, 2 algorithms
[  289.095073] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: 0: ID cd v29.53.0 XM@94 YM@e
[  289.095665] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: 1: ID f20b v0.0.1 XM@170 YM@0
[  289.096275] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: Protection: C:\Users\ocanavan\Desktop\cirrusTune_july2021.bin
[  291.172383] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: Failed to parse legacy: -19

Update wm_adsp_buffer_init() to *not* report the ENODEV error when the
firmware type is WM_ADSP_FW_SPK_PROT.

Fixes: c55b3e46cb99 ("ASoC: wm_adsp: Add trace caps to speaker protection FW")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/codecs/wm_adsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index cfaa45ede916..7514fc03b468 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -1602,7 +1602,7 @@ static int wm_adsp_buffer_init(struct wm_adsp *dsp)
 	if (list_empty(&dsp->buffer_list)) {
 		/* Fall back to legacy support */
 		ret = wm_adsp_buffer_parse_legacy(dsp);
-		if (ret)
+		if (ret && (dsp->fw != WM_ADSP_FW_SPK_PROT || ret != -ENODEV))
 			adsp_warn(dsp, "Failed to parse legacy: %d\n", ret);
 	}
 

base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
-- 
2.37.2

