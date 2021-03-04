Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBBB32C5EA
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Mar 2021 02:01:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CF581ACF;
	Thu,  4 Mar 2021 02:00:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CF581ACF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614819661;
	bh=faTXWlbtRJS8PZyob2pu24m6W2QxL3JaP+s13cijJ6w=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=asNslI0R4BRPtEwXhgHk8p5FkK29plmW4WSDewSGlBwbcm4ldjATifM42zYC80zVV
	 mXqN3zGCs4wLQH/jqqT9XOJz2CqBfpIg1ZB+atPbYj28Kl34HqdnDs8TLigZg0ovfq
	 qK3GqXYYC21KYnHGuzpPmwTsOq1uAFX6YPGRC0qc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15F1CF80272;
	Thu,  4 Mar 2021 01:56:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 646A7F804FA; Thu,  4 Mar 2021 01:56:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3515F804ED
 for <alsa-devel@alsa-project.org>; Thu,  4 Mar 2021 01:56:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3515F804ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="j+HWuaFv"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D4E5764EA4;
 Thu,  4 Mar 2021 00:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614819369;
 bh=faTXWlbtRJS8PZyob2pu24m6W2QxL3JaP+s13cijJ6w=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=j+HWuaFv6jVBrftAMGjxPgvDBZnfO9BeBR5gDoC2DnugqDK7Sf085rwaLzUBr5C8O
 7KT27gdwWgKae4Lo1cTqDDpNhAxYrO4AX26/OEc2Q6B2smDGKfSLmJCd8W4RNU1IpJ
 AKsrPy9BReAyJ9s0GnWhpe0gINtQksnk0gQa3FHDFgTXZW+rGd1EHEjRiAPsoCexeF
 XUZin8baEe9+OwlqPWRIw8H2G3GH0W8C0eouyXxqFE+eYSdjyETWYzCKyRh3HrbQwx
 /tvtPBQxY+OkbEzZWUCv8FbmFuZDs5/+lCx+bxZzXUYb0bQKU6j0auIXyNEAkK/xAn
 4TT9J3DN5BwGA==
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20210301170157.36584-1-ranjani.sridharan@linux.intel.com>
References: <20210301170157.36584-1-ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: enable async suspend
Message-Id: <161481924067.9553.9262958970534564216.b4-ty@kernel.org>
Date: Thu, 04 Mar 2021 00:54:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On Mon, 1 Mar 2021 09:01:57 -0800, Ranjani Sridharan wrote:
> The skylake driver disabled async suspend to prevent disabling
> the DSP before the card was suspended during system suspend.
> This code was carried over to the SOF driver. But, there is no
> risk of the DSP getting disabled before the card is suspended
> with the SOF driver. Therefore, it is safe to enable async suspend
> and thereby optimize the system resume time.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda: enable async suspend
      commit: 75c64508dfa6679f2969e68313ee4f7fbdac865b

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
