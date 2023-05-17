Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D850F706BA0
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 16:52:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59F661F4;
	Wed, 17 May 2023 16:51:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59F661F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684335127;
	bh=4A7TPC9rPpE7IRQLXcp+P269NIHY6f4y/qxECPLEfS0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BELXjyCy2saBBGHlF6M1IesEDDs6gRIGfCHNA/RAZBqt++oBHEItOJcpwgLLiE4/m
	 d42+yge7NQ2uCRq13LTxBQAcOZzbB80AnDambz4OCpQ8G+zIQlenRiiRr+OC9qZIOd
	 FIvuwyMvhOgE9I2/vQeV7IdEDJlZ/h/B0jd2cg10=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BB46F80272; Wed, 17 May 2023 16:50:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69DD3F8025A;
	Wed, 17 May 2023 16:50:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBBD6F80272; Wed, 17 May 2023 16:50:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB9D6F8016A
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 16:50:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB9D6F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uFKtgj28
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D8A3E63CC7;
	Wed, 17 May 2023 14:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 736ABC433EF;
	Wed, 17 May 2023 14:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684335045;
	bh=4A7TPC9rPpE7IRQLXcp+P269NIHY6f4y/qxECPLEfS0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uFKtgj284jjNvG6b4PsRFjB3ssh+BYWkAZpRo18YdV7PViAKSUytFGNDePtl6x5s0
	 9Xsa18v/0QdCCCeDGrgoaDOWFw5TI6SCeBQ+EjuxpkXqfmgM9L5iiotgTXgOisVOfw
	 9TSK8oPFVHYoFC9BfkSXTODNlyJfV26ZvR2V+FZAT2T2YURjyJaB52rsyj1Um02lZk
	 edxmtooPc9a6uFxlXVhOPS/IJmWwGDEvrEP1yrxn3rAx0dUNMH0JcNqJTf9IY+6E/P
	 b/gIKqxGeQw+NFgVMF1NeiA+UqiParbu+BF3kIq1z8BaTiX0GkPFxATGIiS5rIuvqD
	 FOj8i9vLjZ19w==
From: Mark Brown <broonie@kernel.org>
To: David Lin <CTLIN0@nuvoton.com>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 WTLI@nuvoton.com, SJLIN0@nuvoton.com, ctlin0.linux@gmail.com
In-Reply-To: <20230516054447.1081404-1-CTLIN0@nuvoton.com>
References: <20230516054447.1081404-1-CTLIN0@nuvoton.com>
Subject: Re: [PATCH] ASoC: dt-bindings: nau8810: Convert to dtschema
Message-Id: <168433504227.453649.13416759593266238659.b4-ty@kernel.org>
Date: Wed, 17 May 2023 23:50:42 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: T36QWXHP3GX5W6Y7WTOTUIB3KAC3PFLU
X-Message-ID-Hash: T36QWXHP3GX5W6Y7WTOTUIB3KAC3PFLU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T36QWXHP3GX5W6Y7WTOTUIB3KAC3PFLU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 16 May 2023 13:44:48 +0800, David Lin wrote:
> Convert the NAU8810 audio CODEC bindings to DT schema.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: nau8810: Convert to dtschema
      commit: bc8c537bd68c6fa99f81609d912115e0a6499fb5

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

