Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9014760886
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 06:28:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 877ABDFA;
	Tue, 25 Jul 2023 06:27:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 877ABDFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690259295;
	bh=4U1uopwM9UsL7OEd1qy66ef7kIJFN2/ulrs7WZhjSmk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YfB+Drc3IMfT8GfnGTPRvWuIaBrU9BpsRE5NBX0vICoV8Ll9aanhHlZx0THGlJ1QS
	 QiIAeZ1ypMjj2HQ2HMGwCwLS96ZtAh7iiQ4qftFVgR1EsYhdc+F3y5CbWk7aFUXi+k
	 44+FVdSe3NOl/gmBtgzIDBM70p1t1XYE/F4jpHks=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A456EF80520; Tue, 25 Jul 2023 06:27:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5296DF80163;
	Tue, 25 Jul 2023 06:27:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A789F8019B; Tue, 25 Jul 2023 06:27:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8B51F800C7
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 06:27:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8B51F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qixjZFGz
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BC75361526;
	Tue, 25 Jul 2023 04:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1564CC433C7;
	Tue, 25 Jul 2023 04:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690259222;
	bh=4U1uopwM9UsL7OEd1qy66ef7kIJFN2/ulrs7WZhjSmk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qixjZFGzQqxoITmGdgCkX7e9DMt4esefg/kSinr9nMy8fHu1vqhVpqniBTx/ljSQu
	 buiN4vKHghU7YZjlfkdXJQ/ZPSX0vftMe01poahGOOthCdLxGCa/JG2Dgy38Z0w7mO
	 EuUXlfroBEvgwnt6fqph1uxCIsg9LL07FaCQTqA7ycEyIFFaDbNATivmbc5cx+S15V
	 7yq06T1sgYZwtc/3gmvwzf7uD5GV3djvF9zuXVmjuygJH8M0qnF8vIfpkf9X4FHKJj
	 mX0XlQQ37vanHNX5eSBzciVXdTb6FneLNYCg1cn/Ddazdw3oP11zvLYA/0vdpb1QD3
	 U/X54U7OW8gjQ==
Received: (nullmailer pid 1869529 invoked by uid 1000);
	Tue, 25 Jul 2023 04:26:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: broonie@kernel.org, oneukum@suse.com,
 linux-arm-kernel@lists.infradead.org, quic_jackp@quicinc.com,
 devicetree@vger.kernel.org, catalin.marinas@arm.com, o-takashi@sakamocchi.jp,
 mathias.nyman@intel.com, conor+dt@kernel.org, bgoswami@quicinc.com,
 linux-usb@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 pierre-louis.bossart@linux.intel.com, srinivas.kandagatla@linaro.org,
 albertccwang@google.com, will@kernel.org, alsa-devel@alsa-project.org,
 andersson@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, perex@perex.cz, linux-arm-msm@vger.kernel.org,
 Thinh.Nguyen@synopsys.com, tiwai@suse.com, agross@kernel.org,
 gregkh@linuxfoundation.org
In-Reply-To: <20230725023416.11205-25-quic_wcheng@quicinc.com>
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
 <20230725023416.11205-25-quic_wcheng@quicinc.com>
Message-Id: <169025921911.1869485.17693463435324220177.robh@kernel.org>
Subject: Re: [PATCH v4 24/32] ASoC: dt-bindings: Update example for
 enabling USB offload on SM8250
Date: Mon, 24 Jul 2023 22:26:59 -0600
Message-ID-Hash: FY77DVT5CLMGP53AH34TPDFSMJLAVCV7
X-Message-ID-Hash: FY77DVT5CLMGP53AH34TPDFSMJLAVCV7
X-MailFrom: SRS0=nS92=DL=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FY77DVT5CLMGP53AH34TPDFSMJLAVCV7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 24 Jul 2023 19:34:08 -0700, Wesley Cheng wrote:
> Add an example on enabling of USB offload for the Q6DSP.  The routing can
> be done by the mixer, which can pass the multimedia stream to the USB
> backend.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  .../devicetree/bindings/sound/qcom,sm8250.yaml    | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/sound/qcom,sm8250.example.dts:97.44-45 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/sound/qcom,sm8250.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1500: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230725023416.11205-25-quic_wcheng@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

