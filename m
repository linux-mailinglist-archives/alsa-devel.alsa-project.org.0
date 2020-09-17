Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7376826E4ED
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 21:02:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06ED716AD;
	Thu, 17 Sep 2020 21:02:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06ED716AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600369371;
	bh=Hb/K8ZsiBzGs+A5mWIRqpLkTh6KT3vAf24qrmwesNvE=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fd8zlS61oy9FYdbtYOySfPuGeU9HOaiQgSQt3lZMuWAn3kHcDojnTpRSR3XNUABKm
	 Ysg3k6XCN4qqd/1+bYuazXcrNdYYxBUf7feyv5KL7VqEptVwarE0bSNHYur3kxEqP2
	 fAXUOTqetC+O1BLrjKeaUG3yqJ7P/UcHHDUeSLm0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C4CFF802FF;
	Thu, 17 Sep 2020 20:58:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90634F802FE; Thu, 17 Sep 2020 20:58:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CBA7F802FB
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 20:58:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CBA7F802FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BTpzay5L"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1B2E4221E3;
 Thu, 17 Sep 2020 18:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600369092;
 bh=Hb/K8ZsiBzGs+A5mWIRqpLkTh6KT3vAf24qrmwesNvE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=BTpzay5LMze2Qc0LojFYSVs1cLmpi/TeZgso+vxk5eNTufS9xvOIeKxt9hgzgsH/6
 WAit93JeSDMdDkQsyni4UTi5OJrI+H6D9t0qO0i6dSJ8UVUqd90vuCa3RWc8OSzJkP
 897soZrlyBX7b4pp7fqIn9mA2EasrUMwf57T3o3k=
Date: Thu, 17 Sep 2020 19:57:22 +0100
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, lgirdwood@gmail.com, Camel Guo <camel.guo@axis.com>,
 dmurphy@ti.com
In-Reply-To: <20200908090417.16695-1-camel.guo@axis.com>
References: <20200908090417.16695-1-camel.guo@axis.com>
Subject: Re: [PATCH] ASoC: tlv320adcx140: Fix digital gain range
Message-Id: <160036900935.20113.13746695477949199568.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, kernel@axis.com, linux-kernel@vger.kernel.org,
 Camel Guo <camelg@axis.com>
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

On Tue, 8 Sep 2020 11:04:17 +0200, Camel Guo wrote:
> According to its datasheet, the digital gain should be -100 dB when
> CHx_DVOL is 1 and 27 dB when CHx_DVOL is 255. But with the current
> dig_vol_tlv, "Digital CHx Out Volume" shows 27.5 dB if CHx_DVOL is 255
> and -95.5 dB if CHx_DVOL is 1. This commit fixes this bug.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tlv320adcx140: Fix digital gain range
      commit: 73154aca4a03a2ab4833fd36683feb884af06d4b

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
