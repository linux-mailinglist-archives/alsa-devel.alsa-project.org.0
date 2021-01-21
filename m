Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AFA2FF4D1
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 20:42:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A792E193B;
	Thu, 21 Jan 2021 20:41:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A792E193B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611258167;
	bh=sAnSWESyUIuZElxSh8Fc3f/CYV3k+QZgskTTiHTQKgg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fLj0MU8uOdJ/6TQJaY5+m84ns7McBjo4esNgoQG3VLJ6PQbew1IqosrVB7EApd+Ch
	 WhMf5bF4BD+j5ovrzrDj5Cr9/MrTZ+gabK61mJrptOI3AQPvIcbwh5DyhKgCaujR2m
	 w08/vRKng6uL/FSI9yEcWexj3xKRpCXiyHDOqx6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4430F804E1;
	Thu, 21 Jan 2021 20:40:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD0B8F804BD; Thu, 21 Jan 2021 20:40:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25586F80257
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 20:40:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25586F80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cSjIRLwm"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B653A23A40;
 Thu, 21 Jan 2021 19:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611258011;
 bh=sAnSWESyUIuZElxSh8Fc3f/CYV3k+QZgskTTiHTQKgg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cSjIRLwm5U+shyWuOUzZoc7s8BI16cbMSMVXjM3JE5Vx0Nznx4D9zz7BfXeWNPxiw
 QmLoPdOXBsxOdnm570NJGAGiTE15tdqPFm1h4EziD3WHXUmf4ZKDzjVbapFuimzoqN
 II7Yj0JZiqNOOjGgntsFuUZM2dGsXE64+4/ZjAw/i4qUeORYVWaTPFuZzgictbfAFI
 mBD/fR0DIFnR8ppipvFJG3nZ/1Q+uE4NXpf76DjlaD6+8d09KpQHjOkOtInYfRV+43
 3lH2G8MgaQglrby0SvHpGJItgEZM2szVeUwlpsB1Pw3t/wn1zPhre6PrCePT+4gWDF
 8StRm1TscLL5Q==
From: Mark Brown <broonie@kernel.org>
To: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20210114163602.911205-1-amadeuszx.slawinski@linux.intel.com>
References: <20210114163602.911205-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 0/2] Add sanity checks for topology API calls
Message-Id: <161125795421.35635.13388093984398380695.b4-ty@kernel.org>
Date: Thu, 21 Jan 2021 19:39:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On Thu, 14 Jan 2021 11:36:00 -0500, Amadeusz Sławiński wrote:
> Topology API exposes just 2 function calls, to load and unload topology.
> This adds sanity checks to make sure that it behaves well when some of
> parameters are set incoorectly or not needed.
> 
> This makes developer live easier by failing early instead of proceeding
> on and then failing in unexpected ways.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: topology: Ensure that needed parameters are set
      commit: d40ab86f7db3612074d08a317bdb1eb8ba06a37e
[2/2] ASoC: topology: Check if ops is set before dereference
      commit: 9c88a9838352c43550ab18080c924824bc660546

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
