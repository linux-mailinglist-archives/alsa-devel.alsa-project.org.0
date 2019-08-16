Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B15890130
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2019 14:17:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A87581664;
	Fri, 16 Aug 2019 14:16:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A87581664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565957850;
	bh=SbOBOM9LvdGbv6b2QuXt4+Wtoy9pKXV78QrAIchezYI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=RoL347tU3mAcuWu7aoZUyyNcvjlfMSARP4u+ZLf3kBzEZYzZvO27fQj+LAjHROTHc
	 vzgzNUtf051nkDqEAP1oO09tj7QKRDVmrW7qPXbpi88d7nDBPqmZ2d98TDOG15DgXG
	 PGH+t42a+yVeJ79HisNcgld7WRX+kqHnpRp0fr9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73005F805A9;
	Fri, 16 Aug 2019 14:15:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3770FF80446; Fri, 16 Aug 2019 14:14:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f98.google.com (mail-wr1-f98.google.com
 [209.85.221.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95727F80214
 for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2019 14:14:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95727F80214
Received: by mail-wr1-f98.google.com with SMTP id b16so1336774wrq.9
 for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2019 05:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=5HEBiI7Ng9oW675aGe878F6lW7sCbbrglK3dXn9q/9k=;
 b=VjzD2LW/8acqkowp4sg35lVqtXd9LJd7ys3G8bFs53Z+Sz4L5YtkicZfSEPlKGHZym
 h27ygPRf5wHQnMNDicpmrAI2I6K2mk+UOyfymICxwdTXdMYcAH5msZz8+ib95eamJ/5V
 6OhyLJCSW65ky34tpEhR82Y3KW9DrEXlxQuo8gXEbJSwuk9k3t5dvMy3mpClnxga8MZX
 HKdj0hupUZGYDRrTuAmLl7EhZn/WYkz4y/lqOC9PxCg8iF3SnPKSrM1wLcWBefHKG2q5
 0g/9+bLuM3ZYoRQMZlGgs8aNpPZK+LPJPyrnCU+Y14cP3hV4ErJKVNuHpzckin9PNa0Y
 3Y0Q==
X-Gm-Message-State: APjAAAVTaIspok4Co2hkxispOtz6LzyjkO0wQSozmrGF7rLrVpTpF3Ce
 2T85zQDUugOfNMl/hpdhwZRUAyrt1I/w3PLNnilF5BmHS+HE3WrCQPNOeYNMiAcD3w==
X-Google-Smtp-Source: APXvYqz25F/aw+n1kuIuWfJ98CmrrqrhASIG9i6a7nMwo1A+fPoFXfK/WjRl+Y9cFCxrYlzSYzRwUqyiOpSB
X-Received: by 2002:adf:e9cb:: with SMTP id l11mr998983wrn.35.1565957693436;
 Fri, 16 Aug 2019 05:14:53 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id r28sm109031wrr.79.2019.08.16.05.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 05:14:53 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyb89-0003L1-6E; Fri, 16 Aug 2019 12:14:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id A86552743115; Fri, 16 Aug 2019 13:14:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Bard liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20190815192018.30570-3-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190816121452.A86552743115@ypsilon.sirena.org.uk>
Date: Fri, 16 Aug 2019 13:14:52 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: rename SOUNDWIRE to ALH" to the
	asoc tree
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

   ASoC: SOF: rename SOUNDWIRE to ALH

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

From 8207a1c4911226d0dd0592ffed5fce4a1f95e4b2 Mon Sep 17 00:00:00 2001
From: Bard liao <yung-chuan.liao@linux.intel.com>
Date: Thu, 15 Aug 2019 14:20:16 -0500
Subject: [PATCH] ASoC: SOF: rename SOUNDWIRE to ALH

Rename SOUNDWIRE to ALH.

Signed-off-by: Bard liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190815192018.30570-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/sof/dai.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/sof/dai.h b/include/sound/sof/dai.h
index 86494294274e..9da53f8dc7a7 100644
--- a/include/sound/sof/dai.h
+++ b/include/sound/sof/dai.h
@@ -49,7 +49,7 @@ enum sof_ipc_dai_type {
 	SOF_DAI_INTEL_SSP,		/**< Intel SSP */
 	SOF_DAI_INTEL_DMIC,		/**< Intel DMIC */
 	SOF_DAI_INTEL_HDA,		/**< Intel HD/A */
-	SOF_DAI_INTEL_SOUNDWIRE,	/**< Intel SoundWire */
+	SOF_DAI_INTEL_ALH,		/**< Intel ALH  */
 	SOF_DAI_IMX_SAI,		/**< i.MX SAI */
 	SOF_DAI_IMX_ESAI,		/**< i.MX ESAI */
 };
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
