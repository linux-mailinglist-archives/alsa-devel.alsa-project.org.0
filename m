Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C392B98624B
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2024 17:10:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A953E83E;
	Wed, 25 Sep 2024 17:10:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A953E83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727277038;
	bh=v6ZqQ0h3Q4wFy9NSRlR9T2wiHt8IegbsTzeMyUTfV/I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oHdpxv4JswhwqEfJt/LJepvleY1apY/o9Cq4PiOfnBCqq4lJSE0QebxZ0LTwAfL0c
	 mDFd4uJKSm1txn6nUZIt9d2MNCgnfv7jlnFGgAjIbopS02GUp60bOPyu1GzJjzwNrC
	 Aiz0au3AsBHsRS4+luhffxNc/eZI4XjEBVQAFkps=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43140F80266; Wed, 25 Sep 2024 17:10:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A0A6F805AC;
	Wed, 25 Sep 2024 17:10:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7148BF802DB; Wed, 25 Sep 2024 17:10:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66E52F80107
	for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2024 17:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66E52F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EH8GCQxn
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 02DFE5C5D27;
	Wed, 25 Sep 2024 15:09:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E28FC4CECE;
	Wed, 25 Sep 2024 15:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727276996;
	bh=v6ZqQ0h3Q4wFy9NSRlR9T2wiHt8IegbsTzeMyUTfV/I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EH8GCQxnuNLmojJvnFgDo2oOw+22mOTHKQnwSFJhAIxA7CHF7fFinMasmGo/htt0S
	 FNP1s3y3lRGu6rG2krldFh6PNWoHQMCbeFcHxDUUl9SMtrKVkLcZziyXSthqOSwawi
	 mWlKW72HAqZioIonpExemwMKEzbrm71Ilzt1DUuet4zcyfUVx/6b9v2o58rLLzj7zO
	 fMq/i1quOb+wW8sxf1oyO1kz8nbYC93NTXQ8akNVf3b2Yg/cpz1iLDVTnPZEkATDEY
	 NbZaC7IPHlN3rPs57DWIm0YisYu7XeE9IR9mHnygVMNyR3EQg0xQwWhOjBGWgG8AuA
	 92jB+BOVLrCSA==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org, a39.skl@gmail.com,
 linux-sound@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 vkoul@kernel.org, klimov.linux@gmail.com
In-Reply-To: <20240925043823.520218-1-alexey.klimov@linaro.org>
References: <20240925043823.520218-1-alexey.klimov@linaro.org>
Subject: Re: (subset) [PATCH REVIEW 1/2] ASoC: codecs: lpass-rx-macro: fix
 RXn(rx,n) macro for DSM_CTL and SEC7 regs
Message-Id: <172727699157.2075752.5178047483756857834.b4-ty@kernel.org>
Date: Wed, 25 Sep 2024 17:09:51 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: TCHXABXNAXVJATLXJJ4ITUEUL3O327V4
X-Message-ID-Hash: TCHXABXNAXVJATLXJJ4ITUEUL3O327V4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TCHXABXNAXVJATLXJJ4ITUEUL3O327V4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 25 Sep 2024 05:38:22 +0100, Alexey Klimov wrote:
> Turns out some registers of pre-2.5 version of rxmacro codecs are not
> located at the expected offsets but 0xc further away in memory.
> So far the detected registers are CDC_RX_RX2_RX_PATH_SEC7 and
> CDC_RX_RX2_RX_PATH_DSM_CTL.
> 
> CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n) macro incorrectly generates the address
> 0x540 for RX2 but it should be 0x54C and it also overwrites
> CDC_RX_RX2_RX_PATH_SEC7 which is located at 0x540.
> The same goes for CDC_RX_RXn_RX_PATH_SEC7(rx, n).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASoC: codecs: lpass-rx-macro: add missing CDC_RX_BCL_VBAT_RF_PROC2 to default regs values
      commit: e249786b2188107a7c50e7174d35f955a60988a1

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

