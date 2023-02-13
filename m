Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB163693DF2
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 06:52:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF67B82A;
	Mon, 13 Feb 2023 06:51:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF67B82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676267563;
	bh=YAdEAkT6R8zYFGOkDE4dcZnBxe9go3MkzgAYNhEcwe8=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cgF74ZRY196FWYq3aOGSsDnqhPrGNksFIYT0faNOp3bNYozFDnoyCXt1ttJZHvNo3
	 h26G2yQux+V26WyxX31ZLv3E6GKnZfRiRXYaMneOsA4m0A8Nwu30+80NJvvcIxYciC
	 xiTHCo4wX2No58bwuXnw/Rc3Mw/yrA5LTVLRFac0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49CABF80038;
	Mon, 13 Feb 2023 06:51:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 467CBF804B4; Mon, 13 Feb 2023 06:51:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10acsn2080b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::80b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1073FF800B0
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 06:51:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1073FF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=AjU89Ly+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOWmml5qSou60o+bBKCuXsDa8FxwjZotlaB4zg+8KKMD9g6Aw2kywln6NWRYPwLmrSabSLLrr0kn4vTGdL2nMOvjnsH7aoZfpVLvnSOnPzJYgQv4/ZSSZWoRcFjQRRCY1yqIsDbbR7RJxW/aYG2Y+duWUmemHZydLD5d1jmzTTziqlTGg1bpbQzHf82qzBL4vs3qcLRyIUyoZAfCMgtJgfaZFP/bpxB3HgZxP0kWAFSfpJmGwY9+dbxSJdFC+O3BO/a2mMlSs18na+2HYREDho4Ttc+O6iUSFJGJZvZVPUCEyA9FKCWRbDXu4iIwuH3SXVGDfMwUcnKGJnBz2adp/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIPDjhdDG09+EdW555c1rx3quuqGrGm+21HWQTtArNY=;
 b=KqRRQ3GheAXthL9XY+0/yDXg6Xz9FHmmnTWPL3KO1j7MLpZOnhUpc4QdZfeNJS8tdO2q9XwBjLtcVuscCjTZ6J2eIxAGlr1iMk5xn+UPlBNWTuUX7PGEVVLyegCJkXp8DOYZgXQV5IbYPYfiutqjLRdV09XPwOj2Jv1FqlnaLd2t8sqn3cvcxXHjqwrMHMoTRtNoOiaWqUnieClYptBmaJRdpBEC7ULaLew6hqSBu6fcQt2yckmuZpAypq64llV0XtTX8CPS1eqxvfYl7kcO8GQby+GF/FkDfsBITAHTtZrZSzZon8DODPiz2XGodUJdmKpUNlsRhnvMmLgvupodbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIPDjhdDG09+EdW555c1rx3quuqGrGm+21HWQTtArNY=;
 b=AjU89Ly+roV888o+F9ZNxelhPs70X8YpLSrV1h6tHjidtfbBcD2nz0DdAMesV+M/CDzTq7Q4meOfbDx6u0GAVEDAavLX6RNXjIhBz7EtS6xhmMSThMAQj9df3umI9u9rhn8GodFjD6hK3Ii1mqg4ffJ0Jt4ss8Rjrj+29ZkaWgnY3+zsfwTGUNPnPYGyR8Tw2M2hQIk18UlItoS/1m9C8u45FTC6uYkBYmk3rg4JyAXvL8PhV5JbBRGENDtLkRSc5WK+M9ecm4Ql1allGLVTSlNlM+BFXK+tFUxrj9wHsbABU6+/r5+lu4Oa3IAMA8MjCMDUKF9hcZLZyTghOOLUEA==
Received: from MN2PR17MB3375.namprd17.prod.outlook.com (2603:10b6:208:13c::25)
 by SJ0PR17MB5055.namprd17.prod.outlook.com (2603:10b6:a03:3b8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 05:51:37 +0000
Received: from MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::7cfd:d28f:fec7:beff]) by MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::7cfd:d28f:fec7:beff%4]) with mapi id 15.20.6086.023; Mon, 13 Feb 2023
 05:51:37 +0000
From: Vanessa Page <Vebpe@outlook.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Rob Landley
	<rob@landley.net>, Randy Dunlap <rdunlap@infradead.org>, Christoph Hellwig
	<hch@lst.de>
