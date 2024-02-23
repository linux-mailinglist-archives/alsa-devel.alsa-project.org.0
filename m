Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9F8860A8D
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 07:01:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FF10822;
	Fri, 23 Feb 2024 07:01:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FF10822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708668074;
	bh=h5EJyRMeUWX5mNv+NDV4aIHRv+177JouUHgeFau9w3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u/XfcflgX+LsWC+z4JqizjFYNexPYFGG2+lweSrQ3j6PkFISVUXyhTUqeHkzs8n/j
	 X6l+lPWDpOIsSnnIfuT1c8csRu+rCLULTNkHnJLjgH1xfnu9qrr4W0K5buy2efgoCF
	 V2t2+Gs8wOuUWMLMu3Cxdknvbyk5ub5+czMjj8Dc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B50CDF805AB; Fri, 23 Feb 2024 07:00:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05D64F80567;
	Fri, 23 Feb 2024 07:00:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F2E1F80496; Fri, 23 Feb 2024 06:59:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CE1EF800EE
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 06:59:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CE1EF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=t6aquaMW
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3C9AECE2288;
	Fri, 23 Feb 2024 05:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED977C433F1;
	Fri, 23 Feb 2024 05:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708667973;
	bh=h5EJyRMeUWX5mNv+NDV4aIHRv+177JouUHgeFau9w3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t6aquaMWSOOorVD+X5138C/MRM431DQsyY7U1T8Sq+csvmeRtnCPI6sMr6+XngMbt
	 6EoWlSUj5sdjQrwR7hoCTzW/6XIM62cctelx2kZj2Aq683RmQ+1O/EJ/EvqSHfB54H
	 vHNofa6C+M0kTt2grGGVofENipz8x0r2zscgy8JE=
Date: Fri, 23 Feb 2024 06:59:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	srinivas.kandagatla@linaro.org, mathias.nyman@intel.com,
	perex@perex.cz, conor+dt@kernel.org, corbet@lwn.net,
	lgirdwood@gmail.com, andersson@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, Thinh.Nguyen@synopsys.com,
	bgoswami@quicinc.com, tiwai@suse.com, robh+dt@kernel.org,
	konrad.dybcio@linaro.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v17 36/51] ASoC: dt-bindings: Update example for enabling
 USB offload on SM8250
Message-ID: <2024022300-routing-baffling-7ce0@gregkh>
References: <20240217001017.29969-1-quic_wcheng@quicinc.com>
 <20240217001017.29969-37-quic_wcheng@quicinc.com>
 <7dc9e80e-0875-4dfc-adf9-9bfad2fb8589@linaro.org>
 <bdc57138-e67e-47ae-8cf1-b8be5aeb2369@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdc57138-e67e-47ae-8cf1-b8be5aeb2369@sirena.org.uk>
Message-ID-Hash: GB72IWXRFGSY26HSNSCZFGCXI6QN5SIF
X-Message-ID-Hash: GB72IWXRFGSY26HSNSCZFGCXI6QN5SIF
X-MailFrom: gregkh@linuxfoundation.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GB72IWXRFGSY26HSNSCZFGCXI6QN5SIF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Feb 22, 2024 at 04:50:08PM +0000, Mark Brown wrote:
> On Thu, Feb 22, 2024 at 05:24:58PM +0100, Krzysztof Kozlowski wrote:
> > On 17/02/2024 01:10, Wesley Cheng wrote:
> > > Add an example on enabling of USB offload for the Q6DSP.  The routing can
> > > be done by the mixer, which can pass the multimedia stream to the USB
> > > backend.
> > > 
> > > Acked-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> > > ---
> > >  .../devicetree/bindings/sound/qcom,sm8250.yaml    | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> 
> > This broke next.
> 
> > Wesley, are you sure you explained dependencies in this patch? Why is
> > next failing on this now?
> 
> It's surprising to see this merged at all while the series is still in
> review?

I took the first 10 and then these dt patches as I thought those were
safe to take also given the review.  If I should revert them, I'll
gladly do so.

thanks,

greg k-h
