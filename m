Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E39756B0B4
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 04:48:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2F611622;
	Fri,  8 Jul 2022 04:47:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2F611622
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657248499;
	bh=4B8WWLLFtgXTriYpJtJ6JxSnnZn835C0nEsgrJK9Ry0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fVcffSljVcip84S5T7wruBHWyiAzlZ5Ktv9F8ojGH160XJKFFBw2Fq+w0JZceikc0
	 c507Dmba06gf7PSPvaMMhF67G+AmQMsdyRdlLvVDApyaUPsHldUMo+UV+jKMPQCsw9
	 Oe0m+N/XQraz88NCzfvD7H4I5Xz9L/2fxCxdd9gs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BF0DF80167;
	Fri,  8 Jul 2022 04:47:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5359AF80167; Fri,  8 Jul 2022 04:47:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 by alsa1.perex.cz (Postfix) with ESMTP id C58DFF800C5
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 04:47:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C58DFF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.b="Z6IgAEVG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=1nzot
 kOABl7OCJlNnnM2mS9ytvB/1yubrP9ZFwrsivc=; b=Z6IgAEVGPLj7J97ZlgIO9
 O/S8/ta7p1gaNebKIYKo8zdYOsuVrxf/kyVLHnNIUN/3zcols739BRu7cUWBnnN3
 MiRKs3wrv7JN6ufqfzEGKZHASbWudTS+F6HLrEmqf06HlPQkPemIvJHlSahWc/5q
 qWBbowSiBEOsrcRm1+/1po=
Received: from bf-rmsz-11.ccdomain.com (unknown [218.17.89.92])
 by smtp9 (Coremail) with SMTP id DcCowAAHCKihmsdiYmyhNw--.45193S2;
 Fri, 08 Jul 2022 10:46:58 +0800 (CST)
From: Zhongjun Tan <hbut_tan@163.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.c, tiwai@suse.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 jiaxin.yu@mediatek.com, tanzhongjun@coolpad.com, colin.king@intel.com
Subject: [PATCH] ASoC: mediatek: mt8186: Remove condition with no effect
Date: Fri,  8 Jul 2022 10:46:51 +0800
Message-Id: <20220708024651.42999-1-hbut_tan@163.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowAAHCKihmsdiYmyhNw--.45193S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruFWxur4xXr1kGrW3Xr15XFb_yoWfKFc_G3
 s7Gw17ua45GFW8C39rtr4kCr1DXFWrCa4v9F13twnIq34DWF4ru3sIv3s7ur4DZw4kZayf
 Jw1Svr1fXrWqvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnqjg3UUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: xkex3sxwdqqiywtou0bp/xtbBXgM4xlaD+mHdqgAAsa
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

From: Zhongjun Tan <tanzhongjun@coolpad.com>

Remove condition with no effect

Signed-off-by: Zhongjun Tan <tanzhongjun@coolpad.com>
---
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
index db71b032770d..6be6d4f3b585 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
@@ -295,8 +295,6 @@ static int mtk_adda_pad_top_event(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_PRE_PMU:
 		if (afe_priv->mtkaif_protocol == MTKAIF_PROTOCOL_2_CLK_P2)
 			regmap_write(afe->regmap, AFE_AUD_PAD_TOP, 0x39);
-		else if (afe_priv->mtkaif_protocol == MTKAIF_PROTOCOL_2)
-			regmap_write(afe->regmap, AFE_AUD_PAD_TOP, 0x31);
 		else
 			regmap_write(afe->regmap, AFE_AUD_PAD_TOP, 0x31);
 		break;
-- 
2.29.0

