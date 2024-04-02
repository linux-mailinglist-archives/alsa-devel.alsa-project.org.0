Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7BA895ABF
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 19:33:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE6992C53;
	Tue,  2 Apr 2024 19:33:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE6992C53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712079200;
	bh=aduyaipM5T0aY6bLSz+8o4Wc9lDD8Yn5NJTGROS+eYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s40OxrEyp3vxj8hQcKEMy4Ahm6LnCWjLjDYoVs44VqyYEwob9aXfqIXQllYgFwTct
	 BEnL3bjMBt+zKzVCI8OUeTsuMCJzmhhTO5Gtx31nDiXrBKwbidbanMqhps5fUtMHsQ
	 fjLLiWlN5IAmEXTASOXqsrEhv85nHj/gM0wNPmS8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07D11F805AC; Tue,  2 Apr 2024 19:32:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4180DF80580;
	Tue,  2 Apr 2024 19:32:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 672C6F8020D; Tue,  2 Apr 2024 19:32:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F50CF80114
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 19:32:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F50CF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ftwVH2lZ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D4FEFCE1D63;
	Tue,  2 Apr 2024 17:32:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBACCC433C7;
	Tue,  2 Apr 2024 17:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712079148;
	bh=aduyaipM5T0aY6bLSz+8o4Wc9lDD8Yn5NJTGROS+eYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ftwVH2lZZkE6NWKmyLWEpoXc+AXiKLggaHNTdHXUDYQWrKGMcU9xwWfM2Nze8kLn6
	 eyjHIhskwQLsC9VZvfX3Beinz/6YA6GhqyEdaeILQdD1CmpjKtbM+nAlkpKUSCzpm8
	 dHY6b8PTsjk/c+uBooXZQhvfMXmlj7G1VtDyc0a+o8FGZg//9+VXRYt2JZ3VhqVkPT
	 WhEjkxiez2pONugapBTfLLB5XlqsipzkURfytbnfQgnykuxpu6nb13v4Z67ZaVyiXM
	 rZ+zx9c9cOcQkEXR7xtsyiowmJ+WyTFcB/wnkjaGv5j00HKJhFoTsExDSZJIrjAYu8
	 q4Wh/+l93ZkZQ==
Date: Tue, 2 Apr 2024 12:32:25 -0500
From: Rob Herring <robh@kernel.org>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org, christophercordahi@nanometrics.ca,
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	herve.codina@bootlin.com, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 12/13] ASoC: dt-bindings: davinci-mcbsp: Add the
 'ti,T1-framing-{rx/tx}' flags
Message-ID: <171207914341.324604.378399290864675575.robh@kernel.org>
References: <20240402071213.11671-1-bastien.curutchet@bootlin.com>
 <20240402071213.11671-13-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402071213.11671-13-bastien.curutchet@bootlin.com>
Message-ID-Hash: V2KWAPANB2WMEOGEHO6XV2QT23ZRUJUM
X-Message-ID-Hash: V2KWAPANB2WMEOGEHO6XV2QT23ZRUJUM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V2KWAPANB2WMEOGEHO6XV2QT23ZRUJUM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 02 Apr 2024 09:12:12 +0200, Bastien Curutchet wrote:
> McBSP's data delay can be configured from 0 to 2 bit clock periods. 0 is
> used for DSP_B format, 1 for DSP_A format. A data delay of 2 bit clock
> periods can be used to interface to 'T1 framing' devices where data
> stream is preceded by a 'framing bit'. This 2 bit clock data delay is
> not described in the bindings.
> 
> Add two flags 'ti,T1-framing-[rx/tx]' to enable a data delay of 2
> bit clock periods in reception or transmission.
> 
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
> ---
>  .../devicetree/bindings/sound/davinci-mcbsp.yaml   | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

