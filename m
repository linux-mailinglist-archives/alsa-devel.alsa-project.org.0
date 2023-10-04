Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 315937B8364
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 17:17:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78333852;
	Wed,  4 Oct 2023 17:16:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78333852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696432638;
	bh=L/ODagKJ/NY47+xzHBVECHLFfXTxbn2/4aQ/BUUEz/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mG3NgHTaDyvHiVbgJtkIy5O71rwvFezWrbhZz96481Ix6qboUq7x8xP80pJYYOGOo
	 NNYV6SC6YTBCdjduQ/hxGDDtk8EzA1+JjXlXUDgo26M35U7eOdqZ2FkngNR2Bd3Llp
	 C+e1qKHdil6HrYT678jncsl2y9lzhkVsxw/KDMg0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1230F80557; Wed,  4 Oct 2023 17:16:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B28AAF80310;
	Wed,  4 Oct 2023 17:16:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCA8FF8047D; Wed,  4 Oct 2023 17:16:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE8ABF80130
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 17:16:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE8ABF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=krKfLqeU
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B7EADCE1AEB;
	Wed,  4 Oct 2023 15:16:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18AD9C433C7;
	Wed,  4 Oct 2023 15:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696432570;
	bh=L/ODagKJ/NY47+xzHBVECHLFfXTxbn2/4aQ/BUUEz/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=krKfLqeUcbKD3pl/drHH1PxkvaQdS98ejwVmE8aMVUqmKYOBv0nKH+R0y4HHr64Hv
	 ijTmXW+jAu85AKMT7cJaVZF0R5HhtAeckFJuCdjV8qrRcK0vQlINqHG58lHZKfp1es
	 E1WOoqWccMICJVLwGDst/8SU/brpO79L9nndRBlnDrP9153SFCixswNbzMwWqicEYC
	 KKzmpQpqX2UEqE+ooo1MkJqEWC5ZdrGXGoh03cV9OqBJ/tonfhIihW36eSq0Mcv6YW
	 vJ+y0Y3GSBbpwzSP0DMypbG7618UhVaQossNTWnhZW8uQvjrrlgZPsly+dq1+Kr6Ra
	 FA2/NvECDkNYA==
Received: (nullmailer pid 3149821 invoked by uid 1000);
	Wed, 04 Oct 2023 15:16:08 -0000
Date: Wed, 4 Oct 2023 10:16:08 -0500
From: Rob Herring <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: Fabio Estevam <festevam@denx.de>, aford173@gmail.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org, shengjiu.wang@nxp.com,
 alsa-devel@alsa-project.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, broonie@kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: fsl,micfil: Document #sound-dai-cells
Message-ID: <169643256679.3149751.2610225492494450140.robh@kernel.org>
References: <20231004122935.2250889-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004122935.2250889-1-festevam@gmail.com>
Message-ID-Hash: W2IMLSBPIMYIFDEYLGUAYUQQQQRYFFYD
X-Message-ID-Hash: W2IMLSBPIMYIFDEYLGUAYUQQQQRYFFYD
X-MailFrom: SRS0=zsuR=FS=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W2IMLSBPIMYIFDEYLGUAYUQQQQRYFFYD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 04 Oct 2023 09:29:35 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> imx8mp.dtsi passes #sound-dai-cells = <0> in the micfil node.
> 
> Document #sound-dai-cells to fix the following schema warning:
> 
> audio-controller@30ca0000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
> from schema $id: http://devicetree.org/schemas/sound/fsl,micfil.yaml#
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  Documentation/devicetree/bindings/sound/fsl,micfil.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

