Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7C76FFFA6
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 06:22:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C85A6DED;
	Fri, 12 May 2023 06:21:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C85A6DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683865321;
	bh=4s4KOPxQfAXypy16Av6XmHSDrmy9tNN6WXw+g/9wnHQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kvprogjeXOZ7ci+BY4fStlIV41UsEigiFWob4fZVpxCqIKTQfDM5EGcQlFTibyjjb
	 K3ax3g8Oqh+FODv+OWgM3CcVv2qvpKUWu7ZPIzPJodPE6AcjOrS1JepHdDDPoJFNS0
	 IL+SPR+RpxJPXM+08Ec1pdMj/AxlniKG8T1QQRfw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D65BF8032D; Fri, 12 May 2023 06:21:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 043D0F8032D;
	Fri, 12 May 2023 06:21:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6E17F8052E; Fri, 12 May 2023 06:20:42 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A22E4F8014C
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 06:19:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A22E4F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=j3CJjGPp
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 355B264FAC;
	Fri, 12 May 2023 04:19:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A43DC433D2;
	Fri, 12 May 2023 04:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683865156;
	bh=4s4KOPxQfAXypy16Av6XmHSDrmy9tNN6WXw+g/9wnHQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=j3CJjGPpWDT7Glm2BMa065FlUj70/0FGFOkIbhxL6k16GYWlytEatJxmvyWbcJrzU
	 F9XcUagNSHPXr1ECnP+0eifccc409/rP2vsT4zzJ0Nmb1A0Co8sWuW+Zu0V4D0oLnL
	 nzfHLgJWhFF/5cdTYBFvhj6h+C0a8ZTDH95aeKkPVh0qQXWCKhNz6WNHpOj+ypB0pb
	 JMZUNZcfXTD1IXEzl2J86VIFeJYZZNulmCWb/3EVWTKCknxuqzc7Ilra4bsPvbii+P
	 GV03buZNAG3LYnZu/wDqqSHJq4H6qMmxvgJXIEiuywQc8WLc7stcG2HzXT4aIEkfd1
	 o+40KJIsjKidg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: asahi@lists.linux.dev, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230511150546.8499-1-povik+lin@cutebit.org>
References: <20230511150546.8499-1-povik+lin@cutebit.org>
Subject: Re: [PATCH v2 0/2] ASoC SSM3515 codec driver
Message-Id: <168386515280.352974.12145582382045315561.b4-ty@kernel.org>
Date: Fri, 12 May 2023 13:19:12 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: WXG6X6OBT4S32PTMJUPB4OKLNDVNXJZK
X-Message-ID-Hash: WXG6X6OBT4S32PTMJUPB4OKLNDVNXJZK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WXG6X6OBT4S32PTMJUPB4OKLNDVNXJZK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 11 May 2023 17:05:44 +0200, Martin Povišer wrote:
> Analog Devices SSM3515 is a simple speaker amp that Apple is
> using in their 2021 iMacs, possibly elsewhere. This is a v2
> of an ASoC driver for those, to be used with upcoming ASoC
> support (in upstream kernels anyway) of those platforms.
> 
> Martin
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: Add adi,ssm3515 amp schema
      commit: 51208a4d303b78642c5d5b35fb9ce963a84d21d0
[2/2] ASoC: ssm3515: Add new amp driver
      commit: 4ac690bbae02e26e36e133becd86babb657126ef

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

