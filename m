Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 754C9599466
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 07:24:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6647C1632;
	Fri, 19 Aug 2022 07:23:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6647C1632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660886673;
	bh=e3wKxoVy4HjXrbjqO/2OvmAfxb+QR8ab9moOC4Zw14k=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Am4JxGa3BveI1b6WrrBYVpGTua0/W9v3SEA0oIHWBIV0/K27HPj3rqsfVRI+06JVI
	 nG5ah9ain0nMxM1KLsPMiBfGUY05TlTecphuFtUUVXyRy86A2hcCB0I5KQGQVPoxVa
	 2nm+M4sPdix8IdznuW9hIZcKd40j7vp4xxvGc9Bw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E154F80128;
	Fri, 19 Aug 2022 07:23:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58884F801F7; Fri, 19 Aug 2022 07:23:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B5EBF800B5
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 07:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B5EBF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="sDvaTg/m"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="kKzGL/se"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27J3vwFl006027;
 Fri, 19 Aug 2022 05:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=NW49NS+3I3Hc72FLTG3+D/8X+0ERjcC9QqmkWH+iHEc=;
 b=sDvaTg/mx6vucv9yNXDBDQy4PexjYPVQl8UcFq2DeVkdjCa2nmUyry3b4XoBNuMUcHYF
 B+semUVznAalQcLsHTXKMwlFhp3++SCM0mVIn9iGE8Vmu5iarRdDjIMS1vH0LHjiDj6R
 Sa6SU9Tn7aLIIs6wOhD0zi/fJnLchSUxcwoftmz34HVHEemYpBL33+4WByl6UTb6qXM9
 e+DvyNrrrW6BlD+Ai1Q/pJG417Yopre3m3Exfz7qJQL24PD26Ur3B79fCdFvgssC+1Yl
 pux/ArBSKWwmGJBZNfDlE6dqvxNufYq9dZqL+Jisfvib4XrquyYUwB/w7/c/9kBTfgwe ow== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j232rr365-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Aug 2022 05:23:24 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27J25Y5R009913; Fri, 19 Aug 2022 05:23:23 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3j0c2cq2w1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Aug 2022 05:23:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9ekQJeL1r5uKnnWP34sV6AjkG/mjr5j703ahMQSWgmBMVAjv1/+wvq2a4Mf7VBL2BhwsNgREWb6C00/IIjfdD+L7yFXCIR+FWO9S4nG4ICH6fCf3rndFG+Bmr4Ap9OCQ0aRo+kUk76G0ogef7sWY6KQc4sZkULyHCFrdXoDj2KfKP2wWVBoONB9fMwTjKwysRhgMBxBMatmPtt/0TpWQvSA8mVVCGump1JJLkvVbeHgLsbG+0JADrAKlHOmqeLNq9knEuwpzQB3ZqiThfYAK/FND69KKYO5Em5Az9JwyM5lIRiITl4pmcwxKyjA8Xd/elxEVbSPqoSl1CphqJz/yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NW49NS+3I3Hc72FLTG3+D/8X+0ERjcC9QqmkWH+iHEc=;
 b=ULuvD0w6kUZhGjzfgeg70W1wF7cGIYaKRTGjMiGy9OJPPfxpuRZpRnVvO7v15U5ItySJrS2DOsuA8EAnqxO+8gvtZFREuA7kA9/zrEtio9XAlzh+cP5sRVAMB+yxgYxLEM9dt6eU7Hbh2z5PX1VjOuy/j3a/CozUmzzl6bsRCtE/kRm2agaYzK+UGwsuZryjVnt6QtdAMgmoq1dOAiXOsITuF018jZhVLTRA9S8riu/bxxrhli7MZDPzcObylTSDU9fvO/Hkvz9wbNlSpXVVUMZb+SlvRU5bDVeTgZ/ZnlBbBdbcNXEmfhNfci/KQ2HVpmgDZoDE77m6MCooLUyqEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NW49NS+3I3Hc72FLTG3+D/8X+0ERjcC9QqmkWH+iHEc=;
 b=kKzGL/sex4hS1qBdw7QeI7GQ02qIqYUJ3HS4GOGrn3VkU96M8Unbq/PAU9zlnBAtxSeQ6k+dBXa1WZjEJQW4V9rbXEnMhvGQl0k21I7tAUP4Jaww//XyyyxqO4yZGA4nI6tlclciggL+GKyrfRpCXcRgMdASC2modr5yurezCrw=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB4124.namprd10.prod.outlook.com
 (2603:10b6:5:218::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Fri, 19 Aug
 2022 05:23:21 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5504.028; Fri, 19 Aug 2022
 05:23:21 +0000
Date: Fri, 19 Aug 2022 08:23:09 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Subject: [PATCH] ASoC: amd: acp: remove unnecessary NULL checks
Message-ID: <Yv8ePUuBfzaRu6xV@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0179.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::19) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00d065c2-f8e1-4465-d5dd-08da81a2ee3c
X-MS-TrafficTypeDiagnostic: DM6PR10MB4124:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MlfJRsNK9SjMmodCwNhso6JycTJhnTX1QsY1rHNCeE6d5OdTwjN/WIOEa9xoO15I9pFcuRPk1aVk88y/tU3DhxMj4HbAP9pEiW75svUU8U0cfiw/rvYOLpU7lZihqfxY0LAt5/QnZzoeKj7dAqD//es+avceRuNvS00Ax6lBNuvm6HxLfCMIRju/e2Wx2hfB/xA+qWDAfk4INoV2iJugkhYn/dFfTx8l4eGCI5I6DgCE33BqpsaX60HLKmE7GTEatvnO/NEGTnrX27xDo12Fhtxf64XcT+wLItrkDjB6huaHUr1KEuxRbUDqBcC919MrqZmxERaHrflNcUrcsGvxmC3fkTDDNbJJvfynr5oqUWTjBf7JQsABYALyQya1ZBQYT9SeVtWnO8R7w6T+d2crMrqZmmESndLDGm6aSQ9dcueLvDNMvYX5APzi3/LodTeU+APU19F1MDT3SxWNCkEJkYayokrIxc53FcDAFgoC1+zlvUszCpmn8ckUgBpFSF4lIzxRI0mWCvUs6SU1HtX15z1Oyg1IsXd755JrlWI8nC7bOymoaNDg9fX++E3ntzjBBe6coHkbhpz6La4Wt4ZOkNtvf8bqqFBRTsHAUSl2lOthjSmmAWj8hXy0TqlgjqNoFOi5VPC/lIOADSmdpDKJ7Aat2D3LKsk2Y3ARPl3UTKmZ7t+QdH6oS2JcE4OxXJzEOTpBvDoQzJJZNpbRd3sivb04Zv8UhYu30JWpTB/idQq74kXGy5DhM44lqB8pBysUdZAb0QSanF1dLnG1aV+NrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(366004)(346002)(136003)(376002)(39860400002)(396003)(41300700001)(52116002)(186003)(478600001)(6512007)(26005)(9686003)(33716001)(83380400001)(44832011)(316002)(6666004)(6506007)(2906002)(54906003)(8936002)(6486002)(5660300002)(8676002)(66556008)(4326008)(66476007)(66946007)(38350700002)(7416002)(110136005)(86362001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zd0BYxys2aQHPhnyLPbyusLkqWhxFQqloNTI29sigHrSvvB13GHRV5SVfHSA?=
 =?us-ascii?Q?nVhMvIBvho+qNeqvKoj0UDUc/C7iidyDl3/G59OpndJl9Hy2acAyj431HxxJ?=
 =?us-ascii?Q?A5DPzR6JD212OdRlY+iFq3uaUN01aEV/ILAcYywx1gac6uamKvZoaUSgtHkN?=
 =?us-ascii?Q?ck2i9VpEI/tyA6GbCUdVDCFAWkJ7vgTDpTsHfKp/WfZZmGcZbwRfERANfFip?=
 =?us-ascii?Q?6V8HO3lA5y+VNWVUeVQPAeLeKDPu/seOMpbyp5GlmFBdBbLTlTXm+c/Wgmar?=
 =?us-ascii?Q?/dZPHT/ryXTZ2la5BX4v8HUDvRuNlwKudlSdg92LpD4s0uWmYemzPU8kEmw9?=
 =?us-ascii?Q?qHCWl5aJwGGrXUVqxeBCfp4kxhFVRiAYyuZiw5qFkGSSdXec7+C6x7G78T+l?=
 =?us-ascii?Q?SqkjbjdwfgdIh1KlQCY2xsbBbw5lgw3VcoHk/mYiCdL+N8pqFIe0kTyLks6v?=
 =?us-ascii?Q?8wq+8eV9/Xk/oeE+Np+0T+crn1rKPp+Zs7wxUJTkiB49KBCIUFo02BQpEkIp?=
 =?us-ascii?Q?waDWGToaNG/cMcT+kTsWBS7sgVDxAY+XKhYHOg+hCiBZ7cbqNdQ7LpmoWXJW?=
 =?us-ascii?Q?psk2WiSYqcwC1BWrweQhxq640+iPtkKHqR56ROl6HPHRufKNlhqhBr4ks4d4?=
 =?us-ascii?Q?fwW2F2mhm5k1PX5rs2AdRohIL+EWM2pQCX/upGnz+yzrARbYYQMGTm79xJau?=
 =?us-ascii?Q?P3vjhTxq554Le5J/vyAa8dtXElzAQU6v5oaRqOQ+ofQTmrB5uXJHDMlVRt10?=
 =?us-ascii?Q?oddza71h7FXF1T9z1y9wZoqoVCWrtQLRFtZQMupGB/zyH20Sp4LDLStjiQXz?=
 =?us-ascii?Q?qp8aRecSWSRY/S7le0pWju84vG1oXGP7mhXvKtZS9phE1DG0lSaS41FK6H4K?=
 =?us-ascii?Q?snA8hOPiA5VgYsYrEL0rsyVBxu58HXFm0Tv1eTcu5GtTl6On1IbdMGEkpu54?=
 =?us-ascii?Q?CTmEOmorcekWOZwMNys1VpvIO5kQGa+UDzB+zaZFN6Q1lfBmrjNa0SKbMMZC?=
 =?us-ascii?Q?JV0yqX/+Q9NCwsfB7erZJyixy7nrTO0us5aBINTU/tY+NMKGb91mwqDj7aPq?=
 =?us-ascii?Q?10xYw3cpmLE0qoBYlXMpMr8HP5PkTHsk678eU+upF1rtmplMqJuRFSr/HcHq?=
 =?us-ascii?Q?0IwFB5pyMeNpqUEKCL+aCKd7M47UVN2la94rTgAu16ZoeWVy9sFRoU6PHaQ/?=
 =?us-ascii?Q?wr/ASVWsSxWC32OYnADIP5PmTV5X5q+OI+XFr9Ur4W8LAo1R8SVywJhDq3kW?=
 =?us-ascii?Q?pEF2XlvtTFy+10wrQK7jA2DUhM/vYUrOmgadlspJynD9Ikq9i+3aJdWeW+yC?=
 =?us-ascii?Q?TzAup7d7uOJnihJVVG0hmlKwSeg7hZO+yTy11T8fYG+4fJ9KsWul0NTmtt6x?=
 =?us-ascii?Q?PcxjBDg9+6aWUDxl7SoabKh/xj5Ojzq6lrRhoY3D9bAe+om1lE/JepsHpv+m?=
 =?us-ascii?Q?7jHGGcKN8WKrOcoIZz6WOCHJx9OQ1Vc4jN1ArB08kTh3OusC2YGPiOy+y0tz?=
 =?us-ascii?Q?7VcR99b7DlZSy1Ww0RB8Y0PNfjKXmWENmlk+gKeHGg7hLUMa9u51cUy5vp5v?=
 =?us-ascii?Q?SSgr24b5qUg+x1UbODRrukxy5hJuVuT5+8CHGcbbpHpolnyIjc03mmjAmoQ+?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?sZkfuixYCkoHLVHo1qiJU8ia6VyHThq6BeblsZZQzliVtDyeg7oXBrCf6Jb5?=
 =?us-ascii?Q?azd8ok3QrDCYL05vNhfhZ+h/yfMBFP9eaLDTG3tKW4EQtnmP8B7/Jbu+RMYr?=
 =?us-ascii?Q?LeedHviixSHt1qy4WY8xT4derxqaLLRo2VhRLDr90WHBtOboVN29Cg8/Zq7p?=
 =?us-ascii?Q?CndQUXuHngDAzw7r78naV9vVrrKgwwsfbcm21Y3N1CVVOZgb3HHIhdf+ABCR?=
 =?us-ascii?Q?DIt20n00g1nt2Ga5MDmGpHrGS5MM+wRDWcrNcr8GezYIrVaCgfDNkm7roUsh?=
 =?us-ascii?Q?jPdIEmss0l16VQsxKuGOmKRjvRcY0UDG1JbOO+ub8xBKb9dHFUzNkZoQSAvG?=
 =?us-ascii?Q?elO0/xXGcpzMfESPoFBT4a131ZSqrjQn/x8abdtogR67cn+jJZUPukyylN97?=
 =?us-ascii?Q?sP2rRC0KvNc/rljBmp7RgaBEpylMpo1rWcT0/9koQLXAia27EvMG1OuSMXo5?=
 =?us-ascii?Q?B7+2RHqtVNeWpr0k7KGUH0qV4aKEq8c4vL6+c1C1CcPZqFCLdTpknIvCQRIB?=
 =?us-ascii?Q?ORdrnFOQCWDOXqFlLIaB3rb+Z5QS1Vq8fjodVCDEWgEeRkgFLmKYy8goTZ3G?=
 =?us-ascii?Q?fRr2jnrT/XbHNkDbqdWjZWN1ovaxAVuLp9Akf2d654rZIY58dXpvs1XajuQe?=
 =?us-ascii?Q?xA0a0ly4Rd09hQqRebRPX38pEQshZ0Nw3bjjmTtpfZ5MstLB6zEkxKutS2BZ?=
 =?us-ascii?Q?KhJSDlZm/2SPclp91NBSVi12ktmUuxA5L9hAe4motBHUb57p1CpbNNW3q+kb?=
 =?us-ascii?Q?pslcSNr7OcYwn3f9I1wCti4YoEnZ/tKDgBE4Tly15T+BNBTM5jIOZvJy+Inv?=
 =?us-ascii?Q?AFbMqOTWXz4jtZipUG97GAGa563AepAo+Ku1B9983AE8Z+DLt+DpiONrr8/l?=
 =?us-ascii?Q?/F0u1kT2msPkCjyvbD0Jrpn+C0f/QCtRuvRloTgew+p0JFllE7U17Bs/PXLV?=
 =?us-ascii?Q?hgn6e96N9CF4/p5W0s620vjZJVRhrqwpZkOaubrFguZQ0g2EEatQ9TMC1Qom?=
 =?us-ascii?Q?JhHVB4pxxndEBxYJ5iUdqHdayL6zhQpDX9WNpWHn3JvGMhc7G8DPddLCGsgh?=
 =?us-ascii?Q?ILmpxZm8pebeBVbkom/o/RHrGkJMxL58/8zl9SEUcUCajeyIztumJmUsWsnc?=
 =?us-ascii?Q?XqNR2a8xKd/ALYT+2Yh9Y5fP1z/i0JkHbT51A8+mOsvpR52NfOurHERV/7yE?=
 =?us-ascii?Q?q1x7yd2k28TyL/v/Yc5OUVfGOD8+PUkZThC463GQduNM2swbW76fV8kW7F4C?=
 =?us-ascii?Q?raQBNZNC8E/Mp1W+9VT7f8lTNNXRrtT0iig/wQCLpvNQv0Ox7WUzSxXfxQt7?=
 =?us-ascii?Q?Foh8KOc6nUJv0MbZrM+On6ySv/ox8gMn65sTRimJDEMbXdR6VQ/+OMhYnuKh?=
 =?us-ascii?Q?kqrwUMPrWXLk7y9bIEinpkOzzqqHtvB5HaFKrdptofirT9Neyw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d065c2-f8e1-4465-d5dd-08da81a2ee3c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 05:23:21.4714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4CZz8uN3ql+3Aa5yiuqWt9hDx49DYoUAWqjd3MxkgSSlLnVim8tgsLG493WFUpawbhKYumAi+Rryycz5bLgw4DGrH+hP28h0K/s1l1e66U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4124
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_02,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 mlxscore=0
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208190022
X-Proofpoint-ORIG-GUID: jCWG4VCcMuQAObT5MmK9lu17OmmzgKYQ
X-Proofpoint-GUID: jCWG4VCcMuQAObT5MmK9lu17OmmzgKYQ
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Nathan Chancellor <nathan@kernel.org>, Mark Brown <broonie@kernel.org>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
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

The list iterator can never be NULL.  Delete the bogus NULL checks.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/amd/acp/acp-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index beee53aedeaf..85a81add4ef9 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -106,14 +106,14 @@ static irqreturn_t i2s_irq_handler(int irq, void *data)
 
 	spin_lock(&adata->acp_lock);
 	list_for_each_entry(stream, &adata->stream_list, list) {
-		if (stream && (ext_intr_stat & stream->irq_bit)) {
+		if (ext_intr_stat & stream->irq_bit) {
 			writel(stream->irq_bit,
 			       ACP_EXTERNAL_INTR_STAT(adata, rsrc->irqp_used));
 			snd_pcm_period_elapsed(stream->substream);
 			i2s_flag = 1;
 		}
 		if (adata->rsrc->no_of_ctrls == 2) {
-			if (stream && (ext_intr_stat1 & stream->irq_bit)) {
+			if (ext_intr_stat1 & stream->irq_bit) {
 				writel(stream->irq_bit, ACP_EXTERNAL_INTR_STAT(adata,
 				       (rsrc->irqp_used - 1)));
 				snd_pcm_period_elapsed(stream->substream);
-- 
2.35.1

