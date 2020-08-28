Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E3A256040
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 20:06:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 086DD18C5;
	Fri, 28 Aug 2020 20:05:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 086DD18C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598637997;
	bh=frjSPFJ+75o4QdoDtU1nI4HxnaQxhFcRXTKiq6ZSpg8=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ftUC6qgMcMQsFF/eZjIHUZAMeSzEzjPqhkZwT1w05A7Z2ow77LbeJthbrtbk6DSYU
	 SWW9YKBEo2xHM8Que8ChLhBjnPivZbxm1RitcOxS9jSddTr9HLgiTCxPPE872NJIMM
	 pDpj9nKA4sAwX56hJ+TBxk/mAZ1DADFjH/sH+H+U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43D07F801D9;
	Fri, 28 Aug 2020 20:04:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30B52F8016F; Fri, 28 Aug 2020 20:04:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6DF0F80118
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 20:04:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6DF0F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nVnAVtK6"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B06E20936;
 Fri, 28 Aug 2020 18:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598637882;
 bh=frjSPFJ+75o4QdoDtU1nI4HxnaQxhFcRXTKiq6ZSpg8=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=nVnAVtK6fs7r+1K5wDFx9R1apyIw853o9edYRooJ1u6l/v7NEn6wMK50EbnHrsF90
 twOiHIeb288j343Rjyd/YK9IKCRJoPmgkoQPPPLhaIvyHKFsNXcoR6GeF2jfowH93T
 CjCbHWbMgnKONJ4XFnQcBZsGAvKgyF1ckLcDR40Q=
Date: Fri, 28 Aug 2020 19:04:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20200828151438.350974-1-jbrunet@baylibre.com>
References: <20200828151438.350974-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: axg-toddr: fix channel order on g12 platforms
Message-Id: <159863784461.17371.15318009139642856704.b4-ty@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Nicolas Belin <nbelin@baylibre.com>,
 linux-amlogic@lists.infradead.org
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

On Fri, 28 Aug 2020 17:14:38 +0200, Jerome Brunet wrote:
> On g12 and following platforms, The first channel of record with more than
> 2 channels ends being placed randomly on an even channel of the output.
> 
> On these SoCs, a bit was added to force the first channel to be placed at
> the beginning of the output. Apparently the behavior if the bit is not set
> is not easily predictable. According to the documentation, this bit is not
> present on the axg series.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: axg-toddr: fix channel order on g12 platforms
      commit: 9c4b205a20f483d8a5d1208cfec33e339347d4bd

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
