Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B2B8A359B
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Apr 2024 20:27:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CB8C211D;
	Fri, 12 Apr 2024 20:26:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CB8C211D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712946429;
	bh=SvdlhNNtUWHChB5l1joPBSlS4XqFexo2+rAXJJlhAE8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r5zDKuR7NLN+kfN2Nw9loXTUs8QUcM7LYBspLvLVaq0I07oDKDjpW1A1+k+qyAl1i
	 VcqESLgEXMwHmoJQqnyNFkEh78YIhgfQ+3DpL++i/O+QkYimG/71pSpli8KcUZ55hZ
	 WJ7+0HArvCMM4i58Su7nLGV831Ir/KalQmGc1UZg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CA6DF805A0; Fri, 12 Apr 2024 13:17:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4651F80589;
	Fri, 12 Apr 2024 13:17:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CB69F8055C; Fri, 12 Apr 2024 13:17:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F78DF80238
	for <alsa-devel@alsa-project.org>; Fri, 12 Apr 2024 13:17:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F78DF80238
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FVb1Fjbu
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3443BCE386B;
	Fri, 12 Apr 2024 11:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B7A7C113CC;
	Fri, 12 Apr 2024 11:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712920649;
	bh=SvdlhNNtUWHChB5l1joPBSlS4XqFexo2+rAXJJlhAE8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=FVb1FjbuIh0ACxAJQxzVk9u0EuMVSPdiXpsMhzvNDRhpiVlqEviQ9mzm6ZHvL+uiu
	 LyPSyrh76UCV6BeRqUhXSHsnc73W+rmgc/FT0ya2cAkH+WHBG4tbyl4ds4AoL2lpdq
	 NsBRgUzh8OSTyIuouYRSfCmZROhdqHr1I8zZssb14WoFS1Nv9rCIZUqLZZZNAoTA/T
	 l+niw7ysStJGtIM+leJ/eiMY/oD2in17aYJjMUWf0SEDqEom61jE+lvF64NxoykFg7
	 jaqw8SrgZTCEhL6QXuTiWcfsXOmMqDfUkcVpqt2I4A1y/ZobeVQ242TSVcBvPiucZC
	 jIkpSYOezqtrg==
Date: Fri, 12 Apr 2024 06:17:27 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org, broonie@kernel.org,
 linux-sound@vger.kernel.org, dardar923@gmail.com,
 devicetree@vger.kernel.org, CTLIN0@nuvoton.com, lgirdwood@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, KCHSU0@nuvoton.com, perex@perex.cz,
 SJLIN0@nuvoton.com, scott6986@gmail.com, alsa-devel@alsa-project.org,
 edson.drosdeck@gmail.com, YHCHuang@nuvoton.com, conor+dt@kernel.org,
 u.kleine-koenig@pengutronix.de, supercraig0719@gmail.com, tiwai@suse.com
In-Reply-To: <20240412103554.3487290-1-wtli@nuvoton.com>
References: <20240412103554.3487290-1-wtli@nuvoton.com>
Message-Id: <171292064682.1830010.10520655676449462428.robh@kernel.org>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: nau8821: Add delay control for
 ADC
Message-ID-Hash: IB67CRTOC7PUTHBS7H5U5CYGX6E7R75O
X-Message-ID-Hash: IB67CRTOC7PUTHBS7H5U5CYGX6E7R75O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IB67CRTOC7PUTHBS7H5U5CYGX6E7R75O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 12 Apr 2024 18:35:52 +0800, Seven Lee wrote:
> Change the original fixed delay to the assignment from the property. It
> will make it more flexible to different platforms to avoid pop noise at
> the beginning of recording.
> 
> Signed-off-by: Seven Lee <wtli@nuvoton.com>
> ---
>  .../devicetree/bindings/sound/nuvoton,nau8821.yaml        | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/nuvoton,nau8821.example.dtb: codec@1b: Unevaluated properties are not allowed ('nuvoton,nuvoton,adc-delay-ms' was unexpected)
	from schema $id: http://devicetree.org/schemas/sound/nuvoton,nau8821.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240412103554.3487290-1-wtli@nuvoton.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

