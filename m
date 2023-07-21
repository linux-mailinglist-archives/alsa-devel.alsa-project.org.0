Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E2775C8C8
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 16:00:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB3C91FE;
	Fri, 21 Jul 2023 15:59:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB3C91FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689948012;
	bh=zqjR6hm055Hl9z3dKM2WeMRqxZN0OBDSyb3Rxgd4HGM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TmKoarM7+FovJmYX7pinL3mO9v/8nIwFMpxQpHoswJfIu9tGMKTDXS1Sh/r1wHlue
	 wPPbCal8TFa51lJxs6js2qNtSn61dQ6feDQp5f9AEF+sX7Akx7gdf6Zt6sJBLLpC83
	 ebYDop8fQqU/oHG7fTssTrtiSxQNe+7NdCE+RRzs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECC1CF80535; Fri, 21 Jul 2023 15:59:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F1BEF8032D;
	Fri, 21 Jul 2023 15:59:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD435F8047D; Fri, 21 Jul 2023 15:58:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=PDS_BAD_THREAD_QP_64,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E777F8027B
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 15:58:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E777F8027B
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-27-tUZJkKfjPuSYNBamH4xjCA-1; Fri, 21 Jul 2023 14:58:54 +0100
X-MC-Unique: tUZJkKfjPuSYNBamH4xjCA-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 21 Jul
 2023 14:58:53 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 21 Jul 2023 14:58:52 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>, Takashi Iwai
	<tiwai@suse.de>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Dan Williams
	<dan.j.williams@intel.com>
Subject: RE: [PATCH v1 1/1] ALSA: korg1212: Re-use sockptr_t and respective
 APIs
Thread-Topic: [PATCH v1 1/1] ALSA: korg1212: Re-use sockptr_t and respective
 APIs
Thread-Index: AQHZu8ALiLW3NE9rpEyBJunRSGnWfK/EPjVA
Date: Fri, 21 Jul 2023 13:58:52 +0000
Message-ID: <b8e6f7ae1e684f85902cb3a787436bd9@AcuMS.aculab.com>
References: <20230721100146.67293-1-andriy.shevchenko@linux.intel.com>
 <878rb9h901.wl-tiwai@suse.de> <ZLphAJG4Tz8zLUSN@smile.fi.intel.com>
In-Reply-To: <ZLphAJG4Tz8zLUSN@smile.fi.intel.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: AXR3FSKPZ4CNVWGUFUGDJQJLG5KAGWJ6
X-Message-ID-Hash: AXR3FSKPZ4CNVWGUFUGDJQJLG5KAGWJ6
X-MailFrom: david.laight@aculab.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AXR3FSKPZ4CNVWGUFUGDJQJLG5KAGWJ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Andy Shevchenko
> Sent: 21 July 2023 11:42
>=20
> On Fri, Jul 21, 2023 at 12:08:46PM +0200, Takashi Iwai wrote:
> > On Fri, 21 Jul 2023 12:01:46 +0200,
> > Andy Shevchenko wrote:
> > >
> > > The sockptr_t (despite the naming) is a generic type to hold kernel
> > > or user pointer and there are respective APIs to copy data to or
> > > from it. Replace open coded variants in the driver by them.
> >
> > While I see the benefit, I feel this is very confusing.  If we use the
> > API for a generic use, it should be renamed at first.
> >
> > Also, the current function actually follows the call pattern, and we
> > know in the caller side whether it's called for a kernel pointer or a
> > user pointer.  So, if any, the PCM core callbacks should be revised to
> > use a generic pointer instead of fiddling in each driver side.
>=20
> Any suggestion for the name?
> And I believe for the bigger series the new callback should be added firs=
t.

It would also be better to replace the current sockptr_t with
a structure that contains separate user and kernel addresses
(instead of a union of the pointer types and a flag).

The size of the structure wouldn't change and the code might
even come out better.

There is also scope for adding a length and passing the structure
by reference instead of by value.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