Subject: Re: remove arch/sh
Thread-Topic: remove arch/sh
Thread-Index: 
 AQHZN58k/f73IBbK60aG0mP3da8Tfq7DN8uAgAETIoCAALNngIAA+k2AgABmVwCABMcN2oAAABzTgAABdYOAAAA4WYAACMDsgAAA7NuAATxqcIAAAA4ygAAAIECAAADz1Q==
Date: Mon, 13 Feb 2023 05:51:37 +0000
Message-ID: 
 <MN2PR17MB33757455EF067EAFFFE99A87B8DD9@MN2PR17MB3375.namprd17.prod.outlook.com>
References: <20230113062339.1909087-1-hch@lst.de>
	 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
	 <20230116071306.GA15848@lst.de>
	 <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
	 <20230203071423.GA24833@lst.de>
	 <60ed320c8f5286e8dbbf71be29b760339fd25069.camel@physik.fu-berlin.de>
	 <0e26bf17-864e-eb22-0d07-5b91af4fde92@infradead.org>
	 <f6317e9073362b13b10df57de23e63945becea32.camel@physik.fu-berlin.de>
	 <1c6e7a19-a650-1852-6f74-ca5547db44c4@landley.net>
 <ed4a36508c3d047f9e9a882475388be18b790b76.camel@physik.fu-berlin.de>
 <MN2PR17MB33753450B555F0E4E65D7C62B8DC9@MN2PR17MB3375.namprd17.prod.outlook.com>
 <MN2PR17MB3375C10DF139D4FFA7F3F657B8DC9@MN2PR17MB3375.namprd17.prod.outlook.com>
 <MN2PR17MB33754A3835C945B57B1FDCCBB8DC9@MN2PR17MB3375.namprd17.prod.outlook.com>
 <MN2PR17MB33759663CAD3BCAB5D0987C0B8DC9@MN2PR17MB3375.namprd17.prod.outlook.com>
 <MN2PR17MB3375048A36FAB21FF0CB8C57B8DC9@MN2PR17MB3375.namprd17.prod.outlook.com>
 <MN2PR17MB3375768C0D423742CF868A81B8DC9@MN2PR17MB3375.namprd17.prod.outlook.com>
 <MN2PR17MB3375750FF5199B9571521342B8DD9@MN2PR17MB3375.namprd17.prod.outlook.com>
 <MN2PR17MB33752170C55FDE392C00DA8DB8DD9@MN2PR17MB3375.namprd17.prod.outlook.com>
 <MN2PR17MB3375B544F3CEC4CB30C5D56EB8DD9@MN2PR17MB3375.namprd17.prod.outlook.com>
In-Reply-To: 
 <MN2PR17MB3375B544F3CEC4CB30C5D56EB8DD9@MN2PR17MB3375.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [IlQyjHy4cz7g8A4mTgwgDS+bO2gTdvQ5]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR17MB3375:EE_|SJ0PR17MB5055:EE_
