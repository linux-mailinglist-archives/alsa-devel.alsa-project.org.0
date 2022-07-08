Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3452356B4B4
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 10:47:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4AB51F4;
	Fri,  8 Jul 2022 10:46:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4AB51F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657270036;
	bh=nil/iW4XG8lsd1LSuEQn/uJ+HErjn0oUUD82UTNz5u8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OO9Joah4NRekqK13XmQFSrf22KLgUNIFVj2SF8+KlzjiCEyp/tFFt1zV73IMuWs8c
	 +1rciVOEpxelvjHyudum47uoq6byVdcmlt2JhcKFVroxY0k66Bu5NVQX2VF72C0Pri
	 oEZewhN4gNx71jlQ2WRCZTmRflVSAnqKfGatw368=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4559FF8025B;
	Fri,  8 Jul 2022 10:46:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BB9BF80167; Fri,  8 Jul 2022 10:46:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A626F800E9
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 10:46:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A626F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="k9ji2VJf"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="vpGoOefE"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2687LcvT015540;
 Fri, 8 Jul 2022 08:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=x7wn7HS9X67D1uL7nmN0t9Vltfh1XiyD8Yi5Ett2iXY=;
 b=k9ji2VJft6obtG0i1DMZ7FPrmeP78Q3Nmd0SAsTlYxrBzlYPLrh1glF8zdgdGEMN5WFM
 rlLrW6cmJs2+SDrdlXUGbEwb6u4TaG7N3ldqoNz5ZNEEMGhksEgBtPb4IyEW6Flm0o5h
 HBr21dOkxAwcuwh3YVg4aFqmVu7TQkdHMfwQqUuc9VvTg0tP9VmI7Zvmd6sk0wn/EXIh
 5omUO+OFofjvnCXEzG0EosNGYy+sq1RUAJzOeWhd7juPCU8jn8slDjVmImeGdvpqk5Zn
 XXcOyMEbmrGOTQA6EScLGh1RrBuVuq1ygoCnG/RRDlFILZzs4ysB8wK6F3FqtIYpzFNJ 6w== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4ubyyatd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Jul 2022 08:46:09 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2688ZkQs029011; Fri, 8 Jul 2022 08:46:08 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h4ud7rc28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Jul 2022 08:46:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0vUPU1FH0Wehnt0c2OyB2r0PlRmmT1AqmjTT5GrxNFJafpJ8yne4pkgKcyC2rc7SeYM54gcG83S+Q4dUCrWN506WjN1+Ed46MWaJpfv3rS1WymKI0PceujjxnswTWKLgfGBk4n0rwN0CVf7Geqwrf2t6tFh+T5PHjLzTx3qtii7LYTlQAlct1z54ZtX3m60ph4kYO3haj6bp7V25VoBEoTfHEeh7GVF6pcX1xKkNZqfUlzPY7Snx4cwf2c06VoeoIaXE9QzGvtRSHd7nPv9o6i7r39llQ22oyThUtWVuvpklHGFtbsUfLLyJIB3qqWMpIjCn0+BxfNvb4ridbwLeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7wn7HS9X67D1uL7nmN0t9Vltfh1XiyD8Yi5Ett2iXY=;
 b=LFibH1bKU5e7tIscOFZ+XJRdyHK5V/8RCiMlcM/izalsq8g9imgkkjAe7gPj7BElc+UftvIAEgm1i/pyfjzJOux8MordrooUR6Nykp7xmiSAUeGnt30ZhVjv954UiDJjc/kZdY0007XzNAaSZln8FqHjQmmJCy6VoxBNJwsqRGdYl7TX6UW0cZeGCDYUsZUOBYMOZ3vrCVX/lbsWcC787gBp7ZhYwIkMWFn/uOic+v7ozCgMuIH/lope8mq4lto4pQzamczJd3wE1wZvjOeWxqpXYZhRegrUbtlNBFJ4xOO977CBcsXQqAuTNV/w3P+x/wHk8JdOTok/hrE946XXww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7wn7HS9X67D1uL7nmN0t9Vltfh1XiyD8Yi5Ett2iXY=;
 b=vpGoOefEdzg3x7SHUmmjTP7GeHNjmz3DzLxDJs5FnevS2Z3TCXb/Dl7ICSNJtl9bwXS1Kcb1hu4StQ4O5ii87N1KRGBDlb8BtqEqRhSYMe/WbwpbNcCi4+tWHxlwm5tnADIVz0d7Ql/WeUb4LSV79EAE+SwjDxhgoNqHKDCCfQc=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MN0PR10MB5910.namprd10.prod.outlook.com
 (2603:10b6:208:3ce::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Fri, 8 Jul
 2022 08:46:05 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 08:46:05 +0000
Date: Fri, 8 Jul 2022 11:45:56 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [bug report] soundwire: qcom: Check device status before reading
 devid
Message-ID: <20220708084555.GJ2316@kadam>
References: <Ysfl7lzEyRVuQ+Dg@kili>
 <747099de-504a-daed-6d45-34bf0e379562@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <747099de-504a-daed-6d45-34bf0e379562@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MRXP264CA0044.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::32) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5207bb09-21b5-4ae1-87c2-08da60be4b83
