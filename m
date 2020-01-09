Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB86138E51
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jan 2020 10:56:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 189E41607;
	Mon, 13 Jan 2020 10:55:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 189E41607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578909395;
	bh=WJ4cqJkyZTB0XrIWHcLmWOMBO0VADIfKzNWaETI7nRo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mLPgQj5MA2wENbkaK6B+1QbmCmnGIDsT4Ovm/fvq8QbMkv12Os0vE3enGssiELp13
	 oSKaLf+6URDzlTDdpOQEn3J6SpG8HkWa9RKcOnBV7/ncpZ6khtvOS2JtSePiBD6j+S
	 prxE4jrWxHX7TSbwaDGn0Js5BNfDX2FMv7/7zKLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B19DBF801F8;
	Mon, 13 Jan 2020 10:54:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39864F8015B; Thu,  9 Jan 2020 20:14:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33CCEF800E4
 for <alsa-devel@alsa-project.org>; Thu,  9 Jan 2020 20:14:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33CCEF800E4
Received: by mail-pj1-f68.google.com with SMTP id r67so1537489pjb.0
 for <alsa-devel@alsa-project.org>; Thu, 09 Jan 2020 11:14:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s3LJptmK9f7+9WJnS7yopofDmxgol9ron4gYXPeKTGM=;
 b=OnTc+Lv9qXdhKCurzcWJajuyiNhiRDqXSor8wI7B+aijMABUaNwok4Bmg2LB2sgrBN
 y6Hnk9qb7Kg9fOq1FIpShF4uP+tpYPlIAGaUDJdHw6vsQvBvqY56OEkrupqWxb+UaX1N
 eszLA0QgHc6oW+ZRCpzsPntgGdS/6yT5Hk1OJOrcR2lOSxKOWqyE6zedU08um3+5T3mX
 6F+/tU3Mrmon5fEYduM+S0rryYKd1B+X8hFRiVe8oXm8i/uoz7lMk4VGkLGMTwp27EEz
 nF4Whi4SESHK7cqcXed0YKOtZ8JsEvajn/OUWw+ICAS+xLREW0oBe6iqWnES6xLmR7c0
 YRDg==
X-Gm-Message-State: APjAAAVQn18yPRyyZOU9X77r+d6/wDaB/xX0YprEIaf1bKiNQ7AArtex
 Fh8IzaUc3q4/Ww+yoGWlqwYagudt9qdMIg==
X-Google-Smtp-Source: APXvYqxYcjRb0U/scJSGha0DadOM9jLQu+g5X/UfWfmPyJgWzpay36OgvgbouiChitpx5/9aNiM74w==
X-Received: by 2002:a17:90a:660d:: with SMTP id
 l13mr7069498pjj.23.1578597280531; 
 Thu, 09 Jan 2020 11:14:40 -0800 (PST)
Received: from pburton-laptop.mipstec.com
 (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
 by smtp.gmail.com with ESMTPSA id z26sm7720263pgu.80.2020.01.09.11.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 11:14:39 -0800 (PST)
From: Paul Burton <paulburton@kernel.org>
To: alsa-devel@alsa-project.org
Date: Thu,  9 Jan 2020 11:14:22 -0800
Message-Id: <20200109191422.334516-1-paulburton@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 13 Jan 2020 10:54:48 +0100
Cc: Paul Burton <paulburton@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH] ASoC: txx9: Remove unused rtd variable
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

Commit a857e073ffc6 ("ASoC: txx9: txx9aclc: remove snd_pcm_ops") removed
the last use of the rtd variable but didn't remove its definition,
leading to the following warning/error for MIPS rbtx49xx_defconfig
builds:

sound/soc/txx9/txx9aclc.c: In function 'txx9aclc_pcm_hw_params':
sound/soc/txx9/txx9aclc.c:54:30: error: unused variable 'rtd'
    [-Werror=unused-variable]
  struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
                              ^~~

Resolve this by removing the unused variable.

Signed-off-by: Paul Burton <paulburton@kernel.org>
Fixes: a857e073ffc6 ("ASoC: txx9: txx9aclc: remove snd_pcm_ops")
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
---
 sound/soc/txx9/txx9aclc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/txx9/txx9aclc.c b/sound/soc/txx9/txx9aclc.c
index 33c78d33e5a1..9a55926ebf07 100644
--- a/sound/soc/txx9/txx9aclc.c
+++ b/sound/soc/txx9/txx9aclc.c
@@ -51,7 +51,6 @@ static int txx9aclc_pcm_hw_params(struct snd_soc_component *component,
 				  struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct txx9aclc_dmadata *dmadata = runtime->private_data;
 	int ret;
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
