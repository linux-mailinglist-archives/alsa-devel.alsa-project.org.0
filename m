Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F8A76D557
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 19:31:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B0016C0;
	Wed,  2 Aug 2023 19:30:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B0016C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690997467;
	bh=lMe/DIyQCl/IwT6SoQDaroFkWtR5k0frE1KQOMf5qgY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ZBn9yqwyfQkizDhPJ+gccxJKYXDxZlx3iQWWl6wJoty/CYbJCU1pdSehMgq3xnO8O
	 2XNwYSdMqJzXr1mg6KalK1Fo+uyoI7f0rUl6u737V/3QCWQCwhkh2mCraY5JEPOoeg
	 c7H4N6KO6XoodKbXZx3QR+akB6nizulYLEd/cWlY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D546F80520; Wed,  2 Aug 2023 19:30:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BD47F801D5;
	Wed,  2 Aug 2023 19:30:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1173F8025A; Wed,  2 Aug 2023 19:30:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34ADCF80149
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:30:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34ADCF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=W/pqFquu
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A24CA61A5C;
	Wed,  2 Aug 2023 17:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E65E9C433C7;
	Wed,  2 Aug 2023 17:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690997403;
	bh=lMe/DIyQCl/IwT6SoQDaroFkWtR5k0frE1KQOMf5qgY=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=W/pqFquuR8uAEpllrJL/SRzWb/wDWLvGIg07eB/VoDNZwQLyHMBOkFecjwRXnxPEh
	 Ew1bIcw82QYg23XE5WxeXZR0+usfhTH53L7MKRAYSE1fn3UolMGp0ZGDquK+P9ltil
	 tQkXYOPzgU/Da+NjK8QrhKDINpoStsWi4sa1fpKhatNf5hAUIbLXnLk/3l3OqeVbl+
	 01SNKtdhTalz61URTZzwtBa1e4L+y+0kciSAsZot94jksU/vts4NBRN+InsEYANXlP
	 +YUBx/hUQfYM5qZEg2IHDlFqP1Ia9GfQkS1BVQPSpbYAHi//Z8llG1kZ5VLKhBk3ee
	 L5hlspnV2Im/g==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20230802052117.1293029-1-chancel.liu@nxp.com>
References: <20230802052117.1293029-1-chancel.liu@nxp.com>
Subject: Re: [PATCH v2 0/3] Update the register list of MICFIL
Message-Id: <169099740066.237245.1120990059871983197.b4-ty@kernel.org>
Date: Wed, 02 Aug 2023 18:30:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: JXH4MU43RX43QIAAKJ2AQE74F6NNBG6H
X-Message-ID-Hash: JXH4MU43RX43QIAAKJ2AQE74F6NNBG6H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JXH4MU43RX43QIAAKJ2AQE74F6NNBG6H/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 02 Aug 2023 13:21:14 +0800, Chancel Liu wrote:
> MICFIL IP is upgraded on i.MX93 platform. Add new registers and new bit
> definition.
> 
> changes in v2:
> - rename check_version to use_verid to make it more explicit
> - rename fsl_micfil_check_version to fsl_micfil_use_verid
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: fsl_micfil: Add new registers and new bit definition
      commit: 51d765f79c8d8016df906afd05410f8bc14167ac
[2/3] ASoC: fsl_micfil: Add fsl_micfil_use_verid function
      commit: 367365051b06e172c91172e3273eea72988ce8f6
[3/3] ASoC: fsl_micfil: Use SET_SYSTEM_SLEEP_PM_OPS to simplify PM
      commit: a38a4090e2c400c6c49c584cda6f28c73c08f5f1

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

