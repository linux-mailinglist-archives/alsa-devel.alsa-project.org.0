Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 376E07EA3F3
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 20:42:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7197284B;
	Mon, 13 Nov 2023 20:41:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7197284B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699904540;
	bh=8tmAr4oKfMzIrHzzCsXIaxkR7VWUld3c2NExSZ1Z27I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SPKETDNafjDxETgnPuIjs4bLQpKOMvYjFCQmcdbH1aXIvCLkrhUMpS2DvleHjM/Tu
	 W5RI28+Odkv6IQJ0XXQq+ZOzaaaYoeefkjM1iAwpD9KmXw+kMBRARgpOfEoH7XdE4g
	 OaWK61qY+MkCRfpoDZRl/tRGkpd0nlFPUd2WB9v8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDCCAF80568; Mon, 13 Nov 2023 20:40:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70FA1F80558;
	Mon, 13 Nov 2023 20:40:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E039F801D5; Mon, 13 Nov 2023 20:40:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DEC5FF80093
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 20:40:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEC5FF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Xaz9H9PB
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EEE4060FE5;
	Mon, 13 Nov 2023 19:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF93C433C8;
	Mon, 13 Nov 2023 19:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699904417;
	bh=8tmAr4oKfMzIrHzzCsXIaxkR7VWUld3c2NExSZ1Z27I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Xaz9H9PBMCpkn9qKZf/A0OdhWKIHJ388XEAuenzBTskRpdGn5FMmIal28QHYHaE2Y
	 vk2XWuOex/eFC+BLD/u4mi+Dy0+kcJtIsiwvPTn5+rLiMn9dtsrdipD16wYtGInY28
	 g7lRtDLgkuMChoiRTPcowwLiUZZnoIfVfxMR1JBjxUAwxrdVjNbceHJHE4lxyBMmo3
	 JhZH9HROxwYNStVjqMozeI+sYCgGs+2PHnLASjNTLnKXxF3N7LlnCVrG9VckNZxmsS
	 WxNIV0KA3QQes2W3cn9kB43oTVVbk9/MozBQrGjDlhhZfBBb2nSFAJg9tMOyQiq8uB
	 0eJA6PiGjwu6g==
From: Mark Brown <broonie@kernel.org>
To: Matus Malych <matus@malych.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231112165403.3221-1-matus@malych.org>
References: <20231112165403.3221-1-matus@malych.org>
Subject: Re: [PATCH] ASoC: amd: yc: Add HP 255 G10 into quirk table
Message-Id: <169990441610.3293939.3564976068845326925.b4-ty@kernel.org>
Date: Mon, 13 Nov 2023 19:40:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: HJ5CGHCN2UDRABSKQXWBHGXN7NEYIMAI
X-Message-ID-Hash: HJ5CGHCN2UDRABSKQXWBHGXN7NEYIMAI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HJ5CGHCN2UDRABSKQXWBHGXN7NEYIMAI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 12 Nov 2023 17:54:04 +0100, Matus Malych wrote:
> HP 255 G10's internal microphone array can be made
> to work by adding it to the quirk table.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add HP 255 G10 into quirk table
      commit: 0c6498a59fbbcbf3d0a58c282dd6f0bca0eed92a

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

