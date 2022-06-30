Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEC856198D
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 13:48:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBA7916D9;
	Thu, 30 Jun 2022 13:47:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBA7916D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656589679;
	bh=0ym2LTs77ZRWFWozd0cF2LZIZ6ITiiE1pQFIzfSs02Y=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QrVS4FLISiUhqkH4ir9SjzbfeE6dkBU0Sj90YYgCB/mpTBAZD+rsJZ0C8YrQY1wnh
	 dVLUblWWcsf2GUkSzUEzBfdfF9jN1NuBFvtamXwLNt45wlvpIAZvXxhVMxpZFs2MCn
	 6m+b+NxyEvaJW8A4rALcBR0SxAPwEqxmk47hK0Kw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 114E4F80536;
	Thu, 30 Jun 2022 13:46:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F325F804EB; Thu, 30 Jun 2022 13:46:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3E66F804E5
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 13:46:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3E66F804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uO1few8y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F2B16616B2;
 Thu, 30 Jun 2022 11:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB84C3411E;
 Thu, 30 Jun 2022 11:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656589573;
 bh=0ym2LTs77ZRWFWozd0cF2LZIZ6ITiiE1pQFIzfSs02Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=uO1few8ys8A95Q356DB5H9/5+9MUnUUEB4C5mzkDqZq3BaGmy6409Ed8daWH20QiP
 KO6lzVtXL5Ex4z7t8xxUTysvnaC0cJfMODkciv1P9vwmkeURdHGrVsWpYeUJybhK3o
 mcvs0dhfPdc4VEiygsYmqBkWIe5vLCM9D5teMkYUcy5ssjyyPWuCLKGxD+UqTklAg8
 etToLp0rrE2+v+hPitJyHC1XRexOQ491WoCiORxUdDCxlSTAEJ9XMBf3RktHbOrLhq
 7Si87jrs8Tpu/k/AYqE+YZY5HCS4Xbqilkg524vjcmlQq8ZL644u1os5teZHuusgWf
 YWqtb6H0B7MNA==
From: Mark Brown <broonie@kernel.org>
To: s.nawrocki@samsung.com, lgirdwood@gmail.com, Arnd Bergmann <arnd@arndb.de>,
 perex@perex.cz, trix@redhat.com, tiwai@suse.com,
 krzysztof.kozlowski@linaro.org
In-Reply-To: <20220629185345.910406-1-trix@redhat.com>
References: <20220629185345.910406-1-trix@redhat.com>
Subject: Re: [PATCH] ASoC: samsung: change gpiod_speaker_power and
 rx1950_audio from global to static variables
Message-Id: <165658957136.346792.13129934394557088460.b4-ty@kernel.org>
Date: Thu, 30 Jun 2022 12:46:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 29 Jun 2022 14:53:45 -0400, Tom Rix wrote:
> sparse reports
> sound/soc/samsung/rx1950_uda1380.c:131:18: warning: symbol 'gpiod_speaker_power' was not declared. Should it be static?
> sound/soc/samsung/rx1950_uda1380.c:231:24: warning: symbol 'rx1950_audio' was not declared. Should it be static?
> 
> Both gpiod_speaker_power and rx1950_audio are only used in rx1950_uda1380.c,
> so their storage class specifiers should be static.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: samsung: change gpiod_speaker_power and rx1950_audio from global to static variables
      commit: d2294461b90e0c5b3bbfaaf2c8baff4fd3e2bb13

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
