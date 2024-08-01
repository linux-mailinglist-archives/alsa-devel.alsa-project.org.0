Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD87894414D
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 04:39:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16AFF32CE;
	Thu,  1 Aug 2024 04:39:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16AFF32CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722479966;
	bh=cgxg4rbo4fUOa9zSmibfWqsv00PQFdhsSeKcX4HAPjg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VITz4lvK9DEf2fLoOGlMwMg8oA4VOPfdchrdoiIpqC8B0p58YtPBo5YnE9XiJ/0/7
	 R9uoRMeUA7z1HrHydjpCieMvstZULDCeB7t5nfwA7ltWyaCaqLTxzMq8tLa5kzb1qU
	 jqaKv+bRt6zc3iawOecKqXENkaHJ3/yIsMwMQDw0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7529F8026A; Thu,  1 Aug 2024 04:38:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07734F805AE;
	Thu,  1 Aug 2024 04:38:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2277F8007E; Thu,  1 Aug 2024 04:24:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D6B6F8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 04:22:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D6B6F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=g0NGMFz1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DB8B66270A;
	Thu,  1 Aug 2024 02:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24934C116B1;
	Thu,  1 Aug 2024 02:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722478932;
	bh=cgxg4rbo4fUOa9zSmibfWqsv00PQFdhsSeKcX4HAPjg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=g0NGMFz1HOD7/T0s35VIIArFp5yKZQqK2zn5bgOKLqFQWsYd2iG92tRhhtE2CpZQF
	 QBuD9G/910Q7Mw1q+xOpDWtVsZ4sszv644qjVVhmFSml9jrzsiCclJE25xEyWcDc/W
	 SHfoGtCNOu/yzzmspyvZOkdZN9+ockI+hBATMnlbH2aszcTagPa1fHk/Wr6X05VvgQ
	 h9ToZZi1ciswwXnPVXqurmNQFmlwQzwRE7FgzaiyAkcQRK6d+h6WdzlTs73VNxDx9l
	 pm1zKgvDDqkWBF5H/iUyc6pJ3msqajhP+PoFAptHCJkmRki/JKN1Cm2NsjlT3cxxnY
	 0VUev0OBhuy5g==
Date: Wed, 31 Jul 2024 20:22:10 -0600
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: mathias.nyman@intel.com, linux-usb@vger.kernel.org,
 Thinh.Nguyen@synopsys.com, krzk+dt@kernel.org,
 srinivas.kandagatla@linaro.org, linux-doc@vger.kernel.org,
 bgoswami@quicinc.com, linux-arm-msm@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, corbet@lwn.net,
 perex@perex.cz, gregkh@linuxfoundation.org, conor+dt@kernel.org,
 linux-sound@vger.kernel.org, broonie@kernel.org
In-Reply-To: <20240801011730.4797-14-quic_wcheng@quicinc.com>
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-14-quic_wcheng@quicinc.com>
Message-Id: <172247893082.2670643.17763625549296585780.robh@kernel.org>
Subject: Re: [PATCH v24 13/34] ASoC: dt-bindings: Update example for
 enabling USB offload on SM8250
Message-ID-Hash: 3JFNKE7INVWUK3A3SYQ5PCDXAQXCQA4I
X-Message-ID-Hash: 3JFNKE7INVWUK3A3SYQ5PCDXAQXCQA4I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3JFNKE7INVWUK3A3SYQ5PCDXAQXCQA4I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 31 Jul 2024 18:17:09 -0700, Wesley Cheng wrote:
> Add an example on enabling of USB offload for the Q6DSP.  The routing can
> be done by the mixer, which can pass the multimedia stream to the USB
> backend.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  .../devicetree/bindings/sound/qcom,sm8250.yaml    | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/sound/qcom,sm8250.example.dts:97.44-45 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:427: Documentation/devicetree/bindings/sound/qcom,sm8250.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240801011730.4797-14-quic_wcheng@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