x-ms-office365-filtering-correlation-id: d4a71ba7-0abb-482b-e703-08db0d865f17
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OGWhZiHfcrWU5KZsXDTSGnJN/8vkw+Bf5Se/bgsWRQj/Qxwi8rjtY4oksNrN23lBhyjp3R70+OwjHlTyR7B/7XOoOLyYgidZkah0tPjLfdAApBuN1qGuRcHv29aWuAqJE//k38FzpN54AnmOLnV/Rp9pNDYgGsjir1Sv8GxE5dV73S3H8rQ3oznoqmCX1Bqj0ar7iNLY/hlOQHPSHIAKywrIVnUItEUoEVwJjyBe8WeDy+ovSr+fpOy4kktRL3HObqQPwFucPJ8wwPuC3SBU/9OhDR5kpR5QxuGtV/HmbEagidf/UlGWTBxX8s3+yF+Xq4FoUuIFmZ1M6PHnVNjGsQVfQSIY8OM+WnO6DuAhyv5686npzLf5JHAZh8Hd5ZxmxZ7dPnbvt8i94v1nhBb6dwT0n5OCEVoNPKeRwJ8fgO7EumaE+NegGJJrs5Sudd3zBUwoedXnSW39Ql+f4TVs/6WLc/CF79P+G0t88MAH3B/5xbSHL89wwIqEiCpBj2geU6owzFmTAgVBGF+thMkxVVswLyVDCcvFZq7tt+u9ceOw0016qmIHVX93Ay7eroap0yXiNuKXZDoYqSIhEoiSa9Bcw9pEA4PGH6512OA3OCsFcA5U85WUqRELjjO1SozKo24pAdrQ/4wZ6TodwIWS+4mhbILoDKrLbdJVI74F6+Y=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?hpCqv0j9D5oeYksXqZBsMw6Nz2P66qs42vM4bbn3atwh3x9pP3wEjVC71tlA?=
 =?us-ascii?Q?SOnQ7FcAOi1vmMbW0a2vc0h6rYGNQ/aRBoSXaZKCUXMwC0IpLIv9rW3S7TI2?=
 =?us-ascii?Q?oebO46mCi8fB/aAI9GqHTXoH0sj96bT1UiZEibBrN3DAWdcGJ4TB/5+lM5Ek?=
 =?us-ascii?Q?dHz62Zp91j3uwGjUxDpD31u2Jc5vt7EjM9xx60bitsPQekiXFJLiftyPViGU?=
 =?us-ascii?Q?EolendnBMLBuTg4SL6OeSA7uAEnw6Rh/Bp6wkKFl3Wl18vPLv57eh9WG/ygL?=
 =?us-ascii?Q?rKY7PyuoBvPYSuxlRXH7/2/OBbzFpRbi8WiXJo6w/0uOs4XMwAsOzReWGtgX?=
 =?us-ascii?Q?noFlFFkcx1SXo8HWcycoAkAWIIwOMJkT7QjTwPkfWqkJj6U+ZRb+297Dr5e5?=
 =?us-ascii?Q?7htMVc6vafkLQAq8tsmDi3PyO39QXuNoVLi94peBMVnvXxc99oi50ibksIVx?=
 =?us-ascii?Q?bl+6ov5H+DHuDKdcvZSY2utnig2L0VH5pP2DEFWgVVKpvEIFEg7ApzT0wcFL?=
 =?us-ascii?Q?NstmImNriF2WK6hUXq35VZNk0rEfd8mByy632wFWwZflN14iegadYuu8MxIk?=
 =?us-ascii?Q?RdJNCn5gLFUb9RQcgevqB+PF8NVPBsINJbzoE+LOEWCg3hcP7MO+ogxgT+JF?=
 =?us-ascii?Q?ky6eIofBlvnV9SfKBg7Wn19b/4mJqyBXdewMRTibGuHOYJJwe/2dJ5pB7Bjz?=
 =?us-ascii?Q?eRegGq1khjvY6knSEGhjM1ROOaDge6t6oBjoFWtpRaL2jAipzBilZ7ePDVjh?=
 =?us-ascii?Q?R6zyY6KEu/qyx2UkdgNYb1JWeCS/xGC7igqKDkPeNX4oF/MooSYFyHrvpsCC?=
 =?us-ascii?Q?iu2/RjhX9X1nLkenqk0/9ugOwKilW99C13SiTplNtDlv94wUMlXpeNxF14Uy?=
 =?us-ascii?Q?Mg9X5QLJ94i87sEeblpFhvPvedQwDW8b8OLEY2pjKgDf9/MgwjwcM1yb1d9j?=
 =?us-ascii?Q?USaFJC/G3psDgcemj9sxzGs1b8RfI+V98S8k1dVQ9RBZVVXHyjs6IJH2aaUu?=
 =?us-ascii?Q?jO/miA2FMMPVLtTQsm/B8YSbSL4GNdDtJj+SxTJNkVONtxJuEyeE6PR+Uie1?=
 =?us-ascii?Q?hLha7sFELH2HyESh355/apsR85szXaiLWJnDbTnWaSGNeCfyiQvHzbR7dK3M?=
 =?us-ascii?Q?qgJ+0UkPdx+88oc4eZtCMX4OLoaLXOxe9A0bNT8vdgogEdbHnvfZM3TanbMm?=
 =?us-ascii?Q?Jn40BYPoyNZErkPkNwoHdYTYOD/wHlCqWXZDEELOPnArUnlNKTrNGraqD2so?=
 =?us-ascii?Q?1j77aWTifngSGo8FrO3m?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR17MB3375.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d4a71ba7-0abb-482b-e703-08db0d865f17
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 05:51:37.4769
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR17MB5055
Message-ID-Hash: LCGUGRKYFLTXYYFCVJQ6Y5NERC4AMAZE
X-Message-ID-Hash: LCGUGRKYFLTXYYFCVJQ6Y5NERC4AMAZE
X-MailFrom: Vebpe@outlook.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
CC: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z3PDYUBWITTAFZ3JPEWNQCHEMVKGQDPZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The development your just a useless raping ass harassing ass dumbsss oh her emails don't bother me maybe because your a man who lives for attention even by force your pathetic
________________________________
From: Vanessa Page
Sent: Monday, February 13, 2023 12:47 AM
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>; Rob Landley <rob@landley.net>; Randy Dunlap <rdunlap@infradead.org>; Christoph Hellwig <hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.org>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven <geert+renesas@glider.be>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>; devicetree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arch@vger.kernel.org <linux-arch@vger.kernel.org>; dmaengine@vger.kernel.org <dmaengine@vger.kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>; linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; linux-input@vger.kernel.org <linux-input@vger.kernel.org>; linux-media@vger.kernel.org <linux-media@vger.kernel.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.org>; linux-mtd@lists.inf
 radead.org <linux-mtd@lists.infradead.org>; netdev@vger.kernel.org <netdev@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-gpio@vger.kernel.org>; linux-rtc@vger.kernel.org <linux-rtc@vger.kernel.org>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-serial@vger.kernel.org <linux-serial@vger.kernel.org>; linux-usb@vger.kernel.org <linux-usb@vger.kernel.org>; linux-fbdev@vger.kernel.org <linux-fbdev@vger.kernel.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sh@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh

