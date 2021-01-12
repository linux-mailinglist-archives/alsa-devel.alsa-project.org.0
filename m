Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F842F27ED
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 06:36:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE9DB16D2;
	Tue, 12 Jan 2021 06:29:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE9DB16D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610429420;
	bh=Ef8VSla6g88MwYcFZ01wHDOVPfEV8uRRfDkNKvvb4ng=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ex/B0hpUX+pyVZ7eD6FuRYWTICCJ+lbFizFP7rRW6G1Zkns7Zb5bPt0zqF2eu1McW
	 J4pDbl6I/dvVbljhlnpdYZn/h9YrdtBL4VZdN5PlHZXz0zhKIDOIINk7tJORoD5Ki4
	 XgqssjeK3vViywq+zRUXlu0JbYuesCAUkhOm2Wh4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C661F8026F;
	Tue, 12 Jan 2021 06:28:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4FA6F8025E; Tue, 12 Jan 2021 06:28:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65089F800EB
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 06:28:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65089F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="FQwzIXio"; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=Dell.onmicrosoft.com header.i=@Dell.onmicrosoft.com
 header.b="SdW7QY/Y"
Received: from pps.filterd (m0170397.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10C5IIhm030241; Tue, 12 Jan 2021 00:28:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=Ef8VSla6g88MwYcFZ01wHDOVPfEV8uRRfDkNKvvb4ng=;
 b=FQwzIXiohDlejSUfvQ0K7Do57/Uy/RAYvZNIJFl1WJVi4DXyK+Ti3e8DZ2N2F3+KoQOK
 b7ThY8qkDTV41m8w/iitpikBKLxAobJerxVA+rR5OT3IE1meAjvw934TmMse6IvAijfi
 OYudlyn319gY/LpTImD58u2HHLRUN3I6VawVRqcZAFQHGBwFEx3lKwqHLHA0TGdZ6mPG
 dH+MDm5OF+8fs6C+4yksR1Q+R0YDnaowA5YZ2DNkU4IsmaOWajEH9jEQQ/3XLF7KaN2F
 6ar6PcOqDDCzcNm/jGFCUWbcoqzm9UEgMzFvJQga5PFgnVpWG3+SratnMb+UpMFN+qv3 yw== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0b-00154904.pphosted.com with ESMTP id 35y6ewquch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jan 2021 00:28:00 -0500
Received: from pps.filterd (m0133268.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10C5PaNX016739; Tue, 12 Jan 2021 00:27:59 -0500
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by mx0a-00154901.pphosted.com with ESMTP id 3612hsa9ww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jan 2021 00:27:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hpdUHIHVr28s2LgTCL5H99V70uVovcFdR21+F7uzZjhbsr5fMNrio9CVL6yLI7kTACvigdv2RngFlfkh5fK3xc2wQj7uAkwArIsGQH029QSlCffm0Ow8h75m9zuyMbbHPK/IAcEuHP4nIeqDRGmwUD3tKS8SjVWZemYz/BhC7J11UNg9H8h9Pnyde+gY2OaWaL9el9OAW6AYs5WFjTmcO1OUTc5UEbVwEacrYpFx9v8P0c+nTZ1mfeOunrRyf+WL+3O9LrV3KZh1QsEbddshYc456TK9c2tL07Ktjdb3Cyd+F9IaqDauYUjRIuKOaOACO0f5Zc1R8YKwKhe/UJGEhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ef8VSla6g88MwYcFZ01wHDOVPfEV8uRRfDkNKvvb4ng=;
 b=CSy17/5uvyzetSQ8g5rlLPzKuZXppS/Nvsg0X3kD/zwmSpvdzir+tntvfxDXctawsH2Ne7ID0ra/1vBIGG8alVeaP4qq+i4rhEDK73SqWV55JjShOpaU9AnjUjr+vRQ1OpCZpp42wKxWB0cV2Mz53p4CfPR4+2kyLGF9VEvkbo+jRkrYLldQ6zGU5YSc7TmcKjNgKqxU5sgeWNZs1NXPFU09lRjoYzdHmSY3N7+1VpW2GQn1a6ooE8/ouwt9vDWbuwMplz2fDI/1U9t5ugliV5thO/AesSyOIPIuug1kUGyJW2+PyhGNCp33QhJaapreqconhX6sP8NZkrtJp2KLMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com; 
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ef8VSla6g88MwYcFZ01wHDOVPfEV8uRRfDkNKvvb4ng=;
 b=SdW7QY/YmOsLrCkFDBUCQSz2Hw9OJF/QWfe31KZ15pbHRRSIAVfd4dfohkWFg7M1cOl4FekUAt8CrWM+7DIilh21UtPvs6WM39eXhzHcOIt/xzQ8F7Qrr2Fy8oyeIi+X4cU+0v/OBfTu0kk05MUCXZyfnUCOwrj1dz7CEVbx4xk=
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com (2603:10b6:a03:28a::6)
 by BY5PR19MB3427.namprd19.prod.outlook.com (2603:10b6:a03:1cb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 05:27:57 +0000
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::f49a:eb87:f48b:9e13]) by SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::f49a:eb87:f48b:9e13%5]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 05:27:57 +0000
From: "Yuan, Perry" <Perry.Yuan@dell.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "oder_chiou@realtek.com" <oder_chiou@realtek.com>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
Subject: RE: [PATCH v2 2/2] ASoC: rt715:add Mic Mute LED control support
Thread-Topic: [PATCH v2 2/2] ASoC: rt715:add Mic Mute LED control support
Thread-Index: AQHW3R7JEBZDYV5120aC5Vics2sfNKoizuyAgAC7FFA=
Date: Tue, 12 Jan 2021 05:27:57 +0000
Message-ID: <SJ0PR19MB4528225B226C4F9AA7F7ECBE84AA0@SJ0PR19MB4528.namprd19.prod.outlook.com>
References: <20201228133831.17464-1-Perry_Yuan@Dell.com>
 <a12075b1-09f3-a993-eace-008224ca5f52@linux.intel.com>
