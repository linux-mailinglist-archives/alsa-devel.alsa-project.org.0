Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFE4183102
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 14:15:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 635F516F9;
	Thu, 12 Mar 2020 14:14:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 635F516F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584018921;
	bh=9yH0Al04oXTfJ3SBXQl1a8CFW2EDOOtaec6cVwOWdaQ=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=MSgvJLRNhxv5DKEYhrQ6ZugRgV3kMiMWmtle/SduPQ11uS+wy0ijHiTpMYaY6G0gD
	 M10BLyDtXVKKJqClfiPYNIOsg0AC+WIqPuAAceQbdfw7r4HFgZn6D6eyE6aZs+t2x9
	 Y0eJJToAjGSADxuox2l6dXrMJORg40bSmAyzVmo0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EB9EF8023F;
	Thu, 12 Mar 2020 14:13:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D48F4F80246; Thu, 12 Mar 2020 14:12:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 5B0C1F8023F
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 14:12:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B0C1F8023F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 666A630E;
 Thu, 12 Mar 2020 06:12:54 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E02673F534;
 Thu, 12 Mar 2020 06:12:53 -0700 (PDT)
Date: Thu, 12 Mar 2020 13:12:52 +0000
From: Mark Brown <broonie@kernel.org>
To: James Schulman <james.schulman@cirrus.com>
Subject: Applied "MAINTAINERS: Update Cirrus Logic codec driver maintainers"
 to the asoc tree
In-Reply-To: <20200310192751.24487-1-james.schulman@cirrus.com>
Message-Id: <applied-20200310192751.24487-1-james.schulman@cirrus.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 brian.austin@cirrus.com, paul.handrigan@cirrus.com, david.rhodes@cirrus.com,
 Mark Brown <broonie@kernel.org>
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

   MAINTAINERS: Update Cirrus Logic codec driver maintainers

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

From a5107b1a0993ff035dc8a1cf331da7bf961e4cbb Mon Sep 17 00:00:00 2001
From: James Schulman <james.schulman@cirrus.com>
Date: Tue, 10 Mar 2020 14:27:51 -0500
Subject: [PATCH] MAINTAINERS: Update Cirrus Logic codec driver maintainers

Brian & Paul are no longer active audio codec driver
maintainers. Update list to reflect myself and David
Rhodes as the active maintainers.

Signed-off-by: James Schulman <james.schulman@cirrus.com>
Link: https://lore.kernel.org/r/20200310192751.24487-1-james.schulman@cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3bb6895ba5b9..c6fc68b66434 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3964,8 +3964,8 @@ F:	Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
 F:	sound/soc/codecs/cros_ec_codec.*
 
 CIRRUS LOGIC AUDIO CODEC DRIVERS
-M:	Brian Austin <brian.austin@cirrus.com>
-M:	Paul Handrigan <Paul.Handrigan@cirrus.com>
+M:	James Schulman <james.schulman@cirrus.com>
+M:	David Rhodes <david.rhodes@cirrus.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Maintained
 F:	sound/soc/codecs/cs*
-- 
2.20.1

