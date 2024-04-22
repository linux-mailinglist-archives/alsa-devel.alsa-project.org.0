Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 551628AC668
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Apr 2024 10:12:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1F37E9F;
	Mon, 22 Apr 2024 10:11:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1F37E9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713773525;
	bh=tiunuwwIr+bT8wSKpR0JU0OLDOp21MSUyCfID33k7mE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=isXw/3YM1go1mqQwkDGWOk4bz4Cg6JjZuebvrDuwXP3S+HZCjyCbQAdDby00TwjR9
	 VUtyW/N7Wt6Ndea1UO+tQtRdTqjCSomKB8777ym2+1mAmfr8aYAH7bdtjvUcB4tbXl
	 kNWjkzySW/4J/tyW50jSgqqrHP1OnbViyoFDD+a4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFED4F805D3; Mon, 22 Apr 2024 10:11:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77EDAF805C7;
	Mon, 22 Apr 2024 10:11:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05DACF80578; Mon, 22 Apr 2024 10:11:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F661F800B5
	for <alsa-devel@alsa-project.org>; Mon, 22 Apr 2024 10:09:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F661F800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=naI0badn
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 81332CE0A5F;
	Mon, 22 Apr 2024 08:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18CDAC3277B;
	Mon, 22 Apr 2024 08:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713773363;
	bh=tiunuwwIr+bT8wSKpR0JU0OLDOp21MSUyCfID33k7mE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=naI0badn9M+zP1N20U8ONn8PYfBYNNNF3mY0EQMaidlznFfldtdbTsKqYImW9zkBZ
	 bCom4HawD65gcwUR3a4P0xMVu1TwizouXYGDnON+Jhxb/AOfxv/s4pJQ0nNUE5FLN1
	 /8fPzzxUAw8TDFk0jRb9grhSDEeqMSomK693ElBoGrnoh1uvmlj+d3lf0l/+OeDxBy
	 0I7kYBd8w4K6lWDBEJH0IQHgiqNrhW4rGUh+43bxJ9AAaUwTCv36/uaa9WRQyvU4nK
	 edYoF291g4S9xuoqx4RxG3z6WPptn841qCqUSI0clSlDga8+Y8l1BElMzyP7hLVV8S
	 YiVJaMvvFHhBQ==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 rafael@kernel.org
In-Reply-To: <20240419084307.2718881-1-cezary.rojewski@intel.com>
References: <20240419084307.2718881-1-cezary.rojewski@intel.com>
Subject: Re: (subset) [PATCH 0/2] ASoC: Intel: avs: Switch to acpi-nhlt
Message-Id: <171377336060.1755143.11859734715680324302.b4-ty@kernel.org>
Date: Mon, 22 Apr 2024 17:09:20 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: SBSVVD6AV53P2AIRCMQTXDZBBRVTERFE
X-Message-ID-Hash: SBSVVD6AV53P2AIRCMQTXDZBBRVTERFE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SBSVVD6AV53P2AIRCMQTXDZBBRVTERFE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 19 Apr 2024 10:43:05 +0200, Cezary Rojewski wrote:
> The change is based on rafael/acpi-nhlt [1] immutable branch which
> Rafael kindly prepared for me. Without the topmost changes to ACPI/NHLT,
> the patches present will fail to compile.
> 
> Recent changes for the ACPI tree [2] refactored interfaces of the NHLT
> table. Currently we have two implementations - one found in acpi
> subsystem (unused) and one in sound/hda/. As NHLT is part of ACPI, idea
> is to make the former useful and then switch all users of existing
> sound/hda/intel-nhlt.c to this new interface over time and remove the
> duplicate afterward.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASoC: Intel: avs: Switch to ACPI NHLT
      commit: f5d20b253d1a51aadb8881d899caaaa989217e89

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

