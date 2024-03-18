Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF67C8812D5
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 15:02:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39D1D1E3;
	Wed, 20 Mar 2024 15:02:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39D1D1E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710943355;
	bh=ue+ngYpZQczjaWjC2/97iH40jedNa6xc3uMbfjw4jjk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p1B/LYyWLjmJSf31A0lyKpBUhKGIPS5Bw2Joe4pmScz1R2P77J4Oe5k9v/BfVYFbC
	 n+H3W4radcIxw48FfSO2ORL0LWwVQCuTInjVLYAU/lnuSwggQ39VW01CIdmWYDlU7r
	 j/0TR4m5xKzU9okLDR24YW+74Y84sz8lbOYr9O7o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B08ABF806BA; Wed, 20 Mar 2024 15:00:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59D62F806C0;
	Wed, 20 Mar 2024 15:00:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9D46F804E7; Mon, 18 Mar 2024 08:27:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34F91F80088
	for <alsa-devel@alsa-project.org>; Mon, 18 Mar 2024 08:27:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34F91F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=salutedevices.com header.i=@salutedevices.com
 header.a=rsa-sha256 header.s=mail header.b=VnGw2EO2
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 51C11100003;
	Mon, 18 Mar 2024 10:27:31 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 51C11100003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710746851;
	bh=6eBBMkMfZ38/VKvG5K/FQSiHY3xSbVnH219JcM7xg+0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=VnGw2EO2nPizTbHONIIGLX+5hzjAt0tn586YH2n+Nhjyhclw+v5sfCXXWLvEo7/6y
	 bd7RztKrqxLrZBw8CXY7FvdpzSlm9desv11YzbjzOS0KgMPCfL6f5J7lol/3zBQsVg
	 3FdNsw1eHzOXUOH8P2/eqVz95tneJYyiygr5588ZrluwFkgV7TX0aLL39RhD1/cV3M
	 hhhRl+onDEkQL7iEWHG/Mi7W1cqNFCeDg10qCyYLiYiis1rLwaUlt4RVGRAbvxw3aO
	 EUcR2aghhldiuGJqtEl+/bF2hdTYPZLd4Fx7WVU91rwjgVIkxvFkr6swtw+VfYjwS+
	 E9oPwXGgWH5Gw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru
 [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 18 Mar 2024 10:27:31 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m02.sberdevices.ru
 (172.16.192.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 18 Mar
 2024 10:27:30 +0300
Date: Mon, 18 Mar 2024 10:27:30 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Rob Herring <robh@kernel.org>
CC: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman
	<khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<kernel@salutedevices.com>
Subject: Re: [PATCH 22/25] ASoC: dt-bindings: meson: introduce link-name
 optional property
Message-ID: <20240318072730.3u4qbwxijreyduwi@CAB-WSD-L081021>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-23-jan.dakinevich@salutedevices.com>
 <20240317194534.GA2093375-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240317194534.GA2093375-robh@kernel.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183875 [Feb 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7
 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Track_E25351},
 {Tracking_from_domain_doesnt_match_to}, FromAlignment: s,
 ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/02/29 19:21:00 #23899999
X-KSMG-AntiVirus-Status: Clean, skipped
X-MailFrom: ddrokosov@salutedevices.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DENIQGU57GEH7YV4N4QJIRDPW67OQHNA
X-Message-ID-Hash: DENIQGU57GEH7YV4N4QJIRDPW67OQHNA
X-Mailman-Approved-At: Wed, 20 Mar 2024 13:57:58 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DENIQGU57GEH7YV4N4QJIRDPW67OQHNA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Rob,

On Sun, Mar 17, 2024 at 01:45:34PM -0600, Rob Herring wrote:
> On Fri, Mar 15, 2024 at 02:21:58AM +0300, Jan Dakinevich wrote:
> > From: Dmitry Rokosov <ddrokosov@salutedevices.com>
> > 
> > The 'link-name' property is an optional DT property that allows for the
> > customization of the name associated with the DAI link and PCM stream.
> > This functionality mirrors the approach commonly utilized in Qualcomm
> > audio cards, providing flexibility in DAI naming conventions for
> > improved system integration and userspace experience.
> > 
> > It allows userspace program to easy determine PCM stream purpose, e.g.:
> >     ~ # cat /proc/asound/pcm
> >     00-00: speaker (*) :  : playback 1
> >     00-01: mics (*) :  : capture 1
> >     00-02: loopback (*) :  : capture 1
> > 
> > Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> 
> This needs your S-o-b as well.

I will send this change in the separate patch series, as Neil suggested
in the cover letter reply.

-- 
Thank you,
Dmitry
