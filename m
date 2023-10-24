Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 939237D5AF9
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 20:55:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2162DA4C;
	Tue, 24 Oct 2023 20:54:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2162DA4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698173744;
	bh=hfj/OP6aoXgjAI/J017S7qAvyz9iybzNu+Ph4c3hQsA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RL8daHA0EzwykS5ew9x5rRZXJhv2Ba4eO6yBtUkSKroDMy1wgWBD3vpxArVBygTtp
	 1U6pj00O9uPgdyn5U/my1YIRIF0UwubwenS9uUpf1hgWQRnhXV276/8vgO0eVN/vOZ
	 ZLjQUNJCHYFyUIyckmf2myh6zroihPjZIVqDP0oE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB1B4F80587; Tue, 24 Oct 2023 20:53:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15D14F80580;
	Tue, 24 Oct 2023 20:53:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA877F8012B; Tue, 24 Oct 2023 20:53:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02E5EF80165
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 20:53:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02E5EF80165
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OI7bSuKn
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 55C70616E7;
	Tue, 24 Oct 2023 18:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0BAC433C8;
	Tue, 24 Oct 2023 18:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698173615;
	bh=hfj/OP6aoXgjAI/J017S7qAvyz9iybzNu+Ph4c3hQsA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OI7bSuKn6ye3NyRSGdkM0zIRCm711AeKNdtg3xRmhYbu/pLicktO+wyvr/Sw6LXaM
	 U/vINEsSsYyOQbMVIeJOfCB83qSUtLAllTPEktkLT1rGFNqN2OmVXj1HS/piOTU+2t
	 sj9T6xh3AL+zm1I6b5BsMW1hbDBHb9pvrPIfmE8Hb/wItJ+un/vGOyxk57FPL+Ju+s
	 7z+pLeUftwXqYVYMVEn9n/GM7CMngtOvH44ong4mx9lyVH6jJxULx85e6JCK24GdsQ
	 AU6vleJRskAy8z5kq89DMzU0J5Tt21BI4V9jFhnWazGyI+4nlNSq2iiEolSU0irRmv
	 jK/0Ja1KRfj6Q==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <20231021211534.114991-1-hdegoede@redhat.com>
References: <20231021211534.114991-1-hdegoede@redhat.com>
Subject: Re: [PATCH 1/6] ASoC: Intel: soc-acpi-cht: Add Lenovo Yoga Tab 3
 Pro YT3-X90 quirk
Message-Id: <169817361348.82257.9749834101801303750.b4-ty@kernel.org>
Date: Tue, 24 Oct 2023 19:53:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: WED6GLR5MNPSJ2QT6XSX42UCCR4VUSCY
X-Message-ID-Hash: WED6GLR5MNPSJ2QT6XSX42UCCR4VUSCY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WED6GLR5MNPSJ2QT6XSX42UCCR4VUSCY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 21 Oct 2023 23:15:28 +0200, Hans de Goede wrote:
> The Lenovo Yoga Tab 3 Pro YT3-X90 x86 tablet, which ships with Android with
> a custom kernel as factory OS, does not list the used WM5102 codec inside
> its DSDT.
> 
> Workaround this with a new snd_soc_acpi_intel_baytrail_machines[] entry
> which matches on the SST id instead of the codec id like nocodec does,
> combined with using a machine_quirk callback which returns NULL on
> other machines to skip the new entry on other machines.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: Intel: soc-acpi-cht: Add Lenovo Yoga Tab 3 Pro YT3-X90 quirk
      commit: 2cb54788393134d8174ee594002baae3ce52c61e
[2/6] ASoC: Intel: bytcr_wm5102: Add support for Lenovo Yoga Tab 3 Pro YT3-X90
      commit: 109cb2160128211ca7b17bad79cb0441f1440bc9
[3/6] ASoC: Intel: bytcr_wm5102: Add BYT_WM5102_SSP2 quirk
      (no commit info)
[4/6] ASoC: Intel: bytcr_wm5102: Add BYT_WM5102_MCLK_19_2MHZ quirk
      (no commit info)
[5/6] ASoC: Intel: bytcr_wm5102: Add BYT_WM5102_OUT_MAP quirk
      (no commit info)
[6/6] ASoC: Intel: bytcr_wm5102: Add BYT_WM5102_IN_MAP quirk
      (no commit info)

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

