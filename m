Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48744AEA6E2
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jun 2025 21:40:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C04CC601F8;
	Thu, 26 Jun 2025 21:39:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C04CC601F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750966806;
	bh=ZLyachA0cZ1ZFfHJZ8gOmKDO10e/vQrJvgnBljltnug=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EJPt4aBueIOTN32WQYdAiZIHCnElDMSn8bu8pYv+KFZd/bz+dIg/j9r8WSBseCciY
	 ewCcpSJK/MFIg563VoPpkSFkKLtALRssHo5VwKq0fCdat2WvmGJWYO7NERE1MhNP7H
	 mYi3sy6reCWfXJLXQZomm2Q+vyqap4KRU+l48lP0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECB74F805D2; Thu, 26 Jun 2025 21:39:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D08CCF805C6;
	Thu, 26 Jun 2025 21:39:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80CFBF8016E; Thu, 26 Jun 2025 21:39:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org
 [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 762FAF80124
	for <alsa-devel@alsa-project.org>; Thu, 26 Jun 2025 21:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 762FAF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WlzMNQiD
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6152243D38;
	Thu, 26 Jun 2025 19:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD3DC4CEEB;
	Thu, 26 Jun 2025 19:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750966760;
	bh=ZLyachA0cZ1ZFfHJZ8gOmKDO10e/vQrJvgnBljltnug=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=WlzMNQiDZzb5bKE9Hzr92+/WOb3CNnGAHDTCcc2tFnVEe/z9wvqAoX0HnOBqIqBRb
	 i4t3MFMJkVWzFcbECQ5lx/EakxhhIWADGGyh5Mcl5cx79TO+VjQObu5ZYj5EvMqeFS
	 qwP9hENAcggby7r/OE7pLh6cy3/RUamyvnMQZz6gom1svqap0f5PHXW3NNR8bEiTBT
	 UQUmIiZzs3C9A6UKCN+kwZQ6r3MCo3K6Pxih3RKF0uxitXvOzE1iJqqFKXQ/x74FwF
	 jYgbnSjr0M8Z8fYuL1Za4giyH6InMG/PUWmgLbgPqznqYPpT32fzBFrjH2ErStWTMj
	 pMX8KhB4eh82g==
Date: Thu, 26 Jun 2025 14:39:19 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 devicetree@vger.kernel.org, krzk+dt@kernel.org, broonie@kernel.org,
 liam.r.girdwood@intel.com, andriy.shevchenko@linux.intel.com,
 baojun.xu@ti.com, shenghao-ding@ti.com, linux-sound@vger.kernel.org,
 v-hampiholi@ti.com, conor+dt@kernel.org, navada@ti.com
To: Niranjan H Y <niranjan.hy@ti.com>
In-Reply-To: <20250626181334.1200-3-niranjan.hy@ti.com>
References: <20250626181334.1200-1-niranjan.hy@ti.com>
 <20250626181334.1200-3-niranjan.hy@ti.com>
Message-Id: <175096675929.695498.5504104608098121359.robh@kernel.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: sound: bindings for tac5x1x family
 of codecs
Message-ID-Hash: 63L75JN5XXTF4CXUXLE5NOUTNLQXNZR5
X-Message-ID-Hash: 63L75JN5XXTF4CXUXLE5NOUTNLQXNZR5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/63L75JN5XXTF4CXUXLE5NOUTNLQXNZR5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Thu, 26 Jun 2025 23:43:31 +0530, Niranjan H Y wrote:
> tac5x1x family are series of low-power and high performance
> mono/stereo audio codecs consists of ADC and DAC combinations.
> The family consist of Codecs(DAC & ADC), ADC only and DAC only
> configurations. The documentation explains the list of devices
> in the family, their power supply configurations and gpio
> configuration options available for various functionality.
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> 
> ---
> v2:
> - Document newly added dts entries ti,adc1-impedance,
>   ti,adc2-impedance, ti,out2x-vcom-cfg
> v3:
> - add documentation for ti,pdm-input-pins
> - Update required section
> ---
>  .../devicetree/bindings/sound/ti,tac5x1x.yaml | 262 ++++++++++++++++++
>  1 file changed, 262 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/ti,tac5x1x.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Warning: Duplicate compatible "ti,taa5412" found in schemas matching "$id":
	http://devicetree.org/schemas/sound/ti,pcm6240.yaml#
	http://devicetree.org/schemas/sound/ti,tac5x1x.yaml#
Warning: Duplicate compatible "ti,taa5212" found in schemas matching "$id":
	http://devicetree.org/schemas/sound/ti,pcm6240.yaml#
	http://devicetree.org/schemas/sound/ti,tac5x1x.yaml#
Warning: Duplicate compatible "ti,tad5212" found in schemas matching "$id":
	http://devicetree.org/schemas/sound/ti,pcm6240.yaml#
	http://devicetree.org/schemas/sound/ti,tac5x1x.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/ti,tac5x1x.example.dtb: tac5x1x@52 (ti,tac5212): ti,gpa-gpio: 0 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250626181334.1200-3-niranjan.hy@ti.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

