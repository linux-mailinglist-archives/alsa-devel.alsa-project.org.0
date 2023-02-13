Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8546F693DED
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 06:48:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 442A820B;
	Mon, 13 Feb 2023 06:47:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 442A820B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676267294;
	bh=bfyb6b0XtWUKungkuS8bkVNHwXTRmPlzcY9r6eCWvpU=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Flzo17BQlDMn5vftd82Nt6bVNMyX8CmtxXHUaOU+2FURmBgx3YXp+9JV25aR0VZ2d
	 L5YLDkdZ89xCQjgPB8JGSqq9zdbX4YUCCCktJ+zggBWUQvF7oGhKkyHkt0Bf5u1Vyv
	 zXbRkJYXXsovBZBheXmlONBiOXqGjS9EVg0E+6Vc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45828F804B0;
	Mon, 13 Feb 2023 06:47:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BDC7F804D6; Mon, 13 Feb 2023 06:47:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11olkn20800.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::800])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 891C6F80038
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 06:46:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 891C6F80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=ivGhKbpT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0YkwtbD4C5fXFiPUk8mnnWfAbQvF5clooY/2J+1WjdETBa9tq3V99DEMprreel1ipBH3p+mtLHwsmLnzoG5k4nFnw5ILOnCSDg8YLOOKQHv2KeMJnOYW4xkuNBVmqFUKko0zgbCSB5W/q1tkbGO3A3vH5fj8CNpCmZfu3KdRYrvJbYziIp9b8mzkfBF09cxWd+2eIAyWwq5M4T1JUklM/UqapyDpOPD9DBpax37+EiLfZjp6mE6Eaz78GJ3jWSEOoSzOWjx/W0j9NxgnhaZmM4hQgNpTQ9ifYFpG9VewI6QAQgGlDdSL209zGLUPRgnmT+KPAr0kJO4W7Q4R+ofRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUlNIp/mDlyxXK8HDI8SPa3gucUN9m0eoDGw62A/6/0=;
 b=CM7ucapL2kjjQCg1fOixH6+F1PzM7bt/c8kCg9x3KyrJimZQjzkZIgEuEoabMxddCQtHpuYepm2qzSMWKF+KFvIBZjf+lnK5SbLt9KypLoX/4ZB2tj+I435D8PWgIZmw6evtr8kIg/rXlPzxdaP0lR7MJ8WLRs9XuDyUkc4naZqK29ODx5vqezEi/4lI7+L3hKgK115asxzZBrMzJo4crOpW4PyA8hzYBwhSZUKVVVZq4GBGIzhU2ndRc7ku9r+tjEaVwFCS1X2hiVncqEkG8/mdxLiY/uAjXgwaOqIUflOaLzqBrCOe6obZjz7U6wW9F1IE4iARxLPQAgfGOf2XeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUlNIp/mDlyxXK8HDI8SPa3gucUN9m0eoDGw62A/6/0=;
 b=ivGhKbpTE/0xePaFXFBHNxunJ7E86fiwdX6ERiiv3p0EfjylPVMKIIXayeS0WifnkIwhIBOOEjUq+YbRSHty30jtrEPPic0lsTRPs4A374rfTxFSNYZfsIeznIUNiXiREhHWg9pZJMuF7rnt7LM12ZMEftb/NPwpJaadJ0OuWKF5lqRbQGjm9BS1iFMPBssnJPkZjM4g08ZmmPYMXbkFVzexIykOjtvvW75K7iHUTePcABKGifuWrF2vq+qBZy0X+93f7QBE9gssjBaN2ckar7D/cicDVKc6XUuSL+SjFrNDcGHmyWTrS09ggVBKwZktUE4BHZWFlhorqp5371C7GQ==
Received: from MN2PR17MB3375.namprd17.prod.outlook.com (2603:10b6:208:13c::25)
 by DM4PR17MB5946.namprd17.prod.outlook.com (2603:10b6:8:51::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Mon, 13 Feb
 2023 05:46:51 +0000
Received: from MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::7cfd:d28f:fec7:beff]) by MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::7cfd:d28f:fec7:beff%4]) with mapi id 15.20.6086.023; Mon, 13 Feb 2023
 05:46:51 +0000
