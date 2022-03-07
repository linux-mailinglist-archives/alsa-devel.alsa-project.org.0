Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3828F4CFF5C
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 13:59:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF77516D7;
	Mon,  7 Mar 2022 13:59:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF77516D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646657998;
	bh=/cZ7Uq7Qck8LO2nYZ8NwXt+cM1wwDmPjict0i5Qbuck=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kDUXhSEMtsLryRvgXE7abzvyONWKrk3VuR45E3gRdB2SVbdixWV9j9kF5shkOCIWX
	 vSIEO357dJSuPQEtKFstTVjvefvt+VnfA8cSnuFcLG4jojwO8xt9Yor9AJ8xt4TvJk
	 cOGtqVI7uQNCH3M6lndWL4Rpzk/GzP9F4gXQF4bk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13D1DF80159;
	Mon,  7 Mar 2022 13:58:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 478A8F80132; Mon,  7 Mar 2022 13:58:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AABB6F800D1
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 13:58:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AABB6F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="tY5sNKz4"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="b2vZ7phB"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227BvxcY019187; 
 Mon, 7 Mar 2022 12:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=BcAINTk8adBaFzN3HqJbESLKNawdGOLgsvJLgUvP1U0=;
 b=tY5sNKz4SmFee+vfQjjPT6OgOeqtvqtPiCZoS7TDm0An9vcUJ8ffV2dQ1b+gefIbcaHq
 If8Lx7Uh8tubPzH+gF3tXQ/52wMLG38Uv0Bhy3SxrZoQmMDlnBLpWTnz9CDutZk3RoXn
 20QbOZTomARjXwqWglhsIhNKtOfrN9Qt2qeVMMDhER4tU6Ej/WIDKtPPhStSlTUAaP4f
 i4S5CXmPUD6KDHGcRvZmJNMDsk9Utsom2jVUkSY0ex7vnRGIbO4ibEAbQRIKGBmGsHDj
 0uWYlChIrBCvcJpkzZd63Bv4fwnO74tfoqloDhdQpbJCgH/gGQx8hMCLAMQdzhFgCfv0 AQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3em0dtuqqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 12:58:40 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 227CuckE039893;
 Mon, 7 Mar 2022 12:58:39 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by userp3020.oracle.com with ESMTP id 3em1ahym22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 12:58:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BCQQ9/dkgvWoBWXkoHlKphFxybBmG3tKSYJbZfYqGLa0NagayY9TkZDTzzfkd3uO3tmSWTx42t7Yn6anJihm4hpdjdetOVRkqcbQ5v+E6KPzrul8oK3JbC8RDKjJ/QKtlJ3HL1IAsOs+OTvAvTKn75+ezxmdyZK4L+6bkOTgmsnIS/sSr+P6j64JYCyqdp25ETk+CBgVIZnA4Hu/2Rlu1njPxg6mmUbiqM8KYA0Eu2tVMGJSVufvs5dbX9HrFbvC5CUXx+Y5opUCZSjKnoYAzz483c26jPBb7bQMkbWnHm8BnCtMVmc5Bn7RM+d2ijHjDSAdpT+gk8D1//igmlmMQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BcAINTk8adBaFzN3HqJbESLKNawdGOLgsvJLgUvP1U0=;
 b=fHjLocXKTNoJdnr909JYy5D1QptYusGTGL54FCqhZM6sUZbpBssv8RiMHnuzWeJp/VGsE1xroJr8/LwvECskC3ge271wGEGgU9KlpEIu3qA6mEm1w2XYY1ylbl8n9ecQaJuMT9mCOPkkvYm2HGrodFMH3gGqxkTkCUMhnI+KpCJeJKBbeUXvBkbnr2esiltcvTaglNmEteWCDVt+SWq91kGXCB1KJgHgs+q4gsUB/iSbhgwCGjMbAZtg4qyiTFoqGYyz/kPoO5tLQfavA4oQRixMZ8LxO9RKeREgbkbqLVoPJ6AKNNAf+GsiZB+i65ElZyTW44lQ5KVcwaDjHXLCNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcAINTk8adBaFzN3HqJbESLKNawdGOLgsvJLgUvP1U0=;
 b=b2vZ7phBscC5HekOwxa3z3Qn1C2zC+EgthDD/6rLM9HM61OZMc3FewqvFUb2eux5GXkU5hylDvjXBfxPn95k/kgEpG1kifJpeZbXSrxdbiU/qooNyyulAwt+i7oFKdCqxA8+4+odSV/TapBPHIVNUfRJVYQOCkxRxGiBQLC3EzE=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BYAPR10MB3367.namprd10.prod.outlook.com
 (2603:10b6:a03:15d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.19; Mon, 7 Mar
 2022 12:58:36 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 12:58:36 +0000
Date: Mon, 7 Mar 2022 15:58:15 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] soundwire: qcom: fix an error message in
 swrm_wait_for_frame_gen_enabled()
