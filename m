Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0254C2B97
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 13:23:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88FE617C1;
	Thu, 24 Feb 2022 13:22:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88FE617C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645705409;
	bh=ikkN2YoGGWogUak8Lx7mLrwtFejuueYGRl1XesvHbbc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fYyQRkiX86010ZReB1OX2VUVUUjEOHARrTf20ecTjxWBkcTwHQRo7x7z7CxRvsmXE
	 VcWsU71TlIz65ZaJzMORUsAqTZu1b8C35W7aiZXsGFszdn34pXijh3c+FXY5vfhlyv
	 3AH1xam8KfepRTXi4raBv1ZNXQafd+8cjoQAh2tk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFF84F800F3;
	Thu, 24 Feb 2022 13:22:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78BA2F8030F; Thu, 24 Feb 2022 13:22:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 399DBF80118
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 13:22:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 399DBF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZLSc7lw1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2B604B8256D;
 Thu, 24 Feb 2022 12:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB28BC340EF;
 Thu, 24 Feb 2022 12:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645705337;
 bh=ikkN2YoGGWogUak8Lx7mLrwtFejuueYGRl1XesvHbbc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZLSc7lw1sTED5X1uFF6me+c7UIvKmPBVYfnyP0XKIOIMWpENY1OBOuMHinQEN1DiX
 pjRy50SetB0w0agqTqCbu6nbpOZNQ2SkXaB30USdOvlxuyFeICy4NOxyHov48UWz3J
 CbAto/2k9+71MNPcDOaTJV/e9rJok7KCThR1dp0R1TXBAOmjnUYbKt8OgvX/8znTl+
 U7Ih39PVhN/bH41LVRz/W3GpKo2H2/VTJ34TAIcuXdicgXTpErCEryuGBNeKOL8bQa
 WI/Kab1GNz3Nm9wlokGh6r+ekGFy2mc+qv7POI66yzTYt4O36YikEzpImm8UvEuSag
 OrasTihSOMCEQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
In-Reply-To: <20220223071959.13539-1-Vijendar.Mukunda@amd.com>
References: <20220223071959.13539-1-Vijendar.Mukunda@amd.com>
Subject: Re: (subset) [PATCH 1/9] ASoC: amd: vg: fix for pm resume callback
 sequence
Message-Id: <164570533555.1194769.3668536221336070255.b4-ty@kernel.org>
Date: Thu, 24 Feb 2022 12:22:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 wtli@nuvoton.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Alexander.Deucher@amd.com,
 krisman@collabora.com
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

On Wed, 23 Feb 2022 12:49:30 +0530, Vijendar Mukunda wrote:
> The previous condition is used to cross check only the active
> stream status for I2S HS instance playback and capture use cases.
> 
> Modified logic to invoke sequence for two i2s controller instances.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/9] ASoC: amd: vg: fix for pm resume callback sequence
      (no commit info)
[2/9] ASoC: amd: vangogh: refactor i2s master mode clock sequence code
      commit: 5ca4cf2c83dac27768f1d7d3e2404f5a17830ca5
[3/9] ASoC: nau8821: enable no_capture_mute flag
      commit: aa9753a4677d0a2c53e7e46ca173c985a3f7b83e
[4/9] ASoC: amd: vg: update platform clock control sequence
      commit: 9a617f0e109cfba2017d76f807ebb3a00c47bdca
[5/9] ASoC: amd: vg: apply sample bits pcm constraint
      commit: 0c38cc1dd17e766eada0aa44be4c1a47bcbb7bc3
[6/9] ASoC: amd: vg: update acp init and deinit sequence
      commit: a9230ccc0c6f5fca0b94f57729dc61e0a6098a0a

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
