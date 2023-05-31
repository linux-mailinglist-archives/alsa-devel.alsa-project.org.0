Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E7C7184F0
	for <lists+alsa-devel@lfdr.de>; Wed, 31 May 2023 16:27:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8231320C;
	Wed, 31 May 2023 16:26:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8231320C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685543262;
	bh=uZrecblMyFP3eudphYm0KjVCQrjhgwqr75yaoD6auEc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=NIpffmMkcCvCSrjTD0UGhPsN8t2VslvS7qFN/wirYR8GgBdmOwHTh4CZh5jdg0DgY
	 NixBwEXb5JVrdyx6Eo8p4KJisd7kemxXFnOf4yt8pJAwBS7Me1GXn2XdpmbWUIsI2T
	 ibUisUopPSqXqDL+daQ0amMNWIIx0Q8NbR61Q8VU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E07EF80149; Wed, 31 May 2023 16:26:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E0B3F8026A;
	Wed, 31 May 2023 16:26:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC842F8026A; Wed, 31 May 2023 16:26:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC66CF80149
	for <alsa-devel@alsa-project.org>; Wed, 31 May 2023 16:26:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC66CF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZfJXgOnt
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A6F64614A2;
	Wed, 31 May 2023 14:26:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D04F6C433EF;
	Wed, 31 May 2023 14:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685543198;
	bh=uZrecblMyFP3eudphYm0KjVCQrjhgwqr75yaoD6auEc=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=ZfJXgOnttHUiKqjYtLk8ldIUuyeZAQw1z9o2Bh+OW9frmPTAw2QDsQrn1tRKpby64
	 njcuDgN1TCjVm5i80RVq4BZLomYD2/sJkL2IW6cTkrpnL2y/IZiOGznYHub3syK4OE
	 7kALI0kIzjOAKM1nHY/+TQKux0vYXyNCl6Ru/exT7eMKV1AgwHFd13BMjmKk4ayBsv
	 Y1lusZSNYPWnTM5NhKh0q3UZ3f/f+NDg4jKWa1SKgfGs6ICzbuqD1hXNNxDgAhbKMe
	 AqlzGD6tIUA5u9ZR690ev0CeXJEidq7jOwUv30P8PgCx+dlf4towWShf7qDIYSXvGr
	 ASYThJsOxYqgQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Sicong Jiang <kevin.jiangsc@gmail.com>
In-Reply-To: <20230531090635.89565-1-kevin.jiangsc@gmail.com>
References: <20230531090635.89565-1-kevin.jiangsc@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add Thinkpad Neo14 to quirks list for
 acp6x
Message-Id: <168554319655.98519.9217752703548854880.b4-ty@kernel.org>
Date: Wed, 31 May 2023 15:26:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: EWBIXYGQ7SLULLJCQ4OOW3FZFDN7MRPU
X-Message-ID-Hash: EWBIXYGQ7SLULLJCQ4OOW3FZFDN7MRPU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EWBIXYGQ7SLULLJCQ4OOW3FZFDN7MRPU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 31 May 2023 21:06:35 +1200, Sicong Jiang wrote:
> Thinkpad Neo14 Ryzen Edition uses Ryzen 6800H processor, and adding to
> quirks list for acp6x will enable internal mic.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add Thinkpad Neo14 to quirks list for acp6x
      commit: 57d1e8900495cf1751cec74db16fe1a0fe47efbb

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

