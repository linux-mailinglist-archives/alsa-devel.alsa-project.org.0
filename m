Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1855787DFF2
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 21:11:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6DC32408;
	Sun, 17 Mar 2024 21:11:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6DC32408
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710706273;
	bh=m0qaEC2rBea95oHX1LSUKuzhZbY693N8ozdemzKvcfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dfOHQmxwVF9FtDDaH/0u/DpY1YhMIz9bgGs83GNUiotKV12XJAy3ZfczGI+lhw8cp
	 kCh5iV7R9CE6FD46OLllP4TTLO/r90c6zVJXSOC6+mhT8vIVMZ3e31IkejVxZb3xVM
	 JS+cgvPyh5YgYr/ER9eBFfZJe+dviS6tgSA2f8WU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2AF0F8057A; Sun, 17 Mar 2024 21:10:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3362AF80587;
	Sun, 17 Mar 2024 21:10:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE0A2F804E7; Sun, 17 Mar 2024 21:10:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C0D5F8025F
	for <alsa-devel@alsa-project.org>; Sun, 17 Mar 2024 21:10:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C0D5F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PJuKQxQ5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3033160BA1;
	Sun, 17 Mar 2024 20:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D30C433C7;
	Sun, 17 Mar 2024 20:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710706230;
	bh=m0qaEC2rBea95oHX1LSUKuzhZbY693N8ozdemzKvcfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PJuKQxQ5HZ3emFjVOQPKMNrHwcgYFfTz/i6fuJAowij7C8t0S89MKrmXb7xbqlfOk
	 sKXlLKOE2cdhaEXLfnUwHL7pDPdVAvcakFZmXi+aZ9s5UjyGS1C6hBDH4OkLqJsPQl
	 aqQnfkzXhJoPH5AjWdicJUfQXzFdVBS2uj6HlvfFLRLjKJRTEj5TyY5rYzQRk1cUlG
	 keqOyTmchEDnZBzdhUHqyfgJFbmtsKvbsyXsnU1l0NdcImwQZ7d0FGij04rt0aGWJ9
	 Zmg/pJ/Yp4e87znvzb/txLPuf3KsUIedXw0KieQP/7z009jRf1cLsGtUbwb2hsb1tc
	 XR3fXDcPUsenw==
Date: Sun, 17 Mar 2024 14:10:26 -0600
From: Rob Herring <robh@kernel.org>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
	herve.codina@bootlin.com,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Jaroslav Kysela <perex@perex.cz>, christophercordahi@nanometrics.ca,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	alsa-devel@alsa-project.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 12/13] ASoC: dt-bindings: davinic-mcbsp: Add the
 'ti,drive-dx' property
Message-ID: <171070619705.2172467.4945077110707168777.robh@kernel.org>
References: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
 <20240315112745.63230-13-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240315112745.63230-13-bastien.curutchet@bootlin.com>
Message-ID-Hash: YDYWDPQCPXS2FNWW22X6ME3NAUME57WK
X-Message-ID-Hash: YDYWDPQCPXS2FNWW22X6ME3NAUME57WK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YDYWDPQCPXS2FNWW22X6ME3NAUME57WK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 15 Mar 2024 12:27:44 +0100, Bastien Curutchet wrote:
> McBSP is able to handle capture and playback stream.
> The McBSP's DX pins that outputs serial data during playback streams can
> be used to output a chosen pattern during capture streams. For instance,
> this can be useful to drive an active-low signal during capture streams
> (by choosing <0> as pattern)
> 
> Add a 'ti,drive-dx' property that can be used to repeatedly output a
> chosen pattern on DX pin while capture stream is ON.
> 
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
> ---
>  Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

