Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE342716DCD
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 21:43:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A9841DF;
	Tue, 30 May 2023 21:42:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A9841DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685475807;
	bh=C/ZCDt9dxkFqBdenxsotP/gQkEWd0TJC2yhywFPrxlU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s0qoWHt2WNwW2lXo5540Xlc+Lbxxr7aGAEvxnsjiuCLyx1jcLc9FfRximvVWFXYtW
	 Keg3AsQNzJ5xdDSv1FH7RtoFVcvaoKJ8a4/tUFCyTPREeiTbTNkIU0mX3I5jwcDgZl
	 lBg6Ltteroh1G29KlmztCgvsI/a0ZLFFN17NueHk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50247F8026A; Tue, 30 May 2023 21:42:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E83FF8026A;
	Tue, 30 May 2023 21:42:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21A7EF8042F; Tue, 30 May 2023 21:42:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46C88F80149
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 21:42:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46C88F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=K93thLG6
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 81BD6630D5;
	Tue, 30 May 2023 19:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2055C433EF;
	Tue, 30 May 2023 19:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685475733;
	bh=C/ZCDt9dxkFqBdenxsotP/gQkEWd0TJC2yhywFPrxlU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=K93thLG6dvDqETIhFEajld3t2N4JSaO+9Xro4KcquZXq1aN8xBW+sXicFMELWgaLN
	 pH7eC573JWpTDi9D957EgYNr4EObZ099H9tylABVhlNPWiginmSVtQalMUMe7LzTSg
	 B+My6btPtnLo87e2Akm6IJ4pUY5VJ7eWcfWTemfBXPUkOKZUb+uzyjw5+5yZdIgVrq
	 x9X35u5rfa/oLL3HeFZY9F3/sj2eOg3MarOTrLMKtgJFhyW3oSNdhqpR80NrGqe2Md
	 0Olhr1iNLouKS4XBHXt74Mw4/0YZWyVOU/f7YG+9R5Zo8OoYcVIdLUP997A/59oh4H
	 54LZ17CBqO6AQ==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Zhu Ning <zhuning0077@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 David Yang <yangxiaohua@everest-semi.com>,
 Daniel Drake <drake@endlessm.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, kernel@collabora.com
In-Reply-To: <20230530181140.483936-1-cristian.ciocaltea@collabora.com>
References: <20230530181140.483936-1-cristian.ciocaltea@collabora.com>
Subject: Re: (subset) [PATCH v2 0/3] ES8316 audio codec fixes on Rock5B
Message-Id: <168547572955.1446927.6113726229906083649.b4-ty@kernel.org>
Date: Tue, 30 May 2023 20:42:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: ABHNBMKUPWQIJBESL6HJB6JX4JCLSATU
X-Message-ID-Hash: ABHNBMKUPWQIJBESL6HJB6JX4JCLSATU
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ABHNBMKUPWQIJBESL6HJB6JX4JCLSATU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 30 May 2023 21:11:37 +0300, Cristian Ciocaltea wrote:
> This patch series handles a few issues related to the ES8316 audio
> codec, discovered while doing some testing on the Rock 5B board.
> 
> Changes in v2:
>  - Preserved original dB gain range in PATCH 1
>  - Rewrote PATCH 2 conditional statement, per Mark's review
>  - Rebased series onto next-20230530
>  - v1: https://lore.kernel.org/all/20230524074156.147387-1-cristian.ciocaltea@collabora.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: es8316: Increment max value for ALC Capture Target Volume control
      commit: 6f073429037cd79d7311cd8236311c53f5ea8f01
[2/3] ASoC: es8316: Do not set rate constraints for unsupported MCLKs
      commit: 60413129ee2b38a80347489270af7f6e1c1de4d0

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

