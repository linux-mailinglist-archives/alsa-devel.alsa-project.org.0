Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED7470F4C7
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 13:05:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FB671E4;
	Wed, 24 May 2023 13:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FB671E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684926341;
	bh=afkaeFx0ab/vSGv0Hu2IOltH+7rU/mCIFnFsmEYzd6U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SYJP6YK6TCNiwB1hZVIl2Ggp/B/gSIP66UEPae6V5fnIC+AOoGdnM8hB/l4nxDjS2
	 U//pnM1KRaKNX6iaSKcOrXaCe8NlfL+nokR7c6C17MvdkPBE52lwqqtFB6FVBW30US
	 lwtMlVWZZK6TkoTWEZj7yyIN7AAd/ufJeq+Ds66Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8CEBF8053D; Wed, 24 May 2023 13:04:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59905F80086;
	Wed, 24 May 2023 13:04:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 396A2F8024E; Wed, 24 May 2023 13:04:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 016A0F80086
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 13:04:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 016A0F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=k5v+PymP
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5907963510;
	Wed, 24 May 2023 11:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F720C433EF;
	Wed, 24 May 2023 11:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684926271;
	bh=afkaeFx0ab/vSGv0Hu2IOltH+7rU/mCIFnFsmEYzd6U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=k5v+PymPmEws7orUUcVTez97drKQq+JQzlK8hGFUPa3l0M/n+sqt1pbaYetlIpc88
	 P1Eo3JT5XLDxH14Hyqrg8P01Vik/rf7NPiJoHwGTOvCId4I5e/pf6EdTwBRuhthGwG
	 +RdygwbQLH1Qmm/n2fO2dtRr/embB0CZeDACEssm4KjZP9GT7AHqnQxVSsHcnM7LYQ
	 gDahNNgIoo2V2hqc3BoeJeuKdiqui6GS+nZCfl2mSUAJ4dQVxu7rI0+GVkOADnxMc0
	 lYLCXWjDbMQFoMJoQHEIGPXSoV5/kSX7pwSw9d0dyGpg8h46qsFquQ2iNccssWzkSd
	 msBh0gmFeuwXQ==
From: Mark Brown <broonie@kernel.org>
To: conor+dt@kernel.org, David Rau <David.Rau.opensource@dm.renesas.com>
Cc: support.opensource@diasemi.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
In-Reply-To: <20230523161821.4260-1-David.Rau.opensource@dm.renesas.com>
References: <20230523161821.4260-1-David.Rau.opensource@dm.renesas.com>
Subject: Re: [PATCH 0/3] ASoC: da7219: Add jack insertion detection
 polarity
Message-Id: <168492626936.37175.18228969711177024530.b4-ty@kernel.org>
Date: Wed, 24 May 2023 12:04:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: MIQC4ITOIDLOUGY3VN4ZR3RQWTQ2ED62
X-Message-ID-Hash: MIQC4ITOIDLOUGY3VN4ZR3RQWTQ2ED62
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MIQC4ITOIDLOUGY3VN4ZR3RQWTQ2ED62/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 23 May 2023 16:18:18 +0000, David Rau wrote:
> This patchset adds the support of DA7219 Jack insertion detection
> polarity selection.
> 
> The first patch replaces the old txt binding with a new schema binding.
> 
> The second patch adds `dlg,jack-ins-det-pty` property for Jack
> insertion detection polarity selection.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: dialog,da7219: convert to dtschema
      commit: 345585b776e6f6f1cab846eb3efbef32c53fc0e3
[2/3] ASoC: dt-bindings: da7219: Add jack-ins-det-pty property
      commit: c28dc3bdfcd9e93b6cf1f3f0bb3c51e819fc977f
[3/3] ASoC: da7219: Add Jack insertion detection polarity
      commit: dc0ff0fa3a9bf9f7be3a9530f8f6079324f54fa5

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