From: Vanessa Page <Vebpe@outlook.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Rob Landley
	<rob@landley.net>, Randy Dunlap <rdunlap@infradead.org>, Christoph Hellwig
	<hch@lst.de>
Subject: Re: remove arch/sh
Thread-Topic: remove arch/sh
Thread-Index: 
 AQHZN58k/f73IBbK60aG0mP3da8Tfq7DN8uAgAETIoCAALNngIAA+k2AgABmVwCABMcN2oAAABzTgAABdYOAAAA4WYAACMDsgAAA7NuAATxqcA==
Date: Mon, 13 Feb 2023 05:46:51 +0000
Message-ID: 
 <MN2PR17MB3375750FF5199B9571521342B8DD9@MN2PR17MB3375.namprd17.prod.outlook.com>
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
In-Reply-To: 
 <MN2PR17MB3375768C0D423742CF868A81B8DC9@MN2PR17MB3375.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [X/o0zZEvSfSWZdaq1OdpFDtPG9ZQb5td]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR17MB3375:EE_|DM4PR17MB5946:EE_
x-ms-office365-filtering-correlation-id: bba2e635-6bb2-4af6-be11-08db0d85b4a7
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zy6tZr8G4MOYBUk8DdzbytEh5If3VPhdyukJL0d0Edf3G94F0tP6hFZYaTpPbAqmp5mnjqTQ5fk8KjOXYUyOPhtAy0nWaKR+ssa5VupaO6v6glK5UMfU9ZaVrGV9bn4UTOuiJcsnjL9kuwfAfE08LbwyiYmQ3BnUXjJAxJ4bM0t+3rFcew5jBcbN2EQ/rBu/65xKI9y3yp7ewSAclxscDdCikVxo7N5HUAEHdGyiyhew73HOuN75A1ENu7jQmD6meXlILzliTeEgREVGDytuM6AT0Lc8HjIX7ONs5zEQ0ZclC/7xwYwbZV/N9DhSjAH+E4JNpLoN81gT0tSknYhY0Is7O+ZNb6YRjoJoyrr53BghnN2LmRRiPHvOinkKG5F2f6sp8eO/i4DeAWcRpQ5k+q0LHlftLMs5sAzV8FoFJVyCYYiW/LlIyu28UY4wHG4KIbcrf6h3DRsIKX1STyv8B65aR02ZSyaOaJJIzuKxJBb6OhDrqMgmDWmZ3lp1/heircFo0ReV1HFsOrLqCJVRnHQ6FUWqE7T7oIrcuGYO/1Vz30ToHfp2xURuEQvPeSMg9NC3/j6+hHcv61dTR2C9gR/QPS0AS0Y7oP1Cl1n5IKYqQsSdCRHspSj3j8h2vHciulTbpgot1dQrq5m3c5Xy2sma5TLL/qHgkahY6uAE7Ds=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?gScZgDcFyBNvw945ZdO3f9pc54U2mErxOkdOfar5QBLIthIQTCjMldz282?=
 =?iso-8859-1?Q?qXIK/tq/INB7qLMJA69q6KKmMDxUCuFqQjp9Qb9BgTGw9TlDkPtE52fCl3?=
 =?iso-8859-1?Q?XU372lvm4He0uV0c1gQPxtnek0R3fA6nxZEppFCug12C287b6lGmJ9UTVn?=
 =?iso-8859-1?Q?0UnWRNTR0J97cpYAtoHF/iMgaaonBBBndtuyn7hXxofDNe5iC4W4+Bim46?=
 =?iso-8859-1?Q?9lOc8UyCEr/fmIE8ZyIEZ4tipr/NyvD2h/QSaecRbKaIXbtniVB/V42PLA?=
 =?iso-8859-1?Q?VD66PBKaetAoLQRKZNXKdeYPlPihO7U2sLrqVmjzSY82qo+htCBFNxe6hG?=
 =?iso-8859-1?Q?wqoUhcF7IDV9/FPVOy9CQVNVRH51aXI4a7g9wGOO9EM11VMMvpFGTt3IfP?=
 =?iso-8859-1?Q?5Jb0futPGqlC2mM5mZpxHeVL9hRBlwEq7S1/aaAl1BTpoesBqUmBEyGX96?=
 =?iso-8859-1?Q?ecSRs9FeRscYW5uzinELsHFKYLbfXJLplLsKATMBBZ6iS+GWwRdQ6MD4/6?=
 =?iso-8859-1?Q?6Ud91HCVK320mQi11OF3NfC4prpL/44WNuglY8jIEA86eb9SaXultomL2F?=
 =?iso-8859-1?Q?y7YX/xeYHUrsHkJEdDZ6XRU67+BvZ3xQOzvRXGRjsyx8cquDS5PkKt+8ne?=
 =?iso-8859-1?Q?TN4NvL4bc1fa5IgJjTkPKi6Qe/HeiKynUJ8w2LNV4g6nw/T+vZ5ymJAScX?=
 =?iso-8859-1?Q?0623McH87FuN73vHIPluz6QyoCt2iWcVEQkUA4G2Edr8YjvqWckXuX0qy/?=
 =?iso-8859-1?Q?soP2bW4mh7PbQ3+FD0XlF0/iouId4T2NS8rCqUVQv7aCXpipkrUbtN1ZLl?=
 =?iso-8859-1?Q?GmogBczOpSpK5MlMa8Zlof+0ywISm9wxWgvn0PfbSWbL5cH4BJr8pXwnEW?=
 =?iso-8859-1?Q?QrXLUct64lEuzNP2OyWjbHNVZEIhNguxGrFW+nzzHRNSVM4pq1MYs1jTA0?=
 =?iso-8859-1?Q?0nTf7XdWSgcmGr2QYH7sE8cluHDAzKojyUHk0L8s7SO0kwr1KFNRIGz6Rm?=
 =?iso-8859-1?Q?X84lfUB2ejDspj8RS1T9cY0N0xuG57wpc5PnW81O9WSQ+AUMJsYLm3t+tQ?=
 =?iso-8859-1?Q?Y0iXOTB8ffnDLKHbp3g3DQhfB816Jk3InY1WcZmVa3WsesrNLWliIFNRAA?=
 =?iso-8859-1?Q?Us4yhU6RNYxzj8ki4qNZ4pDf4KiN3ThHSeX1gWOxx7TM6k4ciVdDwT+UUa?=
 =?iso-8859-1?Q?Sw6jqmoS1S/AB5cI915hWkpiK8IVWv0zjN3BrR+E+FbKIpukiTy9Wmd1Xd?=
 =?iso-8859-1?Q?TLqPhlUtIMO14St/B/2wxYBhDwPR7cKxkFV55WCMMjDtvibzAHMZXYS3Ww?=
 =?iso-8859-1?Q?7leX?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR17MB3375.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bba2e635-6bb2-4af6-be11-08db0d85b4a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 05:46:51.5135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR17MB5946