Yeah I know there stupid raspiest
________________________________
From: Vanessa Page
Sent: Monday, February 13, 2023 12:47 AM
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>; Rob Landley <rob@landley.net>; Randy Dunlap <rdunlap@infradead.org>; Christoph Hellwig <hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.org>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven <geert+renesas@glider.be>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>; devicetree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arch@vger.kernel.org <linux-arch@vger.kernel.org>; dmaengine@vger.kernel.org <dmaengine@vger.kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>; linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; linux-input@vger.kernel.org <linux-input@vger.kernel.org>; linux-media@vger.kernel.org <linux-media@vger.kernel.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.org>; linux-mtd@lists.inf
 radead.org <linux-mtd@lists.infradead.org>; netdev@vger.kernel.org <netdev@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-gpio@vger.kernel.org>; linux-rtc@vger.kernel.org <linux-rtc@vger.kernel.org>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-serial@vger.kernel.org <linux-serial@vger.kernel.org>; linux-usb@vger.kernel.org <linux-usb@vger.kernel.org>; linux-fbdev@vger.kernel.org <linux-fbdev@vger.kernel.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sh@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh

Maybe
________________________________
From: Vanessa Page
Sent: Monday, February 13, 2023 12:46 AM
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>; Rob Landley <rob@landley.net>; Randy Dunlap <rdunlap@infradead.org>; Christoph Hellwig <hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.org>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven <geert+renesas@glider.be>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>; devicetree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arch@vger.kernel.org <linux-arch@vger.kernel.org>; dmaengine@vger.kernel.org <dmaengine@vger.kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>; linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; linux-input@vger.kernel.org <linux-input@vger.kernel.org>; linux-media@vger.kernel.org <linux-media@vger.kernel.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.org>; linux-mtd@lists.inf
 radead.org <linux-mtd@lists.infradead.org>; netdev@vger.kernel.org <netdev@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-gpio@vger.kernel.org>; linux-rtc@vger.kernel.org <linux-rtc@vger.kernel.org>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-serial@vger.kernel.org <linux-serial@vger.kernel.org>; linux-usb@vger.kernel.org <linux-usb@vger.kernel.org>; linux-fbdev@vger.kernel.org <linux-fbdev@vger.kernel.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sh@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh

