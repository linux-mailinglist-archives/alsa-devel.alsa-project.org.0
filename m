Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BDC421DF4
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 07:29:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB589166E;
	Tue,  5 Oct 2021 07:28:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB589166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633411777;
	bh=dWmJ2f9pANLqxFP7uQ1kGjMWTKBnLib30jGR1dWUVtA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DrRETTrdNOTDtJL59seWCE0E3JZQUf/QBdujwd2QVYvyPuvj4BWy7UOPLA1kFVccG
	 eeMilHtqDNHznnx84xJS/ft7jxH3eibu3RdXgHqRJYtn/QU76nTZI6NzWzjHpwplKG
	 ub3LU/UUCdBLEVZddLl1XxcdrjyL9IchxZcxx9ts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 453FBF8028B;
	Tue,  5 Oct 2021 07:28:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1CE9F8027D; Tue,  5 Oct 2021 07:28:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 HTML_MESSAGE,KHOP_HELO_FCRDNS,PRX_APP_IMAGE_PNG,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BCADF80154
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 07:27:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BCADF80154
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=st.com header.i=@st.com header.b="BXB485Ag"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194KMJ7L032451; 
 Tue, 5 Oct 2021 07:27:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=STMicroelectronics;
 bh=JADFbgefvSzBkJihv6g94U5wbl1tyks+rzh7DPhfga4=;
 b=BXB485AgEjSr0kWO5gm7BU5e9vvuV68BiuQW7oqqTd5NxtfEE9h2RyaYW2NQh24kXDXe
 qGCFjebwIEfyIt7/PgbVdTqqtO1OqZmmyC2cq7Uu5E1Ssct5Y5Lt9pypLse0Yse7mqM1
 1Vsr+LcPJu1uFIH+uV5ZF0VRbhW+mO9HrbLuGnMOKURR6U2dCcpMCQXRTvdFQxKC6Gk5
 1bR785QTBFnbOeIMRYRT+HD4QLoU4VqKkJe/mbMkj3jDCyDnWKvtaI4nG9X91glZ/Elf
 mUxIF9O6kpjjhmnPSWLcrv0OTUW+qdZNt9OOAh0i6HvDdI8TiCGJIOwp3+39cv5zf8Ht dg== 
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2056.outbound.protection.outlook.com [104.47.1.56])
 by mx07-00178001.pphosted.com with ESMTP id 3bg8kdt0bq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 07:27:53 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJOnTpTm64EyT0muBu9fpgBkKdxt+iY38GaCmmhEQDBPBoJ64NuMH2gTtHhEklD9mEwRn3b3l7v8vwdgFh6y+ZV8XsMrytJ6xqmFuuXxdwGC0mv4We3DNqnl/blJnQnB3/keIzxIAQ5UPBmNqnOwFfo6w0NKqgZMlmnBMSlaJrdeRS9UP3zKNsIdDVP8aLwXB9YBeLl0nh76Qktwdt/RlIUYgIeU9BYc5XIBdza1hozRi9iqG+tXZRmrHaW91giyiu4euaFWbuO43XoKLPw3GRMWqgjnQ3SYd5Cg3G3tJ/EW0t7Xi3nyYbdDzW+avSzGsGH4sZqBTWt3nCFHDu2aaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JADFbgefvSzBkJihv6g94U5wbl1tyks+rzh7DPhfga4=;
 b=KruLPXR1zBPSB6iDvMUSxqONJ+WTGhbsF9xBVUEby5Tp26/mQJsAAkhQVC68cDwD0Y6ju+TXj7bQpBPEL2g6BUpG5IXHlp8BGMY73JTM8qS2sNyN4eEoybDIAeg3NRU2LkOpx0N4dZIdAXgPCfoRxfwMysBM7iz82qL9dxvijrWYxRls7iKmYL+E6J5+7R5EdEKcYap2HJo0KgJW+k95Lvh9yuE0mQxdG8tcj7deBN8PjacBGZcpO9vKceXy2eqUH8ihwa5ux03bvfPvzyCPK3zNpC61JHx3DV1oj/OR29ifyfZajWLz6qYwwVVY7Rbon2pEVR083OTatlx+Lv4IGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=st.com; dmarc=pass action=none header.from=st.com; dkim=pass
 header.d=st.com; arc=none
Received: from VI1PR10MB2797.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:ec::15)
 by VI1PR10MB1664.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:802:39::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Tue, 5 Oct
 2021 05:27:52 +0000