Message-ID-Hash: 36W3KCG4I5NX3BOAGYMFPMQAA7EXIEQW
X-Message-ID-Hash: 36W3KCG4I5NX3BOAGYMFPMQAA7EXIEQW
X-MailFrom: Vebpe@outlook.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LR6WDOBE35GSQFZ4EH4DOEFZECLDYQN2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Yeah
________________________________
From: Vanessa Page
Sent: Sunday, February 12, 2023 5:54 AM
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>; Rob Landley <=
rob@landley.net>; Randy Dunlap <rdunlap@infradead.org>; Christoph Hellwig <=
hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.o=
rg>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundat=
ion.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bing=
ham <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven <geert+re=
nesas@glider.be>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.or=
g>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>; device=
tree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arch@vger.kernel.o=
rg <linux-arch@vger.kernel.org>; dmaengine@vger.kernel.org <dmaengine@vger.=
kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.o=
rg>; linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>;=
 linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; linux-input@vger.ke=
rnel.org <linux-input@vger.kernel.org>; linux-media@vger.kernel.org <linux-=
media@vger.kernel.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.or=
g>; linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>; netdev@v=
ger.kernel.org <netdev@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-=
gpio@vger.kernel.org>; linux-rtc@vger.kernel.org <linux-rtc@vger.kernel.org=
>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-serial@vger=
.kernel.org <linux-serial@vger.kernel.org>; linux-usb@vger.kernel.org <linu=
x-usb@vger.kernel.org>; linux-fbdev@vger.kernel.org <linux-fbdev@vger.kerne=
l.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sh=
@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh

