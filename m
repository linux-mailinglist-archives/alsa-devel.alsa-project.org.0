Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94961639116
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 22:30:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE5B717C8;
	Fri, 25 Nov 2022 22:29:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE5B717C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669411822;
	bh=UE91ckGCJzG7DYhHpRX4sNBnIkoKdtx0Ogz/pz5XkVk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LEVcEidd2QHEe7pzzUeloekBBwIbjYi1F9aUO07hq1+cHAeiGE58y8KrNnz3K5TLK
	 nIZuLI9vpkRSWEQIDCe8DFxCs6MemDCjAplTLJFbrIC+BLAd2cAkmpoZdrLi6hIoN8
	 MSIEjpEYrrAsFSk/CYIB1DfaF58vYBKY77pJYVww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62842F80558;
	Fri, 25 Nov 2022 22:28:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D092F80557; Fri, 25 Nov 2022 22:28:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD362F800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 22:28:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD362F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CyR/geYX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 25C60B82C32;
 Fri, 25 Nov 2022 21:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C1FC4347C;
 Fri, 25 Nov 2022 21:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669411714;
 bh=UE91ckGCJzG7DYhHpRX4sNBnIkoKdtx0Ogz/pz5XkVk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=CyR/geYX99NErL68x+WfVB+XVm3KFijEOOkn9ZPC+bOFRN6EIfovl9TXHoKAZETBV
 bHzUPE6X13Q4BTBhJsYkkuE68Mhm7jtiKjCF1Q+CFR1Qj98iwDWMpYy23XB18SD0sX
 tUlLCqbBXO6V8s8Cv9J7zzQreQExArHSUUHAMs9EGwhMzT3JFb+oSUyDG/gjVIzIOt
 KffctQ4XTy+/vWngmaNNpS3SG3kh6z8LLuqmySYC9k7IC/EtXlF5TZx11IE7MhE+WU
 0s4c6YtArAp7yyTbmWuTUiDFY7DlV8RInmzpzJRo0ZG4YpqAbSClSgf/wYoS/igrAA
 ASh2B5tkr24lw==
From: Mark Brown <broonie@kernel.org>
To: Maarten Zanders <maarten.zanders@mind.be>
In-Reply-To: <20221028152626.109603-1-maarten.zanders@mind.be>
References: <20221028152626.109603-1-maarten.zanders@mind.be>
Subject: Re: [PATCH 0/3] ASoC: adau1372: fixes after debugging custom board
Message-Id: <166941171393.2089698.14716103883721303046.b4-ty@kernel.org>
Date: Fri, 25 Nov 2022 21:28:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Fri, 28 Oct 2022 17:26:22 +0200, Maarten Zanders wrote:
> Maarten Zanders (3):
>   ASoC: adau1372: fix mclk
>   ASoC: adau1372: add support for S24_LE mode
>   ASoC: adau1372: correct PGA enable & mute bit
> 
>  sound/soc/codecs/adau1372.c | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: adau1372: fix mclk
      commit: 27b6fa6145215c5f49d93e322a16144b928ecd3e
[2/3] ASoC: adau1372: add support for S24_LE mode
      commit: cd887a7ba74c8378ae8b52afa04adb0d49cdf13d
[3/3] ASoC: adau1372: correct PGA enable & mute bit
      commit: dffa0df699d7c20f447e6bd797666366c6bae4b3

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
