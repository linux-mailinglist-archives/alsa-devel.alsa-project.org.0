Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A99761F7E
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 18:50:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9646982A;
	Tue, 25 Jul 2023 18:49:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9646982A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690303833;
	bh=0U2M4/9fwDmwE+73v7tIZTWxbQQId/Ron0I/dXA/ffk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D9OQ03hkcfpebGTZhWR4yt5lgk3trMAVitNO84NH875++sy6bZ8mcYwhgj9nGIC/W
	 47atMOqZ4TLrN6j77wokeJ43HAFMVSHHAD6TVN6vtDw+pkOi5/r+DQkPMtk/yeEfsB
	 ldypPvxTLes5T8xrES8rOUrjR1qte6s8Lfxt4hns=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF718F800C7; Tue, 25 Jul 2023 18:49:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46AD6F800C7;
	Tue, 25 Jul 2023 18:49:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A99FF8019B; Tue, 25 Jul 2023 18:49:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C643F80153
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 18:49:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C643F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CxWt5udz
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 30D8C617FB;
	Tue, 25 Jul 2023 16:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31BE9C433C8;
	Tue, 25 Jul 2023 16:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690303752;
	bh=0U2M4/9fwDmwE+73v7tIZTWxbQQId/Ron0I/dXA/ffk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CxWt5udzeicpOwy4cLaDEYcL+DT0/+xqaMGksea7JRlFVKL20aLSuiDC9XQjh0Fxg
	 KCGqqAcbPKS3RV/O+hYumMSu7/Qj0gm9OtRikA9njb9MYKJx3L0r3l/hWq50ShTeR0
	 5ck6vqm1nSlm7wFhnu+sIdOTzSIKSOTyjrH7l059We6qK3E/lD1HAHq8xcz5gfLDnd
	 v8WifxlaysVMOQcOY/kQqZmCiK35lxmV1IOm28GaDPwYMv7Nuj9vmcHRa5F5OEagjr
	 dVgUUrYADG+JrwIYwOilYAMJXnDoULQXokBlJxxwh9Hwm7oGiYKy2XkE3Tw8cJ9L5F
	 ofDvmWqGAbXDA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Zhu Ning <zhuning0077@gmail.com>
Cc: pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
 amadeuszx.slawinski@linux.intel.com, yangxiaohua@everest-semi.com,
 zhuning@everest-semi.com
In-Reply-To: <20230717033223.42506-1-zhuning0077@gmail.com>
References: <20230717033223.42506-1-zhuning0077@gmail.com>
Subject: Re: [PATCH v2 1/5] ASoC: codecs: ES8326: Change Hp_detect register
 names
Message-Id: <169030375090.1462400.3968670068844801510.b4-ty@kernel.org>
Date: Tue, 25 Jul 2023 17:49:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: 2ITQQVKQSIPAFB3VEUW7FDIXSR5ZNQBZ
X-Message-ID-Hash: 2ITQQVKQSIPAFB3VEUW7FDIXSR5ZNQBZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2ITQQVKQSIPAFB3VEUW7FDIXSR5ZNQBZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 17 Jul 2023 11:32:19 +0800, Zhu Ning wrote:
> The old register naming method is confusing. The reg 0x57 decides
> the default headset hardware connection type, and the reg 0xfb is
> the headset detection status register, which changes during headset
> insertion. Change the name to ES8326_HPDET_TYPE and ES8326_HPDET_STA.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: codecs: ES8326: Change Hp_detect register names
      commit: 4ddad00c609bdcd6635537d3acb9bd57a5fc79e6
[2/5] ASoC: codecs: ES8326: Change Volatile Reg function
      commit: f1230a27c14b4d05e1d6af02be55c617b53728a4
[3/5] ASoC: codecs: ES8326: Fix power-up sequence
      commit: ac20a73d765c0374f5e7b5d0f2f43c4598d69c66
[4/5] ASOC: codecs: ES8326: Add calibration support for version_b
      commit: 0663286e58e6f611f3578b5e63e1faa576d139fd
[5/5] ASoC: codecs: ES8326: Update jact detection function
      commit: 04f96c9340463aae20d2511a3d6cb0b005b07d24

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

