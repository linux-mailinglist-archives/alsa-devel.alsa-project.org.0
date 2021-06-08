Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B0E39FC02
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 18:09:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 982D2178E;
	Tue,  8 Jun 2021 18:08:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 982D2178E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623168589;
	bh=86zwKDpiQvo3AbVXai7cawGYCri3+stCIa6QiCrnrCE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dk9BVrXoTRmDTu5eBVki8wNnaR86cyDrBbwYrwyv5N3xSer84YDV8bu8UoJGgnOAi
	 aaBjABMkWZjG+me2aAH+FHVkPB6+wNripHDx0Cf7uLInOLiR2stu8+ERZjovqpQ7Pw
	 0RCVFbPhg+E3wEXYddluDbB0ot8SP6JfutJ5M2HI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9026EF804C2;
	Tue,  8 Jun 2021 18:07:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5C00F804AC; Tue,  8 Jun 2021 18:07:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD806F8019B
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 18:07:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD806F8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X6a5Mggv"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3DD7561359;
 Tue,  8 Jun 2021 16:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623168433;
 bh=86zwKDpiQvo3AbVXai7cawGYCri3+stCIa6QiCrnrCE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X6a5MggvtW1gEkr2xLx+Tuh5CMYO5qSv2l8p2zvnwwhi8EyFjH5EFWVn9Faj+QJ/Y
 WkVLHovTAHQC2K59mrJhr984q4JHy2ZecWEzv4zEmmhTbAR/DkzJYbjnBI80C8BTUt
 mm5Ztl6qept43rZN4+o6FZXay1DgV/FfIWvdluaz6queNkPaKFhIWM4p3KtU5wN1yi
 RUr86CG/hYyGPTaDDwSjOnNXz9n0uEBcXEyaf9Z8MhQLwcDl6ht7MFjuHE3GIb6ovc
 Nwyo2rR8VtXOatMSpB9+qtfugmGeE/sWHI6yHTmfoGdjeSgzl4n2DlFmRcqEMzNSDm
 m3y9rIEQYfZgA==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH 00/15] ASoC: fixes for SoundWire codec drivers
Date: Tue,  8 Jun 2021 17:06:38 +0100
Message-Id: <162316808975.49749.17338047584804027686.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607222239.582139-1-pierre-louis.bossart@linux.intel.com>
References: <20210607222239.582139-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Ryan Lee <ryans.lee@maximintegrated.com>, tiwai@suse.de,
 Mark Brown <broonie@kernel.org>, Shuming Fan <shumingf@realtek.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>
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

On Mon, 7 Jun 2021 17:22:24 -0500, Pierre-Louis Bossart wrote:
> The SOF CI exposed a set of issues with suspend/resume, error
> handling, register access and mixer values.
> 
> These fixes were indentified with a tag so that they can be applied by
> linux-stable and distributions. Thanks to the Realtek and Maxim teams
> for their help.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/15] ASoC: max98373-sdw: add missing memory allocation check
        commit: 468a272ca49cc4e2f58f3c360643c3f6d313c146
[02/15] ASoC: max98373-sdw: use first_hw_init flag on resume
        commit: bf881170311ea74ff30c3be0be8fb097132ce696
[03/15] ASoC: rt1308-sdw: use first_hw_init flag on resume
        commit: 30e102dab5fad1db71684f8ac5e1ac74e49da06d
[04/15] ASoC: rt1316-sdw: use first_hw_init flag on resume
        commit: ebe2ef60ed76c1afd8ec84e1bfd1868e3456e96b
[05/15] ASoC: rt5682-sdw: use first_hw_init flag on resume
        commit: 5361a42114689f875a9748299cadb4b1adbee6f4
[06/15] ASoC: rt700-sdw: use first_hw_init flag on resume
        commit: a9e54e5fbe396b546771cf77b43ce7c75e212278
[07/15] ASoC: rt711-sdca-sdw: use first_hw_init flag on resume
        commit: b32cab09707bb7fd851128633157c92716df6781
[08/15] ASoC: rt711-sdw: use first_hw_init flag on resume
        commit: a0897ebca669f09a2e02206a9c48a738af655329
[09/15] ASoC: rt715-sdca-sdw: use first_hw_init flag on resume
        commit: d34d0897a753f42c8a7a6af3866781dd57344a45
[10/15] ASoC: rt715-sdw: use first_hw_init flag on resume
        commit: dbc07517ab173688ef11234d1099bc1e24e4f14b
[11/15] ASoC: rt715-sdca: fix clock stop prepare timeout issue
        commit: e343d34a9c912fc5c321e2a9fbc02e9dc9534ade
[12/15] ASoC: rt5682: Fix a problem with error handling in the io init function of the soundwire
        commit: 9266d95405ae0c078f188ec8bca3a004631be429
[13/15] ASoC: rt5682-sdw: set regcache_cache_only false before reading RT5682_DEVICE_ID
        commit: c0372bc873dd29f325ee908351e0bd5b08d4d608
[14/15] ASoC: rt711-sdca-sdw: add readable for SDW_SDCA_CTL() registers
        commit: 5ad1ba99e4784929588c79e9810f5610825f0411
[15/15] ASoC: rt711-sdca: handle mbq_regmap in rt711_sdca_io_init
        commit: bcc0f0c078771e983a7e602eb14efa02f811445f

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
