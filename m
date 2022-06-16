Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3141154DF24
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 12:32:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA35D1ABA;
	Thu, 16 Jun 2022 12:31:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA35D1ABA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655375524;
	bh=TmIAW3rbg55ktSvTGcy7KFPYRdZwVkYbh2cKlRwf5cw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=STDpoGyAKN9ngCOSp8Ub9QV9FC41oLq1gPHiIFDD5DK4QpDa+yddefy36DaXkxN2y
	 Ffwm/ncamAJXAwveRh+RFx2FUhOPETh95ZgV+nxIcMQ4erH7h3Iammiete4W1FybJn
	 Cgt4wD0ohQRuVELJeXJzHMOGQE6XosnseMfwxtQA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 187A8F80310;
	Thu, 16 Jun 2022 12:31:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF22BF801D8; Thu, 16 Jun 2022 12:30:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E0FBF800D3
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 12:30:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E0FBF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="BipmMncs"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25G5bV9E020293;
 Thu, 16 Jun 2022 05:30:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=SWjGMvo8oAklPuUAPr0GO8gsjG1MhEdsELaW6hchfiw=;
 b=BipmMncsH74v8veNumsPG80f69ITxRoIc7MJV5Zi2rL3bQ5+mk51dE2OhSzmVSXcq7gH
 PEGgFbnUqvwGXfIrqJ+5fjoPCs/Ec0Xkqzid+BtBguxF7AGz3jEk9HM97FUnz0llfj2J
 SnaDhpCKFjCiclLcSST3ThiOhMPJANt3/jQlGnqJBJU3znPc2cnzoHs2T5JeP00r4vW1
 +i2GvVWeZtsvJEW+DVZc6JY+bzUtTbpkOGfl5P2UwepAFVGjZ9KNqVBGJKLeMv/iBE60
 omgqxkY1nHhzKD6lTOH8noQqMiYRamjt+moKRGOZFv1oaYgr5Yax3RQkuoMHdxAE2o+x DQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf35mrv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 05:30:47 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 11:30:45 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 11:30:45 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 59ACC11D1;
 Thu, 16 Jun 2022 10:30:45 +0000 (UTC)
Date: Thu, 16 Jun 2022 10:30:45 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH] ASoC: tegra: Fix clock DAI format on Tegra210
Message-ID: <20220616103045.GD38351@ediswmail.ad.cirrus.com>
References: <1655280277-4701-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1655280277-4701-1-git-send-email-spujar@nvidia.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: Wz0DY6398pYy0H8B1wlsGdEhSyg4wtwQ
X-Proofpoint-ORIG-GUID: Wz0DY6398pYy0H8B1wlsGdEhSyg4wtwQ
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, jonathanh@nvidia.com,
 broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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

On Wed, Jun 15, 2022 at 01:34:37PM +0530, Sameer Pujar wrote:
> I2S reset failures are seen on Tegra210 and later platforms. This indicates
> absence of I2S bit clock, which is required to perform the reset operation.
> Following failures are seen with I2S based tests on Tegra210 and later:
> 
>   tegra210-i2s 2901100.i2s: timeout: failed to reset I2S for playback
>   tegra210-i2s 2901100.i2s: ASoC: PRE_PMU: I2S2 RX event failed: -110
>   tegra210-i2s 2901100.i2s: timeout: failed to reset I2S for capture
>   tegra210-i2s 2901100.i2s: ASoC: PRE_PMU: I2S2 TX event failed: -110
> 
> The commit d92ad6633fa7 ("ASoC: tegra: Update to use set_fmt_new callback")
> regressed I2S functionality on Tegra platforms. Basically it flipped clock
> provider and consumer DAI formats. This configures Tegra I2S in consumer
> mode by default now and there is none to provide bit clock during loopback
> tests. The external codec based tests also fail because both Tegra I2S and
> codec I2S get configured in consumer mode.
> 
> ASoC core flips the DAI format before calling set_fmt() for CPU DAIs. This
> is negated in above commit. Fix this by swapping SND_SOC_DAIFMT_BC_FC and
> SND_SOC_DAIFMT_BP_FP switch cases.
> 
> Fixes: d92ad6633fa7 ("ASoC: tegra: Update to use set_fmt_new callback")
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---

Ah.... I see what has happened there. As this device is one of
the few CPU side components defining non_legacy_dai_naming whilst
processing the DAI links the core would have been flipping the
format for this driver as it would have mistaken it for a CODEC
to CODEC link, so unlike the other CPU side components the flags
shouldn't have been inverted when I converted this driver.

Apologies for missing this whilst doing the updates, and thank
you for fixing. I will check if there are any other cases of this
that need to be hit.

A bit late but for what it is worth:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
