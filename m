Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CEF77067E
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 18:59:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B1DC832;
	Fri,  4 Aug 2023 18:58:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B1DC832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691168348;
	bh=EypImsegK9bJKnJsBqy304+rYPk0LV8Bbnk7RSxHhMQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YD7be6cN4WPtY3Tyi3G6UVaX6dPGjGw49KGJ/rqZ/oyGGGaP3rgnAeDfPCy3/qRG3
	 ar6cB7bju/cft7cs09AtcQ1aWLWe1i0OveS4LWshyGpaTs19vXTas4UsXHRT5iUREL
	 95nNZ32Xrf1Fp1xiHHZw61hOtdek5SeOynJhYCBI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D2DAF80549; Fri,  4 Aug 2023 18:57:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38D7EF802BE;
	Fri,  4 Aug 2023 18:57:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1387BF802BE; Fri,  4 Aug 2023 18:57:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A38FCF8025A;
	Fri,  4 Aug 2023 18:57:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A38FCF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EqmSMS7T
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6C2A9620D2;
	Fri,  4 Aug 2023 16:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A87BC433C7;
	Fri,  4 Aug 2023 16:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691168249;
	bh=EypImsegK9bJKnJsBqy304+rYPk0LV8Bbnk7RSxHhMQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EqmSMS7TudlJ8JTc68GnSkQ6v1QbSvx9urhSxPhIn/xrw5CTd1uycJqW1/W0L5bC3
	 ljN6G13tUtgvK7PVwW47ThVqaEbCpgUF6+uD7cN6LDO93uFywUhiGt/bBv3J9TL5NK
	 YLbNxe2WbSqUI1beL+vIS4IxDbYPZpqbt5NWHblnyiXGY7AgyTp0nuGuoLBr4bpmQO
	 WH5YwDEOcPn9xfBYlZ0kmRoWo8qzvdsJmb/IW2ackNKNMZS62bmq2VVla2dIBe1+Iq
	 zZlRnfWHNJtbL/AOvQZOv7fQ2i7V/QD96XsnUNt3kzRhTDBaX+AH8tuYpYy72Hx6sh
	 zUSZwSs/CmwHg==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com, lgirdwood@gmail.com,
 tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, Trevor Wu <trevor.wu@mediatek.com>
Cc: yc.hung@mediatek.com, allen-kh.cheng@mediatek.com,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230803075028.32170-1-trevor.wu@mediatek.com>
References: <20230803075028.32170-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH] ASoC: SOF: mediatek: mt8186 modify dram type as
 non-cache
Message-Id: <169116824521.110745.9626523635220489877.b4-ty@kernel.org>
Date: Fri, 04 Aug 2023 17:57:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: MKUYNIOHLI5QGS5E62S5RJ4FMWW7QIMR
X-Message-ID-Hash: MKUYNIOHLI5QGS5E62S5RJ4FMWW7QIMR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MKUYNIOHLI5QGS5E62S5RJ4FMWW7QIMR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 03 Aug 2023 15:50:28 +0800, Trevor Wu wrote:
> To prevent incorrect access between the host and DSP sides, we need to
> modify DRAM as a non-cache memory type. Additionally, we can retrieve
> the size of shared DMA from the device tree.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: mt8186 modify dram type as non-cache
      commit: 1d54134df47684ee29d4d4bbe28174a4282389e0

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

