Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E573D2ADF
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 19:13:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24D6D1704;
	Thu, 22 Jul 2021 19:12:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24D6D1704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626974022;
	bh=DeA3CYXsFlcMIQmyqXm6khDeOW5lwK6vbztR5SBgTkc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=usTcrcp+dk2E+8y2T5NducMKEOtt7pLVgJmwskrmVXDMWUskDWPL4F5wq1S0XFVY2
	 tSz+8oX9L//ib5YsstowpkiOQrwLOiUapw4kqbWeusaZZ+kknjiLIsYsnOtirA81hk
	 fnkwVLK+oxJrDdaM6qKMZi0Wq3FK493RUV+i7XjU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E52EF804F1;
	Thu, 22 Jul 2021 19:10:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 211CDF804E3; Thu, 22 Jul 2021 19:10:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92C59F804E1
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 19:10:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92C59F804E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gQA11bcS"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B20496120D;
 Thu, 22 Jul 2021 17:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626973838;
 bh=DeA3CYXsFlcMIQmyqXm6khDeOW5lwK6vbztR5SBgTkc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gQA11bcSMILqSjdJnIPBRdmGs7GdG7f0QT+9x7hY6uuzqgntCvPPTRZ1cdeEl8LjV
 imFmfhUcy984y5wReMOCLviUXxiX9EGsN9l0O4PqFDBJr5LDA4VfVb+PvEE/Jsa326
 7AGd1XxvoT5oBaukShY8FJ0dgAoNpoqw04N24CmCjGfyzQiDgDUYhZ3D3MFiUccdqt
 OSj/gd63ZwISkwu/nhGiF3cwDSULacIq9LOUn/HmUrYo2nSu0SLQLxaSwergy0Dg+E
 FJ5pnEulsMjicoZNKnz8nzyE/mhIHTEh2VFPKF96cE1NnKo+p07NX6c3zOaLuot6rt
 sQHF2WBP76ZZA==
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: wcd938x: fix wcd module dependency
Date: Thu, 22 Jul 2021 18:10:05 +0100
Message-Id: <162697068326.1747.12876707572437877614.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210721150510.1837221-1-arnd@kernel.org>
References: <20210721150510.1837221-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
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

On Wed, 21 Jul 2021 17:04:45 +0200, Arnd Bergmann wrote:
> With SND_SOC_ALL_CODECS=y and SND_SOC_WCD938X_SDW=m, there is a link
> error from a reverse dependency, since the built-in codec driver calls
> into the modular soundwire back-end:
> 
> x86_64-linux-ld: sound/soc/codecs/wcd938x.o: in function `wcd938x_codec_free':
> wcd938x.c:(.text+0x2c0): undefined reference to `wcd938x_sdw_free'
> x86_64-linux-ld: sound/soc/codecs/wcd938x.o: in function `wcd938x_codec_hw_params':
> wcd938x.c:(.text+0x2f6): undefined reference to `wcd938x_sdw_hw_params'
> x86_64-linux-ld: sound/soc/codecs/wcd938x.o: in function `wcd938x_codec_set_sdw_stream':
> wcd938x.c:(.text+0x332): undefined reference to `wcd938x_sdw_set_sdw_stream'
> x86_64-linux-ld: sound/soc/codecs/wcd938x.o: in function `wcd938x_tx_swr_ctrl':
> wcd938x.c:(.text+0x23de): undefined reference to `wcd938x_swr_get_current_bank'
> x86_64-linux-ld: sound/soc/codecs/wcd938x.o: in function `wcd938x_bind':
> wcd938x.c:(.text+0x2579): undefined reference to `wcd938x_sdw_device_get'
> x86_64-linux-ld: wcd938x.c:(.text+0x25a1): undefined reference to `wcd938x_sdw_device_get'
> x86_64-linux-ld: wcd938x.c:(.text+0x262a): undefined reference to `__devm_regmap_init_sdw'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd938x: fix wcd module dependency
      commit: b9a4b57f423ff8ff9ab9b68a238bdc3e7678f723

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
