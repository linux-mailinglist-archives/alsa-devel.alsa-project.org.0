Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B061836AD8
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 17:35:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDE21741;
	Mon, 22 Jan 2024 17:35:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDE21741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705941315;
	bh=D8qsa3J9fjuu62+bhhSC18gBPXhzCi2KQ8gRk9xdu2o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QPWz/6YrpgZt8v9ZtjsB+X8crKGBgoL3x91yC3TemWlx0G3aqYMtWJK3iLFNeluTK
	 T1Zz7jQEnCoAFKbkgLIOTcPfJeO6eFLs3A/syzG/DLpzq+iOsA5z0POkhfD+2kXT1e
	 r3b/C6OjMlZqiVWm+o8HPSLy20rkyOj/qrlWDtfc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88D5EF805F2; Mon, 22 Jan 2024 17:34:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF353F805F6;
	Mon, 22 Jan 2024 17:34:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7F02F8028D; Mon, 22 Jan 2024 17:34:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08F28F8022B
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 17:33:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08F28F8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mUYO4Hjq
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7D7E9CE1F8E;
	Mon, 22 Jan 2024 16:33:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E82C43390;
	Mon, 22 Jan 2024 16:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705941227;
	bh=D8qsa3J9fjuu62+bhhSC18gBPXhzCi2KQ8gRk9xdu2o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mUYO4Hjqo7auYG21X1oZRnD6ZFNtL/fM2PMlBHYFTWhn31V2xmGxf+2pma+F6opWD
	 5qxkr9rzOwoB3RJsYmlQsGitgyUuRC6uPVWaG7767b77aZKTFaeXSoEDdUslR1DlRZ
	 7o5V0x7Id1Zd2TsCz7SsmnAqeYjfv3/Px8UY1pTRK6rdVbeT6wHniSLKI2yDdnDPrw
	 1r5l28m2QRY/Ry/cTb16MKDoUMRJpny1vLJ7rtoL8PtM8aCTVxZiCYJ3SuXxZkMulw
	 5P+F2FbpAl7ij5EKZNvtTg2LsJ1GTn2qfXq98moQqhDIoTc+LXuMLzGDcQ0EgjYULM
	 z+p0K+VtrJCRg==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Erick Archer <erick.archer@gmx.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
In-Reply-To: <20240109181101.3806-1-erick.archer@gmx.com>
References: <20240109181101.3806-1-erick.archer@gmx.com>
Subject: Re: [PATCH v2] ASoC: ti: j721e-evm: Use devm_kcalloc() instead of
 devm_kzalloc()
Message-Id: <170594122547.63484.16523787632492370599.b4-ty@kernel.org>
Date: Mon, 22 Jan 2024 16:33:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: 4LWMOCRBCJEZFZFNNA5VTBIPZ4XEYPP4
X-Message-ID-Hash: 4LWMOCRBCJEZFZFNNA5VTBIPZ4XEYPP4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4LWMOCRBCJEZFZFNNA5VTBIPZ4XEYPP4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 09 Jan 2024 19:11:01 +0100, Erick Archer wrote:
> Use 2-factor multiplication argument form devm_kcalloc() instead
> of devm_kzalloc().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: j721e-evm: Use devm_kcalloc() instead of devm_kzalloc()
      commit: be69eae9673638583cfcad44c1da6abf91efc4a3

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

