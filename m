Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DE64767E2
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 03:23:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1080D1AC5;
	Thu, 16 Dec 2021 03:22:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1080D1AC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639621384;
	bh=IC1GmsHVlaBslpmNRGHGSTI7dGE+NQ0RA6/GPhU5HpE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rb1r4QoL39C3OGaLd4FIVfAqbGdG0ScRMFFNcx1ccOvHtn1VgJIEGd/KoRENo21Dq
	 k4qx2Q6IXmyphJPRzEcWa8A6gq/Ood7ZXjtkDpytLBMeR4fx2YJbp9jER0e5ISZnGZ
	 M7SYeEms7YhtB6cgdSPfX2vkCMkMkeOjvD4rSzM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C0F0F80237;
	Thu, 16 Dec 2021 03:21:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1636AF800B0; Thu, 16 Dec 2021 03:21:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DCBAF801F5
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 03:21:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DCBAF801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gkJ0eF1b"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 42EF9CE1FC4;
 Thu, 16 Dec 2021 02:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DEA9C36AE1;
 Thu, 16 Dec 2021 02:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639621270;
 bh=IC1GmsHVlaBslpmNRGHGSTI7dGE+NQ0RA6/GPhU5HpE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gkJ0eF1bIE4GB3D9Esh4pclGfdKyz1OuA39uDgkP6hn+7Ip27nsN2DKj00YUxASgK
 phB23/xjxkjj27RrFIVCbfLw9gndRKtOnusJbgzumn2RAHR8ynltLJCSAvV6UriDIf
 XmqDF6y+/Mbd2Om/OiTPWOxvVg+vVJj20bkVON4HsIfzREZKaEXLzjsV+Zd4zXfmRM
 YcdSygn4eFvT/VDbNuRMwewZdsZqBhyOpz9I+nE4NhpoxwDn3Z491Tarm69v59oj2q
 EUpSnF/FovKeQvq5Sl6qObg4UvkwzqqWIVJf8c+Hi3ulnjlE5nOZJnjGYkc6IhmRgK
 zsgmvdfQkm0Bg==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20211215163511.151286-1-pierre-louis.bossart@linux.intel.com>
References: <20211215163511.151286-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: AMD: fix depend/select mistake on SND_AMD_ACP_CONFIG
Message-Id: <163962126800.2075333.1073332476640498348.b4-ty@kernel.org>
Date: Thu, 16 Dec 2021 02:21:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Randy Dunlap <rdunlap@infradead.org>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Ranjani Sridharan <ranjani.sridharan@intel.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
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

On Wed, 15 Dec 2021 10:35:11 -0600, Pierre-Louis Bossart wrote:
> on i386 or x86_64:
> 
> when # CONFIG_ACPI is not set,
> so SND_SOC_ACPI is not set:
> 
> WARNING: unmet direct dependencies detected for SND_AMD_ACP_CONFIG
>   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] &&
>   SND_SOC_ACPI [=n]
>   Selected by [y]:
>   - SND_SOC_AMD_ACP_COMMON [=y] && SOUND [=y] && !UML && SND [=y] &&
>   SND_SOC [=y] && X86 [=y] && PCI [=y]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: AMD: fix depend/select mistake on SND_AMD_ACP_CONFIG
      commit: fb6c83cab376c0963341a9521e85c1795acaec9b

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
