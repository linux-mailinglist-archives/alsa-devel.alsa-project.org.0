Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A583E3F7829
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Aug 2021 17:20:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43E591679;
	Wed, 25 Aug 2021 17:19:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43E591679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629904843;
	bh=xX3sPL8wVgj4gfbIYo+gq9+nKEagcBN77P42+6QE7yw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W86i2wHWf/892fy55VdaXY04tBs7RtailyLUhZyWYwLx8yDGu09JA8PrA4ibvh4b4
	 ddNzzbJ0G4SEZ5uqG/uOs7ZkwqbJ6uDnVFir+fb0xbsUAQpj4WYhVO/sQGD0DZ3Y0d
	 y+Ub9/FWF4Yp4VMshLWBx/pqhAkTpAR6xkUN5CqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A29BF800AE;
	Wed, 25 Aug 2021 17:19:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FB65F8020C; Wed, 25 Aug 2021 17:19:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAE36F800AE
 for <alsa-devel@alsa-project.org>; Wed, 25 Aug 2021 17:19:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAE36F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M4xH76xU"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 08BB0610FD;
 Wed, 25 Aug 2021 15:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629904758;
 bh=xX3sPL8wVgj4gfbIYo+gq9+nKEagcBN77P42+6QE7yw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M4xH76xUnSD05MnyFbAAM3BurUEw7JRDs4QG6ZzMJ8H8X6/Igj1kggEXcTdmiMt3g
 SRID6942Z6+oxEppkOoTlwMqZDzrBXiuXjqBn3nTK2cHN7n0UWJhd0Gxox6tPAqGf8
 NCNJrYQX9jUbQihXnSojqR97dSH0ij+mpXIhbv17pv2aaBKNCFSKHjotIOJUZ1GQjQ
 DnQ0gq1AUmcrOsfBUYvOwLmnOxTs0v3fnWTTsTBXQE6y53lck+KUW730t8t7OMAeqU
 PQwpQgwW3hbgUo+HNdwJ0YvARyIj3aghqmMKeHSiMM/rBAemaTObaOZwStmp4BRZ+L
 vRJnzDHtf9Ktw==
From: Mark Brown <broonie@kernel.org>
To: yang.jie@linux.intel.com, hdegoede@redhat.com,
 pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 liam.r.girdwood@linux.intel.com
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5640: Make
 rt5640_jack_gpio/rt5640_jack2_gpio static
Date: Wed, 25 Aug 2021 16:18:45 +0100
Message-Id: <162990401497.56501.11105326993788990504.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825122519.3364-1-peter.ujfalusi@linux.intel.com>
References: <20210825122519.3364-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

On Wed, 25 Aug 2021 15:25:19 +0300, Peter Ujfalusi wrote:
> Marking the two jack gpio as static fixes the following Sparse errors:
> sound/soc/intel/boards/bytcr_rt5640.c:468:26: error: symbol 'rt5640_jack_gpio' was not declared. Should it be static?
> sound/soc/intel/boards/bytcr_rt5640.c:475:26: error: symbol 'rt5640_jack2_gpio' was not declared. Should it be static?
> 
> 
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: bytcr_rt5640: Make rt5640_jack_gpio/rt5640_jack2_gpio static
      commit: dc2d01c754c378a4748ac72c5516d45da7640123

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
