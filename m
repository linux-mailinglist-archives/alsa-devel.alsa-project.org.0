Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DFF93FD57
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2024 20:30:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DBE383E;
	Mon, 29 Jul 2024 20:30:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DBE383E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722277818;
	bh=DNrVoUJkcRCMV4GV4Cb5m+gKYLNldACz3l/Xe20yxuQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=oC4xEjhUqcCs83TEFVPuq9fuPJ3sCoZNTls20wHAMNPW/LOoxuev8J22VQY693Cxs
	 yDRxvH7S9T3dG5sABsAQFC9/TjN14/JqQj5DkVGL1JfJ3DCXmTSFoj5QArGF0zkjd+
	 24Iqxq8uxRrB+7jVWPLeFTep5CZCi6Mu8sNsAifY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2D64F800E3; Mon, 29 Jul 2024 20:29:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90069F805AC;
	Mon, 29 Jul 2024 20:29:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1BC9F80448; Mon, 29 Jul 2024 19:17:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CF621F8026A
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 19:17:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF621F8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HFnLcZn/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2CD4A61BD5;
	Mon, 29 Jul 2024 17:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5BFC4AF09;
	Mon, 29 Jul 2024 17:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722273454;
	bh=DNrVoUJkcRCMV4GV4Cb5m+gKYLNldACz3l/Xe20yxuQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=HFnLcZn/OptUIW8YU8D1Vi9bESeu55eoV8fBlFc0xw5Nl3N3AOH4RK8TxALMYUfV4
	 O7D+zbQZTTgHIL3QsIu+L6MSje4TZ09ZL2iPEXn7vqdCNZ7LIuC0Cos0+EoRrSnyr5
	 Qxz/kZxxsoDN7We1OWWvI70kAHpB97v2K/6bKLaRJz62sDxyk1QhVsmOuDzIujhPBt
	 K5SVx9dKmql83GU8c6NrRdwOyV6ik26tHgMdTT+p9Nf159L3NuraeL4hbhgkQZzHff
	 dVKnfEE5G8EAOuZllCIcCKr5qbBPAaZ9etKLqI6LY9xKipo4mpqILSDnMxXaJ5dJGC
	 8DOz4t7xD8/tA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240723144607.123240-1-krzysztof.kozlowski@linaro.org>
References: <20240723144607.123240-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: lpass-wsa-macro: Do not hard-code dai in
 VI mixer
Message-Id: <172227345178.109775.370117860725078883.b4-ty@kernel.org>
Date: Mon, 29 Jul 2024 18:17:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: 2RWQUVITAXX7J7M5MYFTWUZWDWLHL4QL
X-Message-ID-Hash: 2RWQUVITAXX7J7M5MYFTWUZWDWLHL4QL
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2RWQUVITAXX7J7M5MYFTWUZWDWLHL4QL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 23 Jul 2024 16:46:07 +0200, Krzysztof Kozlowski wrote:
> The wsa_macro_vi_feed_mixer_put() callback for setting VI feedback mixer
> value could be used for different DAIs (planned in the future CPS DAI),
> so make the code a bit more generic by using DAI ID from widget->shift,
> instead of hard-coding it.  The get() callback already follows such
> convention.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass-wsa-macro: Do not hard-code dai in VI mixer
      commit: b3f35bae68c0ff9b9339b819ec5f5f341d798bbe

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

