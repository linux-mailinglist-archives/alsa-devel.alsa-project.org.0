Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC548ABDF3
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Apr 2024 03:05:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1C94DFA;
	Sun, 21 Apr 2024 03:05:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1C94DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713661536;
	bh=zsIYacikpcD55jKm+iNIYO7i4OgOVZdvFB3IGX220Cs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ML8WfKtCL7CRAfrYdEZ6HiVtf6dwafvc7hnDpXnBHaUBP/e+xmAJYhDtNX4EL4Kkk
	 GD4lApd9g15T4V8V7LGCyDJgUQh1BxndvsaDQlyNKe2LMSj3bxfk6iNR6AKK7omuxq
	 VlXXAgPHpP5juyj6R3sBvMbpcnnftzsniMktIxx8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2753F8057F; Sun, 21 Apr 2024 03:05:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DBC70F8058C;
	Sun, 21 Apr 2024 03:05:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31D8BF802E8; Sun, 21 Apr 2024 03:03:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 693A4F801C0
	for <alsa-devel@alsa-project.org>; Sun, 21 Apr 2024 03:03:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 693A4F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DpiFmXSM
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B024F60B2A;
	Sun, 21 Apr 2024 01:03:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962CDC072AA;
	Sun, 21 Apr 2024 01:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713661393;
	bh=zsIYacikpcD55jKm+iNIYO7i4OgOVZdvFB3IGX220Cs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DpiFmXSMl61Zx3X4COSLWu2+6TDtdsRsdav4ATP7y79M2YS/LSfqf9yAvF4xTS4F0
	 q7MdFW/23wp76hittNwQnbEXm/7/yeTJ8Mi525hQoRbHtNtPfhO8zT3xCL0UbJj3hZ
	 +jWlPi2r1AHgmiQRlCvdHMvHTZwSOSoyrI6Zi3qYCW1thmgWzE72+KTtvnyy/0Rm7+
	 qBiGBP6eJnP0Tq4hnNv5ZpI7JNQCTVAvvNKSGxanZODFqQHIU1HoS7B6DXDtxX+SKB
	 0WsyKi0Wr8ntAwvHCxjjdy6Mefe0txdrDSL5/BvnVrQAKfa7HVdaWebHDrjtIv8X1n
	 E9GDfo7tcAnGw==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com,
 hdegoede@redhat.com
In-Reply-To: <20240419084857.2719593-1-cezary.rojewski@intel.com>
References: <20240419084857.2719593-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: avs: Refactor IRQ handling
Message-Id: <171366139151.1739626.4193433952768635118.b4-ty@kernel.org>
Date: Sun, 21 Apr 2024 10:03:11 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: SHUVMVEWEZVM3HFLGDTJSRL4XBD4KIDE
X-Message-ID-Hash: SHUVMVEWEZVM3HFLGDTJSRL4XBD4KIDE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SHUVMVEWEZVM3HFLGDTJSRL4XBD4KIDE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 19 Apr 2024 10:48:55 +0200, Cezary Rojewski wrote:
> The existing code can be both improved and simplified. To make this
> change easier to manage, first add new implementation and then remove
> deadcode in a separate patch.
> 
> Simplification achieved with:
> 
> - reduce the amount of resources requested by the driver i.e.: IPC and
>   CLDMA request_irq() merged into one
> - reduce the number of DSP ops from 2 to 1:
>   irq_handler/thread() vs dsp_interrupt()
> - drop ambiguity around CLDMA interrupt, let skl.c handle that
>   explicitly as it is the only user
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: avs: New IRQ handling implementation
      commit: 7ce6ceeb77bfd9fb0b22203190bd6f57fe917b51
[2/2] ASoC: Intel: avs: Remove unused IRQ-related code
      commit: 84049e2db59ad9b09461b6d7ec56bd3e8fe75eca

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

