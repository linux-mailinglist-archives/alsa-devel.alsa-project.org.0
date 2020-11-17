Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FC02B71C3
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 23:41:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7506E17CC;
	Tue, 17 Nov 2020 23:40:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7506E17CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605652882;
	bh=VmnNW11IpNcYjP7v4gnTxb4aMYjRyWugf3f+TWyC6Sk=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bCUQrbDLq034zVKT9y4WdjSRm5Jotipo3OKQbx+TwQ0gjQV9QzOLqf6ayUrz2fc/s
	 lF6C5ATkh/AHeC0Kpmlyg3DM3OK50d3rM+HlyUYZTGyyBwnegIcoe+XU713VM7Ifgo
	 JfmFswcFOC3WW0FhSzIJ7Sbxgxj873apPq98jXLk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9A5AF804E2;
	Tue, 17 Nov 2020 23:38:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82820F804E1; Tue, 17 Nov 2020 23:38:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FEABF804DF
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 23:38:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FEABF804DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sX3AUEI4"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CB8F820709;
 Tue, 17 Nov 2020 22:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605652700;
 bh=VmnNW11IpNcYjP7v4gnTxb4aMYjRyWugf3f+TWyC6Sk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=sX3AUEI4QAN1gQoO25dLMALQ+ct7FupUG62S26KCv7gxvzEcQhZ/8aetnl4Xhy1ei
 94reH1+3EUKvHgLSvCLeC0ud79b6LNeHPFZPKsUjApm1xt3CHks+YZoTQt9sJ1YIqw
 j66YlAl9IeXgY2TOXnnscfeBgPaJuW6RkBr9/YB8=
Date: Tue, 17 Nov 2020 22:38:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sia Jee Heng <jee.heng.sia@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
In-Reply-To: <20201110145001.3280479-1-geert+renesas@glider.be>
References: <20201110145001.3280479-1-geert+renesas@glider.be>
Subject: Re: [PATCH] ASoC: intel: SND_SOC_INTEL_KEEMBAY should depend on
 ARCH_KEEMBAY
Message-Id: <160565265703.23689.2267658300131565861.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On Tue, 10 Nov 2020 15:50:01 +0100, Geert Uytterhoeven wrote:
> The Intel Keem Bay audio module is only present on Intel Keem Bay SoCs.
> Hence add a dependency on ARCH_KEEMBAY, to prevent asking the user about
> this driver when configuring a kernel without Intel Keem Bay platform
> support.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: intel: SND_SOC_INTEL_KEEMBAY should depend on ARCH_KEEMBAY
      commit: 9a207228bdf0a4933b794c944d7111564353ea94

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
