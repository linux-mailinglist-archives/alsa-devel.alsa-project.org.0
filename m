Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A396A87DF87
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 20:10:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F35323D5;
	Sun, 17 Mar 2024 20:10:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F35323D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710702654;
	bh=m0Flx86hlt0ID5OEE6IkxZUX4ODTKKRFVINUHUA7ss0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HWi+4Rr/TrAZXRtlEdgCzn28+PblHmsD3CftddotGFArTQ8qVAKnY2obhx2qnN3he
	 05nEhtUj44mk1thj6HBLpPkknZp69dkfOWrp1kcGHJcaRACGQ/X0eD2pKAbCSp4nwZ
	 8fKQ3pPSxMlOKur9Oq+GtmiKz5lwjgQqFWNF5Jwo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 445CBF805AC; Sun, 17 Mar 2024 20:10:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88F0EF805A0;
	Sun, 17 Mar 2024 20:10:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BE52F804E7; Sun, 17 Mar 2024 20:10:19 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id DA8D9F80088
	for <alsa-devel@alsa-project.org>; Sun, 17 Mar 2024 20:10:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA8D9F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rSi2XOPS
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8AF1CCE0916;
	Sun, 17 Mar 2024 19:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E14C433F1;
	Sun, 17 Mar 2024 19:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710702612;
	bh=m0Flx86hlt0ID5OEE6IkxZUX4ODTKKRFVINUHUA7ss0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rSi2XOPSw4Fdzj6YPbJ7NmZItS9T42PBNe8meEGA9KvXJRseIYJNeFYApi1qVRjuF
	 hIcM+uFWfRSLKPwIEl2GIBRnd/xqgU02SVSNm08VSB2uIpoHwsjOHvrYMOKlecUNqe
	 sNLexeaItJBWTmeVgGgkG0bjOqiKxcdEeQSmeE9JPymngvyhmvUGJSw1r1ho26OeJA
	 sx7OgUz6iWHYATK8MUlkVmE+L1E8nd3af5BCjQjAKDUMxsERP65WIi+VlffTIPxhwL
	 T8mRlVfXX8byeWK2sL7DNvakNHAC6ae1At+0UorQOGPwMdLHUrvc2KEyio6w6lWTzT
	 OpDtA+MjP4/2w==
Date: Sun, 17 Mar 2024 13:10:10 -0600
From: Rob Herring <robh@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, kernel@salutedevices.com,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 16/25] ASoC: dt-bindings: meson: meson-axg-audio-arb:
 claim support of A1 SoC family
Message-ID: <171070260941.2083610.11098658927011018629.robh@kernel.org>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-17-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240314232201.2102178-17-jan.dakinevich@salutedevices.com>
Message-ID-Hash: SWN4PNRHRHMOJBX5GP4YAY657S5VTYIW
X-Message-ID-Hash: SWN4PNRHRHMOJBX5GP4YAY657S5VTYIW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SWN4PNRHRHMOJBX5GP4YAY657S5VTYIW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 15 Mar 2024 02:21:52 +0300, Jan Dakinevich wrote:
> Add "amlogic,meson-a1-audio-arb" compatible string alias to
> "amlogic,meson-sm1-audio-arb".
> 
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  .../bindings/reset/amlogic,meson-axg-audio-arb.yaml    | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

