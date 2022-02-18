Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFDD4BBC47
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Feb 2022 16:35:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEEA8170A;
	Fri, 18 Feb 2022 16:35:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEEA8170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645198552;
	bh=f7Lk/ls7s96JfGl61n7RupmPjJnRHS4n8sdGo9s+/zg=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PC28G64sn6/AOVS4YxHJeYRP7HnVz6Arydz5fr3SdGKaMHTg5jpZ5FF3+jp92fp9q
	 +k2hd+TfrQoYyseoz2maBC8gyzGTz+a3UO4d4uDJUzijPCI1wkrCEUBBhtkyzCxpIN
	 ClhvEn8T8fJMnDawWFZEHkMIbsZ9/vuFi/Yqf8yw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48F5CF800FF;
	Fri, 18 Feb 2022 16:34:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6BFFF8013C; Fri, 18 Feb 2022 16:34:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93F27F800CE
 for <alsa-devel@alsa-project.org>; Fri, 18 Feb 2022 16:34:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93F27F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="t73C5/Zo"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="rJqIHhPZ"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21IF65Gh029158; 
 Fri, 18 Feb 2022 15:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=bP8wrbz2vuLLEVdzFHoXfVRArUgGnt89Rj04ds8KMaQ=;
 b=t73C5/ZonMitt4jsjEIfVLDpQyDBJnvhNipegIMbzVzhdunKQGm8OWqFffIFRT0lPmcA
 rhgSY4uQctbFrJtFCn/NVjIcD75dzctRDW1O9IhADdVkn4nDFqWZ8jDM1AfgKs6myWbE
 2+AQX7Kl7ByueKlfColSBFpHKR56oLtLSQwOoYE4grtjx5TqMqWGIzq4zVwOJndl3fZq
 5c9cOVhh58hrP41x4664CXP/MKYBhIE+ysPtfNcz+NBQiksFSEQS5y1XMT5ZYkkkl7Fu
 QAqAYWeMBAaey8NSUFN20aqMkbxjKPpUNjWSGhr2NAUlVQnAHMkgmtzyqdJdESi2fA8g MA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8nkdsyxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 15:34:37 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21IFUWGb150717;
 Fri, 18 Feb 2022 15:34:36 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2042.outbound.protection.outlook.com [104.47.56.42])
 by userp3020.oracle.com with ESMTP id 3e8n4xpa34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 15:34:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAUfAiIQzIIeTST23yg++yNfinZEdE2a5Vb+CD9LzmfB/7+1EEMkrKxSvIdtTUs/12eX3GFV0nig6weGFTaGO1/efjUFPK5PCLPy3rdOQNYhZLlGJz5TC4z1CKfkpG2jhrbozvbONFf/IxvuqSqnECflZdo5vFtxIKOUb33IBdjLvBBnpbNXDx9QCxdNcHnXA2+XPguTN6r00pxu0IkTp+azD1IOQM9fJjQJ5UZSgjObzVEeF3qveXBYqMx9pvlossckyX50TZhlzpZYrQ/b2cst1vQ4o9UrjaMREtUq8zz3w6LJS0n//9tKHW5sHH6amSKrtoiLyy4ci6BwyGrLgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bP8wrbz2vuLLEVdzFHoXfVRArUgGnt89Rj04ds8KMaQ=;
 b=TBx8PTwgI+Pq7yp4H3Tv1wDl7zf0SRJuhGGr+bqNJPXWGxrKOkIfwOkzTu8q5rw1T0S31Cd4FjLeao7bYkNcCG5+SXd3d4MF0Wf2Hfx7MdEeHslDux0aphyv93JkjEhRN6AC70cyYlxjtAO3npSAxmJh1ntvLz8/kADpg0ypBF0sGG6wrQTL99mLuL2ziIFslkGXJye7J0RwFYM6jYcetUcwNKh3n8gTAcMGFGiYMJh5Q/vcMU2nSUs2JJSi4607S59gdgN/Njy1WzTaAeE2NKSFPHDb3NeHvKWpti0W5KeZPbPUeBQHyhyTRA7j+bisjf9rXNu4w+9g8nHVdu8OvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bP8wrbz2vuLLEVdzFHoXfVRArUgGnt89Rj04ds8KMaQ=;
 b=rJqIHhPZeSEd/GV+Lf+qYsZxYY5A/m2kqLw2MYn05eZD9RXiKIW3teQFIDU80aTuV1RJWHTmFwcEs0sdg0IBr4D8Kzyah02rEfqy2AFi3lDtOG681L11IGlLFgemlaBg1ceEbLe/mwNJj80cNH4RONJeILv8y7o9cxWswa4IrgU=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BLAPR10MB5028.namprd10.prod.outlook.com
 (2603:10b6:208:307::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Fri, 18 Feb
 2022 15:34:34 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%3]) with mapi id 15.20.4975.019; Fri, 18 Feb 2022
 15:34:34 +0000
