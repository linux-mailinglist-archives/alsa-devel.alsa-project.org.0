Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF23D348B68
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 09:21:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 568A215E5;
	Thu, 25 Mar 2021 09:20:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 568A215E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616660503;
	bh=tJ0ZMcfr9xC3zjyCDFuQuyQLPsLfFZg8TscOz7v2jQw=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bOpCK1LfZQtUhMreNswDSjOyBIPkI4MiuKb9eIXlzRciDDnQxaVpGmIqVFy4xyjM/
	 NjTd3rpkBhfqcJKP5lUFsZmNFbdnPNYOTTC2DC499I+FY0blnBVUdSPMiiMitvw/gB
	 2y6UXwY6ni6zjLXzqrVm3YAFvY00O5T3H4Z3rziY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81D09F8026D;
	Thu, 25 Mar 2021 09:20:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AB42F8025F; Thu, 25 Mar 2021 09:20:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A6C7F80103
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 09:20:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A6C7F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="rlpdMPIU"
Received: from pps.filterd (m0170398.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12P8I90n022068; Thu, 25 Mar 2021 04:20:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=tJ0ZMcfr9xC3zjyCDFuQuyQLPsLfFZg8TscOz7v2jQw=;
 b=rlpdMPIUcFQKrZLkpb8lztWLx17TVlQlZRcMHxNnEXfzCgtk4/OMpifRJ67Xp7JSFPE0
 DXeowlZfKfPYhIthtLiDvbsMYWbRColNW4Z3lw/jfsSyw2CvTKwEQ6mT3DDzXfU5FSCv
 hTc28x8o4onWV0Z6MKCQd6+5mwiks2BBz68qjjL+j/VYCXxVuyXnGw8jxRMgJQBNUA/6
 yhYK0yFpm2wNwy7RKeEys05CJ8D0LpgyuLL8l6ZPCuSq5bt1+vucLRsAdZPOHldmP7Jb
 r+qNmXi+NVdwBtFuN4Ra867D/eCcZlpdJErKLKXHIYuIiY+Laeb0e8tQxuLiQ4ytCI5o tw== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0b-00154904.pphosted.com with ESMTP id 37dc98s97n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 04:20:01 -0400
Received: from pps.filterd (m0134746.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12P8ATpv063968; Thu, 25 Mar 2021 04:20:00 -0400
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by mx0a-00154901.pphosted.com with ESMTP id 37dx2xp6f6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 04:20:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DVsN4sZhiku5T1Qqc/js6nPZvj+BULEV079OF/N+UxhW8XU/ebjLJ8CJPs0ifp95GlNwFuBEehEGFXyaVBaacDhuRXw4Eom9bEr08+bDcAn0RE2p7ab1tGnERR7SWYljXErAGTK5gSK/tBgI0bX0qpeYJVPNchx7aNJIO0tSwEaLxY+0xMPITd0XoSFkAqEEbyJPUteSgASr6WGfQxXTiclCQNZ0NshY/qoizpl2EFC/K+Y0cPrZCJIp2rLlKuylLguxMTKj6ZS+xA8cnj+t6A0okH7Nf/+Z5QreYccM4wBAb1IrOinye85hW/lnux2NRb4ZvQ/5tRf84U5W2rRScA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJ0ZMcfr9xC3zjyCDFuQuyQLPsLfFZg8TscOz7v2jQw=;
 b=hEO0QniGCP3CiI+q/jNMaiECnE81L/VboNCWbJy7kg3vCVW6XH8aLtD309zshWSUs2nMxvItdBxyr3OOSjPJaUxFm9kcKTMljbDBXNjDk8MJm35Wx4SGXzs1X4qVcsfgka1h8v9HEud82byVMMWOkAG9EdcQX8L6XfCdX+5b/JE65Zx3rb8HX7dyB0863+ZJYgsAeCHWuvdsqYC+BTbJRg/gyJGcxdMzAFtlnbTDGbVfOcd1/VyvtFeyZgWHpRmLnxL8Z43mlbezEXxwO+fY1JIIVSjFrIaAhRt51s5owqtpJ7THxk4PVI2Y1s+KrrJ/MMdqI2bxZtvbPWjUPx9YMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com (2603:10b6:a03:28a::6)
 by SJ0PR19MB4778.namprd19.prod.outlook.com (2603:10b6:a03:2ca::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Thu, 25 Mar
 2021 08:19:58 +0000
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::8863:ccf2:c6a:d43a]) by SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::8863:ccf2:c6a:d43a%7]) with mapi id 15.20.3977.026; Thu, 25 Mar 2021
 08:19:58 +0000
