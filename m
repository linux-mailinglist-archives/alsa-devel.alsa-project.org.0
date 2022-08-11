Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB7658FB0F
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Aug 2022 13:03:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7982C83B;
	Thu, 11 Aug 2022 13:02:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7982C83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660215781;
	bh=F1bhZG1SNV4Ap+aQYLlmZoE5oIIL9sENGT6EzNF2nZw=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gMkRgCXNwz05oIaa6AqWjmnWgFIIwAhp5mJIL9LMEBF/CnsXi7fW60q5umKsAhky5
	 7FPObYVaOuMHX5Zmg0nvnnj2oRu8i8zQxJ7akXgxI+EYG3Z06CyR+mQjvOsZiaRE0k
	 gfHYJhuj0uySfhQ/iD4QMt64x7LHtsVVj4JTN2Ao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7B0AF800AA;
	Thu, 11 Aug 2022 13:02:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDF1AF800AA; Thu, 11 Aug 2022 13:02:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1A53F800AA
 for <alsa-devel@alsa-project.org>; Thu, 11 Aug 2022 13:01:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1A53F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="WHP6Zr80"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="p0uyQvyF"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27B95Qib021745;
 Thu, 11 Aug 2022 11:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=Kz1UhjyVVCQbJOxQsiMYvgNHKTfNonmjPYzHlgamdSw=;
 b=WHP6Zr80PdUaC9nIKsfGCs2vGn7/rlPs/Mmk2WQ0bw9CKx8x1+LgBXTCRmEyzX+OnEyq
 YixwuQ0+EJcZw/kBBH2Vdst2/TRJLyqD5uHArWHm0VyJhXyeMvfftacPr4UDo2Pf/dap
 UyhotHC+/RZbx6JnohFeGAUhd0Fmuy1bYlp0Y8EEIhDTsTb3BdXcRAUtgibU00vClKDt
 lAUQDL22DmunM4/JftlO5/gR+49yBQu8ofxn6IBRxoUKEoE/qewCbTIPsQxw0t9uuo/6
 x6uMWYNTagce/KTpyIokrvps5CFRkX+jy7T/v4jQBpsPiqyQA41Af48yTbVE26YTmGxl EA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3huwqj4b3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 11:01:45 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27B95gL6019018; Thu, 11 Aug 2022 11:01:44 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2043.outbound.protection.outlook.com [104.47.74.43])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3huwqk090a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 11:01:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMkCK/3a1k8S0D212veXCU2ZSszttoMr3o5zIPs4n3RjnK6+WPdQWtbKmFXb7duA0AfufqcjpVIMFBN2mXHrrBxIW1LfnhPmwbEDKoM2T0KJ0kmCYdBJT+GTUPm9jy1Jr0+dujQmEyB6BxIuRl/O7pNbyzp48I/8vt4C5WEm8DXWnPab26zdjFTImY4cZQHp+vnJwsN0yvBcE/KcE8XsX+fKCsBcgETns/D0JdYwGznpALy/S9cMQiNN2gGhkvlVl5xwIe7j9TgdEXbmVUkAVh8wyHdb+UM7vjdCoZBN81zcSYql7OPregjfdkKO+EfA35Mk+yh4VMUd5SW+k5LkDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kz1UhjyVVCQbJOxQsiMYvgNHKTfNonmjPYzHlgamdSw=;
 b=AGhXRSMSZMUNxBxR0xT+cbz33nm2JWZCA0W1oOYKiG8v0jN/Q8fCT0gEe064NT6GNRylQjq/YJlPruvvKzUaJN3PbWptN0XEA0+WocZ2eW9m9YrBztYOqY5N32/KEwsdosgiUaSAXfKaVdCvqhFH3B13y0cDqlMvP2ibTNkigrNNBCBjcS0ganZi2dezPIHwxyxED7EHoWVMqjG6DiSZknw6eykmDK27wwa0J7rk81xxgFU/NdSx76I7OFfdQvssoqSz1h9UYZsbofuGKGaFWLhwJJa64OOg8fWfXws9F5rRn5YQFr16ft6QA6SLA3MEMCLyiZyXJcU1RiFKbmo0Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kz1UhjyVVCQbJOxQsiMYvgNHKTfNonmjPYzHlgamdSw=;
 b=p0uyQvyFdH7qcMu1cOausQxp+rxYsQW+ZWNQHnzjqxehP+7Hf8IjIvC0hlj+GYP2nv9ohQHCodHrBHK1YBVEICyXWXEiA69WTovtutemtSA0cQs4jOZyq3ZreqCWVO/baFl+5n+y3taySZhzq/BpL9aRy2Vt6QQ+VFXC9pdei3s=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR10MB1708.namprd10.prod.outlook.com
 (2603:10b6:4:e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Thu, 11 Aug
 2022 11:01:42 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5504.024; Thu, 11 Aug 2022
 11:01:41 +0000
Date: Thu, 11 Aug 2022 14:01:26 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Argus Lin <argus.lin@mediatek.com>
Subject: [PATCH] ASoC: mt6359: fix tests for platform_get_irq() failure
Message-ID: <YvThhr86N3qQM2EO@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: LO2P265CA0269.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::17) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 257f8e01-3799-4d88-789f-08da7b88df37
X-MS-TrafficTypeDiagnostic: DM5PR10MB1708:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DsKXtKW/241AjPypFJFYZuCI7TpY7MxRqDzTyin0IiRZJs8+pDQtN6UliOCysopUBl0VZDvWOID4XAPnm6qQcIi/8uM0JuOEQSW5U0SI4AxKjml+Zj3/MjzplcqfnQ6TQMNmWurgSsIqP/gm9alxAZvHypLMNvaZoB0WOoMSkywPaVA+z2pCMiwCmCO5RosQ4myUchPf4Vk5SOaA1I/Yb2+DhcaAlWXwYGUQKSsBxKFO3kByQxvKVGye28nXuZzI0irkR4oX1D79xXTnYLsT+yTUpP37gN86oNDSrIi0a27/h4pf+vMEj43Y3QBo283VQo8lCgg+wsuIgGEuRdjlTZ0beFBAhWWY2w48miNm1XgVAMa20zRe1KoZw23v4CjDs+kFgR8qQS8fPqNti7JJY8srJZyJWDJffNEf1OrpT5wWyOs/mMOVR3p54WNvRCqmoIYNRCFRoGGvvTxqTjBcCXFSpUkZludFIcTI5oAqfZfWA+VpOCdg83NECn4UtnZUFH9fFVrnG11Tuf1Yf+paKTRyKkgYJGRFGGyxD8g1tVEMGxqRtLNQh27y6lzRDSiWUwcelnx81c0IJOCzQg76jL7taHFNxXT6Nl37SSg8+Anh82KmprBHZrn8iINC2JZGDoRpMCQxs8O0JhQw1WOdqdzxM7ayGxnWxPO1Lzh29G1pLoTWHqtrIHNQfvVToRUf217QPv0t8zdnaTj/Ntezm9+IZfYCi9iAX/hhEI8tM8Fzoh9BtWzudJSK4kEu03VzhzdBqp8COG5BiMhT1LiGQG+UszkXMOGNe+4vtqulumk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(396003)(346002)(366004)(376002)(39860400002)(136003)(44832011)(8936002)(9686003)(52116002)(5660300002)(7416002)(186003)(38350700002)(33716001)(38100700002)(2906002)(6666004)(6506007)(6512007)(26005)(86362001)(110136005)(6486002)(4326008)(54906003)(316002)(83380400001)(66556008)(66946007)(66476007)(478600001)(8676002)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qh8Zcynev07TXc785o4/hMl0wo72TY9KMvM0libEtTcSNIYc+7ZJ+FDHupBJ?=
 =?us-ascii?Q?Ow7JslUqaeC87/YFH9yJvtGxOCojGQ94HyPvOnqNguYykmsgVBvJXtN0arXd?=
 =?us-ascii?Q?cKFPoosSw8gjmhDu2xCfo0MEfcGLxk4lm4+AzL/KurOmLqq6GmG+GV9LwQE0?=
 =?us-ascii?Q?8Q7o8/9q7jnRXEGyW+7erd0EgfOBeOm/EJZ/SW3GKydxucV/zSqbl3HaD0bq?=
 =?us-ascii?Q?J9s1IzToNlzJHjEp8oXy8VU4l/bW/Y52LdluRl3hUeItwT5GwIdNuWjUvudL?=
 =?us-ascii?Q?J6PPzn5xCEwjyUxxTtdvYWdGdTfUpe5fRuYlbpdH1dz0wyU6dMOoxg8sRS9r?=
 =?us-ascii?Q?7TgSyqThexL2ceDK5tvWl/uEwQ/tW+Jlyieuuf7XZltOb9NsQqO4OYoM1LIj?=
 =?us-ascii?Q?k6gLStKT4M22r904cCgN5jKNSV7OJK1bp/E8P7azjb5k+O6MnBH1Z9hCPsru?=
 =?us-ascii?Q?Zw/4H4Dy8Iy7wcI0mxHUvXsgZeA4eKwB1prkEw6VcXh4IJgX9O5KrutqNzr8?=
 =?us-ascii?Q?7+VMw6zpF+Hg49ktIjsd1myp+J0z4e+afAMnKv8oSMyowBXc884L0dSjGHa4?=
 =?us-ascii?Q?YqJ/MAVqp91CgPg+MwvxQN5Vh5f9eVEitPZs4mFPwBDF27GlPewBgTt5i0ac?=
 =?us-ascii?Q?gYtAeGzS80xRLjlsetn/0TE68MA2NMsGXHsOuSdvfhBERnApsSMjTVlnJoOt?=
 =?us-ascii?Q?h8S/c4dAxnZ4ko16qIhUU7pFzHrKfhMDWsZ1E5bhHSi2ML46C55xb8sICk0s?=
 =?us-ascii?Q?VNQxQwmCwzFlN3IupJpNpLvE1XwJcMF5ewg2HYHqgBN5I+tBe4Mh/OLy+J7P?=
 =?us-ascii?Q?EUw/w62OSVYz+BEfwqgBuZFwdg/UBiYeK6yywbbtAfbxb/3pQK7U/XoZ91Ba?=
 =?us-ascii?Q?h0Vfu37WtvuQweb4sTOkOFLQkDQZAQPMEQPt9MUONOh9Ze4YiJpzDAOsw3o+?=
 =?us-ascii?Q?s5k/VQ6Br4jS9ih5EuRqoSBkvLh7HT2oce1YVJ5hZUnm2O45S2vm3G3IXYG3?=
 =?us-ascii?Q?9NIT8eG7q5AWxaRGmHvioVi67f0fMtLHYrlX5Wq50DX1F644iUe69QCkwfsG?=
 =?us-ascii?Q?iFUNuGBBSOZMt3GCI4Jo+16vPD946GhVNQpvKsG3t5CXWQckt/tI7qztt3N6?=
 =?us-ascii?Q?nExxspvPAGSVmGjB0rIqLk5LJCda9jili/kaHwwGfa/duiaTKUC16p4bP3V4?=
 =?us-ascii?Q?+/2NDtFkZ1Vu/E43Xq138W5XdSCgHlqtR1Jz29ZQQo6YGS1GGmP3ZDavhcUb?=
 =?us-ascii?Q?YOgpj8kH7HlDRUD/9ASdOqThK6yoTT1zWV0VNB/WifxFXw7y8Ip3DxRgPJSC?=
 =?us-ascii?Q?ilZFqc4yhXGZMYGX+7S3pMRUFDS2Gqv+LbNmHMdJhhqPI3cs9MVBhqy/TqUf?=
 =?us-ascii?Q?rKMnsggUyxYlGqrBA9+R5sTfiuKpGwKGrduhIK5sl8txllq0gQNkzRcTpWd+?=
 =?us-ascii?Q?Etvba5as1PO50ZvX7SrGlcMnIY8FKJUppYH+qj06C1DPkc/6dF1mDitpiAbS?=
 =?us-ascii?Q?6mDpPv/fzLwGGy7bxQEhCLzWdyGunZstWAts4F8O2M5JwQYGXmbLFrAhNWEC?=
 =?us-ascii?Q?YxIdd0E5QiRoZ0VYqyNNuEVntgbMXSfTM8FWT5vHOBdxDg+0+m30DE08fngI?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?VXWfJ7OU9cV+Z4o92yW2YEF3prvfrRxVNIscOYWgHTzxngQrxVdG1JZf4GGE?=
 =?us-ascii?Q?X54PXE725k7Y4xPv6odP4Wx443RAcPjKC/JBx46PfUeoYFZdIjO3fwGr2hrE?=
 =?us-ascii?Q?jkHtk4tsKApQrCoV9rpp/PBt83R4wA/oSxMUUIztRXqyRwNFciCByPq5YCHm?=
 =?us-ascii?Q?1pn5OucQDbz+8QFJ9noSbGQ8i1wsyTgJB8kkYQELT9sghOYuoENitna1g74h?=
 =?us-ascii?Q?4WSJ22d2SE+ObmfROM2vBcbCU+3qgVmsuIa5jiCNSDbtp3qAhnOfLo/odHkF?=
 =?us-ascii?Q?pvjy85U2zp2VS1fdNjVH+QDXsEajjDq55XIM0Hz352q00/RMDE6LQTx/9zkS?=
 =?us-ascii?Q?CZRywYYFO3R1Jx6a0VjQK9X/NFjnWCKTDy+avUeoXWi6+edBPCsRp0HuUlkg?=
 =?us-ascii?Q?dywo8GYOkpRIW1Ktn6y5HV+tOQX712UmT3JfDZM/XVmD817Rlpp/N7BwmYew?=
 =?us-ascii?Q?omLMAeXXDburx5+FeoV+tFHvvWbcWaNRDfuTtjaPPw3JhQRoWuT2uRaw29KF?=
 =?us-ascii?Q?zB9Za+Kr8wM5t7+NTHUeUrW1qdjvzZ7yulsa2tZ++LHzdfj/r7JUpteRC5kF?=
 =?us-ascii?Q?Z8IREZ6EG//oS1WWAPDXbjITf4v1UT2vh0Z2DJZ5iY8fP2W79BUrp9p3Ui+E?=
 =?us-ascii?Q?fv/onvtPQqF6T93jqScMIqL3ZWOKhefAuHWwNcWdTpBU8/tVzHHRCWrO/FDs?=
 =?us-ascii?Q?qBUuPcI/LVDrQcFYptJt2vLeH1DElZ6qQ9Z5BAsxOT0ziUvW5eHlD7+ceD/N?=
 =?us-ascii?Q?Py1uhytEkw64mJQd/OZvxgn4cj52IhrxBnT4iMeKoLQbDavPAksqViJoRK9H?=
 =?us-ascii?Q?l+BqvEQUe6E3kkpsFEx6My/4drY98psARe7pIWDCB7lCmAJUzRulNNeTkUml?=
 =?us-ascii?Q?zZ3YEVtCVgB+WT9SXfqUrNaniG2/MT1l7YbSWHkE3H7jP19unn8wDUY01922?=
 =?us-ascii?Q?/G45HNorZ01b33EfgrgRCmDqW90sEd0rGB8LyFIVIom2qaJBf1JgqQ7KvrGG?=
 =?us-ascii?Q?q4AfmSf0KPXrwh987LVTUyTZRDocD5ZVAPYq+WxuehPYQ9hzprm1gEl67Nrl?=
 =?us-ascii?Q?S+KEjIJ3JNH6b12ejM1IoX8RLXbQWezKU85nhLwrYya6Lmt0UA11qjq6/FzM?=
 =?us-ascii?Q?77s4cbaDeoyksirbNGBE6IbJIlgoOZsME1HvrsVOQMx1/+yl2JmSIdMC/2o4?=
 =?us-ascii?Q?oDRkBeSHTwdqZDjp6oSAtaUAei8Fhe7BRHlheZntiwN/pQloLxCcanPbFf0C?=
 =?us-ascii?Q?yYJyRyaSLeAXRNP3cSql?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 257f8e01-3799-4d88-789f-08da7b88df37
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 11:01:41.8007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MaBZ3fUf17xRWy4SnFDiCKmob92dqhmRIJ/LAx905dk2kscjHKdmAx+yUHAFIkkC9LC1HnVXgb8P41ER53Y86tiAZaZ2MHiujBsc1iE5wPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1708
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110032
X-Proofpoint-ORIG-GUID: aJms0YnZ7zxmMKvizS-9Y-ZcYLCrlkm0
X-Proofpoint-GUID: aJms0YnZ7zxmMKvizS-9Y-ZcYLCrlkm0
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Liang He <windhl@126.com>
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

