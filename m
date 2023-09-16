Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CAA7A2D85
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Sep 2023 04:38:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 820BBDF1;
	Sat, 16 Sep 2023 04:38:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 820BBDF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694831931;
	bh=DUIXYVvaiR1keYTg+miPivXtIvLrN04LFwPuanPw45o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DWX2KRMbmbPMOJ08OG4P20RB/F4LqgPBd/L2lGQyXBzjXcS+jy6sNAIE2sDQck7g9
	 gpXktSFuO7ml1znn261I9q7HOwbRoyYfcxpbdhCrDPGf4gsn3pMXnhXxgwvrC7u6dx
	 MmfC6amF77O4VlTz2XHIUz+gGqtINf6IpaY8E+k0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A366BF80537; Sat, 16 Sep 2023 04:37:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24116F8055A;
	Sat, 16 Sep 2023 04:37:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C538F80425; Sat, 16 Sep 2023 04:37:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB299F80212
	for <alsa-devel@alsa-project.org>; Sat, 16 Sep 2023 04:37:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB299F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MAJt6ld0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id B938DCE2E67;
	Sat, 16 Sep 2023 02:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4FD3C433CB;
	Sat, 16 Sep 2023 02:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694831817;
	bh=DUIXYVvaiR1keYTg+miPivXtIvLrN04LFwPuanPw45o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MAJt6ld0NervcoMWRakm4IMmY4S9TiVuhxsX/g1way4XvP8b2eUtPLgPa0PhXXCmb
	 s8mUtmMLKbpIcPqSyH5HXMT8CiTGZ32xvQXZyAY4ys8ravwyX6mg4dORPZfU7qmFRy
	 vo+mQbCrWxa43bVwwY3iG13MOMqTyKXtZLpLU2iqNMPkDz5go/v6k2P7zwqUzWCS2M
	 OSQ5Gvm+ibHFQOOJs1wtxM+o1CRWqo3A9XinbhcjKG4FXgWYzblzj2tcuWG7jJTPtG
	 yC5vuoD4Pi/xf0YIALg8zuOWDbQPZSb8Zq7sUwvpNzo3k5bG/jReMkRWrNbzSI0xLn
	 WaAaFR2HTbvRQ==
Received: (nullmailer pid 607832 invoked by uid 1000);
	Sat, 16 Sep 2023 02:36:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: broonie@kernel.org, andersson@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, conor+dt@kernel.org, agross@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, bgoswami@quicinc.com,
 konrad.dybcio@linaro.org, perex@perex.cz, devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
 srinivas.kandagatla@linaro.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, mathias.nyman@intel.com,
 robh+dt@kernel.org, linux-usb@vger.kernel.org
In-Reply-To: <20230916001026.315-25-quic_wcheng@quicinc.com>
References: <20230916001026.315-1-quic_wcheng@quicinc.com>
 <20230916001026.315-25-quic_wcheng@quicinc.com>
Message-Id: <169483180949.607796.6898944173811945795.robh@kernel.org>
Subject: Re: [PATCH v6 24/33] ASoC: dt-bindings: Update example for
 enabling USB offload on SM8250
Date: Fri, 15 Sep 2023 21:36:49 -0500
Message-ID-Hash: VRTY25SBLJ3WKFSEO7KFWBDSUGMFZPRK
X-Message-ID-Hash: VRTY25SBLJ3WKFSEO7KFWBDSUGMFZPRK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VRTY25SBLJ3WKFSEO7KFWBDSUGMFZPRK/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 15 Sep 2023 17:10:17 -0700, Wesley Cheng wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230916001026.315-25-quic_wcheng@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

