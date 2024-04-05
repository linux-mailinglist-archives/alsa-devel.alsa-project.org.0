Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4250F89A796
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Apr 2024 01:21:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD5402D5E;
	Sat,  6 Apr 2024 01:21:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD5402D5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712359288;
	bh=GISLT5oK/o/IQq1tDNBirwJ9eyt2MEiYKYIyxzI8NHU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qYTH/JJuCTfNWkg+bhHHy44LNzLP5+9r/OJXMCEzhcsSkCWLvN+89oO8XhpWvBMK/
	 epk9Mzu/bEJ/UYAidtTbilwQ2a0dsJ67td11qwRWqSfVMkecb6Nfaw/pZb+MEJgrb/
	 DzUttCXNPj66iUR9hhgGHSn6WjLu9YCW+zDu7zlE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C60ECF805F6; Sat,  6 Apr 2024 01:20:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D79AAF805F3;
	Sat,  6 Apr 2024 01:20:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45A48F8057F; Sat,  6 Apr 2024 01:20:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2CE7F8020D
	for <alsa-devel@alsa-project.org>; Sat,  6 Apr 2024 01:20:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2CE7F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sCLpdsAz
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 93D81612D4;
	Fri,  5 Apr 2024 23:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D18B3C433C7;
	Fri,  5 Apr 2024 23:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712359205;
	bh=GISLT5oK/o/IQq1tDNBirwJ9eyt2MEiYKYIyxzI8NHU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sCLpdsAzObzqlBz9zzkUzgNRR/FFqreuZLuTp1xhVp9sIjeF6b5IDkWJhicsbilsW
	 VCOuejWMPBdO7PgGdDvyN1CBP9JFV45f0O0TiBHk2AAYZbzVzN++MLxfK7t4W3lKnQ
	 GT37exkzFDArbQRz18Meo4Uyku38Cf6yN2ByBl6xEUhT3XRRdJOy9l0WlrIcF6oNZc
	 CVsubYyx+Xo+dfnMwAZHN/OmR2QSm4x9K1dzr86DP64mwgtL/Z4P9GaZ43EzWBiMen
	 rHhRcJ3hER3VM/UkgUj8hMXDmG9t8d0ZckZVG2ofJg1uRqlOMSZEeXSN5/wOAmInn3
	 HvNw7ZyqR1bhQ==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com,
 hdegoede@redhat.com
In-Reply-To: <20240405090929.1184068-1-cezary.rojewski@intel.com>
References: <20240405090929.1184068-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 00/13] ASoC: Intel: avs: Fixes and cleanups for 6.10
Message-Id: <171235920358.198289.9542168405810750674.b4-ty@kernel.org>
Date: Sat, 06 Apr 2024 00:20:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: KJHCTRE2BG64B5HDS5KGUNW6ZWYX5WBV
X-Message-ID-Hash: KJHCTRE2BG64B5HDS5KGUNW6ZWYX5WBV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KJHCTRE2BG64B5HDS5KGUNW6ZWYX5WBV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 05 Apr 2024 11:09:16 +0200, Cezary Rojewski wrote:
> Set of changes targeting the avs-driver only. No new features, patchset
> either fixes or fortifies existing code.
> 
> Patchset starts off with a fix for debugbility on ICL+ platforms which I
> have forgotten to fixup when providing support for these initially.
> The next two address copier module initialization, most importantly,
> silence the gcc 'field-spanning write' false-positive.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/13] ASoC: Intel: avs: Restore stream decoupling on prepare
        commit: 680507581e025d16a0b6d3782603ca8c598fbe2b
[02/13] ASoC: Intel: avs: Fix debug-slot offset calculation
        commit: c91b692781c1839fcc389b2a9120e46593c6424b
[03/13] ASoC: Intel: avs: Silence false-positive memcpy() warnings
        commit: 6dd68c2da44d92c25b323bcc2603421463437a64
[04/13] ASoC: Intel: avs: Fix config_length for config-less copiers
        commit: beeeee9686affef32ee04d8ae30db8c53cbc7aee
[05/13] ASoC: Intel: avs: Fix ASRC module initialization
        commit: 9d2e26f31c7cc3fa495c423af9b4902ec0dc7be3
[06/13] ASoC: Intel: avs: Replace risky functions with safer variants
        commit: 47714847592b574ff594ceca7ebe0ada70dbac3c
[07/13] ASoC: Intel: avs: Fix potential integer overflow
        commit: c7e832cabe635df47c2bf6df7801e97bf3045b1e
[08/13] ASoC: Intel: avs: Test result of avs_get_module_entry()
        commit: 41bf4525fadb3d8df3860420d6ac9025c51a3bac
[09/13] ASoC: Intel: avs: Remove dead code
        commit: d58275f474b4a27b4e97839ffe8d9fe55c0cc40a
[10/13] ASoC: Intel: avs: Wake from D0ix when starting streaming
        commit: 30df76bbcb59254ce646477e3e05f00021a10117
[11/13] ASoC: Intel: avs: Init debugfs before booting firmware
        commit: ff0aefe2d217ce6fec6487b225737b2019eb88c0
[12/13] ASoC: Intel: avs: Add assert_static to guarantee ABI sizes
        commit: c2b10acb62c195db2c976d614d9d8092ad6339ae
[13/13] ASoC: Intel: avs: Rule invalid buffer and period sizes out
        commit: 9a385993504e47a0fd6fd34b5384827b4abdee60

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

