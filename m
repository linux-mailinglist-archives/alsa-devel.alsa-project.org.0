Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A30A67A235E
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 18:15:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E15BAEA;
	Fri, 15 Sep 2023 18:14:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E15BAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694794524;
	bh=C71tN8ZIhlVIDV9QKHTbB9EmSGHavmQk0JRFq/aLG+U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UGRjcSBMAJ96aCXIj/6zqi2dnFtCw45JrZYGqGuXkQVgDHX7nUqlRK+D6l55qB6us
	 BKRhU1NSzPxn4K1Qyw5FgTnVWIKpn3Mfm9ZHSQ4SmBKHN2h9bj1kR2dlXz5qsKUHRw
	 Qcc+01IwL0WdMM67Q4/YmET/5hD5vhtpvbBoWzGs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 863A6F80568; Fri, 15 Sep 2023 18:13:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2983F8055A;
	Fri, 15 Sep 2023 18:13:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C32DEF80425; Fri, 15 Sep 2023 18:13:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5601F8007C
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 18:13:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5601F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=r0ophIMJ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A9CB3620FF;
	Fri, 15 Sep 2023 16:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 254FEC433C9;
	Fri, 15 Sep 2023 16:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694794416;
	bh=C71tN8ZIhlVIDV9QKHTbB9EmSGHavmQk0JRFq/aLG+U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=r0ophIMJxc2q+fkdkYDTRxogvZGxJE1bpdqk6N3OYryTsGALno9ruuy5mLyIMg6DD
	 sVv1wk+j4YqRa+q+PCFvjyvPqjpa9EcDqH4B73wn6QwRFidGJRzZGvz04yUfizK1C+
	 bZExmfz7YE9wCmtyyud/3FdduH1tRRd/m+reRwwCCNGpQllFv2nMP2Dv7QxcR7PA5l
	 XrPfxm3UremLdzzcJkMxoZnvvUZoqhQCaqsLyqseJZCWppVAqCvQ9UoHdn/QU/hxgM
	 nWbCm575/xJqYGmf0KQDeGj0S3lC4h6lrO2xxETubNyo1C1+5FU8ZyZ0aPBYruKOoE
	 M9uHzxg0DHzhg==
From: Mark Brown <broonie@kernel.org>
To: cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, perex@perex.cz, tiwai@suse.com,
 kuninori.morimoto.gx@renesas.com, brent.lu@intel.com,
 amadeuszx.slawinski@linux.intel.com, Chen Ni <nichen@iscas.ac.cn>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230915021344.3078-1-nichen@iscas.ac.cn>
References: <20230915021344.3078-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: hdaudio.c: Add missing check for devm_kstrdup
Message-Id: <169479441287.352295.6511877103194317709.b4-ty@kernel.org>
Date: Fri, 15 Sep 2023 17:13:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: LERQNES74FUJU4U4OR2PMR74UNXOE27L
X-Message-ID-Hash: LERQNES74FUJU4U4OR2PMR74UNXOE27L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LERQNES74FUJU4U4OR2PMR74UNXOE27L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 15 Sep 2023 02:13:44 +0000, Chen Ni wrote:
> Because of the potential failure of the devm_kstrdup(), the
> dl[i].codecs->name could be NULL.
> Therefore, we need to check it and return -ENOMEM in order to transfer
> the error.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdaudio.c: Add missing check for devm_kstrdup
      commit: c04efbfd76d23157e64e6d6147518c187ab4233a

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

