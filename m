Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1EF54D965
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 06:33:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69F6B1949;
	Thu, 16 Jun 2022 06:32:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69F6B1949
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655353981;
	bh=kH3ljTtep9tgcj6h1QBNKvDQIPI25RWCRM/uksOLwlw=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UQZpqyM3slQD7pHOGHeHe7DaCuYzuoeYlJnmfJpQ6X+ztVcJFVX3S1rt3c8Wqlf8y
	 vFkqEEkLTfjD78XKYsIBSOwq6zJgpLWlD2v0MrPwcn63ZkA1mhTiOLYoBD+QH/zMh9
	 5fX/9GLYEEgMLiPz4RMjA9nqAPhyQS8U1E8eyZv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D590CF800F0;
	Thu, 16 Jun 2022 06:32:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA7C2F800B9; Thu, 16 Jun 2022 06:32:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12710F800B9;
 Thu, 16 Jun 2022 06:31:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12710F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="S7jLI8UP"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="yDuMbwQU"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FLpTAu029747;
 Thu, 16 Jun 2022 04:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=w3ydvZ45xF+8nf0SOD41UXbRU7P3coriCv0+n7qeDgI=;
 b=S7jLI8UP3pU2dNTvnwrZDRZ93W++NBrHNskfkqbHKvg//k3Pvf+Nb7nuPfgkhELuJ+qw
 ZE+8lrKHnzP1ITIArfFC9Pc1MM+SJ4JJObDblpn3GfUaJdUX/tA0q+sntmFWlfXemIXu
 UTyqKDxX8VIM1BzfwnQTLdb0ecCuut618URjvJHHDsCeMPm95zD6Z8B5MT+CbPsSmcCZ
 kEqaK48Fe30HA3iN40l3Yh2ik5RmQhJLfLZ42DLbGf9wE85V5RbaTCIwxO2mVmtj7IF3
 laztlDMo4wPZt0yOJ6XbjuQXBnOtE4YCEJlY+rWgEXlr6asAdDybBul1BuuZ1GrBhwVC SA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmjx9hxg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jun 2022 04:31:48 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25G4CDCT022335; Thu, 16 Jun 2022 04:31:46 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpqq1yvqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jun 2022 04:31:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2E2qLgTRId6WzqNwjFyVXzF8YjUkbmui5ziItdg9EeHSLzkLGCXulPj/ONInvFEW5j2H6JVIw9GWfm5i7KopqGYCa+lFlKK9qckaTCZtlnIsaGL6Pn5FLcVTb9e6hb+fs+jzZfdKM8Y4Jlx2GFg21gNE+ldLZqn9gygrO7zbZKx3/gu1fcu9hWvnPmCFmNJHbb8SStqKQtHKZJ9eajZbVwiv6RlSmT06wYyiopjgJkN9rusvr0NaEXHq3T4DqlIpeDG4SDTF5jela1n3enyK7dr2RmDvWwdmAXm66NQEVpTIuIgj6Tr3aQfVoUsdx6FfZezmylcOIwSRa9hwPQqjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3ydvZ45xF+8nf0SOD41UXbRU7P3coriCv0+n7qeDgI=;
 b=PbCKPA7O48OEsUQF4Z1CYl1JX85qjtT2roTMLSCIR24wXCpkC7dEOgnlvqyCzfvMr5q/Y9Gfo8gkPcIqxvYLXof6McrmRDY5M+I5buK/J8IUvdLzMLGlTy3voza1Hz7TgK9Meqd47qw6C8Ufg3I5e6JFaG44PCXm3XzdMIqMapJpTW2y9IW3DHTTI4BunBth4QupCxtDbbDaHk0w3Qg/JVZAjz2G9LwYH/tBjqp/Zv2TxZ2CCGOIQUtlChpa3LwM05S8tmuHoqBkxrv2gNQM5tGsnKu8VZAQcz416tvNc7xZHVESm7KuIrQG6IVts2Mdi5aBli8sUnttIbW5u/6oaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3ydvZ45xF+8nf0SOD41UXbRU7P3coriCv0+n7qeDgI=;
 b=yDuMbwQUO8crrvCXixIZjSbevVYop8hTjP8gZr67SFvXeXjwD2QExS6ZvdbMMC4RUROLRwjFd1XMq0NxElU8UOf2NtuV3GXEODSyqtcq/nfSto5ScdV6m1MbouYs3O8mBBBhFPdMJSL6iuiafF5NFqSqWYqNVAEV3HxepAb/T4U=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CY4PR10MB1864.namprd10.prod.outlook.com
 (2603:10b6:903:11d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Thu, 16 Jun
 2022 04:31:45 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5332.020; Thu, 16 Jun 2022
 04:31:45 +0000
Date: Thu, 16 Jun 2022 07:31:09 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH] ASoC: SOF: ipc4-topology: Fix error code in
 sof_ipc4_volume_put()
