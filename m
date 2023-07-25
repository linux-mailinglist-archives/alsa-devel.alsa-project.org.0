Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A74A27620A6
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 19:55:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F09D183A;
	Tue, 25 Jul 2023 19:54:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F09D183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690307746;
	bh=Vp3027h2ekALyejMTURS8i8O9o92sQMak/pjGOVtjto=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hyeZABw33nOaBGmt5YaBerDvjbKQ2fsc+MVnSJZc+UWh+RDTMDB42G23/pmQAY/9A
	 wx/ll7vnAjUZwrZJccx5Vv52IiLQsLFSL+dnxI0NWxW6IWBJy9CkytlQwcmlVbwSd0
	 rhxXTsxaaMOa6Dy4lMZZp9XRJ1n9N9ilv7jPGJ0o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E72BF80552; Tue, 25 Jul 2023 19:54:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 339D6F8053B;
	Tue, 25 Jul 2023 19:54:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD49AF80549; Tue, 25 Jul 2023 19:54:06 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6300CF80149
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 19:54:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6300CF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NfDPz5lt
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AB0876184D;
	Tue, 25 Jul 2023 17:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CACCC433C8;
	Tue, 25 Jul 2023 17:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690307642;
	bh=Vp3027h2ekALyejMTURS8i8O9o92sQMak/pjGOVtjto=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NfDPz5lte8MhUWgySWTCxdne6RmEX1Qw/F7+cc5Q0n5z0AagwgHogwcs0WmKB3ces
	 wV6kA1jW27xqydX7ja7RRszpLVli4kSS2smOthqdXC/WhPbb0Vw0S6kfaNX+IFSRmE
	 OVNZz7/4LWp+NH6Ca5BISOB7PoXjcApy0d9Dd6ftbksjxh8o8jqLJEFWeEcXrJgUV6
	 qEAeHr/RZt4kRtjDHVnOHiONd84d7hiffoMI7kBT3XRv1NLUEsAp3O+haxYkiby/TP
	 3ViH4WbD20G7KqoytN8X+oabWv+lJr+lJjy1UL/sNnappsz6J10D4w3ICN+8yVPeyp
	 GV97tZRzLrvFg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com,
 Vijendar.Mukunda@amd.com, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20230721090643.128213-1-shumingf@realtek.com>
References: <20230721090643.128213-1-shumingf@realtek.com>
Subject: Re: [PATCH v2 1/5] ASoC: rt5682-sdw: fix for JD event handling in
 ClockStop Mode0
Message-Id: <169030763991.1533302.13539493194863717489.b4-ty@kernel.org>
Date: Tue, 25 Jul 2023 18:53:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: B23ADP4MVWASQPYDM343DHQT4VRVXL4C
X-Message-ID-Hash: B23ADP4MVWASQPYDM343DHQT4VRVXL4C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B23ADP4MVWASQPYDM343DHQT4VRVXL4C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 21 Jul 2023 17:06:43 +0800, shumingf@realtek.com wrote:
> When the system suspends, peripheral Imp-defined interrupt is disabled.
> When system level resume is invoked, the peripheral Imp-defined interrupts
> should be enabled to handle JD events.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: rt5682-sdw: fix for JD event handling in ClockStop Mode0
      commit: 02fb23d72720df2b6be3f29fc5787ca018eb92c3

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

