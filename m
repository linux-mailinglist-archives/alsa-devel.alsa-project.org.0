Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A1B2B9901
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 18:12:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E70A1734;
	Thu, 19 Nov 2020 18:12:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E70A1734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605805974;
	bh=86qfnDFMTT9hP0o0zpA6D9vleLa5k1tewm96PFX3roU=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qb0PD0khmHDlo3zlsm/aJ1CGi7LAu7jw5yGy3+Xc2gSwn5bWafdwuVTRiK02bjXgk
	 Zx5JQL1/051OBxHwFbYC2QNq7CCuU8qyh+YQ04Zr+ZtZYgll19tTAdJphpvJ72xy9Y
	 zL8+10pSMhs/W54Y0b3S4aikVaOBsBEHwt7x1o34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97987F804E7;
	Thu, 19 Nov 2020 18:09:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55588F804E6; Thu, 19 Nov 2020 18:09:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8A82F804E2
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 18:09:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8A82F804E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DwCt8Ho3"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 809292469D;
 Thu, 19 Nov 2020 17:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605805783;
 bh=86qfnDFMTT9hP0o0zpA6D9vleLa5k1tewm96PFX3roU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=DwCt8Ho34QLads+1GICwsNsO6200j5HHVQDU8yfZc3oQVzKREnR4D+r8MU8vRhO4H
 yRChOxvbm8okFVPsRb5dNLxLgnS0bUNDKqLaW8JB0+qc7NdN5qG3D/OhS6paY4kzT1
 QjnRcMOuTbrM90aGqOIcp+zqgZff44yWbwQyhC1o=
Date: Thu, 19 Nov 2020 17:09:22 +0000
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20201118140545.2138895-1-kai.vehmanen@linux.intel.com>
References: <20201118140545.2138895-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: relax PCM period and buffer size
 constraints
Message-Id: <160580573379.54454.332087937530881299.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, daniel.baluta@nxp.com,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com
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

On Wed, 18 Nov 2020 16:05:44 +0200, Kai Vehmanen wrote:
> Current SOF implementation limits period and buffer sizes to multiples
> of period_min. Period_min is defined in topology, but is in practise set
> to align with the SOF DSP timer tick (typically 1ms).
> 
> While this approach helps user-space to avoid period sizes, which are
> not aligned to the DSP timer tick, it causes problems to applications
> which want to align data processing size to that of ALSA period size.
> One example is JACK audio server, which limits period sizes to power of
> two values.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: relax PCM period and buffer size constraints
      commit: 9983ac49b7db34258facf47439463e96522e1d5a
[2/2] ASoC: SOF: Intel: add hw specific PCM constraints
      commit: caebea04b9125c677e6e747793fbc7fab077727b

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
