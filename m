Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 412E645FAC9
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Nov 2021 02:31:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAE4E172E;
	Sat, 27 Nov 2021 02:30:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAE4E172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637976690;
	bh=d0ToXu1WBChqHvu9+4OZzoQe9orIt4eiwbLLvSBzF+E=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DSVhNFiZYLhlHQrwT+qine3ju8/gvC5CggHC/7Vh/Rfk++v8FDyaibXkTHmQRIrIf
	 D+jqj2FEreid+/KTAFtX/jxYnL6e4F76PJwDftRZgDQ2iVNf7zL2tIboOCcI0Yi1mW
	 z6DzNtg9r3MWfbxtBIzGbQ+lCjWyi7RkDlnp+eGQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 001CFF804AD;
	Sat, 27 Nov 2021 02:29:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB741F8032D; Sat, 27 Nov 2021 02:29:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7434F80166
 for <alsa-devel@alsa-project.org>; Sat, 27 Nov 2021 02:29:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7434F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="S5EvW7g6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 901EAB829B5;
 Sat, 27 Nov 2021 01:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD02C53FAD;
 Sat, 27 Nov 2021 01:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637976582;
 bh=d0ToXu1WBChqHvu9+4OZzoQe9orIt4eiwbLLvSBzF+E=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=S5EvW7g6WUZH6Ic/KEx7G5fYadnBsky+M02m4yMAzzMQ8VOQ0Z3RvAo3VUqjod71y
 V1/V2hv3A1rFfU4fOLWEsD6y9J0b2RMynwL+lLKK53fFOD7CGRZ8z39K0hTjb1gdy7
 sA4urY8iggO3Z6Qbo19X8FwELQXrmMPD55R4F7BRa0hOX6HZyhHiSxEKMjBvr3flnS
 LqLJZJUwec8V+3aXFmCpyPK/jpMLtlFF1/MzM91OZj1AVEAujXBoQTwzmfHzw/nSzK
 XjkcrW17RiEUerSRHKjPnFfHETPYyz3UFbjAEJeliMQGtDm2YP6uiBqHeYZnBmNWGa
 FVIm5XdZ9iR2g==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Rob Clark <robdclark@gmail.com>
In-Reply-To: <20211118010453.843286-1-robdclark@gmail.com>
References: <20211118010453.843286-1-robdclark@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: rt5682: Fix crash due to out of scope stack vars
Message-Id: <163797657977.2987896.13648492713075934799.b4-ty@kernel.org>
Date: Sat, 27 Nov 2021 01:29:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Rob Clark <robdclark@chromium.org>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Derek Fang <derek.fang@realtek.com>
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

On Wed, 17 Nov 2021 17:04:52 -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Move the declaration of temporary arrays to somewhere that won't go out
> of scope before the devm_clk_hw_register() call, lest we be at the whim
> of the compiler for whether those stack variables get overwritten.
> 
> Fixes a crash seen with gcc version 11.2.1 20210728 (Red Hat 11.2.1-1)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/2] ASoC: rt5682: Fix crash due to out of scope stack vars
      commit: 4999d703c0e66f9f196b6edc0b8fdeca8846b8b6
[2/2] ASoC: rt5682s: Fix crash due to out of scope stack vars
      commit: 750dc2f622192c08664a15413bc9746d9cbc4361

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
