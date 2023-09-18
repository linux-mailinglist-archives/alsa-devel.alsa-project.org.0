Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 182157A53D5
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 22:20:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76F7C822;
	Mon, 18 Sep 2023 22:19:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76F7C822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695068429;
	bh=X7kwZ3TaTSXZSuCjOV84yfHdO+bVy+oMxS+rAHOQWPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I48aD9mZjlIPxWKh0f56e7c+LXRCHpavFgBYI4LQ4mMntoMUA4ClW3H/bsCDsiK6+
	 nGjuTKwZDvvQ2BsQDOv+WrT616SFH/2FCbZkAYD8ibgEbnvvG16jo9CoZntZkfBVFT
	 8iXqMG9fQLrBK7sfIAaTU+cSMh8/uvfSqCtt6goI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4E4EF80494; Mon, 18 Sep 2023 22:19:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B18BF801F5;
	Mon, 18 Sep 2023 22:19:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D908F8025A; Mon, 18 Sep 2023 22:19:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C83B9F80125
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 22:19:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C83B9F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=h3YG6lWk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A211061331;
	Mon, 18 Sep 2023 20:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADCDDC433C7;
	Mon, 18 Sep 2023 20:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695068362;
	bh=X7kwZ3TaTSXZSuCjOV84yfHdO+bVy+oMxS+rAHOQWPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h3YG6lWk02r1tfJbfvF5Z9urTiFDS9eZQvPym6Mv0l/Ii3s6kCa7Y87K7cMFeUnzc
	 vSar99B0Wteuy3VgaYTiHg2ZxMvdp5x71saEnITgAltvUkRFpmIG3+SKiJM6mS5IRc
	 U5HLyZj98Ue6hxqECFBJM8XSUeTlmk5l2yt/eYN9pEIvvrA0uSs4j+c5Czpjn7HhRn
	 CVz+AKzUucioqiS5VFzbzaQ+QETkTofdfqnXMvYl5+ZAdncivHrtV/BLqFmOvT17Ry
	 +TVTtS/qo+avh4W1uFpO8SfSPWWLIA0AJ0kNjfMcGj4LEFFn4FupPF33H9wzFHg0PE
	 CELsXmGQ+l5Ew==
Received: (nullmailer pid 1711180 invoked by uid 1000);
	Mon, 18 Sep 2023 20:19:19 -0000
Date: Mon, 18 Sep 2023 15:19:19 -0500
From: Rob Herring <robh@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, agross@kernel.org, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 Thinh.Nguyen@synopsys.com, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 13/33] dt-bindings: usb: dwc3: Add
 snps,num-hc-interrupters definition
Message-ID: <20230918201919.GA1694628-robh@kernel.org>
References: <20230916001026.315-1-quic_wcheng@quicinc.com>
 <20230916001026.315-14-quic_wcheng@quicinc.com>
 <6e66d821-1275-4830-a898-bb82c333dcc5@linaro.org>
 <ef3731af-5b58-3dcb-9a6f-7e8755a13895@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef3731af-5b58-3dcb-9a6f-7e8755a13895@quicinc.com>
Message-ID-Hash: 5US2R67K7XVIKBPPD64ITTPL6BWE6ZO7
X-Message-ID-Hash: 5US2R67K7XVIKBPPD64ITTPL6BWE6ZO7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5US2R67K7XVIKBPPD64ITTPL6BWE6ZO7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Sep 15, 2023 at 05:43:45PM -0700, Wesley Cheng wrote:
> Hi Konrad,
> 
> On 9/15/2023 5:35 PM, Konrad Dybcio wrote:
> > On 16.09.2023 02:10, Wesley Cheng wrote:
> > > Add a new definition for specifying how many XHCI secondary interrupters
> > > can be allocated.  XHCI in general can potentially support up to 1024
> > > interrupters, which some uses may want to limit depending on how many
> > > users utilize the interrupters.
> > > 
> > > Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> > > ---
> > Any reason for a DWC3-specific property? Why not just
> > use the XHCI-common one from patch 14 and error out if
> > a value of more than 8 is found?
> > 

I'm pretty sure I said use the common one already...

> 
> Not every XHCI plat user is going to be DWC3.  In case DWC3 is used, the
> DWC3 host driver is the one that populates and adds the XHCI plat device (no
> separate device node for XHCI), so that requires the DWC3 host to also
> populate properties for the XHCI device. (dwc3_host_init())

This binding references usb-xhci.yaml already, so any property from 
there is allowed. Linux needs to handle that regardless of what the 
driver structure/division looks like.

Rob
