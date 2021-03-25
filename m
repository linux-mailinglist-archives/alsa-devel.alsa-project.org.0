Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E75B348ABD
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 08:54:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1B9A1663;
	Thu, 25 Mar 2021 08:53:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1B9A1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616658841;
	bh=KQdM0maHh6i6m+Fq3Fl+wODXKxc8mPP3lblV+eryMfs=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s9hhnlCNn1pjKcHQeCdjdxsGAoutiSc/khL6uFFb+vneTh3uXNW889qCQAbeArlO5
	 LpkEbRm3J6aXCV8ippCSrddPWdu1CTPSU0WtZCHScX2P/D5JmTgyfZXDWTp+TYyBCk
	 vum18Hxlp/KbCVNYbTrHj3tnFxgqChaz2En6iix4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E391BF80268;
	Thu, 25 Mar 2021 08:52:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6916DF8025F; Thu, 25 Mar 2021 08:52:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C336F80104
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 08:52:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C336F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="bAKDDqcr"
Received: from pps.filterd (m0170390.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12P7pivq005689; Thu, 25 Mar 2021 03:52:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=KQdM0maHh6i6m+Fq3Fl+wODXKxc8mPP3lblV+eryMfs=;
 b=bAKDDqcrPes1IqxOEsfH5xpX/Wg0jMSqzqUWNbd0SFGLb6UW/zNTRQoA2mxriuIJ9Mwi
 H4ha/vCVhAFTmWOMo+PNf1UydORxF9p1ysgivo1EfCDUBlO/ZU/1iAx4lxkwyVlO+QFm
 GedfTkwJOPTuomi5jRq7EK0hiKHDjg29IxWsh/h7zYVFatD0Khd0jL1P7Wc6Nod7yD2E
 tWnPwZN3RrN69q6iD7YdjxtXYMoROhTgexSnG1pSJrCF3yUVI5TE6fff+XI/33QR/Zr2
 DD4ZMMPTvfCgx/zwixHJcL1Ltj0FzSx0tslujMs3sWvc6fq+iqehfGtQazioXdAe2yOA XA== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0a-00154904.pphosted.com with ESMTP id 37dc43h8d9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 03:52:18 -0400
Received: from pps.filterd (m0134746.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12P7oL7E019083; Thu, 25 Mar 2021 03:52:17 -0400
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by mx0a-00154901.pphosted.com with ESMTP id 37dx2xnv3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 03:52:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CAYpmXvIFlgvj+Yf4fzdglnGoXHxQVRTJqnJ8akkq0tgziwDoVtkwpSQeuSVzrVnZrIoIF8KgT8Tu75nzclyjqwTB+2m/mRymis2fqtOeMWMQk5H/FiaPqd3nuxBwTPLI+KXzmPlZAbQO5qCu81N0gclDuJO4ZpQAqw9wHRB5wuzdUjI3QFdWfl/ybKMckdsMh0Jzy7VPA8CBAllS3K/QWCE8R69XCqY9QfJv6PDfNH+5HXke8Fnirc7EnKge50JMkk8xC6+uWj4xRKlwWCOw71Urtl4zmfxnyVo6JgkF7lqkck2ge7B0qL7cU3M/xbACZ36dhRWRAJdQxNkOsKtBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQdM0maHh6i6m+Fq3Fl+wODXKxc8mPP3lblV+eryMfs=;
 b=kOhFZn2znb4V2mgfqm8YLIDj9hkYPK8X4mPzAozXzGcUgk0Z01r6g5N6vwPHajYJpECwROd0I2avV37dQn5YmDGgY1wh2L2Wuu2e+JX0JoBoY7H6MbYtMcnojYlTWpecuHdIWIV6V1c9QbjJ05vR89tq7FRgqrw7GcMLVrmOVclWTGG3Ad8oAbxYcSDUCg58k2Ob/mILKEO47MUL0m+ilOjBEdumDFDc+ub5RtzFE27SImWRP6uEHxKh+tso/4zyTNACgFuWm5hFsgSEvrFnP5zhGD32LdZoOZCSs8P2+d4ezxhVUMXUAoiibr7wNmXLoaVdePvxL68Fty6AFevh0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com (2603:10b6:a03:28a::6)
 by SJ0PR19MB4479.namprd19.prod.outlook.com (2603:10b6:a03:281::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 25 Mar
 2021 07:52:15 +0000
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::8863:ccf2:c6a:d43a]) by SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::8863:ccf2:c6a:d43a%7]) with mapi id 15.20.3977.026; Thu, 25 Mar 2021
 07:52:15 +0000