Message-ID: <YqqyDU5BhOzpRjco@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0137.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::16) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 168e0a4c-b879-427b-2294-08da4f511e5b
X-MS-TrafficTypeDiagnostic: CY4PR10MB1864:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB18643CB3A37111E5EC0641028EAC9@CY4PR10MB1864.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wKjI6Tm3Qw6qR7seuDq33CL0M1L6INitgW5hsmOlVP61vl/Qi3P1ALACCsV5M2o3MmjSNFXmpWFOpPzq73sUeTIdtQ3yb0Ygn4rs7Hnqd8mB66yoBIDD93wjLCO5LzfnLDAwlUE5ERDe7bfQGuInpPvG0UPh3M4y4sGoDog98hK1bX5kmiWtHkdYpyBFf/J6zX+mK9N0TkLRx0ZLoTdLQX8lv7vxpyEsKzwXnYe6kJX/IJ/UwEcWHRTMvPboL5YxKw0UhU15H3cC5bvAuxSkDaipOw6wbpc2sIb9Ir48S+h4a6HC91BsAemUb+U8CkYihmAoKK5lHgIhiB4vE+Yavu6uPDrrr50B/0CrguTyaibzrSOG83U7ZpaWtAhCoo/6B8BuDBp5iTYLkdYqEeRyrG6jN69KOKPVwOLNNgqv3XtqG0YdBXqMBgCRzTUGjPPD0l6V2dzIeO8eDtqoGzElDuoyZdsZ/6nsJJ31ZsshV2aXCPQkJ659BthZYTwOcH4wD8jU0Uc3bWm8fSG54WSq1V8ZeSf/eDrOGiCZIUfHdwqTxEQadfvGxnher666VM0zfNvxfGHZhMrs5rr9S/t7RNNcTk2guOcsFB3Rg/noxfltzZTUvYozX0FjgpDlPJ5lk1L4SbFKsEhjwc71DJ2S7FnqybiQ5iutI5051sFfW0Ujquk7ISWwBb3Da0L2mFkQR4FPnXRILuBYmS81IuEXTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(366004)(186003)(6512007)(33716001)(6506007)(52116002)(26005)(9686003)(6666004)(2906002)(38350700002)(38100700002)(83380400001)(5660300002)(110136005)(54906003)(44832011)(4744005)(316002)(508600001)(4326008)(8676002)(66946007)(66556008)(6486002)(66476007)(7416002)(86362001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y1wlzW5GGe3MVQrOoS54xFGxFe19/GwH+BUbfuwGvSrOzf34vCbFfEpRmh3f?=
 =?us-ascii?Q?ya3z5cvjhm2ALO3ZWK3JseeHpu/fXxAnKgnBlGo/7OxnWT1PguuoNnmzMVJH?=
 =?us-ascii?Q?TK27quhUJ4vJENrSg1K1YgPVMZp+hDthItkoWO+s2gnQ9EqiDI0bC/y91QFE?=
 =?us-ascii?Q?6BmG/9ehVnV/KrTjjC/SALFyzWITlw+O8KU10DB6X643Jmkw/Y0GdGcWiyez?=
 =?us-ascii?Q?vg+/2houArNEGhr8dWyIzbFjImZqnSu7RU7vtQppz3QHtc5cnyCW0WsTV0j/?=
 =?us-ascii?Q?r0sjyqlIbW3GPkVF+Im2FQj2vCymg41FLLVc12Bm2K99Pu998keszjhMlEtj?=
 =?us-ascii?Q?lxjAGQeSWCN9ZHQ2blJfRJa7cXdZq+E9qGEsw7ylRQD5Ue1PxIJZT2merhts?=
 =?us-ascii?Q?OyTCH7qdEMiE8G8VT+wWr+eGvoBqZHQ+Rd+90u8GzRibEb10e8YIfvOVVG4K?=
 =?us-ascii?Q?8sroLvol4x4Wd9Mrw8XWGS73a2UElvSpP/iAvLCwrTzMPLcPMrbrP4tuNiQd?=
 =?us-ascii?Q?C4zzDvT8Sb0yE4CDXBiMBzJTYyKNXIvfU+6jbo/UwooSwP9Y/nXsKmJroo4L?=
 =?us-ascii?Q?6pDx2lAKI9GkARFZ60627gk2mmcx0WU4SjLlaHTfGPsEVxwagGsF9LufulJi?=
 =?us-ascii?Q?YBMbIRa7kxDkl9RVg8JC3mLAXPN/K7TL6HQvG7Yv3oOjnx0xvAq0HUsRIRDW?=
 =?us-ascii?Q?1jzZh63eYCBLD3dQ7lg3GIqxODXwQdzwAJWYwRZOScrDFUkTTQY/Di0xIf2D?=
 =?us-ascii?Q?ZIN6bsB+GfOD2JN7EvRop+2xLEdxy8RfGLTyI51GukSDta2iRnjEWFBhbqLW?=
 =?us-ascii?Q?0IS97Ik5HzgjMxMUnCknG8AqtayU6JVpK8BpxWgMw1V+ujkQMtgIubOF2QWC?=
 =?us-ascii?Q?FwGuvy6YwVndTddsMs+BXih7rPZSJK+O72uzDQQ16HwMrj8+B5LitsN2bL0a?=
 =?us-ascii?Q?G20t0Hc3BXO/ET/gqJ4rnFxvf+BmbCRMwI0l8yzb82P9Ti83JYOg/WMiekxL?=
 =?us-ascii?Q?25EidsM8+bVEmMImLDvXOoh3mowSw01Z67q9KRRwPVCcC7FxyddaiY0vW5ll?=
 =?us-ascii?Q?ugWJhfSIC7DaqxDHctinAXVigiMCcV6TrR5QEx+p+Hz7VUjQSJih/vbfWiOW?=
 =?us-ascii?Q?CUs6YNPNiIPSS9jF4wO3yo2iTHKS5z5zdq3wEdmkVUGSJ39pt+C8BP/R2Vbb?=
 =?us-ascii?Q?q5owC5O5UQb4Tie9sWVrcNGEep6ZI4J8RHmCsxIv4Vc8c9M45RQFyf6q38Sw?=
 =?us-ascii?Q?56dmMrtAkmstykqDh5tEQsQLu66cuqjKkDIEr4o7S5gxVpZqqpJ/gNmvaKBp?=
 =?us-ascii?Q?rZJT4+TEivU8Tn+3eYh/ZpHQOCWhrHdorf8HAOMrpRF0hoPaDLQteXBYILRA?=
 =?us-ascii?Q?6x2DYZufktmv6Ocxc0iW/LqWpcdMjP5zTMVkVUiBKPTJ3SxZ+tsnYUF+Jomg?=
 =?us-ascii?Q?WRmPjh5Jzp8BgIwZFD5ZVrW9H2lZ6tj/UckiHVF3uHa72vtaLfzuylaqt7vD?=
 =?us-ascii?Q?kv1J5SZyBNiBaE8wmKfUHz/8ivM6MiNHwEmAqMEgqryb2PaIus7g91iDYe4X?=
 =?us-ascii?Q?aaKz7b1Mfx9/fVX4LJIJgYxcSqoKswf3t81LynzHXjEXGsQQyk2RIppmir5N?=
 =?us-ascii?Q?AJowp6dyUzv1xezCZSyc+Ax63MaCAt7TmfOupY+wMzuwqOMhcjCxmfDwe9Oc?=
 =?us-ascii?Q?hIw5bviOzcT2svx1IUpWHgule4Lqk4UzR7BCbTCiVsmSAhW+VmZ7xfnzU2PX?=
 =?us-ascii?Q?1KtFEciC7zhVImziVd1NEMSYQhE0o+w=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 168e0a4c-b879-427b-2294-08da4f511e5b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 04:31:44.8924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oR2cVQ1vAxdhRhg6Y0tUTOVR/Zl8Tlt1/fP0L9zUTPSDhdFBBDpUuS0j3k4aboxav+2PtbuJG4tqFck781P7FjWwAiZF6yS5xjw8I0LVv08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1864
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-16_01:2022-06-15,
 2022-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206160015
X-Proofpoint-ORIG-GUID: S4GbtfaKWQ-CfGofdc6pTar1g77uNDUf
X-Proofpoint-GUID: S4GbtfaKWQ-CfGofdc6pTar1g77uNDUf
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 kernel-janitors@vger.kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Rander Wang <rander.wang@linux.intel.com>,
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

The sof_ipc4_volume_put() function returns type bool so returning
-ENOENT means returning true.  Return false instead.

Fixes: 955e84fc0b6d ("ASoC: SOF: ipc4-topology: Add control IO ops")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/sof/ipc4-control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
index 95ee121dd3cf..0d5a578c3496 100644
--- a/sound/soc/sof/ipc4-control.c
+++ b/sound/soc/sof/ipc4-control.c
@@ -142,7 +142,7 @@ static bool sof_ipc4_volume_put(struct snd_sof_control *scontrol,
 
 	if (!widget_found) {
 		dev_err(scomp->dev, "Failed to find widget for kcontrol %s\n", scontrol->name);
-		return -ENOENT;
+		return false;
 	}
 
 	ret = sof_ipc4_set_volume_data(sdev, swidget, scontrol);
-- 
2.35.1

