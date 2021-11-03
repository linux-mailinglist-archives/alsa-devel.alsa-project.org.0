Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2C2444024
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Nov 2021 11:48:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95CE71687;
	Wed,  3 Nov 2021 11:47:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95CE71687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635936480;
	bh=HSI1YyS1I8v4VavBMjWebrcgF3o7QAlp91P0zxWIMFI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a30gQ4xLiNWB5LGtRmgLmR9maM0T9arb5UOOecaIussyZlqihsWaR+XQCsuRf0TPN
	 x7D3WFseXrJ0swlECcSvBC8dtaWRJxl82nlfP6rbRx1oZJ5/mQB1h+PZLUTHfydoMu
	 cSLi/TROH9oyjtIv9MCZG+bgn5dxRV24e1EPp76s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC89CF8026A;
	Wed,  3 Nov 2021 11:46:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 167E4F80269; Wed,  3 Nov 2021 11:46:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MSGID_FROM_MTA_HEADER, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4135CF800FA
 for <alsa-devel@alsa-project.org>; Wed,  3 Nov 2021 11:46:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4135CF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="gDku0v9D"; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.b="s6+R4/Dk"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A3AMCIx010685; 
 Wed, 3 Nov 2021 10:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2021-07-09;
 bh=umhmtnqEgrXxXuPsIAXxb+H6pd34OKuiybvfoXU2ayI=;
 b=gDku0v9DbVCSJN2PRu3RWnAtWzOjNh6g8x37V+MdrOxlVO2LwTZdTLHfx+kdSm1EvcQV
 1BLa9zMJEr+73K9R9JUyv8qNCAKMCGttzPQqb/Q7wbxGRcbEGALdSkCIi+oVbQO8qf9t
 QItL63+Q5F6nUzmX9vjSXhCv85Gk/pkIR0f+2z/P7CbPaMeHbGN0gZOXLzTw+bouelbC
 LB8zK52sYo1iFUJgFUeKW2BkcXuwD2p8GecgDN7DzahI2OSQbMTD3tWghdG65VJB5xzI
 KUn84ss9PmS18sYTygtIkr1bi1sYqntv+oXOxt0YHL24NOWxGcCUC8EPg1EW0oiRSehJ MA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c3n8p111c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Nov 2021 10:46:26 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A3Ajem4041121;
 Wed, 3 Nov 2021 10:46:26 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2173.outbound.protection.outlook.com [104.47.73.173])
 by aserp3030.oracle.com with ESMTP id 3c3pfxedw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Nov 2021 10:46:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZlI/uctvF/OXYOgYzDqQhBW7Aem1T1rrKKPgW4AqF4SiezlfLgInyQLVXmvepMNFvYwSs3Q9zbj/NpoMmxHm/y1NnfX4hJevsB26tj3Kvpc/HQGbwfQjKq2ye1jzHorc73PMMbZRoDkR1cNCD6uf9cNChiX2a6hdn7DSYjIfcZ+0sdkIBJxpu2TvidR2GZk/PCwknODeMa4Yi9LLF/fRWkFtT9ZQbtJW1HRe9XNKof5M260v6AiLk9L0JHBZaZ6B1IYYcK2RG+EaQ9L9e7Wx83b3z505sSf+C1aVzg6HOx7JUrRaba+ZAGiYA3W8ujKLLuksmliX5dMsoZkcGvb8Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UK3n/czdAlZNl832P6r3sW3bP6EOtHoz+MgwAK/Tmvg=;
 b=h84ZuXgIDJCItT9M8uuEMK/oTvATyM5yoE/b2+MAeVw7JMwJNVIcRuIZvk9WFbP71vVwenN5TOTsvRIBLtYj7lTDPOOqXkNOdbzjzpXAzA1KJxTIANxsqXJZUKfiUOB5c9TlryyNc8VkbtpB2HaE8U1LMYOMo+CpDVM2k3h+g1w+7bcLR8sl3IDVSxdy7J59Ukh+z9FMKZqdymBOdJZpmiArpJ84GgFcdKMpsSxTuL2o0709NO5xYnq2PdyUF9Y4bSU2K5MGUq57IKlbxczCBEB5T1+K3PVq3whFCnzurDrHUg/iCm2VbLRj1elWGsQGJwlN8/3HWDtBFZjumVmWiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UK3n/czdAlZNl832P6r3sW3bP6EOtHoz+MgwAK/Tmvg=;
 b=s6+R4/DkkehKSiyc5R8w8jC4RROKw132vaeqvp4qKbg0moDz0+y3gcfnWHJU9fZS1tAa5SGvukrUG15X/pca/axY60ZM3i5LugdCflikpca0iuIGcSAUDE8p5Oo3/Gv/Y/nkQIzIC+pQEHokgmDsym1IsR1LD1dhMy82kwrSl78=
