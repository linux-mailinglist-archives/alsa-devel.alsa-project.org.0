Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 265386FB180
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 15:28:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AE991239;
	Mon,  8 May 2023 15:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AE991239
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683552538;
	bh=LquV2ZwUnn6TMzh6JkKkPje5CXPqogbwMUg38jWwCR4=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xeh63JvqegW9LyPCD8Lh92CYJxCL5aSNK2mVc0gj0aTESxeBAHnkh3q6+1J+7eHOb
	 qMDzvdywCcKGVOvfsjykQM+2Wajwa96XxtvfQAnAJPtykZGNsgJWMKgsW99W8yQ7dQ
	 J+fP4Ew/JgTWwvLaRf/YSAa3o0kAMYkrDGuY7sfk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69B11F80548;
	Mon,  8 May 2023 15:27:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AC83F8032D; Mon,  8 May 2023 15:27:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C77DCF8014C
	for <alsa-devel@alsa-project.org>; Mon,  8 May 2023 15:27:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C77DCF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=U1W1ti7B
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 05B4B61CAA;
	Mon,  8 May 2023 13:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56D3C433EF;
	Mon,  8 May 2023 13:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683552421;
	bh=LquV2ZwUnn6TMzh6JkKkPje5CXPqogbwMUg38jWwCR4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=U1W1ti7BAHI42k9bVCXuMtAXHq+/QxPDLQWwPLcAthOLrHzNfCqys0Tg8avdkO/hd
	 Cvt5uQCszivONJbxM2E2cwwVbmvH997rhTQjLMs9WVxPnDEGmcgtPnV+SKtX8QtxtW
	 GQAUkgCl5r3AqSD3K87g4MO8pJWNKtPcrZ4Q2v1ZIWx8HKzpSbdFh+WueH3NsL6LT2
	 p96Lr5d57TGGcof3Z3LPX3EBdertxkz2WrWrrfPf0ZmrL9FjeFNR3FnMd5mPdHjMCH
	 i780wrpEET/dy6oDKSEYaNl8YOxJbsEXgAjQCQtRWhzSQbZhiv3R8f9gVMdz6k28qg
	 mYzaCJ9dIuoXg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20230505062820.21840-1-fido_max@inbox.ru>
References: <20230505062820.21840-1-fido_max@inbox.ru>
Subject: Re: [PATCH 1/1] ASoC: dwc: limit the number of overrun messages
Message-Id: <168355241903.260078.2421091866061549729.b4-ty@kernel.org>
Date: Mon, 08 May 2023 22:26:59 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: MABIQIY4UIX5B4GNK7IHW5BUHQWP7W5O
X-Message-ID-Hash: MABIQIY4UIX5B4GNK7IHW5BUHQWP7W5O
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, tiwai@suse.com, ckeepax@opensource.cirrus.com,
 nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MABIQIY4UIX5B4GNK7IHW5BUHQWP7W5O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 05 May 2023 09:28:20 +0300, Maxim Kochetkov wrote:
> On slow CPU (FPGA/QEMU emulated) printing overrun messages from
> interrupt handler to uart console may leads to more overrun errors.
> So use dev_err_ratelimited to limit the number of error messages.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dwc: limit the number of overrun messages
      commit: ab6ecfbf40fccf74b6ec2ba7ed6dd2fc024c3af2

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

