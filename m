Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF5C20A57A
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 21:13:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5938919FE;
	Thu, 25 Jun 2020 21:12:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5938919FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593112429;
	bh=Wq5qLv42hAbYbM3KVFBmYg7DH+Sc+FTD5uuJlgNEbE0=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IWiZVjMCpqk9/KRQBmELcPDqzu3LJ5TgPf3HH7FGnmvGDfG64t3nltCmBFExbmZcQ
	 FNR7qrPPsB/fGJet4jD+wS3TnMlWFZSGm3yeJXEQ+IMbXBpwfE+k9/RFXFtyJRykNh
	 q5tKF6AipUhpVvaJ0xSQgus5YZamfT5uwMPKTRUY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 496CEF8023E;
	Thu, 25 Jun 2020 21:12:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB091F80234; Thu, 25 Jun 2020 21:12:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7AD9F80158
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 21:12:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7AD9F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kOv4k4cK"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 438472075A;
 Thu, 25 Jun 2020 19:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593112319;
 bh=Wq5qLv42hAbYbM3KVFBmYg7DH+Sc+FTD5uuJlgNEbE0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=kOv4k4cKrUDBv/davGtLqjHBm3p2BBy/BHnIsQdY+11N5h47jw4atb66G8jlsFiSG
 MUkjX8FFFZAq1wLlUkvsBPuaPb/2RmauGuNroLw8sQZQgCzNqWZxkqI9VsAT7toY9O
 +dcZKwpnIt1OWSCgC6KXUQHQGwUjdoi7pNbT9odI=
Date: Thu, 25 Jun 2020 20:11:57 +0100
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, perex@perex.cz, Dan Murphy <dmurphy@ti.com>,
 lgirdwood@gmail.com
In-Reply-To: <20200624174932.9604-1-dmurphy@ti.com>
References: <20200624174932.9604-1-dmurphy@ti.com>
Subject: Re: [PATCH v6 0/7] TAS2562 issue fixes and slot programming
Message-Id: <159311231750.10637.10437779790730548951.b4-ty@kernel.org>
Cc: robh@kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
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

On Wed, 24 Jun 2020 12:49:25 -0500, Dan Murphy wrote:
> This series fixes issues tih the shut-down gpio device tree allocation and a
> code format issue found.
> 
> While working on a project slot programming for the tx and rx paths needed to be
> enabled.  In addition the vsense slot programming needed to be configurable and
> not directly a simpler adder to the isense slot.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: tas2562: Fix shut-down gpio property
      commit: 6f81e520b2906258a063f09b8d1dd9d0cc6a3172
[2/6] ASoC: tas2562: Update shutdown GPIO property
      commit: bc07b54459cbb3a572a78b5c200ff79ef11b8158
[3/6] ASoC: tas2562: Fix format issue for extra space before a comma
      commit: c8294da2ed0be726bb87019eba3a6367c7f1c922
[4/6] ASoC: tas2562: Add rx and tx slot programming
      (no commit info)
[5/6] dt-bindings: tas2562: Add voltage sense slot property
      (no commit info)
[6/6] ASoC: tas2562: Add voltage sense slot configuration
      (no commit info)

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
