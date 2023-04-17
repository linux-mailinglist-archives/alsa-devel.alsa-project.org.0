Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB4F6E50EF
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 21:29:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 714B5A4C;
	Mon, 17 Apr 2023 21:28:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 714B5A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681759757;
	bh=vUS3zjVd3+6BO4WHfibtTk9oL6xSScrdumIoUioILDA=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZkKkSQgRa4EfAW952Jni60MeiHyFuqMCN6YJB3iciXwjFpKNLCA4cwZT8hmcYN2wV
	 KrRGpKNyV5OjAi3Bs4WleWp4YE9Hc+eWuMiaa1+YZfeEG5Aa9DNhAeowjvPYdMBLte
	 QneNvh5jGW1oB7QsuV0aUOA0hmUEkOhU+cmmWwBI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0201F8025D;
	Mon, 17 Apr 2023 21:28:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD862F80269; Mon, 17 Apr 2023 21:28:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6AB0DF80212
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 21:28:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AB0DF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=THajXB+M
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 72501624AB;
	Mon, 17 Apr 2023 19:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09481C433D2;
	Mon, 17 Apr 2023 19:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681759688;
	bh=vUS3zjVd3+6BO4WHfibtTk9oL6xSScrdumIoUioILDA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=THajXB+ML1MMwctxmXts4VxHz2S3pGPkEBy0XyPnOJPJrBmRMoFRyVIcJ0cpnHN++
	 MfcUovaySK7ez0esDbSsRS/uI+js/h+r7EuYC4Lw9FBfY1rbXniW6/zC+pHQVPAV1u
	 J/5EdENWVCSqWg2Hu2YiT7lj+RYW4T1YEYPXDOhohkwJGj7581dehgHu6Oe3gSrXXi
	 oo/listP0wM+6Gfs1xn3QCteWfNijUdyKFytyCvRyxxnusw/DceofFlZQxe0RPeh2p
	 Z8L5keaD+Vg0bP6pdaMJTlO2Bbc9cENkbyIKZEA+62LqkdQV9sLR9iZD2avrmBxP99
	 dThCqi+6OpT2Q==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 =?utf-8?q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
In-Reply-To: <20230414140203.707729-1-pan@semihalf.com>
References: <20230414140203.707729-1-pan@semihalf.com>
Subject: Re: (subset) [PATCH 0/9] Add Chameleon v3 ASoC audio
Message-Id: <168175968572.1283403.9162743333691420976.b4-ty@kernel.org>
Date: Mon, 17 Apr 2023 20:28:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: J65UCL7YJSXURUVSGO3GPJSVKQ2GYP2B
X-Message-ID-Hash: J65UCL7YJSXURUVSGO3GPJSVKQ2GYP2B
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J65UCL7YJSXURUVSGO3GPJSVKQ2GYP2B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 14 Apr 2023 16:01:54 +0200, Paweł Anikiel wrote:
> The Google Chameleon v3 is a device made for testing audio and video
> paths of other devices. This patchset adds support for ASoC audio on
> this device. It has two audio sources: HDMI audio from the it68051 chip
> (RX only), and analog audio from the ssm2603 chip (RX and TX).
> 
> The patchset adds the ASoC platform and machine drivers, as well as some
> changes to the existing ssm2602 codec driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[6/9] ASoC: ssm2602: Add support for CLKDIV2
      commit: 8076c586bbc1c62e075e58f41dafdd8b5022b24d

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

