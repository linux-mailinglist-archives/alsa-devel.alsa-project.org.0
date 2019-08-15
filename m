Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DE08F226
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:27:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23B3E168A;
	Thu, 15 Aug 2019 19:26:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23B3E168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565890063;
	bh=zmrjiALTLl0uMoUpuHA4PDLHRALmH1m3LLMmhKfAi7A=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=fmEODJGBH1SnvXNiHpBO5iibUwkJaC701gfAvLX71SFPDZHz72GykydzJ2osrP0QJ
	 C3V/TZoMIraQic24L5vWDAoS+MejbbUJkNJmUqSO4k4qBfkRo9IWV7fSSiHJfL6lSP
	 Tii6R9oUQY/fsEH0DLz3A1dJqOXQ6ekQXpboap18=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AE73F8073C;
	Thu, 15 Aug 2019 19:15:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 268AEF805F5; Thu, 15 Aug 2019 19:15:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f99.google.com (mail-wr1-f99.google.com
 [209.85.221.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED0BFF805F6
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:14:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED0BFF805F6
Received: by mail-wr1-f99.google.com with SMTP id u16so2890517wrr.0
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=X7bLc+r8fHwsNJkMocdevzQQLenevpoFnD/N2hX59c8=;
 b=CG33b7+xotaEJglGpUxVfWYwYm8/ftOcrBl8duSn1ayz/CDJfiZKktm6ukmfHf/m9W
 6/bQz4WDuso3CzRmsb47/Z+tEIH7SJXITLr8KqVt92mJkDAG4NM+d/rATmXG4Z4AVkwK
 3VD0rlIMzAu725ImZFjLo0l9eOEThQUUWWS/Lwi7AicQC9L0ObdcoligncJwxGrvhsQF
 PBXsMtOMJ4VaYhnMIpIOsfEahpEmt2wLhBSU/D1GeP/qMJviWYHVDCCtQhwuNWvuq7bi
 VbmqaPassB31pl49whs6XoLY9RMdyiuGhk5aCgOh+AEmn3nIT+pTSXIL1mHy4rK7mtMl
 LZDw==
X-Gm-Message-State: APjAAAX5vmYItW6BatBc7Lzfiyq7ZpA/gI30h0V+x4PT6bKFHmazK3KW
 ZajRuyi2UQsnoBsXVWh7wEzp9FLb0cFYcI9edXPMpb0+rnkyHzdyOBiCWSnDV9DSmw==
X-Google-Smtp-Source: APXvYqxwoidWQHtyXwG+AGJZH/8A6IlWCeH+5PpUhTu3dBW2SrVCe1miAfhEZDehzhTeOAlQrEZW0wjc6lsy
X-Received: by 2002:adf:8183:: with SMTP id 3mr6541774wra.181.1565889265941;
 Thu, 15 Aug 2019 10:14:25 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id h15sm13596wml.50.2019.08.15.10.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:14:25 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJKT-00051r-M1; Thu, 15 Aug 2019 17:14:25 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 0E5042742B9E; Thu, 15 Aug 2019 18:14:25 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
In-Reply-To: <20190621113116.47525-1-andriy.shevchenko@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190815171425.0E5042742B9E@ypsilon.sirena.org.uk>
Date: Thu, 15 Aug 2019 18:14:25 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: Intel: Skylake: Print constant literals
	from format specifier" to the asoc tree
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

   ASoC: Intel: Skylake: Print constant literals from format specifier

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

From ff30779bd50eb823e2e75cfc7cc8a3373bfa3fd9 Mon Sep 17 00:00:00 2001
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Fri, 21 Jun 2019 14:31:16 +0300
Subject: [PATCH] ASoC: Intel: Skylake: Print constant literals from format
 specifier

Instead of using two additional "%s" specifiers, put the constant string
literals directly to the format specifier.

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://lore.kernel.org/r/20190621113116.47525-1-andriy.shevchenko@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/skylake/skl-sst.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-sst.c b/sound/soc/intel/skylake/skl-sst.c
index 8af7546def1f..61a8e4756a2b 100644
--- a/sound/soc/intel/skylake/skl-sst.c
+++ b/sound/soc/intel/skylake/skl-sst.c
@@ -413,8 +413,7 @@ static int skl_load_module(struct sst_dsp *ctx, u16 mod_id, u8 *guid)
 	int ret = 0;
 	char mod_name[64]; /* guid str = 32 chars + 4 hyphens */
 
-	snprintf(mod_name, sizeof(mod_name), "%s%pUL%s",
-					     "intel/dsp_fw_", guid, ".bin");
+	snprintf(mod_name, sizeof(mod_name), "intel/dsp_fw_%pUL.bin", guid);
 
 	module_entry = skl_module_get_from_id(ctx, mod_id);
 	if (module_entry == NULL) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