Message-ID: <20220307125814.GD16710@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0115.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbb0cfa7-cfc9-4164-85f2-08da003a318a
X-MS-TrafficTypeDiagnostic: BYAPR10MB3367:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB3367F49394555AF72A3D1F3F8E089@BYAPR10MB3367.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nUdIfKVRwgVyyYP2xkARi4LEe2jTtAiekPWe2AfIVX2t3dQqXwxQsxzG6menFyUZ+kBYQqPsZCTpCf+zu8USDQ2F3xuWSeHPiGpvTU9MuIyb9iFSUV1mVRzHXotVnfZH4QhdcyyansnkEscpU+aG8fxaHUieqekxsSuu6RJS0G1Yxz8qSnNYW7YrMqRm3A2SI7SQ+CjRMNKGVqO3WgU3KcQ4yLrAOeaNcwrho+4LxMavmTJN2bOamaeSxho5DCYNcI42bAoukz/EjB6WzSos6qfhXsJ4juhfd9n/UpNCGy5xJgxcPll0a3veJgSxwjWAp2bhTbAGZtKQJHUYhoiabxdpEIAF7a5//YirdDosOGPA61za9Ay78bbZGpi6fwvSBEFiLb93mZp6/emClTIG6I3SjEhffH2Mdu2snHqaLsUjfpAjSYC6n9D1++/67IUVwkQkXtBB+bXouphq+x0/vdvxWsm9Edh+nO5G3QoA0vqhY1uKTmbh3uWfHuS8Db1cz9tYRyeTMJgNHmfzzTA6M9POhn1KdVq1haEY/OwlQtZ/L2cGpWc0acC/jUO0xuBoIWWCvQX2Bx+ckqtr1lZcjEnZpv4UnYnqXvVA13xYLK6rziwenfK5FpW2KeHNPLfkA97aqohL1mvZ1h4M6CfwqJPyDKMO/9oE6aoaiwsdCuj0JyQD5MBooFamU02OorN0UMapkP+BfcN7OYhN0/JFrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(83380400001)(66556008)(66476007)(6486002)(6506007)(8676002)(4326008)(6666004)(52116002)(66946007)(8936002)(508600001)(54906003)(316002)(33716001)(4744005)(110136005)(7416002)(86362001)(6512007)(38100700002)(38350700002)(186003)(9686003)(1076003)(26005)(2906002)(33656002)(5660300002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p0iZ6e4XuSpq+sdgIydPsB7ZaGkozpeAzFmteKTez2P90Rus7cZ8vIesHQHu?=
 =?us-ascii?Q?SJzVQgPgeUPMEnp9Vx72Or6EznJZwlcvhaAZrJNlwzRWNE/1iijvdjNgsE1t?=
 =?us-ascii?Q?2VMsZ6gaEj49nVjrmtQipjUFwtUq4oRaLUQQtyV0TS+1iJe2d4Vvt65hhhNz?=
 =?us-ascii?Q?CgdiEl2VRYDj9yGjaDUjPS0H6UQUJDJYhSIEu00lIXvfu3xxOpJUeAnU3XdB?=
 =?us-ascii?Q?60+2AK2Av0esioVioY3K4jqIO1M6U/V+6J0hQWgPq7IyjjEWIvgvqqeMtRkJ?=
 =?us-ascii?Q?b7rULPhGI/CXSrkUSba1ff5U6nsZzEMe0cXxP7GsMko1ji3AX4P1NJX6KqRN?=
 =?us-ascii?Q?Xx/RIUxLz+I3ygjZhhVUxY5/COaUwFJLGxm0hZhlDCjAh9i0rykG33lIMPRi?=
 =?us-ascii?Q?H+t8wOvKAwnQWLxT52drICEEHohsHmhQxdKSsahnSvdUjOsGJ41jC6hpm8Is?=
 =?us-ascii?Q?duGaHyHb3wwwQtnSo7NzVx4Gr+bEABGymc/Ssm+sngqQ2Ga36TX32Go8ubEe?=
 =?us-ascii?Q?1dvpyYAt/3hwQtu5y3dYg5wtcYB3AUdbdWB22N72ZfEVsk0Gr+pvhrimpyY8?=
 =?us-ascii?Q?4M9QV22vRvFQ+zti8eeipsueSWUu9VFFjAJLx8SMf1McxPkaUMlt/f5UKZoK?=
 =?us-ascii?Q?7Vsa0B6tEvZ7yNbmZxyLBA5n5kOjQAWCHjDhEZnA7UHUApLrUYtYD6rOjqnj?=
 =?us-ascii?Q?ccUkY8Nd3Q24mh0JRrvX8Ei0dtGk2rtKaKFl5rCR11j2StpbreNob1OaZBZ+?=
 =?us-ascii?Q?yTnwlIAR3//fekmFFXnnQ13Vyf58H0an5Tu839d4UPHGX1ISveNVHNeWvsE2?=
 =?us-ascii?Q?+JsVs7ldcVnsCquMLPvgFHLAgB/VPhqRk+5raW3mVdyUjLkOR+P+aSIvYV7H?=
 =?us-ascii?Q?dxMHOcUsNLBonv3l6MaUAOqGVsVl/jJ138MtaKQYmFAMPd2GEwsdtVcut/kk?=
 =?us-ascii?Q?0L9s/ea5YwOYjxNRt6IiE7exdBIF06YNJGC+YotcIu4gmLuI6Lm3iY8K0DGf?=
 =?us-ascii?Q?0xprtb7y9iVikjZNXy1VUcM/42v3GsiDZSgq47Ufu7OxNdUA6RgLFnhleOJq?=
 =?us-ascii?Q?D5cOsIeYWpnMHQjmXYDD00Ag1VWJYQw2piZio0Jf+VshZsBuKil5+IgQs5gK?=
 =?us-ascii?Q?UmAsnCMkkBNHwJSR/mWqHT0qvcxWqacE+MwpZ42IkehNi/XiCTRUpWeBQNLW?=
 =?us-ascii?Q?Euwj1aRKmaHt/rf1J7VryLy6E0JB0tRf+2MjJso99oVx1MBZLWJelfSpzqS5?=
 =?us-ascii?Q?abR4lg5+7gPVvZQBr9ZQJCXO6KURY7Zll6EC59cKzdCjbZxOdaDN6HozoMCQ?=
 =?us-ascii?Q?/kTr18uyJ7wwJ7buG2bIMO+aeS34pfqHLpQvaJ6CXw+QkVS9mBrX+yiz2XxG?=
 =?us-ascii?Q?9IW0qgcLaoOt0a4V+td1JVR5y4lfnrL74IJ9lQUOraNAM20Bbm40FOk3E1j9?=
 =?us-ascii?Q?VogpW8bSFwh1vY1k6WXh6vPOAOWDSJj35sXlp9VerI2fOwhfQXWs6PG03t9I?=
 =?us-ascii?Q?DZhXUKz6MVbkbSfX3w+W+l2pX12FdCj+wql3k1TsgdZEswspczvAPv/L+ZOR?=
 =?us-ascii?Q?U2fUNbKXNGwLV0qkmGhEoWKz9NS7JIkrOWkDMxBd686w2RN0wcTzMQuVK58X?=
 =?us-ascii?Q?FRVtnjyCgunQ6jMAgZvcKe7PlSCzACLToSGM45VCQu/WihtfegoXKmR6BleF?=
 =?us-ascii?Q?0VMNOg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbb0cfa7-cfc9-4164-85f2-08da003a318a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 12:58:36.6861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ra3+lob8F4/YiCGHCOXTy9Znjp+Tf0EksEWQAyRNpk/LVMbKkePWweKiFeTcNITRmamRMYAicbN2/WX77zBTU1mQtRg+xKpuaUf6sNlBO8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3367
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10278
 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203070075
X-Proofpoint-ORIG-GUID: wqN0YSTC30_M8a3VlzVaQAwkIK-PpHZT
X-Proofpoint-GUID: wqN0YSTC30_M8a3VlzVaQAwkIK-PpHZT
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

The logical AND && is supposed to be bitwise AND & so it will sometimes
print "connected" instead of "disconnected".

Fixes: 74e79da9fd46 ("soundwire: qcom: add runtime pm support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/soundwire/qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index f613a41c278a..6ca041f9e449 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1452,7 +1452,7 @@ static bool swrm_wait_for_frame_gen_enabled(struct qcom_swrm_ctrl *swrm)
 	} while (retry--);
 
 	dev_err(swrm->dev, "%s: link status not %s\n", __func__,
-		comp_sts && SWRM_FRM_GEN_ENABLED ? "connected" : "disconnected");
+		comp_sts & SWRM_FRM_GEN_ENABLED ? "connected" : "disconnected");
 
 	return false;
 }
-- 
2.20.1

