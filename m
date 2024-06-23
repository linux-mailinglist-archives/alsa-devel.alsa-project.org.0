Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F367D9139B3
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Jun 2024 12:52:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C55786F;
	Sun, 23 Jun 2024 12:52:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C55786F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719139949;
	bh=cmfbVSffDKX/hTp/1Fgv4j7OaTjSdDNqkQqngAJn0RM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C0jXeqwYYuKXyTRMiO3f1ZZqJeTIXpwAcLIO3CeFcVpnMmfaACeJUivuQ2LJI8s8E
	 roL0UZTysj4FEABL/sF8kSekijYapHWueAw5Qaoj5WLjuSKkgpZOfwzbtU5GPvKrAn
	 iR7vvI586KXqC2jJERboNNV5u4aRH7SLSE+5GKDI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB49FF805B0; Sun, 23 Jun 2024 12:51:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF5D4F805B5;
	Sun, 23 Jun 2024 12:51:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB668F80495; Sun, 23 Jun 2024 12:50:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E37EF800E4
	for <alsa-devel@alsa-project.org>; Sun, 23 Jun 2024 12:50:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E37EF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BeUGK35/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B2AFCCE0025;
	Sun, 23 Jun 2024 10:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8EFFC2BD10;
	Sun, 23 Jun 2024 10:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719139839;
	bh=cmfbVSffDKX/hTp/1Fgv4j7OaTjSdDNqkQqngAJn0RM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BeUGK35/mq1InBYDivPHdjdIHQJ2Yy3LR7a6J5B2nrkovYtypxUctWXrFJZmPhuBc
	 8M9ZDLRCBQhcDLKpgH3b1hYZC2JCM9oq3czHWwwCITj7HoVTGcIseqzlajC3gQxlkL
	 wupIZDK9XcEvGBWO9R5F30XAeVUplnCeiiLNktluFqlPXSmBG3soPmqDIcLk6MZK20
	 /rRdpg2lRaoM2dJJUGdqjSK2Cz0XoLyOIu1kjj9lp766y3DBVGv0X/M0ioeNNXQa6A
	 XVR6zEPioxba2ddc3QFyBb3JuFpbhjElHGMIZH6H3WkkEJiZQiosbdmmIsRCJDrdBI
	 omo7y+tbuoUrg==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, venkataprasad.potturu@amd.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20240617072844.871468-1-Vijendar.Mukunda@amd.com>
References: <20240617072844.871468-1-Vijendar.Mukunda@amd.com>
Subject: Re: (subset) [PATCH 1/8] ASoC: amd: acp: add a null check for
 chip_pdev structure
Message-Id: <171913983658.13532.277643449449161401.b4-ty@kernel.org>
Date: Sun, 23 Jun 2024 11:50:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: J2SWE5HI5TXVKVGSZ4Q3UANH4RCBIWD2
X-Message-ID-Hash: J2SWE5HI5TXVKVGSZ4Q3UANH4RCBIWD2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J2SWE5HI5TXVKVGSZ4Q3UANH4RCBIWD2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 17 Jun 2024 12:58:34 +0530, Vijendar Mukunda wrote:
> When acp platform device creation is skipped, chip->chip_pdev value will
> remain NULL. Add NULL check for chip->chip_pdev structure in
> snd_acp_resume() function to avoid null pointer dereference.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[4/8] ASoC: amd: acp: remove acp_i2s_probe function
      commit: 75a08ec8c3a6aef914235c409a99046a3d29d1d4
[5/8] ASoC: amd: acp: remove unused variables from acp_resource structure
      commit: 50f1670145392398f4f2ffe9abe4599c86d11ec2
[6/8] ASoC: amd: acp: modify conditional check for programming i2s mclk
      commit: 5b162f60e7e051624e187e45b0fdc481c3573f17
[7/8] ASoC: amd: acp: move i2s clock generation sequence
      commit: d85695b01cbb2455a2f70528bb9e53f2463a39cf
[8/8] ASoC: amd: acp: add pcm constraints for buffer size and period size
      commit: 8978e1f7bc26655e0373c4a6b31e17fcdd497329

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

