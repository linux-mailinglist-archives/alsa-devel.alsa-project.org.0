Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A15F78A9EDE
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:45:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B631FEC1;
	Thu, 18 Apr 2024 17:45:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B631FEC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455151;
	bh=OzTz5vnhDu5Bd/u1q/Nnnkhy4wfxmnRV71V3HWJ9ckc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QWRX4lXpisD7D9iKLr6gQaWGV+seHI4kEIHEVcxjzUbLGwjSrIJBEdYXgx+0QZfuP
	 xFnlYX4ORQCdL8S+6P+/7lxfzJ5FHY+H2oxcsgmyD8pOZYG45HJO4II+jcq4sDRdEX
	 0Vp5V8+DX2LpOea4mtDUWCOZk1YBQlBFYk6qveT0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DCE5F80642; Thu, 18 Apr 2024 17:44:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA5EBF80640;
	Thu, 18 Apr 2024 17:44:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02F2EF8026D; Mon,  8 Apr 2024 20:47:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71318F8013D
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 20:47:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71318F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=salutedevices.com header.i=@salutedevices.com
 header.a=rsa-sha256 header.s=mail header.b=B9mKlpvx
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 1D9B9120023;
	Mon,  8 Apr 2024 21:47:45 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 1D9B9120023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1712602065;
	bh=j6Pvh7ii/4E5kEvtzQo/0jLzLa8anfIJuWpWiYdLJ2A=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=B9mKlpvxUeWHck4G567ll5BTEaUMz9pFZsXNelEirg4PyMG5uJkEnYdaAanvUf+nV
	 6WCMxzEokm79CE0YIEUtmbJDUgxzKp7/UIbJe3N3cHLfmcuy0mdPKg9ppVaoRWqhlw
	 YlTyZK3577X4WOYhxk+PvYotKVjVWO1evfV+bXLujyw5A+S8lgx7WEb9z348XmoiCA
	 ydbSOZMkJaVcLo4PobcA6AkFWSFXY+dHn2lbdFiyLaj63etnIYVUO0ZGee3df+7eKV
	 q72udjpDPVnHAaNm1Aqh3zBYMu5h4+jFrpufz0+ljAhYgqTTU9HMPQsl27gyp5X4os
	 F5vG7OLtHgj+w==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru
 [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  8 Apr 2024 21:47:44 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m02.sberdevices.ru
 (172.16.192.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 8 Apr
 2024 21:47:44 +0300
Date: Mon, 8 Apr 2024 21:47:44 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Mark Brown <broonie@kernel.org>
CC: Jerome Brunet <jbrunet@baylibre.com>, <neil.armstrong@linaro.org>,
	<lgirdwood@gmail.com>, <conor+dt@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <perex@perex.cz>, <tiwai@suse.com>,
	<khilman@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<kernel@salutedevices.com>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 2/2] ASoC: meson: implement link-name optional
 property in meson card utils
Message-ID: <20240408184744.nfktcppdqewurmgg@CAB-WSD-L081021>
References: <20240408164947.30717-1-ddrokosov@salutedevices.com>
 <20240408164947.30717-3-ddrokosov@salutedevices.com>
 <1j1q7fpv1n.fsf@starbuckisacylon.baylibre.com>
 <20240408184041.3jcav5tabxiblpn4@CAB-WSD-L081021>
 <51b39153-d1a4-4e7f-9b30-8c77fc4ee46f@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <51b39153-d1a4-4e7f-9b30-8c77fc4ee46f@sirena.org.uk>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
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
 adb41f89e2951eb37b279104a7abb8e79494a5e7,
 {Tracking_from_domain_doesnt_match_to},
 smtp.sberdevices.ru:7.1.1,5.0.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1,
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
Message-ID-Hash: 76AMBSIUHWSCXSOGCR2VOSXGB43DYSSS
X-Message-ID-Hash: 76AMBSIUHWSCXSOGCR2VOSXGB43DYSSS
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:44:14 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/76AMBSIUHWSCXSOGCR2VOSXGB43DYSSS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 08, 2024 at 07:45:00PM +0100, Mark Brown wrote:
> On Mon, Apr 08, 2024 at 09:40:41PM +0300, Dmitry Rokosov wrote:
> > On Mon, Apr 08, 2024 at 08:15:54PM +0200, Jerome Brunet wrote:
> 
> > > Userspace pcm, otherwise known as DPCM frontend, are merely that:
> > > frontends. What they do is entirely defined by the routing defined by
> > > the userspace (amixer and friends)
> 
> > > So naming the interface in DT (the FW describing the HW) after what the
> > > the userspace SW could possibly set later on is wrong.
> 
> > > Bottom line: I have mixed feeling about this change. It could allow all
> > > sort of bad names to be set.
> 
> > > The only way it could make sense HW wise is if the only allowed names
> > > where (fr|to)ddr_[abcd], which could help maps the interface and the
> > > kcontrol.
> 
> > The link-name is an optional parameter. Yes, you are right, it can be
> > routed in a way that it no longer functions as a speaker in most cases.
> > However, if you plan to use your board's dt for common purposes, you
> > should not change the common names for DAI links. But if you know that
> > you have a static setup for speakers, microphones, loopback, or other
> > references (you 100% know it, because you are HW developer of this
> > board), why not help the user understand the PCM device assignment in
> > the easiest way?
> 
> I would expect that the place to fix names based on the userspace
> configuration is in whatever userspace is using to define it's
> configurations, like a UCM config.
> 

Honestly, I have tried to find a way to rename the PCM device name or
mark it in some way (such as using a metainformation tag or any other
method), but unfortunately, my search has been unsuccessful.

> > Ultimately, it is the responsibility of the DT board developer to define
> > specific DAIs and name them based on their own knowledge about HW and
> > understanding of the board's usage purposes.
> 
> DT seems like the wrong abstraction layer here.

-- 
Thank you,
Dmitry
