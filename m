Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 085F9E7465
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 16:05:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 922071FAA;
	Mon, 28 Oct 2019 16:04:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 922071FAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572275102;
	bh=ddjoU6jfFnSsgwvObfUYUir4LVx7FxkyjKtlV48XUHE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ewUHHVIlkBaix4T2e0uvPmrOGsQBuOrpBrf5jpOi/I0M+PNyfZKjuF16TSIwtMtpV
	 WGWsKp5ndSXnzuVKeTJE8+MdkjNMIpQJuHme5haRpHu/RyTnHPHQ2CSJ6ZK1T6aQmq
	 yKMlNtePRhHRWwiOfoto3Xj+3vLbWYeg/ShLTq4c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CDD3F8070E;
	Mon, 28 Oct 2019 15:57:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02ECBF805FB; Mon, 28 Oct 2019 15:56:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF34CF8011D
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 15:56:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF34CF8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="XJQRqnhX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=slnP/lIIQp4AY7OXfiaz5BuVJhWr4Aaag+EBZ/juqOA=; b=XJQRqnhXKMqj
 sLP7ufG/nKN5xLGSY3fC1qfmnoECryJNN/2vm+PreRMU8wRdFo5eYD/lIchp81mAxcvF0qEDnK07O
 4epBYYM3mgtIEVJCSIa7P9sH6ihln+uw4IHLtWzDWcRbl8E92EN2vMPp1f/SCnPKTZ57q3BYJWemk
 BF5YQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iP6Ra-0008Op-CE; Mon, 28 Oct 2019 14:56:30 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 9E02B27403EF; Mon, 28 Oct 2019 14:56:28 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20191025224122.7718-25-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191028145628.9E02B27403EF@ypsilon.sirena.org.uk>
Date: Mon, 28 Oct 2019 14:56:28 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: return -ENOTSUPP if D0I3 is not
	supported" to the asoc tree
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

   ASoC: SOF: return -ENOTSUPP if D0I3 is not supported

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

From 5655ce660a6d3eec4a3ad37feb99fb228540d1a9 Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Fri, 25 Oct 2019 17:41:20 -0500
Subject: [PATCH] ASoC: SOF: return -ENOTSUPP if D0I3 is not supported

No set_power_state ops means that the platform doesn't support D0i3,
return -ENOTSUPP for the case.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191025224122.7718-25-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/ops.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index d7c8fc06f961..93512dcbaacd 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -199,7 +199,8 @@ static inline int snd_sof_dsp_set_power_state(struct snd_sof_dev *sdev,
 	if (sof_ops(sdev)->set_power_state)
 		return sof_ops(sdev)->set_power_state(sdev, substate);
 
-	return 0;
+	/* D0 substate is not supported */
+	return -ENOTSUPP;
 }
 
 /* debug */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
