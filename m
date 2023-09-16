Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEADC7A2D83
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Sep 2023 04:38:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9C48A4C;
	Sat, 16 Sep 2023 04:37:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9C48A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694831880;
	bh=s/9j8ncCW1j9ftHgl8PJ5uWrhqOWZyMg0gJKtCzpw44=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UN6S4vOZTNWzcRMrIN+i9oUz6pqjjuv9dHYb1qrDb/7uaDIz4RgWEeVObPf85YyXg
	 RWjKfdoflib/LqNas1Ql65jFTtKum/G8X/nev6Hb2brZUPSULjqcZSuD3dJ0Vzomfm
	 /Hu6rXNp/qweCxNOauC2KnF95DDPntz09yIzBczU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BE8BF80212; Sat, 16 Sep 2023 04:37:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC1FCF80246;
	Sat, 16 Sep 2023 04:37:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9D22F80425; Sat, 16 Sep 2023 04:37:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51871F80212
	for <alsa-devel@alsa-project.org>; Sat, 16 Sep 2023 04:36:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51871F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=V3lgnTnp
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E9FD0620ED;
	Sat, 16 Sep 2023 02:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D12ADC433C8;
	Sat, 16 Sep 2023 02:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694831813;
	bh=s/9j8ncCW1j9ftHgl8PJ5uWrhqOWZyMg0gJKtCzpw44=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=V3lgnTnpoxVTXk+zFc3Y7Ufd5mtyYnREpoZ2P9jnoqQaACKVYQpbAfV8kHW0s3eUJ
	 9I0W6CahYt1w7JyUXuEw4pyxyJBK2DsDUI3vOKooneyFtla8ulzgNuv77M2GfiBraR
	 6WPZ0HjYeql1jwrHMVhQC8CFWGCEBarQ8mh5kzDnn2KLRomuSG6pmAQ1hAbxeC7Uhw
	 rvVEg+2MlHSvrKHXeC4i4i2Pc2pNv2zjnvG9psnVX0ehl/m2vT7uEPRbtdcQmZ+kF1
	 xF1ofd4K9rxFn9WLABWCL7j/hGast9tOi0XSxZyb2pGTxMLu1Z0soKe0PexRs4Qxse
	 eAuAxL6rVQsbw==
Received: (nullmailer pid 607829 invoked by uid 1000);
	Sat, 16 Sep 2023 02:36:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: mathias.nyman@intel.com, robh+dt@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 gregkh@linuxfoundation.org, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, Thinh.Nguyen@synopsys.com,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, agross@kernel.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, konrad.dybcio@linaro.org
In-Reply-To: <20230916001026.315-24-quic_wcheng@quicinc.com>
References: <20230916001026.315-1-quic_wcheng@quicinc.com>
 <20230916001026.315-24-quic_wcheng@quicinc.com>
Message-Id: <169483180888.607767.1542710881062922444.robh@kernel.org>
Subject: Re: [PATCH v6 23/33] ASoC: dt-bindings: Add Q6USB backend
Date: Fri, 15 Sep 2023 21:36:49 -0500
Message-ID-Hash: FSWA72J6D6B46VKEBKBIP73HEIWOLTDO
X-Message-ID-Hash: FSWA72J6D6B46VKEBKBIP73HEIWOLTDO
X-MailFrom: SRS0=w9sT=FA=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FSWA72J6D6B46VKEBKBIP73HEIWOLTDO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 15 Sep 2023 17:10:16 -0700, Wesley Cheng wrote:
> Add a dt-binding to describe the definition of enabling the Q6 USB backend
> device for audio offloading.  The node carries information, which is passed
> along to the QC USB SND class driver counterpart.  These parameters will be
> utilized during QMI stream enable requests.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  .../devicetree/bindings/sound/qcom,q6usb.yaml | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6usb.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,q6usb.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/sound/qcom,q6usb-dais.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,q6usb.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,q6usb.example.dtb: dais: qcom,usb-audio-intr-num:0: [0, 2] is too long
	from schema $id: http://devicetree.org/schemas/sound/qcom,q6usb-dais.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,q6usb.example.dtb: dais: qcom,usb-audio-intr-num:0: [0, 2] is too long
	from schema $id: http://devicetree.org/schemas/sound/qcom,q6usb-dais.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230916001026.315-24-quic_wcheng@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