Authentication-Results: wanadoo.fr; dkim=none (message not signed)
 header.d=none;wanadoo.fr; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1824.namprd10.prod.outlook.com
 (2603:10b6:300:10a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 10:46:23 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 10:46:23 +0000
Date: Wed, 3 Nov 2021 13:46:05 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: codecs: Fix WCD_MBHC_HPH_PA_EN usage
Message-ID: <20211103104605.GN2794@kadam>
References: <988948f7f266aa00698704687537335b7e6a67b2.1634455711.git.christophe.jaillet@wanadoo.fr>
 <3ff34912-19e6-4d52-e9da-0e78ceb1d2ff@linaro.org>
 <c01b6669-d0f7-aab5-3aca-02f19be8a319@wanadoo.fr>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c01b6669-d0f7-aab5-3aca-02f19be8a319@wanadoo.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0012.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::24)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.22) by JNXP275CA0012.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:0:19::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17 via Frontend
 Transport; Wed, 3 Nov 2021 10:46:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 820637b8-17ae-462d-62df-08d99eb72da9
X-MS-TrafficTypeDiagnostic: MWHPR10MB1824:
X-Microsoft-Antispam-PRVS: <MWHPR10MB18244701BC239923080733358E8C9@MWHPR10MB1824.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wu8l049prz5EiLf7O8ziG4utGsilmKHgOATq5ZTtQYlnw9HLZyAjd3ZXX2R+NeEk/Lq/Hyj12MMuwtH9otGF4lRhh5bEfjztfBMHFiL/8Zn3JGzWG0EzAL9cNPZKuo1Hi4CV9kr/RIPf18m6pXa04fI6uiffTe9LK8V3zSXz0wvneTpOyFOFidTRg1SERuR/SMTAkaJ0GU+zv/tSvgpix1Diwkkdrc9D5BbUruSHIASGZFdglL5BIENvUzGlD1sRi2bawlXDsvpgxnNVL54S7JpQl6SRQUXnmt33D2dhsY8Cwc3pVftFi4DDFOpdcdv4rOIH2YAL6wMZCRF6kZtafbXVFt3uMUXPU9LrG6TkcDJGu+vePfzXVqlTtWpLCJRNGgaNNR3nGNLAz1V0daViqtWPFQa5nEfEI32rNa8nn113ygKjo8D1e4BPUD7HQv9TYKBJ3YkHcQ8aMxrTjypiDnp41rCT9p+STqLXBO5zK8N2Ej1YF61t3EpdDijsg0+CG86+3dWDpdEh5+btuySRvHh5orSGqT2wlIwtKeMeFReGAq50BTodmIe8ce3MkPbL7FFxiAKQ1y/KnNGoGgNMG5mjf2a0p9w8qVRg1JJI9vmnxeE8DnMdkVF2VzEKQIo/BbY5qq1PR79ng6OQnSADDb2l38n4qHh9nBgkDHcujDGwLMPnhD/wwfEeJCZ+6Re4rEajvgpqDifMUMPSnrsFEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(508600001)(9686003)(956004)(33716001)(186003)(83380400001)(316002)(38350700002)(9576002)(4326008)(5660300002)(55016002)(4744005)(8936002)(38100700002)(66946007)(86362001)(7416002)(66556008)(1076003)(66574015)(2906002)(66476007)(33656002)(6666004)(53546011)(52116002)(6916009)(44832011)(6496006)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Q9yoWAN1/er9fVFuMjVXYM8S5o0zwBlIPtsqsOX09KnIETVaDTrvDmUyva?=
 =?iso-8859-1?Q?ATbIC13kR4KKzBdueNtQZjVolzV9CCrU59ao9XBtKfN13HgUuYUOxcI9Fe?=
 =?iso-8859-1?Q?RH7bMT9pO+CrfQj1VY3Zeh/LrxFyeMncBADuNBQQMVTxKFTNWAIBC4a2h8?=
 =?iso-8859-1?Q?sHp23w09R/kW1IIavuJZGkJjSydbyzrzhabshzwxkQpAPjx139k2L1VIuW?=
 =?iso-8859-1?Q?tX1vBJC1YtyjXCQeRBpW2YSXgRjMtiP05+Bh6VgJ07vE/n8/C5Ntdu0yw2?=
 =?iso-8859-1?Q?1S7YIzuyV6vbELbGxiuUYoSltm5Fh1//owq+biZQ/recZy662UM6MnrfV5?=
 =?iso-8859-1?Q?Il01KHV03xST/sIhThKVxQTHC3pu3XAgF0EnuagKd+yXG+5dWuga4KMcSA?=
 =?iso-8859-1?Q?/UG88ubHkLSbJ4c66crSmzRVUPyMwt3qa1WGhcwWz+VShgHe0nDnZM53qO?=
 =?iso-8859-1?Q?kUTwA3AIQjr6g9DHWtjTCRHpwtay3D6QZZMsiwvahxog2rF3Gx88g+4f8g?=
 =?iso-8859-1?Q?adqu5uuye2yoD3CL93mpMLWGsfr9ehVsSz39zPH8AffDp7ilETBib4UbVa?=
 =?iso-8859-1?Q?mxZo6J7gbv9lWhkZWtwKKq6iRDskrM0bDMaXth6FWD/WXQw/A2cZQHU2tI?=
 =?iso-8859-1?Q?NnmhlUcARfdA5V8qZRSdVXDIQAgsxu09YcO7iOEkDTR4oQOdJ2KVV07PAk?=
 =?iso-8859-1?Q?j3x0CWCrOXfqcaNV2jAhjbPOxY8E8UGZaQRhjQ1QmCd+6vNmBQnQp3LHA1?=
 =?iso-8859-1?Q?My1Q33Hsy0VXrhaJOlXonVi4kdMLrz7c2QOVtTzcLEhIj9OsumoWkanGry?=
 =?iso-8859-1?Q?9K5MbZYfiHRrRLf3JD3mNyMxjsd0VbAK8Rdh7/PL9QiFtAwq+NIsGuBRJ8?=
 =?iso-8859-1?Q?UrT4xU2XLeVRVJ6+KGHmKr/OtlBDqiqmhzCjnKxJ7JZgNyx7h9Q5FkhjjH?=
 =?iso-8859-1?Q?41ueiCMmnDhuL61ORccaXJGf7DRrCpfO0cM6lPc0SovbdbR5NhUCtoKFz9?=
 =?iso-8859-1?Q?u8rRqLHNIu96zHiH6s76ZJouYCT+e2zCj/vGPDmEWYJztqZRzdEG1GY4SE?=
 =?iso-8859-1?Q?XjGOatWEbeq/l6lWNKtNXZJjiM0QCaaS/Cjcy6josFUd7hnH1nkUDVHbk+?=
 =?iso-8859-1?Q?DIV74zjDyuBPvrPpUX+ORp9/Ez91WsTqkISyDJYegnkGjWOVOX5y4ZqOtR?=
 =?iso-8859-1?Q?L43/Obe59CrYWMfFeP3LqMloROLY6zL6q1qaDNIRTJlXpCeZJ5mZEzRABI?=
 =?iso-8859-1?Q?EatH8oKm0seXNB79ZaiqwCgmnfMWlNM8Gw+RoOYoeD/kWgsQ7ddzWM5lL1?=
 =?iso-8859-1?Q?XbAdDbU4ov65u2pjZVdTMRkFqGsuR3mxrX2lbJsrYNvcnwXSohlVWU94vh?=
 =?iso-8859-1?Q?kqp7+1PDOlx3YS4PWoJUuV7aF1S2qKSZz1MwthVQubM/2Vafw2gbhOWdQ8?=
 =?iso-8859-1?Q?HutLLh1UvvaUCWtuESy74UgW+fz3whYw0xAEZfVgF/uf88TTpXg2PhOu2i?=
 =?iso-8859-1?Q?zeZsfdkeTfwLyMLTNvoeGgYLTlkwveSeXrx0YQGRUIvDL41T2y2C2c//9k?=
 =?iso-8859-1?Q?1Mvg5yAU5sOn49emZ+4/w5qCVMByLc7o50HqwpsCCNYAT2vjC1hJi9+kLP?=
 =?iso-8859-1?Q?Usg5iGk/22oP3Ju7uQyJduFiVh5ZkJbhuxcl9+TRlSnm9x0vNQwHH5iZVQ?=
 =?iso-8859-1?Q?S9UvLTnmfvgJ2xts6BG1U9xZj1/5Lph9GHU+K4ObchgxzRVJftv1eXejLh?=
 =?iso-8859-1?Q?rchw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 820637b8-17ae-462d-62df-08d99eb72da9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 10:46:23.3244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gG19bG5/nVOLQTJEFR5uI5IDwvyOOzy+V4ZGYg3Hh3k4zysJumPdD2/cpcRtNNOnH/dkiXRgt1cfqauCtds7aXkqX+soqUUI5AoKlu1Jttk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1824
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10156
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0
 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111030061
X-Proofpoint-ORIG-GUID: 4aIo4VcmqMhqApv8TORVDSrIG96forhw
X-Proofpoint-GUID: 4aIo4VcmqMhqApv8TORVDSrIG96forhw
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, yang.lee@linux.alibaba.com
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

On Tue, Oct 19, 2021 at 07:39:04PM +0200, Christophe JAILLET wrote:
> Le 19/10/2021 à 15:47, Srinivas Kandagatla a écrit :
> > 
> > 
> > On 17/10/2021 08:31, Christophe JAILLET wrote:
> > > 'hphpa_on' is known to be false, so the if block at the end of the
> > > function
> > > is dead code.
> > 
> > Yes, this is a dead code we should remove it.
> 
> Ok, thanks for the clarification.
> 
> > 
> > This code was part of moisture detection logic which is not enabled in
> > upstream code yet.
> 
> If 'yet' is the important word of the sentence, maybe the best is to leave
> the code as-is.
> If you prefer it to be removed, I can send a patch if it helps.

Just delete the dead code...  Never try to plan for the future, it's too
unpredictable.

regards,
dasn carpenter

