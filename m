Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 569E17620AE
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 19:56:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3626AE8;
	Tue, 25 Jul 2023 19:55:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3626AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690307800;
	bh=a8zTgQQOTRE+oCkaLUuvxSOVuhcsBaidITzLOZP5xGc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RWVCg06juXB17CDAqkXz2WxPEZfpqD7P8mLHZYfAdYTMFK2Oy2FA9RoeyXjdS9ZGw
	 ROR+abD7Q7/hbJqfIzeT0HIXADd18fEbUfmSZ/q7kVHQifCPWcnuQIdI5qiOhCz4fG
	 5GgqwyxfcVDWLay3pabvVIMhVbw4NQhG92CVp+TA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A98B7F805B2; Tue, 25 Jul 2023 19:54:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40B25F805AB;
	Tue, 25 Jul 2023 19:54:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2989F80589; Tue, 25 Jul 2023 19:54:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07E61F80587
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 19:54:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07E61F80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EfJ04aIU
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E49516184D;
	Tue, 25 Jul 2023 17:54:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C4DC433C9;
	Tue, 25 Jul 2023 17:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690307654;
	bh=a8zTgQQOTRE+oCkaLUuvxSOVuhcsBaidITzLOZP5xGc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EfJ04aIUZcWp+pTQaMh2aECwzSUV38BgzYcKGXKFvFYjlfVnUN7KDAHrhjCvdVc1K
	 btT+9D59Ci5hRHH3HxMHLp/G+He9i/VnJ/XZFdIJmYzHQM/eHr06CMRcN2m+dvkO83
	 30Y3w/kssvzOooWCje8FJR2IlGGVOMYHV7frIwz3zfI/9wY/3ZE/3K/Uynh7ePv9wg
	 gPGY7+VL+rtWaYN1WrQ0Q6NCpyoxDvvhakJgVzR2MvWJUCAIRhYM4kBJWCAUvk3sxf
	 /MDvqMbue24iSDZ3fVIqkWlb2FW1R3UUDtsfD2bFyTY2mQCTDPaHqmpMnRRFvmoLdd
	 9rSwZNWACg3AA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com,
 Vijendar.Mukunda@amd.com, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20230721090732.128282-1-shumingf@realtek.com>
References: <20230721090732.128282-1-shumingf@realtek.com>
Subject: Re: [PATCH v2 5/5] ASoC: rt722-sdca: fix for JD event handling in
 ClockStop Mode0
Message-Id: <169030765185.1533302.8296935616469460558.b4-ty@kernel.org>
Date: Tue, 25 Jul 2023 18:54:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: KS2XL5RTW5TX65FO77F2I46XONZ4IGZD
X-Message-ID-Hash: KS2XL5RTW5TX65FO77F2I46XONZ4IGZD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KS2XL5RTW5TX65FO77F2I46XONZ4IGZD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 21 Jul 2023 17:07:32 +0800, shumingf@realtek.com wrote:
> When the system suspends, peripheral SDCA interrupts are disabled.
> When system level resume is invoked, the peripheral SDCA interrupts
> should be enabled to handle JD events.
> Enable SDCA interrupts in resume sequence when ClockStop Mode0 is applied.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[5/5] ASoC: rt722-sdca: fix for JD event handling in ClockStop Mode0
      commit: a0b7c59ac1a9bae015a9b90dfda28158586006c8

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

