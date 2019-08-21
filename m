Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 680959791E
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 14:20:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE3E7165F;
	Wed, 21 Aug 2019 14:19:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE3E7165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566390016;
	bh=UNmdZfz9Zz7iK6Fj0tRS2DLMq1l73tPjPRsd+I9Che8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=eHdhl8Nlq9V2Dimub9jFCngep5w0oI8QPhFM5v1pAuJbfENEWKBsECBUYnWo5B9Po
	 wg6pNPUaOIx2NVk+ZankxCPbK2gYlKxegsnZh0tPxC0fMOR6C3yQ8abE7rEgYHKSVi
	 nAZOkUiHZppGRHYMSvlZZajwz/4JlRIatMl7+d5Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88D44F8060F;
	Wed, 21 Aug 2019 14:15:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D09AF8036A; Wed, 21 Aug 2019 14:15:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f99.google.com (mail-wr1-f99.google.com
 [209.85.221.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93125F8036A
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 14:15:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93125F8036A
Received: by mail-wr1-f99.google.com with SMTP id p17so1796576wrf.11
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 05:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=Snh+NfqlRXL88nkBpdOVZUEKDu0xFWclHT2b5DEkq4Y=;
 b=osTFM03k7ssT7iXA2zQ/lBc42gJ+BugO/n8J8LGw2ikkXmnF6r/Iywda380D4iBiN5
 6tmougr6jq8nRE0k5yryi4ynoBY6pvUjYZFuLgU9gFYgMFu+JXpoK56kqVMT3KknFTf0
 LXqrM6NSQnC7u5jIpWVZjvhV9sjG1Cc/eAeb4s60hBFZz8vW9P2GaFzJYlsHig9aXlze
 C4n6szajORjktr2zVQWf+Yg1pFtv+OLI0wSpEX7CDjcfjMEWH3LXazUdwd9/DMjeaNt8
 wT0MfRD0mRr0AovRfhncwR/jgWiQCakgfLquYt3CVcA8B3k15NBX3Sz4SMCfu6ED+Qpg
 ncbQ==
X-Gm-Message-State: APjAAAXJcxdLwip5ySdBYuzEnzRX9oVu90E/6UCovu16qgHc5+WqbeIT
 kTR+RBJ4kgzzyRJrxYjViNJlbGlToXKJwUfcJdrGPCXCK8gC1Bt8Iv9Cn74PxwT6rA==
X-Google-Smtp-Source: APXvYqwGnLc7NKwkPiSbVfpZ978KwNZIeoVmaMf/v+r2YtEwI6fdOKWu38uvGNjBMBdd1VhR4zDSpHpGmaU1
X-Received: by 2002:a5d:560a:: with SMTP id l10mr40018565wrv.101.1566389733373; 
 Wed, 21 Aug 2019 05:15:33 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id h6sm270251wrx.43.2019.08.21.05.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 05:15:33 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i0PWX-000776-0m; Wed, 21 Aug 2019 12:15:33 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 7DBB027430D6; Wed, 21 Aug 2019 13:15:32 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877e781ldq.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190821121532.7DBB027430D6@ypsilon.sirena.org.uk>
Date: Wed, 21 Aug 2019 13:15:32 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Sridharan@sirena.co.uk, Ranjani <ranjani.sridharan@intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: merge
	snd_soc_initialize_card_lists()" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: soc-core: merge snd_soc_initialize_card_lists()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From b03bfaec1d52123d5d941488f71e06964535e471 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 20 Aug 2019 14:04:54 +0900
Subject: [PATCH] ASoC: soc-core: merge snd_soc_initialize_card_lists()

snd_soc_initialize_card_lists() is doing card related
INIT_LIST_HEAD(), but, it is already doing at
snd_soc_register_card(). We don't need to do it separately.
This patch merges these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/877e781ldq.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h  | 10 ----------
 sound/soc/soc-core.c | 13 ++++++++-----
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 5c841c2ee814..f264c6509f00 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1220,16 +1220,6 @@ static inline void *snd_soc_card_get_drvdata(struct snd_soc_card *card)
 	return card->drvdata;
 }
 
-static inline void snd_soc_initialize_card_lists(struct snd_soc_card *card)
-{
-	INIT_LIST_HEAD(&card->widgets);
-	INIT_LIST_HEAD(&card->paths);
-	INIT_LIST_HEAD(&card->dapm_list);
-	INIT_LIST_HEAD(&card->aux_comp_list);
-	INIT_LIST_HEAD(&card->component_dev_list);
-	INIT_LIST_HEAD(&card->list);
-}
-
 static inline bool snd_soc_volsw_is_stereo(struct soc_mixer_control *mc)
 {
 	if (mc->reg == mc->rreg && mc->shift == mc->rshift)
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b3f820fb53e6..d428491d51a7 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2370,15 +2370,18 @@ int snd_soc_register_card(struct snd_soc_card *card)
 
 	dev_set_drvdata(card->dev, card);
 
-	snd_soc_initialize_card_lists(card);
-
+	INIT_LIST_HEAD(&card->widgets);
+	INIT_LIST_HEAD(&card->paths);
+	INIT_LIST_HEAD(&card->dapm_list);
+	INIT_LIST_HEAD(&card->aux_comp_list);
+	INIT_LIST_HEAD(&card->component_dev_list);
+	INIT_LIST_HEAD(&card->list);
 	INIT_LIST_HEAD(&card->dai_link_list);
-
 	INIT_LIST_HEAD(&card->rtd_list);
-	card->num_rtd = 0;
-
 	INIT_LIST_HEAD(&card->dapm_dirty);
 	INIT_LIST_HEAD(&card->dobj_list);
+
+	card->num_rtd = 0;
 	card->instantiated = 0;
 	mutex_init(&card->mutex);
 	mutex_init(&card->dapm_mutex);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
