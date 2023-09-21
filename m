Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA637A95BC
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 18:31:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43D71AE8;
	Thu, 21 Sep 2023 18:31:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43D71AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695313914;
	bh=SLe52/ZNusHSyYr2h7M2Ps6EeCSpN9/r7tz2OogFew4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WeksWT5Icu4NYNHdtLtyCBPpwibwIYoPuZslmsb6BQdO+3ul6T0vWWoItx/rEJkgA
	 OgU1vEuTABv4Hkh8lGiaShEHvE5iDPg9tdHTA8ki1u9wml+zB5kwmPGXHL2xC/HBEC
	 hQxG/hwrO7aeknhDbkWxki7WEjryRjm6UyrZtNzQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75652F805B1; Thu, 21 Sep 2023 18:30:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5EB5F80558;
	Thu, 21 Sep 2023 18:30:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48ACFF80551; Thu, 21 Sep 2023 18:30:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 291EFF80124
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 18:30:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 291EFF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bq7qsDhx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C4ECC61F31;
	Thu, 21 Sep 2023 16:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25518C611A7;
	Thu, 21 Sep 2023 16:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695313813;
	bh=SLe52/ZNusHSyYr2h7M2Ps6EeCSpN9/r7tz2OogFew4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bq7qsDhxaLKx75h6kmvoq2Hjry4UY45o+7F/ZRLYt3LWh85BDI+nPhwJ6LznIYgfi
	 6oJY2saGrm8jn1ncl3DPqKSjFujaLHyf3UrZ3JkoyzsdUNl8k/YSsuoVSth9rKKNRd
	 s673wQNTFduj7Y6jqxLBnKQNLydcyO+XSZU88LZiCdAuvlhEDxrzrfzKp42lQzsLFD
	 144n60gyE1NPAJJOsEacqce87FGIIe8XfYcG+ddGl6XUDdxrN6qTPup61dAzq8uba+
	 fuprD5HXoKFTf8gE3O7z5iMMVJZ0IQRg7u8r17RIbWh5H3KBr1bNnq/eqvlaZwFSfX
	 +7aRy+GuHEB0A==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <87o7hy7mlh.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7hy7mlh.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: simple-card: fixup asoc_simple_probe() error
 handling
Message-Id: <169531381178.61074.15791009259778353250.b4-ty@kernel.org>
Date: Thu, 21 Sep 2023 17:30:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: GBI6KVAIGYUO2HIZLTAZP7RJSMOQJN7T
X-Message-ID-Hash: GBI6KVAIGYUO2HIZLTAZP7RJSMOQJN7T
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 19 Sep 2023 05:34:18 +0000, Kuninori Morimoto wrote:
> asoc_simple_probe() is used for both "DT probe" (A) and "platform probe"
> (B). It uses "goto err" when error case, but it is not needed for
> "platform probe" case (B). Thus it is using "return" directly there.
> 
> 	static int asoc_simple_probe(...)
> 	{
>  ^		if (...) {
>  |			...
> (A)			if (ret < 0)
>  |				goto err;
>  v		} else {
>  ^			...
>  |			if (ret < 0)
> (B)				return -Exxx;
>  v		}
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-card: fixup asoc_simple_probe() error handling
      commit: 41bae58df411f9accf01ea660730649b2fab1dab

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