From: "Yuan, Perry" <Perry.Yuan@dell.com>
To: Hans de Goede <hdegoede@redhat.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, "pobrn@protonmail.com"
 <pobrn@protonmail.com>, "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>, "Limonciello, Mario"
 <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v5 1/2] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
Thread-Topic: [PATCH v5 1/2] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
Thread-Index: AQHXHv8rB2ABk/P/MkKrDogynAXj3qqR7rGAgAAMBICAAl2zkA==
Date: Thu, 25 Mar 2021 07:52:15 +0000
Message-ID: <SJ0PR19MB4528ED97AA4A5D0821A3E68584629@SJ0PR19MB4528.namprd19.prod.outlook.com>
References: <20210322093841.11840-1-Perry_Yuan@Dell.com>
 <a1fae1fc-2d4f-63e8-e0be-0f9c4c91640c@linux.intel.com>
 <c61b975a-a771-eb63-5232-2da184ca95fe@redhat.com>
In-Reply-To: <c61b975a-a771-eb63-5232-2da184ca95fe@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [163.244.246.216]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13f87325-01c9-4c49-dd1b-08d8ef62e877
x-ms-traffictypediagnostic: SJ0PR19MB4479:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR19MB447914DAED79F4453F34F8C784629@SJ0PR19MB4479.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dKrZyoWfjRKrB5Z4NR/RvCGugjwf5pp1r45M1AQV0E0gZekcOp06YAupvFZ8bSQ7Z4eDJyL1qI3Jz6xX3JmT48PdS5bFTwhIH+05Hxp/WGxot4O+K4UW9ZZjj+h+Y38rFWT3zsX3FizROQqX21qZFoawiU+hhpihjkF3ItxPE1LikDHb/wTBpzFH5itIZxJ9GRn4moTYwafdzEVPkMiVDnUSP7epXsSQ+tuch4hmnKmvqhhg12owHewgrMXf2u5MvAzoshuPqv7weZg6m/P9630hJ+gOSrQt9oUYP4SEO1aR+nmQLfEq5brLvZVCkGHjkUVjE05PCFSznbke85/XiIlFj/7b5mhYLBLfuT2oiWCwhNzcwvncxi7zs6pYbtd3ZQZ7wx+4fGdhc0syffKHGoKXOrY49SdiSsJKihd6zp9fi61X0IKdvMg9lDywkrZXeTEaYmZH8Ad22pMAzSd7lvxWe+TIcqAB5lldLNggx+Q1kzbSU0lTopQIU/9K6TjGqRA8qUvjTuFuj4qzyAZRRP4zzmwPjzjq0sxc2L8gspOJLo6DkAtmCMIPmj3YrJU0FUUjJFLBX+z1afQMPVLWtV8Bo5T+16AkGa36yZ2/8WSotyThIyfEXZk/kqAGBEXoxvTwDfvtODPJ/hnD12kpDJ3dUVSJluq2iplkpHYMrbY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR19MB4528.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(2906002)(66946007)(55016002)(66556008)(7416002)(9686003)(66446008)(76116006)(33656002)(66476007)(54906003)(110136005)(86362001)(83380400001)(64756008)(53546011)(6636002)(8936002)(478600001)(6506007)(8676002)(38100700001)(186003)(71200400001)(4326008)(5660300002)(786003)(7696005)(316002)(52536014)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UHdHM3ZKbW15R0lMSFFPWWxQZDJMWmM0RXJHdlEzcXFLRitVVmgrOG8rOXdS?=
 =?utf-8?B?bi9vRUJFK2IxSTVRNURkTmNvc0NCdEc4b1pBeXNqT3pWK3JJVlA3ekYrNmFP?=
 =?utf-8?B?ZnNUVno0cHFIY2thZWNIcDF4WVRGTXZObkVlRG9mK3hvNUlJcUo4WTRuUWFp?=
 =?utf-8?B?eVlWUm9EMUk0K2tBYitFS2JuS0h5OXE1UUI2OFUyekd6SE13VnZlUzJCYS94?=
 =?utf-8?B?QnFaUHFjTE5lRWtyWjJNbjJJYjZDdlRnSlVtWGtSakNMWUxhRGVvVnU5Q1dj?=
 =?utf-8?B?SFhwSnV6eGhkVUM0Z2pxV3I5bmxBOFduQ1gzR3ZjQkJtckpqUWlMbEgzVjdw?=
 =?utf-8?B?UkdORmhnd2J5ajBROFEzVFIvZXorb1J3NWx2dlZ3cGhxQllhMk13RHBEZy9l?=
 =?utf-8?B?M2c0UlhpL1htY1BOR0VKcWY5d2VJdHo2RXc1cS9ndk1qWDhaMjV4M1RvTWda?=
 =?utf-8?B?bU5XK1lsZS9YSjhsM3JQMFdMVTZLelBrT095bWJkUWI3MFVaZ2U1ZU9jSTNX?=
 =?utf-8?B?VjAvV0FpbFVkU0dHYThQdkNocTE2aElIM1V1dUZMMUpwTG9HVUtycVRidVpy?=
 =?utf-8?B?aVMyd044aGQ0K2JESWNFN2pjdkhseUFvTFNxbVlwaU4yWmZsaGlSVHkxQkN0?=
 =?utf-8?B?cDduRkVaWHNwOGx0eDhJblBHK2VmT1BmQVlrM0xWM2NMSDRoVytuVmRNMGR4?=
 =?utf-8?B?OEJ0ZW5EaGJlNkdCU2gwRE5UMlFRZ25mOTlvSTluRG0yTURTNlRIU1pkdTlk?=
 =?utf-8?B?S1pzNVYrTkw5NlF6OGgxWFpIRHlYN1Y1RWdMSjNSdVFVaytiS29tclJZWHRV?=
 =?utf-8?B?NzZhWE9GMnNkRjVHa282Z3RTVGJiQXY1QVVGM25SYlA5QkJFS0JackJHUFdM?=
 =?utf-8?B?MytVbTJsMExvYXN1UExzRGhseit5b01HTU5qT1NnTEJEeXBXOFk0TUZOekd0?=
 =?utf-8?B?ODRQSm5Sazl2NFluaXEzbncvTGlFNk8wdkRMQlYxcDVKMzYyMjMzMVV6U3Jv?=
 =?utf-8?B?eHVIcmNURDV1S0hkYi93V1JPNHB0Nkp0OVk5cXRWL3BTL1ZZUGdsWjNCdE91?=
 =?utf-8?B?ZnRzbk9STXlXZjUzUjJpczYwN09nTXRLbWVZSlFPRlFlNGZYSXBHZUlRd0dT?=
 =?utf-8?B?alFXQjlic1cyeUVNb3BxWS9ZUUo4L1JzVDQ0ZFFkWHoxbTR4WjgyeVFWRzg2?=
 =?utf-8?B?NUM5ejFmR28vbzN3Q2pyQnM1NzZ5WXV0MFBTWW82a0RFTHBBUHhyUWR0M2lG?=
 =?utf-8?B?SHhOTUxjWGJ6RWNwNXVEN3VEWS8zTG9lTUsxazFxTWhKSVpWWmFyVUVDb3JR?=
 =?utf-8?B?d1pqb1B3eEJ2TUVYMkwvN3FmNDRkR01xZ3grdnBHU2k2Vko5SFBCdlNLWEw2?=
 =?utf-8?B?aW13UGEvTHJGazFjRXovblBrTzB5bWdGNmV3QVF6eWFwRmFOcUtRSnE1dG9a?=
 =?utf-8?B?Nzg3YXp1dE1uMzJIVUN1M01SenBvSzFmOTluSzNlQ2pFZG0yV0xBUUZxUm4w?=
 =?utf-8?B?ak51eU8wVHdzMXlGKzhSYkt6djRVaElwTGx2OU9tMmNpMXNPSmZKcndKN3Vs?=
 =?utf-8?B?dzc2aFhkRTVtdlZKSkIzcnU1eFpKU3VvOVdjVGw5VTFHSTBIWlVBdURQM05t?=
 =?utf-8?B?ZDBBTzJlZ2R0ak4vWDgxRFBCdGNHN1ZLSWVWVENPMWpobUtQbW9OSlliZ3RH?=
 =?utf-8?B?dkNGZVlwZ0hsVTVKMFR0dkM3R1NRSEpLVHZQUXNKZHlWbkxScHNJVGpOaVpK?=
 =?utf-8?Q?F9mhAOKfzbFeCatPmBfBpHDA0W88kLy2PHP6OHU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR19MB4528.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f87325-01c9-4c49-dd1b-08d8ef62e877
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2021 07:52:15.7355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OgzkNatgMBH0tqO/2vwnQ1Lp+mFA2sv+r1eZbA8AvanXv1asrymIVFo3A4xv3hwlJ5cSacYAzar4n7n/6E/GAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4479
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-25_01:2021-03-24,
 2021-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103250059
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103250059
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
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

