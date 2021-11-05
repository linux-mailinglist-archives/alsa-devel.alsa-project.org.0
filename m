Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2624C4465A6
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Nov 2021 16:24:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A413C1688;
	Fri,  5 Nov 2021 16:23:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A413C1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636125842;
	bh=r1em5whzUFSTJ3MHveCEMa0RpNDStYYTVGiPZHyy4h8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=npjDmTMJU/l+vrS6mYTfI8Fd3otA871Xe6FzcseNVY7iWqADauSmgyvRBhg61uYch
	 6DBqZ+6zQmyo5LDq7RQauL+AKYplJlmM6yH7rGUOUEMRhVa1SPDAm3TIoDcLaTEB5Y
	 WCFkrC99xBNaicuSjtXcdqhNaU+AbsO8A8wddgms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A9D9F80269;
	Fri,  5 Nov 2021 16:22:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C41CF8026A; Fri,  5 Nov 2021 16:22:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFAB9F80148
 for <alsa-devel@alsa-project.org>; Fri,  5 Nov 2021 16:22:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFAB9F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="upZaa5va"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FA5661037;
 Fri,  5 Nov 2021 15:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636125758;
 bh=r1em5whzUFSTJ3MHveCEMa0RpNDStYYTVGiPZHyy4h8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=upZaa5vaA6U6lkdLW+ylUC5NtIFAuwZyB0wPFdH/wh3dUIkB0XGou3GD0OyJE3arw
 1T+moTAkxjtnK+0xIolVoQfhOZtSFqHCfNTyNqpaHzhijh67Lkcl91IXs0Jwf5Mt5s
 Jzk+rZ2jKRwPvfEe9uwwNqRPWlZ+j/ekrmO/IPvdRLrUDT5OcZI3TZS1bMUFJW7LEV
 G/EpBfPGKutxYwczvTcepLaJvLRCBW44tl0OAB6lKY0Ff5vWdepXuHvQyHm6Ha7ls1
 NfG4u818/ZuCvblPIxUvFnWPq3XXSj4cbmnR1Q0nmikLck/Er3bX/HzTbkkXsOdSGS
 YoYMH9cy18dSg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20211105111655.668777-1-kai.vehmanen@linux.intel.com>
References: <20211105111655.668777-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: fix hotplug when only codec is
 suspended
Message-Id: <163612575637.951053.11162596648833557009.b4-ty@kernel.org>
Date: Fri, 05 Nov 2021 15:22:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: yung-chuan.liao@linux.intel.com, Péter Ujfalusi <peter.ujfalusi@linux.intel.com>, pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, Hui Wang <hui.wang@canonical.com>, ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

On Fri, 5 Nov 2021 13:16:55 +0200, Kai Vehmanen wrote:
> If codec is in runtime suspend, but controller is not, hotplug events
> are missed as the codec has no way to alert the controller. Problem does
> not occur if both controller and codec are active, or when both are
> suspended.
> 
> An easy way to reproduce is to play an audio stream on one codec (e.g.
> to HDMI/DP display codec), wait for other HDA codec to go to runtime
> suspend, and then plug in a headset to the suspended codec. The jack
> event is not reported correctly in this case. Another way to reproduce
> is to force controller to stay active with
> "snd_sof_pci.sof_pci_debug=0x1"
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: SOF: Intel: hda: fix hotplug when only codec is suspended
      commit: fd572393baf0350835e8d822db588f679dc7bcb8

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
