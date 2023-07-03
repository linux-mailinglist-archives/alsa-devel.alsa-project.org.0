Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFA2745FA4
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 17:15:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67EA620C;
	Mon,  3 Jul 2023 17:15:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67EA620C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688397352;
	bh=PLvNuEteQNzOZzBeGfr+Rrqy6OPYhROvqa4+UpbkGxY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ueU0fXJf/IJPoP6+ZwJBoz1IVra/38IkFI0x6UPvg5hkNWxj3ip3wJsyzyQxfHg5z
	 LLwe6iw+GJbf3njPJSjDmXXajgipZxx62+kTSItFERWCuUlHKHW5B2V0in0e5G9ihU
	 jiQ7jm0Vf7wGBiIEc23V/5DkWzN3/fS6Em5m1qc8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B649F80132; Mon,  3 Jul 2023 17:15:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E1DAF80132;
	Mon,  3 Jul 2023 17:15:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 281A5F80153; Mon,  3 Jul 2023 17:14:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E228F80100
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 17:14:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E228F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=noMGficf
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9648C60F53;
	Mon,  3 Jul 2023 15:14:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B86DC433C7;
	Mon,  3 Jul 2023 15:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688397291;
	bh=PLvNuEteQNzOZzBeGfr+Rrqy6OPYhROvqa4+UpbkGxY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=noMGficfSsyvDeFCUC1T4QBfqgzvnp9kulEe1CGdq93kNkIBQRQoiRzbeiUIevdhS
	 xt8bWqqdEp/HdZKNH4gWdux70xgXBII8BfvlvBt0oNLL8Az3bIS+gXJ7DKhArZU15h
	 8Y2myGEZXZYHdW8uk29tC4c5hpzA5hASlDFQT+UpRYMLTAZ6MuSfcETxkoPPmxDT4o
	 6Gb0wMhTQo4+nXK27nMF04b7gsnqTwkhG6R9psGjn0AGfZ6/eualGEr3l7J1AE2BeP
	 Jwi3X31xA0E7d7XWcvFZ+2Y+VJpZuMCGHpWdRbTlya3IrCWQ177MDN1nvv0GJY+EGH
	 /TJ5a+1DMCZTg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Johan Hovold <johan+linaro@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230630142717.5314-1-johan+linaro@kernel.org>
References: <20230630142717.5314-1-johan+linaro@kernel.org>
Subject: Re: [PATCH 0/5] ASoC: codecs: wcd938x/wcd934x: loglevel fix and
 cleanups
Message-Id: <168839728919.111324.17012721479110142993.b4-ty@kernel.org>
Date: Mon, 03 Jul 2023 16:14:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: 3ATDRECIE6TSP7GXFRQ3QJWMKUWYQHUO
X-Message-ID-Hash: 3ATDRECIE6TSP7GXFRQ3QJWMKUWYQHUO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3ATDRECIE6TSP7GXFRQ3QJWMKUWYQHUO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 30 Jun 2023 16:27:12 +0200, Johan Hovold wrote:
> When investigating a race in the wcd938x driver I noticed that the MBHC
> impedance measurements where printed at error loglevel which is clearly
> wrong.
> 
> Fix that, and clean up the logging somewhat by using dev_printk() and
> addressing some style issues.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: codecs: wcd938x: fix mbhc impedance loglevel
      commit: e5ce198bd5c6923b6a51e1493b1401f84c24b26d
[2/5] ASoC: codecs: wcd938x: drop inline keywords
      commit: 5db9fe9562aaefca3c972401a9e3d6454707b1d5
[3/5] ASoC: codecs: wcd938x: use dev_printk() for impedance logging
      commit: 17d59d9ed832742f9572fe5e77ed3a66f5ae404d
[4/5] ASoC: codecs: wcd934x: demote impedance printk
      commit: cb7d60ab98cfe12fdd6052142176d42682f78540
[5/5] ASoC: codecs: wcd934x: drop inline keywords
      commit: c93723ada378a63929b3135b4f30483383e88e05

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

