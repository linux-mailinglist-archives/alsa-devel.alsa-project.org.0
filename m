Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6438F24A
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:34:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1B931693;
	Thu, 15 Aug 2019 19:33:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1B931693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565890439;
	bh=onkO7BlgdIRts8rLRpYPm5NRH/G1ro0M+qU/OMDV0LA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=R85RI4BcjwMx7LBHari6Nvni+OMIJdhcw/1QEC1/yvtKTtfqiDW4JqFo9KRN55wKe
	 cEkxfGLYgmILpZU6mKaPjKn3pa0uFnNRKCm/SHWjPN8gSvoNntN8c82bWT6ciygEwW
	 sXpF1VxY5iy8G9ax/kvh+52ADBUhtBCorshCmEX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E72B5F8087A;
	Thu, 15 Aug 2019 19:16:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCE3FF8060D; Thu, 15 Aug 2019 19:15:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f99.google.com (mail-wr1-f99.google.com
 [209.85.221.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2938BF805FF
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:14:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2938BF805FF
Received: by mail-wr1-f99.google.com with SMTP id s18so2101488wrn.1
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=KWUuHNaeuLnP3/JiAYH55pf1los9RRnsI3012c89ha8=;
 b=QUQQteWh8mkT2TTd7Wp1btLG/8lxRbek/lCm1DvqorxkiaqUKW6NMEtJj/9rUoD5XP
 Ffv26GRR/J3JcASlXA3j12lnsG4FEEpBa+0YgCIYmFNKibliJXgEiNZKgEi26MKew8RX
 w04hfuivUMnCucSpc5A29KpO70mz/50kA7L7ZQGAtSzgIYGJZ4rm+nWTt6AL9XLtkN1L
 7hBJNmarGbtl95tBbkR5V3dfmo9fBWJmBQaYI5pQoE2yzIIi+hUWpbbp/Y1jedIonq/m
 YcqSIhMbruWHjTNAr7kCFwcy/Mj8C14D+9D4hskWZiIj4Rc3o2g/1zfgMLfwNUnDlsfG
 u7dg==
X-Gm-Message-State: APjAAAVDsOG8flaAGtzBxfKCzxnwrVUYpIvPUkohNjpFmMX/Dz29+T+B
 Ep9t6UmY3Y+Ce3lEq2jOItjeW/8l3ZbApwFQL/H7OhN9umdDT3CSQPVBrlDTmm52IQ==
X-Google-Smtp-Source: APXvYqwWDvl7fMqBHpJtlbdFiqytWl7O/XHWKPee2tCAd0zJbkiaCCfr3WgkbS1PijRiJdEJ1PqDf7oVgqUx
X-Received: by 2002:adf:aa8d:: with SMTP id h13mr6910152wrc.307.1565889267900; 
 Thu, 15 Aug 2019 10:14:27 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id e16sm10188wma.1.2019.08.15.10.14.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:14:27 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJKV-00052P-Ij; Thu, 15 Aug 2019 17:14:27 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 19EF52742BD6; Thu, 15 Aug 2019 18:14:27 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190815092300.68712-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190815171427.19EF52742BD6@ypsilon.sirena.org.uk>
Date: Thu, 15 Aug 2019 18:14:27 +0100 (BST)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>, info@metux.net
Subject: [alsa-devel] Applied "ASoC: es8328: Fix copy-paste error in
	es8328_right_line_controls" to the asoc tree
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

   ASoC: es8328: Fix copy-paste error in es8328_right_line_controls

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 630742c296341a8cfe00dfd941392025ba8dd4e8 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 15 Aug 2019 17:23:00 +0800
Subject: [PATCH] ASoC: es8328: Fix copy-paste error in
 es8328_right_line_controls

It seems 'es8328_rline_enum' should be used
in es8328_right_line_controls

Fixes: 567e4f98922c ("ASoC: add es8328 codec driver")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190815092300.68712-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/es8328.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index 822a25a8f53c..69b81e704127 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -228,7 +228,7 @@ static const struct soc_enum es8328_rline_enum =
 			      ARRAY_SIZE(es8328_line_texts),
 			      es8328_line_texts);
 static const struct snd_kcontrol_new es8328_right_line_controls =
-	SOC_DAPM_ENUM("Route", es8328_lline_enum);
+	SOC_DAPM_ENUM("Route", es8328_rline_enum);
 
 /* Left Mixer */
 static const struct snd_kcontrol_new es8328_left_mixer_controls[] = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
