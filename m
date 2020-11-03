Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 582BD2A4DCB
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 19:06:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDD3D169E;
	Tue,  3 Nov 2020 19:05:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDD3D169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604426798;
	bh=H0Z3vXqFDNNb0nMuMDqgmiZzqDqc6oqMa0Tpk9xBqaU=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rxAAWRGgx0xFUZcNDPMMCXUS4murmUw9XmvWy28ykSAJg84i1LISUZkH74BzT84Bx
	 zY/wZk++vVjDuz64D0ae6nmfwdyHb5vpJQyQJF4o5hcSkWqRwmOJ+KTgtKYwzne7Gk
	 yo2gk1UkkR8e/cQeA0+ca3NhUOulVcxXoRzqJiXE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E85CF80272;
	Tue,  3 Nov 2020 19:05:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 070C9F80171; Tue,  3 Nov 2020 19:05:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, PRX_BODY_30, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC350F80083
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 19:04:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC350F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="MBhVn3xT"; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=Dell.onmicrosoft.com header.i=@Dell.onmicrosoft.com
 header.b="WNzxG4eA"
Received: from pps.filterd (m0170395.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A3I2Smp014219; Tue, 3 Nov 2020 13:04:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=Cxb9yMGW36x4a+ORh+783j9ROQPjorQmmpb/PW6F0+g=;
 b=MBhVn3xTO7fASrxCYSMPqF7CfopHOEby+V5MroNdEInwytxTwTs45JA6k2/ps7mfDDYn
 tKikvYKitdkKcs1EWFlH+pMyTRn237mJyirD2ME7OyFCQbgbLdP6uJLlA5J1d86Tllyr
 MlnkL6IvxLGc+ur4Fo2n6Q5Wa8/dob0tNoKPJ0jIbfbAQcJgrKuSu6sjEIPeHap/NndG
 2/FoNK9MGrr7R/NVrvhtTtFqXoNyeUlZIBlUfmqGfGPI0ZcPx3iYyEgRxZDUYxkZoNPn
 ZeP2YnXQR65T5Lzc93JSiu29Czdr/8HiPnyNHTGqq+XXKsMc+eRfKg73u+8iats7vNuW 2Q== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
 by mx0b-00154904.pphosted.com with ESMTP id 34h4knbk42-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Nov 2020 13:04:53 -0500
Received: from pps.filterd (m0144102.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A3I1cPR126357; Tue, 3 Nov 2020 13:04:53 -0500
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by mx0b-00154901.pphosted.com with ESMTP id 34ka761y25-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Nov 2020 13:04:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFd5a4H2g8dbJuyGM1y+4wz1u6Gdo2llSnPPzSPdA1j1urbbYG6rq3Qeg4bwZ4dVZQRfofO6jozosudqXo+No3T21gA27PEwu0thAl2JSyn2a0vJWw0Eh5zbSSIVql1zZvAXCdKo1bqeIxkHZaddnjvWRhZMYepuw3c4yu32+ypJjI9r30fJty+WT9D33Q5Afncq59xHrK0f0fS27EdqHzuTUxCKigmS/7ZldIlz9hm7dZhWMBlT1jOwB+unNdq34Vdi1mSeYYWxzzLkJnpkRJIBuOMFOPUtEqwwuoMkFF9fl6R26+iNPh3+p/MOhOpmcViIx03Kn6sqm9DgFHjoAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cxb9yMGW36x4a+ORh+783j9ROQPjorQmmpb/PW6F0+g=;
 b=MBuhFdt4+MDFVufzlGRixFsUB8l9CgK9I50xp5LHaGlx3z4t7m17xu754CUFWSSu61tnwNlfMDbzZr7rQayFm4GCX/Gmo/Mt+ZiArjItAOIHFsUG3DLd6VO3YlksbKfQL9E+oSJ42yueY/6lBU6TNtoxdy8degaU+np+6uUepy0m2gq+4arEnJF22RmSISm9+qzWK9wvaruzsys6h91jrCu1bHaL2ElKr9K49+lhr8Dn34wP1JBDQt8QGxMCkiTm2odO7/Htis0Nl41Uzr+EQyCB8NL8Q48+a+MD2O8Ak8/Zh+0psihURwUQEEG/e6Z2sl/YDM9TSTlVKnlJxuPrtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com; 
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cxb9yMGW36x4a+ORh+783j9ROQPjorQmmpb/PW6F0+g=;
 b=WNzxG4eAVJ5AzSJpgBdcoRvyOIklRsQ0mdXESFKlyHzPHWgxk5refzbb0+Jh9HgYhFYmViaBQ70aGj5HSucx6UulMAK4pHhFlocq4t421X3IiMs+XkjwmtvEp4UunfvJZYbulsM+aB1gHL14mHJX+Bw5N9q/2syCTq9oHYY3c3Q=
Received: from DM6PR19MB2636.namprd19.prod.outlook.com (2603:10b6:5:15f::15)
 by DM5PR19MB0091.namprd19.prod.outlook.com (2603:10b6:4:64::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.24; Tue, 3 Nov
 2020 18:04:49 +0000
Received: from DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::a8ff:e803:ee80:e59a]) by DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::a8ff:e803:ee80:e59a%3]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 18:04:49 +0000
From: "Limonciello, Mario" <Mario.Limonciello@dell.com>
To: Mark Brown <broonie@kernel.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Subject: RE: [PATCH] ASoC: rt715:add Mic Mute LED control support
Thread-Topic: [PATCH] ASoC: rt715:add Mic Mute LED control support
Thread-Index: AQHWseEjYgOvfJhc/UebM8naQzkVCam2YlCAgAAyV4CAAB3TAIAAAEsQ
Date: Tue, 3 Nov 2020 18:04:49 +0000
Message-ID: <DM6PR19MB26368B60076D049F009B75A3FA110@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <20201103125859.8759-1-Perry_Yuan@Dell.com>
 <20201103131253.GA5545@sirena.org.uk>
 <5f2c1282-4401-276a-8dad-127fa1f449fd@linux.intel.com>
 <20201103175948.GF5545@sirena.org.uk>
