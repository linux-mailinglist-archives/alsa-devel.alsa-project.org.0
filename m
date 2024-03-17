Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCF287DF98
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 20:17:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9A9123D6;
	Sun, 17 Mar 2024 20:17:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9A9123D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710703046;
	bh=7wgxPIyPTJm1sbVQLW+1u/0UytpBtpCuchrtZamPsh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sBf+th++0sYth0rr2dPfYuW2tYgBLHBFNr19VFHweercwegE6sBNFON35KsIvf7Cp
	 DyFW9YIBctLv4nWtehpc2cPXEgRyYwPqB6/PIiDnFOFrA3iMJr8LFkfA0qHbqiqBUU
	 UPxUgBl2Jt+dMwyz36FR3Z3N9Bl/70YQKc3nZ6p8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDC2FF805A9; Sun, 17 Mar 2024 20:16:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 672B4F80579;
	Sun, 17 Mar 2024 20:16:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A38D7F804E7; Sun, 17 Mar 2024 20:16:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD54BF80093
	for <alsa-devel@alsa-project.org>; Sun, 17 Mar 2024 20:16:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD54BF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hCdDUd6X
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EFCD6CE013C;
	Sun, 17 Mar 2024 19:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28F0C433F1;
	Sun, 17 Mar 2024 19:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710703004;
	bh=7wgxPIyPTJm1sbVQLW+1u/0UytpBtpCuchrtZamPsh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hCdDUd6XU5vR4dSofVsop9l+p6Dl2b5mAPLEOUE7ukSv4/Y8P/BVftbMzhxOhf7LX
	 6qIkoK14BS+DxglAcIaMLD847oylzu+ss8P1wMeR/0aB68MBkwaI1zpEB8YN9tH7PQ
	 QjraJ7ZUXmNmE+XSFJhRwr6aTD30kEkxM1sG5KmeFXBGS2LEx97GbmteJwoqE7/B0P
	 JAwqVb6hONCDlvIZNVGYH9BQrBaXwAlMHQquP5Qx3kFTSDbqsr1CdAUWQD9bzjPQc4
	 XoaWBS7iu1PMSMw2U0CPddNlsPWDjJ3WoCrPWmG6teSrG8+yqviCF6Lr23hiOoYxvG
	 eXsdYplLneFhg==
Date: Sun, 17 Mar 2024 13:16:41 -0600
From: Rob Herring <robh@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Takashi Iwai <tiwai@suse.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	linux-amlogic@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>, linux-sound@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kevin Hilman <khilman@baylibre.com>, alsa-devel@alsa-project.org,
	kernel@salutedevices.com, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 20/25] ASoC: dt-bindings: meson: axg-tdm-formatters:
 claim support of A1 SoC family
Message-ID: <171070300107.2091785.7788958335533419953.robh@kernel.org>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-21-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240314232201.2102178-21-jan.dakinevich@salutedevices.com>
Message-ID-Hash: IBKAWMZ7VAGAHFZVSQAM7GVODYDITV5T
X-Message-ID-Hash: IBKAWMZ7VAGAHFZVSQAM7GVODYDITV5T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IBKAWMZ7VAGAHFZVSQAM7GVODYDITV5T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 15 Mar 2024 02:21:56 +0300, Jan Dakinevich wrote:
> Add "amlogic,a1-tdmout" and "amlogic,a1-tdmin" compatible string aliases
> to "amlogic,sm1-tdmout" and "amlogic,sm1-tdmin" respectevely.
> 
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  .../sound/amlogic,axg-tdm-formatters.yaml     | 22 ++++++++++++-------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

