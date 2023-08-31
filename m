Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4DE78F1F5
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 19:31:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08DC4A4E;
	Thu, 31 Aug 2023 19:30:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08DC4A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693503083;
	bh=057dXhBltFNY+YXutamWEKDOENY+dS9838PYVA3CeIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GScuNVzl7Nd7Ijxqt2wJTTLXhNxndSEm7GEcGHJTzWzwBGuyJCsOxrbbWYckmComO
	 tMk17xCwMReL2VqiEeOZ9gdLyi8+zCOLGniPJl9r7PUbtMAwFeJ/S374c8cCgkb2Cn
	 Wy41MWVlErpUcGlFFGUDrCaqZlsjxtuwX4yCj+9U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE655F804F3; Thu, 31 Aug 2023 19:30:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27574F804F3;
	Thu, 31 Aug 2023 19:30:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48D72F80527; Thu, 31 Aug 2023 19:30:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4832FF800F5
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 19:29:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4832FF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YAg2oRB2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 18D4FCE2166;
	Thu, 31 Aug 2023 17:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD63C433C7;
	Thu, 31 Aug 2023 17:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693502994;
	bh=057dXhBltFNY+YXutamWEKDOENY+dS9838PYVA3CeIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YAg2oRB2Hz4CCaDGqT+FpM5RsRuIyfObS5GYwv4qsjQsEN+HmzbDaTxJnvFpStRRd
	 b00tiO7VLBSRyilW0ijkSUxyBAa2sxb+FML2eTBhG35GFsAA7qf1hQtb5f+8vVKixa
	 yPAriWirIlFos9iq7I9p40aG0ObfpRrBETt185Z4c7+nye4Pl0kmDrhh4cl/A3sHh/
	 uIFwdmugmKkajgnRbu5f8yhjugaVMRr/Dg4NVmbzdayh5+tdFBYE/vs+XrMoncl889
	 BE5JBZn6DL45yNp3NIxH2AkFPcQseeitRtr7OnBCFYW3vK3UyAMTlZlPQsHU/n6nfz
	 2nYRKMW8Jas6Q==
Received: (nullmailer pid 2472823 invoked by uid 1000);
	Thu, 31 Aug 2023 17:29:51 -0000
Date: Thu, 31 Aug 2023 12:29:51 -0500
From: Rob Herring <robh@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: alsa-devel@alsa-project.org, andersson@kernel.org, quic_plai@quicinc.com,
 linux-arm-msm@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, perex@perex.cz, bgoswami@quicinc.com,
 devicetree@vger.kernel.org, tiwai@suse.com, linux-kernel@vger.kernel.org,
 agross@kernel.org, lgirdwood@gmail.com, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, linux-usb@vger.kernel.org, broonie@kernel.org,
 gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, quic_jackp@quicinc.com
Subject: Re: [PATCH v5 24/32] ASoC: dt-bindings: Update example for enabling
 USB offload on SM8250
Message-ID: <169350299098.2472764.11068604113616998755.robh@kernel.org>
References: <20230829210657.9904-1-quic_wcheng@quicinc.com>
 <20230829210657.9904-25-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829210657.9904-25-quic_wcheng@quicinc.com>
Message-ID-Hash: ZNGWXEWHZYYS4UFPMXKJX2J6OKUUZJSP
X-Message-ID-Hash: ZNGWXEWHZYYS4UFPMXKJX2J6OKUUZJSP
X-MailFrom: SRS0=wTfe=EQ=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZNGWXEWHZYYS4UFPMXKJX2J6OKUUZJSP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 29 Aug 2023 14:06:49 -0700, Wesley Cheng wrote:
> Add an example on enabling of USB offload for the Q6DSP.  The routing can
> be done by the mixer, which can pass the multimedia stream to the USB
> backend.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  .../devicetree/bindings/sound/qcom,sm8250.yaml    | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

