Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C699162313D
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 18:18:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66759167D;
	Wed,  9 Nov 2022 18:17:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66759167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668014308;
	bh=vipwvc1//PeYOkbmhgVU3syVSrf+PuvTJkmAWXVm/q0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nEMEsXkqCKMPhJTaVSgQIXuWVKL3D1xzkMSCrBknUNIxb92tcn8dWL7tx9d9H+dav
	 FBfc1w9m5KoZVymMwfAks/7wFOpbciJPkFXSrpxzeBI7Lt8+qoMkMBRgTHXRuBO6Vh
	 TaYJ0Ya25FKS15t/1a0CshqXbV7mS6iF5fdULH+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 032B4F8057A;
	Wed,  9 Nov 2022 18:15:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF8B6F803DC; Sat,  5 Nov 2022 10:39:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46632F801D5
 for <alsa-devel@alsa-project.org>; Sat,  5 Nov 2022 10:39:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46632F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eZUXAjEg"
Received: by mail-wm1-x329.google.com with SMTP id
 a11-20020a05600c2d4b00b003cf6f5fd9f1so4485146wmg.2
 for <alsa-devel@alsa-project.org>; Sat, 05 Nov 2022 02:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g7pK56t2R6Ps3nWxcCA0h4Y93S07BBRs7F+fa1Fp9yo=;
 b=eZUXAjEgKFh1gKa76NKDihcp9jKqj+CroyCLGuKPjIH9/yonf3Ah69KSQJPXeY4oJF
 3NWqsjWItl5VSyLGnqJ87QregktPBqtfzFOTDgn/jWDTdpSP8nmYydVVCG7UkAiT4GOc
 oV+inyNe/Pz9tz5Ddsz3aHcxZEM+DPp8nuAFWco0MFdLT5pM9SWNiwHEOeWs598GZrBw
 NFAUXwoegA7jsBvTUinXSGxjHtA1EZvr8x7HVZnzGUI09X1YjTAtLKbeBfLxvh98WD1T
 /b1ukzw076V0J26RGr/kye4Uyr11f84PEpUlxh/WWNlgkVUolx9J3X0aHP4HyCO6Ks34
 LdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g7pK56t2R6Ps3nWxcCA0h4Y93S07BBRs7F+fa1Fp9yo=;
 b=r7kmcDUhYJwdPJj3f8h9JBtfuJFkXK3+jL+BDTnQ90zdUHwEzRL5Lt4E/3O6NIflIl
 m2z82eRiNPAT9hVyP/4s/ZeYLFFAN0dym+3OBckKgWYhh9gCjx96m41R7W0GRH97POt2
 S7Nx1NF7HAeJwEqtx2EUfyZCOi6IMPqbcpI1Lp+KgNcgmie0LMeaEY9Bl3DrBCvK8zOB
 V9DykATp3LHsVwazH7+uLvevlrRdmXLvD89E/DPl3vAwZUKyrD4gfLMhVZNUNP67nm8V
 iOXDNXd1myB3AGLFTvp9mnjaRamzySlg9qN/DLDN2PCOsm8CLQmXHsLE9SVlcJhhu4zj
 LJRw==
X-Gm-Message-State: ACrzQf2tNkcC/pAMYCBQPzVxEIHvUxsnFfemnQAX4cd7SURNuKgMxmos
 ZUjLzy37l4AIaYchihj/L1M=
X-Google-Smtp-Source: AMsMyM5PvPcwHf6V3i5PsjristDEGZsePtXLhYQmhw8olTLE3aZB+mn4rbBIJZcB50eBAaseYY23OQ==
X-Received: by 2002:a1c:27c6:0:b0:3c2:e6df:c79b with SMTP id
 n189-20020a1c27c6000000b003c2e6dfc79bmr35729022wmn.14.1667641177909; 
 Sat, 05 Nov 2022 02:39:37 -0700 (PDT)
Received: from localhost.localdomain ([213.177.192.129])
 by smtp.googlemail.com with ESMTPSA id
 z11-20020a05600c0a0b00b003b4868eb71bsm6073622wmp.25.2022.11.05.02.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 02:39:37 -0700 (PDT)
From: Juan Alfonso Reyes Ajenjo <juanalfonso.reyes@gmail.com>
To: 
Subject: [PATCH] Fix tas2562 volume table values
Date: Sat,  5 Nov 2022 10:39:16 +0100
Message-Id: <20221105093918.12274-1-juanalfonso.reyes@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 09 Nov 2022 18:15:50 +0100
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Fabio Estevam <festevam@denx.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, juanalfonso.reyes@gmail.com,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Mark Brown <broonie@kernel.org>, Gustavo Plaza Roma <gplazar03@gmail.com>,
 Stephen Kitt <steve@sk2.org>
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

This patch fixes -90dB value (0x84a3 instead of 0x695b)
This patch adds missing -20dB value (0x06666666)
float_vol_db_lookup must have 56 values as volume is from 0 to 55 (0-110dB)

Co-developed-by: Gustavo Plaza Roma <gplazar03@gmail.com>
Signed-off-by: Gustavo Plaza Roma <gplazar03@gmail.com>
Signed-off-by: Juan Alfonso Reyes Ajenjo <juanalfonso.reyes@gmail.com>
---
 sound/soc/codecs/tas2562.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index b486d0b..acbdf77 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -33,15 +33,16 @@
 static const unsigned int float_vol_db_lookup[] = {
 0x00000d43, 0x000010b2, 0x00001505, 0x00001a67, 0x00002151,
 0x000029f1, 0x000034cd, 0x00004279, 0x000053af, 0x0000695b,
-0x0000695b, 0x0000a6fa, 0x0000d236, 0x000108a4, 0x00014d2a,
+0x000084a3, 0x0000a6fa, 0x0000d236, 0x000108a4, 0x00014d2a,
 0x0001a36e, 0x00021008, 0x000298c0, 0x000344df, 0x00041d8f,
 0x00052e5a, 0x000685c8, 0x00083621, 0x000a566d, 0x000d03a7,
 0x0010624d, 0x0014a050, 0x0019f786, 0x0020b0bc, 0x0029279d,
 0x0033cf8d, 0x004139d3, 0x00521d50, 0x00676044, 0x0082248a,
 0x00a3d70a, 0x00ce4328, 0x0103ab3d, 0x0146e75d, 0x019b8c27,
 0x02061b89, 0x028c423f, 0x03352529, 0x0409c2b0, 0x05156d68,
-0x080e9f96, 0x0a24b062, 0x0cc509ab, 0x10137987, 0x143d1362,
-0x197a967f, 0x2013739e, 0x28619ae9, 0x32d64617, 0x40000000
+0x06666666, 0x080e9f96, 0x0a24b062, 0x0cc509ab, 0x10137987,
+0x143d1362, 0x197a967f, 0x2013739e, 0x28619ae9, 0x32d64617,
+0x40000000
 };
 
 struct tas2562_data {
-- 
2.7.4

