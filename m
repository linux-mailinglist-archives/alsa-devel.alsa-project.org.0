Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DCA6C3203
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Mar 2023 13:47:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6353B1F0;
	Tue, 21 Mar 2023 13:46:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6353B1F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679402861;
	bh=NK7Qa4/kmnTtDIuShrMbbctCm/ZSCmINfV6f2ojz/kY=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T6Q5xH/62qGQiJT1VmMehDVp65wogXXbO2GnmJh7YAd3UUP6L/fQ/UGnZnHd/uVlO
	 3pRj/Z24fbTbWf1l79geIxxT1dPc1jZcaVhPhDryMLH0f691qz8Iw/H2EUWyNN4Igt
	 8LKm12/ggGnJnMI5252V6P2hdaMYSjZ6tF9kpDTA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADA05F80254;
	Tue, 21 Mar 2023 13:46:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 627A5F8027B; Tue, 21 Mar 2023 13:46:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85CE7F800C9
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 13:46:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85CE7F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eUphMwq+
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B91EAB8164A;
	Tue, 21 Mar 2023 12:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8BF7C433D2;
	Tue, 21 Mar 2023 12:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679402784;
	bh=NK7Qa4/kmnTtDIuShrMbbctCm/ZSCmINfV6f2ojz/kY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eUphMwq+Y1iiFAmpinx4VQbhWdgjf4hPT4v/XzR2fbGs8jdXQYtftiVcArvK/1F4H
	 s/lAIzEzxGXY4Agf1HzZ8Mh82B0dK5LiPiPisTqjsDGBV7vC99KgTEy4xkyogmQlN3
	 l3TcSKUeoBEvO7164xC+MPFOiho+o6vzFII2oeylo71PWPfpeHCLUWqcqMqBVnxl8C
	 I/gbU7WL9tNQx85G0PuDjNcKRgt5gGOvvBjk9q6ml7VcdfkwC/iWOsDr0JsfvQ/hyi
	 KPfmxCnyVYcXhal5IAgqdaQKYsTO0bgL0STyMVO507EmSLCWwD6daFUj+Kq4hZKtCd
	 YqCyu98JGBDWw==
From: Mark Brown <broonie@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Jianhua Lu <lujianhua000@gmail.com>
In-Reply-To: <20230318141440.29023-1-lujianhua000@gmail.com>
References: <20230318141440.29023-1-lujianhua000@gmail.com>
Subject: Re: [PATCH] ASoC: cs35l41: Add 12288000 clk freq to cs35l41_fs_mon
 clk config
Message-Id: <167940278163.26969.15643936747688736434.b4-ty@kernel.org>
Date: Tue, 21 Mar 2023 12:46:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: OUF2ONWQ64RN7HX3ECFLK5OHEWLXNZLX
X-Message-ID-Hash: OUF2ONWQ64RN7HX3ECFLK5OHEWLXNZLX
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OUF2ONWQ64RN7HX3ECFLK5OHEWLXNZLX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 18 Mar 2023 22:14:39 +0800, Jianhua Lu wrote:
> There are 8 cs35l41 speaker amplifier connected to TDM
> in my Xiaomi Mi Pad 5 Pro tablet. In this case, it's necessary
> to set 12288000 (48000 * 32 * 8) clk freq for it.
> 
> rate=48000, slot_width=32, slots=8.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l41: Add 12288000 clk freq to cs35l41_fs_mon clk config
      commit: 00a7ef3242f42c38c9ffdf14ab2d729fd9754391

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

