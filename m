Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D763390135
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2019 14:18:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79F8D1616;
	Fri, 16 Aug 2019 14:17:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79F8D1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565957900;
	bh=gQ+GRBFSiaar1SY+T03HCh/W9QgfptOqaEZUyDVNJRA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=aNC7II2pv7R9ppasxaeDz6yuZQe5J55wPk9aLKJcEJ4aHoggWpWJvs1ZHrtLSvU0z
	 i9+goE3x7ZrXzcqlz4KIIHrWaOGSMGiz2pXe23sAJmi43I3f8wvF2rbCbwTWhGrn6S
	 8gA80vd5kt414SVnIXa3sFyTqLsXiitDny8GkE0Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 568FFF805F7;
	Fri, 16 Aug 2019 14:15:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17ADBF805A9; Fri, 16 Aug 2019 14:14:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f99.google.com (mail-wm1-f99.google.com
 [209.85.128.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CA0BF801DB
 for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2019 14:14:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CA0BF801DB
Received: by mail-wm1-f99.google.com with SMTP id g67so3902735wme.1
 for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2019 05:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=AC+uJwPNYBunSGNHRWcehh2tmws3EkiTATll7K7aql4=;
 b=DBVj6cwmtQW25uO7lOwOlIDrA1CQ0z/IEj9w4jWE3oCVu151yVnfFz2t90jOyO+aNA
 PwHPGJPigz0Y2Bxq754uQ7MStt9X19OX1CnXJT4z4BkXrHRIoXIgS/4WjbkldQa3wMTT
 fA5ZR9haN8yRGNhvFk8eoW4Sz9qRYZD4GpoIoCyTrCdFN1oPfK5hSr+6BfcWUk9AxL3x
 Vr0Kv8OswgJCUujNGrdTeUGYFZeyAO/Z846O7/NVCiGHdmCHqtXJsau0rLjhLuafN51a
 k+v0vLzT6dHhH1A/4vql9grXMsz5Uov4Oob43k3cAXRvMxAOwB0MHqr1kxn605ez79Hb
 zLiA==
X-Gm-Message-State: APjAAAWhPk5YG1++ia4uKdU9e2xYBxSChidtN9Mzhvw6RcbgrWafUNEw
 muejVtIfcZD9rARiIIvpf9C8AnOFALRMtQs1UKYUgzYxThu5LOLLCrSJkXwj91W+FQ==
X-Google-Smtp-Source: APXvYqx26DIlmVX0yO17ERbojFBHHrCUWE5mBYHTKrDNLH4FP5TQ5qHn1G37aRMCP4Jwp7m5WFyTracOu+6d
X-Received: by 2002:a1c:9d53:: with SMTP id g80mr7135736wme.103.1565957693277; 
 Fri, 16 Aug 2019 05:14:53 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id h18sm114095wrb.71.2019.08.16.05.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 05:14:53 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyb89-0003Kz-0m; Fri, 16 Aug 2019 12:14:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 540B227430D6; Fri, 16 Aug 2019 13:14:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20190815192018.30570-5-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190816121452.540B227430D6@ypsilon.sirena.org.uk>
Date: Fri, 16 Aug 2019 13:14:52 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: pcm: add ALH support" to the asoc
	tree
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

   ASoC: SOF: pcm: add ALH support

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

From 6e3360cd07ec2d4a53919dc62947f9769d8fdac4 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Thu, 15 Aug 2019 14:20:18 -0500
Subject: [PATCH] ASoC: SOF: pcm: add ALH support

Even if ALH has no specific configuration, we still need to handle the
common parameters for all DAIs

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190815192018.30570-5-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/pcm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 8612896673a5..e3f6a6dc0f36 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -675,6 +675,9 @@ static int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 	case SOF_DAI_INTEL_HDA:
 		/* do nothing for HDA dai_link */
 		break;
+	case SOF_DAI_INTEL_ALH:
+		/* do nothing for ALH dai_link */
+		break;
 	default:
 		dev_err(sdev->dev, "error: invalid DAI type %d\n",
 			dai->dai_config->type);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
