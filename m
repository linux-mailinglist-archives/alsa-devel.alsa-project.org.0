Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAC5568604
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 12:46:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC6FA167D;
	Wed,  6 Jul 2022 12:45:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC6FA167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657104375;
	bh=HsFTPN2qZK3EOIyCjpCgq5oDvHKV5VV5QZ8vRpOQ0cI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bTgM+QraWJ+CoelATyBN8KRx9/iTFpFEy0H0TTRWFgm4ONo/Oquv8HSVbQGFs+yKM
	 Q70CWNlXSj4ocZJnV6AfJtPwMgMSLlTEjRgr4ZCwmGDD5yNQTd1JdFfk8kmB5kLv0E
	 jK71CSsj8Fx0g3O/dYcu7xYgupaZpOKp2FiWzbHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46D23F8016B;
	Wed,  6 Jul 2022 12:45:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58C34F8023A; Wed,  6 Jul 2022 12:45:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80E1BF80104;
 Wed,  6 Jul 2022 12:45:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80E1BF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="0b1W3RKT"; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.b="qStlwhUr"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2668R59i019036;
 Wed, 6 Jul 2022 10:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2021-07-09;
 bh=VwGb9/rmkSyPdqJjyXxdlQtvfPAaNtfAWIFYw0B+7YQ=;
 b=0b1W3RKTjOWj0AJ7RutJix63DeQibxOmX1VShQyC5ZJBRPXFt2O4uVWoQX776hdPyqr/
 cjOlSMPbKlKmB4Z625S4MLtqUJks2loN7GxlzhfmZn1GE8r7tZez21877xdDdYlESZe/
 LPYKsv69/i/IccsMWlQUlvuFtWhB2+2fTn3TGNLM3cmzqB8wdUe8F9vkmrRwjrxah/zM
 5yCF6xGlrl2GlcNF9F4UocLl40zGdeiKp0E73B1n4NFvcGN3lq9mQnw6+k2tfT2M4NYq
 x5Kb9SKXVQ08WyOB+cEa3HpuixCP8m8e29BNuiDW2sGGtDM+6UL9f+sFDUNSeNS9NzDy Iw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4uby1kq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jul 2022 10:45:08 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 266AiwWr018056; Wed, 6 Jul 2022 10:45:08 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2045.outbound.protection.outlook.com [104.47.51.45])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h4ud0q90g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jul 2022 10:45:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGn8KCBcodqk53IV1AaKAtn1g2Fy9Ilc2Tgwv1VAZgV8qkwvl+knanhT81awuIrJck8kfDzJ5InH80l+PFVkoOMnw+qRkAE6PfJfMYH6yDcmaERqs/Mz4mlsZyKFTAVspeTRCSshEZBA1T3qp21gC3yC+SgprjpeHFbo7l9axsFHHOQql5vbzbZPPYFtW2oertddaP8HRpQGS03SWGN0jOyiTsP/GaqyvTw568UktqRXPsoImTKQ2UZ5Af46ZHcMI/duqEOdaKly8sqDGMvH3H1KLESqjS+msVW054xYp1grr4Ne6DKpcVNbLKFxBf0WKSe3jlBjxEDpDfEGRFU0zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpDsSFm7vTRW6/kTBII5WgoDbmsxJ6aIKkDfrlR+FTs=;
 b=nJhfBAIyLvPxtQqaZOQfr0HcK2em4C6/nYIxy7rqWsSR37eTb+8uDpjDWwYlLScYQJLUBOEtMfUgVBba4ILhA8tpvmXU8md7hrIF1vAupk5noatcq/aLdF9N9BUxQnkN1lyYBrMr0fBXqQlF0TdMxzvo/oyPDOxn3eGPCsprq9ACfqUD8xAmIXQLgcwS/JlaWlPC47eH5aTTstSBL5XRcjQfMTiatHLx6ngnUV0imXeGU/drNXaciKQf7n6jWZrjml7khXMDCfISjzDZGl5cI7Olts8DTJuWLpGUH6LbjRvESyPDeag+EvYOGG0eBR9wX01ystM2UWXc4cgsZ/T1Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpDsSFm7vTRW6/kTBII5WgoDbmsxJ6aIKkDfrlR+FTs=;
 b=qStlwhUr8H0ddWaCx87i2ukxvIvX5pQqK/B0WH+/iwTvr/54TPrL9Ojrm5cMt5+k8S0C2Q8Prb0w6DRwtz8gktZYLRZQM8ejwjros955fuZKkOvMEzAqkAEtU7UxdrUK0YHi2t3g+qw2ZlhRJhIs8EnzoyDL0WJkDhLaOfvW15A=
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32) by SJ0PR10MB5568.namprd10.prod.outlook.com
 (2603:10b6:a03:3d3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 10:45:05 +0000
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::e038:d513:8896:32f4]) by CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::e038:d513:8896:32f4%6]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 10:45:05 +0000
Date: Wed, 6 Jul 2022 13:44:43 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 2/2] ASoC: SOF: sof-client-probes: cleanup tokenize_input()
Message-ID: <20220706104443.GE2338@kadam>
References: <YsU4zCpaV7GBpHci@kili>
 <2d7bb9f7-a316-16d8-b290-e0cae9b28127@linux.intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d7bb9f7-a316-16d8-b290-e0cae9b28127@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0004.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::16)
 To CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e75bf2a-de42-4244-70ce-08da5f3c9681
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5568:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9ogSo1EfJ4M21VOh1+/Cjn7n9mRWzgLCiCTZlRQWCX57XY8L1BhMqFvzMbDHJ2rwJniEJF2KN93b96gtDGXRY1v92NYEcQlJjw7irTd47jhPXjAYKQFYXUq2mx7mOOO8701tzgyKU68R+yEcnTVWdHfmzKFo0r5TOGqwxjz0ZN1B3O3iBFFLqyh/qb0aJPtunKbczqHLphXjstqhgBNkgKUrnO8NidaKJNNsMcyZmfzqhSW+ksebJu1sAEXAe32ZN8lKHRtWQVqdc3t7q3Mfsw7mb/bDAjE/KXc/rkh+oPcJ1Ewm/LXR9GI9pPChv0PJGvUtX2BtoX9f0B7m/Y5qFxo4mWznAJHy3FGIIdaEph/kAb3DfMn3XmRw/P/ugpTMPt27ytjxA+wPZLRwViMrZOiC4tmL3Qr/T7AGy2fdopQVha4fw+DdJ2+4BZNdWgiRf5SxtvYD9cnwJirfHM6s/pxp5vkd65FQtbVkazykRrzhq55Yt7l1QfSYjtmtOOaS8kq3sm0NNH+MT65ttVstjWGCwTpo2MSIZ/hGrWpZaVsU8ziRoqgomFOJLWD8MTJz+LJNKTCPEh3Z9iN+pya5Yj3mf7sKHgQ92xwY6I/+F/EkDt5wOMvb4rPWdWbCf5xJ9SpWmSDMTdJ/MjnyznZccpm4CXhdh8GeRFJ7hx3CqsVLGgdKL5gf50qKDnC3/bkGwiwarl9dsn4Lzw3oTxarV9XXPIqWwWu1P8VN2c+rRIWildc3j0LhxioKhioS1bGZfXIRKC3ekm6MnV8e7NT8qikTX5I2BLZmLiqZorjWyV6VqQKiFSrmg94nU0PBjA9Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1001MB2358.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(39860400002)(366004)(136003)(396003)(376002)(346002)(54906003)(6916009)(6506007)(38100700002)(38350700002)(316002)(66946007)(2906002)(8936002)(5660300002)(4326008)(8676002)(44832011)(66556008)(7416002)(9686003)(6512007)(26005)(52116002)(66476007)(53546011)(186003)(6486002)(478600001)(33656002)(86362001)(41300700001)(6666004)(33716001)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ebxikS41219GLxHzEbiUu2l3khHL5ZJf+26KWFORokAo9gCin3YNM2OKF7?=
 =?iso-8859-1?Q?aXGq5HkbbP6lIzmioo/gPvRSAed305FbgX16j57CGkCgE7jriYPHLzEF1/?=
 =?iso-8859-1?Q?kV7aLzjO491BA0akPGE70m/6GuPwGbZSyj2Qe5alETmQpWavWfCWJBWfhH?=
 =?iso-8859-1?Q?tlozfbNKPC3jBSs6nWAu3lhbB4GsrRCJAZ76TD1AB6xvxFYZdT56/ux4XV?=
 =?iso-8859-1?Q?7lsAJJfMG8C7T0cpm0zZY5qwnqNd1xNt3D5B8fCbLft5MJqWtXLcJhhCwF?=
 =?iso-8859-1?Q?KaUZmTFCFMy+T3OAe5mgWImq8GJspOUv96lPKow60oLX6CXgEsDHO/loRM?=
 =?iso-8859-1?Q?ZU6u2eoct1efmDa7XUQ//w0nNeYCY43MtaZML0g+IX3giuL5XonqREYnHv?=
 =?iso-8859-1?Q?K7mRN2zmEnwlEm371wlSiKfmKEQgKnU70xgfn3N3qrIYWsGbsT2jsqgH4I?=
 =?iso-8859-1?Q?dRaQRzNuhcvwDTuK0yIeSaLGGRFtr6rlDI/FKWCn2ykQflf8LK1xXzeMX0?=
 =?iso-8859-1?Q?236gBqalMxveTdLrIaXIymcbztJW/cdPKsVYoD4zPiF2ClMhCl7La9Zwhl?=
 =?iso-8859-1?Q?L7sQqXgcRt0Ufkvs8VHDTP4rASGn764FQUoLlvySAQkJKPkR/myiBxT/aZ?=
 =?iso-8859-1?Q?bQ4gzlTru8VsAX224O4gWPPtplGWKh6mAusrPSt1CUF6+Oy8e9WxzL8Gh/?=
 =?iso-8859-1?Q?IdYi5tZqSI20CtGDp0S88BdVpB35muatvEYDaGt4UNPiEl1s0UUQrGvSmT?=
 =?iso-8859-1?Q?G1mkzaQy8tU6LiLzxwTP52Uc9VpqnwqeMQX0se2zvMDExYNZiCof6mq+Hu?=
 =?iso-8859-1?Q?Af3IlcQZu+ttwlGL6wS8X0FKlj430pz71wew8EKMf2UhO/2FANkDuFOOHX?=
 =?iso-8859-1?Q?pF6QV13ZxVR6vAB21sKCpbDL3iyBGX7XwuwBsaXjUcQBP0Ov+3izvb13HV?=
 =?iso-8859-1?Q?qUCXVqqI6gzt85nhAX2uXbUxcLjUTZ3ajrTWfFl8zip8jVOmQyu2oS0+sa?=
 =?iso-8859-1?Q?mzTseCaS+MYmGWQFmd+Dug+p+HyqXCzybY7FeipeyejtCcXyqGI3dRYCtX?=
 =?iso-8859-1?Q?CBDlpjC5X4Be7Sn2r7q4OKoksK3tXK3tkgTqxK4e8Ja1cGf2Dh7PxFMPmF?=
 =?iso-8859-1?Q?5E/PpBL9TKfBkb4xdK+qyViEsEq04/S2xOtBypmYBnTKiMaVWoHeNnx+3X?=
 =?iso-8859-1?Q?5itA//z8EseoCZ1ACdqQYy4eCyN/t5bRtHqLe6qp7vp0AE5XbgPbORbAZ/?=
 =?iso-8859-1?Q?mfh7T9Dc+i4lX57hiLZ94JBGcRgWlcLGsRhN2bL56PQs3Jxlb8bGm0K12v?=
 =?iso-8859-1?Q?JFz3huMAxQqv2Go58aASGq2IyyYQvx/rMf6P5oLCSjfvfFqz9Df/yb/e4d?=
 =?iso-8859-1?Q?P6oXaUX+P2yCOUIYKg14TGmq5tSSe/Xv2hYNcJDjAlldzD9RvbBNGFziey?=
 =?iso-8859-1?Q?gj/DE6EA3IT7CEw1gez0EpU50Dc2IDnsa97LqwmfT/WDRWUXjaFUqFXyLU?=
 =?iso-8859-1?Q?EC5FM9QnwbFvQh5ggDRqSZy937NWG1hFBQ2fkSxo/rLFwWlTUQe/2vE0Uf?=
 =?iso-8859-1?Q?PF8kVJbBOGMIKDnvRJh/YzouMQXXy+ZeHjeiPfRALxB6y26+xJsSEpNTGz?=
 =?iso-8859-1?Q?7fKCLg4afD9xdhNTla0JrE7dmnha/NwZpVq5tDehM8Dp5QdvfbhGFKUg?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e75bf2a-de42-4244-70ce-08da5f3c9681
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2358.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 10:45:05.6275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XGCgYDBa081XIpXVrP65cKsW5PfmC/MjntwymKjDj75WBhDdjYhkwpQne2akI/D4rBu2oy56qtJjdQxr9SRTnuJNtUFjsww9dH/oA2PxnEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5568
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-06_06:2022-06-28,
 2022-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 spamscore=0
 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207060041
