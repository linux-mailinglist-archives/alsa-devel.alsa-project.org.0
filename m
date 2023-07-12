Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C952750727
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 13:52:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ADC283B;
	Wed, 12 Jul 2023 13:51:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ADC283B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689162731;
	bh=UZ+rY9O1PNJa3QP18G5pxuyjPuqBnCIqNKMIU6dIxgs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YRPDzLxyiSZGsPUCYU3v3z+wBpjG6tQidq4wDPWWr/4Ow08RDo4GItP64+ZHyguSv
	 OHszGaxGDV/rH+c9WqvC5uDhVhTfAq33VVAbSsWVhnNyj+XlNODBp5LIz7ypk5AfrR
	 Gdyowm+MbRt+w0nlPMVd8d6JhMsYnwabicGYUTLE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F288F80549; Wed, 12 Jul 2023 13:47:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84909F8053B;
	Wed, 12 Jul 2023 13:47:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39393F80619; Wed, 12 Jul 2023 13:47:29 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D61A1F80612
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 13:47:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D61A1F80612
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KiJikrD7
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C422D61780;
	Wed, 12 Jul 2023 11:47:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70DA5C433C8;
	Wed, 12 Jul 2023 11:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689162444;
	bh=UZ+rY9O1PNJa3QP18G5pxuyjPuqBnCIqNKMIU6dIxgs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KiJikrD7W0oIVkZf5Jv8UMn54jPBL6yDRfWD5AorynCRn+GIFrmeSJd5kurCexzIT
	 eZbyjIgHPF0DvZSytbgNY2UhIHqOmkVtrDGae25N2e5PcjVeeIuwn3YlzHb4jcrrMr
	 z/EeOPp+RYspffO0RDLZCB8D7nUQqulIwhCKymDV8SKKnZvA5HbLFokpC0h1D+u/k4
	 owh6IIMALDdC1ukIfdPBhgBwvP8mI5b4DUUFnhn2KyQ+/G2hguNln9aNZQWrze6YvN
	 xBL0WKheY72qpa2Z9xER+5BraPEMOTJCkn7Qj2YJ94nqC/hH3ZZB2A7UqeEJreYETI
	 E7dUPqEsEhvSQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com,
 brent.lu@intel.com
In-Reply-To: <20230705042349.24905-1-shumingf@realtek.com>
References: <20230705042349.24905-1-shumingf@realtek.com>
Subject: Re: [PATCH 1/3] ASoC: rt5645: implement set_jack callback
Message-Id: <168916244218.46574.14620911920489886159.b4-ty@kernel.org>
Date: Wed, 12 Jul 2023 12:47:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: 7FSAZMQB33WEHTTBQA2NY4JS3JYLYLXI
X-Message-ID-Hash: 7FSAZMQB33WEHTTBQA2NY4JS3JYLYLXI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7FSAZMQB33WEHTTBQA2NY4JS3JYLYLXI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 05 Jul 2023 12:23:48 +0800, shumingf@realtek.com wrote:
> Add a wrapper function to support set_jack component driver callback.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: rt5645: implement set_jack callback
      commit: 7f6ecc220272dff53b7cec0ae2a863eefcb5335b

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