In-Reply-To: <a12075b1-09f3-a993-eace-008224ca5f52@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Perry_Yuan@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-01-12T05:27:54.6998913Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=1db1f06f-0d4f-4b2c-88ae-b672c477372f;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [114.84.248.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bce9964c-fb36-47b2-7b1c-08d8b6bad21c
x-ms-traffictypediagnostic: BY5PR19MB3427:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR19MB3427244058B6D5F71C357BEA84AA0@BY5PR19MB3427.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gwjdSljWQnb8gITA2wm1zJNUP1OgWSdL264BVSbcFCO6JUm1x6OzsDOUbigJvzLUylAiPzoSZAV+quBKs+M7nq37JEm9yFSuMvT2P0vs8DCpx5wALcaUu9j5pfE0SaeSI+osTsebGwVvLVQbiPRlPoWCpku7FNtUQ4w8xiA+2qTR7TuBB3A0k79blXVG/7cRqcpi7yzFVTA97dy1DTL+uKYRBU1bI8FkHSKrTu8ttI0M/hYIgQDP6tuArU0T9kXEtXQOSGDXQnYjXXGMKa4bWNIzu+GfKtgbKIk4ygBzR2/I22d8l+2k3xo8V71g3uQdYdBEWqQreWqvU2Wlvn3xgyaYNJ2pJsSFTwhwQnFL+ejAx8wxPwHULpYciCsBmK1EYwyTSmxgfe9FVpRJNKXYfw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR19MB4528.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(64756008)(786003)(66476007)(4326008)(6506007)(66556008)(53546011)(54906003)(316002)(71200400001)(66946007)(26005)(8936002)(66446008)(2906002)(83380400001)(9686003)(5660300002)(186003)(55016002)(478600001)(7696005)(110136005)(52536014)(8676002)(76116006)(33656002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?clhHeG00NWk4dS9VTlRXRU9KL3Q3WnR5YUZnbFJUYnlJNkZrY01wVFNBSVpa?=
 =?utf-8?B?NE4rN2NSL2ExRmhWM2J3TUhrQW1DSjhBQjFTdk1LSlMxVy9JSG00eFVmWDhP?=
 =?utf-8?B?ZlNIaXV4NDB4MjRxK0taMjZwZU9hbk02ZEZPenZ2SFFockpRa25hK0wyT2tl?=
 =?utf-8?B?MDdyU2dhdnpHM0JIUWVhUjdob2hFRFBDUzNZMng3QkxmdW9Bc001UWxHYitq?=
 =?utf-8?B?d2JUb1pQSVhFbGE5QXhIMXNnMDhCRGN5UUx2SlBGWUNaRHNTSVVzOXRJYjZn?=
 =?utf-8?B?RFZmNThIQUgrYzdXaE9aRTUxVUdVU21haEhUbkVSY0p0ckxyZitpR1pxckVW?=
 =?utf-8?B?eTdpdnhVNVhjeExrWlhRT2tYdnhwcStnSlZ2L0dyYm1ncjJSbjFMc3F3NzJF?=
 =?utf-8?B?aDZaRFRLT3l1VlE0OHljbW51R3A1LzB5emMzZFdpaFhVNFc2eFhUN0k4Vm5k?=
 =?utf-8?B?MmpxeUQ3STZ4SjZ0U2pmZ0tZUHdicXlBWnZ3TllhQWIycXc3dUtkRWluaGI5?=
 =?utf-8?B?cGNvVFRTQ3Rob1dYWUJjQllzRGlZTHRDS1UyYXZFbEJOK1MxcndMekNmbFgx?=
 =?utf-8?B?dXlrcW93akpQWjdyandOMmFacjAyRmRzdUhMbUpIVkIxdVFoeGcrZ3hJV0VF?=
 =?utf-8?B?V1F5eStkcnJEcW54Slo4MTJHVHpDSDhyZEVLU2llNkV0L0VzMDk3SGkxZHdE?=
 =?utf-8?B?N21pdVUyMVFlN2F1NkdYTXQySUdmc25ZT3F3QjBqMVR1TXBPdXFhTTUvdE1I?=
 =?utf-8?B?RHhLRHRUaDcwbFozTkNkRG91WjMycjJTWUxIZUVLUmVibUZ2WjY3TXZsZFYy?=
 =?utf-8?B?eDRPZHZWVU5FeEU0WFEzK1VLNVkxU1d6WTRXbi8wOGgwOTk1TFJlbVBRUzlQ?=
 =?utf-8?B?U1FYRkIxL3FoQ3FYNlRnNHpmbC8zTXBETjRjZXlIQThZV1JCS3RZM3dCdSt3?=
 =?utf-8?B?emovTnFpeDVKbGg5UUh2dEFwdFVvOHpETGxRSTU5T0tqRk42TG9pdTQxM0Nt?=
 =?utf-8?B?MktwTHRhL2w1cDdLanVCVU1tKzNwZU5pb29jTkZDRExvSm5KdHZaR0NCRGM0?=
 =?utf-8?B?d0tCMDZtVjBObGNjSmRGK08vcnB2NUhncGNaeG15cjBzTVB2ZHJnZjRSTGFN?=
 =?utf-8?B?Q2NLN2lqTDgzVFgzZTIxeTBMWHVCa0pGUllTUm9WQ1RlV1I1WFhxQUpZbldk?=
 =?utf-8?B?Um1rZk9hSk9qRENWT1R4Y3loSEllMUs5MDJRNG9XSXpQTHVUZlgzU0MraXkw?=
 =?utf-8?B?a0h1cTEzT2xXdDU0RzhsbEtYTXJLVFoxNzFmdXB3M3VqS3NJSFFYVXFZbFk0?=
 =?utf-8?Q?F5IHdejmihce8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR19MB4528.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bce9964c-fb36-47b2-7b1c-08d8b6bad21c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 05:27:57.7193 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ANpny0QY3YF4fSuyQnTgpGyf8Nhgx8f9LXsMKRkpTY5k+wLhhN8PKu9gGBqZnhPWYD/o8/VJXDj6OKXm+bMYow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB3427
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-12_01:2021-01-11,
 2021-01-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1011 mlxlogscore=999 spamscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101120031
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101120030
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "Limonciello, 
 Mario" <Mario.Limonciello@dell.com>
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

SGkgDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBpZXJyZS1Mb3VpcyBC
b3NzYXJ0IDxwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IDIw
MjHlubQx5pyIMTLml6UgMjowNw0KPiBUbzogWXVhbiwgUGVycnk7IG9kZXJfY2hpb3VAcmVhbHRl
ay5jb207IHBlcmV4QHBlcmV4LmN6OyB0aXdhaUBzdXNlLmNvbQ0KPiBDYzogYWxzYS1kZXZlbEBh
bHNhLXByb2plY3Qub3JnOyBMaW1vbmNpZWxsbywgTWFyaW87IGxnaXJkd29vZEBnbWFpbC5jb207
DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGJyb29uaWVAa2VybmVsLm9yZw0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHYyIDIvMl0gQVNvQzogcnQ3MTU6YWRkIE1pYyBNdXRlIExFRCBj
b250cm9sIHN1cHBvcnQNCj4gDQo+IA0KPiBbRVhURVJOQUwgRU1BSUxdDQo+IA0KPiANCj4gDQo+
IA0KPiA+IEBAIC0yNjgsNiArMjY5LDcgQEAgc3RhdGljIGludCBydDcxNV9zZGNhX3B1dF92b2xz
dyhzdHJ1Y3Qgc25kX2tjb250cm9sDQo+ICprY29udHJvbCwNCj4gPiAgIAl1bnNpZ25lZCBpbnQg
cmVnMiA9IG1jLT5ycmVnOw0KPiA+ICAgCXVuc2lnbmVkIGludCByZWcgPSBtYy0+cmVnOw0KPiA+
ICAgCXVuc2lnbmVkIGludCBtYXggPSBtYy0+bWF4Ow0KPiA+ICsJdW5zaWduZWQgaW50IHZhbDAs
IHZhbDE7DQo+ID4gICAJaW50IGVycjsNCj4gPg0KPiA+ICAgCXZhbCA9IHVjb250cm9sLT52YWx1
ZS5pbnRlZ2VyLnZhbHVlWzBdOyBAQCAtMjg2LDcgKzI4OCwyMiBAQCBzdGF0aWMNCj4gPiBpbnQg
cnQ3MTVfc2RjYV9wdXRfdm9sc3coc3RydWN0IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsDQo+ID4g
ICAJCWlmIChlcnIgPCAwKQ0KPiA+ICAgCQkJcmV0dXJuIGVycjsNCj4gPiAgIAl9DQo+ID4gLQ0K
PiA+ICsjaWYgSVNfRU5BQkxFRChDT05GSUdfREVMTF9QUklWQUNZKQ0KPiA+ICsJLyogUHJpdmFj
eSBMRUQgVHJpZ2dlciBTdGF0ZSBDaGFuZ2VkIGJ5IG11dGVkL3VubXV0ZSBzd2l0Y2ggKi8NCj4g
PiArCWlmIChtYy0+aW52ZXJ0KSB7DQo+ID4gKwkJdmFsMCA9IHVjb250cm9sLT52YWx1ZS5pbnRl
Z2VyLnZhbHVlWzBdOw0KPiA+ICsJCXZhbDEgPSB1Y29udHJvbC0+dmFsdWUuaW50ZWdlci52YWx1
ZVsxXTsNCj4gPiArCQlpZiAodmFsMCA9PSAxICYmIHZhbDEgPT0gMSkgew0KPiA+ICsJCQlydDcx
NS0+bWljbXV0ZV9sZWQgPSBMRURfT0ZGOw0KPiA+ICsJCQlsZWR0cmlnX2F1ZGlvX3NldChMRURf
QVVESU9fTUlDTVVURSwNCj4gPiArCQkJCQlydDcxNS0+bWljbXV0ZV9sZWQgPyBMRURfT04gOg0K
PiBMRURfT0ZGKTsNCj4gPiArCQl9IGVsc2UgaWYgKHZhbDAgPT0gMCAmJiB2YWwxID09IDApIHsN
Cj4gPiArCQkJcnQ3MTUtPm1pY211dGVfbGVkID0gTEVEX09OOw0KPiA+ICsJCQlsZWR0cmlnX2F1
ZGlvX3NldChMRURfQVVESU9fTUlDTVVURSwNCj4gPiArCQkJCQlydDcxNS0+bWljbXV0ZV9sZWQg
PyBMRURfT04gOg0KPiBMRURfT0ZGKTsNCj4gPiArCQl9DQo+ID4gKwl9DQo+ID4gKyNlbmRpZg0K
PiANCj4gU2hvdWxkIHRoaXMgYmUgYWN0aXZhdGVkIGZvciBzcGVjaWZpYyBETUkgcXVpcmtzPyBU
aGlzIGRyaXZlciBpcyB1c2VkIGluIG5vbi1EZWxsDQo+IHBsYXRmb3JtcyAoSSBhbSB0aGlua2lu
ZyBvZiBJbnRlbCBSVlBzIG9yIFJlYWx0ZWsgZGF1Z2h0ZXJib2FyZHMpLCBJIGFtIG5vdA0KPiBz
dXJlIGlmIGEgYnVpbGQtdGltZSBiZWhhdmlvciBjaGFuZ2UgbWFrZXMgc2Vuc2UuDQo+IA0KPiBP
ciBjb252ZXJzZWx5IGNvdWxkIHdlIGp1c3Qgc2V0IHRoZSBMRURzIHVuY29uZGl0aW9uYWxseSBp
ZiBkb2luZyBzbyBpcw0KPiBoYXJtbGVzcz8NCg0KVGhlIGN1cnJlbnQgbWljIG11dGUgbGVkIHNl
dHRpbmcgcGF0aCBpcyBub3QgY29tbW9uIHVzZWQgZm9yIG90aGVyIHZlbmRvcnMsIGp1c3QgRGVs
bCBwbGF0Zm9ybSANCnN1cHBvcnQgdGhpcyBtaWMgbXV0ZSBsZWQgc2V0IG9wZXJhdGlvbi4NCg0K
RG8geW91IHRoaW5rIHRoYXQgSSBuZWVkIHRvIGFkZCBvbmUgRE1JIHF1aXJrIGluIHRoZSBuZXh0
IHZlcnNpb24gPw0KSWYgc28sIEkgY2FuIGFkZCB0aGF0LiANCg0KDQpQZXJyeSAgWXVhbg0KRGVs
bCB8IENsaWVudCBTb2Z0d2FyZSBHcm91cCB8IENEQyBMaW51eCBPUyAgDQo=
