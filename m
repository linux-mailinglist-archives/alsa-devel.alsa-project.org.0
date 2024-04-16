Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D248A6573
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Apr 2024 09:52:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F6DB15FE;
	Tue, 16 Apr 2024 09:52:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F6DB15FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713253964;
	bh=a19vA6wI20HdT0Dr8/OmeBGoDRFOQGDMAe/IdzCQ1Wc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MA9/8P7d6UOD7nEWqkUZlKduK4XCXnxz8hzkMTDXc6rKIbyseVdH/Vgop8ZaXZQGt
	 Vk65SiItjosv1L01OHFL7S7jo9ntb7+tZqnPcpKBzc/t2p2qciuO+gtya8u+GFL516
	 rMXhMvVY9VP64ZngAdaxUt+oTmVK/3srHW48Kpgw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA1A4F80423; Tue, 16 Apr 2024 09:52:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27B35F805A0;
	Tue, 16 Apr 2024 09:52:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13EE8F8025A; Tue, 16 Apr 2024 09:51:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40296F80124
	for <alsa-devel@alsa-project.org>; Tue, 16 Apr 2024 09:51:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40296F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pa53K9ZC
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 069DDCE0EE2;
	Tue, 16 Apr 2024 07:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4C2C113CE;
	Tue, 16 Apr 2024 07:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713253905;
	bh=a19vA6wI20HdT0Dr8/OmeBGoDRFOQGDMAe/IdzCQ1Wc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=pa53K9ZChmBVU8nR3+qp6d91nC5m2nR2Wl5sSGi2QJSsJEbusQo7tijjpUG3wJgaS
	 WKM2nloIaEmglewwgemiEGrjgtolzRKdyM40iGqJU4yE/cm+Ojm3wH6dbzNNM8/7kf
	 HYQwdmV10GXXuOFOdF7ioPoCHVo30ecS4OJml2NAti5DmPcIX3t7JD6GK56nYvHEWh
	 WN5xb2om9+P8wewmRP4xLuQgr4gFAU5tHqVuBy08NWf+ma9Qo4sDLds8KjAFpIeNhx
	 i7XUyD6aKilDLyUAxjJC+vNPbjrDHU1xYLiADrwzfAZk7eBf9G8L0mGVuN6JPRoUcS
	 qWqDj6DLvyEIA==
Date: Tue, 16 Apr 2024 02:51:44 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, quic_pkumpatl@quicinc.com,
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 Banajit Goswami <bgoswami@quicinc.com>, devicetree@vger.kernel.org,
 quic_rohkumar@quicinc.com, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, alsa-devel@alsa-project.org
In-Reply-To: <20240416063600.309747-4-quic_mohs@quicinc.com>
References: <20240416063600.309747-1-quic_mohs@quicinc.com>
 <20240416063600.309747-4-quic_mohs@quicinc.com>
Message-Id: <171325390367.1353462.6738496215058640142.robh@kernel.org>
Subject: Re: [PATCH v2 3/8] ASoC: dt-bindings: wcd937x-sdw: add bindings
 for wcd937x-sdw
Message-ID-Hash: VQN3JSCMUNUSR7OUVF45R3OSV2MQTYWC
X-Message-ID-Hash: VQN3JSCMUNUSR7OUVF45R3OSV2MQTYWC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VQN3JSCMUNUSR7OUVF45R3OSV2MQTYWC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 16 Apr 2024 12:05:55 +0530, Mohammad Rafi Shaik wrote:
> From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> 
> Qualcomm WCD9370/WCD9375 Codec is a standalone Hi-Fi audio codec IC
> connected over SoundWire. This device has two SoundWire devices RX and
> TX respectively.
> This binding is for those slave devices on WCD9370/WCD9375.
> 
> Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  .../bindings/sound/qcom,wcd937x-sdw.yaml      | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,wcd937x.example.dtb: codec@0,4: 'qcom,port-mapping' is a required property
	from schema $id: http://devicetree.org/schemas/sound/qcom,wcd937x-sdw.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,wcd937x.example.dtb: codec@0,3: 'qcom,port-mapping' is a required property
	from schema $id: http://devicetree.org/schemas/sound/qcom,wcd937x-sdw.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.example.dtb: codec@0,4: 'qcom,port-mapping' is a required property
	from schema $id: http://devicetree.org/schemas/sound/qcom,wcd937x-sdw.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.example.dtb: codec@0,3: 'qcom,port-mapping' is a required property
	from schema $id: http://devicetree.org/schemas/sound/qcom,wcd937x-sdw.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240416063600.309747-4-quic_mohs@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

