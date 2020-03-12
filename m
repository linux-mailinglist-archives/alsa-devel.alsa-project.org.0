Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE01183103
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 14:15:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7836B16EC;
	Thu, 12 Mar 2020 14:14:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7836B16EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584018939;
	bh=v3jWc7+2Jdx7Vo3bdr9zS89DdmrgbKDUDOHZv/wKIsk=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=r652zxH35KnwyWAo+lyg1/9IM6x4iGdXxGTizwAWPgaqM2BCnJ9Y2lQNcrSBqADjE
	 fI2TC1lLUmgqj1ux33m6C5HAuXuAPShEEQWanIo7QejhBJR6Ra9I6g59VjzExHW0We
	 hsehaVchr4iwi9nCUtpfi9uC1uo1coLzOEvOHaaY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0257F8028C;
	Thu, 12 Mar 2020 14:13:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69416F8028B; Thu, 12 Mar 2020 14:13:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 10DDBF80246
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 14:13:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10DDBF80246
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EED5630E;
 Thu, 12 Mar 2020 06:12:58 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72D453F534;
 Thu, 12 Mar 2020 06:12:58 -0700 (PDT)
Date: Thu, 12 Mar 2020 13:12:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Applied "MAINTAINERS: add entry for Sound Open Firmware drivers" to
 the asoc tree
In-Reply-To: <20200311174537.24497-1-kai.vehmanen@linux.intel.com>
Message-Id: <applied-20200311174537.24497-1-kai.vehmanen@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, Mark Brown <broonie@kernel.org>,
 daniel.baluta@nxp.com
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

The patch

   MAINTAINERS: add entry for Sound Open Firmware drivers

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From d95cf9324b1c334809029896651b067204c63d0b Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Wed, 11 Mar 2020 19:45:37 +0200
Subject: [PATCH] MAINTAINERS: add entry for Sound Open Firmware drivers

Sound Open Firmware (SOF) is an open source audio DSP firwmare
instrastructure and SDK. The kernel drivers for SOF are part of
the ALSA subsystem.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Acked-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Acked-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200311174537.24497-1-kai.vehmanen@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5e5382e2fe21..3bb6895ba5b9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15439,6 +15439,17 @@ F:	sound/soc/
 F:	include/dt-bindings/sound/
 F:	include/sound/soc*
 
+SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS
+M:	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
+M:	Liam Girdwood <lgirdwood@gmail.com>
+M:	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
+M:	Kai Vehmanen <kai.vehmanen@linux.intel.com>
+M:	Daniel Baluta <daniel.baluta@nxp.com>
+L:	sound-open-firmware@alsa-project.org (moderated for non-subscribers)
+W:	https://github.com/thesofproject/linux/
+S:	Supported
+F:	sound/soc/sof/
+
 SOUNDWIRE SUBSYSTEM
 M:	Vinod Koul <vkoul@kernel.org>
 M:	Sanyog Kale <sanyog.r.kale@intel.com>
-- 
2.20.1

