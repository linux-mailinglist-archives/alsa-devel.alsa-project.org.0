Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E87778CF5A
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Aug 2023 00:03:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9BE6DEC;
	Wed, 30 Aug 2023 00:02:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9BE6DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693346600;
	bh=xI66UpNVTpcShnwJRClXF7/oI1rnpdo0EK+ou864+xU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iGu2cPPW7cd+jfDeYQdTtjQi+ey6KiK/8/EwLNttBvUHnKeT8lDUdRJiArcciah2N
	 fTdoSfe8LztHVvF5kYfBP8vrwupDmVpsx2315EQrfiL9x1wx8qMgPO15Mo3C+CV/2L
	 Mb1SboTtNOvnsGO6Geszhyv/wy4bzMAzPuCW8PYU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFE83F80537; Wed, 30 Aug 2023 00:01:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69DD3F80537;
	Wed, 30 Aug 2023 00:01:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57DA7F80249; Wed, 30 Aug 2023 00:01:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.mutex.one (mail.mutex.one [62.77.152.124])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74024F80094
	for <alsa-devel@alsa-project.org>; Wed, 30 Aug 2023 00:01:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74024F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mutex.one header.i=@mutex.one header.a=rsa-sha256
 header.s=default header.b=ItLp8ZUv
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mutex.one (Postfix) with ESMTP id B61B016C004F;
	Wed, 30 Aug 2023 01:01:24 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
	by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jvhPjC8fXho6; Wed, 30 Aug 2023 01:01:23 +0300 (EEST)
From: Marian Postevca <posteuca@mutex.one>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
	t=1693346483; bh=xI66UpNVTpcShnwJRClXF7/oI1rnpdo0EK+ou864+xU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ItLp8ZUvJ1ruMD1YHexop0ed+TEwT46nmOwE7RwRIpdpy60BF2XcWeKq1VfaXTasg
	 2sT8p5P5TDV20cVrANugSxKUC/j6NwT52cTRWUHGJcG2BkPsM7kBZVMgVjT/phfzPq
	 B7iXcnnzJiSiPLVDoQaxWHAclHYmxFFVr7jOt2do=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Marian Postevca <posteuca@mutex.one>
Subject: [PATCH v3 1/5] ASoC: es8316: Enable support for S32 LE format
Date: Wed, 30 Aug 2023 01:01:12 +0300
Message-ID: <20230829220116.1159-2-posteuca@mutex.one>
In-Reply-To: <20230829220116.1159-1-posteuca@mutex.one>
References: <20230829220116.1159-1-posteuca@mutex.one>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Y2MO6FTOX6ABCBN6XMQLANBA3M4X4CJA
X-Message-ID-Hash: Y2MO6FTOX6ABCBN6XMQLANBA3M4X4CJA
X-MailFrom: posteuca@mutex.one
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y2MO6FTOX6ABCBN6XMQLANBA3M4X4CJA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This CODEC does support the S32 LE format in es8316_pcm_hw_params(),
but doesn't have it enabled in ES8316_FORMATS. Enable it so that we
have more options to match with components.

Signed-off-by: Marian Postevca <posteuca@mutex.one>
---
 sound/soc/codecs/es8316.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index a8f347f1affb..09fc0b25f600 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -526,7 +526,7 @@ static int es8316_mute(struct snd_soc_dai *dai, int mute, int direction)
 }
 
 #define ES8316_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
-			SNDRV_PCM_FMTBIT_S24_LE)
+			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
 static const struct snd_soc_dai_ops es8316_ops = {
 	.startup = es8316_pcm_startup,
-- 
2.41.0

