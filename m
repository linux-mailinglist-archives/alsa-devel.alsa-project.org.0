Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 418D481CAC0
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Dec 2023 14:30:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32077AEA;
	Fri, 22 Dec 2023 14:30:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32077AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703251845;
	bh=RuNb2lHj56WZdYXpKxgjEW4dhGWjWseHrdtSaaLBKfI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vVvkFQ+rUReBFAIUUY4WYBiLnIUHdOsz5Kg0VSrsfWs5iJsggB+H3Lg24xeK1pUe6
	 fU32HK2Cpz7XMdC1rk4pH5hmAfvoSM1CZGm6/TMgj1acODGDOK6sJFkMKcF+NE52i9
	 xJleAkE4lhmYgY81SkE/JDm0ZDLNu5jYvBuHyoMc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B72DF80578; Fri, 22 Dec 2023 14:30:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA147F80431;
	Fri, 22 Dec 2023 14:30:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 718D5F8016E; Fri, 22 Dec 2023 14:30:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 088FDF800F5
	for <alsa-devel@alsa-project.org>; Fri, 22 Dec 2023 14:29:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 088FDF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YLAcLAc9
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 3C3FAB822EB;
	Fri, 22 Dec 2023 13:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28391C433C7;
	Fri, 22 Dec 2023 13:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703251794;
	bh=RuNb2lHj56WZdYXpKxgjEW4dhGWjWseHrdtSaaLBKfI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YLAcLAc9ur45/i2UyYKihEApRbSgZEPeX8YWSoekT4rnIlMO4xPjoD1/nsRrHModR
	 ziS6SIg1vUjg67rdXKdqkG08CzOBDb4+7Cctq/LT6cwNuAkOXCnx3mh3Y6eAk4nCrx
	 F5SjW5BIMj5dnFDowUAMicURP6JVrKhMI6W/vz/jDg48tpkwmrULEJg40ita/N3maX
	 5HvdWhzQk5zJM2fjxPEU/Y+D9DfDGfI4Y0OPVlxVgc+GG7q1AdqYZqoJOdYjdxDcsy
	 drLZDI148h8kgUpE7wnM4Q9ufm/hZSC+ayyFfJeAApljMmaMeumKJtvUdSsj9DBFn1
	 ysLslW6bZIfbw==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org
In-Reply-To: <20231126214024.300505-1-hdegoede@redhat.com>
References: <20231126214024.300505-1-hdegoede@redhat.com>
Subject: Re: [PATCH 0/7] ASoC: rt5645: Add Acer Switch V 10 quirk + report
 quirks in components string
Message-Id: <170325179287.61152.14578936748460657175.b4-ty@kernel.org>
Date: Fri, 22 Dec 2023 13:29:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: UAHBVQOXPP5YH3KRSEI7U42EAJ6MSDGX
X-Message-ID-Hash: UAHBVQOXPP5YH3KRSEI7U42EAJ6MSDGX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UAHBVQOXPP5YH3KRSEI7U42EAJ6MSDGX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 26 Nov 2023 22:40:17 +0100, Hans de Goede wrote:
> This patch-series adds a quirk for the Acer Switch V 10, which uses
> a DMIC on the DMIC2 input, rather then the default analog mic on IN2.
> 
> Most of the patches are actually for adding a component string with
> mic and speaker routing information so that the UCM profile can use this
> instead of duplicating all the DMI quirks in the UCM profile.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: rt5645: Drop double EF20 entry from dmi_platform_data[]
      commit: 51add1687f39292af626ac3c2046f49241713273
[2/7] ASoC: rt5645: Add platform-data for Acer Switch V 10
      commit: 8f28e1996a786a7538d65e5258d3eecb92943673
[3/7] ASoC: rt5645: Refactor rt5645_parse_dt()
      commit: f72a9c2b8f1487181302d69fb82d5c76226be3fb
[4/7] ASoC: rt5645: Add rt5645_get_pdata() helper
      commit: b4635b9cd9ae48050d72b645cc53175788bebf52
[5/7] ASoC: rt5645: Add a rt5645_components() helper
      commit: 4cd7654553b3cf1ce5a7560f0492f0431785dfae
[6/7] ASoC: rt5645: Add mono speaker information to the components string
      commit: 8184e1db699befc5101bcfe401283becfc228a0b
[7/7] ASoC: Intel: cht_bsw_rt5645: Set card.components string
      commit: f87b4402163be352601f7a012ab0d8dba7ecc64d

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