X-MS-TrafficTypeDiagnostic: MN0PR10MB5910:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rgN7ZxPyDueojVWwT8rPEGy9m07G3p5gz7owOhPNGx4NXShNhCFLyJEanNbfEfjM9gJvviP+VtaGjIoSmncRbPvlGdnZwsxqWawNVJadDOYHZ2x71JJB3C/So1C2xqK0IBNqJF9XUVpRVlEacqxAJNfmQqzYiqZpYs5udtEVyGmQr6rSBj4OL69Q1ATfDxGexjl+uIxVx78b7QumdX9ZFMT0jRwVMCoNYcC/zi6DhdQEBX87nWFcB6dzH4rlp8Ki55L1/YaiYqNAXgSE9zdzTYwFUiOyq7icH0Pb5luy3oF3hR2mA0KzaM9cr8K1f5ZlowTQqnwMrMCynWlqh8ZWUz+eNB9eRCfnfKM+8S0BcNd2jRk6a9vbbOtvdLO6HrBxin+vf9iItzdeN9a/kVqD6o/aKpBJqXVu2tnbnlpFz2sHT7nV0OPpR53tw5g8WnKWupgWQev+GuvkfGppZKsrxYQ01JSnSlTifjgIi/+Rtj99IVLT9n7JE1Fud1lgEUbfCRbW7zeXq+6b+Su/picqpEQImor2DH7dvs0T4dLZoJJvBaK5uBnLk33AKS16Nvi8RprhPy2gqC/eG8EhTMJd1OycmdDASXuMC5gjsCeCES/jBcQ4kMgpdEnU4xggtsPFRnpg2Y8sik+hwWlkPRNW4S2b32BmUmcdW4+7nhJUwfe6erRoMwI0clPNk9mzdEfK/mKPx+ujlXsmtjBsLH7f6ceiRy3WMCv0Ik4GNa2AHVl66BGeV8q5amyhSV4cciL6boPOhm/1XQGlhk8zomZht8bCbq5apuaTROu/D/3PR+fm6W0JiXI5DJ8fY3nO6Bem
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(366004)(346002)(396003)(376002)(39860400002)(136003)(44832011)(2906002)(86362001)(6916009)(8936002)(5660300002)(66476007)(83380400001)(8676002)(4326008)(316002)(26005)(9686003)(6512007)(66556008)(66946007)(1076003)(41300700001)(6666004)(6486002)(33716001)(6506007)(478600001)(38100700002)(52116002)(33656002)(186003)(53546011)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RG9/pr5fPnmtBDx9O4lcQJGemwJIO4hvcBxtpeX+cTgmEDzok05hcD4sbNqu?=
 =?us-ascii?Q?zFOnUtK7SZmwyicAS8VLv2nHPMgBZnj9TMPy+4buX66JEK3YnEj1g+McCScj?=
 =?us-ascii?Q?Zp1kTrgN0GDfXzXelydbUv5I4n/wWtrEusta9Ybp7MHHI4wwzHOkDx+jhAdb?=
 =?us-ascii?Q?O4WL/VYAN04cRoBimsINKhMzm5PVh+EfK9qZIJQTtJ0cY36rPBy8DZHxpNhi?=
 =?us-ascii?Q?xMwMdk6lRl6ARcH8vKbR1W5q3o1Zm2jxASkurGe31m07BfwX62qdM3fLPBsn?=
 =?us-ascii?Q?oyKjc9CZ3K/zoxhmSkebD6WN0ed8Oh6ZZHbgprF+GkQ7jJ+BG2HPGKYFsrkh?=
 =?us-ascii?Q?Qp76WbC+/7a8YMla6btAEQsqR1GrOlSXbiHq2BK2kGE9S02LEtQ1kK9BZPap?=
 =?us-ascii?Q?fl6eLlmTB1srDmfFaowiiNav05gEX6dYwqfy2KT8H/mETgLrYlAwsOaOttOp?=
 =?us-ascii?Q?Lp+61N2JX6oVGF3K/BQrW66/ct+BfDfS9xR5rFJUoHnusNs/d8gxsqwmvH0c?=
 =?us-ascii?Q?nT8USzGHefuRs6PBgmEn2ks79iwrkRVKMJxk6dhXQ0akxMB76kNb7371ED6N?=
 =?us-ascii?Q?zNN3JdW973JuZb3H0V03hZ/u9DAu6ja3+IIBDs8Y0bLYHb/T7ccQI6ZPWuxz?=
 =?us-ascii?Q?4qbrNb8kTWKTBJuAEXAeetJV+kROCrmLslCBlCcyou3Wr1ehbz1UZqX2g1Dd?=
 =?us-ascii?Q?65hzN/I5+frWGQZKi4m0pQQYOwTbLX8xYieQ8+ul+9olC7TlT4qwvgpsMqUZ?=
 =?us-ascii?Q?jV3cDXIuJhKZd9+7oFvwAx9/NSx+nCzScD9z3OLLs71HF79OdwwiG7Jh5b6P?=
 =?us-ascii?Q?PpaA1HzYCDWDvXf1saxpDID3RX0qp+ylwYaHC39nmv6sjFDcNo4YYtgQV4ia?=
 =?us-ascii?Q?Gm7s5miP6O4t520qr2u1/PiujAISzc1oGfFlxkNxeyZGLIE+KoKt6OPN/kfM?=
 =?us-ascii?Q?oJEK+Fyc2FXbKScWsR8URa5jFlpBvVXd6njpdxHbn0qPt31OJK2/v8dmQ5Jx?=
 =?us-ascii?Q?9S8fsjzr6LPzlrLJ5b9LLr4GCySYm03UDsXcUGtpG1ccH11XFGVCas6yrJYH?=
 =?us-ascii?Q?PbTBFqa3YK41zJ2tANUxcAUf7XcjdApFMFzi4x1c3+htSus+PPuWmJkhj27b?=
 =?us-ascii?Q?6byypOQfPAwzKtn4gWqDkxrUKv+UwyNKuqSKzUgcu4+km8RF/QcWx0AkiGHc?=
 =?us-ascii?Q?dRz+V0m91HSG2ZIpgHUCWMNvJAtm+sDlkk9WZNoNBMFP4M2TAbvJPmhCk7lx?=
 =?us-ascii?Q?hNJNvXKh/bunrFLJbGPiyc5JN3HtPg/6+oEqMK4Lt7zE11cAgURfVA+/rEfQ?=
 =?us-ascii?Q?AkMQGT9HzitqZ8kMMKpTglwt92PwY8OGSdJlquqPGcs8DVNCo+2lGqYApqou?=
 =?us-ascii?Q?Vesx6T70CsRLhiMzSLZNSxI5byNL6rmfDyLcpeoZ2fiyLtyJHxc2IDw+mm1x?=
 =?us-ascii?Q?3aTXiDO3iXN/htsG3RaLFsYhCX6IwKAqVKBJwqdkSzoaayo6K8E1ZXA9aOEb?=
 =?us-ascii?Q?Rmo+Jlc/q6FXid0Ie6e6w37WvKqIUhXmirCNum47rdpwsNJ9Ok7HGytS/bnj?=
 =?us-ascii?Q?cKaNa6BGYEiwcPtQhJsFp9xj/x2FSyX2X/SxWKoGMv9ERFloWcihCGE5hIO5?=
 =?us-ascii?Q?xQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5207bb09-21b5-4ae1-87c2-08da60be4b83
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 08:46:05.4404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r7CfvP5sIepJJuO0Ls+PUiExUOcL4IPiJT/xAKDudnwlXKLjhpUffV7Ayo3npacZDcBxx/zyJw2hfdlQkRY9YH0J5MwWgoviUoPXkw3BVvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5910
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-08_06:2022-06-28,
 2022-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 phishscore=0
 adultscore=0 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207080032
