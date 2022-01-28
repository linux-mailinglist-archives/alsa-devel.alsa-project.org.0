Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6789D49F831
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 12:21:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E3D51744;
	Fri, 28 Jan 2022 12:21:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E3D51744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643368913;
	bh=WdbJNUcefqkJ6jCijfqI/rZ8sOjFS9O2dM79FZVV22M=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=t0pp/tGRbYtRu0zQdBiLgVVxIMSetBAu0ESlycTi4WHshsH15cF+DDIyzx3jfv5MB
	 3jNvAS5TIKYckMlew8w+B/FW/4M8DHw7+t6BFlspcJ9fJFqHuXB27BZ1+RbqFUTwO/
	 CtqhmoY8DfXt157MWdgzrRz2IIFBhp0WlujmsGFM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 160A5F80482;
	Fri, 28 Jan 2022 12:21:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6898DF80482; Fri, 28 Jan 2022 12:21:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF249F80118
 for <alsa-devel@alsa-project.org>; Fri, 28 Jan 2022 12:20:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF249F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="GB7h5zgr"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="puk4zupk"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20SAmY8t015087; 
 Fri, 28 Jan 2022 11:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=nO0Zj3ch+si17hxBqEXBozCdzI9tZT+y+U3e7dc6wVE=;
 b=GB7h5zgrSponLuBzKDMqDYnc5GcJPPP3kceVMkQq8AZksLylGa4YmEoQflOxjuJ/2MG0
 xemXmSdq8eLUqU2WDTnZB0C31uIu/mm8Y5To4B4b9Vm2CtFnr1gf2UiUeBXnpQ1VzTP+
 tAUXGiKjru43kmJJcfyeF7PB6mddEyKytVtr7it8U/GSvRD46BWAYRUnPPU9vM0sG0sq
 UqeiIQwm20v8/eIhNcfPH/EE4O9vSJwmVSMVmk1QzqmJN+Q7XiVyl+RU4bc912OlFytV
 ddHESSsk0RSGTvGj2R9eLks5C9DWuRkFYUiba2ymRG+YfSYbxf66x9/A5upfdmbydREQ LA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3duvsj2xxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 11:20:57 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20SBGtGk178176;
 Fri, 28 Jan 2022 11:20:56 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2171.outbound.protection.outlook.com [104.47.73.171])
 by aserp3020.oracle.com with ESMTP id 3dtaxc7cvw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 11:20:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESdpC94tcRoyuIeLfmXiC48LhvvrnRye9Rq771dN9id1FusojGJ+MJ6vBLT6XnCpj9RZCaLzzKzv5qr1CpxnbfI99TD0ceXjslhkh35Y0rAp61k8sGqkVIHADzib4oKLWZrYjFCwS1JW2VEg5qtUjUoMs/9HMKc398ZlTq0vec2mvcQlWyg0lzoBUU43hUH1bkYQY4POc9ISZkMmEPofFUOWhRovGq8hFfrZpAOxvfYy2p0b6bjtFzQ64P1Ixp8PAClYxHMJIaRK0FRmWpAuBLK5t8MuJI5uQNZaRVTkzIOJkImHSvJkM5b2aGE7GOjJtxsp/XbmlgKjTJMOnH08KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nO0Zj3ch+si17hxBqEXBozCdzI9tZT+y+U3e7dc6wVE=;
 b=EYGdrwjZ/BlCNgSP2WaPLOFBz6+p7kBX+PlFj1FwzYltiAa71S6RnUsjGzwF3dugxd4c9Ar2Myiu6QZ6g7dsYk8PKrWwtLnv+aqIcumELXwo8T97tbvkw6dEt9OZ5eiIEYbepGf9hX0nVj76EnD++mPhARmxAnWXglLd0ehVaqUeqz0+oACc/jFWVbQRyIRAkdctIzSwFddA6h7taOf474ri5SJvnwlQG3oGPbq+0z1lrd2K1sON/6R6EhsmMSAcgJ+Bj+ZTgUUFLDDsdaJy9tVjmtH6kq3bXTes0FWmnB5Xr7OPRDSDX+jYWlGhbsc59iFUIjhL+hiYaQUtWRI7XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nO0Zj3ch+si17hxBqEXBozCdzI9tZT+y+U3e7dc6wVE=;
 b=puk4zupk5MQ3U/JTpcsysv1/gkUThzN0mGB5QPme5D4BkL4ztx9qTSpcngiAluMB3bl2yhg4oEoi3j+6PsRgAZ4OvLOH8lAqJsnt6aDM+4MRRKCMMYWM3dwml0FrwmwQOM2USv4FOt4H4kS25ABweT9aUQvlNyxeBngyJzYCwyk=
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32) by BN6PR1001MB2097.namprd10.prod.outlook.com
 (2603:10b6:405:30::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Fri, 28 Jan
 2022 11:20:54 +0000
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::cdcc:584:3514:f052]) by CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::cdcc:584:3514:f052%5]) with mapi id 15.20.4909.017; Fri, 28 Jan 2022
 11:20:54 +0000
