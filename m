Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BF7900246
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2024 13:36:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFEBA852;
	Fri,  7 Jun 2024 13:36:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFEBA852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717760186;
	bh=y7+8ojeWaklXFdnopbOqrkFJH6Oh8Z5R/PffM5vSdfg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UHiy7KTwfFJeTx1UI8uaOTFTCYtGUpzeH685YRFhAwklwogIAFLD2Zz2AmYZxeX83
	 noShWXh7lFM9FgFAyU/lBT/BrNit1n0mdWidUZ6XNxJHnupWO1vk//9Jm+W9xUFQUK
	 8ICTKoNXm03aar11J8HTPGBE+oJMb0OaKDY7mO8I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF762F80580; Fri,  7 Jun 2024 13:35:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 433D4F804B2;
	Fri,  7 Jun 2024 13:35:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E033F804B2; Fri,  7 Jun 2024 13:35:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5043F800AC
	for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2024 13:35:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5043F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SOOuwWsj
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2DA50CE1CE7;
	Fri,  7 Jun 2024 11:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4913FC2BBFC;
	Fri,  7 Jun 2024 11:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717760128;
	bh=y7+8ojeWaklXFdnopbOqrkFJH6Oh8Z5R/PffM5vSdfg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=SOOuwWsj5QcciH77iaCxUtsiio48wUTC8mcnND+OlApkTD7emSSH/tZ3qCHkG1LYA
	 Brhqf+roHNXGCQKUX9M3eGuUeOYLDdhDvg4FE1MWMxDfwXZehoMsdztnwEQNd6DTZj
	 PVXdjLiWnXLxJzS9I2AScHWqD6FC6Jizn1rSC+2HzL0EJ970MeahFUO9S2CjzOV7wt
	 8SHu/TH8VSVGiagQoQ9c17sT08LM3A76RWzmYsvPt6wTjJWaexzD33E/rNMwgBucaS
	 VW1fg+ErnDwVlk2SMgvdMljfvv6nRWrmrYXz0/YBgjkKjbZRlLQUTji8bEjiEelC65
	 DhAeuLxS94vkw==
Date: Fri, 07 Jun 2024 05:35:27 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Cc: Ricard Wanderlof <ricardw@axis.com>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, Baojun Xu <baojun.xu@ti.com>,
 Shenghao Ding <shenghao-ding@ti.com>, devicetree@vger.kernel.org,
 kernel@axis.com, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, alsa-devel@alsa-project.org,
 Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Kevin Lu <kevin-lu@ti.com>
In-Reply-To: <20240607-tlv320adc3xxx-micbias-gpo-v2-1-b140a45ffffe@axis.com>
References: <20240607-tlv320adc3xxx-micbias-gpo-v2-0-b140a45ffffe@axis.com>
 <20240607-tlv320adc3xxx-micbias-gpo-v2-1-b140a45ffffe@axis.com>
Message-Id: <171776012736.1713547.9580962210836921996.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: tlv320adc3xxx: Add
 MICBIAS-as-GPO properties
Message-ID-Hash: QBFNOJRCG6DXL6K5AUYEMBJJXEGTSZCT
X-Message-ID-Hash: QBFNOJRCG6DXL6K5AUYEMBJJXEGTSZCT
X-MailFrom: robh@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QBFNOJRCG6DXL6K5AUYEMBJJXEGTSZCT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 07 Jun 2024 12:00:45 +0200, Ricard Wanderlof wrote:
> Add properties for configuring the MICBIAS pins as general purpose
> outputs, with some limitations: The voltage on the pin when activated
> may be set using another property to 2.0 V, 2.5 V or AVDD.
> When deactivated the pin will float.
> 
> Signed-off-by: Ricard Wanderlof <ricard.wanderlof@axis.com>
> ---
>  .../bindings/sound/ti,tlv320adc3xxx.yaml           | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml:128:25: [warning] too few spaces after comma (commas)
./Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml:129:25: [warning] too few spaces after comma (commas)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240607-tlv320adc3xxx-micbias-gpo-v2-1-b140a45ffffe@axis.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

