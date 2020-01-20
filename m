Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5A1142328
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2020 07:19:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B9111670;
	Mon, 20 Jan 2020 07:19:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B9111670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579501194;
	bh=YAvOEiydysJbhkNPe5zkJ/pqFg8Y66TlldzFJGZj5JM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WnWYng6zB3LLBt2cg0aSW4z/EMLP4Ky9etg+M+zyZj8GuLzvJtnW+9iSRuO9F0ZU6
	 JNHCqSeqHch1wQJ5lXLvTzh3AhnkJioxko+45GSKL7g3MTKPyWATaQ9L7oDDUnd84z
	 Y+KOFbAp8NkTua+QTjEM1eADUP+CLaXtgXdxv73Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAFF9F800C6;
	Mon, 20 Jan 2020 07:18:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2788F8020C; Mon, 20 Jan 2020 07:18:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6235F8012F
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 07:17:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6235F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="DPEN5idy"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e2545e80000>; Sun, 19 Jan 2020 22:17:12 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sun, 19 Jan 2020 22:17:54 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sun, 19 Jan 2020 22:17:54 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 Jan
 2020 06:17:53 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 20 Jan 2020 06:17:53 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e25460f0000>; Sun, 19 Jan 2020 22:17:52 -0800
From: Sameer Pujar <spujar@nvidia.com>
To: <oder_chiou@realtek.com>, <bardliao@realtek.com>, <tiwai@suse.com>,
 <perex@perex.cz>
Date: Mon, 20 Jan 2020 11:47:39 +0530
Message-ID: <1579501059-27936-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1579501032; bh=y0KuUHnikrqaYl+AkuZgAWArMBLX50J5YFwz5WfJk08=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:Content-Type;
 b=DPEN5idyJgzm2UDuPOm/OFoQREwFgQerUJtKuDcWM5En/svuJEE3lPbniYiVh6lTU
 zOIPi3LEjcDeT42jhY+iQ724jJX/K24V2wezlqrSlN0tknEyYvoF27jOfiEgLNsuM+
 xeRQBem8lqAp+SdfJCwBRGYomAwl1M1BlQ2CB4hLgmb76UF+1kFHepZcqYESjywQhB
 eptOA3axpayafuiDhb+G4gORb+qWi73maMWfP93qjEc1NlARp7isRsf0RdEE6YLyw7
 qbu/z8z0f0SLibcBZVFJ08KHzDaRI7derNbbVkUN7gm/QBsxxf2KlwqzoOw44r/Etd
 gd1d5iAnsJoog==
Cc: Sameer Pujar <spujar@nvidia.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: rt5659: add S32_LE format
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

ALC5659 supports maximum data length of 24-bit. Currently driver supports
S24_LE which is a 32-bit container with valid data in [23:0] and 0s in MSB.
S24_3LE is not commonly used and is hard to find audio streams with this
format. Also many SoC HW do not support S24_LE and S32_LE is used in
general. The 24-bit data can be represented in S32_LE [31:8] and 0s are
padded in LSB.

This patch adds S32_LE to ALC5659 driver and data length for this is set
to 24 as per codec's maximum data length support. This helps to play
24-bit audio, packed in S32_LE, on HW which do not support S24_LE.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/codecs/rt5659.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index fc74dd63..f910ddf 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -3339,6 +3339,7 @@ static int rt5659_hw_params(struct snd_pcm_substream *substream,
 		val_len |= RT5659_I2S_DL_20;
 		break;
 	case 24:
+	case 32:
 		val_len |= RT5659_I2S_DL_24;
 		break;
 	case 8:
@@ -3733,7 +3734,8 @@ static int rt5659_resume(struct snd_soc_component *component)
 
 #define RT5659_STEREO_RATES SNDRV_PCM_RATE_8000_192000
 #define RT5659_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
-		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
+		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE | \
+		SNDRV_PCM_FMTBIT_S8)
 
 static const struct snd_soc_dai_ops rt5659_aif_dai_ops = {
 	.hw_params = rt5659_hw_params,
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
