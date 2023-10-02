Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 215E77B5A7C
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 20:52:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81B9FA4B;
	Mon,  2 Oct 2023 20:52:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81B9FA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696272772;
	bh=5CTwTLBEvduUICvuu4skaNUm4ejcj7Qi7S/UNZzRJiE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ft8j/hFy5DmbTg9jHt3FCch18+5wHo5zCMaykLmlwgiCUCHpaW1gMKS4LiLhUTIJe
	 Thka4u2NAxFmn151GwlQ1800WNJ8CAVcrG4ba/1ysUmWr7TJBEJy24tkN2C0V9zsBu
	 S/KFDD+n2zBOo8Ul77J5KyJM9H9aKTSxY0GiKVMQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B104F80563; Mon,  2 Oct 2023 20:51:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E429AF80558;
	Mon,  2 Oct 2023 20:51:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20ADAF80310; Mon,  2 Oct 2023 20:51:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C906F800C1
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 20:51:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C906F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S8AF7ciA
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B32C5B811FF;
	Mon,  2 Oct 2023 18:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBF30C433C9;
	Mon,  2 Oct 2023 18:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696272668;
	bh=5CTwTLBEvduUICvuu4skaNUm4ejcj7Qi7S/UNZzRJiE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S8AF7ciAoQ2kkg5GltwcBo7ww4CDBBhPHcFnC3/w/u/OM2IdygZ8Nl11+7XXddPCm
	 A4MP+YkhXNhN515RN+L7svKr7FzXiq5K+G1zWkgOV7wkP9dTBAn0sCHNtTRUY/4bgm
	 L0z8iUucUsRpPB6zZCW93SpmPCBSbyeQQxtbzJf+BtTBJQ0cia/HAL2FtzV/Jv632g
	 6O5GdBPF8D606o/VXHA0vm1zAuj4PXkPTq2b+l1+UrBsb8Q0IRIGSVoi2OJKfvpBYI
	 wDsZQekeqMPdBVCsOJ7a5h5Em9RLPQwdSLGSbpSMUdoxgQ7S9Rm+l4okPEf4QtUjPk
	 8wDzs1JM2oQpQ==
From: Mark Brown <broonie@kernel.org>
To: Sven Frotscher <sven.frotscher@gmail.com>
Cc: git@augustwikerfors.se, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 mario.limonciello@amd.com, regressions@lists.linux.dev,
 stable@vger.kernel.org
In-Reply-To: <20230927223758.18870-1-sven.frotscher@gmail.com>
References: <20230927223758.18870-1-sven.frotscher@gmail.com>
Subject: Re: [PATCH v4] ASoC: amd: yc: Fix non-functional mic on Lenovo
 82YM
Message-Id: <169627266558.110968.10545623851131128761.b4-ty@kernel.org>
Date: Mon, 02 Oct 2023 19:51:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: LDTJWV5TFQSQ6R4ZFOEYDSDNEVQYLTUP
X-Message-ID-Hash: LDTJWV5TFQSQ6R4ZFOEYDSDNEVQYLTUP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LDTJWV5TFQSQ6R4ZFOEYDSDNEVQYLTUP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 28 Sep 2023 00:36:07 +0200, Sven Frotscher wrote:
> Like the Lenovo 82TL, 82V2, 82QF and 82UG, the 82YM (Yoga 7 14ARP8)
> requires an entry in the quirk list to enable the internal microphone.
> The latter two received similar fixes in commit 1263cc0f414d
> ("ASoC: amd: yc: Fix non-functional mic on Lenovo 82QF and 82UG").
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
      commit: 1948fa64727685ac3f6584755212e2e738b6b051

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

