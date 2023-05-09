Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3A66FBF69
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 08:41:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF469115A;
	Tue,  9 May 2023 08:40:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF469115A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683614477;
	bh=MPjq6gzWPA60maAomS6SxfaVbC6Zf72QgRf1npLYkRs=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a25AWb1Klutmqzb0lRhYmO7NFa48LZNJE7TA2bD26Xan4O8gGJsKcs4+XuU8aHYQ+
	 YxyKfFAFH0gVCCSx0ixUZsrFmU6MyWmWJumFHCd60aJgMIFK8HWFd+KuBaw8i8ZAu4
	 /3ZNHHZOxzDwAKjcbSr0YoWgiJCQwXJWvc8xeEhE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 853A1F80570;
	Tue,  9 May 2023 08:39:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FDD7F8055B; Tue,  9 May 2023 08:39:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C1E0F80534
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 08:39:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C1E0F80534
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PShGozI/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B013E61011;
	Tue,  9 May 2023 06:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A50AC433EF;
	Tue,  9 May 2023 06:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683614339;
	bh=MPjq6gzWPA60maAomS6SxfaVbC6Zf72QgRf1npLYkRs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PShGozI/klASyopK5+niTYpHvReKkgkmwm7aIuRZZEEZhImIsHa8RHqFK0AEem5cH
	 feG4frcSxIlFrwGRWgDuBiruEWYGVhlLETVWJ2eTz/mwDhuafOHCsOXYs4aYy1XmUQ
	 Jm0ayIJsATTt1rmEmcgKj/v3dgfB1NsL4MHEbwJiJedZKMY37W9lm0ueXUF1LnJp5i
	 7qEREZDtBdQ/tfcBQOkREEaHoKV36b0xXockiUkewXwEMyi4aigctjH5XkdatPBw6c
	 oPPeqmfklPUd1mfcRwLP68gaqy1SczAflAQi9fJ7XUOHHdxMyLORmtaICErmDBv4xF
	 Lu3pL50uBXRNQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20230505053521.18233-1-fido_max@inbox.ru>
References: <20230505053521.18233-1-fido_max@inbox.ru>
Subject: Re: [PATCH 1/1] ASoC: dwc: extend supported formats
Message-Id: <168361433566.303059.17566203451114321045.b4-ty@kernel.org>
Date: Tue, 09 May 2023 15:38:55 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: PB2F7PNA6G34MMDRNNBWFVMPUQ2ZL4OU
X-Message-ID-Hash: PB2F7PNA6G34MMDRNNBWFVMPUQ2ZL4OU
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, tiwai@suse.com, ckeepax@opensource.cirrus.com,
 u.kleine-koenig@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PB2F7PNA6G34MMDRNNBWFVMPUQ2ZL4OU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 05 May 2023 08:35:21 +0300, Maxim Kochetkov wrote:
> The COMP1_TX_WORDSIZE_0/COMP2_RX_WORDSIZE_0 fields in the comp
> registers indicate the maximum wordsize supported. DWC I2S controller
> can operate with any smaller wordsize. So extend the formats to let
> I2S to operate in any allowed modes.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dwc: extend supported formats
      commit: 7f2a9750d9d9eeb0b2b4bbc417e96e852365937b

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

