Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 830F27BE9B6
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 20:38:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FD87ED2;
	Mon,  9 Oct 2023 20:37:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FD87ED2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696876697;
	bh=eK/IoEf0w1TEmPULmN+xgJZqbJo1CEPnj1s+f8XTlGs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=JcQHRQbAxguhONV2HBCwalqV4YgHpBMdEATwFy91vY+Fbi87Dod7gCjedR/LN1A9Z
	 kJ/yuKdtm6PrT0cvnZ/kEcl5hcI1tgqSOU53FDzuIgqzqdLtQrm41j9K+bnWEpIdhU
	 DRGy34oiEGNLTzdnoDQ3PYDlZbGB0eRYQxh4paCw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6BD5F80570; Mon,  9 Oct 2023 20:36:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37EDCF8027B;
	Mon,  9 Oct 2023 20:36:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89C32F80536; Mon,  9 Oct 2023 20:36:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E500F8027B
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 20:36:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E500F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UOFngcAx
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D1C46CE19B3;
	Mon,  9 Oct 2023 18:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B0EC433CA;
	Mon,  9 Oct 2023 18:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696876583;
	bh=eK/IoEf0w1TEmPULmN+xgJZqbJo1CEPnj1s+f8XTlGs=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=UOFngcAxK7Dhr8ECq4/J5Rh0XUxCGiy4Bbc1r9FM3FVadhVS3nXNYiJr/PcSrzs3E
	 VIVwkWK1gc6ir19WjU3FBU6ptz/Iq1eTKwX7n2gG8Vt/hjm3KJXh2UpWLgpnMwOP2w
	 CSgj1UABH86lYB/VS6orO+D36eNr0w8v4veBu6c4/wd1hD0sGt9R/w6ETXK1kw++u7
	 NBJ5z9ahfs6OzFAlZRA5qQZ6AvODia1qv7yaa22FF6ox1GCBG3pCff9dBB5mxb0bOH
	 SCwoznfVv5fMsX50lG9u2gIQ72CIwms22KL3cgbUI0YF46X1URlWFMPVR7SppV5FmE
	 41Jj2ajf2PxMA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231003155710.821315-1-krzysztof.kozlowski@linaro.org>
References: <20231003155710.821315-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 0/2] ASoC: codecs: fix widget name comparisons
Message-Id: <169687658062.138823.3860753244741067413.b4-ty@kernel.org>
Date: Mon, 09 Oct 2023 19:36:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: BSBY44X7BCUQYFEG5LNAEM54YGEG3FMK
X-Message-ID-Hash: BSBY44X7BCUQYFEG5LNAEM54YGEG3FMK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BSBY44X7BCUQYFEG5LNAEM54YGEG3FMK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 03 Oct 2023 17:57:08 +0200, Krzysztof Kozlowski wrote:
> Some codec drivers compare widget names with strcmp, ignoring the component
> name prefix.  If prefix is used, the comparisons start failing.
> Add a helper to fix the issue.
> 
> If the approach looks good, I will fix other codec drivers.
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: soc-dapm: Add helper for comparing widget name
      commit: 76aca10ccb7c23a7b7a0d56e0bfde2c8cdddfe24
[2/2] ASoC: codecs: wsa-macro: handle component name prefix
      commit: c29e5263d32a6d0ec094d425ae7fef3fa8d4da1c

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

