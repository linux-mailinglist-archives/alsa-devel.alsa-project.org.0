Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB697A53DA
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 22:21:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C60D39F6;
	Mon, 18 Sep 2023 22:20:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C60D39F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695068480;
	bh=lgKTJttU3vBHsXfAuVjsF6p8uoUUCVqIrWPXUqL2PhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b8tLe/bqBQbTP0HDyp6Hl6vdyXIHBVyqBtb1OzJ3Q1HGSPQB4i/3yiO3T8LdfsAYE
	 TxuaO1VUHQxmG0pKBRZEGIZxSuxNc+c4QwB2+lh9YqHORAqLYu1m3CfSA9/jLL81qj
	 wv1M9REofw2SufOT8r8+yA82cXppwG439L6IGz5g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B000F80568; Mon, 18 Sep 2023 22:20:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CEF98F8055B;
	Mon, 18 Sep 2023 22:20:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAC47F8055C; Mon, 18 Sep 2023 22:19:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49693F8025A
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 22:19:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49693F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VhsXJc+f
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4F0F3611E6;
	Mon, 18 Sep 2023 20:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48365C433C8;
	Mon, 18 Sep 2023 20:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695068392;
	bh=lgKTJttU3vBHsXfAuVjsF6p8uoUUCVqIrWPXUqL2PhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VhsXJc+fdL3QjF0Vl3Md17K5xmCYwSXa2Po1SZHG8jjc75demx/YE3T/oRG6EPoJB
	 64XofwD39/KUKOcPtd/FD9BhlT4bVBR3d0FMG4gLlCkYjf5JNC71skeNTFkPZcLJ/3
	 NrGLk1Z1DvgbA3Ag64A0Oz4BfYOiaGK+zNTaD5Fz6CnJghwz58XGOkNoHLuNgdMtSc
	 mL7ddF8yggeeBHtEFhKfYaDdVmK4BjOyP4eyfDOSiixoqtgVr7HYKTbHt9i6ca54Y0
	 P56iYbUVDkWoWJ8mZvTai+dUfPgeB+mqdlPXjndxI2yqGPse/7l+WnpWdO2Xjru8rb
	 8alOB8nAFiMpA==
Received: (nullmailer pid 1711800 invoked by uid 1000);
	Mon, 18 Sep 2023 20:19:49 -0000
Date: Mon, 18 Sep 2023 15:19:49 -0500
From: Rob Herring <robh@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: andersson@kernel.org, srinivas.kandagatla@linaro.org, tiwai@suse.com,
 Thinh.Nguyen@synopsys.com, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, lgirdwood@gmail.com, mathias.nyman@intel.com,
 robh+dt@kernel.org, gregkh@linuxfoundation.org,
 krzysztof.kozlowski+dt@linaro.org, perex@perex.cz,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 konrad.dybcio@linaro.org, broonie@kernel.org, agross@kernel.org,
 conor+dt@kernel.org, bgoswami@quicinc.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 14/33] dt-bindings: usb: xhci: Add num-hc-interrupters
 definition
Message-ID: <169506838863.1711748.10580032008247397299.robh@kernel.org>
References: <20230916001026.315-1-quic_wcheng@quicinc.com>
 <20230916001026.315-15-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230916001026.315-15-quic_wcheng@quicinc.com>
Message-ID-Hash: PDKUBAXEXLD5FFJMFDACZEBO2UWWAYJN
X-Message-ID-Hash: PDKUBAXEXLD5FFJMFDACZEBO2UWWAYJN
X-MailFrom: SRS0=HCSS=FC=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PDKUBAXEXLD5FFJMFDACZEBO2UWWAYJN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 15 Sep 2023 17:10:07 -0700, Wesley Cheng wrote:
> Add the definition for how many interrupts the XHCI host controller should
> allocate.  XHCI can potentially support up to 1024 interrupters, which
> implementations may want to limit.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

