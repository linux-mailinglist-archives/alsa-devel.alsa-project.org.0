Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D724BDA88
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Feb 2022 16:25:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78401172D;
	Mon, 21 Feb 2022 16:25:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78401172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645457154;
	bh=MW2Yg1Kfyp2Pc04JtrMTt1mmSjFcqsfeEWHrq1tp5ZI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sVD0jYvaP9l0AwfKo840tAhlz9omQ5T/w1UOR0lzmSKH5ss8flJ00uAhfa/NiR19g
	 mYEYSPwwS/5cfvkZESGn05ILHZEwH3WT3KIa6xQZ+bGA722MEzrhvQYf5oVhnUYDRB
	 DmhQ1ygRXsZfvTOdcYA7JDmQbcWfdzjMx4fWRU64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66C19F80516;
	Mon, 21 Feb 2022 16:24:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB08FF804AB; Mon, 21 Feb 2022 16:24:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 468FAF8013D;
 Mon, 21 Feb 2022 16:24:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 468FAF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MvuEPI44"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 17A1E611B7;
 Mon, 21 Feb 2022 15:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3748C340EC;
 Mon, 21 Feb 2022 15:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645457061;
 bh=MW2Yg1Kfyp2Pc04JtrMTt1mmSjFcqsfeEWHrq1tp5ZI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=MvuEPI44YNV4uqrNek4yRX2u1HAYJGNNWEu43R2dUulIfG5gN1QZHBsP6WqsvHAFT
 8Ae6IJu1Um68cL+p+W3fum2eTncELXcdvLN8/3sr0i2etvMD2EZ3nUMPgzfbUbGSpt
 gbDmLBI/LdEXPECp06YZqtHhaba3kvvc8wssvL30qVZGCow+zUFl3WjTY9qJFX0kT9
 CMjrBKeEc9MFXwOmCUA6fUpmXMbxcQqLqfzjBuGkCEvYsSO2mavrPu2hGDhQeVpVm0
 iYZunii92i7zNygEvuFNPbBEYtLL4Lyl+LhQthU3KHDHQmFbRoSPEASU/xcTLtJRfO
 3cvw6U0n1hzBQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Brent Lu <brent.lu@intel.com>
In-Reply-To: <20220221064005.1752500-1-brent.lu@intel.com>
References: <20220221064005.1752500-1-brent.lu@intel.com>
Subject: Re: [PATCH v2] ASoC: SOF: Intel: Add topology overwrite for Felwinter
Message-Id: <164545705858.730905.4275248547658138991.b4-ty@kernel.org>
Date: Mon, 21 Feb 2022 15:24:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

On Mon, 21 Feb 2022 14:40:05 +0800, Brent Lu wrote:
> From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> 
> The Felwinter uses four max98360a amplifiers on corresponding CH0~CH3.
> There are four amps on the board connecting to headphone to SSP0 port,
> amp to SSP1,and the DAI format would be DSP_A,8-slots, 32 bit slot-width.
> 
> CH0: L(Woofer), CH1:R(Woofer), CH2:L(Tweeter), CH3:R(Tweeter)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: Add topology overwrite for Felwinter
      commit: b9afe038b1fba24e815000606d5877de97f9f154

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