The platform_get_irq() returns negative error codes.  It can't actually
return zero, but if it did that should be treated as success.

Fixes: eef07b9e0925 ("ASoC: mediatek: mt6359: add MT6359 accdet jack driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/codecs/mt6359-accdet.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index c190628e2905..7f624854948c 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -965,7 +965,7 @@ static int mt6359_accdet_probe(struct platform_device *pdev)
 	mutex_init(&priv->res_lock);
 
 	priv->accdet_irq = platform_get_irq(pdev, 0);
-	if (priv->accdet_irq) {
+	if (priv->accdet_irq >= 0) {
 		ret = devm_request_threaded_irq(&pdev->dev, priv->accdet_irq,
 						NULL, mt6359_accdet_irq,
 						IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
@@ -979,7 +979,7 @@ static int mt6359_accdet_probe(struct platform_device *pdev)
 
 	if (priv->caps & ACCDET_PMIC_EINT0) {
 		priv->accdet_eint0 = platform_get_irq(pdev, 1);
-		if (priv->accdet_eint0) {
+		if (priv->accdet_eint0 >= 0) {
 			ret = devm_request_threaded_irq(&pdev->dev,
 							priv->accdet_eint0,
 							NULL, mt6359_accdet_irq,
@@ -994,7 +994,7 @@ static int mt6359_accdet_probe(struct platform_device *pdev)
 		}
 	} else if (priv->caps & ACCDET_PMIC_EINT1) {
 		priv->accdet_eint1 = platform_get_irq(pdev, 2);
-		if (priv->accdet_eint1) {
+		if (priv->accdet_eint1 >= 0) {
 			ret = devm_request_threaded_irq(&pdev->dev,
 							priv->accdet_eint1,
 							NULL, mt6359_accdet_irq,
-- 
2.35.1

