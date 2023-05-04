Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E756F63EC
	for <lists+alsa-devel@lfdr.de>; Thu,  4 May 2023 06:12:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E8111717;
	Thu,  4 May 2023 06:11:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E8111717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683173561;
	bh=DGzMu0UR7qN4Ii9z2Wd1dG3vUxw/CpUhnj22tEjzdSM=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L63efyXoPWN11JorqEl3Z7kHaMIiWfZ/KER3V78BN22kX90h73C1g6gu3zqr0JHQr
	 kHW8dcIloNx6nfhKoxSYE6ZQRUGQKsKUB7u7JegjbJV/lS/MTFlK3Okfe9jRafqdqA
	 LlxE4xd/bqLyEjcBn7Z9lc5GF97vaVvqI2Wa6rIM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE44BF8032B;
	Thu,  4 May 2023 06:11:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 219ADF804FE; Thu,  4 May 2023 06:10:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B253BF800EC
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 06:10:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B253BF800EC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=blPFlMeD
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B20DD62867;
	Thu,  4 May 2023 04:10:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0892EC433EF;
	Thu,  4 May 2023 04:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683173452;
	bh=DGzMu0UR7qN4Ii9z2Wd1dG3vUxw/CpUhnj22tEjzdSM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=blPFlMeDvYImnFd4KXEeOnBFpo4IJybECBGd6hSQJ1ocl+dmCH6JCLqqcEvESosPo
	 2YVdD378Eii0tgjMitiqA2Dhe0R7HW75pmCP3Qfpts+kSkzJcPhIBW5GIAqh6qvYVM
	 Ez5fqNzQt2kfvBeW41/IaM6it5fWxww+qg/YQZ2tIZJWIonn8Subup8P+PUZw4ZuAI
	 tejnOfO9q1mieAccH8bIkNxcHPqFLhAlgQFC0fSgaNOi/Q47fRxMTPH/bPyNo40nZf
	 plQp2AzvGZdhnTmOqJ3Vjuu2yvwdG+PUsR+R28er6QQZt4tCMn1T+QbOta/zAHHEhK
	 zUv9A0T2nkuIg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230503144102.242240-1-krzysztof.kozlowski@linaro.org>
References: <20230503144102.242240-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] ASoC: codecs: wcd938x: fix accessing regmap on
 unattached devices
Message-Id: <168317344974.155442.12857842090912064660.b4-ty@kernel.org>
Date: Thu, 04 May 2023 13:10:49 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: YM6XNOX5JEB2TT5YCRXNUJFSUPJ2B7JX
X-Message-ID-Hash: YM6XNOX5JEB2TT5YCRXNUJFSUPJ2B7JX
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: stable@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Patrick Lai <quic_plai@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YM6XNOX5JEB2TT5YCRXNUJFSUPJ2B7JX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 03 May 2023 16:41:02 +0200, Krzysztof Kozlowski wrote:
> The WCD938x comes with three devices on two Linux drivers:
> 1. RX Soundwire device (wcd938x-sdw.c driver),
> 2. TX Soundwire device, which is used to access devices via regmap (also
>    wcd938x-sdw.c driver),
> 3. platform device (wcd938x.c driver) - glue and component master,
>    actually having most of the code using TX Soundwire device regmap.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd938x: fix accessing regmap on unattached devices
      commit: 84822215acd15bd86a7759a835271e63bba83a7b

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

