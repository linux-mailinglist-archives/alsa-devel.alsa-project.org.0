Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B4C2A4F96
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 20:02:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5E431697;
	Tue,  3 Nov 2020 20:02:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5E431697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604430174;
	bh=cQ4IuRAOpCpdTweWiPIla02Ocp3Qb4TLdy3UKfcho6s=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HpgrEQPZi8AnUIOKP4bPoHg3uJMWI4uw8vwZ5bT5lVelcoTbDdKDJRbs/miEwTo8Q
	 EQ8ok5kpJ7i2MHP83M4BWriJISnSXt1R/CEqnSpGCPdDgHlrrMnV2HVHQsBj0er+5a
	 4CuvYsZep3W6diyA4Bbx3tdtJH06JfRJ5XHT8bfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 138BDF80272;
	Tue,  3 Nov 2020 20:01:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1813CF80171; Tue,  3 Nov 2020 20:01:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, PRX_BODY_30, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB1D7F8015A
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 20:01:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB1D7F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="lt3jZ+Rv"; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=Dell.onmicrosoft.com header.i=@Dell.onmicrosoft.com
 header.b="AfwzN63g"
Received: from pps.filterd (m0170392.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A3IoLbe007664; Tue, 3 Nov 2020 14:01:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=dpLiqwi4wgEd06fHgWob8KKYZ8dBafXwp98mtwLNe08=;
 b=lt3jZ+Rvnd7samO+Mlj6+UfiOMSsbHX7V1AaPvkL95PXDh6RjkbRZTzrfV0WbZr7G55h
 AZx7ZscrO6mFbemQU84Voe1qgXw1RSAEaNZp1HpjYGEbRNpGLzK86kTLWbacvxZa2X9i
 4cYXBsrL9p+xfFINqX79CgMIgvMWlY7NFvQUQ/cC1efkFBQgaf6qnAqD7WyOxnUcezLq
 0lmD/l6Rd6M5TvIlmgLjHEhA4xaGo0CCHX8ISzLsfozYkh+XIqgC1zsY0tVKMLFvDhDP
 vUBU/+gcLx90vVHUjejXFx5Pz/6SUBZ3pmQCu0gMiJwgG2QEehv8kW5IqUZ35UrTF6Jn gw== 
Received: from mx0a-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
 by mx0a-00154904.pphosted.com with ESMTP id 34h33cbwwf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Nov 2020 14:01:08 -0500
Received: from pps.filterd (m0089484.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A3Iugq8112442; Tue, 3 Nov 2020 14:01:07 -0500
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by mx0b-00154901.pphosted.com with ESMTP id 34k7jcehv1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Nov 2020 14:01:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=caRTmY8Av5DiVq1GwabGorf70CL7sIU4QhtUsmXMQlLR898ocdHx3bHNfz8bcNGZt3JKDVsWmTvmMMImyqp33LPWbS222iibWonXMcrEDqPVwX6+M0qnYvd9feyLCFDbYtREoUVl1lzc+1ses/odXCKVmJZOicXZiZHGQsAOgKh1eSyXde7mUW8wffXW7tPHAeAk2cKjvs8PFTBvHqoGN0uAewzJ4S/Nxr7vhQ+7m9ylYprSGVfxi5dQ3gqm9E9qHZNnxnLEw0Q0EcYRCfD2iN5TNZ+q1hITjFEWhRM5a7R09EB46V6hyZJpOMaKl8RKhY02dcBbUDW899BOEwrSCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpLiqwi4wgEd06fHgWob8KKYZ8dBafXwp98mtwLNe08=;
 b=mDpZNYIP/jT4xPhhR4/YdBHLYW118PEg7N/XvQVSbTVn1bqDXeRATg13ZX3uDpfF9WO3376Gk0HjNjASahAyE1lIO31UtdSWVEL3+Lk+6uNA9eXC0XlBn/ACCL4/u0SQ1sDIeJY8Jpo61irDWlBi5lKCJ3hO34jDCLfDDYVGA3ymBveRawIsD0sJ9oNE40E3XNgMqJ1kBJx750pPpXLKD6/kSbctzUJ11e97rQVDU5fG7bUq0FR6Vq19xCykD5CTdjwouXKYSqTky+OSLYlSNJAKTljzhQr8r9iRBgp4i+aR/4nJR/KEX97dOYnBZ+sexyZx9T5To8kRVtCgWJgivw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com; 
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpLiqwi4wgEd06fHgWob8KKYZ8dBafXwp98mtwLNe08=;
 b=AfwzN63gLdprpKmnHrtDlAtULadXasDIRXXfFSVauNQ2bvDTf96avmpxKsF2PUYhcGm0nnsXFMWOrMeaBzVZ9ywc7w1KnpQkwd7tcWMSJ/ZIaaHSnSKql3V8t1z0BSEjeIMaIaKSEW8/i50YgZ6T+B1RSpn2bWsvPBRo54NwHOs=
Received: from DM6PR19MB2636.namprd19.prod.outlook.com (2603:10b6:5:15f::15)
 by DM6PR19MB3993.namprd19.prod.outlook.com (2603:10b6:5:1::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.19; Tue, 3 Nov 2020 19:01:06 +0000
Received: from DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::a8ff:e803:ee80:e59a]) by DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::a8ff:e803:ee80:e59a%3]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 19:01:06 +0000
From: "Limonciello, Mario" <Mario.Limonciello@dell.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH] ASoC: rt715:add Mic Mute LED control support
Thread-Topic: [PATCH] ASoC: rt715:add Mic Mute LED control support
Thread-Index: AQHWseEjYgOvfJhc/UebM8naQzkVCam2YlCAgAAyV4CAAB3TAIAAAEsQgAAIrQCAAActsA==
Date: Tue, 3 Nov 2020 19:01:06 +0000
Message-ID: <DM6PR19MB2636311108BDD43DF8DE8E89FA110@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <20201103125859.8759-1-Perry_Yuan@Dell.com>
 <20201103131253.GA5545@sirena.org.uk>
 <5f2c1282-4401-276a-8dad-127fa1f449fd@linux.intel.com>
 <20201103175948.GF5545@sirena.org.uk>
 <DM6PR19MB26368B60076D049F009B75A3FA110@DM6PR19MB2636.namprd19.prod.outlook.com>
 <20201103183154.GG5545@sirena.org.uk>
