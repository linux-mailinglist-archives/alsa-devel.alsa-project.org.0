Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8855E8D20A5
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2024 17:42:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A126882A;
	Tue, 28 May 2024 17:42:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A126882A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716910964;
	bh=+ka7lAt0AaEKQOhVhdJkYL8d3RJmgi15bjbIH1lkuVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B74CMW50+cQZRoGHYeqlQ8akDhpzn6vXShlJfc/pgyEi6vc2Liuqtp+72wXm6K/a1
	 ix7SiuyptDdPXLFzVX3ZUyXut3x8PK9uPFwm7kmaat5BeJAW7Enw+YZJ9uZbfpJ2TH
	 2aaCVq5toLpRIFHsX7NTFWR9tvbORpu6YVCPweWQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02FA8F8047C; Tue, 28 May 2024 17:42:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DEB8F8003A;
	Tue, 28 May 2024 17:42:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3B4FF804E5; Tue, 28 May 2024 17:40:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22147F80580
	for <alsa-devel@alsa-project.org>; Tue, 28 May 2024 17:40:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22147F80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mQ7ugF7o
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3775CCE1140;
	Tue, 28 May 2024 15:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4197BC3277B;
	Tue, 28 May 2024 15:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716910835;
	bh=+ka7lAt0AaEKQOhVhdJkYL8d3RJmgi15bjbIH1lkuVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mQ7ugF7oci9zQMotueSFnxOlJdgSRiTo1pl+/I7Io2p/oLGt1ADaaVRU77uZxsPuH
	 rtTv+4iuxxOMr2QFWMz+5rPxQein+0RRcvFeJ6GQHxOdY8q69i0M51lcTVSE4BLsCQ
	 pXnxFVWjEU25VKXaxQSE4toPW/4jrKA/047xXTq9WfVvCi/aey5IGZiQCss5yDqNBt
	 jFH0Tt5U6Vmv/8bVtmcnFHzJApiGDaxCtxLX69rkaD775rLU458uIMahHRCr4meZ9S
	 zgLhUSYIy19b6eoSnA2k82xb2gcQd6LfbrY8S9iyDkpeIFSKLGvw+KRr1QSkTpUu5U
	 P7TIJXaOYZuBw==
Date: Tue, 28 May 2024 10:40:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
	krzysztof.kozlowski+dt@linaro.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh+dt@kernel.org,
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com,
	shengjiu.wang@gmail.com, lgirdwood@gmail.com, tiwai@suse.com,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	linuxppc-dev@lists.ozlabs.org, perex@perex.cz
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: fsl,mqs: Add i.MX95 platform
 support
Message-ID: <171691083154.676898.17539558632778396948.robh@kernel.org>
References: <1716347305-18457-1-git-send-email-shengjiu.wang@nxp.com>
 <1716347305-18457-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1716347305-18457-2-git-send-email-shengjiu.wang@nxp.com>
Message-ID-Hash: 6XGPILDGFOAZXFBRDVGHJHSLNLHLGHKU
X-Message-ID-Hash: 6XGPILDGFOAZXFBRDVGHJHSLNLHLGHKU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6XGPILDGFOAZXFBRDVGHJHSLNLHLGHKU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 22 May 2024 11:08:24 +0800, Shengjiu Wang wrote:
> There are two MQS instances on the i.MX95 platform.
> The definition of bit positions in the control register are
> different. In order to support these MQS modules, define
> two compatible strings to distinguish them.
> 
> As one instance is in the always-on domain, another is in the
> net controller domain, so the compatible strings are
> "fsl,imx95-aonmix-mqs", "fsl,imx95-netcmix-mqs".
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,mqs.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

