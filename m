Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B9C7ADB86
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Sep 2023 17:33:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0A3BAE9;
	Mon, 25 Sep 2023 17:33:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0A3BAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695656034;
	bh=9kY8d7fPm3V2FOg2yCYMYdIUQkKXq5qEPj5+mr6AxjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mokhaXiCd99J3dijCuSGgVl3djAPV3bm8tFUehV44mYLxUIRYRggWxFqtjRWGC4qL
	 TofW/Hk9n48tmz5cbV4sM4g7v64LkIbuX7AvJzKWmFPULKkqDX9j19OMQHges4wu4h
	 alDeXxVPcdDpiD95gLXRaqrrt9SKYzeCqV4rWQl0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B5B2F800AA; Mon, 25 Sep 2023 17:33:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D11F0F80166;
	Mon, 25 Sep 2023 17:33:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29C33F8016A; Mon, 25 Sep 2023 17:32:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF791F8001D
	for <alsa-devel@alsa-project.org>; Mon, 25 Sep 2023 17:32:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF791F8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uzh3ktmg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D4696CE10B7;
	Mon, 25 Sep 2023 15:32:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43080C433C7;
	Mon, 25 Sep 2023 15:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695655968;
	bh=9kY8d7fPm3V2FOg2yCYMYdIUQkKXq5qEPj5+mr6AxjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uzh3ktmgllWZnurSKje1C5WUioprloyGKlOqEw++66au/67Cim0L4bRmI4nWb2Vbh
	 EFrUVleWajSCkB2nDQy1VInmsTZDBXBiKRHuvb4lqKs9PEXMBx6jXaup+iqdgVKjyK
	 cMkMahfEzV2FmKGg8uAFMFM9ZirJIK6e9U7XaZ5kIuQY9UWYmeeCrXRbf+9BrhY+wt
	 NCVCrsqsdXvTMrSbavWzvYU0eypoBLOapO0OI94LrJ0WROpvKFQ/JauhhHJkAeWaGA
	 b/UOlojkMyOAhakNQE/AqzLI7eIwrpYMXMQM+raLmIujPWleo72qEMTbmZiOD2rbGd
	 YO73uWW9MjEjw==
Received: (nullmailer pid 1409816 invoked by uid 1000);
	Mon, 25 Sep 2023 15:32:45 -0000
Date: Mon, 25 Sep 2023 10:32:45 -0500
From: Rob Herring <robh@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: alsa-devel@alsa-project.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, bgoswami@quicinc.com, perex@perex.cz,
 gregkh@linuxfoundation.org, agross@kernel.org, andersson@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, tiwai@suse.com,
 conor+dt@kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Thinh.Nguyen@synopsys.com, robh+dt@kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, mathias.nyman@intel.com,
 konrad.dybcio@linaro.org
Subject: Re: [PATCH v7 13/33] dt-bindings: usb: dwc3: Limit
 num-hc-interrupters definition
Message-ID: <169565596417.1409760.904452104136965315.robh@kernel.org>
References: <20230921214843.18450-1-quic_wcheng@quicinc.com>
 <20230921214843.18450-14-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921214843.18450-14-quic_wcheng@quicinc.com>
Message-ID-Hash: DAN37DVDR2TT6VLB62Q7V3PSWWJQOXNL
X-Message-ID-Hash: DAN37DVDR2TT6VLB62Q7V3PSWWJQOXNL
X-MailFrom: SRS0=JOOG=FJ=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DAN37DVDR2TT6VLB62Q7V3PSWWJQOXNL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Thu, 21 Sep 2023 14:48:23 -0700, Wesley Cheng wrote:
> Ensure that the number of XHCI secondary interrupters defined for a DWC3
> based implementation is limited to 8.  XHCI in general can potentially
> support up to 1024 interrupters.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