In-Reply-To: <20201103183154.GG5545@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-11-03T19:01:04.0178744Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=f662fae3-0bf8-4e21-b629-80e344a883c5;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77e385f2-fb91-436d-8557-08d8802ad15b
x-ms-traffictypediagnostic: DM6PR19MB3993:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR19MB39934E2AC67B14AF40E558F0FA110@DM6PR19MB3993.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kwARREQysOVNwUhxAmud9RslT4HYqs1I7TGbAizYj+yBPrwkApTrWIReU7ortzXjQ1SG8mTVYLznzlZc5NcCvblu98XgmXYyDaHs6n2nI/sdXZT1t9IFkdz62mpk7awa0XlXEQWTaTFRJvktD1A8ueJWHLZKkH1mlkHqkNWA6IQGnK0DWCU9RFd9Q+4klSst7DaayX+uFwfIA646Ay+ooM8zOCHnElMfoF8qapAB0VCdCKV0UPUbdCzTR+m7oZGpfgaCvLI9+XdPu/RjAUu6Gt+lJ4bROPJcEsxCZkgjx8AQgaDVseyESBp61zZGJUNdkB/b3YNRhW06BhUtwEBosA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR19MB2636.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(71200400001)(26005)(86362001)(478600001)(76116006)(186003)(7696005)(52536014)(5660300002)(33656002)(8936002)(4326008)(8676002)(55016002)(2906002)(786003)(54906003)(83380400001)(316002)(64756008)(66476007)(66556008)(66446008)(66946007)(9686003)(6506007)(6916009)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: t5t2GEmuquUWOqFoC/FCcmCUDWXHX2GUjnGQbzsUrMtNBNlEgciWnvMlPvNyaZgev38lwulEMGZsKI3+QPF4nUibhfc2v+E1OFxrs+ZWLt4grI2G2RCw0CRr98mrYc23ybiN0njOB0QuuVcc+oVA7SlHY31ysFWLkwfzIs/5+gzjIG/KXYBrMZ0OmPmLDkEdWlxsq5EJg26D34JzAoaY+cMOAWLxh4Kc0DJoWgo7f4iDP3P+frAukcYLazy8oKPbHZtvxqxE6AoNdkfmNVoFz3qtC3SHbZSAIToqwWg5x0rVDZAeEnDJlkEkvunDOro/mtxxaAqM5tzGAPsipctewJtQ1e+skNks7P7TPqKe2ljV8BQwI5ojwjiQOZY98xHi9YqIme736LffJN1v8ZvCjAHevH5LiL+zfjkjbit9ekfwOmZPxMOSuYHgRcd4TSSeGAP94YTsXGIr26rkwobkArtbeFePfJIQ3bdVVj1Y8yGLwU67FjcRgyol+DzSv8OZlO1sD/GSZ0ZQ95c/mxEe0LbyJzZQ8zPXOnUdBxX390+vm/+mVy4w/YZ7YSm6b/bmugLtspTYHfLahB7SHu2M8sTfMnCwvoxd8VvmStI1FMtUraJnal0rCVHAcdOlg9AaI7BJWkqop1QOhFyRsTOlgg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2636.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e385f2-fb91-436d-8557-08d8802ad15b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2020 19:01:06.1533 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dxsj+pWQRE5Wd0QvZpMSAIHhuX7GxQhuPZffXh6tEef48pSP3UYd6p+K70WMtF/vOD7VpNUuerkSbnwdEEYam+8J1kha8qfZFORcKJjEuww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3993
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-03_08:2020-11-03,
 2020-11-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 spamscore=0 mlxscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011030126
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011030126
Cc: "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "Yuan,
 Perry" <Perry.Yuan@dell.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
