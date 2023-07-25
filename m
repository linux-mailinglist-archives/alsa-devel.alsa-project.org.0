Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43421762223
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 21:21:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F0801DD;
	Tue, 25 Jul 2023 21:20:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F0801DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690312896;
	bh=dVWK6brqJ72lP1284WQbt7Kmdk3X5561r/T6mn5079w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JzNYeNQfYHxb7m+Lakr+Eg/ZAVk7I2ZyCDSDFKPWNHyOv3WHX6z2YnZsAyUcNotYs
	 sgkE6k2eqjc77ZkHPAwsFwTwkTj3NmxBlwfoLxsTJPYJLODqOPAybX2oG2GcLd6Dg7
	 C/bte2ld+qgSCmB6xCVqwtfaSurlenwXmEnHaPNk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E12DF80548; Tue, 25 Jul 2023 21:20:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 442FBF80163;
	Tue, 25 Jul 2023 21:20:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53315F8019B; Tue, 25 Jul 2023 21:20:41 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 45B7CF80153
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 21:20:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45B7CF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RJaWbK7Q
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E3A5B617B9;
	Tue, 25 Jul 2023 19:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99110C433C7;
	Tue, 25 Jul 2023 19:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690312832;
	bh=dVWK6brqJ72lP1284WQbt7Kmdk3X5561r/T6mn5079w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RJaWbK7QcOAJxh2RZQRztRDP0htTyO2DToOGfhruJ7UOdqBOipiczbclTD6jIwnfH
	 GZ/aPx/c5gZCGLp/RdPoka4di92GkOfeJmM+X29h9taf1NhS1c/a/SUniH2z3yPDlL
	 2DqiolqW7P35Oxv7Mdp9IFZkhxf1EdIL3SjfBeNq5ZdTzIQg0fM8UMTiy+8MO722uB
	 dY80HjDyesiCPQMLOxDLWIb0OE/FCp55DOrzJxT3eo/OYc9ZZADVsnE8zof78k5VTL
	 WjS5QS0B5tmqXIl7J2XlWR3EW73lX22y6hGPUTDUfUuglF+Pl4zbG8+gU96uNbfuLR
	 NtObxTgYs9aEw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Yang Yingliang <yangyingliang@huawei.com>
Cc: james.schulman@cirrus.com, david.rhodes@cirrus.com,
 rf@opensource.cirrus.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com
In-Reply-To: <20230725120917.513064-1-yangyingliang@huawei.com>
References: <20230725120917.513064-1-yangyingliang@huawei.com>
Subject: Re: [PATCH -next] ASoC: cs42l51: change cs42l51_of_match to static
Message-Id: <169031283035.1609546.17602518073851310377.b4-ty@kernel.org>
Date: Tue, 25 Jul 2023 20:20:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: BU6PTZF2KVWOYS3GSOLUAZLLHFEU6MMB
X-Message-ID-Hash: BU6PTZF2KVWOYS3GSOLUAZLLHFEU6MMB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BU6PTZF2KVWOYS3GSOLUAZLLHFEU6MMB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 25 Jul 2023 20:09:17 +0800, Yang Yingliang wrote:
> cs42l51_of_match is only used in cs42l51-i2c.c now,
> change it to static.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l51: change cs42l51_of_match to static
      commit: df8d014edd646692302f3e8ef0bd63a041f4547f

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