In-Reply-To: <20201103175948.GF5545@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-11-03T18:04:46.5198475Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=88b23a7b-bb63-4e94-bb32-46bb227de898;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa163c07-7e34-4ebd-8a86-08d88022f4d8
x-ms-traffictypediagnostic: DM5PR19MB0091:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR19MB009135EEA5FB1310D7EC26EAFA110@DM5PR19MB0091.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YdHBRxGL5PQy5tppndeMB2kZUXt8yb0N3Jt52i6ZlmC4jnAmWAHGRsEm3ZJIOB/+XHTxaBHBTMRSwWBEokxEpog8S1xjLe+m9Lfz1clApUYrpG19+WwZsDEYH8k8Sj8GI+uxn/0fC+8nKV41BiyFtUF3R2qSgk77VAHIDfVJUBIse/pniHpvWpTHhH5swsR5Zhg8aNuCYEhdt06wpTlsEBqP4h/fzTPZsmzbOt9ojDgDqtK3LByynsByHvvuXD0E+tSU4tQS9ci6PI6QithsoOZNWr+7Y8LIgDrT3fwHLw+isMD/NL9PgbBJq6xlyO8z/aO2saJsE8osuI5EfEsWlh9W9WEmUsl5N/IjPLz+tYg9pWDoV9YU9s4eV3dj5ClsaoM3WjQC7E26bcGBq6Z2dQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR19MB2636.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(52536014)(186003)(26005)(110136005)(54906003)(33656002)(86362001)(966005)(478600001)(4326008)(64756008)(66476007)(66946007)(76116006)(53546011)(316002)(66556008)(9686003)(8676002)(71200400001)(55016002)(6506007)(66446008)(5660300002)(8936002)(7696005)(2906002)(83380400001)(786003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: qDnV84a3rHm6B0vbakaMNdOXMKsjsC11h8YlNB/vDY7+qxpsqvIdrP+hUFSaWR5yypBlrVHlWCVvPFzhjAsDRkSRLdzSFGw1LgpNE+dFQybtfV7Z3UT3x8Y4m+6PKEsUoXmHvmtcM6iZSV0y1G7bCx6nOuFPTZhcm7gJhaA98ZjEwuWPHrGqx7Vj3NpAk7Z7H2n4ysWACELPysDzu0W60O39G9hZGCvkaW8kSck4z+ir8eWLmNXOT2pDj0GS54mzhgCdmy+coHAxrCDScZshjkTW2FcGDhJILdd+3HiRYkWUlujxFx4Qw8fsWujVtg5Ll38dcBiA6YiyXafitwNdr6OihkRFl6+z3Q13iNzR5rAyrCCeRxHGCND1T96lTMmYpr+94nb/G4dEifmhppKvk1qdcmf9akSJDuzJLrxmkntv7I5FWV0TI7iIFhlF88BxfvnXep4HRO8cQ/+Gm1brFpN9taEfPMSAaKzT5IC07TZTZ8Zc/ebAwetgp1hBn8ge1sCcZX0VAQvoVaR7X92dsvjRu1N6CTdHHrl12xri5vKDUWkW/quaJMnhm7XDUzcxuyqqmzvYq+fxSFNy0evMhH2m8WFivZ8m+JBI6kbfFfORTbCDtglBti9mz7KIxhgX8gD1mdUxXjZEKua4+nvIvA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2636.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa163c07-7e34-4ebd-8a86-08d88022f4d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2020 18:04:49.6841 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: riwvUZkJDb5IcfSXU9uLx3qM46hQyee/Sf8WTYhuq1AGRk31QOtDyOhlXxDvFRYWxb5YJAh5GmIxM6UwqGNVbTfqVASIP2Kc/C8jdp7ML6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR19MB0091
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-03_08:2020-11-03,
 2020-11-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011030121
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011030121
Cc: "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "Yuan,
 Perry" <Perry.Yuan@dell.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>
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

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Tuesday, November 3, 2020 12:00
> To: Pierre-Louis Bossart
> Cc: Yuan, Perry; oder_chiou@realtek.com; alsa-devel@alsa-project.org;
> lgirdwood@gmail.com; Limonciello, Mario; linux-kernel@vger.kernel.org;
> tiwai@suse.com
> Subject: Re: [PATCH] ASoC: rt715:add Mic Mute LED control support
>=20
> On Tue, Nov 03, 2020 at 10:13:03AM -0600, Pierre-Louis Bossart wrote:
> > Somehow this patch was filtered by alsa-devel servers?
>=20
> It'll be a post by a non-subscriber I guess, in which case it will
> appear later.
>=20
> > Actually thinking more about it, having two controls for 'mute LED' and
> > 'capture switch' could lead to inconsistent states where the LED is on
> > without mute being activated.  we should really bolt the LED activation=
 to
> > the capture switch, that way the mute and LED states are aligned.
>=20
> Yeah, it's just asking for trouble and seems to defeat the point of
> having the LED in the first place - aside from the general issues with
> it being software controlled it'll require specific userspace support to
> set it.  Users won't be able to trust that the LED state accurately
> reflects if they're muted or not.  Your proposal is more what I'd expect
> here, I'm not sure we can do much better with something software
> controllable.

I don't think it came through in the commit message, but I wanted to mentio=
n
in the system that prompted this software does not control the LED.  The LE=
D
is actually controlled by hardware, but has circuitry to delay the hardware
mute until software mute is complete to avoid any "popping noises".

This patch along with the platform/x86 patch:
https://patchwork.kernel.org/project/platform-driver-x86/patch/202011031255=
42.8572-1-Perry_Yuan@Dell.com/
complete that loop.

The flow is:
User presses mute key, dell-wmi receives event, passes to dell-privacy-wmi.
This emits to userspace as KEY_MICMUTE.  Userspace processes it and via UCM
switches get toggled.  The codec driver (or subsystem perhaps) will use LED
trigger to notify to change LED.  This gets picked up by dell-privacy-acpi.

dell-privacy-acpi doesn't actually change LED, but notifies that SW mute wa=
s
done.

If none of that flow was used the LED and mute function still work, but the=
re
might be the popping noise.
