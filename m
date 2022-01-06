Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF5E486B2D
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 21:30:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47EA11A92;
	Thu,  6 Jan 2022 21:29:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47EA11A92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641501011;
	bh=SgsF+l/cA4i/L9Wk/ynfwg0El2i53fgdAiPxfvplQ4U=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fh8qXs+VemqywUjLZ+4NV8f8lJd4tgV9qjR3Cxrc5ILn095vcGqaKGss1JhI/0lv2
	 +5PI3/7Qj5unD35cwJmbkZHBsCXMNIRi6y7WBjm7CkqXXdxCQAmcZjvoAYXxjBM7EG
	 i0RKz2hEMGaYui6wH6w3iXHhdHhlnHBR0WlOcVuU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6756DF804FB;
	Thu,  6 Jan 2022 21:28:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F07CF800AE; Thu,  6 Jan 2022 21:28:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18E5AF8007E
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 21:28:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18E5AF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Bf7cpvm+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 79336B823F4;
 Thu,  6 Jan 2022 20:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1ED5C36AE3;
 Thu,  6 Jan 2022 20:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641500892;
 bh=SgsF+l/cA4i/L9Wk/ynfwg0El2i53fgdAiPxfvplQ4U=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Bf7cpvm+hbslKnjwzt0nBlqo3mY+w1cTLa9Lf9cBlxiyuW05Sv8xXH5pIzatHVFWB
 N0vYJpUKuLT79Jrwrss8sBQEtGtbktTy7J78iGnvtW2nr8iTVckkq2zTNW7xwwERB/
 a3rGatlB7o+QjmKfO+ViMI2dMYXbXkEl4qU98NkTcTu8dL3a5FEGsvmZ4g2E914T7k
 14T6swDsRFXnTYuNK2BhkWhdFrsNLeHUmI+iR4EZUlwnGfJjVETOfxGgY4MZU1So/e
 08sb41KV+qQnULrvfHwrnDebBGQRmmVuRvs6GAbViychVOweVDaz+/U+fbpBoCmh9A
 t4Yco1SfPrUNg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>
In-Reply-To: <20220106110128.66049-1-hdegoede@redhat.com>
References: <20220106110128.66049-1-hdegoede@redhat.com>
Subject: Re: [PATCH v2 0/6] ASoC: rt5640: 1 Bugfix + Add support for external
 GPIO jack-detect
Message-Id: <164150089044.2243486.10555966903833009596.b4-ty@kernel.org>
Date: Thu, 06 Jan 2022 20:28:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 Bard Liao <bard.liao@intel.com>
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

On Thu, 6 Jan 2022 12:01:22 +0100, Hans de Goede wrote:
> Here is v2 of my series to fix jack-detect not working on some x86 Bay
> Trail devices. Now rebased on top of the latest broonie/sound.git/for-next.
> 
> New this version is a bug-fix for an issue which I noticed in the current
> broonie/sound.git/for-next (patch 1 of the series).
> 
> Since this fixes a NULL-ptr deref in current for-next patch 1 should be
> included into a pull-req for 5.17.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: rt5640: Fix possible NULL pointer deref on resume
      commit: a2d6d84db2e7bcc831aed90f33334c70a1b060a3
[2/6] ASoC: rt5640: Change jack_work to a delayed_work
      commit: a3b1aaf7aef9fa945810de3fd7c15b2e93ecdbfd
[3/6] ASoC: rt5640: Allow snd_soc_component_set_jack() to override the codec IRQ
      commit: b35a9ab4904973a68b4473c2985b8ac0b6d57089
[4/6] ASoC: rt5640: Add support for boards with an external jack-detect GPIO
      commit: 701d636a224a77a4371f57ca2d4322ab0401a866
[5/6] ASoC: Intel: bytcr_rt5640: Support retrieving the codec IRQ from the AMCR0F28 ACPI dev
      commit: 45ed0166c39f878162872babc88830d91426beb5
[6/6] ASoC: Intel: bytcr_rt5640: Add support for external GPIO jack-detect
      commit: 44125fd5315154c6b8326b5c27646af3b33ba25c

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
