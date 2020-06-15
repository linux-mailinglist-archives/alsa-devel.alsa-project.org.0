Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E884F1F9B9A
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 17:10:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 943311680;
	Mon, 15 Jun 2020 17:09:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 943311680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592233809;
	bh=OTLgPo+ey8vWrk85z+vPQi706mBEQnrrnU/gJ011Lo0=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m9ci6eY8afgche1/BtG+OoMqmFgYZYXDPwWv2CcYE4BO+V25Mdfo6OQeZLJONGpcg
	 fialiYReyOa/44qXl8eNL2l5/NbMzUjBjK0VXcTBcVPrYkF632GIk7ffXbpzCjSTQB
	 L2+XhUO+V6kWOzCKQlx6dhmSlNcnJANn58ZKU0VU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25391F802EA;
	Mon, 15 Jun 2020 17:06:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7D81F802DC; Mon, 15 Jun 2020 17:06:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6733AF802E0
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 17:05:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6733AF802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="szNzxCWU"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8E5862078E;
 Mon, 15 Jun 2020 15:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592233558;
 bh=OTLgPo+ey8vWrk85z+vPQi706mBEQnrrnU/gJ011Lo0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=szNzxCWURmoRZnB3TCcg1IR8wI0bPdM+kaZkmj0eCYR9O0s3UcoPmzo5+tboq8xlk
 ZdnPerNpVzkefMyOwseGxzemUtwUEAgS0w9NSdoqaZATqkrK7ysjVD2AoCSvC5H9/B
 aa79s0TI2ih7IC257mmQgwNHdCfQJpnQaoWDLUBU=
Date: Mon, 15 Jun 2020 16:05:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20200612203507.25621-1-pierre-louis.bossart@linux.intel.com>
References: <20200612203507.25621-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: soc-pcm: fix checks for multi-cpu FE dailinks
Message-Id: <159223353044.8967.584162671987051442.b4-ty@kernel.org>
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

On Fri, 12 Jun 2020 15:35:07 -0500, Pierre-Louis Bossart wrote:
> soc_dpcm_fe_runtime_update() is called for all dailinks, and we want
> to first discard all back-ends, then deal with front-ends.
> 
> The existing code first reports an error with multi-cpu front-ends,
> and that check needs to be moved after we know that we are dealing
> with a front-end.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: fix checks for multi-cpu FE dailinks
      commit: 96bf62f018f40cb5d4e4bed95e50fd990a2354af

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
