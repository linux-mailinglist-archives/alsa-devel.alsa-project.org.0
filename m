Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 120168540EA
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Feb 2024 01:50:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35E0714E2;
	Wed, 14 Feb 2024 01:50:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35E0714E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707871813;
	bh=bqe9jQrUoDdk/Q2n/ceHUg/SnRN77bKJ73bZuPyGZYU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Tvc+t3ZuYQm+wMIRETI4lxa3oCh9lgHcBOWD8Q950ab4vhSzinM/wEan8yb5boGSF
	 xLQg0twG0z6Yb1HxY4A5d07IsT8jN/eWTrjlNLcJB/tZKbw83DcT8wdjWIWTighmRS
	 M0HJVgzIQk4qHG0RNF+8wXUYl0P6qo29T0qqr2Wc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C58AF805D3; Wed, 14 Feb 2024 01:49:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04C16F80579;
	Wed, 14 Feb 2024 01:49:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C2AAF80238; Wed, 14 Feb 2024 01:49:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 009DCF8015B
	for <alsa-devel@alsa-project.org>; Wed, 14 Feb 2024 01:49:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 009DCF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GgUr3yJ4
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 87D6361779;
	Wed, 14 Feb 2024 00:49:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1592C43390;
	Wed, 14 Feb 2024 00:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707871743;
	bh=bqe9jQrUoDdk/Q2n/ceHUg/SnRN77bKJ73bZuPyGZYU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=GgUr3yJ4U6Hmjwoil6RyQf+rgVx/R3N/7iDECVMYOWiENhN54v49OWckW219dPWl/
	 /RILUeunWgxy1r+MkkNotg5ItqmqdhbvTW5wcAcXGeDZgCw59cX1n5Vo0Gkqk+NqRi
	 6UPGwVbMmYAA/wQ5hUKOndl5f/8mPQPpu4KJgGdKDkiEjq0iqLh/N06UQC+vNz9f4Y
	 k1Ow0EunL5uS1NM6CoXQLSX3o0na4XT/fDRMBuXzdhJzyu9tX8EP8fpD2KP9MMdmmx
	 7d/CZC8sMN95fg6fQmekagrNwPaQC+MelMt40Q2/Mp8W8JscWuxz2NQV3BRTrpJr8F
	 SWiZPvs4N0WbQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240202154134.66967-1-krzysztof.kozlowski@linaro.org>
References: <20240202154134.66967-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 0/3] ASoC: codecs: qcom: tx-macro: minor cleanups
Message-Id: <170787174139.1088332.990817006837500918.b4-ty@kernel.org>
Date: Wed, 14 Feb 2024 00:49:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: FHB7YSXS6QQSFYTOKCCTUAREDHKD3DGC
X-Message-ID-Hash: FHB7YSXS6QQSFYTOKCCTUAREDHKD3DGC
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 02 Feb 2024 16:41:31 +0100, Krzysztof Kozlowski wrote:
> Few minor cleanups.  The series will conflict with my series:
> https://lore.kernel.org/alsa-devel/20240129143534.109196-1-krzysztof.kozlowski@linaro.org/T/#t
> 
> Depending what will come in first, I will rebase the other patchset.
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: codecs: tx-macro: Drop unimplemented DMIC clock divider
      commit: 58cef044e6ec88eef6f10565df8257138e2085ec
[2/3] ASoC: codecs: tx-macro: Mark AMIC control registers as volatile
      commit: b396071681ca65e66f2a8fce240cde26a6db5931
[3/3] ASoC: codecs: tx-macro: Simplify setting AMIC control
      commit: fd236653ab60bf64fde341ed9c940c04a542483a

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

