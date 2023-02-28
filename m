Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F006A5E8D
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Feb 2023 19:03:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A30D827;
	Tue, 28 Feb 2023 19:02:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A30D827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677607393;
	bh=Vw2WhtCIoO7CEjGCzwjW4hh5EKTvh78FgBOKEFi1gZI=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TSNIW5H4Imoh9iM2zDSqFini2SvbxviD43ouZb2IsK8yJCaM+xSxULNk291E00lTr
	 4lxoLrh7AEJQusxrCma/f7133/RLeYt49sGfgUHb4I9sPeyXoHVBRtLn/k52R7Htp7
	 KgTj9/HML039kLleQigV/S7fS2IX4JSHGyLaeFM4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1242F80520;
	Tue, 28 Feb 2023 19:01:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D8DCF80551; Tue, 28 Feb 2023 19:01:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 005B9F802BE
	for <alsa-devel@alsa-project.org>; Tue, 28 Feb 2023 19:00:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 005B9F802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=frjpeGbI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 33A39B80E9D;
	Tue, 28 Feb 2023 18:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D313C4339B;
	Tue, 28 Feb 2023 18:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677607238;
	bh=Vw2WhtCIoO7CEjGCzwjW4hh5EKTvh78FgBOKEFi1gZI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=frjpeGbI3O8A+KjPwnXrHD4/bo/gR2WDbdLbnQXF6j8telsCgftbmFN0b/9mMF52D
	 hHi5g6+pvZho+3MzdHY/ihiJ0hyQ1nTPC575l7nMCVmsWDPDrtH7jgowo/g+lNKbUv
	 SSQ7thwKfneap+N60lo5T4ZaPRYkz1XhIleVVvQYn0Ya0AQAvf7GC+QNnrGgs3zP92
	 48YM19ql50c48n4Ev1I1cE5/rbCTBSdqyBpsasPTls8JEEM2VUbpNfDOPUuHjA8nts
	 aAzwAKJpbsaxrtlbTdl+B1Rra3P0TWmXrPvCYxItTTa3DOqntfHdfMsoMUhpqgz8GR
	 le1cLNOVwuExA==
From: Mark Brown <broonie@kernel.org>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Mark Brown <broonie@kernel.org>
In-Reply-To: <20230225-asoc-sam9g20ek-v1-1-9baeb4893142@kernel.org>
References: <20230225-asoc-sam9g20ek-v1-1-9baeb4893142@kernel.org>
Subject: Re: [PATCH] ASoC: sam9g20ek: Disable capture unless building with
 microphone input
Message-Id: <167760723610.68866.3002962349720248373.b4-ty@kernel.org>
Date: Tue, 28 Feb 2023 18:00:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-ada30
Message-ID-Hash: TT6NLZ4DQDKYL5AAL6RK3LJMTBVFO2Q5
X-Message-ID-Hash: TT6NLZ4DQDKYL5AAL6RK3LJMTBVFO2Q5
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TT6NLZ4DQDKYL5AAL6RK3LJMTBVFO2Q5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 25 Feb 2023 21:48:13 +0000, Mark Brown wrote:
> Without modification the AT91SAM9G20-EK has no capture support, none of the
> inputs of the CODEC are wired to anything to useful and there are no paths
> supporting loopback. Since the audio is clocked from the CODEC and the DAPM
> inputs are marked as unusable this means that capture will fail to transfer
> any data as the ADC path can't be powered up.
> 
> Flag this in the device description so apps don't see unusable capture
> support, guarded with the existing optional define for mic input.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sam9g20ek: Disable capture unless building with microphone input
      commit: c769fb6bcc485d752d492064a9005525a8d5fa24

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

