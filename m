Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B2856856A
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 12:23:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7E011640;
	Wed,  6 Jul 2022 12:22:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7E011640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657103014;
	bh=QBlHkGdyOxjpr8wNS/FhAGa21PE8n+L3wWjFRJbXoqY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gHPsKFGgCJkEmxxYVGko9x6N5JE+g/M8WicuQytqAjLG7Ph8Y4rUsZkOE8gPR4WEC
	 bkFvQZ4MsXz8W7d+kD4t8B2XE9DaSLqnBj8gQxgBpHlct48FBOQeQGBd/Pz6XSSf/r
	 N55WdHS9NKEYdqYtftnpqmygdPyPCh1iSA1T1iJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47698F8032B;
	Wed,  6 Jul 2022 12:22:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9ADF0F8023A; Wed,  6 Jul 2022 12:22:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4501F800C5;
 Wed,  6 Jul 2022 12:22:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4501F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="rwf5Vn+9"; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.b="IKejkSYr"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2668RKPW017507;
 Wed, 6 Jul 2022 10:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2021-07-09;
 bh=DidSY/S/or2qb3ZmbiirJzK4dzYHZQ3+u9gfShcXQac=;
 b=rwf5Vn+9vsXL6NXrPN7GJ2c/0xP11aQQHGetR1K/VOGJNh2FMdmGcu1fI4WQz9BfwBSW
 +QSAuE+i0sb9ymgFN77vnSMY4Dx4UA9VJiFwOFcvTsTjxqyBaA0giVLiN2SVlhgo7dnS
 sI19mt15BtNmaAS4OVm4nlW0A/XYMMTAO2SbPbRcFIBFf4avZMEDy9sLwfyfHjH76MyD
 NJQvzRolpRW7Q4n4d1jROCObMnxkZcLmYneB4borwfy+if9jSQtzKb+v73APcu8P8y+P
 eK62SALz7vBBlMkYTrVexHR0SIbbYSLFrPdXN5YSrMO7XQRwhFDeUFeNeADan5gq7VF1 CQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4uby9gj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jul 2022 10:22:26 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 266ABKDM018685; Wed, 6 Jul 2022 10:22:25 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h4ud0psxu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jul 2022 10:22:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLAzUiK8e6VCyIPWfd5swYr3mVgL0hbn+SkxDhwwEkXlHi8SJ9J36mit/gHAKzksZDVKfuyxvZYVyTa6eOgy9m5KCYq2hC0s9AZllpzYuMCwByoYFQ1JX84/LgFOYD6ZVjonHM1PcIjM99lorgDN2Lu4/sniwC/NAIdzLhuudMWyxGZ7VoXSuOIddsjoC3RvOE40xwGPVY3zq4eec/WtlP7bG9z553yZd1L2dYVEu4VU9FeYwqgTCwNiUIPqnG4DZKArnGRWNfGLOR2R8RPltFOCQMBtBzAxoz0z49fW4MaAdLLMoTkmcdwzSkKmPV+M2rqdafl0QkgG+COg4mjyoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qreq50o6bCjxhsjsMSyDarIS7ojzuuGVyhw6uzr+o0=;
 b=DX5vgxT/H2HjaBEyZzeRNszxjrBqYohbltfgrp/Gmx/9v0iMBC6ts1Z4EpknvCXkCqRZGpNeoNSlY4glpKQ3G/xuacJy6mU8RVxxsmFmnGznnfMFSlKrPsgwbpGHhjP5szDq+kw5mO76UckH9H1Z3o7hM11IqXMCC/JvxoH4LcmA3AoyMSjIhszaCL3QquOHXOLMKOP8JUoStR9+dcXgIEbI3hOF2ZgVUGWjwAergFD1Ee/nAnFNEaxKoxw5gUnjE4ggojoMz38Rcw3sV7PfMEXjbV56711lcLc30Wagcpf2c+T/yt/Bahnc/dp0zBf6pBaoP4qL9YC7AHDLfJJ4mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qreq50o6bCjxhsjsMSyDarIS7ojzuuGVyhw6uzr+o0=;
 b=IKejkSYrVUliYs47uZ+IAFeoBTBvnyN+RMA/786mTqgUKHYfSdaHA9RrX3lyftNE06dmclsMenbZIVAhQDzZy0gzz4h+ljTqooq9kO8MS3JJLLsl2xvHs3VL+yajgtU1aswad14dyI9xSypwnMZK7AZAbfo3QQaAGijwQ5sGLvQ=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BYAPR10MB3143.namprd10.prod.outlook.com
 (2603:10b6:a03:158::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.19; Wed, 6 Jul
 2022 10:22:23 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 10:22:23 +0000
Date: Wed, 6 Jul 2022 13:21:59 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: sof-client-probes: fix error codes in
 sof_probes_compr_copy()
Message-ID: <20220706102159.GC2338@kadam>
References: <YsU4dYXYYVsfs92J@kili>
 <26db7e60-51d1-444a-7620-8225239ad7bf@linux.intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26db7e60-51d1-444a-7620-8225239ad7bf@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0056.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::8)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bdc7be7-ddff-42e0-7b4c-08da5f396a5b
