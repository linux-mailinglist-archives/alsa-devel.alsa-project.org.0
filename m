Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3D57C0389
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 20:36:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC2621516;
	Tue, 10 Oct 2023 20:35:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC2621516
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696962989;
	bh=yBzcSftJxEqCztLT9VvKOdDs1KwwRk5x/oGlnnB88nU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iLts50RLoVDcdo29BFXzMG0SidnhKR7VKuyJjsu6nNW9I/izvNUtU0GRIw2oANLr7
	 BHXHfupFPcONrPOO1M82gv0bdh2kl2akZIinIScWSJE0eDwDXJfoX579b9CNulLYVk
	 qRjL62cQ2HITgzcX1mzanfKolcz8mIXuS05AjYV0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B2D2F802BE; Tue, 10 Oct 2023 20:35:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF083F802BE;
	Tue, 10 Oct 2023 20:35:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C428DF80166; Tue, 10 Oct 2023 20:33:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CECB1F80166
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 20:33:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CECB1F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uZSxPeL7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7FA2FB81D92;
	Tue, 10 Oct 2023 18:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A180C433CB;
	Tue, 10 Oct 2023 18:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696962800;
	bh=yBzcSftJxEqCztLT9VvKOdDs1KwwRk5x/oGlnnB88nU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uZSxPeL7jvC+twuHGkChvxvZh7kTC91tPfhPIfrA6IjU5DNN/XjslTfuGyX2sJi0a
	 l8iIJCtPj4pY32oJmInO/tLiHqApcgZmkkwNTMVEQzPW5SQIYi9wR9WIBpKV9wRUkW
	 alIlET2yb7mki3Y2URFSIF0ZgLRO5MrekCF5w/ZNEuZsLe6ISR5QKZ0mB8/IXI0ToU
	 Ie2XaeQfWqk/WH1bivlqo0L96rB46Y/YzoYKlooZRFwSPVD5Wqk8DJMzWhIzTrmMhB
	 +acy/g4hW7DJy7bV/yJTCf+dJjyLJ3KXzYlUl6D8YdW8jSdfQIQBKymCTqI2Ve5KeU
	 uIZDw+bJSOAxQ==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 patches@opensource.cirrus.com
In-Reply-To: <20231005135559.3117994-1-ckeepax@opensource.cirrus.com>
References: <20231005135559.3117994-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: cirrus,cs42l43: Update values
 for bias sense
Message-Id: <169696279894.221758.959134819176975869.b4-ty@kernel.org>
Date: Tue, 10 Oct 2023 19:33:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 5WLCKR7B7VLMENWIY3UH2NHYIODU7CXH
X-Message-ID-Hash: 5WLCKR7B7VLMENWIY3UH2NHYIODU7CXH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5WLCKR7B7VLMENWIY3UH2NHYIODU7CXH/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 05 Oct 2023 14:55:58 +0100, Charles Keepax wrote:
> Due to an error in the datasheet the bias sense values currently don't
> match the hardware. Whilst this is a change to the binding no devices
> have yet shipped so updating the binding will not cause any issues.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: cirrus,cs42l43: Update values for bias sense
      commit: 53ba32acb5ab137ba333c20e0c987bdd6273a366
[2/2] ASoC: cs42l43: Update values for bias sense
      commit: 99d426c6dd2d6f9734617ec12def856ee35b9218

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

