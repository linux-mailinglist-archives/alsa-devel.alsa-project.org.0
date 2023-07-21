Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5146675C091
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 09:57:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 080AF203;
	Fri, 21 Jul 2023 09:57:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 080AF203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689926273;
	bh=uIQ8q7XSnF8hoWoQCg3GFFGmD657fExNIBt1fiMAPaw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TqHI2sOFu+bFmUzSkrrrsJYHwILBBbXnL+KT9lGYx+9e/RG2QGYjREXCrzbliBoWC
	 jcnN753XpcIe+vK+T20rLsaquA1+1HJ54EIv9fgexjjNm+59haKTFG8C3T9feBmIkb
	 SrwULR0E8Mq3scJPEJKB0gOF6IPi3tcq0yA93syI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4FF7F80552; Fri, 21 Jul 2023 09:56:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29D36F80535;
	Fri, 21 Jul 2023 09:56:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA850F8047D; Fri, 21 Jul 2023 09:56:06 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E7D0F8027B
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 09:56:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E7D0F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SE9P4icI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4723861595;
	Fri, 21 Jul 2023 07:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C7F8C43395;
	Fri, 21 Jul 2023 07:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689926158;
	bh=uIQ8q7XSnF8hoWoQCg3GFFGmD657fExNIBt1fiMAPaw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SE9P4icIE0VBim2cgG9RpUwM3JoSWh/zzU4yPJNunSKyEyW0gXC3ez8X4kTQ4z+NY
	 5f1D1REkn8OjifY3N+CTj2AQrZ6yh8lk7IHCcZSyBSvMIufqcEucn/jxveOE7RUT6O
	 E3hsNcLGqHaCwe8Z6Z7UV8kJdw8EmB/5K4jp9qrsLRwJWbZYtQOXPMrGMrYMwv+UZP
	 Ik3VQeAAsHFHv3OU8uqplhmkoiUbtSszn5lEZJ0rgPcGCDkeBg5jG1VZvPJ5PxggIW
	 eaXVJa8vWo3zJGwieOKx4OKu/F2ePu9MFRG0s5pyRvdvbu/y+YdRWCYbj13RdZQrTR
	 5hMY89qArpteQ==
From: Lee Jones <lee@kernel.org>
To: broonie@kernel.org, lee@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linus.walleij@linaro.org, vkoul@kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: robh+dt@kernel.org, conor+dt@kernel.org, lgirdwood@gmail.com,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230619095623.1987742-1-ckeepax@opensource.cirrus.com>
References: <20230619095623.1987742-1-ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH v5 0/6] Add cs42l43 PC focused SoundWire CODEC
Message-Id: <168992615492.1924396.13464534208592126033.b4-ty@kernel.org>
Date: Fri, 21 Jul 2023 08:55:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
Message-ID-Hash: YTGA4MUX2V5HPSYCKDOCJ2HWMQNM4R7M
X-Message-ID-Hash: YTGA4MUX2V5HPSYCKDOCJ2HWMQNM4R7M
X-MailFrom: lee@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YTGA4MUX2V5HPSYCKDOCJ2HWMQNM4R7M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 19 Jun 2023 10:56:17 +0100, Charles Keepax wrote:
> This patch chain adds support for the Cirrus Logic cs42l43 PC focused
> SoundWire CODEC. The chain is currently based of Lee's for-mfd-next
> branch.
> 
> Thanks,
> Charles
> 
> [...]

Applied, thanks!

[2/6] dt-bindings: mfd: cirrus,cs42l43: Add initial DT binding
      commit: e62ba8443b11f12b45c61444249458a2f8c2f4ef
[3/6] mfd: cs42l43: Add support for cs42l43 core driver
      commit: 843079209e1506c94fde797fc0ff914e2c9e6645
[4/6] pinctrl: cs42l43: Add support for the cs42l43
      commit: 85f034dd7ff0a66aded653cc91dbc406fba7cf1a

--
Lee Jones [李琼斯]

