Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2FF7B1674
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 10:53:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07F6ADEE;
	Thu, 28 Sep 2023 10:52:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07F6ADEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695891201;
	bh=96+LUfsHOT0jB+5qhKkava+jQEUMn2NXjX+aKAsuCAE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=A6gu8EHXDUHRRHdyo+C/yDvfUsgn1ZVuvWflyX5nJXTGUz5xaBiajW2z0o3EXHZed
	 uw2YpsqcyjuyGPtz+hPLyvee4ordu3NFEoDNsWFJIX52q9RxwLlrOoCh4p2dsztnbM
	 ziUuQF4VqNiD0y0joZ3MjAA/QiqN1kGvEkvOQvTY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A5CFF80552; Thu, 28 Sep 2023 10:52:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DD57F8016A;
	Thu, 28 Sep 2023 10:52:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAC1DF801D5; Thu, 28 Sep 2023 10:52:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=5.0 tests=ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out30-110.freemail.mail.aliyun.com
 (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24D53F8007C
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 10:52:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24D53F8007C
X-Alimail-AntiSpam: 
 AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0Vt19StJ_1695891122;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0Vt19StJ_1695891122)
          by smtp.aliyun-inc.com;
          Thu, 28 Sep 2023 16:52:15 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: james.schulman@cirrus.com
Cc: david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] ASoC: cs42l43: Remove useless else
Date: Thu, 28 Sep 2023 16:52:00 +0800
Message-Id: <20230928085200.48635-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6HHMKKT2JQFGSMVUZRYTHIRWX6DVV4PF
X-Message-ID-Hash: 6HHMKKT2JQFGSMVUZRYTHIRWX6DVV4PF
X-MailFrom: jiapeng.chong@linux.alibaba.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6HHMKKT2JQFGSMVUZRYTHIRWX6DVV4PF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The assignment of the else and if branches is the same, so the else
here is redundant, so we remove it.

./sound/soc/codecs/cs42l43-sdw.c:35:1-3: WARNING: possible condition with no effect (if == else).

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=6712
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 sound/soc/codecs/cs42l43-sdw.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs42l43-sdw.c b/sound/soc/codecs/cs42l43-sdw.c
index 55ac5fe8c3db..388f95853b69 100644
--- a/sound/soc/codecs/cs42l43-sdw.c
+++ b/sound/soc/codecs/cs42l43-sdw.c
@@ -31,11 +31,7 @@ int cs42l43_sdw_add_peripheral(struct snd_pcm_substream *substream,
 		return -EINVAL;
 
 	snd_sdw_params_to_config(substream, params, &sconfig, &pconfig);
-
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		pconfig.num = dai->id;
-	else
-		pconfig.num = dai->id;
+	pconfig.num = dai->id;
 
 	ret = sdw_stream_add_slave(sdw, &sconfig, &pconfig, 1, sdw_stream);
 	if (ret) {
-- 
2.20.1.7.g153144c

