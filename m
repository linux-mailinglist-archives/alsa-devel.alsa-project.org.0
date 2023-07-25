Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDA97620AA
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 19:56:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D06A9857;
	Tue, 25 Jul 2023 19:55:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D06A9857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690307773;
	bh=zExnNly3Pv/iYFfBsFkooXVlk6xbSE9MhpB/v/w+i8M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l0fm9QrFKs2LP2UCmhIq/fkZrrCF/Aka7II1NZCjGVzmFHnWh2YLQ3fZuHZa01pR6
	 BhGtDEyh7+VHvyqoE7BIgCkPFXfB8OmAJ4vMnvAujlU7tZj5Wq2DvabGaBj6HrH2a9
	 PwcNO8OgxVVuYnsVrZGmZ8FglHbbisE+IbAIZP2g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6794CF8057F; Tue, 25 Jul 2023 19:54:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBC33F80563;
	Tue, 25 Jul 2023 19:54:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98893F80563; Tue, 25 Jul 2023 19:54:11 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id AFF5DF80557
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 19:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFF5DF80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=W6dHCBa0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5F7CB61777;
	Tue, 25 Jul 2023 17:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B6FC433C8;
	Tue, 25 Jul 2023 17:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690307647;
	bh=zExnNly3Pv/iYFfBsFkooXVlk6xbSE9MhpB/v/w+i8M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=W6dHCBa0jtybh5ok/2W0JHJ+xkejK1SIpWbl0ukxaD6M2duJ4uEWLkz2lBcfH6XRn
	 6MFjW62aDMzTv6iYQrfD+bmkbhc2WNgQD3qFHndnmKs4TDoitfUEQTuW+7tmQN/mTx
	 MEQJNsTR3PWTUPnjh+Yz96F3kRWH6O0T1diusK14zMYGyzwy5ksPTj6lL1OkPp3jt1
	 KY/45cw2aG+rmIfhmP5dg3VEP63JqK3zIrKksb0WjWNI9GtSjKtsIbe2yzXbLjt7Zj
	 vZDKPCTEdFIX336GCQcrm7HqRDNa69Ia9ItqsuAhERykjITA9ARYYJ5vHA8H3vV6Al
	 97of76LPJAlvg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com,
 Vijendar.Mukunda@amd.com, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20230721090711.128247-1-shumingf@realtek.com>
References: <20230721090711.128247-1-shumingf@realtek.com>
Subject: Re: [PATCH v2 3/5] ASoC: rt711-sdca: fix for JD event handling in
 ClockStop Mode0
Message-Id: <169030764471.1533302.4638887156880140052.b4-ty@kernel.org>
Date: Tue, 25 Jul 2023 18:54:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: UASE66IG5GW4MQVQVFLA4HJURAKLFVLP
X-Message-ID-Hash: UASE66IG5GW4MQVQVFLA4HJURAKLFVLP
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
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 21 Jul 2023 17:07:11 +0800, shumingf@realtek.com wrote:
> When the system suspends, peripheral SDCA interrupts are disabled.
> When system level resume is invoked, the peripheral SDCA interrupts
> should be enabled to handle JD events.
> Enable SDCA interrupts in resume sequence when ClockStop Mode0 is applied.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[3/5] ASoC: rt711-sdca: fix for JD event handling in ClockStop Mode0
      commit: 23adeb7056acd4fd866969f4afb91441776cc4f5

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

