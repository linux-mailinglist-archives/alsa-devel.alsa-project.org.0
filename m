Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D7160CB74
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 14:01:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C629A53DD;
	Tue, 25 Oct 2022 14:01:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C629A53DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666699313;
	bh=uNS6OvqT+2+/VHmNkOR5sOps4D9o3mxW8WRc0+A9Yy4=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j98MQQ0RuLosuOXbDpI6eyZ+B6SUQGq1ZNMCu3j6Z3E37rJwVMaK8UIyKwCu8WaPD
	 3z9zdv5KJbf3fZ8iXI328Wzx+Q70gtfzBc1fp9dzh//9BfJWG2ydghBwL8PSzT5gW0
	 jh8/oPSEFIdIk2dVrqWJ6izjtFssPl6t1MmsSONE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 224A0F80115;
	Tue, 25 Oct 2022 14:00:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 244BDF80431; Tue, 25 Oct 2022 14:00:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AABDCF80115
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 14:00:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AABDCF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="P1pj/66K"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="UmIhtubD"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29PAcNVi016490;
 Tue, 25 Oct 2022 12:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=uzOAvH5oz+QpIkMp5WnfnZl/EJu/+xbeiS0nj/5ZPdI=;
 b=P1pj/66KaGr27ZikrKfbqy7nwzpgC2oA2+yrLThSU+Ylm7dGMaEtq9VK3lHSbhGMP0PS
 vUNuYT7o86rd8lj8ooULWHo+cGJwNE2xSfLjbdlAXFs2WJxzAzYQkkCjHa57juzYjjAx
 oELxXiMvqTtM1absLq1789qfEky6Zl9HWDiP+VA1zYbzOF3IcvtX+uYzvf7gnDYjVcWN
 05uDRWdjSQz7h7XXudAptomaIcQW+6ko2KyqxEQvEfekS3sS88SAGF0tQB7+usSvk9hP
 yhKD9mPEQRQFgo530nGlpO7otGJcfEpbIaf9Z92BGUFOCsYw9dcCIaKpsILoKGvULJiZ Cw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kc8dbjxf2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Oct 2022 12:00:47 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29PC0Tnj012720; Tue, 25 Oct 2022 12:00:46 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3kc6y4jkt0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Oct 2022 12:00:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEL+vkln0pj8A84d+/cQ6I2uYI/FUZZ+slRpyTtI/8T/qOBhMiY5xZ+kgf75XaYY1zI4wq5ipfUMK21LSe1cYWnuMb7/vQ+nZQMnkixA297z/7+jXzCEGITDQNPzQjb3MUYKnoaajCbI1rLosXlvfVgs1F9Ef759JvbuNdEwCousEpoz6DcRPo5gexIL/Cx0t7TUlyqcFPrMjpuc5ia2K+wZgUeP/c4fTiFBBMSOGCYXR7UHlGKwjcPSjLKHOx3MaxJRLgkkHRk0vstFhw+QLe/MC5ZaZLIG+ZY7yQ5FXH0kWt6VKjtN2cnS2AnoJhlOTIq2zayTZjlMIY+LjVCT5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzOAvH5oz+QpIkMp5WnfnZl/EJu/+xbeiS0nj/5ZPdI=;
 b=jdY2Thl2xcB0oX8K/e4FYcrJlRFu0X5S5bw5Hn5Rt/7bpT6jgeJgg+5H0MDLf2Eos7slllC9U81tXtpfnLFXtkuxptC5nUZJLzHvtcrnatmEz6JoSiqrTWxobDtOIjXnyEluWzbholCxxsITHRAcW7YVP8KxKrrcUpJwn5Z9KhzOU26CZYXKqS2W3rKxFPdf4DBSV3QrrlS2a4ZzmCJkYy4cLJ6Kub0s13N4B/Csq9xoYSxOx+6dZtu1Hu4OERR/mEcuoQUVk7s5XtU4thMohtKUgjw24agm17cJK+tC4DoO71Mqt+gJyLzE7gjHfiL5aY13qI7MsWhLBFaHrLrP/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzOAvH5oz+QpIkMp5WnfnZl/EJu/+xbeiS0nj/5ZPdI=;
 b=UmIhtubDi+BQNqFL70kKFh61Qvnak5pH7SSw30KAY9nHeSJ4Ci8FGsxonzWrSTOVXcTldgkoCXkl1fuu1MXxZ1axxquICvfcsak1nKh/lgkwLlUZMx6SYiebWnKc+oBPrj6a6Eld0XzW+Dny6O4aqEW5BPT0ySSwLN+NI7nURBQ=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW5PR10MB5739.namprd10.prod.outlook.com
 (2603:10b6:303:19c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.27; Tue, 25 Oct
 2022 12:00:44 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec%4]) with mapi id 15.20.5676.031; Tue, 25 Oct 2022
 12:00:44 +0000
