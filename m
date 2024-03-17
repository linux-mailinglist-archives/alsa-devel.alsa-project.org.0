Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5986887DFEC
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 21:07:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FA5B2391;
	Sun, 17 Mar 2024 21:07:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FA5B2391
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710706037;
	bh=sFEHSjac8D3PtwCoVIQIp9ed7NUBbJyBtQx8DW7CYHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mkIv5cGb7ZA+RMSkalRXQdCd2Y/blwYsJRwyqupx5MlqksEF3PWk2yyZaQd4ExQoO
	 K+PNrI7sLUXper3pajqmDVa/l4rnaMbCNN8szwHgt3HCNAeZKujp0yBaveMaP9WHWx
	 cAKL4rdtfRTY0NwMILx7nPYnWMCWZJrOLBOPvICM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED409F80588; Sun, 17 Mar 2024 21:06:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94743F8058C;
	Sun, 17 Mar 2024 21:06:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6064F804E7; Sun, 17 Mar 2024 21:06:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C1B4F8025F
	for <alsa-devel@alsa-project.org>; Sun, 17 Mar 2024 21:06:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C1B4F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GmO55PF+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 77E24CE08D2;
	Sun, 17 Mar 2024 20:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 088AFC433C7;
	Sun, 17 Mar 2024 20:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710705989;
	bh=sFEHSjac8D3PtwCoVIQIp9ed7NUBbJyBtQx8DW7CYHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GmO55PF+27CYXtYz0jkopdHUjYs9RksuwoQcqWTdNPRY3OcaqcLkh+pZ+RLVhlpNo
	 jq9am4kudwG9uDvzQjVIlw9RzjLf5HfUAanHe2GwNrFqeKhqbWzVeUzqYbkK1/lta3
	 qBKGqLzx0+h9H+t9hia/j06U/pkAyIHeTvlIfyV83BDI//q84HTPGoI6zuVet1WZ1R
	 ZIKwq/YFAZzMR7wXQBxVn9katyHo9ZCgB3Ys25cj/+yw6GbeiyKYZVoPdy//t0NeKv
	 wVNOjAclCDO603/b/uv3iezx1Ui/mBcALUlTmiUIqnnMItIQfex2kjTE4RRjipQYB+
	 lY+fLrhLuRUIQ==
Date: Sun, 17 Mar 2024 14:06:25 -0600
From: Rob Herring <robh@kernel.org>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: linux-kernel@vger.kernel.org, christophercordahi@nanometrics.ca,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, herve.codina@bootlin.com,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 02/13] ASoC: dt-bindings: davinci-mcbsp: Add new
 properties
Message-ID: <171070598512.2141016.568175668659767924.robh@kernel.org>
References: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
 <20240315112745.63230-3-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240315112745.63230-3-bastien.curutchet@bootlin.com>
Message-ID-Hash: 7RT5VS7IDNU6A3LZA2D7DBYN3ZDXL5JT
X-Message-ID-Hash: 7RT5VS7IDNU6A3LZA2D7DBYN3ZDXL5JT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7RT5VS7IDNU6A3LZA2D7DBYN3ZDXL5JT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 15 Mar 2024 12:27:34 +0100, Bastien Curutchet wrote:
> Following features are not described in the bindings:
>  - The McBSP uses an internal sample rate generator to provide bit clock
>    or frame clock. This sample rate generator can be programmed to be
>    driven by McBSP's internal clock source or by an external clock source
>    (located on CLKS pin).
>  - McBSP can be configured in 'free-running' mode so that its serial
>    clocks will continue to run during emulation halt.
>  - McBSP can generate a SYNCERR when unexpected frame pulses are detected
> 
> Add an optional clock item that allows to select an external clock as
> sample rate generator's input.
> 
> Add a 'ti,disable-free-run' flag to disable the free-running mode. This
> mode is selected by default by the driver that's why I add a disabling
> flag instead of an enabling one.
> 
> Add a 'ti,enable-sync-err' flag to enable SYNCERR generation when
> unexpected frame pulses are detected.
> 
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
> ---
>  .../devicetree/bindings/sound/davinci-mcbsp.yaml | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