DUMB ASS you commit crimes just so people can have jobs
________________________________
From: Vanessa Page <Vebpe@outlook.com>
Sent: Sunday, February 12, 2023 5:51 AM
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>; Rob Landley <=
rob@landley.net>; Randy Dunlap <rdunlap@infradead.org>; Christoph Hellwig <=
hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.o=
rg>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundat=
ion.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bing=
ham <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven <geert+re=
nesas@glider.be>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.or=
g>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>; device=
tree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arch@vger.kernel.o=
rg <linux-arch@vger.kernel.org>; dmaengine@vger.kernel.org <dmaengine@vger.=
kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.o=
rg>; linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>;=
 linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; linux-input@vger.ke=
rnel.org <linux-input@vger.kernel.org>; linux-media@vger.kernel.org <linux-=
media@vger.kernel.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.or=
g>; linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>; netdev@v=
ger.kernel.org <netdev@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-=
gpio@vger.kernel.org>; linux-rtc@vger.kernel.org <linux-rtc@vger.kernel.org=
>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-serial@vger=
.kernel.org <linux-serial@vger.kernel.org>; linux-usb@vger.kernel.org <linu=
x-usb@vger.kernel.org>; linux-fbdev@vger.kernel.org <linux-fbdev@vger.kerne=
l.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sh=
@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh

Emmmmm maybe y'all stupid asses have been reported now you little sick havi=
ng dipshit.


________________________________
From: Vanessa Page <Vebpe@outlook.com>
Sent: Sunday, February 12, 2023 5:21 AM
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>; Rob Landley <=
rob@landley.net>; Randy Dunlap <rdunlap@infradead.org>; Christoph Hellwig <=
hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.o=
rg>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundat=
ion.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bing=
ham <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven <geert+re=
nesas@glider.be>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.or=
g>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>; device=
tree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arch@vger.kernel.o=
rg <linux-arch@vger.kernel.org>; dmaengine@vger.kernel.org <dmaengine@vger.=
kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.o=
rg>; linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>;=
 linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; linux-input@vger.ke=
rnel.org <linux-input@vger.kernel.org>; linux-media@vger.kernel.org <linux-=
media@vger.kernel.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.or=
g>; linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>; netdev@v=
ger.kernel.org <netdev@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-=
gpio@vger.kernel.org>; linux-rtc@vger.kernel.org <linux-rtc@vger.kernel.org=
>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-serial@vger=
.kernel.org <linux-serial@vger.kernel.org>; linux-usb@vger.kernel.org <linu=
x-usb@vger.kernel.org>; linux-fbdev@vger.kernel.org <linux-fbdev@vger.kerne=
l.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sh=
@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh


Take a pole and shove it up your ass then remove it and shove it down your =
throat.

So you Taste the bullshit that comes out of your mouth literally.
________________________________
From: Vanessa Page
Sent: Sunday, February 12, 2023 5:18 AM
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>; Rob Landley <=
rob@landley.net>; Randy Dunlap <rdunlap@infradead.org>; Christoph Hellwig <=
hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.o=
rg>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundat=
ion.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bing=
ham <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven <geert+re=
nesas@glider.be>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.or=
g>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>; device=
tree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arch@vger.kernel.o=
rg <linux-arch@vger.kernel.org>; dmaengine@vger.kernel.org <dmaengine@vger.=
kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.o=
rg>; linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>;=
 linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; linux-input@vger.ke=
rnel.org <linux-input@vger.kernel.org>; linux-media@vger.kernel.org <linux-=
media@vger.kernel.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.or=
g>; linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>; netdev@v=
ger.kernel.org <netdev@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-=
gpio@vger.kernel.org>; linux-rtc@vger.kernel.org <linux-rtc@vger.kernel.org=
>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-serial@vger=
.kernel.org <linux-serial@vger.kernel.org>; linux-usb@vger.kernel.org <linu=
x-usb@vger.kernel.org>; linux-fbdev@vger.kernel.org <linux-fbdev@vger.kerne=
l.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sh=
@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh

You live for people to report you go ahead and keep emailing you degenerate=
 dumb ass