From: "Yuan, Perry" <Perry.Yuan@dell.com>
To: Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "Limonciello, Mario"
 <Mario.Limonciello@dell.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>
Subject: RE: [PATCH v4 2/2] ASoC: rt715:add micmute led state control supports
Thread-Topic: [PATCH v4 2/2] ASoC: rt715:add micmute led state control supports
Thread-Index: AQHXDn6s4PfzwhTth0aZP8v1kYirtKp6YrWAgBVxBJCAAGEogIAESkbQ
Date: Thu, 25 Mar 2021 08:19:58 +0000
Message-ID: <SJ0PR19MB4528A75314336D1B756CAFE784629@SJ0PR19MB4528.namprd19.prod.outlook.com>
References: <20210301093834.19524-1-Perry_Yuan@Dell.com>
 <20210308172409.GF4656@sirena.org.uk>
 <SJ0PR19MB4528847687FEEE4A4DED8E3F84659@SJ0PR19MB4528.namprd19.prod.outlook.com>
 <604693cc-08c7-2b5f-632a-58ed537c54a0@perex.cz>
In-Reply-To: <604693cc-08c7-2b5f-632a-58ed537c54a0@perex.cz>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: perex.cz; dkim=none (message not signed)
 header.d=none;perex.cz; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [163.244.246.208]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65aab70e-fcf3-40c2-fd16-08d8ef66c741
