Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38858731AB6
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 16:01:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88DE0823;
	Thu, 15 Jun 2023 16:00:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88DE0823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686837663;
	bh=IacgEK9Jdc3F5jDBfHVX7mYpC3mWqaiQ7huWmQ6BiyI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QwXON8OFd6IGPOZb4GXeTIAacuFr0zNfsPWG2v+WMf4qsVDeBlLCijXSQZ/JPF7X3
	 nND9llGY3eTVpt+evSwIZ98pxilfrYEC7m2v3hsC6hrlVkuQXcVXUnp9B+8gQla8S9
	 H2/ahlmx//RPhmZq5lfROaM9obVvIUf3vR4uPTQc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEFFEF8058C; Thu, 15 Jun 2023 15:58:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC3A4F80588;
	Thu, 15 Jun 2023 15:58:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93190F8057A; Thu, 15 Jun 2023 15:58:40 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BE5C3F80571
	for <alsa-devel@alsa-project.org>; Thu, 15 Jun 2023 15:58:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE5C3F80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PHSzg9W1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AC1EA63B97;
	Thu, 15 Jun 2023 13:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB39C433C0;
	Thu, 15 Jun 2023 13:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686837517;
	bh=IacgEK9Jdc3F5jDBfHVX7mYpC3mWqaiQ7huWmQ6BiyI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PHSzg9W1hXzkyYhLqpdJNCcS0XNkUYr/V0JZPz8i8SOveprKjZknkncgTK/OCpjjN
	 7zL6VpIrk4XYrcB394RkW230JestkLVQIP+uvr0ML7yWae8xX7lNYh7r91ay3uxmST
	 AqwyBkmMYF9P9U8xEPUahnCEpXx+P/2GSbLu8ar/OKYCHudPV/VXDkinWkG2kqr5LW
	 iLHdFn7C0BYXthDjLUxRix2NkM5Ar8LXaaFa9UcW7JV+eqAH8aCJVTiKuBTTxZzOIY
	 talg1490HLK+M1zxvro1nDkdohl0lIbkEBvHD7HBT5ZuGNSK7OLxNbUKzG2rU5z64S
	 UJF+mEJ6ePadQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, YingKun Meng <mengyingkun@loongson.cn>
Cc: krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, loongarch@lists.linux.dev,
 loongson-kernel@lists.loongnix.cn
In-Reply-To: <20230615122718.3412942-1-mengyingkun@loongson.cn>
References: <20230615122718.3412942-1-mengyingkun@loongson.cn>
Subject: Re: [PATCH v4 1/3] ASoC: Add support for Loongson I2S controller
Message-Id: <168683751466.557448.16150477443606791325.b4-ty@kernel.org>
Date: Thu, 15 Jun 2023 14:58:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: SFEEU53TGE675JCOJTP7H657MJ5A3LMC
X-Message-ID-Hash: SFEEU53TGE675JCOJTP7H657MJ5A3LMC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SFEEU53TGE675JCOJTP7H657MJ5A3LMC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 15 Jun 2023 20:27:18 +0800, YingKun Meng wrote:
> Loongson I2S controller is found on 7axxx/2kxxx chips from loongson,
> it is a PCI device with two private DMA controllers, one for playback,
> the other for capture.
> 
> The driver supports the use of DTS or ACPI to describe device resources.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: Add support for Loongson I2S controller
      commit: d84881e06836dc1655777a592b4279be76ad7324

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