Yeah
________________________________
From: Vanessa Page
Sent: Sunday, February 12, 2023 5:54 AM
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>; Rob Landley <rob@landley.net>; Randy Dunlap <rdunlap@infradead.org>; Christoph Hellwig <hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.org>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven <geert+renesas@glider.be>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>; devicetree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arch@vger.kernel.org <linux-arch@vger.kernel.org>; dmaengine@vger.kernel.org <dmaengine@vger.kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>; linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; linux-input@vger.kernel.org <linux-input@vger.kernel.org>; linux-media@vger.kernel.org <linux-media@vger.kernel.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.org>; linux-mtd@lists.inf
 radead.org <linux-mtd@lists.infradead.org>; netdev@vger.kernel.org <netdev@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-gpio@vger.kernel.org>; linux-rtc@vger.kernel.org <linux-rtc@vger.kernel.org>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-serial@vger.kernel.org <linux-serial@vger.kernel.org>; linux-usb@vger.kernel.org <linux-usb@vger.kernel.org>; linux-fbdev@vger.kernel.org <linux-fbdev@vger.kernel.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sh@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh

DUMB ASS you commit crimes just so people can have jobs
________________________________
From: Vanessa Page <Vebpe@outlook.com>
Sent: Sunday, February 12, 2023 5:51 AM
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>; Rob Landley <rob@landley.net>; Randy Dunlap <rdunlap@infradead.org>; Christoph Hellwig <hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.org>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven <geert+renesas@glider.be>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>; devicetree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arch@vger.kernel.org <linux-arch@vger.kernel.org>; dmaengine@vger.kernel.org <dmaengine@vger.kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>; linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; linux-input@vger.kernel.org <linux-input@vger.kernel.org>; linux-media@vger.kernel.org <linux-media@vger.kernel.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.org>; linux-mtd@lists.inf
 radead.org <linux-mtd@lists.infradead.org>; netdev@vger.kernel.org <netdev@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-gpio@vger.kernel.org>; linux-rtc@vger.kernel.org <linux-rtc@vger.kernel.org>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-serial@vger.kernel.org <linux-serial@vger.kernel.org>; linux-usb@vger.kernel.org <linux-usb@vger.kernel.org>; linux-fbdev@vger.kernel.org <linux-fbdev@vger.kernel.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sh@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh

Emmmmm maybe y'all stupid asses have been reported now you little sick having dipshit.


________________________________
From: Vanessa Page <Vebpe@outlook.com>
Sent: Sunday, February 12, 2023 5:21 AM
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>; Rob Landley <rob@landley.net>; Randy Dunlap <rdunlap@infradead.org>; Christoph Hellwig <hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.org>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven <geert+renesas@glider.be>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>; devicetree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arch@vger.kernel.org <linux-arch@vger.kernel.org>; dmaengine@vger.kernel.org <dmaengine@vger.kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>; linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; linux-input@vger.kernel.org <linux-input@vger.kernel.org>; linux-media@vger.kernel.org <linux-media@vger.kernel.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.org>; linux-mtd@lists.inf
 radead.org <linux-mtd@lists.infradead.org>; netdev@vger.kernel.org <netdev@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-gpio@vger.kernel.org>; linux-rtc@vger.kernel.org <linux-rtc@vger.kernel.org>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-serial@vger.kernel.org <linux-serial@vger.kernel.org>; linux-usb@vger.kernel.org <linux-usb@vger.kernel.org>; linux-fbdev@vger.kernel.org <linux-fbdev@vger.kernel.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sh@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh


Take a pole and shove it up your ass then remove it and shove it down your throat.

So you Taste the bullshit that comes out of your mouth literally.
________________________________
From: Vanessa Page
Sent: Sunday, February 12, 2023 5:18 AM
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>; Rob Landley <rob@landley.net>; Randy Dunlap <rdunlap@infradead.org>; Christoph Hellwig <hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.org>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven <geert+renesas@glider.be>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>; devicetree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arch@vger.kernel.org <linux-arch@vger.kernel.org>; dmaengine@vger.kernel.org <dmaengine@vger.kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>; linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; linux-input@vger.kernel.org <linux-input@vger.kernel.org>; linux-media@vger.kernel.org <linux-media@vger.kernel.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.org>; linux-mtd@lists.inf
 radead.org <linux-mtd@lists.infradead.org>; netdev@vger.kernel.org <netdev@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-gpio@vger.kernel.org>; linux-rtc@vger.kernel.org <linux-rtc@vger.kernel.org>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-serial@vger.kernel.org <linux-serial@vger.kernel.org>; linux-usb@vger.kernel.org <linux-usb@vger.kernel.org>; linux-fbdev@vger.kernel.org <linux-fbdev@vger.kernel.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sh@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh

