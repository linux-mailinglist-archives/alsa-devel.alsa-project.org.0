Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0779F6B5B89
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Mar 2023 13:19:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28AB11868;
	Sat, 11 Mar 2023 13:18:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28AB11868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678537178;
	bh=AQlotD2af5IQPfCHzMtJ4+Zn55SqqkJNOpXS3in15nY=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LrptJCOvP+e77YfoFOqjTjkAG+CPRBiYeBju6YnAHbIJU2T7m+QKVncCDS4z/IvO+
	 mq+AH3vFenUjsltCHNsknhPq9WHszQRrmGlXS/BM27QorBU0/3Ecydwef+82SKiVm4
	 c7a4t1anIuw0YilYGGKhbQ1gVaceMccc51ZBOCqU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82F01F80236;
	Sat, 11 Mar 2023 13:18:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72F0CF8042F; Sat, 11 Mar 2023 13:18:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0E90F800DF
	for <alsa-devel@alsa-project.org>; Sat, 11 Mar 2023 13:18:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0E90F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oedbHRA2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1C45EB8250B;
	Sat, 11 Mar 2023 12:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72DA9C433EF;
	Sat, 11 Mar 2023 12:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678537118;
	bh=AQlotD2af5IQPfCHzMtJ4+Zn55SqqkJNOpXS3in15nY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oedbHRA2kTUWxGrDqpW5l+I8g5NskpwrvHjL0csCdzV60WZPxZueXt+A4j8zZguCB
	 MaTC5XyRgDyMeceCmlscF+wNvtx3Y7WWdQXANxNv2PtsEAKyfgrnMViPODHJ8/gjYr
	 pC8Y8NGWXHTCoE2d4EqQYc6haKuEdMOCV06JHVVF9TKVxfIiy8K0+cBmVYV8ykHJpg
	 W72YJ051L5geosEGecu6nf18XZJ4aCqDgIU6ty4dWs3QXoLb3ZP79iB/mrE9UAs/8Y
	 Bn7cdbTGgmYl/qgLwULCZ9T3A9t0Y9Idg8VIwHV1mLxTF4Bj1jzVeXEKJ7Vlpm5C7E
	 7VntIRkuzxo4w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230310133454.15362-1-peter.ujfalusi@linux.intel.com>
References: <20230310133454.15362-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] Revert "ASoC: SOF: Intel: MTL: Enable DMI L1"
Message-Id: <167853711777.932037.5748389115137713572.b4-ty@kernel.org>
Date: Sat, 11 Mar 2023 12:18:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: E7H4TRTUIIRSNEIKICWXLDS4WQGWAZAN
X-Message-ID-Hash: E7H4TRTUIIRSNEIKICWXLDS4WQGWAZAN
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E7H4TRTUIIRSNEIKICWXLDS4WQGWAZAN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 10 Mar 2023 15:34:54 +0200, Peter Ujfalusi wrote:
> This reverts commit 2b5a30cafb2eff4e6a34bc80b1d16ed6ca5c2c71.
> 
> It came to our attention that the access to the EM2 register is restricted
> to the DSP side on MTL compared to prior platforms.
> 
> Writing to it from the host side has no effect (negative or positive), it
> is better to remove the code to not cause confusion and wrong impression.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] Revert "ASoC: SOF: Intel: MTL: Enable DMI L1"
      commit: 75034eb5e4c267d4ab93085b5d6fa3dab2535b34

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

