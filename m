Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B1FA4F858
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Mar 2025 08:57:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27544602DE;
	Wed,  5 Mar 2025 08:57:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27544602DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741161460;
	bh=+mbFw9Ph9X3yqzcwPUFnG0EWQqGmsd8ENbZiOlSx150=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HFDvnBtZABH6BaoCLk/H0K6CFHxe3Z0KRnEtJdEpn0uYqy7hYvYv1HWUFOhf5DGiQ
	 Wf0qECgn1qkEp8gNDWkPYUCsYEHLKAhc0lFSyhCPyVpJC6ZDppmFvj1xjey5mWQnN5
	 ULddXXF+lG9+wNdZ5o6Cd3jA5ycGuj+owCekZjhk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21DFDF805BE; Wed,  5 Mar 2025 08:57:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9026EF805BE;
	Wed,  5 Mar 2025 08:57:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF4E8F802BE; Wed,  5 Mar 2025 08:56:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 061E4F8011B
	for <alsa-devel@alsa-project.org>; Wed,  5 Mar 2025 08:56:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 061E4F8011B
Authentication-Results: alsa1.perex.cz;
	dkim=temperror header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=fSy3wO5g
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 5257ugrrF1147908,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1741161402; bh=+mbFw9Ph9X3yqzcwPUFnG0EWQqGmsd8ENbZiOlSx150=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=fSy3wO5gtlPOAi1hh3jXLfDPL14H7/7I0VkshaR3dGq2jhDdeg/TV08BgDklecv0Z
	 vvQV9eDAYca/txNrIkGWawym7xxUi3e0t9rRFV/QVw6dtOWMfT+e8+uOr9JnMCDSOm
	 +itqerFyEiv5RDwR7aM7ItL1TMmquPmhwp2Ggxv6PywircZz7Eqoz6CpjY7n42g8Em
	 C+qcd6XEQ+7KddZPop/bmfwVJeRluHU5SXiyQa1DfYsFiIu6y0a+a5vYapJS60SXNN
	 krUhAP4Fumdz4pSOxh7v2tHmLbeuuLqZpqzONBsGM/tlHbnKtbnuMaXcQiAJSJTKW8
	 bakdcGdcKyczw==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 5257ugrrF1147908
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Mar 2025 15:56:42 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Mar 2025 15:56:42 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 5 Mar 2025 15:56:42 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547]) by
 RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547%5]) with mapi id
 15.01.2507.035; Wed, 5 Mar 2025 15:56:42 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: RE: update ALC222 depop optimize
Thread-Topic: update ALC222 depop optimize
Thread-Index: AduNl/Z/2i7zvjW2RduQNmX+QwAWAP//kWCA//95iZA=
Date: Wed, 5 Mar 2025 07:56:41 +0000
Message-ID: <f7fba6fc8d9e4abfb0c89e487e1d5d89@realtek.com>
References: <81c7f0ec4a2447219c06095e0de4d1d3@realtek.com>
 <87zfhzud4s.wl-tiwai@suse.de>
In-Reply-To: <87zfhzud4s.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: RHC7BXZ3S7WMJTM6NQXXJXW6K2K5LW6R
X-Message-ID-Hash: RHC7BXZ3S7WMJTM6NQXXJXW6K2K5LW6R
X-MailFrom: kailang@realtek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RHC7BXZ3S7WMJTM6NQXXJXW6K2K5LW6R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Wednesday, March 5, 2025 3:54 PM
> To: Kailang <kailang@realtek.com>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>;
> linux-sound@vger.kernel.org
> Subject: Re: update ALC222 depop optimize
>=20
>=20
> External mail : This email originated from outside the organization. Do n=
ot
> reply, click links, or open attachments unless you recognize the sender a=
nd
> know the content is safe.
>=20
>=20
>=20
> On Wed, 05 Mar 2025 07:32:00 +0100,
> Kailang wrote:
> >
> > Hi Takashi,
> >
> > Update ALC222 depop optimize as attach.
>=20
> Could you give a bit more background info why this change is needed?
> Is it a mandatory change to fix something, or it improves something?
>=20
This codec has two headphone design.
The HP2 was nid 0x14.

>=20
> thanks,
>=20
> Takashi
