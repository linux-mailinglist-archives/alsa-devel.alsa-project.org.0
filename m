Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EF487DF8C
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 20:13:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DCDE23E3;
	Sun, 17 Mar 2024 20:13:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DCDE23E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710702833;
	bh=JYKVdlCCGPEvfp7uaNFd4jaJ+73Ab9jX4gjFI8e6pV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZqulKuUbhWXadgjjNDtuzZnjzG7/TvHFLDhNU/l5GQkU5O6urazM66jmW5Me2FHwz
	 +7FcVQhTOmBMzQoxJILaISasyqvUv/e+gzguji6dW7eIc6EMaU+O4bWnLFA9iv1SQE
	 oEjQX8/9eNJszk4J6NheGEyG/dS3L0y/oi56Tcnw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97185F805B1; Sun, 17 Mar 2024 20:13:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9067F8057F;
	Sun, 17 Mar 2024 20:13:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A69A3F804E7; Sun, 17 Mar 2024 20:13:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D755F80088
	for <alsa-devel@alsa-project.org>; Sun, 17 Mar 2024 20:13:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D755F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Mmh1P7pQ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3F3B560ADB;
	Sun, 17 Mar 2024 19:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83CFDC433C7;
	Sun, 17 Mar 2024 19:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710702790;
	bh=JYKVdlCCGPEvfp7uaNFd4jaJ+73Ab9jX4gjFI8e6pV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mmh1P7pQhJxUV7thKu9zR+oBA53toGIgvDRcJGZ2sB8Y+vuOsZjnTYspScBo+XKez
	 Iw7JKRZvF9JNBKAhSGIYgsM9ZrwW48Uqs9zeF4TWDYmtu/l/5AbDaNh5cH9IWRRSCo
	 4Hfs7g7bYMysQ0PlGL4xTR0bYFhVz/MXt0mfs8WoTXAIB9DxuDyOq5NNkhcxrW3VA2
	 M1dVsG4tIKHOTg7N7K0jw8J0D2MUOQlP5Ic4mKPc9uTP3IqP/FQA4VxX+USI8VML+p
	 K2Iz419DngTmZKFzsBm9mHEjR11spvrjJb5k7B4cro4TIa49E6N40TluB7IdFzNiIa
	 nNF77kBni0gIQ==
Date: Sun, 17 Mar 2024 13:13:08 -0600
From: Rob Herring <robh@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: linux-sound@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	kernel@salutedevices.com, linux-gpio@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 17/25] ASoC: dt-bindings: meson: axg-fifo: claim support
 of A1 SoC family
Message-ID: <171070278776.2087227.539742040417816732.robh@kernel.org>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-18-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240314232201.2102178-18-jan.dakinevich@salutedevices.com>
Message-ID-Hash: QZNVYWXWTM2KKIFYZKHNSKROW3Z5PLQV
X-Message-ID-Hash: QZNVYWXWTM2KKIFYZKHNSKROW3Z5PLQV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QZNVYWXWTM2KKIFYZKHNSKROW3Z5PLQV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 15 Mar 2024 02:21:53 +0300, Jan Dakinevich wrote:
> Add "amlogic,a1-toddr" and "amlogic,a1-frddr" compatible string aliases
> to "amlogic,sm1-toddr" and "amlogic,sm1-frddr" respectevely.
> 
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  .../devicetree/bindings/sound/amlogic,axg-fifo.yaml       | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

