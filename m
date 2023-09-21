Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A19C97A95BF
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 18:32:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD42DE85;
	Thu, 21 Sep 2023 18:31:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD42DE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695313964;
	bh=HQeco8190ix/liegyvioFxGiHh5bkP41j1jLytqngaI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tHK6piFpUYETVmkHrClyb2YC4bVGLh+JrhTccdc+Fni2XWGAthBF+Of3tpDsdDkEq
	 CYKx3lgoknfxu2adPbzHkOhSQYD0khL6pt0UuXq784uOSor+CqEDXLSpVwBsrCvIHk
	 WkJK8wrlviswjW/eJhlIr7W9OTNQ6lECEX9gITwM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EA63F805D8; Thu, 21 Sep 2023 18:30:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE7FBF805C9;
	Thu, 21 Sep 2023 18:30:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E7A4F805A0; Thu, 21 Sep 2023 18:30:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E432CF80558
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 18:30:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E432CF80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oBX+8GJm
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id F26B1CE228D;
	Thu, 21 Sep 2023 16:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6EBC611A7;
	Thu, 21 Sep 2023 16:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695313816;
	bh=HQeco8190ix/liegyvioFxGiHh5bkP41j1jLytqngaI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oBX+8GJmL/xQh1q7ux6Fpr+kYYZOTDBi60jSXGzacx7ueshhH9oH+j+mMkxoWSfzE
	 mDfpYzsfO4BtcfULQLVWy279af9Jq24I97xZ3SiFuDtDGR/SzuAm9qbIu/iBvaW6tE
	 kMhvht9d9DQnyKPbK55yIOw31WnDcStM0aGXyUtVIqwMS+qGX6Xht37rBcrEkZe7LT
	 GL7jZKGool+07TGxywaQ5uGzbQe0/GfMhZLtxPrX1n5FCqD5AT4otAVsgyEpnRxyKq
	 HpZIte8QmnHRpsDEgQEiiTp2Jl34Z4bJ2yZK6+F3BctfEZLSgp2VWhzbpYVUin42ry
	 c4wUft34RhowA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com
In-Reply-To: <20230919083606.1920202-1-yung-chuan.liao@linux.intel.com>
References: <20230919083606.1920202-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi: fix Dell SKU 0B34
Message-Id: <169531381351.61074.14535029532779711469.b4-ty@kernel.org>
Date: Thu, 21 Sep 2023 17:30:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: AGLCJBPSRJM6RZHK6LZH3PCH3DN36D4S
X-Message-ID-Hash: AGLCJBPSRJM6RZHK6LZH3PCH3DN36D4S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AGLCJBPSRJM6RZHK6LZH3PCH3DN36D4S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 19 Sep 2023 16:36:06 +0800, Bard Liao wrote:
> The rule for the SoundWire tables is that the platforms with more
> devices need to be added first. We broke that rule with the Dell SKU
> 0B34, and caused the second amplifier for SKU 0AF3 to be ignored.
> 
> The fix is simple, we need to move the single-amplifier entry after
> the two-amplifier one.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: soc-acpi: fix Dell SKU 0B34
      commit: b399f9706a1cbae42731cc420a46cfb9c3c6b10f

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