SGkgSGFucy4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBIYW5zIGRl
IEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDI0
LCAyMDIxIDM6NDAgQU0NCj4gVG86IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0OyBZdWFuLCBQZXJyeTsg
cG9icm5AcHJvdG9ubWFpbC5jb207DQo+IG9kZXJfY2hpb3VAcmVhbHRlay5jb207IHBlcmV4QHBl
cmV4LmN6OyB0aXdhaUBzdXNlLmNvbTsNCj4gbWdyb3NzQGxpbnV4LmludGVsLmNvbTsgTGltb25j
aWVsbG8sIE1hcmlvDQo+IENjOiBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmc7IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxnaXJkd29vZEBnbWFpbC5jb207IHBsYXRmb3JtLWRy
aXZlci14ODZAdmdlci5rZXJuZWwub3JnOw0KPiBicm9vbmllQGtlcm5lbC5vcmcNCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2NSAxLzJdIHBsYXRmb3JtL3g4NjogZGVsbC1wcml2YWN5OiBBZGQgc3Vw
cG9ydCBmb3IgRGVsbA0KPiBoYXJkd2FyZSBwcml2YWN5DQo+IA0KPiANCj4gW0VYVEVSTkFMIEVN
QUlMXQ0KPiANCj4gSGksDQo+IA0KPiBPbiAzLzIzLzIxIDc6NTcgUE0sIFBpZXJyZS1Mb3VpcyBC
b3NzYXJ0IHdyb3RlOg0KPiA+IE1pbm9yIGNvbW1lbnRzIGJlbG93Lg0KPiANCj4gPHNuaXA8DQo+
IA0KPiA+PiAraW50IF9faW5pdCBkZWxsX3ByaXZhY3lfYWNwaV9pbml0KHZvaWQpDQo+ID4NCj4g
PiBpcyB0aGUgX19pbml0IG5lY2Vzc2FyeT8gWW91IGNhbGwgdGhpcyByb3V0aW5lIGZyb20gYW5v
dGhlciB3aGljaCBhbHJlYWR5IGhhcw0KPiB0aGlzIHF1YWxpZmllci4NCj4gDQo+IFllcyB0aGlz
IGlzIG5lY2Vzc2FyeSwgYWxsIGZ1bmN0aW9ucyB3aGljaCBhcmUgb25seSB1c2VkIGR1cmluZyBt
b2R1bGVfbG9hZCAvDQo+IGZyb20gdGhlIG1vZHVsZSdzIGluaXQgZnVuY3Rpb24gbXVzdCBiZSBt
YXJrZWQgYXMgX19pbml0IHNvIHRoYXQgdGhlIGtlcm5lbA0KPiBjYW4gdW5sb2FkIHRoZW0gYWZ0
ZXIgbW9kdWxlIGxvYWRpbmcgaXMgZG9uZS4NCj4gDQo+IEkgZG8gd29uZGVyIGlmIHRoaXMgb25l
IHNob3VsZCBub3QgYmUgc3RhdGljIHRob3VnaCAoSSd2ZSBub3QgbG9va2VkIGF0IHRoaXMNCj4g
cGF0Y2ggaW4gZGV0YWlsIHlldCkuDQo+IA0KPiA+DQo+ID4+ICt7DQo+ID4+ICvCoMKgwqAgaW50
IGVycjsNCj4gPj4gK8KgwqDCoCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2Ow0KPiA+PiAr
DQo+ID4+ICvCoMKgwqAgaWYgKCF3bWlfaGFzX2d1aWQoREVMTF9QUklWQUNZX0dVSUQpKQ0KPiA+
PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9ERVY7DQo+ID4+ICsNCj4gPj4gK8KgwqDCoCBw
cml2YWN5X2FjcGkgPSBremFsbG9jKHNpemVvZigqcHJpdmFjeV9hY3BpKSwgR0ZQX0tFUk5FTCk7
DQo+ID4+ICvCoMKgwqAgaWYgKCFwcml2YWN5X2FjcGkpDQo+ID4+ICvCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gLUVOT01FTTsNCj4gPj4gKw0KPiA+PiArwqDCoMKgIGVyciA9IHBsYXRmb3JtX2RyaXZl
cl9yZWdpc3RlcigmZGVsbF9wcml2YWN5X3BsYXRmb3JtX2Rydik7DQo+ID4+ICvCoMKgwqAgaWYg
KGVycikNCj4gPj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gcGRydl9lcnI7DQo+ID4+ICsNCj4gPj4g
K8KgwqDCoCBwZGV2ID0gcGxhdGZvcm1fZGV2aWNlX3JlZ2lzdGVyX3NpbXBsZSgNCj4gPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgUFJJVkFDWV9QTEFURk9STV9OQU1FLCBQTEFURk9STV9ERVZJ
RF9OT05FLCBOVUxMLCAwKTsNCj4gPj4gK8KgwqDCoCBpZiAoSVNfRVJSKHBkZXYpKSB7DQo+ID4+
ICvCoMKgwqDCoMKgwqDCoCBlcnIgPSBQVFJfRVJSKHBkZXYpOw0KPiA+PiArwqDCoMKgwqDCoMKg
wqAgZ290byBwZGV2X2VycjsNCj4gPj4gK8KgwqDCoCB9DQo+ID4+ICsNCj4gPj4gK8KgwqDCoCBy
ZXR1cm4gMDsNCj4gPj4gKw0KPiA+PiArcGRldl9lcnI6DQo+ID4+ICvCoMKgwqAgcGxhdGZvcm1f
ZGV2aWNlX3VucmVnaXN0ZXIocGRldik7DQo+ID4+ICtwZHJ2X2VycjoNCj4gPj4gK8KgwqDCoCBr
ZnJlZShwcml2YWN5X2FjcGkpOw0KPiA+PiArwqDCoMKgIHJldHVybiBlcnI7DQo+ID4+ICt9DQo+
ID4+ICsNCj4gPj4gK3ZvaWQgX19leGl0IGRlbGxfcHJpdmFjeV9hY3BpX2V4aXQodm9pZCkNCj4g
Pg0KPiA+IGlzIHRoZSBfX2V4aXQgcmVxdWlyZWQgaGVyZT8NCj4gDQo+IElkZW0uIEFsc28gc3Rh
dGljID8NCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiBIYW5zDQo+IA0KDQpJZiBhZGRpbmcgc3RhdGlj
IHRvIHRoZSBmdW5jdGlvbiwgIEkgd2lsbCBiZSB3b3JyaWVkIGFib3V0IHRoYXQgdGhlIGluaXQg
YW5kIGV4aXQgY2Fubm90IGJlIGNhbGxlZCBieSBhbm90aGVyIGZpbGUgLg0KDQoNCg0KPiANCj4g
DQo+ID4NCj4gPj4gK3sNCj4gPj4gK8KgwqDCoCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
ID0NCj4gPj4gK3RvX3BsYXRmb3JtX2RldmljZShwcml2YWN5X2FjcGktPmRldik7DQo+ID4+ICsN
Cj4gPj4gK8KgwqDCoCBwbGF0Zm9ybV9kZXZpY2VfdW5yZWdpc3RlcihwZGV2KTsNCj4gPj4gK8Kg
wqDCoCBwbGF0Zm9ybV9kcml2ZXJfdW5yZWdpc3RlcigmZGVsbF9wcml2YWN5X3BsYXRmb3JtX2Ry
dik7DQo+ID4+ICvCoMKgwqAga2ZyZWUocHJpdmFjeV9hY3BpKTsNCj4gPj4gK30NCj4gPj4gKw0K
PiA+PiArTU9EVUxFX0FVVEhPUigiUGVycnkgWXVhbiA8cGVycnlfeXVhbkBkZWxsLmNvbT4iKTsN
Cj4gPj4gK01PRFVMRV9ERVNDUklQVElPTigiREVMTCBQcml2YWN5IEFDUEkgRHJpdmVyIik7DQo+
ID4+ICtNT0RVTEVfTElDRU5TRSgiR1BMIik7DQo+ID4NCj4gPg0KDQo=