> Sent: Tuesday, November 3, 2020 12:32
> To: Limonciello, Mario
> Cc: Pierre-Louis Bossart; Yuan, Perry; oder_chiou@realtek.com; alsa-
> devel@alsa-project.org; lgirdwood@gmail.com; linux-kernel@vger.kernel.org=
;
> tiwai@suse.com
> Subject: Re: [PATCH] ASoC: rt715:add Mic Mute LED control support
>=20
> On Tue, Nov 03, 2020 at 06:04:49PM +0000, Limonciello, Mario wrote:
>=20
> > I don't think it came through in the commit message, but I wanted to me=
ntion
> > in the system that prompted this software does not control the LED.  Th=
e LED
> > is actually controlled by hardware, but has circuitry to delay the hard=
ware
> > mute until software mute is complete to avoid any "popping noises".
>=20
> Ah, this doesn't correspond to the description at all.
>=20
> > The flow is:
> > User presses mute key, dell-wmi receives event, passes to dell-privacy-=
wmi.
> > This emits to userspace as KEY_MICMUTE.  Userspace processes it and via=
 UCM
> > switches get toggled.  The codec driver (or subsystem perhaps) will use=
 LED
> > trigger to notify to change LED.  This gets picked up by dell-privacy-a=
cpi.
>=20
> > dell-privacy-acpi doesn't actually change LED, but notifies that SW mut=
e was
> > done.
>=20
> > If none of that flow was used the LED and mute function still work, but
> there
> > might be the popping noise.
>=20
> With a timeout so that if things get lost somewhere then the mute button
> is still functional,=20

Exactly.

> or can userspace block mute?  Also what happens if
> userspace tries to set the state without having done anything about
> muting, will it trigger the hardware level mute as though the key had
> been pressed?

No, the hardware level mute is tied to the actual key.  If the software
mute is set, the LED won't change.  In this case this is what would happen:
1) Kcontrol flips
2) Codec / Subsystem notifies dell-privacy-acpi
3) Dell-privacy-acpi notifies SW mute is done
4) Nothing happens to HW mute / LED

There is functionality in dell-privacy to track the state of the HW mute
so later on this scenario can be expanded upon to emit an event from
dell-privacy that userspace can see and show a message along the lines of

"SW was muted, but HW mute still isn't set, press FN+F2 to set it".

That's follow up stuff for after the initial patch series is landed.

