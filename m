Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F383248C59
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 19:02:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 090F71790;
	Tue, 18 Aug 2020 19:01:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 090F71790
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597770165;
	bh=vQK60Ocp3gM1Fr89fLe38clUh708rCmn+Vl9Vckyncg=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gEqZUXzx5XtVulJ0IJOVJA2zsMmDTaGQQiLVMGzLdHg3ZcM90sg02AGJN+zx/3NSR
	 SA3s4z9oCHwlDUj2uQL9AtjR2jQSDT9IKGPTmDOp68Ux/jviTjnGvUpXh0uk44Zfm4
	 RArnwWdFu5C951YaEJT1KJy/COkJEnoURIJ8OGbY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFEAAF8023F;
	Tue, 18 Aug 2020 18:55:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D30D4F8033E; Tue, 18 Aug 2020 18:55:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3392AF80339
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 18:55:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3392AF80339
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KlJ1pur9"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5C0C620786;
 Tue, 18 Aug 2020 16:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597769710;
 bh=vQK60Ocp3gM1Fr89fLe38clUh708rCmn+Vl9Vckyncg=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=KlJ1pur9zhhxqqtEJA2/ufg25NxSrAWe83REzsPY1FWsSOM4VZRmziogXolBmaeVm
 wIKypEe5ExeSocoRQxk55HLLjVC3gB3PIk1mPXMwue4HnPXMFxov1YjuBRGSK0IEF1
 gxO03l7c/WPCZW8LiB+J9lO77fTihBlfUdFpz9p4=
Date: Tue, 18 Aug 2020 17:54:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20200811041836.999-1-michael.wei.hong.sit@intel.com>
References: <20200811041836.999-1-michael.wei.hong.sit@intel.com>
Subject: Re: [PATCH v2 0/2] This patch series is to enable multiple features
 on the Keembay Platform
Message-Id: <159776961931.56094.10298376998030198647.b4-ty@kernel.org>
Cc: cezary.rojewski@intel.com, andriy.shevchenko@intel.com,
 pierre-louis.bossart@linux.intel.com, jee.heng.sia@intel.com, tiwai@suse.com,
 liam.r.girdwood@linux.intel.com
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

On Tue, 11 Aug 2020 12:18:34 +0800, Michael Sit Wei Hong wrote:
> Michael Sit Wei Hong (2):
>   ASoC: Intel: KMB: Enable TDM audio capture
>   dt-bindings: sound: intel,keembay-i2s: Add new compatible string
> 
>  .../bindings/sound/intel,keembay-i2s.yaml     |   1 +
>  sound/soc/intel/keembay/kmb_platform.c        | 145 +++++++++++++-----
>  2 files changed, 109 insertions(+), 37 deletions(-)

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: KMB: Enable TDM audio capture
      commit: 9c3bab3c4f158bb79ebd7443ef83c32fa1a450a1
[2/2] dt-bindings: sound: intel, keembay-i2s: Add new compatible string
      commit: a106bb6eeaace283bcb9fcaeb2e2ac4097037e4b

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