X-MS-TrafficTypeDiagnostic: BYAPR10MB3143:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DLaFIuUvW98AWVMJ4ZCGcH7v8QQWj5Hbap4miGVwOJfTm3hee04GrmfQvv+25xAsfVrN++va3JayI/9f3uXS3HgLoXLAnfUAfgnwnMSVSJVb3XMC3QZBVMf6Vv6nIvX2qDJiOR1ANiRJV19uaS75EUjB8GK4/MnQzohi72zxcUlR4+qbRJsJCnTbT52AV8Y5f3rEAhU6nzLJPHH+Jwfnt8R6yzn25uSdELoVOoTtsERyebu8a5mRGklnmxWG5sNvGmS6xrxdskcqaxmztwgYZptdamKKRRfRJLeXwkPjpZ1taagFsDdq7n4C1VpumqKoTHcB3rZvHeDnOUYrCaGTICExt0KSJ9hmOU8ArmoCAHFEzhTCqzsGazGW5h99MQpctRlZqFqytH0+nxn+gt1HxSZwRJAz9X/5wKH41bro05LRVa94UUnIT1Z1+titEf41PhPEKFlfKVP5VQ2GQXRE+ab24VWZLOAA9i+IkeHEt91FKVkXthj/QzOYZdyp3WGji0A9jcjN8/IL1RVCfvxCUFwdTWVoISp79CYEkoSG3d0JzJnDEiF2bxKpQW4R80cLhPwJXHUhlumR9C2muqcyQjx/1lJpk5zShb8+NHmk3RnNE6+zrdZ+fzgDE1hPrc5qt6ZMD0k1cHOnXiYYsBiTJhKArjybq4J2v05zU8L+Y5UV4farV0WfPpSIn3zUIVyMpRtGfaphmHi07MpMtWRklpSaVyPOIG1aRENSdjBZgR8Ky2M3u0pxQz6o/k3tiYMqi0FN7YFiS9UspXzsrKobuqGey8jT0I/QrFwnSBJN8CCnXjgedDj11Jsn72VnGgz1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(39860400002)(376002)(136003)(346002)(366004)(396003)(186003)(1076003)(66574015)(4744005)(2906002)(44832011)(8936002)(5660300002)(33716001)(7416002)(33656002)(316002)(66946007)(66556008)(66476007)(54906003)(6916009)(8676002)(478600001)(6486002)(4326008)(52116002)(6506007)(53546011)(9686003)(6512007)(41300700001)(26005)(6666004)(38100700002)(38350700002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1OVcCp9HELWAjpexTV4M4x04hAzv8zGJzexlwMnlhCuczC8TLdolk3GnXG?=
 =?iso-8859-1?Q?LtPVRGyrGo4ahYzcokP6iBH1GOAUZJMqMjAPPOXHRvPOFe00m3XkPqIpAR?=
 =?iso-8859-1?Q?HMQ+joA2mZs/KUuEyeFQe5XYyMgdu4smPYbMaNBBCkGpIwVNlmJV/UBocg?=
 =?iso-8859-1?Q?ijxJ9nTEtlXdvcWs1e/wxvjZlM33ExLDRt3xRhkSEBwHikuCiAdPRnmS5M?=
 =?iso-8859-1?Q?wewM3CQxeNNS+8bGVegolmmhfqbWzZrjjXoGC6IPMvfQtiazk4/6GhN8wW?=
 =?iso-8859-1?Q?+59wVD7WdM/FBVB3OBGVqSiabCgN4ytmtZehY/OE38i/nPc6SFkZLhvBmg?=
 =?iso-8859-1?Q?E45d+V3Iu+/tPVCpfO80fA37k8fIMiI/OrLE1guIiGOT1yDd9AvrExXg21?=
 =?iso-8859-1?Q?KwIBhyln/BA5PxKtCgzobNSZ6KxAqQDTXrAJ4xBlyibMIgH8zt6+fuSmFA?=
 =?iso-8859-1?Q?sV7oRgBvv9PM7DRGjD5w1ThinjQN/RANEK9ypgeL/UZxPQ620AgP2Fpzg5?=
 =?iso-8859-1?Q?kf5dHazGKgBCHyaF9la/tCtla2YzXDiFhM0VE+u0ovi1og5TET6ZGKw9U2?=
 =?iso-8859-1?Q?6in3I/IvwuN63qwmiFSh9tvokDUfE0rQQus+UvSNt9jd60gLK9kmazz3kw?=
 =?iso-8859-1?Q?M+Ks5ou9m7DxwAfgNIOpI422L/1gvUX5IUzPG/81Wd3kPKmHzWI37yUfmh?=
 =?iso-8859-1?Q?duuu08yZg6jeV3GHBJJrjZfuTub2lLSCvr6ZSPYrGxxB4rm6urE0w1t7r6?=
 =?iso-8859-1?Q?ME23jrunnv1NiE7WutRoo1IpbVCJoatbA8j29bh7vVe4plT9rkKQ5Jimsk?=
 =?iso-8859-1?Q?kJzzd1pk5ODQ/RYLlP9WvkPD9TmZeBboWBV4dPJfxGCT8IGYspmxYOZGos?=
 =?iso-8859-1?Q?cH6pSOn/8+ElTqF7ieWsgP3bp7DjE7ZvYKSdZHT21CkV/je33HJn8Opmu0?=
 =?iso-8859-1?Q?m0BfTcBdY7YEX4QkjJZtKbtS2lJD3MLzx1IYTREvtlvEOYTTUGx1V8mJDl?=
 =?iso-8859-1?Q?Qe8ozUEBZGzzPHRvy40sJLTCWf9AIhFct/jj///SryM0kH2wDSbYub/TXk?=
 =?iso-8859-1?Q?VQmpwMLL74OOgXpnGm3DuvqbHcqJfepbpZ0laCC61Cvh3lr8Euc5Z/GN4v?=
 =?iso-8859-1?Q?botr0fCFv5QJSoiIEvi6rO5/bl4BulBPnqvFOH/gFVyl6nYgTPw6Yx4CEI?=
 =?iso-8859-1?Q?SHjK1xSW+0+/LxujsQ+WY3hmFD72JiTYvoZsB3w23LYFuHY695wsaKuNoV?=
 =?iso-8859-1?Q?/PZlVW+dsij6srBc1bqFUVPx2I3CqUyvNkMT5h8JGOTo/1q/TnTA5Yse4j?=
 =?iso-8859-1?Q?JIQwaVWav7R7ewmMV9UxBu1jM+Yh0LoqxpDS3CobtJxjatHXwMl2Rv7l1U?=
 =?iso-8859-1?Q?xe/McplhOfMrUcKbNyid+jC+7GiYzrLYQdrWB2wJ7dJlDvkP4ognI8L2Kh?=
 =?iso-8859-1?Q?ur3/Akg4yH1F+QVQTtHhZGwfkRaVmdoOFvMK5RUNQUfhGgaEl+wObKDwV6?=
 =?iso-8859-1?Q?NMAWzCZAm41kMUFmvf57G27/slfJ7HmLMXOO+UtNuTG/LFgtMy+fIMdokV?=
 =?iso-8859-1?Q?bmHRa2ccWqsnXXQF/5/gOlAt9/E9xj7Y3hqqv/E7301ilh4FSjVeomPHU8?=
 =?iso-8859-1?Q?kxxsRFdnYhdDxbdIZM9gp0G4OEQRekv7eeHlRfNeC6z6K3qTpA99ZIrA?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bdc7be7-ddff-42e0-7b4c-08da5f396a5b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 10:22:22.9907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hxm70s0vuvurE7Z6XsWjLEulYWolrInWSyu6N0YD3iFJUIiJasR8ktaNFQmGxvqyCC/3gkyBNRVvUkpQubfD7L38+pX3BW9ZeCnEkBYw2ow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3143
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-06_06:2022-06-28,
 2022-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 spamscore=0
 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207060039
X-Proofpoint-GUID: iICY0TanUt3yScU4U9qbWGAkVuyyFzgb
X-Proofpoint-ORIG-GUID: iICY0TanUt3yScU4U9qbWGAkVuyyFzgb
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

On Wed, Jul 06, 2022 at 12:05:37PM +0300, Péter Ujfalusi wrote:
> 
> 
> On 06/07/2022 10:23, Dan Carpenter wrote:
> > This function tries to return the number of bytes that it was able to
> > copy to the user.  However, because there are multiple calls to
> > copy_to_user() in a row that means the bytes are not necessarily
> > consecutive so it's not useful.  Just return -EFAULT instead.
> 
> The function is copying data from a circular buffer to a use buffer.
> The single copy_to_user() is used when we don't have wrapping, the
> 'double' copy_to_user() is when we wrap, so first copy is from the end
> of the buffer then we copy the data from the start of the buffer to get
> all data.

Ok.  But the bugs in the original code are real.  I will resend.

regards,
dan carpenter

