Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B607C47D2
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Oct 2023 04:32:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A030E94;
	Wed, 11 Oct 2023 04:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A030E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696991567;
	bh=qtYTDtPUnp7DJJUirTj/ZCpKPdotItW9GEvz9OO8YTw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g04oCeLVELrCzL2u60zLyptemu16R6eObatrWoghNHa+8ZGfcsnA49kAAVmAumIeY
	 mnsFEDaUDlBs2VMHtgPAiXq6IVdgLnG6bUFcB8UZS8++RtnnobPnazQM1cxiC0O+Uv
	 x86OlmTUO+9sjwLe5RE4pNV2SwEB1dIr4TqBLkGw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E1B5F80570; Wed, 11 Oct 2023 04:31:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 048ECF8055A;
	Wed, 11 Oct 2023 04:31:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95610F8027B; Wed, 11 Oct 2023 04:31:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21AB0F8015B
	for <alsa-devel@alsa-project.org>; Wed, 11 Oct 2023 04:31:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21AB0F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=l1GYsJYz
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 04E27B81E12;
	Wed, 11 Oct 2023 02:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48238C433CB;
	Wed, 11 Oct 2023 02:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696991470;
	bh=qtYTDtPUnp7DJJUirTj/ZCpKPdotItW9GEvz9OO8YTw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=l1GYsJYzzJrZ2IGjldrlVYtL+STlJJWL8SrHg0IKfBIYE1ObSK/pSNiexQ8lZHt0A
	 R5teAJI0nXOD9z2KKDUCOxVb+9KYt0wu06YQFPi3H4BzOUtasR7YQuwzplJ6c/znx4
	 iGj+BpJ/zxxkp9amwRlKKrIxPDYc9paLwp0x0QK+5tTF66XiAdHADBxIv1e3BucZtV
	 VczLrJkDWKg6QEuCbJJryFlwoFpnGlfm+h89VrdJuM1kC/OPz04bIh47y6lwn6mtqj
	 Y/WfNz/ivYZmeUDjs1uFRPMpjWVFc/smExUXbpLiyuzHq9zf74N5wInM9uVrIcJM31
	 /gPwUITMLaCOw==
Received: (nullmailer pid 2560996 invoked by uid 1000);
	Wed, 11 Oct 2023 02:31:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: bgoswami@quicinc.com, lgirdwood@gmail.com, broonie@kernel.org,
 gregkh@linuxfoundation.org, robh+dt@kernel.org, konrad.dybcio@linaro.org,
 conor+dt@kernel.org, linux-usb@vger.kernel.org, andersson@kernel.org,
 Thinh.Nguyen@synopsys.com, srinivas.kandagatla@linaro.org,
 linux-kernel@vger.kernel.org, agross@kernel.org, mathias.nyman@intel.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org, perex@perex.cz,
 tiwai@suse.com, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20231011002146.1821-26-quic_wcheng@quicinc.com>
References: <20231011002146.1821-1-quic_wcheng@quicinc.com>
 <20231011002146.1821-26-quic_wcheng@quicinc.com>
Message-Id: <169699146438.2560961.3220166947763848754.robh@kernel.org>
Subject: Re: [PATCH v8 25/34] ASoC: dt-bindings: Update example for
 enabling USB offload on SM8250
Date: Tue, 10 Oct 2023 21:31:04 -0500
Message-ID-Hash: 5JJL2D3OPPGWEFU2DTQGI72LWEVTKRGA
X-Message-ID-Hash: 5JJL2D3OPPGWEFU2DTQGI72LWEVTKRGA
X-MailFrom: rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5JJL2D3OPPGWEFU2DTQGI72LWEVTKRGA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 10 Oct 2023 17:21:37 -0700, Wesley Cheng wrote:
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

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/sound/qcom,sm8250.example.dts:97.44-45 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/sound/qcom,sm8250.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1427: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231011002146.1821-26-quic_wcheng@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