X-Proofpoint-ORIG-GUID: quM7oSQKYKOEF6jvpIDv92_CCkCsoyhT
X-Proofpoint-GUID: quM7oSQKYKOEF6jvpIDv92_CCkCsoyhT
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 sound-open-firmware@alsa-project.org
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

On Wed, Jul 06, 2022 at 12:27:49PM +0300, Péter Ujfalusi wrote:
> 
> 
> On 06/07/2022 10:25, Dan Carpenter wrote:
> > The tokenize_input() function is cleaner if it uses strndup_user()
> > instead of simple_write_to_buffer().  The way it's written now, if
> > *ppos is non-zero then it returns -EIO but normally we would return
> > 0 in that case.  It's easier to handle that in the callers.
> 
> This patch breaks the probe point settings:
> 
> # echo 52,1,0 > /sys/kernel/debug/sof/probe_points
> -bash: echo: write error: Invalid argument
> 
> I did not looked for the exact reason, but something is not correct.
> 

Crud...

Thanks for testing.

I used strndup_user() in a couple other patches today and I didn't
realize how strict it was.  I've NAKed my patches which used
strndup_user().  One of the patches was an infoleak patch so I'm going
to resend that using memdup_user() instead but let's just drop this one.

I guess another safer option would be to just always zero the buffers
going into simple_write_to_buffer()...

regards,
dan carpenter

