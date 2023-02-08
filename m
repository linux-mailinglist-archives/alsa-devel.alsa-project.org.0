Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4749A68F036
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 14:57:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23EE3827;
	Wed,  8 Feb 2023 14:56:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23EE3827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675864619;
	bh=F98qRLabAYvPIMOUac9Fv02Zwd2Ur3nKKMMVcYlpHMs=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MZCOvGaIOnLUfgNocbTCGej/2GsD/IRbUaO6AppyHrnr19yoSIbluMmhhw99jTPY+
	 cyu4c+kjE1Jr52R9NveQzb8I3tL4K7WrSXRRmXHajMx3LinOW6N+qR0PBRDqAF58lZ
	 Jf8MBDWwYmdGb3x/v5rFvL6tivaam1iEG1Oqh9Uc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AC7DF80152;
	Wed,  8 Feb 2023 14:56:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26377F80224; Wed,  8 Feb 2023 14:56:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BDCFAF800E2
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 14:56:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDCFAF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=o6jbxEbg
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AD7A5B81E2A;
	Wed,  8 Feb 2023 13:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E8F0C433D2;
	Wed,  8 Feb 2023 13:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675864558;
	bh=F98qRLabAYvPIMOUac9Fv02Zwd2Ur3nKKMMVcYlpHMs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=o6jbxEbgvHwxp59ajodrlirNC61TayqmgjLW25TcIOayXfNQRAr7Tqn1uM8/zNyOp
	 A+TFVb6SmWoD/RkhEwt7AGP3itbQCa2jXlHP40l7+fgt7a4znZtEqOqZVjIPFrTkiT
	 LRhVcgxUDXorTbz+Z9UYYN5goLRRsVLkagczR9rb477kHXYLKMKdCogwbd1gcgKDrB
	 MbkPABEtFB3qoZ6asxgAXbk+bLim2SM2jScmluKIoJNEioViz546sHeM05b8SOI2Ut
	 83g8iNOo1yh4XRJrcfzyyi6CAv5nWR3WptNTXYZIF7EYQucxsQq4czMZn9sa7vIozp
	 hJ9S5mtLOYsLA==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kiseok Jo <kiseok.jo@irondevice.com>
In-Reply-To: <20230208092420.5037-5-kiseok.jo@irondevice.com>
References: <20230208092420.5037-5-kiseok.jo@irondevice.com>
Subject: Re: (subset) [PATCH v2 1/4] ASoC: SMA1303: Remove the I2C Retry
 property in devicetree
Message-Id: <167586455684.136560.5295803600085339125.b4-ty@kernel.org>
Date: Wed, 08 Feb 2023 13:55:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: BRH7YGXXWQDDPNBVWZVMFED4QSKHP4WD
X-Message-ID-Hash: BRH7YGXXWQDDPNBVWZVMFED4QSKHP4WD
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BRH7YGXXWQDDPNBVWZVMFED4QSKHP4WD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 08 Feb 2023 09:24:17 +0000, Kiseok Jo wrote:
> It's necessary to set the value for each device, so remove that.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SMA1303: Remove the I2C Retry property in devicetree
      commit: 1edc70c3a4c2b07dceac3ab7d564a283549a2534
[2/4] ASoC: SMA1303: Convert the TDM slot properties in devicetree to mixer
      commit: 1f5ffd57c1bcdf02e5a35bf301734476c1bf6612
[4/4] ASoC: dt-bindings: irondevice,sma1303: Rework binding and add missing properties
      commit: 677e3ab71f83c71e1482d9698bd8159c44fed93d

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

