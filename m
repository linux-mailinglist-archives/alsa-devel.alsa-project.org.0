Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 198671E112F
	for <lists+alsa-devel@lfdr.de>; Mon, 25 May 2020 17:00:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA7B6173E;
	Mon, 25 May 2020 16:59:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA7B6173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590418832;
	bh=8WVLyXr0Odhzbow2buRRMTNNClxPsS9poOAULwszdI8=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JOB7C9labl1mF4rErZFP88o9urrBVtuQor4WYX29tq2ui8AjecoED3L4X48JcyXHq
	 vf5HeYveaxj4SYOs9ssUh74Bp8D5Uqg7iSlkOt/fe8dIwmmPDlfhaEoPZ95DyfmdeL
	 Jjmcw0TGxVPA37tsESQImv02TMQeolxE4jPKrXKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9B29F8029A;
	Mon, 25 May 2020 16:57:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89F21F802A7; Mon, 25 May 2020 16:57:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA40CF8029A
 for <alsa-devel@alsa-project.org>; Mon, 25 May 2020 16:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA40CF8029A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Mv0X+lME"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AA1EE20888;
 Mon, 25 May 2020 14:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590418637;
 bh=8WVLyXr0Odhzbow2buRRMTNNClxPsS9poOAULwszdI8=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Mv0X+lMEX/4sKlmT8Oq8axAWmCWw9vrtKPhZe8rBpeouyRAyK1PtLK1la/Ni5ihcE
 C68VtPIl4/tu1DZ3lwzEuBqJcwzPPJdw8roWBj5ktAtHrkXV4RdBotNrXW/WaWPUjd
 AFSb/MGSq3hg0/jWg6uDzNGjJ9jV9bpqisZAklNs=
Date: Mon, 25 May 2020 15:57:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Xiubo.Lee@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 lgirdwood@gmail.com, festevam@gmail.com, timur@kernel.org, perex@perex.cz,
 alsa-devel@alsa-project.org, nicoleotsuka@gmail.com, tiwai@suse.com
In-Reply-To: <1590397412-12966-1-git-send-email-shengjiu.wang@nxp.com>
References: <1590397412-12966-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: Fix -Wmissing-prototypes warning
Message-Id: <159041861696.1370.8723738708251102724.b4-ty@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Mon, 25 May 2020 17:03:32 +0800, Shengjiu Wang wrote:
> COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64
> 
> sound/soc/fsl/fsl_asrc.c:557:18: warning: no previous prototype for function 'fsl_asrc_get_dma_channel' [-Wmissing-prototypes]
> struct dma_chan *fsl_asrc_get_dma_channel(struct fsl_asrc_pair *pair, bool dir)
>                  ^
> sound/soc/fsl/fsl_asrc.c:557:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
> struct dma_chan *fsl_asrc_get_dma_channel(struct fsl_asrc_pair *pair, bool dir)
> ^
> static

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_asrc: Fix -Wmissing-prototypes warning
      commit: cff1f8b4f8e119a9dbd9872d7a04fedef8d0c1a2

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
