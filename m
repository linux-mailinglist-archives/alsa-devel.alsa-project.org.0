Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0921A1E0A7C
	for <lists+alsa-devel@lfdr.de>; Mon, 25 May 2020 11:29:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E2D51700;
	Mon, 25 May 2020 11:28:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E2D51700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590398962;
	bh=mLACu41ixPjhiVnnexzcUkc2jt1s1ANaVQMbqYSVQQ8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H7HE1R5S6JqdZLlAPwXrBmWy+NfgzpcFJt7WRmtnljehp7Fy/DzQ/Fb796BQjjGLS
	 nYt8Pg44P3nzZQI/tFHKIjT4iR/ZUGTWqdyltB7k/U4v+yWS2C9h9ybpPVUY4Xj98l
	 DatrK0Iafx/8L/9qnG+gp+0ANl4COG4+JMHS2tts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3BFBF8029B;
	Mon, 25 May 2020 11:25:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F01FCF801D8; Fri, 22 May 2020 01:32:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02009F80161
 for <alsa-devel@alsa-project.org>; Fri, 22 May 2020 01:32:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02009F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=northeastern.edu header.i=@northeastern.edu
 header.b="inG1LE7v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYDvt8UcXZPAfXRmj98fd9tDi7FA4ZnSJW0e1/+7cu2hmZsiiKt8SDBkE+1v8Y6Wbq+hVzQDLQ8Iz0RCcY1rt6XaYsZi69BxFnX8lz8SXXGrhQHDQKcaH5jkPOTHkh4rlvYy0/qXcqjh6+i6IFn0mLO2QsV1j1Vxvpz4SOfdnJph/V6Yu/zKU6/yJu2a5TIIuXMuLrk2tPn/z8V4SZz2nkt9SxUITJVhhm1Y6Uoq/WbA7YyqiHcpd3nAM36NLbZUbxLA2NRZV3+ioORLoc4Rn870Df81Xt2VXB8BNiLZ0Nd8OMGuAGX40hP658Td571X63XCsUEMIcWbwZuQVnJajw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLACu41ixPjhiVnnexzcUkc2jt1s1ANaVQMbqYSVQQ8=;
 b=Eu9ZPP/hbYMbEbTWgqx40lqf6o0ZgBXN/PiqQiQTibwlF7M/wn4abbIOwQaD8MRWkU2a2AVPKkcIfctFfX/Ml1tyUaHkRnCaaxCBrgG3+rRRrOc/xVyaZyune64AjpQ77WLuOixeXxtiYb8Jh8NuU2RhQGsVBicfG9uGR9pD9h4fao3eIiKa5GF1qAMEebQrfPqFnHygb3pQeo+G4Hoi92MZX9+EPhvikXHIkGfCt9sMXEyrVZNcF1GyBmGybinBaw1Z8ix5oSfjUQeCZ3eZ+1mPvGqo0aSDhQSQi6BZizpt7ZQr99zGhnOmUyx9BvNje5ZZYsuG3LluS8KShkeBPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northeastern.edu; dmarc=pass action=none
 header.from=northeastern.edu; dkim=pass header.d=northeastern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northeastern.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLACu41ixPjhiVnnexzcUkc2jt1s1ANaVQMbqYSVQQ8=;
 b=inG1LE7v0+nVu8Q5b71RUZOL8z7kSdVYnTzlGKNmf06VS+rCsWOKKrKe8AXHhK2elZClCH90zdcY6CoGIRHTQw7I5vDNYyzk1M7rDfB/IZihfBrT5KY/eCRoJsVwDf3hXyIDw7Wj2mCZOVHMTR4DIs0f/Hnv3p5xQGdIpP/Z7JU=
Received: from BL0PR06MB4548.namprd06.prod.outlook.com (2603:10b6:208:56::26)
 by BL0PR06MB5092.namprd06.prod.outlook.com (2603:10b6:208:68::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Thu, 21 May
 2020 23:32:00 +0000
Received: from BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d]) by BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d%3]) with mapi id 15.20.3021.024; Thu, 21 May 2020
 23:32:00 +0000
From: Changming Liu <liu.changm@northeastern.edu>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
Subject: [Bug Report]Sound: sound/core/hwdep.c undefined result by left
 shifting 1 by 31 
Thread-Topic: [Bug Report]Sound: sound/core/hwdep.c undefined result by left
 shifting 1 by 31 
