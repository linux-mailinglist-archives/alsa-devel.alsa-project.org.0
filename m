Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9558740C849
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 17:26:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30AB21832;
	Wed, 15 Sep 2021 17:25:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30AB21832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631719588;
	bh=eaHvPr4c64MUx/wA5kgL2ZalYjzQR3/RCff5rmUyQPg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JHHCM482K50mEPqBJxnOYGoWpfb1nu5T0fq5pOMGAkPRsq7BxhFbtY3pCgiROzTG4
	 ekth0XIVft+GU+lVOur8EbR23SfBa+rh7coqTBQxWervAoNhPzt/t2QpUPzfp4f4no
	 jh+iY5fu4GUBM9C/8gJ3Lrx0UT4tx8dnjT0ofY/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4666F80518;
	Wed, 15 Sep 2021 17:23:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F20C7F80517; Wed, 15 Sep 2021 17:23:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95CB7F804FF
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 17:22:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95CB7F804FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DjupSuNN"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 66C0A60FC0;
 Wed, 15 Sep 2021 15:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631719370;
 bh=eaHvPr4c64MUx/wA5kgL2ZalYjzQR3/RCff5rmUyQPg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DjupSuNNUsZVf6cWkxBMQr+0CowYkhDTtzl7gVr3x6s6mQkVkleuJ7sPoeKxWop7u
 ULpp9EkNqfR89yp6MzoOTnDfsxXlzdSYz2ScEDyuwe6L4rAbEJqQGitO9QRm4/fvpW
 RgVpPJktTQlHfc/Kb8V63YTlpaJ8i5uTKrXuenpxZ7riW03aomdTpNZSltb5Xlszt/
 KyVAgwrK0DWUEkK3zHhfxl9NBB7CUgm/M6KKlTgkm1BVe33t6dCrJh/ssFTs1fkBuQ
 TDhIqE4BvZNZkF3jnueIy9olhUnF2S/qEpA2ehInb4WAX+UNQ/Imrzub0amWBlLXy8
 Tgu5DUh4+n4VQ==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com
Subject: Re: [PATCH 0/3] ASoC: SOF: Intel: hda: Cleanups for local function
 uses
Date: Wed, 15 Sep 2021 16:21:48 +0100
Message-Id: <163171901944.9674.16313885873236253079.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210915071805.5704-1-peter.ujfalusi@linux.intel.com>
References: <20210915071805.5704-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

On Wed, 15 Sep 2021 10:18:02 +0300, Peter Ujfalusi wrote:
> Small cleanups regarding to HDA function locations and dropping of definitions
> of not implemented functions.
> 
> Regards,
> Peter
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: Intel: hda-dsp: Declare locally used functions as static
      commit: 189bf1deee7a5715e0373de45a032f74d2be6272
[2/3] ASoC: SOF: Intel: hda: Remove boot_firmware skl and iccmax_icl declarations
      commit: cf813f679214abb2bfe2a0020c1b3551dfd304cb
[3/3] ASoC: SOF: Intel: hda: Relocate inline definitions from hda.h to hda.c for sdw
      commit: 3e9d5b0952fcaa32e9f73a22f56d200103209a8c

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
