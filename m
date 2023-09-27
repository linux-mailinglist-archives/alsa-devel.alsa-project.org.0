Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 005A77B3F11
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:12:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A8A31497;
	Sat, 30 Sep 2023 10:12:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A8A31497
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061573;
	bh=u7lcLTLeQSvNmpNELUNSAJ4u51HtuG/gmWbhu6hLq68=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m8yDPVZwtkb1dijqPBy+BTESvPat6GcApPKeooJMknqe7dVEaEt0zG1toiHbwLux4
	 5I+4bfrAlLsdHBS9iTJmchekhYGzvkpNUgM1eup7Rgu8+syCU88Ug/pkGExUhsXoag
	 v76yF2oI5u9NpHdwhAW5e5vdCg2UtlHOpXi60TSk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28751F805C1; Sat, 30 Sep 2023 10:09:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CB1CF805A9;
	Sat, 30 Sep 2023 10:09:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 583F2F8016A; Wed, 27 Sep 2023 21:42:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2071e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::71e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9AE7FF80130
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 21:42:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AE7FF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=catalina.com header.i=@catalina.com header.a=rsa-sha256
 header.s=selector2 header.b=s/COONZ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JluHtgMGHDe4bTY3ApSYA+KPCZsZUoFzpQ+tX9gDIDwW0U0auqshCHSoi6AU7mjHgn95IIcsRrSAG6t7y4kciBDg08nSvC/s/oEnmGFa170u+cQZfPQAOi3z2cCVXw/mxO3TajYr5kVgsTDnrE7gzOdsPyCs6m71u9qKt6O45Oupcg5HaqeoksTzdnNkZqTRgtvDE6aNUgsRHRGzH7rtL23mAyusTV3dRDXluVSl5HNWB9e1hSn/8z9cv399G4QySgEvlBNjwKFydsUMUT+FlUvdGxFGpAUuW+90JBd3UDNy3Bm+au0Xp5O+XW7iIAodpvSdr0OygZ6pq87AlScUHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smggSEslaszTtFJb0j2WwjDP7iq8BGWbMTep/JPJaWI=;
 b=cyptajcQadBodrdW84+1Ton4cKj7cChY322qj4OasqntLKr7wbMmEEMafbU1H5Fa+BpHffLJKY+74RT4891I0D24OH/eGESArpJNivOw/HYUkIDSDWpb1aPUe43Rn3JS7RvxTYQOQDAwChrLpf4+h5T9ayHyJtUCCCzIVOPH4XCOTDyeynEScPBNpND5mCpjagAdgumdLvuSMqsg/TLfwFQVVoJLlZOpLLHF7hdq21XsUDj7qT7IcaV8ox4vjRKaQxyDtO4PrLv3JecJInsDiSa+lyep9QnqAzouIKtAyEdEQhMFcB5f6QQ/idEXbyjgDnx+9DffF86deHCvASW1Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=catalina.com; dmarc=pass action=none header.from=catalina.com;
 dkim=pass header.d=catalina.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalina.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smggSEslaszTtFJb0j2WwjDP7iq8BGWbMTep/JPJaWI=;
 b=s/COONZ9RkwAju1fQqSON5YjQPlDFHv6YdNf1hQmDkDXQg9iuzpp8Z7d9QDTnG61BseHlnF4aoZB2LDSEkQzOoJ+3K8LkKZlC2u2+8UoWdG44mFW1LAVquyBdhxmbIe8IPkVx1Uq8GZBX9x9llrBjwbbampxG45HhMmc2zSAbjRvNEHecpXOni1pkqmrId/RkJFQhWrM0m3Uw7/KJJXAlqDt/WNHAjvv49iwlOnmb3JMDKuldN91Bb0p+gcbT1G1Q2qhRocPtvbW9C4dC0R4d/CEuVwHIrUyHZZgbuxBll64cuo83VHIy4DPDOVAuCW2UeVoOhhIbzAZ9WIB/VP9bA==
