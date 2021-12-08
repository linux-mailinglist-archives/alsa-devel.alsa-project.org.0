Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DCE46D8D3
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 17:48:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53BCC2529;
	Wed,  8 Dec 2021 17:47:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53BCC2529
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638982085;
	bh=XgeKzFLitm4ZInbkke6iE6E+VlZs255eXCl5y1LQyYA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fxDgev1d0Z8AUf6zAM0J6U1QMl2GCl1IbTLKCNTjHquFfu84ecW+iwDW+oaw9C1FT
	 lZuzusZf2ME6xbLg0BF+RGpEnbLfsE8m520TCbmfZYCYWeYnXBHm+A23Eyd59IDGGk
	 qgF0lqSxEH97kbyga4GqHeADSHVnyP4RvJ1mYT2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD331F804CC;
	Wed,  8 Dec 2021 17:46:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89882F804EC; Wed,  8 Dec 2021 17:46:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46287F80103
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 17:46:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46287F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pARWMH60"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 765B0B821C9;
 Wed,  8 Dec 2021 16:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75566C00446;
 Wed,  8 Dec 2021 16:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638982006;
 bh=XgeKzFLitm4ZInbkke6iE6E+VlZs255eXCl5y1LQyYA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=pARWMH60uwaRa+WK/mo/g2FZjDCUdhhiRG7oL3bo2DK5e5lECEDPWtDkA7SxbUaX/
 KbePBgwrubfjWd1PXtn/74doMHt3DZvWciEjOvX+Li/HQQNQSLJPX0kOWVtjw2yJhR
 SZEbGrEAAcMxByU5e3ll+PyQzhtFCxort4phSDz9oOiPvHqSwXJiiCVp6AQfUzQzpp
 YVGmJ7VXoWD3PL+DkUuirhiIQcVRzWl2K0fBuoNZEQfglggQWnzMU8+QWkR1Ih8RtG
 RXsUL3aROP2gD+fSlQS88tAA4KS9y0H9fBlpLHPYUnKrHWIDd1+IVB1bG8DAe/Mdxa
 YN7k+i3uKRsQA==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20211207211700.115319-1-pierre-louis.bossart@linux.intel.com>
References: <20211207211700.115319-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: boards: add 'static' qualifiers for max98390
 routes
Message-Id: <163898200520.3880815.2921404581537066056.b4-ty@kernel.org>
Date: Wed, 08 Dec 2021 16:46:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 7 Dec 2021 15:17:00 -0600, Pierre-Louis Bossart wrote:
> Sparse warnings:
> 
> sound/soc/intel/boards/sof_maxim_common.c:140:33: error: symbol
> 'max_98390_dapm_routes' was not declared. Should it be static?
> 
> sound/soc/intel/boards/sof_maxim_common.c:156:33: error: symbol
> 'max_98390_tt_dapm_routes' was not declared. Should it be static?
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: boards: add 'static' qualifiers for max98390 routes
      commit: 639cd58be7a4bfdf3514877b064b3308bb7800ba

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
