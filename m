Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF255113D3
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 10:51:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C35A316DB;
	Wed, 27 Apr 2022 10:50:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C35A316DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651049495;
	bh=DBfsYovc46CcC5KqNORknn5ZWBBJUqXkRe69KVT2Ils=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZDOIWNA5zZjg/zErttZSSCDSMLyWfMMrP6tmBgc+YqD5DU4sIs/cFVPqvCeM5nNkS
	 CQ54DgGtj13TgB6YPaw4vPx5NnHpjEoiZogzBwAGf5Is7crek5octvL4m95ZghmzKo
	 NQmg7a3gXhEGkws3Fz1QA38nPXQaqjSfaHS6XK2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19CCCF8016E;
	Wed, 27 Apr 2022 10:50:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39CF9F80256; Wed, 27 Apr 2022 10:50:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92803F800AE;
 Wed, 27 Apr 2022 10:50:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92803F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="Exetpy6S"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="qu+LBdvx"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23R6Wr4L003733;
 Wed, 27 Apr 2022 08:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=3FCi/JQBz+JvLXoii7/W4AfOqpaqrYpyUbeqgPR2xCc=;
 b=Exetpy6SG7SgTJhWf1x7UfpXYsbmKQL5MDn14HHdhlz3bk4ZyEa570oHuctHnxZHRQgB
 aTULqO+LF/m/wVddFZTG6S68Q66GevmyaN5F1jD0O+xbu5KGc6tKrPk1ngTBvKkNvZUD
 L7UBDlSldow/s0FtP3uyVxadUz61GfCokIKfZMk1uBQYGWPI9Y31H4mkh+Oktr7bWreQ
 aGm2v0kIGmOpO8W8XL+dDEoScEUwf9hn+uq2/bhU9g35/tokG2eOIq4E89t+P41aEC3U
 9QjjuJZgYV0EN2K6exkcwQjhk4kzuC+lyr6fpiou8sWR6L0XO8bsD+CMaF/QgO8xdteG Ew== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmbb4r3td-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Apr 2022 08:50:12 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23R8k8I4032431; Wed, 27 Apr 2022 08:50:12 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2047.outbound.protection.outlook.com [104.47.56.47])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fm7w4c4eb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Apr 2022 08:50:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H2ZcqrokiQNXpubzJnoEBUsOB0LaOVx6yXsU7Hp45kTwbSrlgPl6OVpXlQuSjSwAfLIuV+J5niP1u7EAcVwMM5SNOcn9bqCksiJRFxrAzPhja78ygjcL4u8LLx7nGBs5IBlW3rDNRC0K7c1juNIs1UwJdO92O4svpZEh2VwzsAQRP1JFud0RsPxhNnA2eZyXOKH7pKREVGDLPqHk0x3U9Kka9eazcqG7MRwc+0X1cetdz2iPvlPnFRERme2ZEPtd/cETIE3Uulb5jnAJUHG1fQQPILtur4j3Poq29Q8MbT7yJgPxx5s592xYcXcyl3vJ4/X5Ze7xu/V6yuvfU8zg/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FCi/JQBz+JvLXoii7/W4AfOqpaqrYpyUbeqgPR2xCc=;
 b=hJ30oOiyukh0O24x8BSjCJ/S/ETzCFbz9q7qaBEgrZdloZnJyA7lZZWXPol7Y42k6TZnPmRrbkT6wYKYHiLZG2Q8YO+RpmiDMRFwhLw9wtftCnCLsdyLk44GL6UMZdswBnebpdgDrKTH2G0BqziFk7ElhCbqXO6QyCf9LsRzVEwt7a4YuDzw5Ae088EBqm7BeWu+XVw6l8cpEIiEyX9mPYcO+8el5pYTb7nI1TNUQhzmMEi1nqQmQtUx2Fzv4vZ/46oAijXRjn9nHfW8J+k2iuKop3bEE3heuoQ4R/XeyuCxwrAzpWy+pu2iURHkpqKbBUnlayLOAp9q4OmUNGHYPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FCi/JQBz+JvLXoii7/W4AfOqpaqrYpyUbeqgPR2xCc=;
 b=qu+LBdvxUzl6Ia6De0eUriw3XyoAnPlHFBl0hLFZxKBv7WshjYWiizGTi3IisK25AOYf6cXSmreRqjizud2ej7mHM5Sf7rUvlCB60WRtuEzoL0AbxUX3t+rVbQxJDtx7zzvt9rrIyWxZ4KwFOQSDrGAB0W/HBNjcJdHEEsOxXUk=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4770.namprd10.prod.outlook.com
 (2603:10b6:303:96::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Wed, 27 Apr
 2022 08:50:10 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5164.025; Wed, 27 Apr 2022
 08:50:10 +0000
Date: Wed, 27 Apr 2022 11:49:54 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: peter.ujfalusi@linux.intel.com
Subject: [bug report] ASoC: SOF: Intel: hda: Revisit IMR boot sequence
Message-ID: <YmkDss9WDmk3zjyl@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0099.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::14) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 758f457c-0ded-4130-1a9b-08da282aef97
X-MS-TrafficTypeDiagnostic: CO1PR10MB4770:EE_
X-Microsoft-Antispam-PRVS: <CO1PR10MB4770FA9504A20C6EBA1BC0378EFA9@CO1PR10MB4770.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NCu2Nejku6E5Z5MKK6ZRLgbGVspqmRNot46pFeagf1jt2F/sheX68YmEdGHfPnGmWEMP12vJCasV21TC9ch8P4Mdmvw2Ymit2uYNkjPZWWIVaheDAuG1S2TJRxlQUWnYLsl6AMEYPNY+IZuNVtpov2iNkF9lQfHeyMbUk0p6qT0iBpHnl9UtP9EWpkHMu0RhJ8heBTtVUZ8FlypAt3uhLEWgX+4MlJhZEOYp3V7bULtyaSADVAQTipfojlgwOrZ3ENWNZaUB6TUctqAocSfSl7AMUtkI5iLxSM69vALpbgHCt40gGQ2Q2A3anZM5Zf19BItTtgr5CIH38KkL4IsL8QFA18qpedb1hz7j2udQ++PXeIXMnB/2pz5ZTBFqdUj+DITGl4Zp7X0ngI8aCZ4B1JZu3M5jjQ2m8d7M8PjI86L1tDkd5lytWgf01DTGMDOXRtcKYkZShFKeC8jcF4yH3qMbS8zEp/jc8a92E4WXDGyOhN5MgipRd2BHv/42+f41DcAv9VRykWBxzcXMmyCHhC2l8C7bjQdgs4DUM24Yry5/NyJAPL5avSFN6IMtu1MB8GH2EBZk5CYajW9cQQmUZD1GUGc0o4ebGWgXoIbVm2T+zanQ57swDtSfyXfF0dmKLpNF8T5bv/5cyhMpmJ0MFM8lLIwIjO4MUzjGax2ru6Toh7cROrgddvwy9p7gb2O9FtIjyIAyMPU6w1vBWBWB1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(6512007)(9686003)(83380400001)(186003)(52116002)(26005)(6506007)(38100700002)(38350700002)(66476007)(6916009)(316002)(44832011)(2906002)(8676002)(4326008)(33716001)(5660300002)(66556008)(8936002)(66946007)(508600001)(6666004)(6486002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dqElcVsUhlf94vuArST69D8NHc7G6wb4xXU8iQx8j8SwKAF6B01lPjqo7Avz?=
 =?us-ascii?Q?nXO6lYiOf2R80ZEXvUzbR6SEdEyalVr2bg90cSreW4R7ubzCRDYP9oWm56q2?=
 =?us-ascii?Q?VgaGHe9hmPKyF5bEjfrfT65X8SpNwSyKZFpIxw2FVXW984no67M3BASBRXcs?=
 =?us-ascii?Q?7LUNilUMMJzl2K9jDjXTSQLqohY6v2BnSnOEqClOJpDrNgxYfOAX7kyANeZt?=
 =?us-ascii?Q?kJlpDk5Evm1OoBm5ZJ7spdh15+lQsPla/JW4IxjvrKS8RqvqFfQ4B20ii7u5?=
 =?us-ascii?Q?coAhFrc8etMkH/CXsm63t73Hal07i2/Z53UNvvSWN8RhJGNE3drUtQOi7Cmw?=
 =?us-ascii?Q?4bFwuiy8cKFrNI0Hbu+LcZeifQoIGgeEL93N3LMQzQFUjJKP6jWsrN51anWm?=
 =?us-ascii?Q?7jlafdLspWAkldnysni/5HAbhHL8U1gXlW232g05jWi0SkCzlYTfjIWC3/qo?=
 =?us-ascii?Q?Uum1rURjrbr9rI2UoTyJfpC14laQ7UOmSPQBV9qVtTAdPP84XZHoTpM2NCqJ?=
 =?us-ascii?Q?vuBiJYPc2eF53A0fwM36AKuAAwMm3sJC8hlEZTXiTpW6cIKcaCC57pFsrbBg?=
 =?us-ascii?Q?+ZCYnrDE1haKfu50/xKqpx+/0IpFhh5GvBGuF5D5CFUlbZERvleS8W0AU3PM?=
 =?us-ascii?Q?3LHO9hbxbEhXYx5WmCWi2wCwAB0RPHTFgfXLwYfWyGgs9AFrvDhKhNZGP8VJ?=
 =?us-ascii?Q?HC4p3ThU9ViLh96wjHxskNqxYQT2lrLQuAbO91oq3Fv9eYLAcQDjEqVwwDLZ?=
 =?us-ascii?Q?t/2qimS7sXFhTsbVSNT7wk/GF+/cVJ282HdL3qql01HUWliQnumc06w1Zu8A?=
 =?us-ascii?Q?G8fB/febjDycWj+MXGUGTD5CeftrC61g1gRiuqSoYb5huG1ERbThhemV47zM?=
 =?us-ascii?Q?TZCelKEuzBiuHYT6WPzbxcfS3kaLlDtRwMftYeo+rQojmmgkllfXwhZfvQdr?=
 =?us-ascii?Q?WJtlO3tFvIYC0R2bjYUSuOjMujF9ce7E1m9yD8tDHVf/fSYqvWH6198v6IuK?=
 =?us-ascii?Q?tdJTvtQkYKVDTV381YQqTm6T2X6yoa0vJrpL66QMfOjtACktfNRagBaBU6sm?=
 =?us-ascii?Q?IvpV/VP/pqyuTE1tkyBvtsIKKVvooyw5CRqsnbOHD8kRNsdXAy/294WnPVht?=
 =?us-ascii?Q?JwER75qkGyVZI2pX2xsQosYWunijewvKxhBE5TO44zUGJggICu9N1EqWeIOI?=
 =?us-ascii?Q?tWFrMrVn3xVsyqS6XXzi82gN+OnPLrKdGxeD6lBnODctYe75z3AyuhhndOvC?=
 =?us-ascii?Q?roPnBdMcfpMdl3+uoAia9DFrZt5SGT6aSfJ2Zu0LI28Cco0b+e6GZiAJfF1M?=
 =?us-ascii?Q?1PA3QM5zXVgw93MBPe/cBwLxV2XPtvzzqlvFOwuOyvHTXVLSXbPtGkqKV1tC?=
 =?us-ascii?Q?kfg3l8lyZ+UDWo6Aq0CC4GJADaz7nNxH5MpL269FSFEyBrqRf68QIJNuCnJe?=
 =?us-ascii?Q?EIiznyNq8nyGNpwTqTIKWHblLgkq8YAUTeMCF+0V0cs6FJeKGdW0cHHAwhRx?=
 =?us-ascii?Q?G0oIADUa1H41QO5U1SELeedi3234eBZ7y8a62lvvPPGWVLEb1XTL3vG/MIxF?=
 =?us-ascii?Q?42zbAsqn6EBRIvLULCsngWxDFQedqN3izft/SGgw6gLfF0kazQVScWyk5k41?=
 =?us-ascii?Q?iJyBdFz5dVFWMk6rSih2Tum1ZWQp0xzffAzBdcLAaWTDrKVY1tr+wXcmlMa7?=
 =?us-ascii?Q?CMaURQK9tpma+/XDRJfXIQ1uNC3JGMPSDl/664J9UtHibX4tmyg+WG0tpCtx?=
 =?us-ascii?Q?/1EV4kKu/HCipcLdDu6hb0toxDWYHI8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 758f457c-0ded-4130-1a9b-08da282aef97
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 08:50:10.0835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aRM2gvhvEbT3yJWSUlL28BZ2H9lWMVxdowkP/NkxWS7Q+8F3t8EtTB7VmAHt2Q8zxZReDSYCbG3yaFxY7StiYjM8xJe2HZVCyF8DXBdhtjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4770
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-27_03:2022-04-26,
 2022-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=993
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204270058
X-Proofpoint-ORIG-GUID: E6B1ZX-1LKUPfPv_o1QS0lD3Bb8TDsqe
X-Proofpoint-GUID: E6B1ZX-1LKUPfPv_o1QS0lD3Bb8TDsqe
Cc: alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org
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

Hello Peter Ujfalusi,

The patch 2a68ff846164: "ASoC: SOF: Intel: hda: Revisit IMR boot
sequence" from Apr 21, 2022, leads to the following Smatch static
checker warning:

	sound/soc/sof/intel/hda-loader.c:397 hda_dsp_cl_boot_firmware()
	info: return a literal instead of 'ret'

sound/soc/sof/intel/hda-loader.c
    381 int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
    382 {
    383         struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
    384         struct snd_sof_pdata *plat_data = sdev->pdata;
    385         const struct sof_dev_desc *desc = plat_data->desc;
    386         const struct sof_intel_dsp_desc *chip_info;
    387         struct hdac_ext_stream *hext_stream;
    388         struct firmware stripped_firmware;
    389         struct snd_dma_buffer dmab;
    390         int ret, ret1, i;
    391 
    392         if (hda->imrboot_supported && !sdev->first_boot) {
    393                 dev_dbg(sdev->dev, "IMR restore supported, booting from IMR directly\n");
    394                 hda->boot_iteration = 0;
    395                 ret = hda_dsp_boot_imr(sdev);
    396                 if (ret >= 0)
--> 397                         return ret;

The hda_dsp_boot_imr() has some similar stuff where it checks for
positive returns.  As far as I can see, this code never returns positive
values.  Normally kernel code returns zero on success and negative
error codes on failure.  When code returns non-standard things then it
really should be documented what the positive returns mean.  Nothing
complicated, just add a comment at the start of the function.

The TLDR back story of this Smatch check is that it's not published but
it regularly finds bugs.  The issue is that it's more readable, plus it
looks more deliberate and intentional to write:

	if (!ret)
		return 0;

instead of:

	if (!ret)
		return ret;

With the latter format, the bug is that people intended to write:

	if (ret)
		return ret;

Obviously this kind of bug would get caught in testing, but testing is
often impossible in the kernel because it depends on hardware
availability.

    398 
    399                 dev_warn(sdev->dev, "IMR restore failed, trying to cold boot\n");
    400         }
    401 
    402         chip_info = desc->chip_info;
    403 

regards,
dan carpenter
