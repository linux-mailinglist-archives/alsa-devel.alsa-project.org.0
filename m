Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E7C22998E
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 15:49:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3E3F83A;
	Wed, 22 Jul 2020 15:48:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3E3F83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595425739;
	bh=d6Xo0cicAXCf7UHk0e4SWwLtAlVDwqBSiSvEbl4Wqyc=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KqV8O/FPTJk2Jk7vm2qTDFc5F276Ppd2g/tvjBWP5ajPfEselT/B7gy/G8/GRRBpi
	 Lox/NdMftL7dDQ+7OFsWOw6e/d2iObsc5Ns28udo8uoUn42NY2Y6sWjYyIjyKmTpc4
	 qsFJfKapCcf9nlbVTxwd5ktmeBZu+TLuZG5WKtdw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60E0DF802DC;
	Wed, 22 Jul 2020 15:45:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C69BDF802DB; Wed, 22 Jul 2020 15:45:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F24DF8028D
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 15:45:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F24DF8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JkF33Mwz"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7EED0207BB;
 Wed, 22 Jul 2020 13:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595425508;
 bh=d6Xo0cicAXCf7UHk0e4SWwLtAlVDwqBSiSvEbl4Wqyc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=JkF33MwzWUdMHFZr0rviBRvN1JoNgRaETZbLkSi3jieri3fDT4uMX5geEif40Wtin
 VnLeiTBIhoQPmXe5dcUoHDdezgEVhAF5n5rEpRmmwq2c5u3zJdqqDkX2i3Wf3mBO4l
 p5wHrQB3AmZE1OIf6kZiTT26cnxo3npUSdewGaMI=
Date: Wed, 22 Jul 2020 14:44:54 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20200714132804.3638221-1-kai.vehmanen@linux.intel.com>
References: <20200714132804.3638221-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: intel/skl/hda - fix probe regression on systems
 without i915
Message-Id: <159542547442.19620.11983281044239009101.b4-ty@kernel.org>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, Rander Wang <rander.wang@linux.intel.com>,
 kuninori.morimoto.gx@renesas.com, pierre-louis.bossart@linux.intel.com
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

On Tue, 14 Jul 2020 16:28:04 +0300, Kai Vehmanen wrote:
> Starting in commit cbc7a6b5a87a ("ASoC: soc-card: add
> snd_soc_card_add_dai_link()"), error value from ASoc add_dai_link() is
> no longer ignored.
> 
> The generic HDA machine driver relied on the old semantics to disable
> i915 HDMI/DP audio codec at runtime. If no display codec was present,
> add_dai_link() returned an error, but this was ignored and rest of the
> card was successfully probed.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: intel/skl/hda - fix probe regression on systems without i915
      commit: ffc6d45d96f07a32700cb6b7be2d3459e63c255a

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
