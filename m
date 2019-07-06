Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFB061077
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Jul 2019 13:26:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 815491677;
	Sat,  6 Jul 2019 13:26:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 815491677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562412412;
	bh=1Ji7vS67QuiFEeINO9Z9FOkw5qOEKj6KXe5n6lh4cfM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=EkK4oKPo78SUoum9o0Gwa81fbQkDypgRHRs8VMqz6GPnsFgKYsHso6guX+LRokaJL
	 UaXskcXR//VS8Jtoq0P3ZasZYcA/oa0NP/qF3nXXkNl+aiEA4ds/exzl/g0A+rBBBJ
	 qNdNc7gLcu0YStdFdJA5ocZp4j4xVtIvpEOiiftg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB164F8013F;
	Sat,  6 Jul 2019 13:25:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC3CAF80143; Sat,  6 Jul 2019 13:25:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00C2EF800E6
 for <alsa-devel@alsa-project.org>; Sat,  6 Jul 2019 13:25:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00C2EF800E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="aTeC5aQh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=qk7NriSVkBqLLAfy4BsowuOZY08+wAygBorNJEO8ZN4=; b=aTeC5aQhTkl6
 r1l1FkOecvKQ1krsw/JLS354c8dOobBqrAupMDBzme4TAL9l4WGssBL5Xo829l1vpKrheiZclCFn6
 tQyGm5K+b5INNvlFRLuAdCNyeK2EpXmbE57EH90JnJz4aF5KyIe8zXHiBjcMulnRz4wSUNW+l1HYy
 OKyJc=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hjioM-0006o0-64; Sat, 06 Jul 2019 11:24:58 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 8933F27437ED; Sat,  6 Jul 2019 12:24:57 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20190702132428.13129-2-kai.vehmanen@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190706112457.8933F27437ED@ypsilon.sirena.org.uk>
Date: Sat,  6 Jul 2019 12:24:57 +0100 (BST)
Cc: libin.yang@intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, tiwai@suse.de,
 pierre-louis.bossart@linux.intel.com, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: hdac_hdmi: report codec link up/down
	status to bus" to the asoc tree
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

   ASoC: hdac_hdmi: report codec link up/down status to bus

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

From e62bccf8a5ec47768ae2600dc880b148cce19f1b Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Tue, 2 Jul 2019 16:24:26 +0300
Subject: [PATCH] ASoC: hdac_hdmi: report codec link up/down status to bus

Report codec power status to the HDA codec bus from runtime pm
suspend and resume callbacks. This is required to implement
runtime idle logic that relies on 'codec_powered' field of hdac_bus
to be maintained for all codecs.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20190702132428.13129-2-kai.vehmanen@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/hdac_hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index c9f9820968bb..47eee18b66a3 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -2088,6 +2088,7 @@ static int hdac_hdmi_runtime_suspend(struct device *dev)
 		return -EIO;
 	}
 
+	snd_hdac_codec_link_down(hdev);
 	snd_hdac_ext_bus_link_put(bus, hlink);
 
 	snd_hdac_display_power(bus, hdev->addr, false);
@@ -2114,6 +2115,7 @@ static int hdac_hdmi_runtime_resume(struct device *dev)
 	}
 
 	snd_hdac_ext_bus_link_get(bus, hlink);
+	snd_hdac_codec_link_up(hdev);
 
 	snd_hdac_display_power(bus, hdev->addr, true);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
