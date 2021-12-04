Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D44FC468458
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 12:10:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60A14227D;
	Sat,  4 Dec 2021 12:09:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60A14227D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638616222;
	bh=bISDGWPuU5Gm7UbslMA7YWFXXU7iAgkasxPHzCLnI0s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iKKaCKibzPNbtbCW1MuwIqTnUXwjXlYvmKtaRVy7uQe7b4/yjz+8ZsHOLYtQBhnpO
	 Ib5GArKR71mjC7wojTXcaeZb+X8iJoBUz1L/PYi4oshPdhVDRxFjHsXx+zeqwDNl82
	 TUrDbVgN23UOU02ASGuRt/eOItwuJZoACHqufORI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B65D2F800D3;
	Sat,  4 Dec 2021 12:09:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C03CDF8023B; Sat,  4 Dec 2021 12:08:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E530F80085
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 12:08:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E530F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VkyAlKOD"
Received: by mail-lj1-x235.google.com with SMTP id k23so11283447lje.1
 for <alsa-devel@alsa-project.org>; Sat, 04 Dec 2021 03:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EE2Aep+jzbNqeFIyDplIxE6aoRA2LQ+0Z3/L7vZF67o=;
 b=VkyAlKODkweCl4uYOVgFOaCyEaVJQwOIfx7o1nriD6KMOg0uThbCiFgNzvZf4nMy1f
 bABo8G2x62Nwq6qGlxemlgDCvNMonPRQwBF7FVG7aNvj0osuPLFXtMorzLubywKq8Uwx
 LfPuOGstqgkdTcoQq1XicAMbs9B/E2F45T7Q3Kkzg6eAoHG2ayBqgvtiK0tvmF63n0VP
 sWZS/tX4leOdcPJPTq+p9v4XrPIjtVAitiG+2PfEVr9gM//giBIJGwGXYBxUrfJ1cF5o
 YTUtyzu43K7wZ6EDVoBhafSAuMtLxzTMF2ZOgknNyknyE/L6pvgwhz35BpkjhkxGpciE
 6A6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EE2Aep+jzbNqeFIyDplIxE6aoRA2LQ+0Z3/L7vZF67o=;
 b=T8K0SQa861883sXWw9LIqpaxEgIHhjZ9/LhBw+aJ4sHtojJTiVK1oFPFQCNQo2v0Zd
 99KnSwpCPXapNo0Ve5gIbphX59yXVdAmgY8oFs8p6ScdDuhoWX5EED3BJjbt4nBBxBIl
 kLnY2ZOtrXx3AYWOyPZmxAe7hzpBgCubPI6tLgTjncA3b/H1YPgSvuRZ8jE/q+nCHHWs
 pPj/YtJ1rSfQUvbRRuMbRQEZ6fRnZhPVl7enPN47UusOXYJ3pFrwASLr2cQbizJH3feJ
 zxm4DOnR7M9WLHmQ9jfgqFp+Y8iJpGhrp+ilnbtpbr/gHbHc6C1B3HHinIg01oVILmEr
 YAyg==
X-Gm-Message-State: AOAM533InxiddlF097TaDoGjJ7/o/KZOUOSoJiYYYTeIu558nZtpdsGE
 sr7My+rKbsKOLY6jo6XmGPc=
X-Google-Smtp-Source: ABdhPJyhhMJAekexkhVaSN1HqWhcFK5cczGTw1oAaXDgTGPyddkMDM9bs2c1jJFfrysr1i4qkNI7Tw==
X-Received: by 2002:a2e:b5d2:: with SMTP id g18mr23741985ljn.354.1638616134335; 
 Sat, 04 Dec 2021 03:08:54 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-129.NA.cust.bahnhof.se.
 [155.4.221.129])
 by smtp.gmail.com with ESMTPSA id h8sm724538lfe.94.2021.12.04.03.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 03:08:53 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: amd: acp6x-pdm-dma: Constify static snd_soc_dai_ops
Date: Sat,  4 Dec 2021 12:08:48 +0100
Message-Id: <20211204110848.21322-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Rikard Falkeborn <rikard.falkeborn@gmail.com>
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

The only usage of acp6x_pdm_dai_ops is to assign its address to the ops
field in the snd_soc_dai_driver struct, which is a pointer to const
snd_soc_dai_ops. Make it const to allow the compiler to put it in
read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 sound/soc/amd/yc/acp6x-pdm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/yc/acp6x-pdm-dma.c b/sound/soc/amd/yc/acp6x-pdm-dma.c
index e604f4ea524f..7e66393e4153 100644
--- a/sound/soc/amd/yc/acp6x-pdm-dma.c
+++ b/sound/soc/amd/yc/acp6x-pdm-dma.c
@@ -318,7 +318,7 @@ static int acp6x_pdm_dai_trigger(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static struct snd_soc_dai_ops acp6x_pdm_dai_ops = {
+static const struct snd_soc_dai_ops acp6x_pdm_dai_ops = {
 	.trigger   = acp6x_pdm_dai_trigger,
 };
 
-- 
2.34.1

