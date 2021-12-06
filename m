Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6346546A3C3
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 19:04:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4E28234A;
	Mon,  6 Dec 2021 19:03:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4E28234A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638813840;
	bh=ihT/6qJ0Zr2R4hify6TOdcwqdthiWpb5EcRPA1/C5J4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mseobGWdrtvYUF1z3EmVHxYgwi/pUrmyhKQFBJUamZyhuLYv6M23L2H3eiunxcztt
	 qfFQmfyKrBkc8VFDZxlWOYIqCFQLOOorzpHa9qxH4aPuXHNvmUN98+aTTXTN4UVV9x
	 nMAXvYeOk+VZKBKnSijByDWUt+erembstJ+KBCOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C408F8051C;
	Mon,  6 Dec 2021 19:00:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F55AF80525; Mon,  6 Dec 2021 19:00:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF196F804FE
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 19:00:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF196F804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CGU+sDOh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EB065B811E1;
 Mon,  6 Dec 2021 18:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 278BFC341C2;
 Mon,  6 Dec 2021 18:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638813639;
 bh=ihT/6qJ0Zr2R4hify6TOdcwqdthiWpb5EcRPA1/C5J4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=CGU+sDOhs9RvR4UyPuFKTjYnBB3qjQsM6BcZbA4JvGOv2DRdL3AkYmO5NEp0x6hLx
 G/GpUnDSq/6HvPVONSMVGWzlmYCU0AxXI1fGWeeua0+rLEqt2GuOwCypp/MEVxcrKe
 57xo1K9XSTX4/iWX1YujXretZeSPiaPvQS1mUfM8MpIjXA/GvxPthqlFpYo6D0gIxH
 SQJVHZDGpDFYUWLjgCqNKDjv91/DsPI19E9hA9TOwn32QK/yCr6nH3wWvQtbMNPTSR
 Fg9OOvZuGQkEEDh4ruUjkXpXQ6E+muY1JcEOQtirVaPlmFe72ZUwdbLQ0JkR3PdNfR
 KVNvgGbp/1IMQ==
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20211203154721.923496-1-kai.vehmanen@linux.intel.com>
References: <20211203154721.923496-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: fix build issue related to
 CODEC_PROBE_ENTRIES
Message-Id: <163881363681.2769299.9661270976888735275.b4-ty@kernel.org>
Date: Mon, 06 Dec 2021 18:00:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel test robot <lkp@intel.com>, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

On Fri, 3 Dec 2021 17:47:21 +0200, Kai Vehmanen wrote:
> Fix following error:
> sound/soc/sof/intel/hda-codec.c:132:35: error: use of undeclared identifier 'CODEC_PROBE_RETRIES'
> 
> Found with config: i386-randconfig-r033-20211202
> (https://download.01.org/0day-ci/archive/20211203/202112031943.Twg19fWT-lkp@intel.com/config)
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: fix build issue related to CODEC_PROBE_ENTRIES
      commit: 9a83dfcc5ae8230fbf12b63e281d5bb8450ec0e7

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