x-ms-traffictypediagnostic: SJ0PR19MB4778:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR19MB47788B73128A24DAC854244084629@SJ0PR19MB4778.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pkA3GXaEhkKOW9CIBeTaNqNRbpqWAtPfpFHEBXyT6SxehwTkkIu5aeGGWBfF6eefsxBIXUfc+8qSLXwLtd3wawK4BeAEcrDK5tTB8OcqwCWdq1NWvHBkYR0fXdkrPX39sVuM3oKGwN8vGxYHMYVSUvBZxnSkQw5YCgwlaUMKnukOncBoUnFGpNZOvNI7HKlmqqqH0JY7n2gNTO0d3BZTay9T5onQDSA+vqNRwP5H9J5HPIuNM2NzH3z1vUnC3oEpfGt7OlTdCRI4z2eaUq01ErD6Ki0rtToLtSNiFCjXL/9RfUxeBHHWz0rdjuwmM4EimK1SWIHonvzmN7T/56eyLYrIYzqyJH70skIudw9To02faNB9XpmEQzsJLF5RmdC4eE4oK0Rx49+p3Zs8zL0R84hAp6IkUU91NaO8SOYwEdUSFfqv+nQwQTTrbUWnGZPW/UkOtVLnwQ+M8OAMcRih/s334zXNTkTJxfhUt75LVsjG03am5IfQOUxkARWDftKBhRlFPoSSpOV4ALkVBtDlRCYYMwff2y/aNqlyukXZBWmzpKPsDZw7oKIsYZ4gbJdAhP+bJWIK8T4njrHKerxOutSGJaLEYJRfHsSdbk/1miJST98TF1URcJJU4dTg5xu3BvcGXsS3XL0FO/pt/ZsOraNeXgpWXL+sWzRkQ5CZmN3VIh+qCehyQO8ocYRk0+TSw1HekUk1w67hzrdil6GNQWIWOPj2X3FaqW4raR8DhtoxkN+fcqmpCxhomNzLYNjU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR19MB4528.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(66556008)(7696005)(66476007)(66446008)(52536014)(110136005)(64756008)(66946007)(71200400001)(4326008)(55016002)(2906002)(786003)(54906003)(316002)(5660300002)(38100700001)(76116006)(86362001)(9686003)(26005)(7416002)(478600001)(83380400001)(8676002)(8936002)(33656002)(966005)(53546011)(6506007)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?MzVIOWFKT1pGR3YrdFM3aFZrWmlUM3J0VVNKUjh6ZWJ4NmtGOHpGWk1aMWpU?=
 =?utf-8?B?MWFkWUJkTWdNNlBVMGs3ZWZuUVpFT2NGMFZBTXh4dkg3R2lNbW53bUlqbVF4?=
 =?utf-8?B?ZWo2a2ZiSno3dEUrTzVEazhuSnpNN3R2M08zNVQ5REhlM3BNTDFZU0Y4SUJW?=
 =?utf-8?B?eWx0TmVVQVdZV05YUlNxdTltamdGZWZZcDZHQkNXUkpWMWgvVGNEaVZMSG4x?=
 =?utf-8?B?RXN1dUNFWXhPQjh0K3RubW1kVHN6b3VvSGg1dHVBMkZ2ZlNEUXBSZUZPNzNE?=
 =?utf-8?B?YmNVUXduUEdJektNSFVKUGwrbmlBTkZjWFVqQlNLUzJ4eGl5eGFSaGsvZ242?=
 =?utf-8?B?UE9CK0E2WVRGZzdGSXhzc2lCZXhoSnBXcXNrM3l5UkpiNFFOaWNkcDg1dUM1?=
 =?utf-8?B?NWt0VDBoZG02WnlzbDFUcll1c0gyaXdQczd5MWhSZ1lvaGlQWkZHRHlYZkM4?=
 =?utf-8?B?QlQ4UndjUVBGd25HYTRXc2w2WmhvMStUQ01QZ0lWMmJyRWd5clBia2VWYWNJ?=
 =?utf-8?B?bGRCczBCR3ovcllmYkgvaHdyZ1BqZUc5b1FvR056eFdCK2IyZHhsL2VPeUli?=
 =?utf-8?B?ZDV2TDhtVFJvT1ZzSmF4OGwzT2dUV2I1d05aQTlIcCt3eW5QK2ZzNk1CTmhn?=
 =?utf-8?B?YzdIMHVzTmxmeTdBaktBeVBqSlo0STBRNThQSDZDVjJzOEtQV3J6ekRVOWQ1?=
 =?utf-8?B?bkordy9pTkN2S0xvVUoxZTFVMGdlSUNVK1JnVlpyQnlqY0hnWVRHZVFGeFFo?=
 =?utf-8?B?c0VhTUN2UEFyMUxmUjN5c2lHZyswRGhMaW1Pd3l0bUtsRWpweVVuTERGWWF6?=
 =?utf-8?B?cFF3YTdDOW8wSUpsWlpxTk1jZlNvRDNicVBSKzBLeXdTRHRPZEdZZHExM2JM?=
 =?utf-8?B?ZitjdnIvSnc1WmdjT3ZMYmFySUppTklTWjkzUFY3cjc1K0pWVVl6T09CYVh4?=
 =?utf-8?B?M3hlQm5CM3Z1eG5CYVp2VmlobHVhWDJDL1dhWXVqYmdKa0RBUndsdTJ6UDVw?=
 =?utf-8?B?SzJWS2Vzd05qWFZVT0hhaFpNc2FxSVhwN2MzZmdxVWlKK2MxZXc4a2hiZktX?=
 =?utf-8?B?TTNDbWFibDNYTHdudU1JRjRmK0g4TkVMTHpKbWxpZjgzMHc1NDlXL0Z5MWF2?=
 =?utf-8?B?UnBQS0hncVFUb1hFVG9lQzhoVi80SzVIRkQyL2JQczBKb3JmbHBYQUtzMkhU?=
 =?utf-8?B?S0pEK1VBbzFQM1JhZktwTmQ5TVBtVG5BWFB0djBlOGcrQm93clorbXN3K2po?=
 =?utf-8?B?SkhxV3JsVlVmK3RFSTNiQjkxbTVBZitjYTF1ZXR5c25GN0h1djBpWm5OeUQw?=
 =?utf-8?B?cVZuNXRZT1QwR3dmcE8yK3M0Znp0MjQvbnJ5R09wZ3RUa3VFVjRNdmx3SnRL?=
 =?utf-8?B?b1BaQTVJd0Z6b1JMekthVG5sNlUxbEFHK3VuRmxSRGIrdm10cEhBdnJNN2p4?=
 =?utf-8?B?NlZ2Z1p2SFFqeGRPR2EvclFNeGR2b21scHZNYmd5Z2lqQ29ZSVF3VkR0WGZz?=
 =?utf-8?B?YkRKWUFQMVp6QUt3Wmo1K0o1amQxNGNoU3JBb1dQSlZrbXJ1dVk0c005UnZv?=
 =?utf-8?B?UlhpRmVRTkJibFhwLytIa3lSTkRiTElCN215S0g4eHRxcmc2dHZGZ20waURJ?=
 =?utf-8?B?cGYxRlNMVGZhYnBGWHljay9ndGxEWEhWTVR1YnlEbXBEZXpuc1BtU25EU1Ey?=
 =?utf-8?B?YlNTTGxIYmdmWmNubjBJMHBFekdaQ2UzY25YVEdXdkhINmZIVzdZN2szQTMr?=
 =?utf-8?Q?cpFIdOV6hInURgiYAS9BO+H3m0cvdvffFPmPS5M?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR19MB4528.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65aab70e-fcf3-40c2-fd16-08d8ef66c741
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2021 08:19:58.0951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J2WlkoCo07R/sFX5QolHqW158JCgviUkWXf+gZkWqZ59We/7zNu4Ik9Y/nj5ixLmZsW/9eRWdipJ1OT2+BuHGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4778
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-25_01:2021-03-24,
 2021-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=982 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103250062
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 spamscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103250063
Cc: "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "pobrn@protonmail.com" <pobrn@protonmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
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

