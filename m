Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8019B213E33
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 19:08:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2147816E5;
	Fri,  3 Jul 2020 19:07:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2147816E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593796127;
	bh=PLlPyPWcQObVCDAfUx0mabpb9HYBu89t2O+cdrLUUCI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u4Us+92delQ5vlqf+t/0+KHGmahl7ez6aNlB2qg44chnwCgxOFzvbsJlZY1llhXEJ
	 +KdmeMtxCootlXBX1VwtYWJDRhhnOb0vRk61alwek0nW+UGABKb4VlgWcyT8XmK7q3
	 7gv0I60USSn5jambQg8rx7hAe7VYiCBVrpOsVlU8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13A03F802F8;
	Fri,  3 Jul 2020 19:04:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB779F802F8; Fri,  3 Jul 2020 19:04:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 668B5F802EC
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 19:04:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 668B5F802EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="etDOa+wJ"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6941C20C56;
 Fri,  3 Jul 2020 17:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593795851;
 bh=PLlPyPWcQObVCDAfUx0mabpb9HYBu89t2O+cdrLUUCI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=etDOa+wJ/35Q0C1f1wB1XQIiidN6FP9S1MWVD6agWkmIPJduYfbbyWGpmDwcutr3h
 2KDtiYwELBDVrwtVEp6k8x9XPas12chOC2saZTxC6RW3QJG4SnmnBfEOcuUjFWPt7K
 aKJ1bfRYXtwt+wMAvd5im/AeE+VO3xBdPFHbkcIs=
Date: Fri, 03 Jul 2020 18:04:09 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200702192141.168018-1-pierre-louis.bossart@linux.intel.com>
References: <20200702192141.168018-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 0/6] ASoC: fsl: fix kernel-doc
Message-Id: <159379581381.55795.17070443567066342064.b4-ty@kernel.org>
Cc: tiwai@suse.de
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

On Thu, 2 Jul 2020 14:21:35 -0500, Pierre-Louis Bossart wrote:
> This cleanup patchset is only about kernel-doc, mostly trivial edits
> and format correction.
> 
> v2: added Nicolin Chen's Acked-by tags and included the three
> suggested edits.
> 
> Pierre-Louis Bossart (6):
>   ASoC: fsl: fsl_ssi_dbg: remove spurious kernel-doc comment start
>   ASoC: fsl: fsl_ssi: fix kernel-doc
>   ASoC: fsl: fsl-asoc-card: fix kernel-doc
>   ASoC: fsl: fsl_spdif: fix kernel-doc
>   ASoC: fsl: fsl_asrc: fix kernel-doc
>   ASoC: fsl: fsl_esai: fix kernel-doc
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: fsl: fsl_ssi_dbg: remove spurious kernel-doc comment start
      commit: 2f981391756f95037a53421100a1634a30684ad1
[2/6] ASoC: fsl: fsl_ssi: fix kernel-doc
      commit: e3b741918f23d46b3c4974cfa57f4634e2fb9131
[3/6] ASoC: fsl: fsl-asoc-card: fix kernel-doc
      commit: 31deacffcdba10a1e4f23efd243821d15f0b5325
[4/6] ASoC: fsl: fsl_spdif: fix kernel-doc
      commit: 28fd6ff1586724cc85166ba2aae2127d913b214b
[5/6] ASoC: fsl: fsl_asrc: fix kernel-doc
      commit: 4674bf0622b38ce38313091dc4226c2451df2ffb
[6/6] ASoC: fsl: fsl_esai: fix kernel-doc
      commit: 3bae1719b383cc97bbfb22c79b8caf2a863a8103

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
