Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B967B3EE1
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 09:54:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50BFE1E9;
	Sat, 30 Sep 2023 09:53:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50BFE1E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696060460;
	bh=3xA/j4TyjfUZiMSZeaBGG89zukPzSUMMECtxhlS3TPk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=u2YQw8BVnGTtc/zH83EfHEIgEsMXJ445lcfceuWYlaDXLW1GzuIV5lMz8FDwJoY3d
	 FFQZMdOfCxlmD9b4DGeuls2Hi4wP7Rt6ShhuOZXFKoGow3gdJ67OYLqVBODLeNx/xr
	 rqhZr4XOwE7F/T/ME1QqnDbJHxJ4yVwoWyVUauz8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13E6FF8057E; Sat, 30 Sep 2023 09:52:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DB80F80571;
	Sat, 30 Sep 2023 09:52:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76BA1F801F5; Sat, 23 Sep 2023 11:10:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
	by alsa1.perex.cz (Postfix) with ESMTP id 91A22F800AA
	for <alsa-devel@alsa-project.org>; Sat, 23 Sep 2023 11:10:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91A22F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=hRcmq5wq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=WVhvNnkbbz8M0re/Wi
	YwjHnFm1UGmVpvLG1PcR3SdAI=; b=hRcmq5wqODiNxRS/FVTKSh9QJ6pth6/ODk
	vXEIyEtxoxeL4JpgyyT++jAweM2ENHe69kjpqLZlsl6LlhqhbYOXxXnsrWxG/Rsp
	xLvk6vAeStzOyGS7Ct7xC8s+/uuMXDRr4wsp6A45HKmtsJvKKKbr32R5Q+9+FSJO
	AphmWeiMI=
Received: from localhost.localdomain (unknown [223.104.131.178])
	by zwqz-smtp-mta-g2-2 (Coremail) with SMTP id
 _____wCnYT95qw5lHeluCw--.48095S2;
	Sat, 23 Sep 2023 17:10:19 +0800 (CST)
From: liuhaoran <liuhaoran14@163.com>
To: perex@perex.cz
Cc: tiwai@suse.com,
	alsa-devel@alsa-project.org,
	liuhaoran <liuhaoran14@163.com>
Subject: [PATCH] ASoC: loongson: Add error handling in loongson_pcm_open
Date: Sat, 23 Sep 2023 17:10:04 +0800
Message-Id: <20230923091004.26211-1-liuhaoran14@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wCnYT95qw5lHeluCw--.48095S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr1UGrW3AFyrKF18Jw17GFg_yoW8JF4xpr
	Z3C3yDWrW5J3WF9F98JFWfJr1fA3yS9FWfXrWay340krZrCw1YgryUJF1j9FWxCrW5GF1U
	ZrWxWFZxCF13AFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UV6wtUUUUU=
X-Originating-IP: [223.104.131.178]
X-CM-SenderInfo: xolxxtxrud0iqu6rljoofrz/1tbibBzzgmNfuLBqJgAAs5
X-MailFrom: liuhaoran14@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4525PG2GQQ4QBQHYTXACCIM6X75CRWIY
X-Message-ID-Hash: 4525PG2GQQ4QBQHYTXACCIM6X75CRWIY
X-Mailman-Approved-At: Sat, 30 Sep 2023 07:52:41 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4525PG2GQQ4QBQHYTXACCIM6X75CRWIY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch adds error-handling for the snd_pcm_hw_constraint_step() and
snd_pcm_hw_constrain_integer() inside the img_prl_out_hw_params function
in the loongson_dma.c file.

Signed-off-by: liuhaoran <liuhaoran14@163.com>
---
 sound/soc/loongson/loongson_dma.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/loongson/loongson_dma.c b/sound/soc/loongson/loongson_dma.c
index 47d6551903fc..af9e6a881a2a 100644
--- a/sound/soc/loongson/loongson_dma.c
+++ b/sound/soc/loongson/loongson_dma.c
@@ -240,17 +240,17 @@ static int loongson_pcm_open(struct snd_soc_component *component,
 
 	ret = snd_pcm_hw_constraint_step(runtime, 0,
 				   SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 128);
-	if (ret<0)
+	if (ret < 0)
 		return ret;
 
-	error = snd_pcm_hw_constraint_step(runtime, 0,
+	ret = snd_pcm_hw_constraint_step(runtime, 0,
 				   SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 128);
-	if (ret<0)
+	if (ret < 0)
 		return ret;
 	
-	error = snd_pcm_hw_constraint_integer(substream->runtime,
+	ret = snd_pcm_hw_constraint_integer(substream->runtime,
 				      SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret<0)
+	if (ret < 0)
 		return ret;
 
 	snd_soc_set_runtime_hwparams(substream, &ls_pcm_hardware);
-- 
2.17.1

