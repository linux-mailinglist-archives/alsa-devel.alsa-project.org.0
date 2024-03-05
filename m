Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4268B8728E0
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Mar 2024 21:43:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9054F3E8;
	Tue,  5 Mar 2024 21:42:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9054F3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709671387;
	bh=wGu4QJOMPf4bGNsLXpFxU0DIZdI37Z4S5dsO3ofAR0k=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=vJdwxG+mocS7IiTB5JRgvZK5z3eBfUIx42gHqo6637vxzbUF4I2cfGR0Wb1RJwFWi
	 FIEHIVe3pLj7H2ZRKY6tUWzAmTvT9w9sApWH5AoZT0H/1f9OuPIV2oqfA9Y0cxNp38
	 QM2TnQ8J6B7x1FlPJG4jLgh7wFJGWcrPxIURz01Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3C09F805D3; Tue,  5 Mar 2024 21:42:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87801F805C4;
	Tue,  5 Mar 2024 21:42:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B54E7F8024E; Tue,  5 Mar 2024 21:42:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F573F8014B
	for <alsa-devel@alsa-project.org>; Tue,  5 Mar 2024 21:42:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F573F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Yu4QqFXd
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AADF9616FF;
	Tue,  5 Mar 2024 20:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACA72C433F1;
	Tue,  5 Mar 2024 20:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709671320;
	bh=wGu4QJOMPf4bGNsLXpFxU0DIZdI37Z4S5dsO3ofAR0k=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Yu4QqFXdI04R9dsBWIcTkyRZYJD47OKlIKa6M3AMI8YhRMuj/XnejAW5gxnelXxPK
	 Dw11HqWrlNo3e05KiKyNp3pQhwKVOxszE0SP9N7uMbAYrPUd+vfotOMCTaye6uH9jy
	 QtxP752jcOu0IBqZXtpVX8QS6QOzQp6yiBKVWdgVmYEAdOAR4aynD1dmr+jQenngGe
	 4ZLqdLpb4TP/jq3dFsShuYJs8SC164twQL+KnPbe8tSSGdZ9Td4QpaJrVQ3kwPl9sI
	 m3x/WOGAkRvC0mb7fZqRMO2uhknyOPiqvCWDwNR4TKSkpNdWDzpQMy1sEW2CbtFCnY
	 s3t8QPk6JECzw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 kuninori.morimoto.gx@renesas.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20240304072128.2845432-1-chancel.liu@nxp.com>
References: <20240304072128.2845432-1-chancel.liu@nxp.com>
Subject: Re: [PATCH v3] ASoC: soc-core.c: Prefer to return
 dai->driver->name in snd_soc_dai_name_get()
Message-Id: <170967131843.228819.11945319282309242328.b4-ty@kernel.org>
Date: Tue, 05 Mar 2024 20:41:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: TO7KQSTFNT7762EFCX4ZJ3ZPJ2VG66RS
X-Message-ID-Hash: TO7KQSTFNT7762EFCX4ZJ3ZPJ2VG66RS
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TO7KQSTFNT7762EFCX4ZJ3ZPJ2VG66RS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 04 Mar 2024 16:21:28 +0900, Chancel Liu wrote:
> ASoC machine driver can use snd_soc_{of_}get_dlc() (A) to get DAI name
> for dlc (snd_soc_dai_link_component). In this function call
> dlc->dai_name is parsed via snd_soc_dai_name_get() (B).
> 
> (A)	int snd_soc_get_dlc(...)
> 	{
> 		...
> (B)		dlc->dai_name = snd_soc_dai_name_get(dai);
> 		...
> 	}
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-core.c: Prefer to return dai->driver->name in snd_soc_dai_name_get()
      commit: 755bb9a44f52dcc386c8db84d7c5a0f94ee95640

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

