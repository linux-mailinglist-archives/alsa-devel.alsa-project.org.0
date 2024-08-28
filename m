Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE24962EA2
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Aug 2024 19:37:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B8BBBC0;
	Wed, 28 Aug 2024 19:37:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B8BBBC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724866654;
	bh=dI3XobX0HGmeBe0PSd1pA+FcZCDnu6L9bIjK6p7fdVc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mU/NL9DPz5Wh1T5gIxmDW+R9qjC/hV3bciWbriCHfqGMKl2HLl7MU0CUI+yBfhRRG
	 hWNIXHw2g6no3xWV1rquvtX0Y+6/Abb2J7ny4BZx73jRJlVEgh7fIh4+85tp6uuSiw
	 zNJEuwJfWVMPhUMMDTFJwRH1Jwj8m/3zUXFso158=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DD25F805EA; Wed, 28 Aug 2024 19:36:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CAF4F805CB;
	Wed, 28 Aug 2024 19:36:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22D12F805BF; Wed, 28 Aug 2024 19:36:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 083ADF80107
	for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2024 19:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 083ADF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fT+42xt7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id BDD34AE2CA9;
	Wed, 28 Aug 2024 17:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 208BBC4CEC2;
	Wed, 28 Aug 2024 17:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724866586;
	bh=dI3XobX0HGmeBe0PSd1pA+FcZCDnu6L9bIjK6p7fdVc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fT+42xt7zb8mUMGYjW2uGHbQCoTmiaeAbgImwZCLDcpSFdQvwXv+a6In+QPQEIcaF
	 b8V6zrDtRiQXr4CQ3AlhCON6Zbi5Fxz0h0d7K/kPxM1VU00vydwbA0WznDwRmRRU6+
	 wUkThXtpP5LI7DtpZKDfggt8S8pXW+O7d+GYKio8cG0Eh5c0AXnmH6rH80fYbZvaUn
	 9dfcMF8soEE9w2cE1vctzmW2nEyv+UKnMe36Q+W/iys7d+THN+BMN0568hdT0uJVEK
	 q1qt59+vub+WP76su0N21qLt3nXXm0yP6nBR3Zb4yuv7YOru1pyZ6wRFjnOJ8LEPmR
	 xysIoB5xoBnWQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87jzg2df7x.wl-kuninori.morimoto.gx@renesas.com>
References: <87jzg2df7x.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2-resend 0/2] ASoC: soc-pcm: makes
 snd_soc_dpcm_can_be_xxx() local function
Message-Id: <172486658585.355291.3036547245885851698.b4-ty@kernel.org>
Date: Wed, 28 Aug 2024 18:36:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: LIZASBQU3BUGMWKD7QLLR3KRMQT6DEJC
X-Message-ID-Hash: LIZASBQU3BUGMWKD7QLLR3KRMQT6DEJC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LIZASBQU3BUGMWKD7QLLR3KRMQT6DEJC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 26 Aug 2024 23:41:38 +0000, Kuninori Morimoto wrote:
> This is resend patch-set
> 
> No driver is calling snd_soc_dpcm_can_be_xxx() functions. We don't need
> to have EXPORT_SYMBOL_GPL() for them. This patch-set makes it static function.
> 
> v1 -> v2
> 	- rebased to latest branch (for-6.12)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: soc-pcm: move snd_soc_dpcm_can_be_xxx() to top
      commit: 4dd4baa4408a15d50233e85bae611d576ef77b92
[2/2] ASoC: soc-pcm: makes snd_soc_dpcm_can_be_xxx() local function
      commit: 290f31e943a29c93532b1684652b04fd60d0f696

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