Received: from VI1PR10MB2797.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f59a:1530:af14:fe24]) by VI1PR10MB2797.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f59a:1530:af14:fe24%6]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 05:27:51 +0000
From: Manish DUBEY <manish.dubey-ext@st.com>
To: "review@review.trustedfirmware.org" <review@review.trustedfirmware.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "stratos-dev@op-lists.linaro.org." <stratos-dev@op-lists.linaro.org>
Subject: User unsubscribed from mailing list
Thread-Topic: User unsubscribed from mailing list
Thread-Index: Ade5qKn+0LMbL0XmTE2bwg8GYzIU0A==
Date: Tue, 5 Oct 2021 05:27:51 +0000
Message-ID: <VI1PR10MB2797A60BCDF431E365D8454CA7AF9@VI1PR10MB2797.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Enabled=true;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SetDate=2021-10-05T05:27:46Z; 
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Method=Standard;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Name=23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SiteId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_ActionId=07937e5e-0f8f-401d-9a11-ca623c1307c8;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_ContentBits=2
authentication-results: review.trustedfirmware.org; dkim=none (message not
 signed) header.d=none;review.trustedfirmware.org; dmarc=none action=none
 header.from=st.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2b15eef-9541-4f8b-aff3-08d987c0e046
x-ms-traffictypediagnostic: VI1PR10MB1664:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR10MB16641E34FF9030C165000DE4A7AF9@VI1PR10MB1664.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2VwcZBjWHOmmdW4DCnbHZCG2qLbS4pw7y2EFavME4WOPai485XOhz6i9f671OnCuTms9UPzWWyRMDwwHnzhrrMmLuU5+zhxqj2w4H78NG+Vpo/qaTkFuu4Bqp6KTaiRMjIaEzOSomI6SytPgs/EziMYFWwIc9o7q9h9iGh72ru2X85DZCqsHUZYfTpD18wlOcTX79Zl6M1TQv6SFOtFXw4uXd+dYKLPofVdfamvk2j6+8vsSncrOh6jrcWE3JbYhk/jKJjsSdpfKFe0b/oSUXat4H3FNOCV2qUQkB+mjCQHfEhuHmmi0c7uCkMVIvqz+fMsqxq0RikQs30D4e0dGWDRArCEstf1n7TVtiEbKanO+uemYfXz1gefARVj8F3JXYzL/76L+fBgFtXoe4i2XTB7BLUfIfzPWBBaM8W6+V31EOfp9bxTM2J83vJWiU7qa3Hgjtq/OH4upCI1tcYAMm00LDMn7lJABtBXFWcPWaL2RuNNeQskHNaTDt1tBF4Hs+kH3zkVOONx1nBdh3x0Jd67+RpYcgypS3Up1BaZ1EcDxfiU6Qr/ZecfVTkDaK3po3SPAsE5S/V7C/ZXHgrfLnTW569axuMNCrBIEJXcTyTUs87H001PhVnYHrEflfnxztjtliEhAwpLGD70tAQmuL81UuTGNRk2eoijfhBnHXVEtWefxt0Pq579uO3rmlQ1/4oUejEw0KgUWMS/dmRIi7bIsisR5t9IL0arfSvru/y/2PKXLRUW4hiRHgB1cd4yLr8E+NpHFZw5CKzs5or94zg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR10MB2797.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(55236004)(122000001)(55016002)(5660300002)(508600001)(86362001)(52536014)(83380400001)(9686003)(316002)(110136005)(71200400001)(33656002)(99936003)(38100700002)(66476007)(8936002)(2906002)(66946007)(186003)(38070700005)(76116006)(66556008)(6506007)(4326008)(7696005)(8676002)(64756008)(66446008)(4744005)(9326002)(26005)(223123001)(130980200001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?idGN1uIzjen8TY165Nw5VZji4qXkqVkaGZZJxUNNYSVXnYAiOK9c2wAvw2UP?=
 =?us-ascii?Q?IPjh06Oc75j5gPyFsdMXykEQhEO8PlBZ/VLIxy0RW3dxyhKk1BkvzTuS9wH0?=
 =?us-ascii?Q?/GAwwRhlvqRYhR+PgeJqpgiD++VG5+6tX4G1aWyH9m9h01KB2hrwQmS0Wh2j?=
 =?us-ascii?Q?cOik6AYX7IBtMGmLJ2z3ekBOH0KvSeNigZPwkIjEX3JfFpY6jeQEOyhTZd9w?=
 =?us-ascii?Q?w8ztEtyEwia60dEDEi/Cq4q/UC03lZCC7G9vHfbQfHEUoH7paTO/qBICyhLh?=
 =?us-ascii?Q?fPETakyQnu6SlMQ4enUlJW33/mw70R0c93zdHStUd8a8J7FW5ydAvVEGzSuf?=
 =?us-ascii?Q?kgCHQNl2XTNveFvRQAKizLt7xOT7nGd8QPKKyKAPQk6sLOBHjkxyG6iT1ZvF?=
 =?us-ascii?Q?CY278icBAAhPdWuTvNJbnTbFawwXA9UqkiKAZzyjj6UeI/ujGKrZr/5arybO?=
 =?us-ascii?Q?lgN4z94WRjwunJb97yKL3+DUtb2HtiHILxJuq1jiwo8MDnFnC1jGV36MrfKx?=
 =?us-ascii?Q?t4wyL9jlDDUMaeZnNzP2RJlf0B+ULxqm/KBd8kmH27J2NJVPih06GMCi2FMU?=
 =?us-ascii?Q?0y1Zrgu/QcAApHJ9zebGBS2Wg/5C8Hn3Bdh435il3hoL91+FBp2nSweWyLT4?=
 =?us-ascii?Q?xik+Tukd2RD3BjLItByIMnDclz0HJazoMkVrYtibsVsc0dCWTSz9TIuRK4am?=
 =?us-ascii?Q?mvSzslNcgpEn34HX7MUnG2W2yM9izF0S15cpz2Kln5fCSqtZzzjxq7STnBw0?=
 =?us-ascii?Q?Fu578mgwyiTMev3s8X9O6JmK/OWoQmkSrGG7J2Yj3cR8zRKtg1gqyp2DlSDB?=
 =?us-ascii?Q?KmNmYEPHeclwLpaO5QiKuc0WScL0U4QVjqLb4B/K4BndOhqWDQOl1APEI6Uk?=
 =?us-ascii?Q?gyUeAAotLKFNkpE3NdzgC+K4c0Zanu5wC370svIU41uccNw2uj8Iz29wnYIV?=
 =?us-ascii?Q?Yx41JEPfsmtvG1Ffm0UtFSiwsY4Cwn0AOmUKeE89HrkYU8mkfCShdhKcO5px?=
 =?us-ascii?Q?h1HLAkApgX2gor5nJb8r7fW8iQBjJSlRRhSVOLYwPh/g5ZCC68CquTLJ+T0Y?=
 =?us-ascii?Q?WFkIYqYXGn2jVIYHt3FBAr09DcLtM5cba+AqFI2SJHWtWDK8lOrpuvhDQR+y?=
 =?us-ascii?Q?aYMwqhiE4g69425DaexLawZPQq8bYFoHchsabxoROPXljR9Q1rIJqpMCBcbD?=
 =?us-ascii?Q?RcaL/iyQqKRn4NMpG8giai6GuxLImBbb7G/M/4w5t2FbIrBa+G0O7OjCRt9v?=
 =?us-ascii?Q?2LGkGxam7zfazl913iWBTiItot/UfwhdFEs6Vwo3o/dehEEW7QBmiayFuiQK?=
 =?us-ascii?Q?MC1hTZvd1ka9bAwfhK0KeAz7?=
Content-Type: multipart/related;
 boundary="_007_VI1PR10MB2797A60BCDF431E365D8454CA7AF9VI1PR10MB2797EURP_";
 type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: ST.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR10MB2797.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b15eef-9541-4f8b-aff3-08d987c0e046
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2021 05:27:51.4795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0krsemh+gH+ZGb9vTXWjeSbRFhUUqWXfliQ9qXh74Vbj4LH8PnGyw0PKu3fo6CNrpMvvhD7VD1GN4Dw0BoOc4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB1664
X-Proofpoint-ORIG-GUID: e1QOsdRas0sCnoXf9o9RXKM7-GCW6bL6
X-Proofpoint-GUID: e1QOsdRas0sCnoXf9o9RXKM7-GCW6bL6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 clxscore=1011 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=749 spamscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110050030
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Mohd TANVEER <mohd.tanveer-ext@st.com>
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

--_007_VI1PR10MB2797A60BCDF431E365D8454CA7AF9VI1PR10MB2797EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Team,

Hope you are doing well.

We have some users in ST environment being subscribed to your Mailing list.=
 After few days they use to get an email stating that "Your membership in t=
he mailing list has been disabled due to excessive bounces"..

We have verified at our end and didn't find any bounce back email getting g=
enerated. To investigate the case, could you please share couple of sample =
bounce back (NDR) email received by you from ST environment. The NDR may he=
lp us to investigate the cause of bounce back email getting generated.

If possible, we can schedule a call as well to discuss the case. Feel free =
to share your availability to discuss the case and we can share a Teams inv=
ite accordingly.
Awaiting your response.


[cid:image001.png@01D7B9D6.F6BFBDE0]



Manish Dubey | Messaging Support
Mobile: +91 9716060208





[cid:image001.png@01D7B9D6.F6BFBDE0]



Manish Dubey | Messaging Support
Mobile: +91 9716060208




ST Restricted

--_007_VI1PR10MB2797A60BCDF431E365D8454CA7AF9VI1PR10MB2797EURP_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=6954;
	creation-date="Tue, 05 Oct 2021 05:27:49 GMT";
	modification-date="Tue, 05 Oct 2021 05:27:49 GMT"
Content-ID: <image001.png@01D7B9D6.F6BFBDE0>
Content-Transfer-Encoding: base64

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

--_007_VI1PR10MB2797A60BCDF431E365D8454CA7AF9VI1PR10MB2797EURP_
Content-Type: image/png; name="image002.png"
Content-Description: image002.png
Content-Disposition: inline; filename="image002.png"; size=261;
	creation-date="Tue, 05 Oct 2021 05:27:49 GMT";
	modification-date="Tue, 05 Oct 2021 05:27:49 GMT"
Content-ID: <image002.png@01D7B9D6.F6BFBDE0>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAkIAAAAGCAYAAAAv8fFTAAAAAXNSR0ICQMB9xQAAAAlwSFlzAAAO
xAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAACFSURBVGje
7dY7DoJAFIbR2ZdIiNvVDgqxMDRug3JohMJHpQZnoruYU5z/JncFX6jaONb9vFRdBAAowq99pjGk
ELo359ta91cAgCLk9klB9Ahp5vxIFwCgCP/2WYQQAFBuCG276b27vNZmeAIAFCG3T9VNn5BmX5/m
Y6oiAIAi5PbZtPHwBU7g/AA5GWnrAAAAAElFTkSuQmCC

--_007_VI1PR10MB2797A60BCDF431E365D8454CA7AF9VI1PR10MB2797EURP_
Content-Type: image/png; name="image003.png"
Content-Description: image003.png
Content-Disposition: inline; filename="image003.png"; size=196;
	creation-date="Tue, 05 Oct 2021 05:27:50 GMT";
	modification-date="Tue, 05 Oct 2021 05:27:50 GMT"
Content-ID: <image003.png@01D7B9D6.F6BFBDE0>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAA4oAAAALCAMAAAAOV4MqAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJUExURSA4ZAMjSwAAAGSjsxsAAAADdFJOU///ANfKDUEAAAAJcEhZcwAAFxEAABcR
Acom8z8AAAA1SURBVGhD7dMxEQAgDACx4t80HAsS+CHxkAEAngV8piIkqAgJKkKCipCgIiSoCAm3
IgBwzGzfxhirSWBXYgAAAABJRU5ErkJggg==

--_007_VI1PR10MB2797A60BCDF431E365D8454CA7AF9VI1PR10MB2797EURP_
Content-Type: image/png; name="image005.png"
Content-Description: image005.png
Content-Disposition: inline; filename="image005.png"; size=261;
	creation-date="Tue, 05 Oct 2021 05:27:50 GMT";
	modification-date="Tue, 05 Oct 2021 05:27:50 GMT"
Content-ID: <image005.png@01D7B9D7.D4BEF2F0>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAkIAAAAGCAYAAAAv8fFTAAAAAXNSR0ICQMB9xQAAAAlwSFlzAAAO
xAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAACFSURBVGje
7dY7DoJAFIbR2ZdIiNvVDgqxMDRug3JohMJHpQZnoruYU5z/JncFX6jaONb9vFRdBAAowq99pjGk
ELo359ta91cAgCLk9klB9Ahp5vxIFwCgCP/2WYQQAFBuCG276b27vNZmeAIAFCG3T9VNn5BmX5/m
Y6oiAIAi5PbZtPHwBU7g/AA5GWnrAAAAAElFTkSuQmCC

--_007_VI1PR10MB2797A60BCDF431E365D8454CA7AF9VI1PR10MB2797EURP_--
