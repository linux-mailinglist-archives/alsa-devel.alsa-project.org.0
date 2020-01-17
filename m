Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F219140E52
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2020 16:52:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEB921704;
	Fri, 17 Jan 2020 16:51:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEB921704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579276350;
	bh=LAvzNdFxJCne5rw6Recg0nb3HD0FEKKF2kaIi8LhPmI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=tljz2rxJdow+A/83kxzdXAOREZNT3h4+tSza/T/PVSrpZ/w1xpwUoAfqxnljSMpYh
	 uk7KF5U05CTwjsd2iYdStyORfbYNWX35S7UKmxgT8hlDvSV84S/6qF5PKngRSpKNeS
	 fXFd7OuWVD6CIgHVHKVloXhCk8AFpQhqRsANa8K4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4258F802BE;
	Fri, 17 Jan 2020 16:45:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96595F800E9; Fri, 17 Jan 2020 16:44:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A222BF80227
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 16:44:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A222BF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="cvGMJRaN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=PJ16TCfg2m6xxtu5/PKJEnpHqtv5vF7NWIs0DxBsvp0=; b=cvGMJRaNEJPl
 7DiyicxFO0VDGQU30S8A85MsO1/mQIiwx1UwIVWH+WqiWI8lYq6b1tkvNKt0bOira2Z7qDKKjkkqg
 McP9lZRyGACheIUwTBglYhApvs86OZTGe0vEyCc8T3tvo+cSWZDMsc4BBTcZV6Ltm/Xvys2X83kmg
 zSD7Q=;
Received: from fw-tnat-cam4.arm.com ([217.140.106.52]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1isTnA-0006sR-Vx; Fri, 17 Jan 2020 15:44:13 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id A6B8BD02BD9; Fri, 17 Jan 2020 15:44:12 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20200113114054.9716-1-cezary.rojewski@intel.com>
Message-Id: <applied-20200113114054.9716-1-cezary.rojewski@intel.com>
X-Patchwork-Hint: ignore
Date: Fri, 17 Jan 2020 15:44:12 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 tiwai@suse.com, lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda: Fix SKL dai count" to
	the asoc tree
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

   ASoC: SOF: Intel: hda: Fix SKL dai count

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From a6947c9d86bcfd61b758b5693eba58defe7fd2ae Mon Sep 17 00:00:00 2001
From: Cezary Rojewski <cezary.rojewski@intel.com>
Date: Mon, 13 Jan 2020 12:40:54 +0100
Subject: [PATCH] ASoC: SOF: Intel: hda: Fix SKL dai count

With fourth pin added for iDisp for skl_dai, update SOF_SKL_DAI_NUM to
account for the change. Without this, dais from the bottom of the list
are skipped. In current state that's the case for 'Alt Analog CPU DAI'.

Fixes: ac42b142cd76 ("ASoC: SOF: Intel: hda: Add iDisp4 DAI")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200113114054.9716-1-cezary.rojewski@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 18d7e72bf9b7..8981c00c4d94 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -345,7 +345,7 @@
 
 /* Number of DAIs */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-#define SOF_SKL_NUM_DAIS		14
+#define SOF_SKL_NUM_DAIS		15
 #else
 #define SOF_SKL_NUM_DAIS		8
 #endif
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
