Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FF96B0A0F
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 14:55:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E95B51811;
	Wed,  8 Mar 2023 14:54:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E95B51811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678283706;
	bh=+C+MWqB06I7ymahyBZ8lpIwX6fh3T5+OOmrRuiFTQco=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=APMoEB/YzGnginwNnoVhveGTXxXjrzKKKISGMDkXFq854FhXL7VJx4J9AF+dY9lZe
	 z2iy6c3beEOCiFHW3lopEJJDI+7jjCrKQbhOeI7EfrpOjWNrYwd4J4KrtInw7OfxD4
	 SgIW6cZEFm9HqI2oZtVUicaDSkJcHOXDe0Kgxeys=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8551F80549;
	Wed,  8 Mar 2023 14:52:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71FD2F80527; Wed,  8 Mar 2023 14:52:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F07ACF8007E
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 14:52:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F07ACF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=f7eL06UN
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7B44CB81CE8;
	Wed,  8 Mar 2023 13:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FEEEC4339B;
	Wed,  8 Mar 2023 13:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678283554;
	bh=+C+MWqB06I7ymahyBZ8lpIwX6fh3T5+OOmrRuiFTQco=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=f7eL06UNX0r+6EjaWjUuB9XCJ2oxwYpTiEXKCi+X27X0e1uO2TmHRVE4aFeOwolGE
	 /tROTFTRjGpHJ/bhh4Lrtv/vfN7wjqWQitJ7lh6t7Iht1v3SGZXONGEMONr4HlfuzL
	 tNXuTRbFh6tScaLtYLjgudJvu838O1SGgCAUzJsljp+6nLVQyU9+KsB9pJ0aUfzse7
	 FIb7tK3qzbkssQXw3Z+w3yIYB/KGD6cB88WBzcEmJb5gzBCyq8jmx2y+8cRGvv0Pvh
	 2NHGyPDRWVzO0Ugk/w0xYpswWHN2Kd0RmLT+82o60bfC051GSo7XGV35H4aiGSW2GW
	 Y2AR4Uq1s92zw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230307093914.25409-1-peter.ujfalusi@linux.intel.com>
References: <20230307093914.25409-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/4] SoC: SOF: Intel: FIx device descriptions (missing
 ops_free)
Message-Id: <167828355182.31859.2211733772233259552.b4-ty@kernel.org>
Date: Wed, 08 Mar 2023 13:52:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: GOXMO56BJZJRGAX7EZ3S5KO6YLW2BCOX
X-Message-ID-Hash: GOXMO56BJZJRGAX7EZ3S5KO6YLW2BCOX
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GOXMO56BJZJRGAX7EZ3S5KO6YLW2BCOX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 07 Mar 2023 11:39:10 +0200, Peter Ujfalusi wrote:
> We have recently noticed that the ops_free callback was missed for the device
> descriptions on Intel platforms.
> 
> Regards,
> Peter
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: Intel: MTL: Fix the device description
      commit: a659e35ca0af2765f567bdfdccfa247eff0cdab8
[2/4] ASoC: SOF: Intel: HDA: Fix device description
      commit: 9eb2b4cac223095d2079a6d52b8bbddc6e064288
[3/4] ASoC: SOF: Intel: SKL: Fix device description
      commit: 1f320bdb29b644a2c9fb301a6fb2d6170e6417e9
[4/4] ASOC: SOF: Intel: pci-tgl: Fix device description
      commit: 376f79bbf521fc37b871b536276319951b5bef3a

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