You live for people to report you go ahead and keep emailing you degenerate dumb ass
________________________________
From: Vanessa Page
Sent: Sunday, February 12, 2023 5:13 AM
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>; Rob Landley <rob@landley.net>; Randy Dunlap <rdunlap@infradead.org>; Christoph Hellwig <hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.org>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven <geert+renesas@glider.be>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>; devicetree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arch@vger.kernel.org <linux-arch@vger.kernel.org>; dmaengine@vger.kernel.org <dmaengine@vger.kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>; linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; linux-input@vger.kernel.org <linux-input@vger.kernel.org>; linux-media@vger.kernel.org <linux-media@vger.kernel.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.org>; linux-mtd@lists.inf
 radead.org <linux-mtd@lists.infradead.org>; netdev@vger.kernel.org <netdev@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-gpio@vger.kernel.org>; linux-rtc@vger.kernel.org <linux-rtc@vger.kernel.org>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-serial@vger.kernel.org <linux-serial@vger.kernel.org>; linux-usb@vger.kernel.org <linux-usb@vger.kernel.org>; linux-fbdev@vger.kernel.org <linux-fbdev@vger.kernel.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sh@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh

Dumb child ass idiot
________________________________
From: Vanessa Page
Sent: Sunday, February 12, 2023 5:13 AM
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>; Rob Landley <rob@landley.net>; Randy Dunlap <rdunlap@infradead.org>; Christoph Hellwig <hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.org>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven <geert+renesas@glider.be>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>; devicetree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arch@vger.kernel.org <linux-arch@vger.kernel.org>; dmaengine@vger.kernel.org <dmaengine@vger.kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>; linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; linux-input@vger.kernel.org <linux-input@vger.kernel.org>; linux-media@vger.kernel.org <linux-media@vger.kernel.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.org>; linux-mtd@lists.inf
 radead.org <linux-mtd@lists.infradead.org>; netdev@vger.kernel.org <netdev@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-gpio@vger.kernel.org>; linux-rtc@vger.kernel.org <linux-rtc@vger.kernel.org>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-serial@vger.kernel.org <linux-serial@vger.kernel.org>; linux-usb@vger.kernel.org <linux-usb@vger.kernel.org>; linux-fbdev@vger.kernel.org <linux-fbdev@vger.kernel.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sh@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh

http://www.infradead.org/recruitment.html
________________________________
From: linux-mtd <linux-mtd-bounces@lists.infradead.org> on behalf of John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Sent: Thursday, February 9, 2023 4:15 AM
To: Rob Landley <rob@landley.net>; Randy Dunlap <rdunlap@infradead.org>; Christoph Hellwig <hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.org>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven <geert+renesas@glider.be>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>; devicetree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arch@vger.kernel.org <linux-arch@vger.kernel.org>; dmaengine@vger.kernel.org <dmaengine@vger.kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>; linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; linux-input@vger.kernel.org <linux-input@vger.kernel.org>; linux-media@vger.kernel.org <linux-media@vger.kernel.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.org>; linux-mtd@lists.inf
 radead.org <linux-mtd@lists.infradead.org>; netdev@vger.kernel.org <netdev@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-gpio@vger.kernel.org>; linux-rtc@vger.kernel.org <linux-rtc@vger.kernel.org>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-serial@vger.kernel.org <linux-serial@vger.kernel.org>; linux-usb@vger.kernel.org <linux-usb@vger.kernel.org>; linux-fbdev@vger.kernel.org <linux-fbdev@vger.kernel.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sh@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh

On Wed, 2023-02-08 at 21:09 -0600, Rob Landley wrote:
> > Geert has suggested to wait with adding a tree source to the entry until I get my
> > own kernel.org account. I have enough GPG signatures from multiple kernel developers
> > on my GPG key, so I think it shouldn't be too difficult to qualify for an account.
>
> So you're not planning to use https://lk.j-core.org/J-Core-Developers/sh-linux
> but push to kernel.org and ask Linus to pull from there?

Yes, that's what Geert recommended.

Adrian

--
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546<tel:2956%209546>  0006 7426<tel:0006%207426> 3B37 F5B5 F913

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
