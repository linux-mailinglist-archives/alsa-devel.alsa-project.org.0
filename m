Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DEA98CBB6
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2024 05:52:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72FA7826;
	Wed,  2 Oct 2024 05:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72FA7826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727841165;
	bh=JapzRJQo/dhYIW9LtznuJD1ywFRN32NrD4oyGeTZRDM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AXc2XYaYXmU7+FOvUkgH8+CZXpHLiwZnRbX7V6uJKhnJpHdPfgznuV3l+ztT7ucQy
	 1bfoMKXCbjg2UkhEc+i6vg06M6u+m3pJwI1JKIpEoxvxYNI4sZHpO7+n773hV0D5Bi
	 AIQDZSjV/zC0sk6ft/NvyuVWvt7ENMr0LyosaIpQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D82A9F80536; Wed,  2 Oct 2024 05:52:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61820F805B0;
	Wed,  2 Oct 2024 05:52:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29A14F80517; Wed,  2 Oct 2024 05:52:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6961F8001E
	for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2024 05:52:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6961F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gDvJOAnw
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DB6EB5C5596;
	Wed,  2 Oct 2024 03:52:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0384C4CECE;
	Wed,  2 Oct 2024 03:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727841130;
	bh=JapzRJQo/dhYIW9LtznuJD1ywFRN32NrD4oyGeTZRDM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=gDvJOAnwo2Fj3T9/SgUzpkIr/jydVEH69C39dZyapfftpiH6AjltLlvD+eE74yZcN
	 rD1RlqjcqRKRuBPgoL45VAKYFP7Gp9WYaarrRWHbqhUSH8sLp4Xd3Fz2rBLgRz9bCm
	 LRKXsEYloqhgOj/wkDdpIlVXM4HgIOZLzkykRE/xRLsL3nd6HShe9/1AJkRhC0c5yG
	 wbUABdNCu+mDQedN8JF+SqY3t8jKOLIgzwnfcAwhG35pF0jJAuOHujSptsxdv4+iwi
	 5zrmu5+d6+CAEruX2k0Sc+GecpR5I9arX/LBU1idRJxUQh3aQSTcDzibCDNY7kGknl
	 Z4Ic8bZ4YFWvw==
Date: Tue, 01 Oct 2024 22:52:09 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: devicetree@vger.kernel.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski@linaro.org, linux-arm-msm@vger.kernel.org,
 lgirdwood@gmail.com, srinivas.kandagatla@linaro.org,
 konrad.dybcio@linaro.org, elder@linaro.org, dmitry.baryshkov@linaro.org,
 conor+dt@kernel.org, andersson@kernel.org, broonie@kernel.org,
 a39.skl@gmail.com, krzk+dt@kernel.org, bgoswami@quicinc.com,
 linux-sound@vger.kernel.org, perex@perex.cz, caleb.connolly@linaro.org
In-Reply-To: <20241002022015.867031-1-alexey.klimov@linaro.org>
References: <20241002022015.867031-1-alexey.klimov@linaro.org>
Message-Id: <172784025903.526797.17199774017741034406.robh@kernel.org>
Subject: Re: [PATCH v2 0/7] qrb4210-rb2: add HDMI audio playback support
Message-ID-Hash: LBB33OJKHINCXZ7PE2J3ZN4D4G2ZUUVV
X-Message-ID-Hash: LBB33OJKHINCXZ7PE2J3ZN4D4G2ZUUVV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LBB33OJKHINCXZ7PE2J3ZN4D4G2ZUUVV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 02 Oct 2024 03:20:08 +0100, Alexey Klimov wrote:
> Rebased on top of -master, tested.
> 
> Changes since v1:
> -- removed handling of MI2S clock in sm2450_snd_shutdown(): setting clock rate
>    and disabling it causes audio delay on playback start;
> -- removed empty sound { } node from sm6115.dtsi as suggested by Krzysztof;
> -- moved lpi_i2s2_active pins description to qrb423310 board-specific file
>    as suggested by Dmitry Baryshkov;
> -- moved q6asmdai DAIs to apr soc node as suggested by Konrad Dybcio;
> -- lpass_tlmm is not disabled;
> -- lpass_tlmm node moved to sm4250.dtsi;
> -- kept MultiMedia DAIs as is, without them the sound card driver doesn't initialise;
> -- added some reviewed-by tags.
> 
> This series still keeps "qcom,qrb4210-rb2-sndcard" for sm8250 soundcard. As per
> off the list discussion with Srini it was suggested to have it since in future it
> may be required to add clocks, workarounds, quirks, model-specific things based on
> this compatible. The same as for RB5 compatible in sm8250 snd driver.
> 
> This focuses on HDMI audio playback only hence there are no soundwire and dmic pins,
> for instance. The work to enable playback via wcd+wsa8815 amplifier is in progress (it works)
> and one of the routes is to merge such two patchsets together.
> 
> Link to prev series:
> https://lore.kernel.org/linux-sound/20240628010715.438471-1-alexey.klimov@linaro.org/
> 
> Alexey Klimov (7):
>   ASoC: dt-bindings: qcom,sm8250: add qrb4210-rb2-sndcard
>   ASoC: qcom: sm8250: add qrb4210-rb2-sndcard compatible string
>   ASoC: qcom: sm8250: add handling of secondary MI2S clock
>   arm64: dts: qcom: sm6115: add apr and its services
>   arm64: dts: qcom: sm4250: add LPASS LPI pin controller
>   arm64: dts: qcom: qrb4210-rb2: add description of lpi_i2s2 pins
>   arm64: dts: qcom: qrb4210-rb2: add HDMI audio playback support
> 
>  .../bindings/sound/qcom,sm8250.yaml           |  1 +
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts      | 91 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm4250.dtsi          | 16 ++++
>  arch/arm64/boot/dts/qcom/sm6115.dtsi          | 72 +++++++++++++++
>  sound/soc/qcom/sm8250.c                       |  9 ++
>  5 files changed, 189 insertions(+)
> 
> --
> 2.45.2
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y qcom/qrb4210-rb2.dtb' for 20241002022015.867031-1-alexey.klimov@linaro.org:

arch/arm64/boot/dts/qcom/qrb4210-rb2.dtb: pinctrl@a7c0000: lpi-i2s2-active-state: 'oneOf' conditional failed, one must be fixed:
	'pins' is a required property
	'function' is a required property
	Unevaluated properties are not allowed ('data-pins', 'ext-mclk1', 'sck-pin', 'ws-pins' were unexpected)
	'ext-mclk1', 'sck-pin' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm4250-lpass-lpi-pinctrl.yaml#





