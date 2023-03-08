Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6616B0EBA
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 17:27:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D8301831;
	Wed,  8 Mar 2023 17:27:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D8301831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678292871;
	bh=zrd9W9rrqmk0X8IEIh3UsVkQJ6XG3c+/DOw/cQvISbU=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NBQ37GpxjFKGypM3nS3OMzvCka5gWbF8cTSUeTr5frB0j2OpDripSkouqK9KIlUw7
	 ap2BEnCrB9kW5Oxi51U+h2SbkgGd3KPMntLENyeDer0Kbzrx/lElk+iaOjfl/kXMXj
	 oJLAJrZ1g0pNcfOZkBQnJd1Oaihhd30iMf0IWWl0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91EE6F804B1;
	Wed,  8 Mar 2023 17:26:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1166AF80236; Wed,  8 Mar 2023 17:26:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 859ADF800DF;
	Wed,  8 Mar 2023 17:25:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 859ADF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=g5RoVasy
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C2B9DB81D95;
	Wed,  8 Mar 2023 16:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 337F9C4339C;
	Wed,  8 Mar 2023 16:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678292755;
	bh=zrd9W9rrqmk0X8IEIh3UsVkQJ6XG3c+/DOw/cQvISbU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=g5RoVasy5FlQq1/n7xP8JkTIWDlDXFXpbt8z+pJiUCs5iTzKt5n8cl4eW85uLqWrt
	 uazXKyrrQowQRDuXOhj2CrgdPrVvPqb0uiUzpHWjzY6U+rRk5YS5Z5dN/MPugSigSR
	 0Su5yPqy246khyAdgHg+bz4mBv4w773RM3I7FLtrf/OiqySar5GHqKmjHxvVSRc58x
	 71Bea5XMnfdasm/0YBtPJLUa0JHMpEiD69/ttp6gpwq+hPQl221JptANvCd4vNop+n
	 Yggw61Sb+r/9piCe4AKa6KB6yN7wdhaCRBPzhkBY3LJd1pALTn6/WsjPWPVYqpEWWh
	 pECh53Y1iX5Fw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
In-Reply-To: <20230308084509.1496256-2-Vsujithkumar.Reddy@amd.com>
References: <20230308084509.1496256-1-Vsujithkumar.Reddy@amd.com>
 <20230308084509.1496256-2-Vsujithkumar.Reddy@amd.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: amd: Add pcm pointer callback for amd
 platforms.
Message-Id: <167829275079.108660.16617668154120636936.b4-ty@kernel.org>
Date: Wed, 08 Mar 2023 16:25:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: 2XOQSUFANLN57TGEHX3QSERH7PZTY3YM
X-Message-ID-Hash: 2XOQSUFANLN57TGEHX3QSERH7PZTY3YM
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, ajitkumar.pandey@amd.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Rander Wang <rander.wang@intel.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 08 Mar 2023 14:15:08 +0530, V sujith kumar Reddy wrote:
> Add pcm pointer callback for amd platforms to read host position
> update from stream box.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: amd: Add pcm pointer callback for amd platforms.
      commit: df6380dca2727bca62efdf332eaadd2e225f7c4d
[2/2] ASoC: SOF: amd: Enable cont_update_posn variable in pcm hw_params.
      commit: b7f5c11761691a6f330411cb0490c6d0ee16c5f0

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

