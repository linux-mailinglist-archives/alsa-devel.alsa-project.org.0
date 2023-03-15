Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A79D36BB466
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 14:21:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AED351266;
	Wed, 15 Mar 2023 14:20:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AED351266
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678886486;
	bh=PK1O3y9+r1puzLG20UwgRR1S6gFSsEgasvLF9x6/5NY=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W9MHkyUttmP2pSqOiNkJYdeayK4buBHb1aX8fjrpyZ3DyPoiwal9uNc2P3kN9NGEB
	 IhtBK/acOhfEBi5L02i58XlKjhz8T7CZnt6qlTAwn2BgOutsRM8xMIlBHbhZrJjduf
	 Q6Za44x/Nt16bbOw7UZVsoxnQ0H2cfjN1xzhnbrk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37995F80527;
	Wed, 15 Mar 2023 14:19:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17AECF80423; Wed, 15 Mar 2023 14:19:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12FEDF8032D
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 14:19:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12FEDF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SGJDQiCp
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3731861D5E;
	Wed, 15 Mar 2023 13:19:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19EF7C4339B;
	Wed, 15 Mar 2023 13:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678886370;
	bh=PK1O3y9+r1puzLG20UwgRR1S6gFSsEgasvLF9x6/5NY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SGJDQiCpfkjYDWVKIBsO0J50So8Ary9yLv5FfMndcD/tvAGNjnfSuHtLQ+rOeQc3h
	 4g0WgVsV2XFQANFJnqOnwWZiSkpX3ERrw+oz5LplzMPd2wJ2m2e/LO4uLRY9DfaLDy
	 f4uNKdRjtj2VuNqO9svQPOndXjjk++gq3XQjxnUcOWnUdbfoRWiUnDwvaSsmhbO8UX
	 dLU97k3za/WV6V21yR2gbuceTE14TDCFUrj0/+MAT1I+5HXTp9oE6boCCbHKbkJPlH
	 E6XSreONM40bx/RiK4+X2pg3JipvlFv89VpF49CxIv8YeAlMUqD3gdwBWwOkJzpfN/
	 pecZNu0zBrXkA==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v8je64dh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v8je64dh.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-pcm.c: remove indirect runtime copy
Message-Id: <167888636983.25434.15496395610678093750.b4-ty@kernel.org>
Date: Wed, 15 Mar 2023 13:19:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: CF2DR4WTQ7YRAE7G3ELXEG6ZOD22JOM6
X-Message-ID-Hash: CF2DR4WTQ7YRAE7G3ELXEG6ZOD22JOM6
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CF2DR4WTQ7YRAE7G3ELXEG6ZOD22JOM6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 06 Mar 2023 01:43:54 +0000, Kuninori Morimoto wrote:
> substream->runtime will be attached when substream was opened
> at snd_pcm_attach_substream(). When it uses DPCM,
> FE substream->runtime is attached, but BE substream->runtime is not.
> Thus, we are copying FE substream->runtime to BE.
> 
> But, we are copyig FE substream->runtime to FE dpcm->runtime first (A),
> and copy it to BE dpcm->runtime (B), and copy it to
> BE substream->runtime (C).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm.c: remove indirect runtime copy
      commit: 0d3a5178c2994eaf91ad135816a79138055b394a

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

