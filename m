Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B42802FBC85
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 17:34:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 692F71883;
	Tue, 19 Jan 2021 17:33:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 692F71883
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611074089;
	bh=yRVCvYNQdc192ZtjNDRt7DkE7hHALYyA8m9n6wLd1Ig=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sr7Rh/z6m8+6lYjU2aCPRKDCUtdHrX4KDrDqOLlJS3TUtFPFIfJj+K5l2b6u1vVbj
	 p25HGqJMEZe7AXMVPpbt0DwIandsEuBmUrPbtAcqKVj2RG5O6iPcFEUJzYOIqj4QMd
	 WIMD+9GCmkxmL4M0VQby5d/1o4ulkB94mOeQa5+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD54AF80137;
	Tue, 19 Jan 2021 17:33:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92E9DF80257; Tue, 19 Jan 2021 17:33:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2DA1F800FE
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 17:33:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2DA1F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="Rxu2z00C"; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=Dell.onmicrosoft.com header.i=@Dell.onmicrosoft.com
 header.b="muSV5OKU"
Received: from pps.filterd (m0170390.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10JGW8Nl024053; Tue, 19 Jan 2021 11:33:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=yRVCvYNQdc192ZtjNDRt7DkE7hHALYyA8m9n6wLd1Ig=;
 b=Rxu2z00CSqo2++0thUKbFcmIWIm1SNKnuioA4w49JaGsWFNphzsnH3VXBT6Y+HjVblXI
 Dd2K4PAhGFzTpGotDeOx/2ijF2Z+yNG09O9mSyDq/Tk4bs/uhpdlWShCzV2RjTZIq7RS
 81/I05oD/G/Doqeh/W6l6iH8NnQN+m59JZjivt2SERAnI1RcmuHqKlEd5Ny0O7l6C8DE
 lDWPf0r76LCefcYzF4Z/0OKEC99s4MCNUkPbKCTyTQsCQpy6qhBrdbYEnf4QAY+Vj9SC
 2apoDLSwaI8eKqIoq5IB6IGHqv8JqA9iGiVPNLS+biDHtN2b7n+6ZMEECcstG5New7Fb lg== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
 by mx0a-00154904.pphosted.com with ESMTP id 363v36rya6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 11:33:04 -0500
Received: from pps.filterd (m0144104.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10JG6peJ182716; Tue, 19 Jan 2021 11:33:03 -0500
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by mx0b-00154901.pphosted.com with ESMTP id 3662myrhcm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 11:33:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5614s/WghFB4jlBPtc045g29JMeGeh1kRreUlipv31RMXhPYy5wWPxKYR5olLbiyYvrVcs8Pf51LWfp0cfTBYBnUZOuhB0BokARS56SeTZFhz+gO0SOzi1AU3yeBFwJw81V1YQWCXwLzNTqY6jIg41NINo7txJiJFERZwrTftI9kZJ9Wd4GQnMrGa2mCVJCrNC/zxsS1Yg0GnC4n6FZ+HqwRxvDUYj+aqLsvQFSprvskM5Fvu/W2wmHyIchJIgPQIIF/ScRL28FAxxV2IfUCyfZloV77qXI/iqKz/LqyQ2glKp8CyUw7veAf5xjyGMB/lJ12dME9mmlHvw2NzRjCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRVCvYNQdc192ZtjNDRt7DkE7hHALYyA8m9n6wLd1Ig=;
 b=aoBJTghYqj/VUlZdkV7nN6uu3+PSDnkILnVQCaxtj1foFjmKtqtBn/+q/2GdVxqTANjcP5PIJyMjVOGfcmT3t40oFPT7088kIWqgHpsBZi3jnb2fbEHZS8ApZIfuREosydpVp5/71oqs/IYhOJije8GKyLleuapZBjexdE1uF6Rc7w5GH9U9uyhuswoibXPeP+v6xlNXJEFL5dGUeLgBFaSyHD7U5NxaRBFciKZCljtKjW56lMBJz4vyfn4WmaDS574zQwhwayTloh5fz8lcqn4UYd66+BOgSsk8rkVCzDfCC4mr/HdT1tyMXHl6SgaRX3XUHu2mgMeZdIxdEH6Meg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com; 
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRVCvYNQdc192ZtjNDRt7DkE7hHALYyA8m9n6wLd1Ig=;
 b=muSV5OKUt6I4v4NPxP+3b37xAa3m3ekj59pHw2nqTrjKQ5f7D4C9RvbMYY3XUuFxyPGEMvirq63U7Mux8M6rW+AKG+8JEFKLAteflp6psIBkJAFkXVE4YkcA1HEGAg56l999yItN75nvLJe3jM2sy5WxTrrrnMZ/OVeeSGqY5P8=
Received: from SA1PR19MB4926.namprd19.prod.outlook.com (2603:10b6:806:1a6::18)
 by SA0PR19MB4506.namprd19.prod.outlook.com (2603:10b6:806:be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 19 Jan
 2021 16:33:01 +0000
Received: from SA1PR19MB4926.namprd19.prod.outlook.com
 ([fe80::1c92:24d3:b11f:bc50]) by SA1PR19MB4926.namprd19.prod.outlook.com
 ([fe80::1c92:24d3:b11f:bc50%6]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 16:33:01 +0000
From: "Limonciello, Mario" <Mario.Limonciello@dell.com>
To: Perry Yuan <perry979106@gmail.com>, "Yuan, Perry" <Perry.Yuan@dell.com>,
 "oder_chiou@realtek.com" <oder_chiou@realtek.com>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>, "hdegoede@redhat.com"
 <hdegoede@redhat.com>, "mgross@linux.intel.com" <mgross@linux.intel.com>
Subject: RE: [PATCH v3 3/3] ASoC: rt715:add micmute led state control supports
Thread-Topic: [PATCH v3 3/3] ASoC: rt715:add micmute led state control supports
Thread-Index: AQHW6QbweaIJGc2Wt0KLd/ydkCC48aokRDcQgAYhPwCABMmHIA==
Date: Tue, 19 Jan 2021 16:33:01 +0000
Message-ID: <SA1PR19MB4926382ED61402D0F0BFA3B3FAA30@SA1PR19MB4926.namprd19.prod.outlook.com>
References: <20210112171814.5404-1-Perry_Yuan@Dell.com>
 <BY3PR19MB49131AA4EAE7C24D365FAC8DFAAA0@BY3PR19MB4913.namprd19.prod.outlook.com>
 <44d8e280-c8f3-4e3a-7ef7-b68224c96def@gmail.com>
In-Reply-To: <44d8e280-c8f3-4e3a-7ef7-b68224c96def@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-01-19T16:32:52.9490236Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=311f12a0-af1f-4167-aca5-f17aad8b2065;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77c84bc9-1a21-4557-654d-08d8bc97e34b
x-ms-traffictypediagnostic: SA0PR19MB4506:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR19MB4506540381E34DE12313AE23FAA30@SA0PR19MB4506.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 88rxtCJbcMwxm3L9zkt63CYUJwYA5B1KNggjjJA3I7BlZW/qaH1tzkgzvvTpkAveOOsTrMN13sJWsYuTGkn0kjOHsbYQfS0zy+gfwY0WQbMGqTbNHvnmpl73UfK15Le1iE9LY7nC1/HGaiZBGJhgTNk18rPwHmkoNeu72jF13yiZFsmL9hThlpwmiPGkJWJ0LFxn5cAwDHV0NmW/IYEvtyP3NQT41amN6LmNkbrjM17zWTbktyrhUg19PqsaUNvjBdOuMqjVebDn97lEEcYQCvHdBi3AFeHPTsq/hKPTIPDWLlEShWKfQLiGeJ1mv6wsWkiftkX3MdRiDU/4Xw3v7EnBc2qiRowkSpepK1y1uLLRoS9SFJFPLopPd2x59Yrb1A6GAlrwaO2F+7zPTWJmNxydQUvbNn0LhZA8rEsgo+zTjaXAp2zac6i32GCVisWa2Wt9GC2k9jRo44P/ODd+1x6EQzCpF0u+VsjAwe6XkTD2DlcVQjGmzvFF/SEU1h196an5zIHKpBsW0DgI5XLngA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR19MB4926.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(396003)(39860400002)(136003)(786003)(316002)(52536014)(8676002)(26005)(186003)(7696005)(8936002)(2906002)(33656002)(53546011)(86362001)(478600001)(4326008)(9686003)(83380400001)(66446008)(5660300002)(6506007)(55016002)(76116006)(66946007)(64756008)(7416002)(71200400001)(110136005)(54906003)(66556008)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UkZ5T3lYK1NEcXFqa3hVdDV1K1hxV2RPYUtRV0VSWSt6MHpYL0JLeEtNWVZ1?=
 =?utf-8?B?YXhFemlENjFaNlRVdkJ3ajJEVFg1QVlXVytzTDJtZ0RYTmczYmlFOHVQWjFy?=
 =?utf-8?B?NXhCbzI0T2xSeXUxTmNnK0VKVXhnZEYrZ2Y2d2xiempobSt1ZEpnMThMdStQ?=
 =?utf-8?B?RFVMM3NqbjhUMnJQeWpUam1jS2NUZlpONEZENU9xWDhZZ0VXVjhieXB0M0gx?=
 =?utf-8?B?akljYlNQMVlzQUZlUDV5K0YydTZyc1lPdEZZbkQvWG9vNnBrSkRydTBUUmlp?=
 =?utf-8?B?Ty9ZMHpQdmFMTUxyWURZSG05enJjRGlycXg3Tk9EN2NFalpGL3BhbWlKQmJW?=
 =?utf-8?B?ZzFPYld2S201L2VUb1E5UWROa1hHOW1XRmdQZyszcm1rVnhTRkgzQWdkUFlD?=
 =?utf-8?B?WXBOK1Q4MGJPKzVTVXU1NVF5YkNFVVN2RDVQZXh6UTIvNW9sMmNnc3h5OTdM?=
 =?utf-8?B?QW5id3A5OVJxMW9NMVJDSit5aHJNc1orTC9MMXhFSEpIaEVySWs3d1ZFTWdM?=
 =?utf-8?B?S3g4RmZBQkJjQ0Z5aXVlNURKUlZiWi9ZdHJjM2hNd09MTHh3Q1REQVlwWlhV?=
 =?utf-8?B?L2YwVm1mY0ZIQ2NUME5xKys4dWVVV2U5ZTVLbDFRL1BGMXk5dWMzWmIzMjRG?=
 =?utf-8?B?Tk83OG8vL3h6bWU1Q0pqZ1RGcjgrSTVvR2JycDNMQnAzZVdBU3RNWWs2T1Bo?=
 =?utf-8?B?Zmx3L0VMQXJrampUck92ZUgxdHdrNGlTTmk0RFlXcmJBcW00ZDgzWjNFTlA2?=
 =?utf-8?B?UVlLYU9tQjJCMHA1NklMZ2hpbFFjSnh5L3MrMnFxS1FGeWVBdFRzZEJUTXM2?=
 =?utf-8?B?cGhIM0hWSDFULzdodmVQaGhiTVNxWUZNWG5GNUNXcXgxZ05vb0dHU0tLR0lS?=
 =?utf-8?B?b1FjZjJMWkRNNEd4VTlLRDB4MUZQNU85cUtTUFFpYXdkSGlSMlZFR0pWdW1u?=
 =?utf-8?B?ZXpOdmdZTDc3c0VSRGkranlYUDlReXdUVm0xUlJtU2VmU1MxZGgydnZHdWNX?=
 =?utf-8?B?VGxPR211cVQ3U1RmajRSSXpodXowV28zSWNqdk1FOWlkZjBtb3FJZGIvUDJI?=
 =?utf-8?B?bWtEd2J0UEJWcWRQRkkwWHlYQ25zakhvZ0p6TWZFU2hLd1FHNlhId2RuR3pL?=
 =?utf-8?B?TU01OWJ1UjBRdjdrVHpmSkxubmc5ZEVkZW05WE5xUCtlRkZqQjNSMU50Qm1y?=
 =?utf-8?B?cERYK00rQUFDVjRsTVhpVkNDZ0gyYWg4alhMQVp6dkxZaU8wRDVqTVZXeklN?=
 =?utf-8?B?MTgwTnUrcGJBWlN1QmR4ZS9acEtyWGMwbi9kYm9qSjcxVWpSQ1dFQnlUL1BT?=
 =?utf-8?Q?Zm62EbtNYZ+tk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR19MB4926.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c84bc9-1a21-4557-654d-08d8bc97e34b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2021 16:33:01.0874 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d92TJGkv5SZswzkcSdodLvS5EBM7QPmTt4QQWmP+O3/QNVO9dWDuIhLAG7EUN0X42CdLC86p24KZUUK7+UQmM47nrXKLxlHK98prlYa5ilU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4506
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-19_05:2021-01-18,
 2021-01-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190095
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190096
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

PiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBZdWFuLCBQZXJyeSA8
UGVycnlfWXVhbkBEZWxsLmNvbT4NCj4gPj4gU2VudDogVHVlc2RheSwgSmFudWFyeSAxMiwgMjAy
MSAxMToxOA0KPiA+PiBUbzogb2Rlcl9jaGlvdUByZWFsdGVrLmNvbTsgcGVyZXhAcGVyZXguY3o7
IHRpd2FpQHN1c2UuY29tOw0KPiA+PiBoZGVnb2VkZUByZWRoYXQuY29tOyBtZ3Jvc3NAbGludXgu
aW50ZWwuY29tDQo+ID4+IENjOiBsZ2lyZHdvb2RAZ21haWwuY29tOyBicm9vbmllQGtlcm5lbC5v
cmc7IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsNCj4gPj4gbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZzsgcGxhdGZvcm0tZHJpdmVyLXg4NkB2Z2VyLmtlcm5lbC5vcmc7IFl1YW4sDQo+
ID4+IFBlcnJ5OyBMaW1vbmNpZWxsbywgTWFyaW8NCj4gPj4gU3ViamVjdDogW1BBVENIIHYzIDMv
M10gQVNvQzogcnQ3MTU6YWRkIG1pY211dGUgbGVkIHN0YXRlIGNvbnRyb2wgc3VwcG9ydHMNCj4g
Pj4NCj4gPj4gRnJvbTogUGVycnkgWXVhbiA8cGVycnlfeXVhbkBkZWxsLmNvbT4NCj4gPj4NCj4g
Pj4gU29tZSBuZXcgRGVsbCBzeXN0ZW0gaXMgZ29pbmcgdG8gc3VwcG9ydCBhdWRpbyBpbnRlcm5h
bCBtaWNwaG9uZQ0KPiA+PiBwcml2YWN5IHNldHRpbmcgZnJvbSBoYXJkd2FyZSBsZXZlbCB3aXRo
IG1pY211dGUgbGVkIHN0YXRlIGNoYW5naW5nDQo+ID4+IFdoZW4gbWljbXV0ZSBob3RrZXkgcHJl
c3NlZCBieSB1c2VyLCBzb2Z0IG11dGUgd2lsbCBuZWVkIHRvIGJlIGVuYWJsZWQNCj4gPj4gZmly
c3RseSBpbiBjYXNlIG9mIHBvcCBub2lzZSwgYW5kIGNvZGVjIGRyaXZlciBuZWVkIHRvIHJlYWN0
IHRvIG1pYw0KPiA+PiBtdXRlIGV2ZW50IHRvIEVDKGVtYmVkZGVkIGNvbnRyb2xsZXIpIG5vdGlm
eWluZyB0aGF0IFNXIG11dGUgaXMgY29tcGxldGVkDQo+ID4+IFRoZW4gRUMgd2lsbCBkbyB0aGUg
aGFyZHdhcmUgbXV0ZSBwaHlzaWNhbGx5IHdpdGhpbiB0aGUgdGltZW91dCByZWFjaGVkDQo+ID4+
DQo+ID4+IFRoaXMgcGF0Y2ggYWxsb3cgY29kZWMgcnQ3MTUgZHJpdmVyIHRvIGFjayBFQyB3aGVu
IG1pY211dGUga2V5IHByZXNzZWQNCj4gPj4gdGhyb3VnaCB0aGlzIG1pY3Bob25lIGxlZCBjb250
cm9sIGludGVyZmFjZSBsaWtlIGhkYV9nZW5lcmljIHByb3ZpZGVkDQo+ID4+IEFDUEkgbWV0aG9k
IGRlZmluZWQgaW4gZGVsbC1wcml2YWN5IG1pY211dGUgbGVkIHRyaWdnZXIgd2lsbCBiZSBjYWxs
ZWQNCj4gPj4gZm9yIG5vdGlmeWluZyB0aGUgRUMgdGhhdCBzb2Z0d2FyZSBtdXRlIGhhcyBiZWVu
IGNvbXBsZXRlZA0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBQZXJyeSBZdWFuIDxwZXJyeV95
dWFuQGRlbGwuY29tPg0KPiA+Pg0KPiA+PiAtLS0tLS0tLQ0KPiA+PiB2MiAtPiB2Mw0KPiA+PiAq
IHNpbXBsaWZ5IHRoZSBwYXRjaCB0byByZXVzZSBzb21lIHZhbCB2YWx1ZQ0KPiA+PiAqIGFkZCBt
b3JlIGRldGFpbCB0byB0aGUgY29tbWl0IGluZm8NCj4gPj4NCj4gPj4gdjEgLT4gdjI6DQo+ID4+
ICogZml4IHNvbWUgZm9ybWF0IGlzc3VlDQo+ID4+IC0tLS0tLS0tDQo+ID4+IC0tLQ0KPiA+PiAg
IHNvdW5kL3NvYy9jb2RlY3MvcnQ3MTUtc2RjYS5jIHwgMTYgKysrKysrKysrKysrKysrKw0KPiA+
PiAgIHNvdW5kL3NvYy9jb2RlY3MvcnQ3MTUtc2RjYS5oIHwgIDEgKw0KPiA+PiAgIHNvdW5kL3Nv
Yy9jb2RlY3MvcnQ3MTUuYyAgICAgIHwgMTQgKysrKysrKysrKysrKysNCj4gPj4gICBzb3VuZC9z
b2MvY29kZWNzL3J0NzE1LmggICAgICB8ICAxICsNCj4gPj4gICA0IGZpbGVzIGNoYW5nZWQsIDMy
IGluc2VydGlvbnMoKykNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2RlY3Mv
cnQ3MTUtc2RjYS5jIGIvc291bmQvc29jL2NvZGVjcy9ydDcxNS1zZGNhLmMNCj4gPj4gaW5kZXgg
YjQzYWM4NTU5ZTQ1Li44NjFhMGQyYTg5NTcgMTAwNjQ0DQo+ID4+IC0tLSBhL3NvdW5kL3NvYy9j
b2RlY3MvcnQ3MTUtc2RjYS5jDQo+ID4+ICsrKyBiL3NvdW5kL3NvYy9jb2RlY3MvcnQ3MTUtc2Rj
YS5jDQo+ID4+IEBAIC0xMiw2ICsxMiw3IEBADQo+ID4+ICAgI2luY2x1ZGUgPGxpbnV4L3ZlcnNp
b24uaD4NCj4gPj4gICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+DQo+ID4+ICAgI2luY2x1ZGUg
PGxpbnV4L2luaXQuaD4NCj4gPj4gKyNpbmNsdWRlIDxsaW51eC9sZWRzLmg+DQo+ID4+ICAgI2lu
Y2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4NCj4gPj4gICAjaW5jbHVkZSA8bGludXgvcG0uaD4N
Cj4gPj4gICAjaW5jbHVkZSA8bGludXgvc291bmR3aXJlL3Nkdy5oPg0KPiA+PiBAQCAtMjQ0LDYg
KzI0NSw3IEBAIHN0YXRpYyBpbnQgcnQ3MTVfc2RjYV9nZXRfdm9sc3coc3RydWN0IHNuZF9rY29u
dHJvbA0KPiA+PiAqa2NvbnRyb2wsDQo+ID4+ICAgCXVuc2lnbmVkIGludCBtYXggPSBtYy0+bWF4
Ow0KPiA+PiAgIAlpbnQgdmFsOw0KPiA+Pg0KPiA+PiArCXByX2VycigiKysrKysrcnQ3MTVfc2Rj
YV9nZXRfdm9sc3crK1xuIik7DQo+ID4+ICAgCXZhbCA9IHNuZF9zb2NfY29tcG9uZW50X3JlYWQo
Y29tcG9uZW50LCBtYy0+cmVnKTsNCj4gPj4gICAJaWYgKHZhbCA8IDApDQo+ID4+ICAgCQlyZXR1
cm4gLUVJTlZBTDsNCj4gPj4gQEAgLTI2MSw2ICsyNjMsNyBAQCBzdGF0aWMgaW50IHJ0NzE1X3Nk
Y2FfcHV0X3ZvbHN3KHN0cnVjdCBzbmRfa2NvbnRyb2wNCj4gPj4gKmtjb250cm9sLA0KPiA+PiAg
IAlzdHJ1Y3Qgc25kX2N0bF9lbGVtX3ZhbHVlICp1Y29udHJvbCkNCj4gPj4gICB7DQo+ID4+ICAg
CXN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50ID0gc25kX2tjb250cm9sX2NoaXAo
a2NvbnRyb2wpOw0KPiA+PiArCXN0cnVjdCBydDcxNV9zZGNhX3ByaXYgKnJ0NzE1ID0NCj4gPj4g
c25kX3NvY19jb21wb25lbnRfZ2V0X2RydmRhdGEoY29tcG9uZW50KTsNCj4gPj4gICAJc3RydWN0
IHNvY19taXhlcl9jb250cm9sICptYyA9DQo+ID4+ICAgCQkoc3RydWN0IHNvY19taXhlcl9jb250
cm9sICopa2NvbnRyb2wtPnByaXZhdGVfdmFsdWU7DQo+ID4+ICAgCXVuc2lnbmVkIGludCB2YWws
IHZhbDIsIGxvb3BfY250ID0gMiwgaTsNCj4gPj4gQEAgLTI2OCw2ICsyNzEsNyBAQCBzdGF0aWMg
aW50IHJ0NzE1X3NkY2FfcHV0X3ZvbHN3KHN0cnVjdCBzbmRfa2NvbnRyb2wNCj4gPj4gKmtjb250
cm9sLA0KPiA+PiAgIAl1bnNpZ25lZCBpbnQgcmVnMiA9IG1jLT5ycmVnOw0KPiA+PiAgIAl1bnNp
Z25lZCBpbnQgcmVnID0gbWMtPnJlZzsNCj4gPj4gICAJdW5zaWduZWQgaW50IG1heCA9IG1jLT5t
YXg7DQo+ID4+ICsJdW5zaWduZWQgaW50IHZhbDAsIHZhbDE7DQo+ID4+ICAgCWludCBlcnI7DQo+
ID4+DQo+ID4+ICAgCXZhbCA9IHVjb250cm9sLT52YWx1ZS5pbnRlZ2VyLnZhbHVlWzBdOw0KPiA+
PiBAQCAtMjg3LDYgKzI5MSwxOCBAQCBzdGF0aWMgaW50IHJ0NzE1X3NkY2FfcHV0X3ZvbHN3KHN0
cnVjdCBzbmRfa2NvbnRyb2wNCj4gPj4gKmtjb250cm9sLA0KPiA+PiAgIAkJCXJldHVybiBlcnI7
DQo+ID4+ICAgCX0NCj4gPj4NCj4gPj4gKyNpZiBJU19FTkFCTEVEKENPTkZJR19ERUxMX1BSSVZB
Q1kpDQo+ID4+ICsJLyogZGVsbCBwcml2YWN5IExFRCB0cmlnZ2VyIHN0YXRlIGNoYW5nZWQgYnkg
bXV0ZWQvdW5tdXRlIHN3aXRjaCAqLw0KPiA+PiArCWlmIChtYy0+aW52ZXJ0KSB7DQo+ID4+ICsJ
CWlmICh1Y29udHJvbC0+dmFsdWUuaW50ZWdlci52YWx1ZVswXSB8fCB1Y29udHJvbC0NCj4gPj4+
IHZhbHVlLmludGVnZXIudmFsdWVbMV0pIHsNCj4gPj4gKwkJCXJ0NzE1LT5taWNtdXRlX2xlZCA9
IExFRF9PRkY7DQo+ID4+ICsJCX0gZWxzZSB7DQo+ID4+ICsJCQlydDcxNS0+bWljbXV0ZV9sZWQg
PSBMRURfT047DQo+ID4+ICsJCX0NCj4gPj4gKwkJbGVkdHJpZ19hdWRpb19zZXQoTEVEX0FVRElP
X01JQ01VVEUsIHJ0NzE1LT5taWNtdXRlX2xlZCk7DQo+ID4+ICsJfQ0KPiA+PiArI2VuZGlmDQo+
ID4+ICsNCj4gPj4gICAJcmV0dXJuIDA7DQo+ID4+ICAgfQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0
IGEvc291bmQvc29jL2NvZGVjcy9ydDcxNS1zZGNhLmggYi9zb3VuZC9zb2MvY29kZWNzL3J0NzE1
LXNkY2EuaA0KPiA+PiBpbmRleCA4NDBjMjM3ODk1ZGQuLmY4OTg4YWI4OGY4MCAxMDA2NDQNCj4g
Pj4gLS0tIGEvc291bmQvc29jL2NvZGVjcy9ydDcxNS1zZGNhLmgNCj4gPj4gKysrIGIvc291bmQv
c29jL2NvZGVjcy9ydDcxNS1zZGNhLmgNCj4gPj4gQEAgLTMxLDYgKzMxLDcgQEAgc3RydWN0IHJ0
NzE1X3NkY2FfcHJpdiB7DQo+ID4+ICAgCWludCBsX2lzX3VubXV0ZTsNCj4gPj4gICAJaW50IHJf
aXNfdW5tdXRlOw0KPiA+PiAgIAlpbnQgaHdfc2R3X3ZlcjsNCj4gPj4gKwlib29sIG1pY211dGVf
bGVkOw0KPiA+PiAgIH07DQo+ID4+DQo+ID4+ICAgc3RydWN0IHJ0NzE1X3Nkd19zdHJlYW1fZGF0
YSB7DQo+ID4+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvY29kZWNzL3J0NzE1LmMgYi9zb3VuZC9z
b2MvY29kZWNzL3J0NzE1LmMNCj4gPj4gaW5kZXggY2RjYmE3MDE0NmRhLi5iNGU0ODA3NDRjOTQg
MTAwNjQ0DQo+ID4+IC0tLSBhL3NvdW5kL3NvYy9jb2RlY3MvcnQ3MTUuYw0KPiA+PiArKysgYi9z
b3VuZC9zb2MvY29kZWNzL3J0NzE1LmMNCj4gPj4gQEAgLTEzLDYgKzEzLDcgQEANCj4gPj4gICAj
aW5jbHVkZSA8bGludXgvaW5pdC5oPg0KPiA+PiAgICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPg0K
PiA+PiAgICNpbmNsdWRlIDxsaW51eC9pMmMuaD4NCj4gPj4gKyNpbmNsdWRlIDxsaW51eC9sZWRz
Lmg+DQo+ID4+ICAgI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4NCj4gPj4gICAjaW5jbHVk
ZSA8bGludXgvcG0uaD4NCj4gPj4gICAjaW5jbHVkZSA8bGludXgvc291bmR3aXJlL3Nkdy5oPg0K
PiA+PiBAQCAtODgsNiArODksNyBAQCBzdGF0aWMgaW50IHJ0NzE1X3NldF9hbXBfZ2Fpbl9wdXQo
c3RydWN0IHNuZF9rY29udHJvbA0KPiA+PiAqa2NvbnRyb2wsDQo+ID4+ICAgCQlSVDcxNV9TRVRf
R0FJTl9NSVhfQURDMl9MfTsNCj4gPj4gICAJdW5zaWduZWQgaW50IGFkZHJfaCwgYWRkcl9sLCB2
YWxfaCwgdmFsX2xsLCB2YWxfbHI7DQo+ID4+ICAgCXVuc2lnbmVkIGludCByZWFkX2xsLCByZWFk
X3JsLCBpLCBqLCBsb29wX2NudDsNCj4gPj4gKwl1bnNpZ25lZCBpbnQgdmFsMCwgdmFsMTsNCj4g
Pj4NCj4gPj4gICAJaWYgKHN0cnN0cih1Y29udHJvbC0+aWQubmFtZSwgIk1haW4gQ2FwdHVyZSBT
d2l0Y2giKSB8fA0KPiA+PiAgIAkJc3Ryc3RyKHVjb250cm9sLT5pZC5uYW1lLCAiTWFpbiBDYXB0
dXJlIFZvbHVtZSIpKQ0KPiA+PiBAQCAtOTUsNiArOTcsMTggQEAgc3RhdGljIGludCBydDcxNV9z
ZXRfYW1wX2dhaW5fcHV0KHN0cnVjdCBzbmRfa2NvbnRyb2wNCj4gPj4gKmtjb250cm9sLA0KPiA+
PiAgIAllbHNlDQo+ID4+ICAgCQlsb29wX2NudCA9IDE7DQo+ID4+DQo+ID4+ICsjaWYgSVNfRU5B
QkxFRChDT05GSUdfREVMTF9QUklWQUNZKQ0KPiA+PiArCS8qIE1pY211dGUgTEVEIHN0YXRlIGNo
YW5nZWQgYnkgbXV0ZWQvdW5tdXRlIHN3aXRjaCAqLw0KPiA+PiArCWlmIChtYy0+aW52ZXJ0KSB7
DQo+ID4+ICsJCWlmICh1Y29udHJvbC0+dmFsdWUuaW50ZWdlci52YWx1ZVswXSB8fCB1Y29udHJv
bC0NCj4gPj4+IHZhbHVlLmludGVnZXIudmFsdWVbMV0pIHsNCj4gPj4gKwkJCXJ0NzE1LT5taWNt
dXRlX2xlZCA9IExFRF9PRkY7DQo+ID4+ICsJCX0gZWxzZSB7DQo+ID4+ICsJCQlydDcxNS0+bWlj
bXV0ZV9sZWQgPSBMRURfT047DQo+ID4+ICsJCX0NCj4gPj4gKwkJbGVkdHJpZ19hdWRpb19zZXQo
TEVEX0FVRElPX01JQ01VVEUsIHJ0NzE1LT5taWNtdXRlX2xlZCk7DQo+ID4+ICsJfQ0KPiA+PiAr
I2VuZGlmDQo+ID4+ICsNCj4gPiBZb3UgbWlnaHQgaGF2ZSBtaXNzZWQgbXkgb3RoZXIgY29tbWVu
dCBvbiB2MiBmZWVkYmFjaywgYnV0IGlzIHRoZXJlIGEgcmVhc29uDQo+ID4gdG8ga2VlcCBpdCBi
ZWhpbmQgYSBjb21waWxlIHRpbWUgZmxhZyBmb3IgZGVsbCBwcml2YWN5IG1vZHVsZT8gIEluIHBy
YWN0aWNlDQo+ID4gYW55IG90aGVyIGZ1dHVyZSBsZWQgYmFja2VuZCBwcm92aWRlciBzaG91bGQg
d29yayB0b28uICBBbm90aGVyIHdheSB0byB0aGluaw0KPiA+IGFib3V0IGl0IC0gaWYgZGVsbCBw
cml2YWN5IHdhc24ndCBlbmFibGVkIHdvdWxkIHRoaXMgY2F1c2UgYSBwcm9ibGVtIHRvIHJ1bg0K
PiA+IHRoaXMgY29kZT8gIEkgdGhpbmsgaXQgd291bGQganVzdCBiZSBhIG5vLW9wLg0KPiA+DQo+
ID4+ICAgCWZvciAoaiA9IDA7IGogPCBsb29wX2NudDsgaisrKSB7DQo+ID4+ICAgCQkvKiBDYW4n
dCB1c2UgdXBkYXRlIGJpdCBmdW5jdGlvbiwgc28gcmVhZCB0aGUgb3JpZ2luYWwgdmFsdWUgZmly
c3QNCj4gPj4gKi8NCj4gPj4gICAJCWlmIChsb29wX2NudCA9PSAxKSB7DQo+ID4+IGRpZmYgLS1n
aXQgYS9zb3VuZC9zb2MvY29kZWNzL3J0NzE1LmggYi9zb3VuZC9zb2MvY29kZWNzL3J0NzE1LmgN
Cj4gPj4gaW5kZXggMDA5YTgyNjZmNjA2Li41N2M5YWYwNDExODEgMTAwNjQ0DQo+ID4+IC0tLSBh
L3NvdW5kL3NvYy9jb2RlY3MvcnQ3MTUuaA0KPiA+PiArKysgYi9zb3VuZC9zb2MvY29kZWNzL3J0
NzE1LmgNCj4gPj4gQEAgLTIyLDYgKzIyLDcgQEAgc3RydWN0IHJ0NzE1X3ByaXYgew0KPiA+PiAg
IAlzdHJ1Y3Qgc2R3X2J1c19wYXJhbXMgcGFyYW1zOw0KPiA+PiAgIAlib29sIGh3X2luaXQ7DQo+
ID4+ICAgCWJvb2wgZmlyc3RfaHdfaW5pdDsNCj4gPj4gKwlib29sIG1pY211dGVfbGVkOw0KPiA+
PiAgIH07DQo+ID4+DQo+ID4+ICAgc3RydWN0IHNkd19zdHJlYW1fZGF0YSB7DQo+ID4+IC0tDQo+
ID4+IDIuMjUuMQ0KPiANCj4gUGllcnJlIExvdWlzIHN1Z2dlc3RlZCB0byBqdXN0IHNldCB0aGUg
bWljIG11dGUgbGVkIHN0YXRlIHVuY29uZGl0aW9uYWxseSAuDQo+IEl0IGlzIG1vcmUgY29tbW9u
IGludGVyZmFjZSB0byBhbGxvdyBvdGhlciBwbGF0Zm9ybXMgdG8gY2hhbmdlIG1pY211dGUgbGVk
Lg0KPiBUaGUgZGlzY3Vzc2lvbiByZXN1bHQgaXMgZnJvbSAiW1BBVENIIHYyIDIvMl0gQVNvQzog
cnQ3MTU6YWRkIE1pYyBNdXRlIExFRA0KPiBjb250cm9sIHN1cHBvcnQiDQo+IA0KPiBIZXJlIGlz
IHRoZSBjaGFuZ2UgY29tcGFyZWQgdG8gVjMgLHRoZSBDT05GSUdfREVMTF9QUklWQUNZIHdpbGwg
YmUgcmVtb3ZlZA0KPiANCj4gLSNpZiBJU19FTkFCTEVEKENPTkZJR19ERUxMX1BSSVZBQ1kpDQo+
IC0gICAgICAgLyogZGVsbCBwcml2YWN5IExFRCB0cmlnZ2VyIHN0YXRlIGNoYW5nZWQgYnkgbXV0
ZWQvdW5tdXRlIHN3aXRjaCAqLw0KPiArICAgICAgIC8qIE1pY011dGUgTEVEIHN0YXRlIGNoYW5n
ZWQgYnkgbXV0ZWQvdW5tdXRlIHN3aXRjaCAqLw0KPiAgICAgICAgICBpZiAobWMtPmludmVydCkg
ew0KPiAgICAgICAgICAgICAgICAgIGlmICh1Y29udHJvbC0+dmFsdWUuaW50ZWdlci52YWx1ZVsw
XSB8fCB1Y29udHJvbC0NCj4gPnZhbHVlLmludGVnZXIudmFsdWVbMV0pIHsNCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgIHJ0NzE1LT5taWNtdXRlX2xlZCA9IExFRF9PRkY7DQo+IGRpZmYgLS1n
aXQgYS9zb3VuZC9zb2MvY29kZWNzL3J0NzE1LmMgYi9zb3VuZC9zb2MvY29kZWNzL3J0NzE1LmMN
Cj4gaW5kZXggYjRlNDgwNzQ0Yzk0Li42MGJiM2Q5ODEwM2UgMTAwNjQ0DQo+IC0tLSBhL3NvdW5k
L3NvYy9jb2RlY3MvcnQ3MTUuYw0KPiArKysgYi9zb3VuZC9zb2MvY29kZWNzL3J0NzE1LmMNCj4g
QEAgLTk3LDggKzk3LDcgQEAgc3RhdGljIGludCBydDcxNV9zZXRfYW1wX2dhaW5fcHV0KHN0cnVj
dCBzbmRfa2NvbnRyb2wNCj4gKmtjb250cm9sLA0KPiAgICAgICAgICBlbHNlDQo+ICAgICAgICAg
ICAgICAgICAgbG9vcF9jbnQgPSAxOw0KPiANCj4gLSNpZiBJU19FTkFCTEVEKENPTkZJR19ERUxM
X1BSSVZBQ1kpDQo+IC0gICAgICAgLyogTWljbXV0ZSBMRUQgc3RhdGUgY2hhbmdlZCBieSBtdXRl
ZC91bm11dGUgc3dpdGNoICovDQo+ICsgICAgICAgLyogTWljTXV0ZSBMRUQgc3RhdGUgY2hhbmdl
ZCBieSBtdXRlZC91bm11dGUgc3dpdGNoICovDQo+ICAgICAgICAgIGlmIChtYy0+aW52ZXJ0KSB7
DQo+ICAgICAgICAgICAgICAgICAgaWYgKHVjb250cm9sLT52YWx1ZS5pbnRlZ2VyLnZhbHVlWzBd
IHx8IHVjb250cm9sLQ0KPiA+dmFsdWUuaW50ZWdlci52YWx1ZVsxXSkgew0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgcnQ3MTUtPm1pY211dGVfbGVkID0gTEVEX09GRjsNCj4gQEAgLTEwNyw3
ICsxMDYsNiBAQCBzdGF0aWMgaW50IHJ0NzE1X3NldF9hbXBfZ2Fpbl9wdXQoc3RydWN0IHNuZF9r
Y29udHJvbA0KPiAqa2NvbnRyb2wsDQo+ICAgICAgICAgICAgICAgICAgfQ0KPiAgICAgICAgICAg
ICAgICAgIGxlZHRyaWdfYXVkaW9fc2V0KExFRF9BVURJT19NSUNNVVRFLCBydDcxNS0+bWljbXV0
ZV9sZWQpOw0KPiAgICAgICAgICB9DQo+IC0jZW5kaWYNCg0KSSdtIG5vdCBzdXJlIHdoaWNoIHRo
cmVhZCwgYnV0IEkgYmVsaWV2ZSB0aGVyZSB3YXMgc3RpbGwgYWxzbyBhbm90aGVyIHN1Z2dlc3Rp
b24NCnRoYXQgdGhpcyBzaG91bGQgYmUgbWFkZSBtb3JlICJnZW5lcmljIiBhbmQgdG8gd29yayBm
b3IgYWxsIGNvZGVjcy4gIFNvIHRoYXQgd2hlbg0Kd2UgaGF2ZSBsZXRzIHNheSBhIGh5cG90aGV0
aWNhbCBydDcxNyB3ZSBkb24ndCBuZWVkIHRoZSBzYW1lIGluIHRoYXQgbW9kdWxlLg0KDQo=
