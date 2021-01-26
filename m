Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA643042E6
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jan 2021 16:48:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DEA017AF;
	Tue, 26 Jan 2021 16:47:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DEA017AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611676091;
	bh=cZ6lE03cOsyJBdIrDnb1rGneV40LjUZJshKMqsaPoYQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BAYrF/PtIVwDmAFgZzsJu91RB46RywK1aRjJQuSVDNbRFUKwRl3m3MmBNuFe1mvVf
	 uA4TGzNTrfAyUsCWBZzzrkXgt9qmEsfIUUuWT+ZQRrsnuNry4fppp9236hkNSaYpoq
	 qEYtZ8LctxbYpPjQe74aWPPryUa0grsR96CNuNj0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C18DCF80108;
	Tue, 26 Jan 2021 16:47:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 644C5F801ED; Tue, 26 Jan 2021 16:47:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 423FEF80108
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 16:47:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 423FEF80108
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 36D0FAE64;
 Tue, 26 Jan 2021 15:47:06 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: siu: Fix build error by a wrong const prefix
Date: Tue, 26 Jan 2021 16:47:02 +0100
Message-Id: <20210126154702.3974-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

A const prefix was put wrongly in the middle at the code refactoring
commit 932eaf7c7904 ("ASoC: sh: siu_pcm: remove snd_pcm_ops"), which
leads to a build error as:
  sound/soc/sh/siu_pcm.c:546:8: error: expected '{' before 'const'

Also, another inconsistency is that the declaration of siu_component
misses the const prefix.

This patch corrects both failures.

Fixes: 932eaf7c7904 ("ASoC: sh: siu_pcm: remove snd_pcm_ops")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

Casually caught by a random build test after your latest PR.

 sound/soc/sh/siu.h     | 2 +-
 sound/soc/sh/siu_pcm.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sh/siu.h b/sound/soc/sh/siu.h
index 6201840f1bc0..a675c36fc9d9 100644
--- a/sound/soc/sh/siu.h
+++ b/sound/soc/sh/siu.h
@@ -169,7 +169,7 @@ static inline u32 siu_read32(u32 __iomem *addr)
 #define SIU_BRGBSEL	(0x108 / sizeof(u32))
 #define SIU_BRRB	(0x10c / sizeof(u32))
 
-extern struct snd_soc_component_driver siu_component;
+extern const struct snd_soc_component_driver siu_component;
 extern struct siu_info *siu_i2s_data;
 
 int siu_init_port(int port, struct siu_port **port_info, struct snd_card *card);
diff --git a/sound/soc/sh/siu_pcm.c b/sound/soc/sh/siu_pcm.c
index 45c4320976ab..4785886df4f0 100644
--- a/sound/soc/sh/siu_pcm.c
+++ b/sound/soc/sh/siu_pcm.c
@@ -543,7 +543,7 @@ static void siu_pcm_free(struct snd_soc_component *component,
 	dev_dbg(pcm->card->dev, "%s\n", __func__);
 }
 
-struct const snd_soc_component_driver siu_component = {
+const struct snd_soc_component_driver siu_component = {
 	.name		= DRV_NAME,
 	.open		= siu_pcm_open,
 	.close		= siu_pcm_close,
-- 
2.26.2

