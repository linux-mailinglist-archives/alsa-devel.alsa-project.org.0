Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD63778CCB7
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 21:14:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08BDDA4B;
	Tue, 29 Aug 2023 21:13:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08BDDA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693336449;
	bh=Y7BWzSc1wFmIX6sTKYMV6PLaewMUa7ZUlRGapp3Ioi8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mBV1Q1J135oSNFOYrdtTF6wUCDsKRz09/hNij4R91S/2STmbnYC0i6dDVgupYMPiK
	 v+hB2P/JKruWGdaj/Nk1OPAJtF7fByv5Mq6MbjapuK9HzB8l9iiiaB/TwrfQTPiaGX
	 eu0M7SaveISQzmOC6F+t+TBkZpYIV/LSYktZmjj4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D04B0F804F3; Tue, 29 Aug 2023 21:12:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 819B9F804F3;
	Tue, 29 Aug 2023 21:12:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C530AF80155; Tue, 29 Aug 2023 21:12:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF3ACF80094
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 21:12:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF3ACF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PKN5m15D
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9AEE361346;
	Tue, 29 Aug 2023 19:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E8AAC433C7;
	Tue, 29 Aug 2023 19:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693336342;
	bh=Y7BWzSc1wFmIX6sTKYMV6PLaewMUa7ZUlRGapp3Ioi8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PKN5m15DXO595Bhz9BRIBaawKwSMtOsqBsxocXLUvyxmSyoLkJIt/JcS2QgsERIjf
	 YQV5dW+/xVCyUQa13+bazoMI1c9UmFie/IK0zgcFNWVtO3/4vpHYSDCklUPxXIrHKW
	 BmS3Pn0d+bTzvIhCBqQcMZ12goCjDJoQCwJViPNCbgHWvXc1n39o7f/c5w1k4CoMAW
	 an6W1kIJWZBucjM64zKIo+xPjS1YEdS2r1+Xa6B4zNMwIhlXzOSJYPpLQJ8v5mk/qj
	 UCxqw8gfSRiR/SiQn535ayH+hA6EwhCztrgxIVnXgfGg3bGDPm+kFBMYNvIRCfJScs
	 EmSE5TD0emOxw==
From: Mark Brown <broonie@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
 error27@gmail.com
In-Reply-To: <20230829073635.1877367-1-harshit.m.mogalapalli@oracle.com>
References: <20230829073635.1877367-1-harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH next] ASoC: cs42l43: Fix missing error code in
 cs42l43_codec_probe()
Message-Id: <169333633540.3145573.6288237748073624350.b4-ty@kernel.org>
Date: Tue, 29 Aug 2023 20:12:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: MDA7MKXNHMS6UFF4HHYKIKY255OOCB4L
X-Message-ID-Hash: MDA7MKXNHMS6UFF4HHYKIKY255OOCB4L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MDA7MKXNHMS6UFF4HHYKIKY255OOCB4L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 29 Aug 2023 00:36:35 -0700, Harshit Mogalapalli wrote:
> When clk_get_optional() fails, the error handling code does a 'goto
> err_pm' with ret = 0, which is resturning success on a failure path.
> 
> Fix this by assigning the PTR_ERR(priv->mclk) to ret variable.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l43: Fix missing error code in cs42l43_codec_probe()
      commit: 9e07f8bfd959d2d09823430eab35d12182446dcf

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