X-Proofpoint-ORIG-GUID: QbZr9dqLpJiWqHdZdytM0oMnTvo3FemZ
X-Proofpoint-GUID: QbZr9dqLpJiWqHdZdytM0oMnTvo3FemZ
Cc: alsa-devel@alsa-project.org
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

On Fri, Jul 08, 2022 at 09:31:31AM +0100, Srinivas Kandagatla wrote:
> Hi Dan,
> 
> On 08/07/2022 09:08, Dan Carpenter wrote:
> > Hello Srinivas Kandagatla,
> > 
> > The patch aa1262ca6695: "soundwire: qcom: Check device status before
> > reading devid" from Jul 6, 2022, leads to the following Smatch static
> > checker warning:
> > 
> > 	drivers/soundwire/qcom.c:484 qcom_swrm_enumerate()
> > 	error: buffer overflow 'ctrl->status' 11 <= 11
> > 
> > drivers/soundwire/qcom.c
> >      471 static int qcom_swrm_enumerate(struct sdw_bus *bus)
> >      472 {
> >      473         struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
> >      474         struct sdw_slave *slave, *_s;
> >      475         struct sdw_slave_id id;
> >      476         u32 val1, val2;
> >      477         bool found;
> >      478         u64 addr;
> >      479         int i;
> >      480         char *buf1 = (char *)&val1, *buf2 = (char *)&val2;
> >      481
> >      482         for (i = 1; i <= SDW_MAX_DEVICES; i++) {
> >                       ^^^^^
> > This a loop that starts from 1 instead of 0.  I looked at the
> > surrounding context and it seems like it should be a normal loop that
> > starts at 0 and goes to < SDW_MAX_DEVICES.
> > 
> 
> In SoundWire world device id 0 is special one and used for enumerating the
> SoundWire devices.
> 
> Only addresses from 1-11 are valid devids that can be assigned to devices by
> the host/controller.
> 
> This part of the code is reading the devids assigned by the hw
> auto-enumeration, So the loop start from 1 is correct here.
> 
> 
> > (Or possibly the other loops are buggy as well).
> 
> Atleast this code is fine, but I see other places where are starting from 0
> which could be fixed but the SoundWire core will ignore the status for devid
> 0.

This code is *not* fine either because it should be < instead of <=.

It might be that we always hit a zero first and break so the bug might
not affect users but it's still wrong.

regards,
dan carpenter

