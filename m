Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7855F1DEFA3
	for <lists+alsa-devel@lfdr.de>; Fri, 22 May 2020 21:03:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20829187A;
	Fri, 22 May 2020 21:02:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20829187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590174196;
	bh=OGWY9S1a+s497w6nAoQWV1xChrUf4zarBWqyMWAxvXw=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZwnXWYMegMVPhTFo0WacWAxyEuA1lWfa+nVaEWPZUbfUauNr8s3GWsW7flSqYWAcX
	 fnP+nqAzt7SpD+ipIJMmvnaWfRN7etXQpZ+UoTj8LgR960n529kjatClGKC5VmxQZ7
	 VzsexLMz1MQHjcX1kj0lscUR9lO3KcEd18i+gKmU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43D04F8026F;
	Fri, 22 May 2020 21:00:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFED0F80111; Fri, 22 May 2020 21:00:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EF9FF80111
 for <alsa-devel@alsa-project.org>; Fri, 22 May 2020 21:00:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EF9FF80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Dmtnwcwh"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 35A1F207D8;
 Fri, 22 May 2020 19:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590174046;
 bh=OGWY9S1a+s497w6nAoQWV1xChrUf4zarBWqyMWAxvXw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Dmtnwcwhr43Mf15Kh5n0l5aHsw+WClHXCWfE9P+CAVrkSb3dXLVesSVi20OnZv0Pc
 dlZnZuv9qniu6Eim3FDMwAr0AlAWz8KOP/B3l/FgfVeLMGm4Pjl6e+ZiLEj9vvMCTS
 o3EqyBefLTBlZYK/2b6H4APXHCEwMIKkssN8C5dM=
Date: Fri, 22 May 2020 20:00:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Pavel Dobias <dobias@2n.cz>, alsa-devel@alsa-project.org
In-Reply-To: <20200522142957.18364-1-dobias@2n.cz>
References: <20200520130131.GG4823@sirena.org.uk>
 <20200522142957.18364-1-dobias@2n.cz>
Subject: Re: [PATCH v2 0/2] ASoC: max9867: keep ADCs and DACs always on
Message-Id: <159017403821.20813.10891179590864759431.b4-ty@kernel.org>
Cc: ladis@linux-mips.org
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

On Fri, 22 May 2020 16:29:55 +0200, Pavel Dobias wrote:
> On 20. 05. 20 15:01, Mark Brown wrote:
> > On Wed, May 20, 2020 at 09:19:02AM +0200, Pavel Dobias wrote:
> >> Codec requires enabling of left and right ADCs in the same I2C write
> >> operation which isn't fullfilled when controlled from DAPM and
> >> causes unexpected behaviour of codec. The similar applies to DACs.
> >> Enable ADCs and DACs once at startup and never switch them off
> >> to solve the issue.
> > It will be normally when the two channels are updated simultaneously
> > though that doesn't stop the user doing something to update them
> > separately.  In any case this would be better handled through moving the
> > power control to either supply widgets or event callbacks rather than
> > just giving up on power control entirely.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: max9867: add digital microphone controls
      commit: 980b63f8d040a791e8d751b8065d12ad7865f976
[2/2] ASoC: max9867: keep ADCs and DACs always on
      commit: 29c859df7b52080f0809b8a0b9d7b86fff379ef9

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
