Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB2E708B9C
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 00:30:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 441BD207;
	Fri, 19 May 2023 00:29:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 441BD207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684449046;
	bh=2VgBUzVlnEVpOIgXOTxYbz1FuwxJ5i+ZlUpDBnLHX94=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FuZU2vipKxAdvuwom5jwfeE9Emqk70ZSJJqosvaN9GGmKPFva0Ky6Yrealz1lFHBn
	 hPZeVPH0khcUUf8F4FlGxdb1uyg+E/HASTLBLmAkReE/5+pcgsgg6Zfn1TrVNsHuKV
	 CGxCRG/GYpilCVsmz8jOBKknxQwoQloic3S5XpKM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B8A4F80551; Fri, 19 May 2023 00:29:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E569AF80551;
	Fri, 19 May 2023 00:29:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BB4BF80272; Fri, 19 May 2023 00:29:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77C02F8024E
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 00:29:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77C02F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OMKjk3kK
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 01455651F1;
	Thu, 18 May 2023 22:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405C4C4339C;
	Thu, 18 May 2023 22:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684448953;
	bh=2VgBUzVlnEVpOIgXOTxYbz1FuwxJ5i+ZlUpDBnLHX94=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OMKjk3kKSYoA8hoMDfTd0/mGocjletLSYjT9vSrun2PJ4svWG96s6X8kiakse+4Dj
	 5/vBANTdjVKQZ705gkz/Lb/nverf8xWL3MV+mBa3pxErhHX2FB3cxZTac9VStQ6uNC
	 BiJbx7u28xlEVvnOzRN+Ebl9Clp27hJjOBtpFp/zndho28tBT4QPCM4BkdXEoQEgCZ
	 bFfrQpTJi7RQ4uwYLTX9IWX6GTY5Mz7e+jXoorR91YG3MEwxfruVg5546yVUgKEs0C
	 fvGxpEbd26EVdwROBMXVa6XybDaqDLbpijI+vktNMJyIO0Lq84waXtvEjSLd9VR0PS
	 GnHTx6juvxo+Q==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20230517185731.487124-1-pierre-louis.bossart@linux.intel.com>
References: <20230517185731.487124-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: soc-pcm: test if a BE can be prepared
Message-Id: <168444895201.494451.12117820918207580971.b4-ty@kernel.org>
Date: Fri, 19 May 2023 07:29:12 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: LDTACEQTTBMVXSBCXSH67EPSLW5KTLXH
X-Message-ID-Hash: LDTACEQTTBMVXSBCXSH67EPSLW5KTLXH
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 17 May 2023 13:57:31 -0500, Pierre-Louis Bossart wrote:
> In the BE hw_params configuration, the existing code checks if any of the
> existing FEs are prepared, running, paused or suspended - and skips the
> configuration in those cases. This allows multiple calls of hw_params
> which the ALSA state machine supports.
> 
> This check is not handled for the prepare stage, which can lead to the
> same BE being prepared multiple times. This patch adds a check similar to
> that of the hw_params, with the main difference being that the suspended
> state is allowed: the ALSA state machine allows a transition from
> suspended to prepared with hw_params skipped.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: test if a BE can be prepared
      commit: e123036be377ddf628226a7c6d4f9af5efd113d3

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

