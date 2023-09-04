Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 054CC792087
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 08:25:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6A871FA;
	Tue,  5 Sep 2023 08:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6A871FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693895116;
	bh=Aer83DXurXOhnlmiyYiC0DZxqjbjqkIELaVaKtMh9q8=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iNILPHyw51uRl62cFzmRp2tstTNQAbUFsO3OyFzIjzWHJ7RyrpA0OJvUMrgEFVtpx
	 tjaxOlptgKIieT7PZ+dHSTQq+BJGaEoVXyf1jKg6n7xKlGqk9v6L7Z6HVc3k02hN5l
	 pX3bQ2F0aq9m+3sdFMHUkiAJjzoqyJalysd709Xc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0483CF80551; Tue,  5 Sep 2023 08:24:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8144F80431;
	Tue,  5 Sep 2023 08:24:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB528F80527; Mon,  4 Sep 2023 16:57:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20705.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DFA5DF80431
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 16:56:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFA5DF80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=catalina.com header.i=@catalina.com header.a=rsa-sha256
 header.s=selector2 header.b=QcW3e4qZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BgYCkaveV7sNROVbNfFUjnbySyRHH39nAfCGrCoZPFwo8jqr36GZNCVovAsvU3xqXLivDLiIx9/cpruphbB/teJQu0B6I9Osb+VL+RdbBvc1oF9RCzxuD/WQpIRO/hMlj3BJjGLAGYm9o5pBWX1GcehFRb+Dcx6r3kH8rj/b5qtRUh/tae2LTtrc/RGwGo1qXgQ4opl8QDvxrDiNloADW3LPr6aS+J2gLzdquekrQCWFVRwCGn65FbNhX6/u1uTz/YGHBR+2H+EuWxrrrB+pb7bDxg+ghvS8TUSYP6/Q83T/9Kbb58H82WQ0Fwr1gnlhklNTIbtOl+EGV7cZLUjWZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LH8NgX8uedz+5PkDp1Rv9+MN2eqUAGHpofNQuCB3SFA=;
 b=Lb5ocrV4jgtL82vhX769/fN5yG2AKUy6jQ07CI3JDLw/GgmSYowsBgYbH07QCyJ8nMtCTcoLiILDoodviqGzdfs1qs66a1fRsCMF/Q/74SocjUr/9QclrMXVBBe7Ogv1LVoULLk9P9xEDfo1dN9RkmbmfGjDLIFBcewSebwixThkw7WkJ7HM8ohrrhC+ICFK5JrEPLrlYXFk9UuArJ4IhGGDwW3ijDkmO6mKcy4ECtj3ZSxWnXIQB3qIgmCS1B4UC/w8a24zNm7MHd3/DKqm7NXwUyXm7HscjBo14sGytQ2pSyW9YqQn9EqZ3xoS2/ZI05WA8G9buJPwQQ5gbOQaqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=catalina.com; dmarc=pass action=none header.from=catalina.com;
 dkim=pass header.d=catalina.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalina.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LH8NgX8uedz+5PkDp1Rv9+MN2eqUAGHpofNQuCB3SFA=;
 b=QcW3e4qZu/VgcgPJouevBOY319SXcRhlfRY3xoc6zLjI1NrI/RYNrkUYWxF49+RXXXGsI3GGgFfStNndMdpy6XzbJc1Y5X7OR0quuiTDB1aQZnpXPzda73xZj9Q37LslMPfj5nVKxya1fCtRu5Z5xrj2nsjfZVqeT7csEeqX/t0vqCFPWMWhRG+a/VGNblMGuUilyWpuf5tgw9sK24SUP+mOtt8suVi0P8+uYNE6PYFstSmCARJx06r2pXryWKaa+O50WKT5syeYnwnetgPMfCL2HKP9f/NMxBPsa0FtkXUF1E9qSkdhBcJdKCKAF/HauSgHinmJC7SWjEYz3XM4lw==