Date: Fri, 18 Feb 2022 18:34:25 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: quic_srivasam@quicinc.com
Subject: [bug report] ASoC: codec: wcd938x: Add switch control for selecting
 CTIA/OMTP Headset
Message-ID: <20220218153425.GB4392@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0179.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::19) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52ad7cda-8fcc-4b31-f033-08d9f2f429d0
X-MS-TrafficTypeDiagnostic: BLAPR10MB5028:EE_
X-Microsoft-Antispam-PRVS: <BLAPR10MB502858ACD98CAA2A1A2E20DC8E379@BLAPR10MB5028.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oAbu1oQ6QHN3Q8U96FnZCZOrIWJtfMBk1Q7YohpznX+t3hYMksvYapp8Kp2vWbyG5lUpJZJxAB8AR90aGEtI7XepuGSwE+w6QT7OaAp6xN4KqpYeL9hg8UHvJTr5Do3/ZTpuMp9vxK4kz8S9mlOAyeBQWSvU9n24ex01T9vRdRNr4O7hqKOVJrdL50yqRjQjysNM7esMl3gudqwvtb1mXvJZ4IARo95XghWogAvbD10UfOSLk3JZkYlfRoARhAJRGJUTZToXOo5dSCnjmLFS3BhhNbTqc5bYCUMpR1s7a4DSQzLG87NBMBMrNX+KORohxIFSmG0RZIzlhwMezC+HWjogSHkR/KNvrJpReTTBivVhMfzRUGJOPSZH1MALjr7PqPlgs3F4Rn6SeV4uTuIiw6o92yqsucRELJQodLeusE886CPFGHfDdgwVhWRlYBAH9wP0i6kJ8mQQuvM+af+735lxgopJLcPCcbomZ5qIZ7UGzOHu6fpCzDb0KH90ZnXABk5BuUmEYuGhRWN1dGqpVhvWZHK1qyoZdFab/K12RMO1/m36k4EOPOTdJE4ZDqbtAH0voZkSEcfhr+gM9xY/N2YxAK0eSfdPtzqLlvqfXM8Kz5T3VVY1+c9Zk/nqeNo3LkM8PcTUK2JO6ZDk/dxACdxWjxZgOsvF6zOl1X3rjll89WapBGcrsiBAzQq4t1MeDlQ4yQIyDZu6Igc0Ie9FdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(83380400001)(186003)(66476007)(33656002)(26005)(52116002)(2906002)(9686003)(38350700002)(1076003)(38100700002)(6506007)(6512007)(6666004)(4744005)(8936002)(44832011)(5660300002)(86362001)(6486002)(508600001)(33716001)(8676002)(6916009)(316002)(4326008)(66556008)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TnTMAv/McV7qK6r730l6Y4AX0SrjWV9GpIXJt6v2t6YmephpuGDnJimEvE98?=
 =?us-ascii?Q?QIYMIYknGQu1SqaQSfwKkAPN2MYbLjDyZl0y9qlCvhJedkE8uDTe8AGiy93j?=
 =?us-ascii?Q?BFclpVLnG9oEcBZTNECquZojJ9axfHTab6/0SJOiw6x0B4AlH/yLprLxePo6?=
 =?us-ascii?Q?C3xe3UKOuIu91RyrVUnxd8YpFhoZ3B8AdumfUBSJBIJftEiMTiupvmCHCzIj?=
 =?us-ascii?Q?eud4jEiN2ixWYXTvU5FDT8FPHKtjzby8vekx6kzAIZr8x6Hjr9fk7rgZ1USk?=
 =?us-ascii?Q?oPG7bH+c4NOj9g8HoBSH+iYJUnUewk8kJz14DclJdbz93GX6jbLoefgC3DqB?=
 =?us-ascii?Q?ujQZXnbg7IfJuhYLPTJgcED1IbgsqGZPddLqwj+6Zol8LTZp5SL645YVYIkB?=
 =?us-ascii?Q?dSY9hAxFpW9cbPm8NGITpp6jTArcGQu8S6bg4oOzJFKyWTJWi96VV3mfuXL+?=
 =?us-ascii?Q?e0kuOQWfXCGE/TFuzmaLoSgo2tV7GH3feheKM0HzV1I0tZIRqmREIZxBwJRr?=
 =?us-ascii?Q?uSjI3XHkz+KYSqOE91HiI0QY9huV0P80tIxQcx3pPNDS30IPzkRwpokGCWDJ?=
 =?us-ascii?Q?O7V+rZcXIRWTZ47CclVzewEnKjrFUN6vj6etyciprYNIxAulMJPYlrR9wsn9?=
 =?us-ascii?Q?80cuzv1zl13QSEMdhQEPMACQ03kwOhQyvKqc4o2P1rVA2ys71eihcz4pGLM3?=
 =?us-ascii?Q?HtYI0iJuQ9dSkMrcu5eOJJc5V5AVB8eiPsUICbFCKWWQUiVM28yYk04QNW5+?=
 =?us-ascii?Q?+CsZ+oXb6b+0yBQKRkwViI+fV3+3aC0MvQsb64T8op/Nk42Zjp5wK6jN2D+g?=
 =?us-ascii?Q?YgAR848BlK5dy3289bDHqCLSHEGUrEBoo4kPD/Yuzz0lvlj7/O86adyv540+?=
 =?us-ascii?Q?VtcBcODLfe82GT3H1RyVKd/lRfxVfYMih8B3/A/lXJf4S203lMjrC0AAeUFm?=
 =?us-ascii?Q?iZ/1vm5rYi2IuwPXnICcOtbJQzV60UghvvxTurx/A+/1bne19z5/OOzaRJ4Y?=
 =?us-ascii?Q?4BqBRMK9y1fowFmXakkRvxHtC/K3FlpNqPHUf10EGHwx200lTf303BI9rvOS?=
 =?us-ascii?Q?geonLiIagof/AR33wmZY43Og8CmDFnztv600tgsLCFTLc/rByYxe5W/CzQUm?=
 =?us-ascii?Q?x0X5aKlWptLcOO7PrNz4qUUgl//TkNkByVW+467l3PTDtqSCOvo3qDsKHgwg?=
 =?us-ascii?Q?b931x9QaSMr9ZMZ3AuNard4Hl2G3XLu81eRSUUKjjxbRoO917RFa3veN+JT5?=
 =?us-ascii?Q?zJHKKRYswgligY/LSClxk12Lic4QK9DQq7BD7N28s+laN+t871YEXPh8XfPh?=
 =?us-ascii?Q?cQAF7xaZbL7OAufTAZPDycbH/UfsDKLreq/raz6K1mfQg6Pnem0P8/uUfVOz?=
 =?us-ascii?Q?7dr7b5Grh99usnfh19lyFuxwIuSTPd8KD0YAeHeBmlcdVC3f3VQuzaA/H181?=
 =?us-ascii?Q?Syi7bEufDmAL+Jvj3WSQhpnvYJ5nHie/pP8GiZYP2vw5xMsSQWDD/WPYmxwr?=
 =?us-ascii?Q?uDhsFrWi8diS1qhr7K+y/7p/EQXB3SHbvwhl81G0jw6v2HVzPxe8nOY42V/B?=
 =?us-ascii?Q?Hm8WLfVoPetG/OWHN322VsE2TF+JH3KKJ0VkeIoxbpJQLvVYkB50Q1KyugzL?=
 =?us-ascii?Q?WPfM16FdCnTKw9v9MmN7ZV7YnlkjnX3geUeB/AYsi19urx9+nWBglgbW/Oh0?=
 =?us-ascii?Q?ORLS4A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ad7cda-8fcc-4b31-f033-08d9f2f429d0
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 15:34:34.0261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a7L3w3L3alJZ3MwXJVNUPVvGRKqb8EAqbzymwNTUGiOULVQCJJnz9si3Tcizmy5wNSvFdcmPizMfolvVKhn1vsxFbsmU4s/Sdpq0TQhIgis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5028
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10261
 signatures=677564
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxlogscore=845 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202180100
X-Proofpoint-ORIG-GUID: v_aVV1esAHu_0qydxystI1Y9CzS6pzpp
X-Proofpoint-GUID: v_aVV1esAHu_0qydxystI1Y9CzS6pzpp
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

Hello Srinivasa Rao Mandadapu,

This is a semi-automatic email about new static checker warnings.

The patch 013cc2aea0f6: "ASoC: codec: wcd938x: Add switch control for
selecting CTIA/OMTP Headset" from Feb 12, 2022, leads to the
following Smatch complaint:

    sound/soc/codecs/wcd938x.c:4210 wcd938x_swap_gnd_mic()
    error: we previously assumed 'component' could be null (see line 4209)

sound/soc/codecs/wcd938x.c
  4203        static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component, bool active)
  4204        {
  4205                int value;
  4206
  4207                struct wcd938x_priv *wcd938x;
  4208
  4209                if (!component) {
                           ^^^^^^^^^
Check for NULL.

  4210                        dev_err(component->dev, "%s component is NULL\n", __func__);
                                      ^^^^^^^^^^^^^^
NULL Dereference.  But can it really be NULL?

  4211                        return false;
  4212                }
  4213

regards,
dan carpenter
