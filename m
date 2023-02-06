Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEDC68B6F4
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 08:57:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5789010E;
	Mon,  6 Feb 2023 08:56:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5789010E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675670250;
	bh=rGB96wj4wOA8oUVik9aAh5DAyTkgN0Li2qVc6LZYIn0=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=XwYJHI5/kfw6KkJziz46V1KfS2j86yIWU/QuyZEuhToQoFdOP/13hxwlenC3ppcgB
	 G1rWCqgzEStXQDB08+AFxqzUWOEh8s+H+ueT1qLp3L3TpR+7wH64E16k4f4W1gexlo
	 CLHsx192vzVdpgzddYRkjU7v/1nQMSP21IG1H2NI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96532F800E3;
	Mon,  6 Feb 2023 08:56:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 215DBF804F1; Mon,  6 Feb 2023 08:56:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=5.0 tests=ENV_AND_HDR_SPF_MATCH,
 SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
 USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from out30-124.freemail.mail.aliyun.com
 (out30-124.freemail.mail.aliyun.com [115.124.30.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B96DAF800E3
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 08:56:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B96DAF800E3
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0Vb.KAgd_1675670167; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0Vb.KAgd_1675670167) by smtp.aliyun-inc.com;
 Mon, 06 Feb 2023 15:56:14 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: herve.codina@bootlin.com
Subject: [PATCH] ASoC: codecs: Fix unsigned comparison with less than zero
Date: Mon,  6 Feb 2023 15:55:18 +0800
Message-Id: <20230206075518.84169-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 tiwai@suse.com, broonie@kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The val is defined as unsigned int type, if(val<0) is redundant, so
delete it.

sound/soc/codecs/idt821034.c:449 idt821034_kctrl_gain_put() warn: unsigned 'val' is never less than zero.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3947
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 sound/soc/codecs/idt821034.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/idt821034.c b/sound/soc/codecs/idt821034.c
index 5d01787b1c1f..2cc7b9166e69 100644
--- a/sound/soc/codecs/idt821034.c
+++ b/sound/soc/codecs/idt821034.c
@@ -446,8 +446,6 @@ static int idt821034_kctrl_gain_put(struct snd_kcontrol *kcontrol,
 	u8 ch;
 
 	val = ucontrol->value.integer.value[0];
-	if (val < 0)
-		return -EINVAL;
 	if (val > max - min)
 		return -EINVAL;
 
-- 
2.20.1.7.g153144c

