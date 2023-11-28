Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A037FC084
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 18:48:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B392184D;
	Tue, 28 Nov 2023 18:48:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B392184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701193713;
	bh=Gfy1IvAJHtOURsa6p0dWEDOWeth/WVJ919Rozyirp/Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jz/e7Nz7X4Zfc1YZWHlfjbeP38+ft0W3LfMeT0YPSkQvDWc9DD8EGYHUQoBwb2vB3
	 BT1WRHgXulRvWx+XjDBxr3oVPiPOrzQvzymNDPDmIDKeNddEposoNIFVofamIc/bi4
	 Rq+AY3yw4pwgHJaedsJ/JIYhvTcnA5rYf4O1lnhU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38968F805EF; Tue, 28 Nov 2023 18:47:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C591F805D3;
	Tue, 28 Nov 2023 18:47:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06155F8016E; Tue, 28 Nov 2023 18:47:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53DB8F80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 18:47:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53DB8F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=adENEMr6
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 60170B83B84;
	Tue, 28 Nov 2023 17:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B21C433C8;
	Tue, 28 Nov 2023 17:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701193647;
	bh=Gfy1IvAJHtOURsa6p0dWEDOWeth/WVJ919Rozyirp/Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=adENEMr6OWS7SCT9+EXSQ5+EIv7/WS8hKvcIez0MT4/CIgBuCbaqBdBwY8XeoRLSI
	 mA05jD42QWsEPDZkLnIy3h9aTYfvZOEKMgtWeU+ZiqN2BDXM6/fntIbVYcQ/D8k29T
	 q9RWFC9ZNquZWsKV76Chtb47QLyvD0TyQKuulhq6XmKo9c9K3V3CLzXWpkyzu/VN9w
	 OnNcvZzkDDbLU7BfE6Rtjw8wbdKepsJN/kB2SzY+24s8ZqJwXCof/TMaNkSsSMM/tQ
	 Gn0Q4Q1QBq9bVq59rEqvfNqGgC0pOJ7CGdLM7gXL0y3diYndFeIrqnvd3Xa3LQvBQY
	 igrjTxepP+FzQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: krzysztof.kozlowski@linaro.org, linux-arm-msm-owner@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: 
 <20231116-topic-sm8x50-upstream-tx-macro-fix-active-decimator-set-v1-1-6edf402f4b6f@linaro.org>
References: 
 <20231116-topic-sm8x50-upstream-tx-macro-fix-active-decimator-set-v1-1-6edf402f4b6f@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: lpass-tx-macro: set active_decimator
 correct default value
Message-Id: <170119364524.61148.12462722203643682631.b4-ty@kernel.org>
Date: Tue, 28 Nov 2023 17:47:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: A75TWXA2KII6OG5AGIDPQLIEF6HDSFLH
X-Message-ID-Hash: A75TWXA2KII6OG5AGIDPQLIEF6HDSFLH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A75TWXA2KII6OG5AGIDPQLIEF6HDSFLH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 16 Nov 2023 17:44:21 +0100, Neil Armstrong wrote:
> The -1 value for active_decimator[dai_id] is considered as "not set",
> but at probe the table is initialized a 0, this prevents enabling the
> DEC0 Mixer since it will be considered as already set.
> 
> Initialize the table entries as -1 to fix tx_macro_tx_mixer_put().
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass-tx-macro: set active_decimator correct default value
      commit: 69cecaf48831480252dcb63ba32803724f235b1c

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

