Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A73FA3457B4
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 07:20:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E41F15E2;
	Tue, 23 Mar 2021 07:20:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E41F15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616480452;
	bh=6fNhTLc/9mmW6lQx0234e6F0X7Q/b523xCzHm0GATWM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vz4BE3rW+LmJxZ6cX5EyIZ/gDEJrcNaa2GkuimvazrRXKrpoJUQc8Wr/wImLhfJvv
	 OYj2hkPIOIUEswHvv1UNsg5VEcD/qbBwTmaXw1SnhJm2yWcXHaWwebDX1W19IfPGFi
	 gb9l/Gh315cPOAASBSzDN7kcZzrmNwJQ4RHwz/bE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AB31F80155;
	Tue, 23 Mar 2021 07:19:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FCBDF8025F; Tue, 23 Mar 2021 07:19:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37991F80155
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 07:19:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37991F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="E/ijRUMU"
Received: from pps.filterd (m0170394.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12N67qvR020861; Tue, 23 Mar 2021 02:19:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=6fNhTLc/9mmW6lQx0234e6F0X7Q/b523xCzHm0GATWM=;
 b=E/ijRUMU3YJmqpm5gnrFHs5M4dq+QZeSyJUY1e6nIz7RxM9J6Cv8xsND01s4RGc4hpF1
 CTXJR0dZ2STV8086S8LmgsWtVtvunmDqGenX2canWqeUcFITJWsv2aAz3/pqErMO0FlV
 O0+dN8NVC91PBIhvIxNjLsrXb4UIYqSqxZ76ii0UDu5ZWYoFhBzf2ECPkLJaB/JUY7SY
 SxENcWlppKUqaqirLAhATG62jIx4z3nWdXYR6NFuQkuucR+22GJsTHEgBmZ8l99WB1PO
 i3I/Yeeo/JtHPqeQUJ7cfL5gbqPNKP5vOMbtqEEwH2ckcx0OQMoouEHGFPkfQufRzmak Uw== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
 by mx0b-00154904.pphosted.com with ESMTP id 37dbm50bpg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 02:19:12 -0400
Received: from pps.filterd (m0144104.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12N6BlqX107307; Tue, 23 Mar 2021 02:19:11 -0400
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by mx0b-00154901.pphosted.com with ESMTP id 37dxdptbcq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 02:19:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ma56e+3Xsjw/vOsejWb2DETc8oJANeR7UU9z0arShGGOU9YRYbYTr8jFZbRhQxwpwUmopHYmHVDmPCL8EBvv/8TZOrvQhrg6Qo/tGE8TA2jF737cfbdSNg6i3nkdWXELlBxFwL/7SOcbTlWlUNFz05E6ntfNZvzqO9om2jMox2MHqzwoq6ZQNPX7fmykI08c76NEass8w/mMBfb3wvbrYUMurmF/dYWFlA61/hJv+i9L1cCtEfsg8/SUvi6HqF79wK7CgJ2VJrxIFESyQZ9lgpKDJYMWU7+UHvQBVrj7lfeWiTWKDmsPo9/D1p5dv5IUftMxTqR7hLF1aiITvS59OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fNhTLc/9mmW6lQx0234e6F0X7Q/b523xCzHm0GATWM=;
 b=SJJPkzw4FbZBIjg+YT8TUPH7SUGoU5zs+RDHdZehctFHfr8fDHskIQ4eRIknIdvGAgQgQPFebgM46gJGg6Ykb1hwKV06fr+1Ww0Bopbs6/xsxtjlFuTUQayNK1MxlBruYfcry3OJeLiPdv9YdKPRzFdoZ8F5O3gmeRIuxtvgdVKa2CvGSSJrOfvmrcSFpxSRR24kosdjVc1+kbQdaEbRoZxesUOgzEi+lZhk+KNnblN7oiB94LH3Kg3Wsw/+Rpy7IMs2JT36lj6BX146p6pQuMmtsE38BL1xY068qoeYS9MBVxj6beQExRxOdLALzNwWFy7PJUifFKki/H9e1dj4/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com (2603:10b6:a03:28a::6)
 by BY3PR19MB4866.namprd19.prod.outlook.com (2603:10b6:a03:366::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 06:19:09 +0000
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::8863:ccf2:c6a:d43a]) by SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::8863:ccf2:c6a:d43a%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 06:19:09 +0000
From: "Yuan, Perry" <Perry.Yuan@dell.com>
To: Randy Dunlap <rdunlap@infradead.org>, "pobrn@protonmail.com"
 <pobrn@protonmail.com>, "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "oder_chiou@realtek.com"
 <oder_chiou@realtek.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>, "Limonciello, Mario"
 <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v5 1/2] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
