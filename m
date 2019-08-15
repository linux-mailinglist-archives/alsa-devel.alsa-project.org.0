Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DDD8F25A
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:35:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4816916C4;
	Thu, 15 Aug 2019 19:35:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4816916C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565890554;
	bh=ITuOyia0Civ1rLzzgfrN6wf+4kFHk2UQgPhZFVWTSeQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=nRT6+CPHcmG10jVjAj8zO3mBbDC+ipAnUUNHb/AheqOatUDrGL/UNnNECiX7Q1NMQ
	 PgLwTg8fIaHlY4EYloIyATHZ13CFQfJzUpaxj9aAyq5Oqp4Bxxf7Smx8IrVsYX2bo7
	 mOQL4LMLRnH8HgQaEgMgUGBxZ4VQ5rMelBxII/10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25959F80612;
	Thu, 15 Aug 2019 19:16:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58EF1F8070C; Thu, 15 Aug 2019 19:15:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RCVD_IN_MSPIKE_H2, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f98.google.com (mail-ed1-f98.google.com
 [209.85.208.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E054F80600
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:14:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E054F80600
Received: by mail-ed1-f98.google.com with SMTP id p28so2709439edi.3
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=sBLfK6JFSkfLgEHGk+ffjmNtCcRHR9A9na3wzsHcCrk=;
 b=nwwWOwsHj1zV+/pbbrlN8zTqNZkLsElC6COnNMHHAagW/hE9WnnUscnjMZakU3J/4y
 R6RSjaaj7zYtw1319u24e8Nl8zNEyyu47of3Yd6qFexzLEawPW6UtJnrC2px7+CFq/gL
 g1dA1Zd3qfJSClzGawfbm5eVopYLcVRYcH985LFUH2S1llxd2T0lGDED//O7QdivIOJ+
 0kMuxwQwB8t6WkGvf8xTQA57X0eT+5Qfau0/uezoHjdtrkzkkaH2WY1pv/Y4qYuIeSvn
 6hiVUU1PuNDGvg18QqoIB1h09pCCPQ0jAGpnHFqgcS1bMD1af+crseiVftLnqGpfauoO
 KyKw==
X-Gm-Message-State: APjAAAUBz1iOhysSLfw13TdwD2XOCdqYvJTC/8Qe+o3dJv8caeLpwn5U
 Iwddz5vWF0b12JltCdRDsbOfPV/+ktbyYH0z5hyf+Q/e6Pg6HfoJyKhWy8BTXP982g==
X-Google-Smtp-Source: APXvYqwLz/ytaTo2soSmxzOwR0uoEThGE+yx4xcw74ae9+EkexEamJiEHanx5D52eYo+y7lX0747ItfY4oXS
X-Received: by 2002:a17:906:254f:: with SMTP id
 j15mr5445232ejb.69.1565889268464; 
 Thu, 15 Aug 2019 10:14:28 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id n8sm10408ejl.34.2019.08.15.10.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:14:28 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJKW-00052Z-5R; Thu, 15 Aug 2019 17:14:28 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 927662742BC7; Thu, 15 Aug 2019 18:14:27 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20190812140305.17570-1-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190815171427.927662742BC7@ypsilon.sirena.org.uk>
Date: Thu, 15 Aug 2019 18:14:27 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>, kbuild test robot <lkp@intel.com>
Subject: [alsa-devel] Applied "ASoC: Intel: hsw: remove i386 build warning
	w/ size_t argument" to the asoc tree
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

   ASoC: Intel: hsw: remove i386 build warning w/ size_t argument

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

From 8da2d74c10fd71cc04e2585fe8bb3ced325f8e25 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Mon, 12 Aug 2019 09:03:05 -0500
Subject: [PATCH] ASoC: Intel: hsw: remove i386 build warning w/ size_t
 argument

Recent changes in the common IPC code introduced a build warning with
size_t fields, use the correct %zu format.

include/linux/dynamic_debug.h:82:16: warning: format '%lu' expects
argument of type 'long unsigned int', but argument 4 has type 'size_t'
[-Wformat=]

Fixes: abf31feea26c0 ('ASoC: Intel: Update request-reply IPC model')
Reported-by: kbuild test robot <lkp@intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Acked-By: Cezary Rojewski <cezary.rojewski@intel.com>
Link: https://lore.kernel.org/r/20190812140305.17570-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/haswell/sst-haswell-ipc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/haswell/sst-haswell-ipc.c b/sound/soc/intel/haswell/sst-haswell-ipc.c
index 5c73b11375e3..0ff89ea96ccf 100644
--- a/sound/soc/intel/haswell/sst-haswell-ipc.c
+++ b/sound/soc/intel/haswell/sst-haswell-ipc.c
@@ -2015,11 +2015,11 @@ int sst_hsw_module_set_param(struct sst_hsw *hsw,
 
 	if (payload_size <= SST_HSW_IPC_MAX_SHORT_PARAMETER_SIZE) {
 		/* short parameter, mailbox can contain data */
-		dev_dbg(dev, "transfer parameter size : %lu\n",
+		dev_dbg(dev, "transfer parameter size : %zu\n",
 			request.size);
 
 		request.size = ALIGN(payload_size, 4);
-		dev_dbg(dev, "transfer parameter aligned size : %lu\n",
+		dev_dbg(dev, "transfer parameter aligned size : %zu\n",
 			request.size);
 
 		parameter = kzalloc(request.size, GFP_KERNEL);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
