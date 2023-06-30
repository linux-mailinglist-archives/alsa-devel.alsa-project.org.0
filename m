Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CF37440E4
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 19:09:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C1911E0;
	Fri, 30 Jun 2023 19:08:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C1911E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688144981;
	bh=mCCqTczvbpDnqWTAvLPO/6kWxxjHeQDe26aZLtloYdE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AKYzL+LfgexHRpG2XhLZyQFPLF4NBxrrY9VNJzq8Og7H+GuL1a7atiLjNDEZp2WqF
	 53dPk/BQK5Jvj7FXLtVs23dS2zEsaGbrhYn+rIOssNahA9Co1KLtc57zlY9eaWcwqH
	 2k9aB658l9DrnL+CPZ+76E1eckoWGbKbfOk3kuhU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD12CF8027B; Fri, 30 Jun 2023 19:08:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 283C5F8027B;
	Fri, 30 Jun 2023 19:08:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FCE2F80246; Fri, 30 Jun 2023 19:07:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF8F8F80169
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 19:07:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF8F8F80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UM4iaIMN
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 715FA617C4;
	Fri, 30 Jun 2023 17:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19F0AC433C9;
	Fri, 30 Jun 2023 17:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688144865;
	bh=mCCqTczvbpDnqWTAvLPO/6kWxxjHeQDe26aZLtloYdE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UM4iaIMNjeGFHSr6jpk65rhBWYTWOBGR9ga+vIaTLbDwgbBLIS7zZHW+6IUdDu2YE
	 Hli3gQlcyH6RGMyGTETWeh7ViiIPrETDFBDcz93hKpwcXwtulf3S6/1FwCjpTl/L7o
	 m8HWagxcqZzoL2XNxBkE7FggT0+MfFitq5vBAfTPEVg7/Y9MU43iU025uu/X4rTJZM
	 n3ecGBMeSR/VLeWdlxbCF6xAtRuGgc/rCbWUUGav694pIwR9ZOj9I6jUZ3j/6Vs8tL
	 NS+xyMr9/4McfRMoGF6q2OjWhlddMXgs83dyl01jAGiEZ8fQINJwsbG5PuhXFXmopM
	 Iluq0yWQoX3cg==
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20230630120318.6571-1-johan+linaro@kernel.org>
References: <20230630120318.6571-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] ASoC: codecs: wcd938x: fix codec initialisation race
Message-Id: <168814486382.50974.15112012461000088627.b4-ty@kernel.org>
Date: Fri, 30 Jun 2023 18:07:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: HTL5W3IAW6BDWRRYIQN2CLD2VF7EIWDQ
X-Message-ID-Hash: HTL5W3IAW6BDWRRYIQN2CLD2VF7EIWDQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HTL5W3IAW6BDWRRYIQN2CLD2VF7EIWDQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 30 Jun 2023 14:03:18 +0200, Johan Hovold wrote:
> Make sure to resume the codec and soundwire device before trying to read
> the codec variant and configure the device during component probe.
> 
> This specifically avoids interpreting (a masked and shifted) -EBUSY
> errno as the variant:
> 
> 	wcd938x_codec audio-codec: ASoC: error at soc_component_read_no_lock on audio-codec for register: [0x000034b0] -16
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd938x: fix codec initialisation race
      commit: 85a61b1ce461a3f62f1019e5e6423c393c542bff

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