Received: from BN0PR02MB8045.namprd02.prod.outlook.com (2603:10b6:408:16d::23)
 by SN4PR0201MB8774.namprd02.prod.outlook.com (2603:10b6:806:201::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 19:42:03 +0000
Received: from BN0PR02MB8045.namprd02.prod.outlook.com
 ([fe80::c299:5e12:81ba:6b8]) by BN0PR02MB8045.namprd02.prod.outlook.com
 ([fe80::c299:5e12:81ba:6b8%6]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 19:42:03 +0000
From: Terry Hummel <Terry.Hummel@catalina.com>
To: Jaroslav Kysela <perex@perex.cz>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>
CC: Dulani McLaurin <Dulani.McLaurin@catalina.com>
Subject: Re: Bug Report: Audio issues with CentOS7
Thread-Topic: Bug Report: Audio issues with CentOS7
Thread-Index: 
 AQHZ3zuyVOwv+LHOWkuu6+CmLUIUyLAL1gOAgABkb/WAAAqSgIAAAIjLgAnHAsGAGSiCpw==
Date: Wed, 27 Sep 2023 19:42:02 +0000
Message-ID: 
 <BN0PR02MB80452C633CC1051952559BD2FAC2A@BN0PR02MB8045.namprd02.prod.outlook.com>
References: 
 <BN0PR02MB80455425D6077DEC556A4F83FAE9A@BN0PR02MB8045.namprd02.prod.outlook.com>
 <20945414-c6c0-acf7-8340-9e7697b0e833@perex.cz>
 <BN0PR02MB8045C507932EEDF72FB62783FAE8A@BN0PR02MB8045.namprd02.prod.outlook.com>
 <62624a24-67a9-bebc-b704-ad3df2cf1da5@perex.cz>
 <BN0PR02MB804509BCA42A091EE530A553FAE8A@BN0PR02MB8045.namprd02.prod.outlook.com>
 <BN0PR02MB8045F24D2428321D1872C51EFAF2A@BN0PR02MB8045.namprd02.prod.outlook.com>
In-Reply-To: 
 <BN0PR02MB8045F24D2428321D1872C51EFAF2A@BN0PR02MB8045.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=catalina.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8045:EE_|SN4PR0201MB8774:EE_
x-ms-office365-filtering-correlation-id: 5078a2f4-fe57-4995-3d6c-08dbbf91d2c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gIIWxcrBmMzOrmE06f7mqCDlT3iOPMGSrqUJyOagLyIDuLa/b0GCSjJkJCuoHg4UFkXZjqwn42jc2UMEzU1NaLZLdrH1Bc4Pgq+ivrOyhLZRvEcds7ElVUe6KwR6FAszu3yaQmOflKHSZhS/06DdA/2qfoOQxW33UQjWAQBa1kEKow6+UGoY6Y+R8L1yEQRhbYmY8C3XQq0L8WN1W/MLBHNP11D7A4ekqS/5/mpi6d3lka+Idw+I/Ep+E7kcyCW/zwMZJjhTo6y/7zp8WmS88S66AIpNCuggwaFOCqIUC3/J/RfYXdQ/A+DTYPFWeuBUaO+K3PqYZLV6E4Me+F2vYYxGc5R4DnRLu3VpuEfNjULDQYmZa3MiiiYt16Luo3uJQic0B014kJ3U/Lgo48kNncsILGdwUDgGprsylzhDwdPKVcyRcTPlrVu7MR2xitKQrZCBxItNV9cm7bjSWrFAJmh2sCpFOUej8ID3/cOhz6c0x1wXqyX4ikqml6ckum722OnzNUAslmNLAwlhpSGB2wLGfSgSnPqB24oVcqBvnkbdAGFa/LWXKhc0T3MRYho12QM/yyhYnmN2nzNgByd5LbMYzDS/J4qWF8D7KkMvw1H7fvj3qko2s0nktsk/ndewq68sbPuse4Gsi4f9GWjZ+w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR02MB8045.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(39860400002)(346002)(376002)(230922051799003)(1800799009)(451199024)(186009)(107886003)(26005)(7696005)(53546011)(6506007)(9686003)(122000001)(2013699003)(166002)(86362001)(38070700005)(38100700002)(55016003)(33656002)(64756008)(83380400001)(316002)(66446008)(8936002)(4326008)(52536014)(66556008)(66476007)(8676002)(66946007)(110136005)(76116006)(5660300002)(41300700001)(19627405001)(2906002)(71200400001)(478600001)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?t758gNE7tD+K/ScqtcDXQDMX85hTWSgGetEjN6XFmuVz8VqQQAgJkd61j1u6?=
 =?us-ascii?Q?BprVkbbpQBEPpDh04xQ8t4fWufJezBfDDeJgGcAjAkNP9/508/cFE4UoZfYf?=
 =?us-ascii?Q?XkC9F0YpQuu80JS5hvpSdKVvDcWdSajVdAlxwV7nQLuatCEhfmJsFTfCuW9z?=
 =?us-ascii?Q?cAOHh22yAxIQ5ielZBYobth2TvCmK8TdaTYXKdCwQ6TntKFhehobr53J+Mfb?=
 =?us-ascii?Q?hoXYO7f0fBT+T5iB6UQaT9vmguB9SU3mccON30ATABDVIr1IHlNQVuP2P2Kt?=
 =?us-ascii?Q?vRYnDFEyQqBP39OxeFGv1cmFRCS52FPzY0QyUvQtj8oXD+YsPSQwkgJG2wdF?=
 =?us-ascii?Q?zpIWwJmsuSymld///H7rTf1UQ71DnSVHM0tDzrTCnGSxT7Dd5N9eIKKgoZSV?=
 =?us-ascii?Q?RCVAbNY8nB1dJ2+jcA+MuPm27DATR/n2/NyzPSaEmQgQIfeAoWpUiNBgjrIw?=
 =?us-ascii?Q?vo+xp8GnUqPaQKfuKQoqO4sIKO7rOpWbjyKNk4QsFp38dEXefXa7RVXfsn0L?=
 =?us-ascii?Q?eaankBPnIPHMCasUjr4noHRUwLegxtg/xe17M8Hd+VxFYLs5UpCLFs4VtNBr?=
 =?us-ascii?Q?iUikj8M5Em37aA5ejHxIR8DV3j+PkX/N+XrsuxY06fvRLAYkvjYfSdSUwb46?=
 =?us-ascii?Q?OPImO5maYSyjYZjlzyBPLfAi4fCNgKJK+dFh2k2Xma38NlYWDcmGA7vchpEM?=
 =?us-ascii?Q?TMiXHZjgyCZoKhNFneLWAhUqKzjOJjooUDhh+/PnIzUNbjRI2ZpfdbYw0nTy?=
 =?us-ascii?Q?RmRKQlUjvWu8Q7JOzo/7trZMPInmfZMecCb5xguuAoJx8lpzFx0BUVd0VsMx?=
 =?us-ascii?Q?mweTvaQGk9tdxZEa/fRCdAkp+9JM7T4Ht4C7WH1se+izrkrZNHccoPPPU2Mf?=
 =?us-ascii?Q?W7g8Z57eRrg/JjsBFAZBfImc3MEXgMz2Qt8QnLEmnumTfPu0IbO5A6iZwz6W?=
 =?us-ascii?Q?8VrzYiOc6EIAxJdhgIp2Nge/o55682jOh1l9IdyIkp8hYajasJUHedBMwLuC?=
 =?us-ascii?Q?GqLKtNCr5jgshGky5WwwB0sUkvlCwYcU2gu2O8IxkMR20AQr7zwmouAEplE1?=
 =?us-ascii?Q?gZuMTVeDE6dfA4GriIK2kRTADeOSaxIZW9fiIwzSagD//+kXFl7vbcWS0fRC?=
 =?us-ascii?Q?8HtYB9E35y1AVQE9ls5xiygc8I0UYwFQGOXZMNPo6n21YinIbRzYbPa3C11X?=
 =?us-ascii?Q?JCiHmjkRN8Qkv+LwoPVoerlS2oHwdlMbbRG/V7HFDpV03b1+mH8N+fNF5jZm?=
 =?us-ascii?Q?smqRjD3A31HS2KzuscBUrolOKKo+YG5QIuc73jrqvq/SZCwPbgCP4xSvM3Sx?=
 =?us-ascii?Q?/f78QtZgOIWmbEDlRFibRKSeDH++dt3edPJtTUmQASiTaMm5GyI8mnWDcsFG?=
 =?us-ascii?Q?ncd2QHWwskNMWKrNvCBOlhBakrXVETmil51zSs7roQLrolB5rH4MS3V8NFt2?=
 =?us-ascii?Q?2GyWCOv/a66NfVmUFJEuNMfW3zmYqkJQuoORy1iq+7mtWMMbiioPwQx3cj/C?=
 =?us-ascii?Q?djgzMU1Hug+n9xrWRvDTXx5nx3uR4UGQJqOSjlWy3MZEiUZByqHMNfK5/UqI?=
 =?us-ascii?Q?cmoHDH/2eYeflI8apZQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: catalina.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8045.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5078a2f4-fe57-4995-3d6c-08dbbf91d2c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 19:42:03.0015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2eddc39c-2996-4c2a-ab97-f767c39ea155
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 fcmnJeAsqrSPoJvKWjUHqs/h92pmnjz/k3BUehg/xM5A8RGQWJJ1WqNfLSNAcr9TBhEqT0o9tfh7OeBtSw6LLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB8774
X-MailFrom: Terry.Hummel@catalina.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: EO5ICPM5FBSSF2YDKTXYYGEGOTX3KRDA
X-Message-ID-Hash: EO5ICPM5FBSSF2YDKTXYYGEGOTX3KRDA
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:09:27 +0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XSGBOVNAU7AAGS3FTI2ZJ4FYMGCMTDNT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Jaroslav.

I was curious if you had a chance to look at the alsa-info report I sent and was wondering what your thoughts are.

Do you think this wouldn't be an issue with more recent versions of CentOS?

Thanks for your time.

Terry
________________________________
From: Terry Hummel <Terry.Hummel@catalina.com>
Sent: Monday, September 11, 2023 3:28 PM
To: Jaroslav Kysela <perex@perex.cz>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>
Cc: Dulani McLaurin <Dulani.McLaurin@catalina.com>
Subject: Re: Bug Report: Audio issues with CentOS7

Hello Jaroslav.

I didn't have success getting the speakers to work with alsa-mixer. So, I ran alsa-info.sh as you suggested. This is the URL where the text file is located:

URL: http://alsa-project.org/db/?f=e1111847b82553f2dbd6015a36334f74b4402024<http://www.alsa-project.org/db/?f=e1111847b82553f2dbd6015a36334f74b4402024>

Thanks,
Terry

________________________________
From: Terry Hummel <Terry.Hummel@catalina.com>
Sent: Tuesday, September 5, 2023 10:08 AM
To: Jaroslav Kysela <perex@perex.cz>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>
Cc: Dulani McLaurin <Dulani.McLaurin@catalina.com>
Subject: Re: Bug Report: Audio issues with CentOS7

Ok. I'll give that a try. The CentOS7 image we have on these systems is minimal and the alsamixer module is not installed.

I'll get it loaded and run the tests you mentioned.

Thank you,
Terry

________________________________
From: Jaroslav Kysela <perex@perex.cz>
Sent: Tuesday, September 5, 2023 10:03 AM
To: Terry Hummel <Terry.Hummel@catalina.com>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>
Cc: Dulani McLaurin <Dulani.McLaurin@catalina.com>
Subject: Re: Bug Report: Audio issues with CentOS7

[You don't often get email from perex@perex.cz. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]

CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.


On 05. 09. 23 15:51, Terry Hummel wrote:
> Hi Jaroslav. Thank you very much for your input.
>
> I created the alsa-beep.conf file in the /etc/modprobe.d/ folder and rebooted.
> When the system came up, I still couldn't get the speaker to make a sound via
> the beep command. I attached the .conf file just in case you wanted to confirm
> the contents.

Try to check mixer settings (Beep etc.) - e.g. `alsamixer -c 0` command.

If it does not help, run alsa-info.sh and show the URL with your dump.

                                                Jaroslav

--
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

