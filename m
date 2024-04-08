Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B428A9EDD
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:45:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACFA5DFA;
	Thu, 18 Apr 2024 17:45:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACFA5DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455129;
	bh=TWMhq47+AaotDo5kYErPNH/lOTLWt7BalzXTfwvRjFc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bpkQl5JvTEbjSmHHYfl8Fubcq5NMSHxTTTsELOm5C+q2P4MixIPjaWc2XUop0Pmnl
	 jbEYthBo0YpaFsmCtt+4vAIaUHqNB4GZznjLwijOeqde+4dm7K/bYJof0Nqgk+uBk8
	 T+rPCkuzU6NwcLciGNjZvn+2P62LcQ80e9Gs6VpM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F96FF805A9; Thu, 18 Apr 2024 17:44:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1072F80615;
	Thu, 18 Apr 2024 17:44:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28490F8026D; Mon,  8 Apr 2024 20:40:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AAF44F8013D
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 20:40:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAF44F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=salutedevices.com header.i=@salutedevices.com
 header.a=rsa-sha256 header.s=mail header.b=WKgeijvs
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id B0C57100041;
	Mon,  8 Apr 2024 21:40:41 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru B0C57100041
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1712601641;
	bh=FdcH8XsrOUDq4JN+ynsMalsWgvjtdzSqlvJuabgOE4Q=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=WKgeijvszbZNG4oHb9dvfXyoDaxkAcJv+EvtPvl4uKNnpAKYKomAp7w2ZQfMl4hFD
	 aN8wC7k5qy/UiNyA70xZbSY7mlgaycttMGp9nKlj+BJenLdaWgKcl38JKCtsp7iltT
	 wy99Rdo3wqOJaopej7Yo6jNcAfuTG7pTRzArOwuTjvztknyySbgZKrN63Rfsuo0Qsu
	 jGwFkqe0Ltap0+M95yCLhx1X5b/jJS0YR2gcG4FGhy8KWVm5Z74XV64p4eCSzavvpm
	 neLw/nIPW6Zr9X8WcYCx9tF2TsQoX6PD1uRInZgHh3bpmK1Qrh8rtuHgfxxKmjyk/G
	 Fd1sXxO9zeOTQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru
 [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  8 Apr 2024 21:40:41 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m02.sberdevices.ru
 (172.16.192.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 8 Apr
 2024 21:40:41 +0300
Date: Mon, 8 Apr 2024 21:40:41 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: <neil.armstrong@linaro.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<conor+dt@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <perex@perex.cz>, <tiwai@suse.com>,
	<khilman@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<kernel@salutedevices.com>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 2/2] ASoC: meson: implement link-name optional
 property in meson card utils
Message-ID: <20240408184041.3jcav5tabxiblpn4@CAB-WSD-L081021>
References: <20240408164947.30717-1-ddrokosov@salutedevices.com>
 <20240408164947.30717-3-ddrokosov@salutedevices.com>
 <1j1q7fpv1n.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1j1q7fpv1n.fsf@starbuckisacylon.baylibre.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184624 [Apr 08 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 15 0.3.15
 adb41f89e2951eb37b279104a7abb8e79494a5e7, {Track_E25351},
 {Tracking_from_domain_doesnt_match_to},
 127.0.0.199:7.1.2;100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1,
 FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/04/08 15:55:00 #24711186
X-KSMG-AntiVirus-Status: Clean, skipped
X-MailFrom: ddrokosov@salutedevices.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IBKHB3VPKZGEOM7S4PQMFFG5537LYJK6
X-Message-ID-Hash: IBKHB3VPKZGEOM7S4PQMFFG5537LYJK6
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:44:14 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IBKHB3VPKZGEOM7S4PQMFFG5537LYJK6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 08, 2024 at 08:15:54PM +0200, Jerome Brunet wrote:
> 
> On Mon 08 Apr 2024 at 19:49, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:
> 
> > The 'link-name' property presents an optional DT feature that empowers
> > users to customize the name associated with the DAI link and PCM stream.
> > This functionality reflects the approach often employed in Qualcomm
> > audio cards, providing enhanced flexibility in DAI naming conventions
> > for improved system integration and userspace experience.
> >
> > It allows userspace program to easy determine PCM stream purpose, e.g.:
> >     ~ # cat /proc/asound/pcm
> >     00-00: speaker (*) :  : playback 1
> >     00-01: mics (*) :  : capture 1
> >     00-02: loopback (*) :  : capture 1
> 
> The example above is exactly what you should not do with link names, at
> least with the amlogic audio system.
> 
> Userspace pcm, otherwise known as DPCM frontend, are merely that:
> frontends. What they do is entirely defined by the routing defined by
> the userspace (amixer and friends)
> 
> So naming the interface in DT (the FW describing the HW) after what the
> the userspace SW could possibly set later on is wrong.
> 
> Bottom line: I have mixed feeling about this change. It could allow all
> sort of bad names to be set.
> 
> The only way it could make sense HW wise is if the only allowed names
> where (fr|to)ddr_[abcd], which could help maps the interface and the
> kcontrol.
> 
> Such restriction should be documented in the binding doc.
> 

The link-name is an optional parameter. Yes, you are right, it can be
routed in a way that it no longer functions as a speaker in most cases.
However, if you plan to use your board's dt for common purposes, you
should not change the common names for DAI links. But if you know that
you have a static setup for speakers, microphones, loopback, or other
references (you 100% know it, because you are HW developer of this
board), why not help the user understand the PCM device assignment in
the easiest way?

Ultimately, it is the responsibility of the DT board developer to define
specific DAIs and name them based on their own knowledge about HW and
understanding of the board's usage purposes.

> >
> > The previous naming approach using auto-generated fe or be strings
> > continues to be utilized as a fallback.
> >
> > Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> > ---
> >  sound/soc/meson/meson-card-utils.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
> > index ed6c7e2f609c..7bae72905a9b 100644
> > --- a/sound/soc/meson/meson-card-utils.c
> > +++ b/sound/soc/meson/meson-card-utils.c
> > @@ -94,10 +94,14 @@ static int meson_card_set_link_name(struct snd_soc_card *card,
> >  				    struct device_node *node,
> >  				    const char *prefix)
> >  {
> > -	char *name = devm_kasprintf(card->dev, GFP_KERNEL, "%s.%s",
> > -				    prefix, node->full_name);
> > -	if (!name)
> > -		return -ENOMEM;
> > +	const char *name;
> > +
> > +	if (of_property_read_string(node, "link-name", &name)) {
> > +		name = devm_kasprintf(card->dev, GFP_KERNEL, "%s.%s",
> > +				      prefix, node->full_name);
> > +		if (!name)
> > +			return -ENOMEM;
> > +	}
> >  
> >  	link->name = name;
> >  	link->stream_name = name;
> 
> 
> -- 
> Jerome

-- 
Thank you,
Dmitry