Received: from BN0PR02MB8045.namprd02.prod.outlook.com (2603:10b6:408:16d::23)
 by SA2PR02MB7626.namprd02.prod.outlook.com (2603:10b6:806:134::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 14:56:52 +0000
Received: from BN0PR02MB8045.namprd02.prod.outlook.com
 ([fe80::1c07:b772:24ea:f256]) by BN0PR02MB8045.namprd02.prod.outlook.com
 ([fe80::1c07:b772:24ea:f256%6]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 14:56:51 +0000
From: Terry Hummel <Terry.Hummel@catalina.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
CC: Dulani McLaurin <Dulani.McLaurin@catalina.com>
Subject: Bug Report: Audio issues with CentOS7
Thread-Topic: Bug Report: Audio issues with CentOS7
Thread-Index: AQHZ3zuyVOwv+LHOWkuu6+CmLUIUyA==
Date: Mon, 4 Sep 2023 14:56:51 +0000
Message-ID: 
 <BN0PR02MB80455425D6077DEC556A4F83FAE9A@BN0PR02MB8045.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=catalina.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8045:EE_|SA2PR02MB7626:EE_
x-ms-office365-filtering-correlation-id: d62b1a80-89a8-4e22-6d39-08dbad572c1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 SjER05zT40eCNlsnKQS+EYO2C/O25Kp2racoUKVSRAKxMHAq2CQ3przCbGbaVEyUjfeAOTvens585l2o6i9grLOMLtN7g2B2iF4coAotJnxwsWwxSrxHirCamIR6v0+UU/BEY0Xkh9dRLd25XmJIUPNq5FrRFOwhNJQ7WE6GbL88/4UU3xcpE1d1cu442bniJumscIZ5x9VKhqDkSa8yZZwfPItB3jrG3EsjvabxtwqpyCXmTiTkgAh5Z9pkOrIoKH1oEymiypMif1WC/PDphf1DxH5UUR8NsTDCYdW3+09MorEk6EGVqr4359ocCprzVQYRFPd/9Or8QVdhJpyjpr7AgJ3DtugI9WUVkQAEmkH/PRmk+y/rsy9/HvwGBl2awTndHjdc72u/A8LZlkYTO5DyubksdBmegnftazJowrfd4UgAcH+wH6yDfjDTzTo6v/9CsMX6NsyPQIFCcHT7AuztxNjeAc6w1UENgWQE8G8hLQtXYyBb0YjMLiiM50Sec7yzMMZOo0FynS4b2QXMy3PcYoNENvWuRfxkPg5YgLXo7cK89a8ugiiKILZIEUSd
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR02MB8045.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(376002)(346002)(396003)(1800799009)(186009)(451199024)(478600001)(966005)(71200400001)(66946007)(66556008)(66476007)(66446008)(76116006)(26005)(107886003)(64756008)(1015004)(6506007)(9686003)(316002)(7696005)(2906002)(8676002)(4326008)(8936002)(6916009)(52536014)(5660300002)(86362001)(122000001)(99936003)(38070700005)(33656002)(83380400001)(40140700001)(38100700002)(41300700001)(55016003)(166002)(19627405001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?tUKpWkWpHDY+tjfgXpEED0rS6KPM5wCv7+iXjneMcKMTxrIEIxwfBr+U?=
 =?Windows-1252?Q?SB34dDm72cXPGyNbUbu1Mx/svXZIFP+NGW41xCaAQ9xZO2EMt51aOs3a?=
 =?Windows-1252?Q?kgQH3fFzcSlSmJCmk5NJ6f8tAiy1APOslgzkBYbWhmEHFVAfhLLMrRSf?=
 =?Windows-1252?Q?1T5olUdfH0kv6xnWiNC/uPIM/kXQMIMo+7uZ3nafN4+xtBtJpi7xapSM?=
 =?Windows-1252?Q?pjUE80iu5GGJXZoC/uT9pKRyauAFDGd9ocqL0M5KMIyt6VQ78FZbrtNH?=
 =?Windows-1252?Q?S9/pF9zkYlv7IWgwMwsOLi/0hfMEuovM5aXWGeuEK3TcTRxfVxOblMZg?=
 =?Windows-1252?Q?nd3PzU/5U67bN9VIOrLFA4Tl/v5ckDuPUnj2CcC7vIlu1NDEWuBFWlsh?=
 =?Windows-1252?Q?2iNZpwqWHCDWyS6BLWzoffAs2/1RxjJ0CC/y/eFlh5CYS1j5TuZZZ4zs?=
 =?Windows-1252?Q?5otFWiVBo8zZfcZOHyqoY7NqlfusD4khcckr8yct4M+R/Ehb/VUYcHd/?=
 =?Windows-1252?Q?y0dbriDr8G5ukctD6+X1eK8QY/lMh7TGly1eo6RjkNIYAEwLTrMybhUu?=
 =?Windows-1252?Q?FElAQxbArR31/lLGt1qaZWSKdT/lUYWC1lhl/viLfxCY+JCYJysrEDTP?=
 =?Windows-1252?Q?Xx11gypVlRpmZu4HCrD2JtWNgje/v4wz7rHAplbElfH8/dRYsdz0AcMF?=
 =?Windows-1252?Q?IfwzGjH37DWCkfTlPNPVFIR+xVuwcgS2HZPaPgE6MmahOh6IXClQd0f5?=
 =?Windows-1252?Q?ET6sU96GyxYC6kjm/ZobmA/3BoEIDQ8Mcm1Lo8vnPisLIipBQBF0rzfA?=
 =?Windows-1252?Q?1FOHoR9zoyYKR8whpmiM2kIb2R8sMnslq5W6j4MZgm9Aki5BBpmTuRD0?=
 =?Windows-1252?Q?0gYk7D7QUKcSFFvVDK9lJ8VA0ZnC5vxbNE1jaNNR4PNudqSqvTUCOvh4?=
 =?Windows-1252?Q?H3YVPrFMwVud/M1iyzTBjwQ63OfKnwgdRjgig4UXDPTdt5Hp0nPU8dr3?=
 =?Windows-1252?Q?0vSsKYDXxMgnfYqc0aXEsETAIHTI9Hkz692Pv1noyiUtOL3+TTv8oSh0?=
 =?Windows-1252?Q?bGsWfJktZd1uhkwkDspMQS7DzZBjlGy07pYbwDDqV7V80xqI8Cv3z2mL?=
 =?Windows-1252?Q?xXFmbKw1U9HxIhfIV9k7Kv9Y0H3YA9CM9AwrX6Ok11sUuPXpOtRDnNOA?=
 =?Windows-1252?Q?9f82R6Sq7bZpVGqsLs5/+BYuoTGHn0zXqUAvCL3BTfCUH0o+DAjz/yKl?=
 =?Windows-1252?Q?dlfTvR/L1CZz9EtSO2GfP03ppWzOm9ptji2xdn3rhRcvBDxWGYi4rqe/?=
 =?Windows-1252?Q?rLQ1PoPWA4dlkS7GXKs91LSlwbVupiBdcYJBbG3EkCl/wXQMZSYKq7/m?=
 =?Windows-1252?Q?0cO+/VMpHbJ2Wbpsp76sKYUnjOMl3nRP4CrAwnh4j2C2hQvbQlqr6m+P?=
 =?Windows-1252?Q?0IDYI+dfFuEKTGIwjX0/X9dZsY+4bkOzJYFI5OpGqxg3WOSNzFfttt6j?=
 =?Windows-1252?Q?kOGN6ImLvqFzFk73GUvhsHhG4t3ReokGJi1YEEGYzQf1wV6ywZ2ZjG1g?=
 =?Windows-1252?Q?AF6GmPw4zNLFHIgTByT6r2QNHsA2QW07+9ekkIcGv/DYbC8DGcT9wPSL?=
 =?Windows-1252?Q?wjm2Gyl7c1hw/YibMH3OIcuuLrprYuOtz4TDLPDK7TMwZ7NLrkJugWUr?=
 =?Windows-1252?Q?n6zsPoyAmJQ=3D?=
Content-Type: multipart/mixed;
	boundary="_004_BN0PR02MB80455425D6077DEC556A4F83FAE9ABN0PR02MB8045namp_"
MIME-Version: 1.0
X-OriginatorOrg: catalina.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8045.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d62b1a80-89a8-4e22-6d39-08dbad572c1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2023 14:56:51.6389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2eddc39c-2996-4c2a-ab97-f767c39ea155
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Qsn6lRUY/WD1i10Sn3WIG6YciLd5DfC/sZXnT5/KTVK8kDBhxnCWB/p/5sij/ELIKd0E52AiV2IFp478a7rz6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7626
X-MailFrom: Terry.Hummel@catalina.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IFRWG63PWTJ6YTONPMHHE226HEU2YAHZ
X-Message-ID-Hash: IFRWG63PWTJ6YTONPMHHE226HEU2YAHZ
X-Mailman-Approved-At: Tue, 05 Sep 2023 06:24:22 +0000
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E6YCNMQ6UG5R52FK4R7KGML36AEK5B2M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_004_BN0PR02MB80455425D6077DEC556A4F83FAE9ABN0PR02MB8045namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hello. I hope I reached the right place for my audio issue.

The OS that I'm referencing is CentOS7. It is close to EOL so I don't know =
if there is any support at this point, but thought I put the request out th=
ere and see what happens.

Let me know if I need to provide any additional infomration.

Thanks.
Terry Hummel
Catalina Marketing Corporation
813-597-8775

Description of problem:
The PC speaker fails to make a sound on the HP RP 5810 PC running CentOS7.

Research:
I Installed the beep package beep-1.4.12-7.el7.x86_64.rpm on CentOS7 and it=
 is working fine on the HP RP 5800 PC. I have a bank of five 5800 PCs and a=
ll of them make a beep sound on the PC speaker.
I then installed the CentOS7 image on a bank of HP RP 5810 PCs and I failed=
 to get any of the systems speakers to make a sound. I verified the speaker=
 is enabled in BIOS and I have confirmed the 5810 speaker works fine when W=
indows is installed on the system.

How to reproduce:
Try to get sound to come from the HP RP 5810 speaker using:
printf '\a'
printf '\007'
echo -e '\a'
echo -e '\007'
beep -f330 -l137 -n -f330 -l275 -n -f330 -l137 -n=85etc (I have a beep tune=
 in a shell script)
// when beep is run, it appears to run with no errors.

Actual results:
The above commands run without any complaints of missing audio device. But =
no sound coming from the 5810 PC internal Speakers

Note: The 5810 PCs are basically just stand-alone systems that run our prop=
rietary software 24/7.

5810 System Information:
Version: CentOS Linux release 7.9.2009 (Core)
hardware: x86_64
Kernel: 3.10.0-1160.90.1.el7.x86_64
Name        : kernel
Arch        : x86_64
Version     : 3.10.0
Release     : 1160.90.1.el7
Size        : 66 M
Repo        : installed
>From repo   : storepc_centos7_x86_64
Summary     : The Linux kernel
URL         : http://www.kernel.org/
License     : GPLv2

5810 PC Information:
        Manufacturer: Hewlett-Packard
        Product Name: HP RP5 Retail System Model 5810
        Version: Not Specified

Artifacts:

The attached .zip file contains complete artifact files.

Note: I did try to run alsa-info_alsa-info.sh but the CentOS7 image that we=
 use has multiple missing dependencies for it to run.

dmesg_HP-5810.log - the log does not show any errors, warnings or oops mess=
ages. The audio driver appears to load without issue:

[    8.386508] input: PC Speaker as /devices/platform/pcspkr/input/input3
[    8.540596] input: HP WMI hotkeys as /devices/virtual/input/input4
[    8.559224] cryptd: max_cpu_qlen set to 1000
[    8.957472] AVX2 version of gcm_enc/dec engaged.
[    8.957475] AES CTR mode by8 optimization enabled
[    8.961877] alg: No test for __gcm-aes-aesni (__driver-gcm-aes-aesni)
[    8.961906] alg: No test for __generic-gcm-aes-aesni (__driver-generic-g=
cm-aes-aesni)
[    8.963261] snd_hda_intel 0000:00:03.0: bound 0000:00:02.0 (ops i915_aud=
io_component_bind_ops [i915])
[    8.963290] snd_hda_intel 0000:00:03.0: irq 34 for MSI/MSI-X
[    8.963381] snd_hda_intel 0000:00:1b.0: irq 35 for MSI/MSI-X
[    8.980785] input: HDA Intel HDMI HDMI/DP,pcm=3D3 as /devices/pci0000:00=
/0000:00:03.0/sound/card0/input5
[    8.980857] input: HDA Intel HDMI HDMI/DP,pcm=3D7 as /devices/pci0000:00=
/0000:00:03.0/sound/card0/input6
[    8.980922] input: HDA Intel HDMI HDMI/DP,pcm=3D8 as /devices/pci0000:00=
/0000:00:03.0/sound/card0/input7
[    8.980977] input: HDA Intel HDMI HDMI/DP,pcm=3D9 as /devices/pci0000:00=
/0000:00:03.0/sound/card0/input8
[    8.991101] snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC221: li=
ne_outs=3D1 (0x17/0x0/0x0/0x0/0x0) type:speaker
[    8.991105] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=3D0 (0x0/=
0x0/0x0/0x0/0x0)
[    8.991107] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=3D1 (0x21/0x0/=
0x0/0x0/0x0)
[    8.991108] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=3D0x0
[    8.991109] snd_hda_codec_realtek hdaudioC1D0:    inputs:
[    8.991111] snd_hda_codec_realtek hdaudioC1D0:      Line=3D0x1b

lspci_HP-5810.log - looks like there are two audio devices on the HP5810:

00:03.0 Audio device: Intel Corporation Xeon E3-1200 v3/4th Gen Core Proces=
sor HD Audio Controller (rev 06)
00:1b.0 Audio device: Intel Corporation 8 Series/C220 Series Chipset High D=
efinition Audio Controller (rev 04)

[TerryH@us-09-048-0331 ~]$ cat /proc/asound/cards
 0 [HDMI           ]: HDA-Intel - HDA Intel HDMI
                              HDA Intel HDMI at 0xf7e34000 irq 34
 1 [PCH              ]: HDA-Intel - HDA Intel PCH
                             HDA Intel PCH at 0xf7e30000 irq 35

Note: There is no HDMI monitor hooked up to any of the HP 5810 systems.

lsmod_HP-5810.log
snd_hda_codec_realtek     116449  1
ghash_clmulni_intel            13273  0
snd_hda_codec_hdmi         52340  1
snd_hda_codec_generic     74631  1 snd_hda_codec_realtek
snd_hda_intel                       44486  0
aesni_intel                            189456  0
snd_hda_codec                    136355  4 snd_hda_codec_realtek,snd_hda_co=
dec_hdmi,snd_hda_codec_generic,snd_hda_intel
snd_hda_core                       91007  5 snd_hda_codec_realtek,snd_hda_c=
odec_hdmi,snd_hda_codec_generic,snd_hda_codec,snd_hda_intel
snd_hwdep                           17704  1 snd_hda_codec
snd_seq                                 62774  0

lshw_HP-5810.log:
[TerryH@us-09-048-0331 ~]$ sudo lshw | grep -A11 multimedia
        *-multimedia:0
             description: Audio device
             product: Xeon E3-1200 v3/4th Gen Core Processor HD Audio Contr=
oller
             vendor: Intel Corporation
             physical id:3
             bus info: pci@0000:00:03.0
             version: 06
             width: 64 bits
             clock: 33MHz
             capabilities: pm msi pciexpress bus_master cap_list
             configuration: driver=3Dsnd_hda_intel latency=3D0
             resources: irq:34 memory:f7e34000-f7e37fff
--
        *-multimedia:1
             description: Audio device
             product: 8 Series/C220 Series Chipset High Definition Audio Co=
ntroller
             vendor: Intel Corporation
             physical id: 1b
             bus info: pci@0000:00:1b.0
             version: 04
             width: 64 bits
             clock: 33MHz
             capabilities: pm msi pciexpress bus_master cap_list
             configuration: driver=3Dsnd_hda_intel latency=3D0
             resources: irq:35 memory:f7e30000-f7e33fff

Note: The HP 5800 is only showing one audio controller:
00:1b.0 Audio device: Intel Corporation 6 Series/C200 Series Chipset Family=
 High Definition Audio Controller (rev 04)


--_004_BN0PR02MB80455425D6077DEC556A4F83FAE9ABN0PR02MB8045namp_
Content-Type: application/zip; name="artifacts.zip"
Content-Description: artifacts.zip
Content-Disposition: attachment; filename="artifacts.zip"; size=23024;
	creation-date="Mon, 04 Sep 2023 14:38:45 GMT";
	modification-date="Mon, 04 Sep 2023 14:39:20 GMT"
Content-Transfer-Encoding: base64

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

--_004_BN0PR02MB80455425D6077DEC556A4F83FAE9ABN0PR02MB8045namp_--
