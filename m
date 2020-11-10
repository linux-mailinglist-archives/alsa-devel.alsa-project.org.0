Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E638D2AE1EA
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 22:40:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7460A1729;
	Tue, 10 Nov 2020 22:39:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7460A1729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605044416;
	bh=2QfsYMTIGqExf5FNUHJ1un67gfZSsrKQPoWVhdIAHqk=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C6YCrjFT2uuykCb94PCkg+VGi0uszuVVeyyJDewuEGNX8zXu2/mh+cJe9vCmAZN/W
	 5tXK9OZcUSVU/psTFuh6Q0JHF/g4uJRdRTNZLepBYMmuSot+YIwY3gJiFIKyK2aQ00
	 hPQe9/yp1U0l7JVlUui80tCpj5MKNkBSkXWablMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87F0EF802C4;
	Tue, 10 Nov 2020 22:38:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36A0AF801D5; Tue, 10 Nov 2020 22:38:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE041F800AE
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 22:38:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE041F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ahh06S4Z"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2678B20797;
 Tue, 10 Nov 2020 21:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605044303;
 bh=2QfsYMTIGqExf5FNUHJ1un67gfZSsrKQPoWVhdIAHqk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ahh06S4Z3wkwZo6EIiwVGN+Ce0SFmInaxqHOerbq2kKutFpkbJ+9Oul/50G+wurdI
 R2giXYHGmmyiXsenxUu4Dxl7T2AoNwhyww7zufS0QCm/IWWYs2Sog4rjIt8RIorvGr
 nBzR+4yxjyd/SGtvJZjMWiefyVrPDODpEcFl84F4=
Date: Tue, 10 Nov 2020 21:38:09 +0000
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 kuninori.morimoto.gx@renesas.com, perex@perex.cz,
 Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <1604329814-24779-1-git-send-email-spujar@nvidia.com>
References: <1604329814-24779-1-git-send-email-spujar@nvidia.com>
Subject: Re: [PATCH v5 0/7] Audio Graph Updates
Message-Id: <160504428418.41991.4621142388350710965.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, sharadg@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
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

On Mon, 2 Nov 2020 20:40:07 +0530, Sameer Pujar wrote:
> This series is a prepraration for using generic graph driver for Tegra210
> audio. Tegra audio graph series will be sent in a separate series because
> it has some dependency over other series for documentation work. This
> series can focus on the generic ASoC driver updates. Below are the summary
> of changes done.
> 
>  * Support multiple instances of a component. For example there can be
>    multiple I2S devices which can use the same component driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: soc-core: Fix component name_prefix parsing
      commit: 3256ef984b016fc8491f34cad594168b4b500317
[2/7] ASoC: soc-pcm: Get all BEs along DAPM path
      commit: aa293777bfeb75fb8872565ef99cc0e8b98b5c7d
[3/7] ASoC: audio-graph: Use of_node and DAI for DPCM DAI link names
      commit: e6aeb375d25dba56c4089b1d6aa0a77fe218ef3b
[4/7] ASoC: audio-graph: Identify 'no_pcm' DAI links for DPCM
      commit: c21cbb526c0a105d582299839a9c4244dd6bf38a
[5/7] ASoC: audio-graph: Support empty Codec endpoint
      commit: 930dd47d74023e7c94a7c256279e12924c14475d
[6/7] ASoC: audio-graph: Expose new members for asoc_simple_priv
      commit: d09c774f2f9ff25817866b70f1fb9603e5196971
[7/7] ASoC: audio-graph: Expose helpers from audio graph
      commit: e32b100bc6ecbc390aae728fc7d2a3e247faa8a7

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
