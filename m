Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B544AF632
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Feb 2022 17:11:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E987A18E7;
	Wed,  9 Feb 2022 17:11:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E987A18E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644423111;
	bh=Pd5ENdUJjPtn9zv8DLTEuy3cHmpnTSelmY885a6/syw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uGbzf9sPJnEn3Moqfa6DhUdq3Lq8nR5bviIYvprJCdNcmGt5SveBL6vy5lYND21wq
	 tsf4xchS08KtgLpwYOPaeMhXAv7hjB8Sitr2Qxf6Y34C/sqmu/cpJQjGYPThlcbUM2
	 r7KJE9qLoyZGf4L3pVEixFu8NiQblsgfwCfx6Vuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4105F800A7;
	Wed,  9 Feb 2022 17:10:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA42BF804BB; Wed,  9 Feb 2022 17:10:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B536F8016E
 for <alsa-devel@alsa-project.org>; Wed,  9 Feb 2022 17:10:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B536F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="A4Iv6Zs2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5593861726;
 Wed,  9 Feb 2022 16:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025E7C340E7;
 Wed,  9 Feb 2022 16:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644423015;
 bh=Pd5ENdUJjPtn9zv8DLTEuy3cHmpnTSelmY885a6/syw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=A4Iv6Zs2JsxpwqtPrZ3WW8FT9Gc1tz52CZ7bjRUCKNGO4UCXYRZPL/hGfnTsnJJeR
 p01HmwlD2Gd6+7f5BTPk7+gRJmhApyvlhmwplMJ3TMpM0me03iahRY+jXrFYTPjW/e
 G1VzKCJanTaDHiMU7KbzUTvBG62GwCWaBRQm6waW8ITWlIR+ApxgMrH/n82ce0WIky
 tTnANw7polprj8SgKhuQZxYEiRMaulPhFxjM+FndmsFmZnq73RN72MB1+wUyyNcuHH
 ejfcr1KNbvsubecHcTZjQkK1Q2yBca3CwUeocFTOHEGBgtB7YJuQ5Qgwzb5U3dYKzl
 /TfSiqjFwy4HQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20220209063104.9971-1-peter.ujfalusi@linux.intel.com>
References: <20220209063104.9971-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hdac_ext_stream: consistent prefixes
 for variables/members
Message-Id: <164442301372.4135858.7800075229275337459.b4-ty@kernel.org>
Date: Wed, 09 Feb 2022 16:10:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 rander.wang@intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
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

On Wed, 9 Feb 2022 08:31:04 +0200, Peter Ujfalusi wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> The existing code maximizes confusion by using 'stream' and 'hstream'
> variables of different types, e.g:
> 
> struct hdac_stream *stream;
> struct hdac_ext_stream *stream;
> struct hdac_stream *hstream;
> struct hdac_ext_stream *hstream;
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hdac_ext_stream: consistent prefixes for variables/members
      commit: 7d88b9608142f95ccdd3dfb190da4a5faddb1cc7

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
