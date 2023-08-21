Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20794782B96
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 16:21:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66725844;
	Mon, 21 Aug 2023 16:21:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66725844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692627711;
	bh=zfy8G2F327LaRSMwUwL6CEsZ16UtB8P0JW9ckCJnC/E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qnskw+l80SCsNMIRhikRag8LrcB96fGcL5wpXWGu7pGsbYJ9g/S4P1e1gDTWJaj0K
	 +K1Fy+kCXbNLxkX1N0MKcO7ccLw2z1SoGBZF5PPHqJ20Cc0Inh3qdY6C6txC/rZQ7r
	 AFhcg09qyD58QO1LsLkfHM6wrwuqeJrKI88W7I20=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C98BF8025E; Mon, 21 Aug 2023 16:20:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90026F8016C;
	Mon, 21 Aug 2023 16:20:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97273F80199; Mon, 21 Aug 2023 16:20:31 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BFB53F8014C
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 16:20:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFB53F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=chEMzjYo
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CC74E61802;
	Mon, 21 Aug 2023 14:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E9DC433C8;
	Mon, 21 Aug 2023 14:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692627626;
	bh=zfy8G2F327LaRSMwUwL6CEsZ16UtB8P0JW9ckCJnC/E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=chEMzjYosxJWAipp0dTHL1WKwkTRYHLGNmJdZTOy/voD+HcudKBykNFfmoUbzyEal
	 3ZQYV6SIfsZ4AxlaAlQqdAcWL6XzaJo/+Trvhrg3+yrOLeXi2TwjVHHyx+shKptftd
	 i9cQz16q0Z19v6wcBA5uit67Y7G57u8BNk8qc3+4CUszB1LXs5ipghNMUHbIxnEwvy
	 P56v47dSgcMYC26aG8+gFbhdgfki9T5hfiztCrw6+qnb2Tyl5JRO2JubBQpg+SYV89
	 aOw6b7u/H1w/YA4yP0AOl8RdNqQhxHtYtN61QQrXM4G6P7SzMHJ2cYRFXF63HOYZua
	 OIdJQ/gnI9LCw==
From: Mark Brown <broonie@kernel.org>
To: BrenoRCBrito <brenorcbrito@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, linkt <xazrael@hotmail.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230818211417.32167-1-brenorcbrito@gmail.com>
References: <20230818211417.32167-1-brenorcbrito@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add VivoBook Pro 15 to quirks list for
 acp6x
Message-Id: <169262762417.266100.4223916224469728296.b4-ty@kernel.org>
Date: Mon, 21 Aug 2023 15:20:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: YRPCBG3NLAP7OQHBBEWCYXSLKSFN7NBY
X-Message-ID-Hash: YRPCBG3NLAP7OQHBBEWCYXSLKSFN7NBY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YRPCBG3NLAP7OQHBBEWCYXSLKSFN7NBY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 18 Aug 2023 18:14:16 -0300, BrenoRCBrito wrote:
> VivoBook Pro 15 Ryzen Edition uses Ryzen 6800H processor, and adding to
>  quirks list for acp6x will enable internal mic.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add VivoBook Pro 15 to quirks list for acp6x
      commit: 3b1f08833c45d0167741e4097b0150e7cf086102

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