________________________________
From: Vanessa Page
Sent: Sunday, February 12, 2023 5:13 AM
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>; Rob Landley <=
rob@landley.net>; Randy Dunlap <rdunlap@infradead.org>; Christoph Hellwig <=
hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.o=
rg>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundat=
ion.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bing=
ham <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven <geert+re=
nesas@glider.be>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.or=
g>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>; device=
tree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arch@vger.kernel.o=
rg <linux-arch@vger.kernel.org>; dmaengine@vger.kernel.org <dmaengine@vger.=
kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.o=
rg>; linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>;=
 linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; linux-input@vger.ke=
rnel.org <linux-input@vger.kernel.org>; linux-media@vger.kernel.org <linux-=
media@vger.kernel.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.or=
g>; linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>; netdev@v=
ger.kernel.org <netdev@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-=
gpio@vger.kernel.org>; linux-rtc@vger.kernel.org <linux-rtc@vger.kernel.org=
>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-serial@vger=
.kernel.org <linux-serial@vger.kernel.org>; linux-usb@vger.kernel.org <linu=
x-usb@vger.kernel.org>; linux-fbdev@vger.kernel.org <linux-fbdev@vger.kerne=
l.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sh=
@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh

Dumb child ass idiot
________________________________
From: Vanessa Page
Sent: Sunday, February 12, 2023 5:13 AM
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>; Rob Landley <=
rob@landley.net>; Randy Dunlap <rdunlap@infradead.org>; Christoph Hellwig <=
hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.o=
rg>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundat=
ion.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bing=
ham <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven <geert+re=
nesas@glider.be>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.or=
g>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>; device=
tree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arch@vger.kernel.o=
rg <linux-arch@vger.kernel.org>; dmaengine@vger.kernel.org <dmaengine@vger.=
kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.o=
rg>; linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>;=
 linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; linux-input@vger.ke=
rnel.org <linux-input@vger.kernel.org>; linux-media@vger.kernel.org <linux-=
media@vger.kernel.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.or=
g>; linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>; netdev@v=
ger.kernel.org <netdev@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-=
gpio@vger.kernel.org>; linux-rtc@vger.kernel.org <linux-rtc@vger.kernel.org=
>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-serial@vger=
.kernel.org <linux-serial@vger.kernel.org>; linux-usb@vger.kernel.org <linu=
x-usb@vger.kernel.org>; linux-fbdev@vger.kernel.org <linux-fbdev@vger.kerne=
l.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sh=
@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh

http://www.infradead.org/recruitment.html
________________________________
From: linux-mtd <linux-mtd-bounces@lists.infradead.org> on behalf of John P=
aul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Sent: Thursday, February 9, 2023 4:15 AM
To: Rob Landley <rob@landley.net>; Randy Dunlap <rdunlap@infradead.org>; Ch=
ristoph Hellwig <hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.o=
rg>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundat=
ion.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bing=
ham <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven <geert+re=
nesas@glider.be>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.or=
g>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>; device=
tree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arch@vger.kernel.o=
rg <linux-arch@vger.kernel.org>; dmaengine@vger.kernel.org <dmaengine@vger.=
kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.o=
rg>; linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>;=
 linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; linux-input@vger.ke=
rnel.org <linux-input@vger.kernel.org>; linux-media@vger.kernel.org <linux-=
media@vger.kernel.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.or=
g>; linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>; netdev@v=
ger.kernel.org <netdev@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-=
gpio@vger.kernel.org>; linux-rtc@vger.kernel.org <linux-rtc@vger.kernel.org=
>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-serial@vger=
.kernel.org <linux-serial@vger.kernel.org>; linux-usb@vger.kernel.org <linu=
x-usb@vger.kernel.org>; linux-fbdev@vger.kernel.org <linux-fbdev@vger.kerne=
l.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sh=
@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh

On Wed, 2023-02-08 at 21:09 -0600, Rob Landley wrote:
> > Geert has suggested to wait with adding a tree source to the entry unti=
l I get my
> > own kernel.org account. I have enough GPG signatures from multiple kern=
el developers
> > on my GPG key, so I think it shouldn't be too difficult to qualify for =
an account.
>
> So you're not planning to use https://lk.j-core.org/J-Core-Developers/sh-=
linux
> but push to kernel.org and ask Linus to pull from there?

Yes, that's what Geert recommended.

Adrian

--
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546<tel:2956%209546>  0006 7426<tel:0006%=
207426> 3B37 F5B5 F913

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