Date: Fri, 28 Jan 2022 14:20:42 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: ops: Fix signedness bug in snd_soc_put_volsw_sx()
Message-ID: <20220128112042.GB24806@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220128112007.GA24806@kili>
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0071.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::22) To CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16b55965-905e-4a00-9016-08d9e2503f9e
X-MS-TrafficTypeDiagnostic: BN6PR1001MB2097:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1001MB2097FF261D7E75CEA406F7D08E229@BN6PR1001MB2097.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oavnfcD9aq1Ja0jJKA660/lss5iHU5tSTBqHCMecCMnpOC28aIS8HFw1z0vMQU1w8qKr/Zfx32zawZjlz6n0v/WEZMIqp8C+kqyCW4X7/1ZyeRO09VXqkBNeyRSCb/ZTH2OABpCTVIgxSXkO7PwMzO02tAtDDlF1GFzW0pWD69pJkgvl2W7jrwpWD27Ed98TGQtpPgLOe4eM2Fc2I6vGtQCsXk1D0eAqivKOuoXrmBwxT1oxrP99eDyuiKzy+BAG7V1xUZOzSceZMKB8E4EgIdrBbVOrvqcqQeW3JkBfLQhU1EjxkuINRlKF7nTSElWRP2Y/Te3+pfOfHeZhtNKreVcig0DhM/gp/+1049p+YXVv5slXbx2bshIIsNo83VH196W57Sa49FUK+TBH1taXJWiFx8idUR7TC4enlFTB+mJPKt/70DqLl3RfQ94hmj6QcTVL2rT7bY9Sa3utMZsjlV4LQKsO6oLFiz36iV1p37EUxDfwlKqbEDqB9lwfi9JFCC7ggi0LUraCXZTm+Ef4uC/Te5+NVVdD+RSQbq4kRbAQnAWmii0v+6plvXH1Ujjhgvjeg43JQesGrbh3/WgHSXsU9rFzxvVgW/UkndqGUxDYhtf4cLKpB7dfoAwL+wq1i5qxshyWUJcxQPNhmXqkRvc4HRIvy8sTtqr1mrY4pcUYp/9O2zu2PkUOP8P1c3YCKlOifUvFMTAw2jYqQDHofA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1001MB2358.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(6486002)(6666004)(4326008)(8676002)(508600001)(8936002)(316002)(110136005)(33656002)(54906003)(66946007)(66476007)(66556008)(1076003)(86362001)(83380400001)(44832011)(38100700002)(4744005)(26005)(5660300002)(38350700002)(2906002)(186003)(9686003)(6512007)(52116002)(6506007)(33716001)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+rHOWUycrlC/kFurmm3ZRoy5uCtx8429DBvsku3r106f1u+e1CaCqDf3W77B?=
 =?us-ascii?Q?r5zif4Gi/+u6ZPYWZqs8VlAn5quWt3gKJiS8873N41WbPutXRapONDBBcfbi?=
 =?us-ascii?Q?RtKAoghi0muA9JDT9/X3oBkPWsBd/6cNIDz9gUAwTC7eI5D5Tyu07lgXrXJ5?=
 =?us-ascii?Q?Hj0HfcupiN1DOCIERE0RXD9DWSo3uUxqBVxW1LnZYJOz5NDs3OaemXvhI9t0?=
 =?us-ascii?Q?zRObCrxSsWRbjRm2DUuar6E2KQsV6kkj6zF2W6sus4Ma2J/pl2LyIohF/vCV?=
 =?us-ascii?Q?JJ53dzFLxjoUNY4Aafkxs5a3LnMrKrPj/uzTUUV6Y96m07eVY7KIdmbTTqlQ?=
 =?us-ascii?Q?xpPgSGZmLxqa7sXC0qKz0C74TlsTJi7L43zLDNR1diNAZflEV+nBuq7K0Qmn?=
 =?us-ascii?Q?3AKBKA2E29ttacYKR0oZtedGHDyrnx1YgFSW4F+fbS9w4RxV97zKF80OzZBV?=
 =?us-ascii?Q?nZu6h+ITxqSn5jCHc5ilSmlM9syLrJh31D0fr8GnjFiatzhfds0I7gXMs9lL?=
 =?us-ascii?Q?heg+ZQOunqSDMtUInWXzdXhh1u2ddu7wdq5VBfhB2xKEl6CC1OfoTNbycukp?=
 =?us-ascii?Q?mvaFgELq8StDEdhtAVQ96f8ZZ4dUymKb8iOTicG33OndXIW1ZV2ZDiK0C4Vy?=
 =?us-ascii?Q?oiHZTo+i4SD0zAvDbo82VZBtIlfH+JiEG0hF5ZtaGFPXaMaTDgmhNHYjEk6o?=
 =?us-ascii?Q?uZKPBWFj8Wxg6QN9gjzVohLDvVvU81Xgt6p1n19KWYgXJ9kNS8r5Greo7I8b?=
 =?us-ascii?Q?8Ktzs5Kcb3xQEw53eQyR6wi/+fDrWtbih5Zkss35aUAwpKg+MoHyvHh9Vxpz?=
 =?us-ascii?Q?T/7876Er3Dgcz99lEGZib8iqJTBq4brwBzFv7ynvh3IN0ivFOIl+aalhEwCX?=
 =?us-ascii?Q?rOBvN/BMsK6UAfTtsrQohW6E3L1T7ukwWG/rWaBEt1hK/1R93rq7+jGDyf+D?=
 =?us-ascii?Q?noiyIOIMReXSAEF6p0VH35bBmSOtTkQcLWwTHuaMxT6f4eHcU3boret3oQSq?=
 =?us-ascii?Q?4Jz2kRCUae0p4mCx90npuVEHG34dc5OMew1SenwqOlBTTkPGlgOb4hjP976I?=
 =?us-ascii?Q?jaEghNrz+DlvmKGDKW9Y57Y7Mil+FqRy3HaFc+6Wubu5jE7kXFq912ICMN0u?=
 =?us-ascii?Q?McxbM9L+6B9KyJ5tv24Hz3HygBIK8P9fJIfzeuJecfkj9/WTOGk24WE3EASs?=
 =?us-ascii?Q?h9VX3rENeKdTKQnLYt/OjgmCVdKxwAn+aB0OTEFhM9k6uF0GsMvl4YHGOdiy?=
 =?us-ascii?Q?aTTLtlmwNhdFTIpULhKiwmRDJm8Q5gZXd04psehtgJT0vCF3tGeb4ieDMyQz?=
 =?us-ascii?Q?6lDzU2MR2l2B4b8E9+ewzI3TpyZojSmbF+fYJBy+dMDg2Qj4ubU4WA+jGA53?=
 =?us-ascii?Q?EAT255Et+B4qMVhhWl3icKY1nZBmyqCIdrc5BmgHBKzb7hGuOO54f//7x0VE?=
 =?us-ascii?Q?SwSeQ8lcWn7IKPA+EiWRDXdG2DRRXfrpwwxbHI1cr9rw7J+/fT2VR8ppDgBu?=
 =?us-ascii?Q?NDCi1ZX7pzXTNt+ON8EgLgRx4ke7sEmtnsOgejyLXxVj3X+pgWuxrBhktiS+?=
 =?us-ascii?Q?6vBG6dtJP5EHobp6gM7i0hmMbkjQ1iXFcx0kn+9WBv3Nq4oUqG/6INqKtye7?=
 =?us-ascii?Q?LJQ0SuvtDvRZ7ZAKjJY/334sB4mGI+sJrc1ifLdviPVJZNM27GQXUgKsIjsJ?=
 =?us-ascii?Q?qGz8HrCq6vj803G5pE7cAb00kPQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b55965-905e-4a00-9016-08d9e2503f9e
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2358.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 11:20:54.3346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NNREjQdZc3lpT19Or7Xrhiz36mTIplQAdZJjpAg/RBsiytp2DMa508vS/OjkOyNeuqMf2h7jGhNh7J34tvva5CaF1S6DY9n+cOdSzIy9uSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1001MB2097
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10240
 signatures=669575
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201280071
X-Proofpoint-ORIG-GUID: nil_Oqh_GP9N9KE4aVIXt4wyG_0HeC2y
X-Proofpoint-GUID: nil_Oqh_GP9N9KE4aVIXt4wyG_0HeC2y
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
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

The "val" variable needs to be signed for the checking to work
correctly.

Fixes: 4f1e50d6a9cf ("ASoC: ops: Reject out of bounds values in snd_soc_put_volsw_sx()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/soc-ops.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 0091fa96eb48..a615316a06ff 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -422,7 +422,8 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	int min = mc->min;
 	unsigned int mask = (1U << (fls(min + max) - 1)) - 1;
 	int err = 0;
-	unsigned int val, val_mask;
+	unsigned int val_mask;
+	int val;
 
 	val = ucontrol->value.integer.value[0];
 	if (mc->platform_max && val > mc->platform_max)
-- 
2.20.1

