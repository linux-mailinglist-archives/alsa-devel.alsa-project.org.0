Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A1A6BEEA1
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 17:41:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF090F10;
	Fri, 17 Mar 2023 17:40:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF090F10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679071300;
	bh=zzj5xFoA7fcW2ai1OCzgVDIOUVE95vKPZjxuGeoZ1w4=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y4dt7DLpQw+qFHiIWIFOl8hWxNpNFyfKbSV0wRpcUQn/lfEGpU2pbSG1hwaNyld4n
	 VkP3C+4I7MC8WPP754hXRsNu9nWWOutaaxyRjBdCY6duOWc7FkVIM3mjJgGc0LRhO2
	 YTugToxF9579hohd/FT3q9GjUc09skbs1dsJbS7g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BE7CF80527;
	Fri, 17 Mar 2023 17:40:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E46EFF80520; Fri, 17 Mar 2023 17:40:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 556A2F800C9
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 17:40:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 556A2F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=G1dMEdK2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2F01360B85;
	Fri, 17 Mar 2023 16:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD02C433EF;
	Fri, 17 Mar 2023 16:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679071240;
	bh=zzj5xFoA7fcW2ai1OCzgVDIOUVE95vKPZjxuGeoZ1w4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=G1dMEdK26p1myMFu7+Mqy4HjKMe55IVEq9DN9WFO+7qT12rCyLskpS674dUOULU/F
	 kWhLaiB/by9Yed/p8dyCtB4tT6IPymd23UekXr1J4OacDsuZqkg7admWKBEnxz2uWE
	 TAGMcXNzelhGOvofLlNMNbY28ixqo7fVXaO2d+Tl3wgeTtkIoc1ltzre9/th+fsma1
	 82xQBjCX5cWh9ssZ5zIli01Cgolxf6R/vzvtRLh5o9G1Z36iwZ+jzARqt3DMcMt89K
	 3sg9uMLPiIjkwVatg0AaYqXZoCGvnUYO/5MKOKSLW8UU/nLipigjp/p1vcSX4lXE3m
	 KdSRI0oW9y29g==
From: Mark Brown <broonie@kernel.org>
To: Ge-org Brohammer <gbrohammer@outlook.com>
In-Reply-To: 
 <PAVP195MB22610BD3A98379E740C93C08DABF9@PAVP195MB2261.EURP195.PROD.OUTLOOK.COM>
References: 
 <PAVP195MB22610BD3A98379E740C93C08DABF9@PAVP195MB2261.EURP195.PROD.OUTLOOK.COM>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI entries to support Victus by HP
 Laptop 16-e1xxx (8A22)
Message-Id: <167907123961.46507.2293327345396862339.b4-ty@kernel.org>
Date: Fri, 17 Mar 2023 16:40:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: 6RZNQRAV6XRTBOTO7DTVKQ7LYIQ36DSY
X-Message-ID-Hash: 6RZNQRAV6XRTBOTO7DTVKQ7LYIQ36DSY
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6RZNQRAV6XRTBOTO7DTVKQ7LYIQ36DSY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 15 Mar 2023 21:26:00 +0000, Ge-org Brohammer wrote:
> This model requires an additional detection quirk to
> enable the internal microphone.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add DMI entries to support Victus by HP Laptop 16-e1xxx (8A22)
      commit: 205efd4619b860404ebb5882e5a119eb3b3b3716

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

