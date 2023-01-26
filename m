Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C9867C25E
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 02:29:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBFFF204;
	Thu, 26 Jan 2023 02:29:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBFFF204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674696594;
	bh=f9/jkaWLmkHjZ6y1p97qwnljsPOmqwlcYstGmKzd2HU=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=N5tjKpDhSKphDOQ3TZQ7Ck4bjNSZMrXAzP92pcpuIgCac+bMVkBOQQkH0NvuNjXtr
	 cuIL3q4iJ2pdu4sAiesuh8oUWBPDcM45hP3IO61/S925tO23r20uS1hm67hCSrpj2V
	 QVu6v2yYXdmC9emhalp5J6Hszm1o1YtHtHY1wvy0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A0BDF800AE;
	Thu, 26 Jan 2023 02:28:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55E10F80424; Thu, 26 Jan 2023 02:28:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2070.outbound.protection.outlook.com [40.107.215.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41A36F80163
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 02:28:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41A36F80163
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+1wHEaEHDzZqBL+ZAF1b0xPr9w0NJ8yvK8Wvk2Xuak+njWVdomS42Nq+ImSO9EIJiKBD84mmY3OlvHCDI6vaN4QEwFru9xVIJRlo9BgEs9Qm9wrs+gnFiYqydShREGshsQamY2rfvkZEvPwB8jUVo1cHZ9pJpWP+fhpfta6d1sNHUSzPZ2UNltn5mqdSYboZ/03lAVFGTxaW9CUHYt9lnvQRekOpl0xYGJfuEL2P+UjjkKfY40iKdFtfSG4GR0fAnQKfasIfbknvjCTFj2LG6F4E62fDaj1OUnBkAOVgVI1f15fd2mHKgYl62psYtzIljlxy2gcFnVSgMmAO5IwIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGxukbtJC2EepoK9mdEcuV45hMVMrBN+sRyZZvSCLDg=;
 b=njIjAM0mnHEN6XINKovUBbGSS8fsx7OlYwKiDbV5v4sVxVMbOdHpRd0+a2nWdSRYB9M0rlEJ+VPLT3H1yMF95Who36gMfVq0rxOsE0RH1qeo7RjmOLZ8Uo8iNFFe5dc+3CVonTSmSGT/K+q+Ee8Vg7TRZ8HLTv5r3GkxXFtbMkp/taRQgVvYR0fldkXjYJR86GSH1rBRzcTV4txd/jKrRxH6N055iSFPmrUCuNs763mwzMy9fzckfg/D9TDPx6ERxbKcTCouynoMxIPDPCcVcDdeAnSRAlKW5JaXXfsnoBIFXwo7eKzwC300GpHYCMZ6bD3H04UdufJCnqPoohQBDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PS2P216MB0740.KORP216.PROD.OUTLOOK.COM (2603:1096:300:1b::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.17; Thu, 26 Jan 2023 01:28:33 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.6043.021; Thu, 26 Jan 2023
 01:28:33 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/2] ASoC: sma1303: Add driver for Iron Device SMA1303
 Amp
Thread-Topic: [PATCH v2 1/2] ASoC: sma1303: Add driver for Iron Device SMA1303
 Amp
Thread-Index: AQHZJArIVEzVfU9li06XNzQ4m2TLv66cgOuAgAiI19CAAJ+TAIAIzROAgACmx4CAAOW90A==
Date: Thu, 26 Jan 2023 01:28:32 +0000
Message-ID: <SLXP216MB0077D804A2DBDA92B884C4048CCF9@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
References: <20230109091402.11790-3-kiseok.jo@irondevice.com>
 <Y8F5+7vgl+f9rytb@sirena.org.uk>
 <SLXP216MB0077F86978B363B5F4ECEBC78CC49@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
 <Y8konjHXimUfm4NH@sirena.org.uk>
 <SLXP216MB007747CCA6C43D139712535C8CCE9@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
 <Y9EWif///aqn6MiS@sirena.org.uk>
In-Reply-To: <Y9EWif///aqn6MiS@sirena.org.uk>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB0077:EE_|PS2P216MB0740:EE_
x-ms-office365-filtering-correlation-id: aa9351fe-10bc-4e64-e07f-08daff3ca360
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /p0F9Um4Cn2NMIAhIjGFhyULDknBkfh5UQGbPU9p6yRdT02F2QPwC17QmWJ9j171fJnyetY/+VPL2cBn4RUfY0b2LmcgUsEVW+J0HXx/hm90HWD+lmq6l/SK2BjGER86rNPHujjv0pgPP8TTlJV9YyqPCWDXH5flEiYF11zWOrRBOY/WIWQsd9yxAwGqInMBknAGX9+OBmph26ya38Oyp5y/AGPAaIC9CoJ1lWY+GDn7Z5ySlQYsEHKx7XmnpmgkeJUIXI8zX00Myqda0qxTSjGOwwAZwfGZ64E0nwXaBBglWMMjMXaq8nhtByKU4CQy63RvAleDhWrK+5zToW9RfzhPdd6Z+hLTxqfEWdPZV/rDlwUR09rJlEusV8V7U4ZnvU5lDbe9JBd5uotzk26+UB1+3TWDJOqg1Qtj3c0KCnyke53E3af1b/zYhiw0Kt5vGEUObXCBcIklI1ZC+zkOHqoxNMk0dXsNIAv1SrWXP3DjLqjklWvAfll5uw7HYpAyhQk3awpukSH1Kf4p9HR/RKC2dgWAFzNjdwhqCnloHdK/0VLH3oW4nkItMUNn55Hvxlll+8f5D+5Nid5Bh3UTD2OZ/51VRe6/Q+6QdnKRl1VewfRMm7zgDXMQomqISTmoKEnKhGiaAlaDaVQg/NlI89tdvDQc9Ml/H0V30l5n6tRmAyew6Cg+3XXduZ2gAk2Eii92bqRVNrJ+BCzzP3Is5g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(39840400004)(346002)(136003)(376002)(396003)(451199018)(52536014)(8936002)(2906002)(478600001)(55016003)(5660300002)(33656002)(316002)(6916009)(6506007)(38070700005)(66946007)(76116006)(86362001)(99936003)(4326008)(8676002)(66446008)(41300700001)(38100700002)(122000001)(54906003)(71200400001)(9686003)(7696005)(186003)(107886003)(26005)(83380400001)(64756008)(66476007)(66556008)(66899018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DN+AWghWdh5YjLRXfS6+glHibZ6RyN8a40HioWtFuU3Hmffo3As9jlJUiggf?=
 =?us-ascii?Q?wdbrTm2miXh5dFP54vmR89gWiLE9GUw0uMf+bf4pt6+w5H4TJADAuI9JAKfd?=
 =?us-ascii?Q?+hRR9uTKw7Wnw0U5ebv4tEaLPJmLunnlRQ3p+vfNv5df/0e8T6vKjlWOLXL5?=
 =?us-ascii?Q?rIHLtFHdrWwLsYOLRYdKMamxR3sP9uKwRqprOdODja+JZlEsfAc3WOmgzbNQ?=
 =?us-ascii?Q?yX3+t9ybdMi8T/lxK00ieD9DOVSLjqvluLBgcpdns4EIelPaD5j08BWH4EAV?=
 =?us-ascii?Q?JCseLUpULeekoRJahF0YiaSwc1wX+BxxvNBOnBoGKqicjYBp8/Jd85fiH8ns?=
 =?us-ascii?Q?e8obGTS3oURHoNelLL11Mm18Lr7Ws1RdBueg4+bOf0MTYGBjoznaLB9J1UmI?=
 =?us-ascii?Q?iZO9Uey3o6UQVRy4pvvOo+RYr/OKhO+h/J21Y0J2mWCY6c68Cl9hyAb24t/a?=
 =?us-ascii?Q?36+N1snPtJVw+Zv/g8LusL6e82DeQifC9wfj1wI4NlptFVqfQ7hHki5HXIEf?=
 =?us-ascii?Q?MfBIJWZ5+hitp7D7l4x5hZWut7NhMEY7WEfYeL+4Hh59zMG7L7vzzbL4CC4d?=
 =?us-ascii?Q?V81pBVHBPls5GhtkyusaXJEQ1HmWmIMHxpZq4ea00AzT37zbzJ3S+FuiJRSC?=
 =?us-ascii?Q?g6xDskSiwF/JzyYl3sZjMdqlaWIXRxSb5fCBpXfu+H3Lmc+yP27UIi6stwFR?=
 =?us-ascii?Q?eTuOpzgbkBLbk9q33BnOLObdS11UARgUsnhbVgG5nk0ZiB2ZEGmdEG8XPtYK?=
 =?us-ascii?Q?fbwqj28qvq+U97brt4UajScByak2EUHOlvVCGRm2MiBTf2Fx9kOCAlwpnGmz?=
 =?us-ascii?Q?kTL//SFccjFKArJClbld1+rL4mCkudEBpAsGaagorpzkZlUoW8mSgPX5b3Bi?=
 =?us-ascii?Q?wvVp9o4eOAh9GTZWWqxNlryKNG94NFS+FbeY7dS+hfPrG62e+uMP09EoaICu?=
 =?us-ascii?Q?YhyqmNiII4Fwaj5QrE/sgZXQQZu3rS5ejzAQVZKw2d5HIRkqKcNwG3itz4bY?=
 =?us-ascii?Q?rNfwuZ9QwfEtYZiBQSqcIPJbjaMSrQa5k93+nq7IrWtX5bfgBt9/g/9FCCj7?=
 =?us-ascii?Q?qstr2hMcVsz/T7P9fFjwdQiqZI2Y1n0LTMMerZVz7U0hvMc3sXQ9/74CsWjg?=
 =?us-ascii?Q?EHbzb1KvREsPyA5/C61pC8jKuWcUP4RIsK2fWOlXdzHjOkouFNTBuYaP610o?=
 =?us-ascii?Q?A/NeA23MxhfnUSPGPFpypzqmgJR5S38psw+oh+s56V8f+1fkLgx3zkzZKRVV?=
 =?us-ascii?Q?1c2/S3T2J97dRVjfEyb9YoeyrLk/8QKk+eie9gENOYd6pzSFXCRUC+wSfQkO?=
 =?us-ascii?Q?aIA1OcBUSlekjttP33mWQc3DezcSDWif/LNhXRFrp6f3Pgua8/ltayicwjeU?=
 =?us-ascii?Q?oyLXxgsrnxvlTY9/MHFKfBrUuJmOtM8WAS+Zod6Y9+SESpQDjjxUiyRGL9dz?=
 =?us-ascii?Q?1M4CU0SuXDONqbDEYB2c/wB84jGJ2Dw1Yd1zkGohZHXMR5/ENkugtDwr6D3i?=
 =?us-ascii?Q?K3BqqhTSrYo1MLJvTW4By0FKGWaGOvHTXoaK/hYzl/g9yLcgBj17oNiZziSo?=
 =?us-ascii?Q?4DFyeIQnQrl1RgH+e6ddxhwkpDZsXd0yfssoP33N?=
Content-Type: multipart/mixed;
 boundary="_002_SLXP216MB0077D804A2DBDA92B884C4048CCF9SLXP216MB0077KORP_"
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9351fe-10bc-4e64-e07f-08daff3ca360
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2023 01:28:33.0033 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qTWn7u5miebzMLB3xXulCVeHOb4lTzBBjK28LTJLLe2WNqv7VsPuzUUngPPz53PIuR/57RxfjS1E9HPAaNhVOI8T0IgGgo0/B8y0Y5Npujw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB0740
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Application <application@irondevice.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--_002_SLXP216MB0077D804A2DBDA92B884C4048CCF9SLXP216MB0077KORP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> > > > > > +	cancel_delayed_work_sync(&sma1303->check_fault_work);
>=20
> > > > > > +	msleep(55);
>=20
> > > > > That sleep looks odd - what are we delaying after?
>=20
> > > > It need for IC(Amp) issue.
>=20
> > > Right, but what is the issue?  It's not clear what event we're
> > > delaying for so it's not clear it'll work properly.
>=20
> > This device requires a delay from mute to power off. If it is turned
> > off while the signal is coming out, it takes some time to become
> > muted. (need to about 50ms). So, this delay is required to turn off
> > the power after completely muting. If the time is too long, we can
> > reduce the delay a bit.
>=20
> This at the very least needs a comment since it's not clear how someone
> would work that out from the code, there's no connection here to the mute
> operation so someone might just remove the delay.  It may even be that th=
is
> is happening well over 55ms after the mute happened.  The ideal thing wou=
ld
> be to track the time from the last mute, the regulator core does somethin=
g
> along those lines with off_on_delay.

Currently mute control is registered in mute_stream function in dai operati=
ons. After that, amp shutdown is performed in DAPM PRE_PMD. Since a 55 ms d=
elay was required in the meantime, it seems correct to change the position =
of the delay like you said. I will also include a comment about delay. Plea=
se reply if there is any problem.

> Please fix your mail client to word wrap within paragraphs at something
> substantially less than 80 columns.  Doing this makes your messages much
> easier to read and reply to.

Thanks, I fixed the mail setting.

--_002_SLXP216MB0077D804A2DBDA92B884C4048CCF9SLXP216MB0077KORP_
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: signature.asc
Content-Disposition: attachment; filename="signature.asc"; size=499;
	creation-date="Thu, 26 Jan 2023 01:28:32 GMT";
	modification-date="Thu, 26 Jan 2023 01:28:32 GMT"
Content-Transfer-Encoding: base64

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NCg0KaVFFekJBQUJDZ0FkRmlFRXJlWm9xbWRY
R0xXZjRwL3FKTmFMY2wxVWg5QUZBbVBSRm9rQUNna1FKTmFMY2wxVQ0KaDlBTjhBZi9hMFF1ZWVL
QnUwQ0VMejFtcWVLTXVPcFVZZmhPMFpEbCtvdlliZkk5eDZGMitBbnhJTlhDakszZQ0KQ2xMcFNZ
cXA1OWJQMm14OUMySmNNaEttUFZHcXI5Z3BTaXZBODlmZU5MZkIzL3RNSVM0UjU5aW9BRXhMRzIr
SQ0KMVZUenk3cU1XSEtEbkJnblFDVEtBNkVTYjA0UGUydWhNcEhacGVxNjJTanFXcnE0cmhYOFRV
bjY5YUI4K2hjeQ0KNlhzNjlxcUQ5cTBvRWFjZnhwcDVoMG5kTmVtSGIwTjI0c0F2ZjluVmNnSzdQ
N3lWRStvUXN6THV2anBBaHhhYg0KTXRBSnpIU1hWQ1MydlZzbURyS0JXbE5aalJyRjVNWk1HZXBE
ZzZkUUdObzQ2OUowNHNYME52djd2K0UwTnpIMw0KeHc2c3RoN0FQR3ZoMEdaaS9WeFkvVjJPejVp
WU5nPT0NCj1mdHZTDQotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0NCg==

--_002_SLXP216MB0077D804A2DBDA92B884C4048CCF9SLXP216MB0077KORP_--
