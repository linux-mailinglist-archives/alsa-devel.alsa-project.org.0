Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54714248C4A
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 19:00:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF67F178E;
	Tue, 18 Aug 2020 18:59:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF67F178E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597770002;
	bh=t1w93QEWEvokEoid6tjADACw7yv3h5hScfp7S15qTw0=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qzXVpPKl03aK1rvDfEF8ROlkjWcNYoBmTHpEtxOfMfZF+HaUylPZem2msvoSKlltg
	 6/FLwyfw6V/8q2/VaB/kX3019C8imKm0nJ8PwaR1YGiEk3er1WFIKzRQ9Vf/fGs8/y
	 QD5jVauBIUTdFML84BScEBztc+gQJYuBqoHlyY4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FF2DF80303;
	Tue, 18 Aug 2020 18:54:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D228F80303; Tue, 18 Aug 2020 18:54:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D340F802FB
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 18:54:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D340F802FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fSLh9If/"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 71D75207DE;
 Tue, 18 Aug 2020 16:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597769686;
 bh=t1w93QEWEvokEoid6tjADACw7yv3h5hScfp7S15qTw0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=fSLh9If/Ej7d50L2+kP020JW5koexmx3Wgwi7oFFgA/HvjWAbO+PMNqDzTKhdVvgD
 OnoH2ly/oAupxb/psXSyQOy5itdHs5nGtq4NanH74VSQUBuyV8Xtx5nG5DzL2BMopT
 53hV3JIV3hn0alEDgC7kF+BNSGCX6l4o3FzGgZbs=
Date: Tue, 18 Aug 2020 17:54:15 +0100
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, perex@perex.cz
In-Reply-To: <1597397561-2426-1-git-send-email-shengjiu.wang@nxp.com>
References: <1597397561-2426-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: ak4458: Add power supply property
Message-Id: <159776961933.56094.7304762190784166895.b4-ty@kernel.org>
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

On Fri, 14 Aug 2020 17:32:40 +0800, Shengjiu Wang wrote:
> AVDD-supply is for Analog power supply
> DVDD-supply is for Digital power supply

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: ak4458: Add power supply property
      commit: 617a156f2ebae841bcd64ee5a21d0e12b5d733ab
[2/2] ASoC: ak4458: Add regulator support
      commit: 7e3096e8f823682c20e033113ec32dd590364774

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