Thread-Index: AdYvxyMM7rMGCavGQk29qC9H1Ig8+A==
Date: Thu, 21 May 2020 23:32:00 +0000
Message-ID: <BL0PR06MB4548066F35C44C55459B3F60E5B70@BL0PR06MB4548.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: perex.cz; dkim=none (message not signed)
 header.d=none;perex.cz; dmarc=none action=none header.from=northeastern.edu;
x-originating-ip: [128.227.216.118]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5da83242-8bef-49ed-3629-08d7fddf2945
x-ms-traffictypediagnostic: BL0PR06MB5092:
x-ld-processed: a8eec281-aaa3-4dae-ac9b-9a398b9215e7,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR06MB5092F5C465E927E652C0F186E5B70@BL0PR06MB5092.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 041032FF37
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PiF+mt2zGjQuhvRVEKfLrg8Yqt4CoW7EYZREUVGcIKKhpsOZ231PmhPUndCS/PM9iB6pn3tsx7gYUcoRRLLPA2sgDLsMKIe2ygQUYTdAh0mW9bMfoccRlKNVBXURQdAYs3y7X6TT69SPepHJ+OFgn0S53R9CIZW8CvAe/zCWBqqus7Qi5fj+DcziiA8FqVvm9cwr00BNgrtNCz/jiAInWKLcPTaT1a6anNtAVqKAvVzjsD55jS7Qsyeq4TmeS+zoYV+auyPrSYPJCYby+5lFcMpIYxMMn0nDqXZIzWSGIFvvFCP8FhWh3R7GdXJWGmMT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR06MB4548.namprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(71200400001)(9686003)(55016002)(66476007)(66946007)(186003)(76116006)(2906002)(478600001)(4744005)(8676002)(66446008)(8936002)(64756008)(66556008)(5660300002)(6506007)(316002)(786003)(75432002)(7696005)(4743002)(33656002)(110136005)(4326008)(54906003)(26005)(86362001)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: zZe3m/bEH4GhbC4xNIpf7ObBVD3x2gm2jXSRhps0IVMVCJIYT7DRsWdPcGTHi2XaSHTRmsinkBysfn8LrPFctDdua8I7aVv4yApU3kWPFSUCgTSiYVetNzFdLLxUVAyZCJa5oPEhfI3LuEQtZ4LMr/43hnbLaxUarC68rQjM4vQEO+KWnWrJdUuhyySMLQRrlDsyYKvp1sDhxTjblEToic7QuF6LX5Sk8+wPZ7kzU4jIL4JovrqVB3mEHgVMzGZyriFiTt/yU9yHyQ7uRdambXxqisYLjrUMHM8Dcn4UTKUzhx3LHOe/9W25c9TN4uKIpTzYmiBUnIOe6zhYJ0moOZaJmRo+3De4ZD5OWmNWtMmHicjBim+3IN9ML3cWtvjV3J5kN9iRnSpu0e974y7bM/ZY2nDCDPWthO3RjrBTdW3rikAZzqaK09ZacIOyWaEPTCmH3/3TkmAcSdyMLXxbsQ0lItVcESQ+QRdLRDFX5nCZkm4KLA1HleQOqxUJ+yTS
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: northeastern.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da83242-8bef-49ed-3629-08d7fddf2945
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2020 23:32:00.6571 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a8eec281-aaa3-4dae-ac9b-9a398b9215e7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8JAZn/KeT9a+bpoCboJGZhUdmUVLpcS3VUn6kYhyQerX3AaWLqWSl1KXYuWGV+sYhcfxScz/9OVGSIyzStVcX01QnEpDt5N0/K/ppyPKBls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR06MB5092
X-Mailman-Approved-At: Mon, 25 May 2020 11:25:08 +0200
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Lu,
 Long" <l.lu@northeastern.edu>, "yaohway@gmail.com" <yaohway@gmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Jaroslav, Takashi:
Greetings, I'm a first year PhD student who is interested in using UBSan fo=
r linux.=20
After some experiments, I found that in sound/core/hwdep.c function snd_hwd=
ep_dsp_load=20
there might be an undefined behavior that might cause unexpected result.

More specifically, in this function,info was fetched from user space and,
info.index was checked if it's greater than or equal to 32.
If not then it's used as number of left shift bits to string literal 1.

The problem is, since string literal 1 is by default signed int, so 1 << 31=
 cannot be represented as a valid integer and
 the result might be undefined across different platforms. So I guess chang=
e 1 to 1U might help?

Due to the lack of knowledge of the interaction between this module and oth=
ers, I'm not able to assess if=20
this is critical or worth fixing. I'd appreciate if for your comment on thi=
s bug. This can help me understand UB a lot!

Looking forward to your response.

Best,
Changming Liu