Date: Tue, 25 Oct 2022 15:00:33 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: peter.ujfalusi@linux.intel.com
Subject: [bug report] ASoC: SOF: ipc4-loader: Support for loading external
 libraries
Message-ID: <Y1fP4QN7kA16mYwI@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR2P278CA0007.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::13) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|MW5PR10MB5739:EE_
X-MS-Office365-Filtering-Correlation-Id: b085eb3c-ec64-4bbf-0495-08dab6808bbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +JizbHN0oX8h+D8PhseK4Lz3AhafGIP+yfDiF+pzkq2o8iXIUN4GcXbPa7xjVM4+p0JQ0zLJopCysBa/q/G0mN6Jci1/c+dr4dNJ2WFSgLB5j2H7Jlir0vfrJDZyIwsxMY9Ka6jMMKs+tSLXIRd9vDMtqpZvaQEeNyfsSJW1nlrEZzQ10DfvIuno+9zsHyd2oEjQsIwsLnmjr3eSm0/uiva3wDHqezGZPgX2MPpWiYNoXoDRd7e2IAudE3VR5mcTDvkfFU8jlvhZUllleooMoxR5Tn5njb+pJAOhxFjKYYMaRwPI+rM3YgQ9e6Rwpc9sjYiUuJa+IlPFvVSwo74jx4L3ifjkDFkqSTnryTAeZoFodpn7kDjEIXa7v9ZMKlmvVuvK2pgYqOuYJCNd9HadJ+g/juasOE9UI0LcgVp2FqbdnWpC48KMoM12MiKJTp3XdAxvWwXdhV3/ErkOOGeDe+IBGKaIycN2NchVPOPHR0kTREL+vqlyakFFKKFaLiwnD1qCBE+p5VJjN7bgPXslGLjEKzzzxY6lW008nA+iVtRMk8y5oDo1xnkhmmvK1ZgMHm4+e2DzD/Q/Gxl5NL9GYq+mMPwAebD6uxXeIZ6ygYXuefo+7wS8FlNuIKgkxRJJJWQumfx1PgCALWoTnOuUl6le6oONe7is3rm9b38rtlyXI5tEgFUtPIV/6iRVmw7qbZKilhQCjFF8Bt1Jst0Seg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199015)(83380400001)(86362001)(44832011)(5660300002)(38100700002)(186003)(8936002)(2906002)(41300700001)(66946007)(66476007)(6506007)(33716001)(6666004)(6916009)(26005)(316002)(4326008)(478600001)(6486002)(9686003)(66556008)(8676002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6dEY1kP3NJeQq6eBj4NT7AszF44Y4JCrLu9tAcgA4bMthKzrBlKZMIGatHol?=
 =?us-ascii?Q?y4rXtLrqLSjFufa3JnqQ4X4uX7Y+qAWI8EgaBm0CIndYOIU0SJJCZ58WGdqL?=
 =?us-ascii?Q?yNN7O4Nk6TVwqt95+TZySlR1NxCkEgIQV89CshYMw2i4aeTpo40VPPVC5x/m?=
 =?us-ascii?Q?JW6D64ztCTpjckZtH7fg+pY+aJQwoREyL1JNd7p+vPJP4c/RUXryBnLrj39P?=
 =?us-ascii?Q?eMG0VTgE7pWhDD1+QfCZAcRaoW3NKUanMWcTDPP2XafW6oYr4TPSJ6pTffWX?=
 =?us-ascii?Q?Eg2wNQwy8/Ma02JupC0IzmWYiTz+Sy+xkywQo/+VZe22aDZzvGrHc2naBPOb?=
 =?us-ascii?Q?JWGh+LAX88Aj2ulLgK0+PAFqVNNl47iTy8oUeryqzhYaNBDoML8tP0FUuU6J?=
 =?us-ascii?Q?gvB/HHqy93yr4VCK6+YWjUrFt4aFYZZtrc3+Us4w86zq5ulfY7NU5glozRCg?=
 =?us-ascii?Q?aVKK+BkvRQSOsqwRp92B7gLfst0AbMgQlAKVxmDWPMWAk5RbEsMg+b6QzAeQ?=
 =?us-ascii?Q?to3RJduAhxPwixVrgX3cBPSKv11hQGSFzzHs1+ZQTomf/63samaEKImEqqmq?=
 =?us-ascii?Q?nLFbVNVz2Bqi0hvYXVq11CQkggk8SFivxXGVmbj8ISlk1FESUhQDm0Qg42ZQ?=
 =?us-ascii?Q?Jn3lz72xE+tMR+wwb1f9gkqeVaixwDpdyQ73l1yyZqx3GjZZxG1K7ntmaS7J?=
 =?us-ascii?Q?cBbA2z79c8UtIXKP7/5oGX9HZ8ePWdfmtNl8f0evB1vOvJBPC4DF6lJ3Ko+y?=
 =?us-ascii?Q?2aCucPqD2M4YusVp3FPuxDvXkKGGwXPRpOcRK7ia/oqEW+Jiwqc78QPZei5X?=
 =?us-ascii?Q?Voud73m5mk2WvtdAAaqNRZj6fhnmkELxZznpAotg2A9HoThQs4E2MixJQQwy?=
 =?us-ascii?Q?JXku17OBMeRDIe+2yl9p/L3di+AmLfj0Iw5elVhyzUZrRy86o5AUThvGyHMw?=
 =?us-ascii?Q?FlRle2ziPNm9CsK5BTUvewUJvfIpltWFBUs6y4mhkzoNSZu1y2mKI+9Hh6K8?=
 =?us-ascii?Q?uKNloLnCHvAo1F5eQUWFYWx6sUOgUGQ6pkNrvNPe/9cg0pqWu9rDH0dVQfJz?=
 =?us-ascii?Q?bTWk7jFDddSXkqCr1hOdy/zqFftiw0i7DSfWB8OhD87fsyj1z68aH0XRBp9d?=
 =?us-ascii?Q?8djEaj/6tO1BwUhzf9qgm7tbpIzJXDhJ8qHic+ofdmYYXlZgdOBwVnuh0bMx?=
 =?us-ascii?Q?HzQJP29ZHXz5/FhFqe5UDun4S+tCayVdBo31tfTuR5qodKM+0XjaUXKr5WbT?=
 =?us-ascii?Q?i2k6uD6sV9hPmRQyhAkw/FNZZUy4lqNMLZXbnXYVkyonxKQ5DvovWkWDRoTk?=
 =?us-ascii?Q?NDvxYln6R+c7tEVqSSNP4h7Sz3glMIw3dtrDnYkfDjgp7F3nVHfQcr0vEmmW?=
 =?us-ascii?Q?tMUZmCr9XJp1IQFop0Jyvu8k04Qx3sw3jVbfbL+8Kf8F7lcB2b9dE23WlicP?=
 =?us-ascii?Q?GM5J3Alj1qm8gWeiIXvGiB2HC+myXTOt1w8GPOGt02fKXHgJe7lAxDQx9ikw?=
 =?us-ascii?Q?HPZ9ZGzzJzyT1GJ0Q/12pUKxTSmx6Y/foSYZCTS0BfI6iwg+FzZHq6nQoEPY?=
 =?us-ascii?Q?eZ/EEgtQZR3dYMC1Jvs3WTnNVmoh8B9v4gPRaF8VQuY1UzwEh0+0TMTeR4y7?=
 =?us-ascii?Q?7A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b085eb3c-ec64-4bbf-0495-08dab6808bbc
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 12:00:44.4489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hwVbOwldBO3lylxUNi+GllvxV72FAlaBknOnlIhWwuweNB2nW+t3PY7gWv9gdHR5WoOiJqKHIhnjpEtcdVSSAU2Hed/hvpBpwWB3GAkWmtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5739
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-25_05,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210250069
X-Proofpoint-ORIG-GUID: m7KEQZZiH37zjCO0eYrP8krhYyHuyUxL
X-Proofpoint-GUID: m7KEQZZiH37zjCO0eYrP8krhYyHuyUxL
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

Hello Peter Ujfalusi,

The patch 73c091a2fe96: "ASoC: SOF: ipc4-loader: Support for loading
external libraries" from Oct 20, 2022, leads to the following Smatch
static checker warning:

	sound/soc/sof/ipc4-loader.c:207 sof_ipc4_load_library_by_uuid()
	warn: 'payload_offset' unsigned <= 0

sound/soc/sof/ipc4-loader.c
    167 static int sof_ipc4_load_library_by_uuid(struct snd_sof_dev *sdev,
    168                                          unsigned long lib_id, const guid_t *uuid)
    169 {
    170         struct sof_ipc4_fw_data *ipc4_data = sdev->private;
    171         struct sof_ipc4_fw_library *fw_lib;
    172         const char *fw_filename;
    173         size_t payload_offset;
                ^^^^^^^^^^^^^^^^^^^^^

    174         int ret, i, err;
    175 
    176         if (!sdev->pdata->fw_lib_prefix) {
    177                 dev_err(sdev->dev,
    178                         "Library loading is not supported due to not set library path\n");
    179                 return -EINVAL;
    180         }
    181 
    182         if (!ipc4_data->load_library) {
    183                 dev_err(sdev->dev, "Library loading is not supported on this platform\n");
    184                 return -EOPNOTSUPP;
    185         }
    186 
    187         fw_lib = devm_kzalloc(sdev->dev, sizeof(*fw_lib), GFP_KERNEL);
    188         if (!fw_lib)
    189                 return -ENOMEM;
    190 
    191         fw_filename = kasprintf(GFP_KERNEL, "%s/%pUL.bin",
    192                                 sdev->pdata->fw_lib_prefix, uuid);
    193         if (!fw_filename) {
    194                 ret = -ENOMEM;
    195                 goto free_fw_lib;
    196         }
    197 
    198         ret = request_firmware(&fw_lib->sof_fw.fw, fw_filename, sdev->dev);
    199         if (ret < 0) {
    200                 dev_err(sdev->dev, "Library file '%s' is missing\n", fw_filename);
    201                 goto free_filename;
    202         } else {
    203                 dev_dbg(sdev->dev, "Library file '%s' loaded\n", fw_filename);
    204         }
    205 
    206         payload_offset = sof_ipc4_fw_parse_ext_man(sdev, fw_lib);
--> 207         if (payload_offset <= 0) {
                    ^^^^^^^^^^^^^^^^^^^
sof_ipc4_fw_parse_ext_man() returns negative error codes but as size_t.
It should just return int.  If it returns > INT_MAX that can't work on
32bit systems.

    208                 if (!payload_offset)
    209                         ret = -EINVAL;
    210                 else
    211                         ret = payload_offset;
    212 
    213                 goto release;
    214         }
    215 
    216         fw_lib->sof_fw.payload_offset = payload_offset;
    217         fw_lib->id = lib_id;
    218 
    219         /* Fix up the module ID numbers within the library */
    220         for (i = 0; i < fw_lib->num_modules; i++)
    221                 fw_lib->modules[i].man4_module_entry.id |= (lib_id << SOF_IPC4_MOD_LIB_ID_SHIFT);
    222 
    223         /*
    224          * Make sure that the DSP is booted and stays up while attempting the
    225          * loading the library for the first time
    226          */
    227         ret = pm_runtime_resume_and_get(sdev->dev);
    228         if (ret < 0 && ret != -EACCES) {
    229                 dev_err_ratelimited(sdev->dev, "%s: pm_runtime resume failed: %d\n",
    230                                     __func__, ret);
    231                 goto release;
    232         }
    233 
    234         ret = ipc4_data->load_library(sdev, fw_lib, false);
    235 
    236         pm_runtime_mark_last_busy(sdev->dev);
    237         err = pm_runtime_put_autosuspend(sdev->dev);
    238         if (err < 0)
    239                 dev_err_ratelimited(sdev->dev, "%s: pm_runtime idle failed: %d\n",
    240                                     __func__, err);
    241 
    242         if (ret)
    243                 goto release;
    244 
    245         ret = xa_insert(&ipc4_data->fw_lib_xa, lib_id, fw_lib, GFP_KERNEL);
    246         if (unlikely(ret))
    247                 goto release;
    248 
    249         kfree(fw_filename);
    250 
    251         return 0;
    252 
    253 release:
    254         release_firmware(fw_lib->sof_fw.fw);
    255         /* Allocated within sof_ipc4_fw_parse_ext_man() */
    256         devm_kfree(sdev->dev, fw_lib->modules);
    257 free_filename:
    258         kfree(fw_filename);
    259 free_fw_lib:
    260         devm_kfree(sdev->dev, fw_lib);
    261 
    262         return ret;
    263 }

regards,
dan carpenter
