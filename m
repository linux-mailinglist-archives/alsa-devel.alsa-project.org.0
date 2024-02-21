Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E1685CD14
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Feb 2024 01:51:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50568844;
	Wed, 21 Feb 2024 01:51:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50568844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708476690;
	bh=f0jG7JZ9oh2O1noEl7FSZJMj5418rIWIIHqWyudoGRk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AqsBtLe21GxzRw5KhiMjUsIPpNpxX6pKhaY85p6rrpIIbezdTjztjnnRzNqxWszs6
	 s+gscZDvD+SnU8v9YkHmVp6Hg4c4BqLQs+KxGKxxOm+lizYex4laFgSN9NaQqOLvE8
	 tYIhW+puRlpy+RaNxaOqOzNP2yFm49NgygcySwkU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 676C5F805A0; Wed, 21 Feb 2024 01:50:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0CBAF805A9;
	Wed, 21 Feb 2024 01:50:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69420F8047D; Wed, 21 Feb 2024 01:48:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BD2FF800ED
	for <alsa-devel@alsa-project.org>; Wed, 21 Feb 2024 01:48:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BD2FF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aPrYYuCB
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7A4846135C;
	Wed, 21 Feb 2024 00:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30ADEC433F1;
	Wed, 21 Feb 2024 00:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708476524;
	bh=f0jG7JZ9oh2O1noEl7FSZJMj5418rIWIIHqWyudoGRk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aPrYYuCBOEeHEvtgSRelFiBVH9qMaD+KPqoooZBez0TvDeo/idezdVyG/a/ZeA7TZ
	 R6ykl9fL46Hrvgp0COwiog14DB0o9T11hfZmPL7natdSMoGIBGmXuRbp3xCek3jtJp
	 NWjld4EeunGceUwcWYjnbatJ4bvfVENx3B2X64n4H2l2qq2yfIEm8xIOaq44eTDESj
	 kTalKSYeB97PYgepODNne24nkHiZqDoirwZBfH3/y1tv5ZhRpXA3mbDiji5TXdiZ5J
	 h1t6Lat8viEhVL0gxNTyy2CwhXr8R1ZtvnwRals7CWkLSP5KF8q+UZ7hh/INAtT9EA
	 i/rdPoNJCHHBQ==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mario.Limonciello@amd.com,
 venkataprasad.potturu@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Lucas Tanure <lucas.tanure@collabora.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 Carlos Bilbao <carlos.bilbao@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20240214104014.1144668-1-Vijendar.Mukunda@amd.com>
References: <20240214104014.1144668-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 1/5] ASoC: amd: ps: refactor acp device configuration
 read logic
Message-Id: <170847652092.70487.7212581816199412994.b4-ty@kernel.org>
Date: Wed, 21 Feb 2024 00:48:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: UZ3LYSAXI3DNQMJN22IHI6CQZCW3CGKV
X-Message-ID-Hash: UZ3LYSAXI3DNQMJN22IHI6CQZCW3CGKV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UZ3LYSAXI3DNQMJN22IHI6CQZCW3CGKV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 14 Feb 2024 16:10:01 +0530, Vijendar Mukunda wrote:
> Refactor acp device configuration read logic and use common function
> to scan SoundWire devices.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: amd: ps: refactor acp device configuration read logic
      commit: 0386d765f27a1fd3ed2ed6388a07e26d9659936d
[2/5] ASoC: amd: ps: refactor acp child platform device creation code
      commit: eaf825037d6df89811d43391be920bf6ad731463
[3/5] ASoC: amd: ps: remove acp_reset flag
      commit: 3c697ced399cac295c34c9611f05d04f4c951aa9
[4/5] ASoC: amd: ps: fix for acp pme wake for soundwire configuration
      commit: c76f3b1f9b9ae20f8c944bb01c395329d525a917
[5/5] ASoC: amd: ps: add machine select and register code
      commit: bbf3e6145ea09cf346ce09146b0b98415095f170

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