SGkgSmFyb3NsYXY6DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFy
b3NsYXYgS3lzZWxhIDxwZXJleEBwZXJleC5jej4NCj4gU2VudDogTW9uZGF5LCBNYXJjaCAyMiwg
MjAyMSAxMDozOCBQTQ0KPiBUbzogWXVhbiwgUGVycnk7IE1hcmsgQnJvd247IHBpZXJyZS1sb3Vp
cy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbTsNCj4gTGltb25jaWVsbG8sIE1hcmlvOyBoZGVnb2Vk
ZUByZWRoYXQuY29tDQo+IENjOiBwb2JybkBwcm90b25tYWlsLmNvbTsgb2Rlcl9jaGlvdUByZWFs
dGVrLmNvbTsgdGl3YWlAc3VzZS5jb207DQo+IG1ncm9zc0BsaW51eC5pbnRlbC5jb207IGxnaXJk
d29vZEBnbWFpbC5jb207IGFsc2EtZGV2ZWxAYWxzYS0NCj4gcHJvamVjdC5vcmc7IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7IHBsYXRmb3JtLWRyaXZlci0NCj4geDg2QHZnZXIua2VybmVs
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDIvMl0gQVNvQzogcnQ3MTU6YWRkIG1pY211
dGUgbGVkIHN0YXRlIGNvbnRyb2wNCj4gc3VwcG9ydHMNCj4gDQo+IA0KPiBbRVhURVJOQUwgRU1B
SUxdDQo+IA0KPiBEbmUgMjIuIDAzLiAyMSB2IDEwOjI1IFl1YW4sIFBlcnJ5IG5hcHNhbChhKToN
Cj4gPiBIaSBNYXJrOg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+
IEZyb206IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4NCj4gPj4gU2VudDogVHVlc2Rh
eSwgTWFyY2ggOSwgMjAyMSAxOjI0IEFNDQo+ID4+IFRvOiBZdWFuLCBQZXJyeQ0KPiA+PiBDYzog
cG9icm5AcHJvdG9ubWFpbC5jb207IHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNv
bTsNCj4gPj4gb2Rlcl9jaGlvdUByZWFsdGVrLmNvbTsgcGVyZXhAcGVyZXguY3o7IHRpd2FpQHN1
c2UuY29tOw0KPiA+PiBoZGVnb2VkZUByZWRoYXQuY29tOyBtZ3Jvc3NAbGludXguaW50ZWwuY29t
OyBMaW1vbmNpZWxsbywgTWFyaW87DQo+ID4+IGxnaXJkd29vZEBnbWFpbC5jb207IGFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZzsgbGludXgtDQo+ID4+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
IHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnDQo+ID4+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjQgMi8yXSBBU29DOiBydDcxNTphZGQgbWljbXV0ZSBsZWQgc3RhdGUgY29udHJvbA0K
PiA+PiBzdXBwb3J0cw0KPiA+Pg0KPiA+PiBPbiBNb24sIE1hciAwMSwgMjAyMSBhdCAwNTozODoz
NFBNICswODAwLCBQZXJyeSBZdWFuIHdyb3RlOg0KPiA+Pg0KPiA+Pj4gKwkvKiBNaWNtdXRlIExF
RCBzdGF0ZSBjaGFuZ2VkIGJ5IG11dGVkL3VubXV0ZSBzd2l0Y2ggKi8NCj4gPj4+ICsJaWYgKG1j
LT5pbnZlcnQpIHsNCj4gPj4+ICsJCWlmICh1Y29udHJvbC0+dmFsdWUuaW50ZWdlci52YWx1ZVsw
XSB8fCB1Y29udHJvbC0NCj4gPj4+IHZhbHVlLmludGVnZXIudmFsdWVbMV0pIHsNCj4gPj4+ICsJ
CQltaWNtdXRlX2xlZCA9IExFRF9PRkY7DQo+ID4+PiArCQl9IGVsc2Ugew0KPiA+Pj4gKwkJCW1p
Y211dGVfbGVkID0gTEVEX09OOw0KPiA+Pj4gKwkJfQ0KPiA+Pj4gKwkJbGVkdHJpZ19hdWRpb19z
ZXQoTEVEX0FVRElPX01JQ01VVEUsIG1pY211dGVfbGVkKTsNCj4gPj4+ICsJfQ0KPiA+Pg0KPiA+
PiBUaGVzZSBjb25kaXRpb25hbHMgb24gaW52ZXJzaW9uIHNlZW0gd2VpcmQgYW5kIGNvdW50ZXJp
bnR1aXRpdmUuICBJZg0KPiA+PiB3ZSdyZSBnb2luZyB3aXRoIHRoaXMgYXBwcm9hY2ggaXQgd291
bGQgcHJvYmFibHkgYmUgY2xlYXJlciB0byBkZWZpbmUNCj4gPj4gYSBjdXN0b20gb3BlcmF0aW9u
IGZvciB0aGUgYWZmZWN0ZWQgY29udHJvbHMgdGhhdCB3cmFwcyB0aGUgc3RhbmRhcmQNCj4gPj4g
b25lIGFuZCBhZGRzIHRoZSBMRUQgc2V0dGluZyByYXRoZXIgdGhhbiBrZXlpbmcgb2ZmIGludmVy
dCBsaWtlIHRoaXMuDQo+ID4NCj4gPiBDdXJyZW50bHkgdGhlIHNvZiBzb3VuZHdpcmUgZHJpdmVy
IGhhcyBubyBnZW5lcmljIGxlZCBjb250cm9sIHlldC4NCj4gPiBUaGlzIHBhdGNoIGNhbiBoYW5k
bGUgdGhlIGxlZCBjb250cm9sIG5lZWRzIGZvciBNSUMgbXV0ZSBMRUQsIGRlZmluaXRlbHkNCj4g
dGhlIHBhdGNoIGlzIGEgc2hvcnQgdGVybSBzb2x1dGlvbi4NCj4gPiBUaGVyZSBpcyBhIGZlYXR1
cmUgcmVxdWVzdCBkaXNjdXNzaW9uIHdoZW4gd2Ugc3RhcnRlZCB0byBpbXBsZW1lbnQgdGhpcw0K
PiBzb2x1dGlvbi4NCj4gPiBodHRwczovL2dpdGh1Yi5jb20vdGhlc29mcHJvamVjdC9saW51eC9p
c3N1ZXMvMjQ5NiNpc3N1ZWNvbW1lbnQtDQo+IDcxMzg5Mg0KPiA+IDYyMA0KPiA+DQo+ID4gVGhl
IHdvcmthYmxlIHdheSBmb3Igbm93IGlzIHRoYXQgd2UgcHV0IHRoZSBMRUQgbXV0ZSBjb250cm9s
IHRvIHRoZQ0KPiBjb2RlYyBkcml2ZXIuDQo+ID4gV2hlbiB0aGVyZSBpcyBuZXcgYW5kIGZ1bGwg
c291bmQgTEVEIHNvbHV0aW9uIGltcGxlbWVudGVkLCB0aGlzIHBhcnQNCj4gd2lsbCBiZSBhbHNv
IG9wdGltaXplZC4NCj4gPiBUaGUgSGFyZHdhcmUgcHJpdmFjeSBmZWF0dXJlIG5lZWRzIHRoaXMg
cGF0Y2ggdG8gaGFuZGxlIHRoZSBNaWMgbXV0ZQ0KPiBsZWQgc3RhdGUgY2hhbmdlLg0KPiA+IEJl
Zm9yZSB0aGF0IGZ1bGwgc29sdXRpb24gcmVhZHkgaW4ga2VybmVsLCBjb3VsZCB3ZSB0YWtlIHRo
aXMgYXMgc2hvcnQgdGVybQ0KPiBzb2x1dGlvbj8NCj4gDQo+IFBlcnJ5LCBpdCdzIGFib3V0IHRo
ZSBtYWNoaW5lIGRldGVjdGlvbi4gWW91ciBjb2RlIGlzIHRvbyBtdWNoIGdlbmVyaWMgZXZlbg0K
PiBmb3IgdGhlIHRvcC1sZXZlbCBMRUQgdHJpZ2dlciBpbXBsZW1lbnRhdGlvbi4gV2UgbmVlZCBh
biBleHRyYSBjaGVjaywgaWYgdGhlDQo+IHByb3BlciBMRUQncyBhcmUgcmVhbGx5IGNvbnRyb2xs
ZWQgb24gdGhlIHNwZWNpZmljIGhhcmR3YXJlLiBPdGhlciBoYXJkd2FyZQ0KPiBtYXkgdXNlIFJU
NzE1IGZvciBhIGRpZmZlcmVudCBwdXJwb3NlLiBVc2UgRE1JIC8gQUNQSSBjaGVja3MgdG8gZGV0
ZWN0IHRoaXMNCj4gaGFyZHdhcmUgYW5kIGRvbid0IG1pc3VzZSB0aGUgaW52ZXJzaW9uIGZsYWcg
dG8gZW5hYmxlIHRoaXMgY29kZS4NCj4gDQo+IAkJCQkJCUphcm9zbGF2DQo+IA0KPiAtLQ0KPiBK
YXJvc2xhdiBLeXNlbGEgPHBlcmV4QHBlcmV4LmN6Pg0KPiBMaW51eCBTb3VuZCBNYWludGFpbmVy
OyBBTFNBIFByb2plY3Q7IFJlZCBIYXQsIEluYy4NCg0KSW4gdGhlIFYyIHBhdGNoLCBJIGhhdmUg
YWRkZWQgdGhlIG1hY2hpbmUgZGV0ZWN0aW9uLCBidXQgc29tZSBndXlzIHRob3VnaHQgdGhhdCBJ
IHNob3VsZCByZW1vdmUgdGhlIGRldGVjdGlvbiBmb3IgaXQgaXMgaGFybWxlc3MgdG8gb3RoZXIg
c3lzdGVtDQpTbyBJIHJlbW92ZSBpdCBpbiB0aGUgZm9sbG93aW5nIHBhdGNoZXMuDQoNCklzIGl0
IE9rIGZvciB5b3UgaWYgSSBhZGQgYmVsb3cgZGV0ZWN0aW9uIG9mIERlbGwgc3lzdGVtIHdoaWNo
IGVuYWJsZSB0aGUgcHJpdmFjeSBmZWF0dXJlID8NCiANClRoZW4gdGhlIG11dGUgbGVkIGNvbnRy
b2wgd2lsbCBiZSBjYWxsZWQgbm9ybWFsbHkgYW5kIE1pYyBtdXRlIHdpbGwgYmUgc3VjY2Vzc2Z1
bGx5IGNvbmZpZ3VyZWQuDQpUaGVyZSBpcyBubyBhbnkgaW1wYWN0aW9uIHRvIG90aGVyIHN5c3Rl
bXMuDQoNCg0KKyNpZiBJU19FTkFCTEVEKENPTkZJR19ERUxMX1BSSVZBQ1kpIA0KLi4uLi4NCisj
ZW5kaWYNCg==
