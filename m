Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BE132C62E
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Mar 2021 02:02:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 997521ACF;
	Thu,  4 Mar 2021 02:01:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 997521ACF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614819721;
	bh=qTBNYYko//rWYlmfxcfRk3TNgJOLDbs/bmkNbIqT92M=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XmOVSvra7pSL1qcfWDN1atUG+/5JJVn+S44QkNOzRbsLHz/6Y7Vyc3Ssiu1+6qtdW
	 9wAHtG7goMvUG1g6LpJ/8p7kCZxs6C262dTHxioz3vvbVa8d3MnXknWTiE6mCrP01L
	 efVeL0/bwYinTrioaRH+IfTeWPDWbHmAaAm/m0+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F680F80508;
	Thu,  4 Mar 2021 01:56:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82EF8F80508; Thu,  4 Mar 2021 01:56:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3048F80506
 for <alsa-devel@alsa-project.org>; Thu,  4 Mar 2021 01:56:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3048F80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VAZTFf+N"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DFE3064EA4;
 Thu,  4 Mar 2021 00:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614819385;
 bh=qTBNYYko//rWYlmfxcfRk3TNgJOLDbs/bmkNbIqT92M=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=VAZTFf+NP2cmInZ97lXLsRFZJ+HbExXyQDf6NRd5ueR5PBDkaZ8PyslIeNv6HUQ24
 mH0G+94vpW0bMB3jngU7RykvIZ65hMS4+Y/LRtuMZpWcIs/0G4lKYaxgCiX67myvMN
 Axk1xoZZ62UW21yx5mdgf4PoU0ISTUKH0+LBxnrYPosCUqVcDHI0JpV592GZU7YRCE
 BWlRkxyLe5aj492SogAp5Hg6u4pTvlN8svtQpCQALcdHfIH19axjgT6g/Ksc9iJbji
 mhTAZX+WIWrsGQqJYH3H/ELo1qm5t+OTAY2YEnx4Ka2O5hLqaUci1DFXunI3Uy6itz
 IfiTpczSRzSFw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jon Hunter <jonathanh@nvidia.com>,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20210303115526.419458-1-jonathanh@nvidia.com>
References: <20210303115526.419458-1-jonathanh@nvidia.com>
Subject: Re: [PATCH V2] ASoC: soc-core: Prevent warning if no DMI table is
 present
Message-Id: <161481924071.9553.11233788630691178743.b4-ty@kernel.org>
Date: Thu, 04 Mar 2021 00:54:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Wed, 3 Mar 2021 11:55:26 +0000, Jon Hunter wrote:
> Many systems do not use ACPI and hence do not provide a DMI table. On
> non-ACPI systems a warning, such as the following, is printed on boot.
> 
>  WARNING KERN tegra-audio-graph-card sound: ASoC: no DMI vendor name!
> 
> The variable 'dmi_available' is not exported and so currently cannot be
> used by kernel modules without adding an accessor. However, it is
> possible to use the function is_acpi_device_node() to determine if the
> sound card is an ACPI device and hence indicate if we expect a DMI table
> to be present. Therefore, call is_acpi_device_node() to see if we are
> using ACPI and only parse the DMI table if we are booting with ACPI.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-core: Prevent warning if no DMI table is present
      commit: c014170408bcd2e8fc726802ed16794d358742ff

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
