Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73152805594
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 14:12:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EB7AAE9;
	Tue,  5 Dec 2023 14:12:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EB7AAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701781970;
	bh=kwsb6tts72T6V9qclVEow9xNjCQcD8Mt86iOePyV0cQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qjl1Jh+ryWbQmRl3QkHTcYNLDwHGvWUtWVdlSYyg4AEVGYj0xbWtTsCazG/KyqeGX
	 SpYHXjjSnYeSfY3huXQ51XtGNjn8Vtg6OyBRSxfanKEJsxJryTOCbWnqIyp0EasW4c
	 UyY9WOdT9o9DL2UNGsm85CvGtwjTv6JQ73ePtAQw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E28F0F800E4; Tue,  5 Dec 2023 14:12:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE78AF805BA;
	Tue,  5 Dec 2023 14:12:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4803F800AC; Tue,  5 Dec 2023 14:12:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8FDABF800AC
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 14:11:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FDABF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rFXNuKNV
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C15DECE17D5;
	Tue,  5 Dec 2023 13:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6588BC433C9;
	Tue,  5 Dec 2023 13:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701781914;
	bh=kwsb6tts72T6V9qclVEow9xNjCQcD8Mt86iOePyV0cQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rFXNuKNVuQQ6DYDzGAH33nX6cg5+jBLYPA6gr8NSi3eln8bIekN6YaOwMTpuKS6KA
	 ICqZwCZyNBPv3ahc1oATCPT59lbGcyUKrAaB2OKyUZlJnWGWCOiP/zMU/874pjwa9K
	 Zndhz7qJ9OA4Cxi6Sm5xeyoN6aToncZfGfAnvRVcdSx1VrlFdT80ZZFMzh/cZpa/J8
	 zBSbO2R0s/T44XaFJL6ECamycNW+1SFSBSYI79axoGvSy/pOFcsNZ6ieWdWXJcZg0f
	 iFqFwGd1BOmZS1CWBIpKQe76iOTZg/kDnWN+PNP7KVeeFsB+o2Qtw/4/agFI3eIaUk
	 IBEQ6JbrIygdg==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Yang <yangxiaohua@everest-semi.com>, alsa-devel@alsa-project.org
In-Reply-To: <20231202123946.54347-1-hdegoede@redhat.com>
References: <20231202123946.54347-1-hdegoede@redhat.com>
Subject: Re: [PATCH v2 0/4] ASoC: Intel: bytcht_es8316: Determine
 quirks/routing through ACPI DSM
Message-Id: <170178191212.32878.12010863104937797605.b4-ty@kernel.org>
Date: Tue, 05 Dec 2023 13:11:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: NJU36EERFY5DRR37HOESWPY23C4EVNPZ
X-Message-ID-Hash: NJU36EERFY5DRR37HOESWPY23C4EVNPZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NJU36EERFY5DRR37HOESWPY23C4EVNPZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 02 Dec 2023 13:39:42 +0100, Hans de Goede wrote:
> This takes some of the work done to auto-configure quirks/routing
> for ESS83xx codecs by getting the info from ACPI from:
> https://github.com/thesofproject/linux/pull/4112
> 
> And then builds on top of this to add auto-configuration to
> the bytcht_es8316 board driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: es83xx: add ACPI DSM helper module
      commit: 9c8bec3b63255ca04e5dad87471a35790aec06dc
[2/4] ASoC: Intel: bytcht_es8316: Dump basic _DSM information
      commit: b71e1d3789946a20e0e34349f4a874604ac65c3e
[3/4] ASoC: Intel: bytcht_es8316: Add is_bytcr helper variable
      commit: e8acf91a4013202934313f3c2968e6962daaffff
[4/4] ASoC: Intel: bytcht_es8316: Determine quirks/routing with codec-dev ACPI DSM
      commit: 7650862f4e72d2533356ec001b8ea8d5839aced0

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

