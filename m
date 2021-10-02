Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B507C41F8B4
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Oct 2021 02:20:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E441170F;
	Sat,  2 Oct 2021 02:19:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E441170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633134048;
	bh=kcJKuC0wkvfILqJ9qCwz2Ct/sDna6hfeZwqpy5GIkao=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aH64TYSoLeckAB/mYXGARpXiywOLZqXMF0ATDpcPDxoLvGtn54pniFYEhMs9I/alh
	 ljm2jofNwblfsv7beaM2ebE90XKcgoQU9PfdI6a9hyh5pKU0dDY508gLYqXAueXSiE
	 XczvqGhziH7CFJqAacUOf0qzQ9r07iepagaFJfKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CD8DF8051A;
	Sat,  2 Oct 2021 02:17:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7134F80518; Sat,  2 Oct 2021 02:17:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8621DF804FD
 for <alsa-devel@alsa-project.org>; Sat,  2 Oct 2021 02:17:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8621DF804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hIYJ7rVW"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57C8561A50;
 Sat,  2 Oct 2021 00:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633133831;
 bh=kcJKuC0wkvfILqJ9qCwz2Ct/sDna6hfeZwqpy5GIkao=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hIYJ7rVWkNABVcCbGiHIsO+b18+sNtUvD/mG8R7uv9KMIdo9ntAw+DW5vJlNBaIBZ
 KZtCyzdd4AQBG9Sa/OHPAnPdZ/wycdqi+XNwgBdvBn4wQG7Bwt9exO5qs52pJd45D1
 1pPYvbmzR6b9R0Y3WAOGq76kFQnIp57D3JZZLEfNcUiEGZSLBxLai3+oCAfWT82OOY
 d5uDt+NQv/SGN2hwSDtzzLMtNJLhhnacxNmGkCh0CkbM74TZ8NDIWNzXtckzE86zSS
 IP7HNe2E7Ox07Sf/MYQbUPKI6LKvaydplKZvRaUhnZX7AVjdCs6BznzLdFqAMaOuAW
 UAY0Chk4DRLTg==
From: Mark Brown <broonie@kernel.org>
To: festevam@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 perex@perex.cz, timur@kernel.org, Xiubo.Lee@gmail.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, nicoleotsuka@gmail.com
Subject: Re: [PATCH] ASoC: fsl_spdif: implement bypass mode from in to out
Date: Sat,  2 Oct 2021 01:16:34 +0100
Message-Id: <163313339132.45396.13488907784155100500.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1632649760-1651-1-git-send-email-shengjiu.wang@nxp.com>
References: <1632649760-1651-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org,
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

On Sun, 26 Sep 2021 17:49:20 +0800, Shengjiu Wang wrote:
> From: Viorel Suman <viorel.suman@nxp.com>
> 
> Implement SPDIF bypass mode. It implies internal SoC
> routing of SPDIF input signal to SPDIF output signal. The
> test bed requires two boards: B1 configured in bypass mode,
> and B2 to feed B1 SPDIF RX port and read B1 SPDIF TX port:
>    B2 TX -> B1 RX,
>    B2 RX <- B1 TX.
> The test procedure:
>  a) Boot both boards
>  b) B2: start "arecord <spdifcard> -r 48kHz | aplay <local DAC>"
>  c) B2: start "aplay <spdifcard> -r 48kHz <2ch 48kHz audio file>"
>  d) B1: enable bypass mode:
> 	amixer -cimxspdif cset numid=8,iface=PCM,name='Bypass Mode' on
>  e) B2: check DAC audio, make sure the same sample rate is used at
> 	steps b) and c), in example above the rate is 48kHz.
>  f) B1: try to run "aplay" or "arecord" on imxspdif card while in
> 	bypass mode - both must fail until bypass mode is disabled
>  g) B1: disable bypass mode:
> 	amixer -cimxspdif cset numid=8,iface=PCM,name='Bypass Mode' off
>  h) B1: check the usual playback and capture on imxspdif card.
> 	During this test try to set bypass mode - must not be allowed
> 	while playback or capture is running.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_spdif: implement bypass mode from in to out
      commit: 83bea088f976a289bc2efe4e404af47ab79d6639

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
