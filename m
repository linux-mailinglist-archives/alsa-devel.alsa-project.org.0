Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 282287C5505
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Oct 2023 15:11:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 577B5155A;
	Wed, 11 Oct 2023 15:10:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 577B5155A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697029896;
	bh=sIFPlEfgw5Tgf4SaAgi4BkayV92E8UWXht7jOG8M/TY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q8Kkxn9aaef7BLltUdMqVb0PqOAiQDTf/vflgW996qYaAxkk60yY/2HcfQtXjGa5z
	 6ZdMZ3HtiTMjgNaAh9RF6Lj3gt6RDtD9xJrt7BBq7He5KsWT2iEKHac/D4yAipYw/n
	 dwoA1U3KF9+B6myzZm3VbzrqoyGxU05zSHSGRWJI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B33C5F802E8; Wed, 11 Oct 2023 15:10:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48893F8027B;
	Wed, 11 Oct 2023 15:10:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63344F802BE; Wed, 11 Oct 2023 15:10:39 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A549F80130
	for <alsa-devel@alsa-project.org>; Wed, 11 Oct 2023 15:10:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A549F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HDNMP1fz
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7095460C4B;
	Wed, 11 Oct 2023 13:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D715C433CC;
	Wed, 11 Oct 2023 13:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697029829;
	bh=sIFPlEfgw5Tgf4SaAgi4BkayV92E8UWXht7jOG8M/TY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HDNMP1fzW+mkOxIiBZGym3lqDR2cgtvoaMKjRJvkI8WQ4cCGsqw33axMJVGoFr+aY
	 OnWmpIUSZPBmCpKpdZ2RFRATbXEe+jGwoeX94J3NfGYImgePxT6Wf6qg3vBB3+mYTs
	 eOAR8kV6FlnZBrgJzC2xIwJ3Q1FV9x2z847w8FtfM53XQkH/8R0gprgJjsftiKU4o5
	 JYbG8quTIfH8eWOEoiJmar6Fa2Lq89UmVwk1WVex4hSbmx3IUZa2UrcVbyFWBWD4iu
	 h/NjWizQ/dEjy42TU5iX91+E/OYXMgqyat7DV5L2v5R92CH5f7LsrHhlHVoFuMaN/1
	 rMcJ2ck3FIZ+A==
Received: (nullmailer pid 4114505 invoked by uid 1000);
	Wed, 11 Oct 2023 13:10:26 -0000
Date: Wed, 11 Oct 2023 08:10:26 -0500
From: Rob Herring <robh@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: konrad.dybcio@linaro.org, agross@kernel.org, devicetree@vger.kernel.org,
 bgoswami@quicinc.com, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 lgirdwood@gmail.com, gregkh@linuxfoundation.org, andersson@kernel.org,
 conor+dt@kernel.org, linux-usb@vger.kernel.org, mathias.nyman@intel.com,
 perex@perex.cz, tiwai@suse.com, Thinh.Nguyen@synopsys.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, srinivas.kandagatla@linaro.org
Subject: Re: [PATCH v8 14/34] dt-bindings: usb: dwc3: Limit
 num-hc-interrupters definition
Message-ID: <20231011131026.GA4103742-robh@kernel.org>
References: <20231011002146.1821-1-quic_wcheng@quicinc.com>
 <20231011002146.1821-15-quic_wcheng@quicinc.com>
 <169699146356.2560906.8654324582682669209.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169699146356.2560906.8654324582682669209.robh@kernel.org>
Message-ID-Hash: AGWPYEN62XIOND3F4KXFVZEG3M2422CW
X-Message-ID-Hash: AGWPYEN62XIOND3F4KXFVZEG3M2422CW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AGWPYEN62XIOND3F4KXFVZEG3M2422CW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Oct 10, 2023 at 09:31:04PM -0500, Rob Herring wrote:
> 
> On Tue, 10 Oct 2023 17:21:26 -0700, Wesley Cheng wrote:
> > Ensure that the number of XHCI secondary interrupters defined for a DWC3
> > based implementation is limited to 8.  XHCI in general can potentially
> > support up to 1024 interrupters.
> > 
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> > ---
> >  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/snps,dwc3.yaml: num-hc-interrupters: missing type definition

Patch 15 should come first.

Rob
