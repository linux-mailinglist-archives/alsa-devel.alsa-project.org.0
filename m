Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C84727B580
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 21:39:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 275E4186E;
	Mon, 28 Sep 2020 21:39:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 275E4186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601321995;
	bh=lAI06F3qb6LpwpM9MrrzxKHv7dM8IzJK13Nh++HlPLo=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nZdZHaePoVAwQsQS7+S7CR73wA7gs2GofYGz77Gi8kVg9hA4Pn0pUbnJAdWn+6Cc7
	 un/JxUMyr59Xwhd2Lgj2Q0sEjP6yfKPyWZ2PVYvcqK7kDPNVfDIJypwMXmnb8IaEKH
	 E4Obxf8zCyyaAXvk3mFp0R8zzDf7bdaCWq8h1HZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AB9BF802DF;
	Mon, 28 Sep 2020 21:36:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A19D2F802E0; Mon, 28 Sep 2020 21:36:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A08FCF802D2
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 21:36:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A08FCF802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EFSzjanC"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4002C2075F;
 Mon, 28 Sep 2020 19:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601321759;
 bh=lAI06F3qb6LpwpM9MrrzxKHv7dM8IzJK13Nh++HlPLo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=EFSzjanCXxnXF1kwKXY+K9ugGFSYhmZ1PRyYdWftcBDt6jOsfh+ecFXbtHmI9sxZc
 vrCO2VImgdrZVQAMWUwUQ43mTYHliptDGjmvvwaEoIhGyZ1w9BLAqy01YLL2Y6mDQ/
 4o+7Vertp3qlQYezkDTcrJoT5RsYf2Lo9rvfiME4=
Date: Mon, 28 Sep 2020 20:35:02 +0100
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20200928111821.26967-1-rf@opensource.cirrus.com>
References: <20200928111821.26967-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v2 1/2] ASoC: cs4234: Add dtschema binding document
Message-Id: <160132168199.55254.6586119876179093156.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
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

On Mon, 28 Sep 2020 12:18:20 +0100, Richard Fitzgerald wrote:
> Document the bindings for the CS4234 ASoC codec driver.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: cs4234: Add dtschema binding document
      commit: 5ebba5e7d71c965763f722e68cc60b8a4aa9cb31
[2/2] ASoC: cs4234: Add support for Cirrus Logic CS4234 codec
      commit: d4edae9c508c845d92bd59c60c4089c3addad6a8

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