Thread-Topic: [PATCH v5 1/2] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
Thread-Index: AQHXHv8rB2ABk/P/MkKrDogynAXj3qqQP9GAgADZ41A=
Date: Tue, 23 Mar 2021 06:19:09 +0000
Message-ID: <SJ0PR19MB4528CF2FE14C7B4AAD688AAD84649@SJ0PR19MB4528.namprd19.prod.outlook.com>
References: <20210322093841.11840-1-Perry_Yuan@Dell.com>
 <a1bdec21-efd9-ebf5-1b45-c0a364e0914c@infradead.org>
In-Reply-To: <a1bdec21-efd9-ebf5-1b45-c0a364e0914c@infradead.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [163.244.246.207]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfee5aa4-2179-437d-9cb0-08d8edc39220
x-ms-traffictypediagnostic: BY3PR19MB4866:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY3PR19MB48664812EDCDA256BEBCA47C84649@BY3PR19MB4866.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j9mjq8FprIvoZJGVcyg/XI/SozbFIVDMS7ngOMsq2QSbE/MtmdrZmQwdXNlqwOnjh+MMh97+nPiYA1tJKdFDaGhGqEcJsYHw72eSi5xRCnF4ZeAFgGR32HYKLQUoq3mrbdRwgECwEq0D+5fLFkCHUE3rUvMmOwuvWzqFVcpd+XRuRiZ+7+xlTxG2PF8ktzntwFsmZLpNdm5EH574AhQzVrSVOx3AFtDoe4uglG5Mq1g7ZKSF2XOR4yD+kc+/8fr3DXy+UNdqOckyK6OAmkqo3wQZCyCYcWbmY0xsDx1H8OtW+liTrk2w38EWhVd9j8dX7tdWxxNLEGs5vZ/lvqNzypK3aaUUrnTaeHn1NDifvja/316ESgmepbS3IoTWdAAI1zALmRzn4KuDlILjF1D8GzdzxfjuSZSuVVtnA/UK+j0OAGSWJPZjXZDSypW87aflFf7A1iEzrvZtZR2NNGW7l61b/T6116GBKpJ52S45CtTL99+dRfJ9mUttEeLysdMhdQsTdhYcSK6RMhv5RvJZ7NTOckU/kaxjgIvwkCnqGHJlASXZFp7c/aSM2gp7vCPiRSz5IRJAV00R8Ph5bTrTqpRuaAr54m5aNubGroJJyi6gosfz/2wD0TM+lUddggEsRZGvh4TgXNjXkC+jf2tM2Z44JSBwFhhsvFxECwwxqqjzYmUE83usAVJs71ZR3Wsj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR19MB4528.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(52536014)(66946007)(8936002)(33656002)(83380400001)(7696005)(2906002)(64756008)(66476007)(4326008)(66556008)(86362001)(7416002)(38100700001)(66446008)(71200400001)(54906003)(786003)(6506007)(921005)(5660300002)(478600001)(76116006)(316002)(186003)(8676002)(26005)(110136005)(53546011)(9686003)(55016002)(6636002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?OVVMR0dkc3dwNW5vcUxYcjI0cW5HNUNpU0lXQVhQMGhNVWNBMTc4cWc5cjRH?=
 =?utf-8?B?eVpCeSttVk9SUDNyOG55ZzJRS2ZQUHpwSTE2Q3kzaU1lRGtQekNKYkZnc3Zk?=
 =?utf-8?B?QkhTSWl0Yk1IUEhKQ2MxM2M2ZGJVbW40L2paMGhhOExkaDU0NTNzZXg5MzQ0?=
 =?utf-8?B?K2ZzV0hwYW1RTFE0NTIyNmVMb2xUQnorVk1pUFROV2dLYlh5dk41dWZ2c3d6?=
 =?utf-8?B?TVU2bmxBMkF4ZGljbGl0MUxyc050eVZ6d3doWEI0SmRoYWpiL0xNVzlQUFFr?=
 =?utf-8?B?WUt4bVBJN2RlQnE5MW9DNytJNFFuNVZ4R1Q0ek4vWjgzTUdKMUZ1ME1PRkdV?=
 =?utf-8?B?K1owLzExOGo5MnRNTnFsam5ycDh5WUZ1cFcrU3N5dWVJbkkyVzIvUnduUVdT?=
 =?utf-8?B?cmI1UFVpS3VkTWJjYnhoZUM0TzNFRkFUdHVXWEJtYXNVQkJqck45cUV6YU4v?=
 =?utf-8?B?TGs5WThFaVk3NXoxL1JOSTlmT1c1S29mV1VZLzdpdk43bitlOVdhTWZOTTVz?=
 =?utf-8?B?ZTZnMHg5TlVJNi9ITmROMldkNUFiWStkazdNWC8wVTlSa1ROVXVQTVlrVkhR?=
 =?utf-8?B?bnBKeGRtQUZza09PbmtwUlo3RGw3b01sSkUxV01HWEk0MS9ESzlJZEx3bEJC?=
 =?utf-8?B?MEdJWFcxQWg2cksyQVhKekg3Q1RSU3I0K1ROM1BQOUJQTUVYOWhoZ2cvNm9y?=
 =?utf-8?B?VzJ6ZEw0Tm5FdUlkeWN5VWdWMnIxTng1TXdVM1ZRL0xZdlBVejRxRU8wbTg3?=
 =?utf-8?B?WEcvLzRNS1g5MkxDZXd1eCtwSm1MQVQyZmY0dy9OYk1tRnlPeUhzTFk0aGJ6?=
 =?utf-8?B?MGJOa0RUSE9mMloyNDFQb3RrQmpJcjJTWFBkYVlaN1l2b0Q5dERPci9ZQVB0?=
 =?utf-8?B?NmxXelJMK2pQdEJjNDFjR1loZ0ZsNm5tc3draStNRVN5YktCTFhrLzNWdGda?=
 =?utf-8?B?UEpDVUx0VEJVNVplR2xpRGdBeWFsKzBqcWVtT1hvaDBicGZXZHpBUWZYQlhG?=
 =?utf-8?B?UGNaU042MlJzd25GdHZkcVN2dnNUa3hlNjlkQ0prcTl2WWF0cWIxYkRpUWV3?=
 =?utf-8?B?czEwSjlnaDVTc04zU2VtejlrTFJKYXVOZHVMY3RQLzBNQWQzTEkzamJyWGlY?=
 =?utf-8?B?R0kwejRFNkxyUVNYREFqbVJWYkZSMkNwRnlvMjlJTW9tYWdjMEhTejdqMkYw?=
 =?utf-8?B?M2lhRU5DSG96S3hWZldNdzVjVjRqOVVreG5KbTVjNGt1dy9ma2hUbElsdkE0?=
 =?utf-8?B?emhyb2xPZGNxV24rU2c3VkVsTlFCS3FBZE5FWHhRazdXVVYrdkM4WDgvLzVl?=
 =?utf-8?B?SzZheGhJNUo4TnBBK21TZy9iVk5lTnBzYkpuMFBZR0VVSTRteEdTMnVMaUJ3?=
 =?utf-8?B?RFBySkgzYTB0RUg0dU5GZXBhb3ptOTdEKzQwQ2cvYmJXSGZrUXdSTUk3Unhm?=
 =?utf-8?B?ODdNbXk2QkpUb3NMbUlESVl4M0QxV3JadnpHd0Z0bVNCbUFmQ1BhRjdPV1kr?=
 =?utf-8?B?cVRXeGk4cG90TGdxNCsvWjBFZTNzcW1tc0tmNTR0REtrb29ESDhWYWl2MTNk?=
 =?utf-8?B?RStBVi9NUkZLWXBNL2M2aXVDS0Z5NGlkdzhIUXJrRU1lckQrV25xR09EODV4?=
 =?utf-8?B?MlpaTzVqVERGSUhyUXpYOEV5Y2VsTHBLUkxjME1ob1JXL0Y4TVY4STNuSmVB?=
 =?utf-8?B?UXNDS0NGQ1RzRTlmTHNkRDROa2RCamVOZnczb0phcHR0L1hnYkQyYisrVFd5?=
 =?utf-8?Q?50JVObvFFV7Z4NtXCgOGuhH/etssuYfWhqQPYUO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR19MB4528.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfee5aa4-2179-437d-9cb0-08d8edc39220
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2021 06:19:09.8025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rjzRjoj/Lg47ZIsTfxDCYWicn9gR3qOFCXJF3iO90zDYO1dgpMyUx7cykuXcfUCpTR2w5fUIsZgQQTZgB7s0+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB4866
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-23_01:2021-03-22,
 2021-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 clxscore=1011 priorityscore=1501 suspectscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103230043
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 bulkscore=0 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103230043
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

SGkgUmFuZHkuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmFuZHkg
RHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIE1hcmNoIDIz
LCAyMDIxIDE6MTUgQU0NCj4gVG86IFl1YW4sIFBlcnJ5OyBwb2JybkBwcm90b25tYWlsLmNvbTsg
cGllcnJlLQ0KPiBsb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbTsgb2Rlcl9jaGlvdUByZWFs
dGVrLmNvbTsgcGVyZXhAcGVyZXguY3o7DQo+IHRpd2FpQHN1c2UuY29tOyBoZGVnb2VkZUByZWRo
YXQuY29tOyBtZ3Jvc3NAbGludXguaW50ZWwuY29tOw0KPiBMaW1vbmNpZWxsbywgTWFyaW8NCj4g
Q2M6IGxnaXJkd29vZEBnbWFpbC5jb207IGJyb29uaWVAa2VybmVsLm9yZzsgYWxzYS1kZXZlbEBh
bHNhLXByb2plY3Qub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBwbGF0Zm9y
bS1kcml2ZXIteDg2QHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDEv
Ml0gcGxhdGZvcm0veDg2OiBkZWxsLXByaXZhY3k6IEFkZCBzdXBwb3J0IGZvciBEZWxsDQo+IGhh
cmR3YXJlIHByaXZhY3kNCj4gDQo+IA0KPiBbRVhURVJOQUwgRU1BSUxdDQo+IA0KPiBPbiAzLzIy
LzIxIDI6MzggQU0sIFBlcnJ5IFl1YW4gd3JvdGU6DQo+ID4gRnJvbTogUGVycnkgWXVhbiA8cGVy
cnlfeXVhbkBkZWxsLmNvbT4NCj4gPg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0
Zm9ybS94ODYvZGVsbC9LY29uZmlnDQo+ID4gYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9kZWxsL0tj
b25maWcNCj4gPiBpbmRleCBlMGE1NTMzN2Y1MWEuLjBlMGYxZWIzNWJkNiAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9kZWxsL0tjb25maWcNCj4gPiArKysgYi9kcml2ZXJz
L3BsYXRmb3JtL3g4Ni9kZWxsL0tjb25maWcNCj4gPiBAQCAtMjA0LDQgKzIwNCwyMCBAQCBjb25m
aWcgREVMTF9XTUlfU1lTTUFODQo+ID4gIAkgIFRvIGNvbXBpbGUgdGhpcyBkcml2ZXIgYXMgYSBt
b2R1bGUsIGNob29zZSBNIGhlcmU6IHRoZSBtb2R1bGUgd2lsbA0KPiA+ICAJICBiZSBjYWxsZWQg
ZGVsbC13bWktc3lzbWFuLg0KPiA+DQo+ID4gK2NvbmZpZyBERUxMX1BSSVZBQ1kNCj4gPiArCXRy
aXN0YXRlICJEZWxsIEhhcmR3YXJlIFByaXZhY3kgU3VwcG9ydCINCj4gPiArCWRlcGVuZHMgb24g
QUNQSQ0KPiA+ICsJZGVwZW5kcyBvbiBBQ1BJX1dNSQ0KPiA+ICsJZGVwZW5kcyBvbiBJTlBVVA0K
PiA+ICsJZGVwZW5kcyBvbiBERUxMX0xBUFRPUA0KPiA+ICsJZGVwZW5kcyBvbiBMRURTX1RSSUdH
RVJfQVVESU8NCj4gPiArCXNlbGVjdCBERUxMX1dNSQ0KPiA+ICsJaGVscA0KPiA+ICsJICBUaGlz
IGRyaXZlciBwcm92aWRlcyBzdXBwb3J0IGZvciB0aGUgIkRlbGwgSGFyZHdhcmUgUHJpdmFjeSIg
ZmVhdHVyZQ0KPiA+ICsJICBvZiBEZWxsIGxhcHRvcHMuDQo+ID4gKwkgIFN1cHBvcnQgZm9yIGEg
bWljbXV0ZSBhbmQgY2FtZXJhIG11dGUgcHJpdmFjeSB3aWxsIGJlIHByb3ZpZGVkIGFzDQo+IA0K
PiBiZXR0ZXI6DQo+IAkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBhcmUgcHJvdmlkZWQgYXMNCj4gDQo+ID4gKwkgIGhhcmR3YXJlIGJ1dHRvbiBDdHJsK0Y0
IGFuZCBDdHJsK0Y5IGhvdGtleS4NCj4gDQo+IERvZXMgdGhhdCBzYXkgdGhhdCBDdHJsK0Y0IGlz
IGEgaGFyZHdhcmUgYnV0dG9uIGFuZCB0aGF0IEN0cmwrRjkgaXMgYSBob3RrZXk/DQo+IElmIHNv
LCB3aGF0J3MgdGhlIGRpZmZlcmVuY2U/IGFuZCB3aHk/ICBBcmUgdGhleSBkaWZmZXJlbnQgaGFy
ZHdhcmUNCj4gaW1wbGVtZW50YXRpb25zPyAgRG9lcyB0aGUgdXNlciBjYXJlPw0KDQpUaGV5IGFs
bCB1c2UgdGhlIEN0cmwgYnV0dG9uLA0KQ3RybCArRjQgcmVxdWlyZXMgdGhhdCAgdGhlIEN0cmwg
YnV0dG9uIGFuZCBGNCBidXR0b24gYXJlIHByZXNzZWQgYXQgdGhlIHNhbWUgdGltZS4gRjkrY3Ry
bCBhbHNvIGhhdmUgdGhlIHNhbWUgbWVhbmluZy4NClRoZXkgYXJlIGJlbG9uZ2luZyB0byBzYW1l
IGhhcmR3YXJlIHByaXZhY3kgc29sdXRpb24sIGp1c3QgdXNlIGRpZmZlcmVudCBrZXlzIGNvbWJp
bmF0aW9uIHRvIGFjdGl2YXRlIGRpZmZlcmVudCBwcml2YWN5IGZ1bmN0aW9uIC4NCg0KPiANCj4g
PiArDQo+ID4gKwkgIFRvIGNvbXBpbGUgdGhpcyBkcml2ZXIgYXMgYSBtb2R1bGUsIGNob29zZSBN
IGhlcmU6IHRoZSBtb2R1bGUgd2lsbA0KPiA+ICsJICBiZSBjYWxsZWQgZGVsbF9wcml2YWN5Lg0K
PiA+ICBlbmRpZiAjIFg4Nl9QTEFURk9STV9EUklWRVJTX0RFTEwNCj4gdGhhbmtzLg0KPiAtLQ0K
PiB+UmFuZHkNCg0K
