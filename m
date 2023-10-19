Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6514E7D0357
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 22:49:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 892E8826;
	Thu, 19 Oct 2023 22:48:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 892E8826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697748584;
	bh=gCw62ZYSiZflklQDNucaDfNVH/PK6/CK3DkmvBMJeK0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mtDieRgWuNgSgvELgTKofXxfo4AxOpQ+hrwRhCNehEfEX7ToLXJuWIld9z3y7DCwZ
	 STzKSs+B6AdcuiRa32VkW0UiNveMAby66GdnRfIfcftCpbdl7XtkXktLZgP4WPSPdM
	 F4kirZyr+Imn5rXSUjsBd6znVGFHvi26vDxvNsu4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 552EFF8056F; Thu, 19 Oct 2023 22:48:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E83DBF8055A;
	Thu, 19 Oct 2023 22:48:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A1E7F8024E; Thu, 19 Oct 2023 22:47:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78CD8F8025F
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 22:47:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78CD8F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ql9ugFz+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id BEFCFB82D19;
	Thu, 19 Oct 2023 20:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4D3C433C8;
	Thu, 19 Oct 2023 20:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697748471;
	bh=gCw62ZYSiZflklQDNucaDfNVH/PK6/CK3DkmvBMJeK0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ql9ugFz+k3/DTetOYrpVaD+WqJyUtGUXd6IwQzsBYYl46t+poLxBEfg9liXtmPkoA
	 3PTv0EojiwJFGIzLi062zn+6okL53+N+0rsrtxNCyxfGyL7oDujEFvRGLHf7YZw5Cq
	 4g9GO+oaitNYGoPDMDSxB9GbtWupI/AqSkSwGiiaPkyO5ZaBoU1g6L4GhlTmeytl7J
	 8UFedNbcReYhlWo3in8MvnDgY820u/o3O6+2DIWlCITc2MQtA3aPYxht6S72URIL0T
	 CjNcaBywwFxNGRSMXYUu+9SNqhBzb+xJKoOy7tDl9GTY/IPSiO/K5J2oDXOjAVN6ph
	 TzefUti3Hl67g==
From: Mark Brown <broonie@kernel.org>
To: shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
 lgirdwood@gmail.com, Marco Felsch <m.felsch@pengutronix.de>
Cc: alsa-devel@alsa-project.org, kernel@pengutronix.de
In-Reply-To: <20231019131806.381280-1-m.felsch@pengutronix.de>
References: <20231019131806.381280-1-m.felsch@pengutronix.de>
Subject: Re: [PATCH] ASoC: tlv320aic31xx: switch to
 gpiod_set_value_cansleep
Message-Id: <169774846941.93224.12815288512806215533.b4-ty@kernel.org>
Date: Thu, 19 Oct 2023 21:47:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: YHUCJ3PEDTRI6FVZ433PMLWOUYDQ62RT
X-Message-ID-Hash: YHUCJ3PEDTRI6FVZ433PMLWOUYDQ62RT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YHUCJ3PEDTRI6FVZ433PMLWOUYDQ62RT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 19 Oct 2023 15:18:06 +0200, Marco Felsch wrote:
> Switch to gpiod_set_value_cansleep() to support gpiochips which can
> sleep like i2c gpio expanders.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tlv320aic31xx: switch to gpiod_set_value_cansleep
      commit: 897d8e86bac76d26dcd08fbd0917d9bdb280a66f

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

