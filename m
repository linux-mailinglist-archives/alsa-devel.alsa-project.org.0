Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 524E587DFCA
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 20:46:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9CB823E2;
	Sun, 17 Mar 2024 20:46:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9CB823E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710704785;
	bh=hkVeux51Cmhvp7Xg3Iab1zpv0mwTLFU+W3UsYrIQPaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N1XLuHWtN6Q4c3rmVsCdWxTuoMxlY508hz5sttk41ZSD9POKcC/DselaqLr7kA9iA
	 z/q7CuUlQVPDR3PvDsBpZDzFELLXi0K9m7b5+T8/PNkgbwGIqvb0cS4iA8Vfs+ipOv
	 1ZUQ7h6BTRwc2WwqjLpVK+smD7nffiMKYLDm7/94=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1135FF80589; Sun, 17 Mar 2024 20:45:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 503A3F8057C;
	Sun, 17 Mar 2024 20:45:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E8F0F804E7; Sun, 17 Mar 2024 20:45:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6CD2F80093
	for <alsa-devel@alsa-project.org>; Sun, 17 Mar 2024 20:45:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6CD2F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dltRHZ8b
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 495AE60ADA;
	Sun, 17 Mar 2024 19:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55260C433C7;
	Sun, 17 Mar 2024 19:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710704738;
	bh=hkVeux51Cmhvp7Xg3Iab1zpv0mwTLFU+W3UsYrIQPaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dltRHZ8b/HGv9D1TGsihU+XD5kgo7B+JJEUXHnQQDEiDeYKbO7oS2ou3j2gTFCkeX
	 cIFHfIjZzp5+2Kcn5zBqJCnZkHaJHF1YzR0qjzRi7LvCXXjaa6p0pmi1+UlFwr5wks
	 /6wf1Vb7f6rPfBqtMEnBG6cdfdXPw8ACFUXfEAcRJYy5cwDwn7A7oBRuE3XbYuhAmO
	 cD6fhw4Jbr26lPRJgnSoSKnY7odLk8NISMo24Z6u4icPmc8F2q4yGfMItGFeFLP5bD
	 HIvKVZClMT+EZxJLdjgVXqb9KkaocIHZvyI0klslGICo71sObO8zV5a8NM3xFed+MT
	 4wbyLiD1wYf+A==
Date: Sun, 17 Mar 2024 13:45:34 -0600
From: Rob Herring <robh@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
	Dmitry Rokosov <ddrokosov@salutedevices.com>,
	kernel@salutedevices.com
Subject: Re: [PATCH 22/25] ASoC: dt-bindings: meson: introduce link-name
 optional property
Message-ID: <20240317194534.GA2093375-robh@kernel.org>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-23-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240314232201.2102178-23-jan.dakinevich@salutedevices.com>
Message-ID-Hash: EKZIQ5YMUYPAGHKQOY4VMKWXOFXWPY3J
X-Message-ID-Hash: EKZIQ5YMUYPAGHKQOY4VMKWXOFXWPY3J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EKZIQ5YMUYPAGHKQOY4VMKWXOFXWPY3J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Mar 15, 2024 at 02:21:58AM +0300, Jan Dakinevich wrote:
> From: Dmitry Rokosov <ddrokosov@salutedevices.com>
> 
> The 'link-name' property is an optional DT property that allows for the
> customization of the name associated with the DAI link and PCM stream.
> This functionality mirrors the approach commonly utilized in Qualcomm
> audio cards, providing flexibility in DAI naming conventions for
> improved system integration and userspace experience.
> 
> It allows userspace program to easy determine PCM stream purpose, e.g.:
>     ~ # cat /proc/asound/pcm
>     00-00: speaker (*) :  : playback 1
>     00-01: mics (*) :  : capture 1
>     00-02: loopback (*) :  : capture 1
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>

This needs your S-o-b as well.
