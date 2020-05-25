Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D1D1E1132
	for <lists+alsa-devel@lfdr.de>; Mon, 25 May 2020 17:01:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE74016DA;
	Mon, 25 May 2020 17:01:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE74016DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590418915;
	bh=8j51kK8u7Q0f/pNDsQoq3sxz4kUuPW/Z5+57Ri4ec6I=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oHdJQTqNHYtdOeGiwjGBVwMWjbQEERlqI3WDtag3gHZNZITOFMPuMEgy7uXCWa1ea
	 E4apzYNULoP1WMy5v+pQmPo8aIMPJL10gm5Iqls0y0cDj6YqdiLQOPKe9BTjzd8M2v
	 rxwJunv1xPDn1pZOX9A/umcTzaWE/sBS8441BRdI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9128F802DB;
	Mon, 25 May 2020 16:57:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B870FF802D2; Mon, 25 May 2020 16:57:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5990EF802A9
 for <alsa-devel@alsa-project.org>; Mon, 25 May 2020 16:57:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5990EF802A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qPMvZuoS"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 504F120899;
 Mon, 25 May 2020 14:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590418648;
 bh=8j51kK8u7Q0f/pNDsQoq3sxz4kUuPW/Z5+57Ri4ec6I=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=qPMvZuoSYCgE2OHOzDU7MdLqSYagwXd4J4MFXpm44PR5jfpolLDefkxw0e2+X8YWr
 LOqJXjRsOBP+DJ8U1pO8BgcZ+ZZX10m4jJyi3DKUI/tHC5mCZHaPsa4/MI01bJmrb2
 +SJEiIXHTNiBgczkkqxJc9Mud9giLSSHUgAOCvrE=
Date: Mon, 25 May 2020 15:57:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87367o4ysz.wl-kuninori.morimoto.gx@renesas.com>
References: <87367o4ysz.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v4 0/7] ASoC: add soc-link
Message-Id: <159041861696.1370.2546270776221948194.b4-ty@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On 25 May 2020 09:56:44 +0900, Kuninori Morimoto wrote:
> Current ALSA SoC is handling dai_link related operation,
> but it is implmemented directly without using function/macro,
> and at random place.
> 
> This v4 patch-set creates new snd_soc_link_xxx() functions
> which handles dai_link related operation,
> and implmement these at new soc-link.c.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: add soc-link.c
      commit: 02e756363fc936917bed7320199c80729b2a825c
[2/7] ASoC: soc-link: move soc_rtd_xxx()
      commit: a5e6c1090001b8a14e797364dde7c84236465fc7
[3/7] ASoC: soc-link: remove unneeded parameter from snd_soc_link_xxx()
      commit: 7cf3c5b4a04f4b27d964089630290beccc115f9f
[4/7] ASoC: soc-link: add snd_soc_link_be_hw_params_fixup()
      commit: 0cbbf8a0399518e5b865f9a1320d704c1d621703
[5/7] ASoC: soc-link: add snd_soc_link_compr_startup()
      commit: 9ab711cb84d4b77fb3929fabc5e3756d5010af14
[6/7] ASoC: soc-link: add snd_soc_link_compr_shutdown()
      commit: 0e532c99b468d6e4fc4e1d29b45ffe2749db6d07
[7/7] ASoC: soc-link: add snd_soc_link_compr_set_params()
      commit: eab810f37ff5fd76172ac903e5e732d6b72fc834

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
