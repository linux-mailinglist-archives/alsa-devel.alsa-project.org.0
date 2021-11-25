Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CCA45DCCD
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 16:01:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27D5A18D4;
	Thu, 25 Nov 2021 16:00:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27D5A18D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637852493;
	bh=IJAAmmbLzbcpGHPq4zUS3fnJ+mF34fUrvQp6/Bmf9IE=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dx6QoVV4c0neeJmhuYW0SgbMoVIQtxK3EjkhZ4b+WxkFWumelENbw5wSGFA8XJfkG
	 zoPF/NkGZDIHM0pzBOa3ITxQZHo9OoGGjRgc69k2OOTHF8o4kFb5KhGaZ2n3vcUamE
	 UQ3gx7nwn2AHJeNxta62Mf1XsfR+8Mtp/5iMH0KI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 934F6F804AB;
	Thu, 25 Nov 2021 16:00:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F4114F8049E; Thu, 25 Nov 2021 16:00:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MSGID_FROM_MTA_HEADER, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E02CEF80302
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 16:00:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E02CEF80302
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="rGvH3ma7"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="ZJfGCLUm"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1APDT0gg005324; 
 Thu, 25 Nov 2021 15:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=hVr3/piVDHzOD7P+zt5RbN5/t1UMhl0K0gwqbn3Xipo=;
 b=rGvH3ma76oFOhsUpbQbdqN04H+u85m7T8CdP7bM4zsfhoO3JKGKQqq9lDiD1+6XATYN/
 F363TAlWpchnV8zfWkeojNE0RDrqEfmjFrI8OtfrFdoqOwjAFERgYHiNxXJbOCjY1TNt
 SwgzrYcghpKAzil/aBmXyfDLqK6NXz7uDsiotkHZ5vLT/OXIt2gtpceNyeoHAJe86tbu
 Zz7MX/+d4TQUBbVUc8MTJw7YnIlqcQRkYspYRn6QEjEnlpAa5A98ddZlSm69cAlQGnSR
 X6l9E2cjuJoa9K5z0pnsJc3Mq5HLPHjHhM4u+UuxplKo2OIvbRqSaYeW3h8zO855j/Mb Hw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3chk007nkm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Nov 2021 15:00:06 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1APExGYE012996;
 Thu, 25 Nov 2021 15:00:04 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by userp3030.oracle.com with ESMTP id 3cep53q3e1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Nov 2021 15:00:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UX6d1F6gGBl4Gn2xH4IdERml1T9Om8BSt7/payPChBo0ZP+Dn7WCpmz+zw09JwhsUeryqD5JnPp+lfJ1Db7lXtWAkVzBm5NUBb/ga2FfK8aULpXCFVAaffxA7ZEbL7/HLgWvRYnsDHg7TKJm989qxWFnVAXlRW6GkPvy0PZFrwziHeqNDadOKPcONBfnQU+O6xV+D0YepgNtiboAnsRoYT8bd+slTO6NiTie5W4qVFa57eiInGI05XIx4YNtkSQ55941wrcR+OsRY2jGYS5Zd/kWLmx0L220PAh9M1UgbJ3OwN7SiohrucySbROfVqt+TEPiMFUeKyN2cClztxJvXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVr3/piVDHzOD7P+zt5RbN5/t1UMhl0K0gwqbn3Xipo=;
 b=lFRHpEDJI8pB+Erl33UztxcTrcNo89HsCnROVeskWJHI9NzqiNPNHfdKe/WELnXzVZWqUaKSCbKnMhG+f3HZIl5RGsEkvNl9sMVseMz1TR+bqlvEGWzVgrJAN3gml/jZVwiNLwPecVQ1h5aGOMrXy7CO9ZxDduSZEQRAIRT4F6iyutPl9rebJTYjFFLOASoL5D3xfLRQuace8IwRRVtJlcwauWlLoes00Dh0Z042r+b7qGjE0mdHmid0r/FUrhUolLFUAEM8tYkOoG5xtQU5U48//Tq3pua8kyn2B5Md4nN9yf3jEgAmN5kNP5BsEECAkn+T3C8Lz1/wEZ2F4lhPvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVr3/piVDHzOD7P+zt5RbN5/t1UMhl0K0gwqbn3Xipo=;
 b=ZJfGCLUmIZmIeOz0j2Ka30N3Q3ZzHfMZY6Ay//KuW9Oe89/MSqRvZd325t8I6WHoBiIHZWrsFwNnuZRlj40ypnJjKuOfTywXPZoeqrpULHJSBwZPzkzOtl37vfSIugbqC2/+mdfgQZ/8KBcBx+GA8aPc0tmo+1JfNnKdHMcT1Qg=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4721.namprd10.prod.outlook.com
 (2603:10b6:303:9b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Thu, 25 Nov
 2021 15:00:02 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4734.022; Thu, 25 Nov 2021
 15:00:02 +0000
Date: Thu, 25 Nov 2021 17:59:52 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Vijendar.Mukunda@amd.com
Subject: [bug report] ASoC: amd: add vangogh machine driver
Message-ID: <20211125145952.GA14210@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0032.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::19) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0032.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19 via Frontend
 Transport; Thu, 25 Nov 2021 15:00:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f157b472-5738-49a3-8b0d-08d9b02441d7
X-MS-TrafficTypeDiagnostic: CO1PR10MB4721:
X-Microsoft-Antispam-PRVS: <CO1PR10MB4721330164613C57B503BE3B8E629@CO1PR10MB4721.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wbXWw5QBA+Ml0eGw0/qclhWNh94Ho8gm0SKb9ruvjEMRXYbGiA4WbjsV5GZMv6vDcr3V6qBFexTY0Z1hkzxbI1Bt+dhmZhzAiRt5jjFj1SNWrCynddyZXZoQQQqgNzCKlnx6bVF3a4RbbkpdIBW5fw8bRqtqM02U3PqDkj1sSIoNcTRONhvvHe0REA1OOmAWK1+aXQ012IgvPsexFoAP+DQaclNzaMxwoDsVOo2oALYvDTVCPKdSukY6SidUgOSom1xeuYqhfwJey4+TBO6tr56fX8LS1pCmR8QrHQjUIkpom2tkLaaFF1LVmnLwrP3o+Njbi5L0SS8nOq0ha4XsJUG2RvdEl0LVL6SiGF+CDYU8SW3eK9Vzt2Zif+VC9aosAYLwMxbhdSZavBQwf1EAFuo+tAwApKs7KE9wx28XvRNoY60NT57Ci+4nx/Zux0sX8lpQuC6lmB13NW5Mo58mhAnE+DNNcoNlcHAU8uWWuPZxcj0otlFTA+Kz0uTFZPVYmrFZyo6wXWg2JhaQW2u3RQh47Ma2dDJJVWYe5h/V9YLjoC5aT1FOHV5ixnASa8ZxETMpX99yeMFKdfn7Hhoh32WGMPlPqNMWaIFCa65+KAOmNBwzg5xTCXhugbZOA4RDjCPzeTkAQ8UF3RiGb49c9e+v7KkWY5i58evoF4ZjdGJsToGTBoNtxQIjU4ZpFKbpWnSl3zN/jDBs/UgVm1R7Sg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(55016003)(38350700002)(4326008)(956004)(38100700002)(6496006)(9576002)(86362001)(508600001)(52116002)(66476007)(44832011)(83380400001)(6666004)(186003)(1076003)(6916009)(8936002)(33656002)(9686003)(8676002)(66556008)(5660300002)(316002)(33716001)(66946007)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sVNmWT80G/wQb2251rY1W0zIjQyqzRqadRx4Mn466oj9kce9prAVMUbF6cFm?=
 =?us-ascii?Q?aZP4lZDIPtuws3OcrSWGHwYDnfF62Z/2ONbQQJkrjrkDVWz8RQKgNL7wYTpu?=
 =?us-ascii?Q?A7tkJSa2u1PHZTlN+lpr7kOgtAqKVFP/nlS+xnssW84jFwCt9MNLE8q7f3zF?=
 =?us-ascii?Q?/NNEmqqvh/3SZ6lXkeR/bIIFya+bFD6l9C3+9QLdKHBZ2AMceXMMPYkvV4YS?=
 =?us-ascii?Q?IpiC8f96pQ12Kwvj7lRd1IV4w/qYZY7eAHEqBt6zCvzewY26JqO/84ZgTwT6?=
 =?us-ascii?Q?5yOH7hbZvT5H7LO4UGWFJRFDorJ/wOXbdyy09q9Ufb6xfCRcSFFcQraRm5G7?=
 =?us-ascii?Q?1FKBWBBaT4GD6fj/WxeDlsV+7ImAfn7jGjFuQnijaawQzzpmke2tNPXLh/fo?=
 =?us-ascii?Q?3b4rGuhVm2SDM/c019n3q/JcSE4dJIj15W2FJwDkWBxAjFrJInJvv7sO+Kok?=
 =?us-ascii?Q?bpQOvfeL+ZfK/3DoKwkDxKzlrPrQooT7x9K2bWHcAQ5SRVTbONOMMba6uSGa?=
 =?us-ascii?Q?EwgOPMwOmCdzGlEtElSkoND5rrC38tw1+5KETtzEB5jPwFxFTJ/OKZdRTEoH?=
 =?us-ascii?Q?5L+LJ3RQudOr40H9o5J5z4AkrWCZ7vCtqtuLdBbUxeV6PFKAPs9D/bM9b0Dz?=
 =?us-ascii?Q?nTFSGKQn+r9+E+oDjogi6XYDABy2AsUr0+sqd53HO8iGubNhy8uGvccz+ToR?=
 =?us-ascii?Q?bLB5BRXE257N41W4IrhAo62tXbOvJzI3mwfjzIzshi+p6ZJu0W5CS8TQRZmq?=
 =?us-ascii?Q?ms6iuqfKYYDl6IA5gDqldZLAXTslovatIa0UoKwYXNA7DOOkW911iqDc4ZO5?=
 =?us-ascii?Q?t1FBU5Jscc6idLClisYcpCNZbKZc1CnifH42FEM4QE6e7jtsxe0InEKvtcm9?=
 =?us-ascii?Q?R0/xsRWFCLoRjB+u1HzBw3nbfiJ6gN4Swc5vpGCQU2JpUg1r5UJg3snmpOvX?=
 =?us-ascii?Q?qL6z8ZuR++5a1pHA7mVeTtMHkFsG45cOREQVMVbhPBIjrxV8kNtDSmTw9Isi?=
 =?us-ascii?Q?e0p2u7fbjpqZ05ov3SO02+3FDcKH/Ku41bZ037jCyFdzV2CX6m5qb+HUUafp?=
 =?us-ascii?Q?OMkD5zjXSiPWxTwEAPJDlqPr2p8YU0lQtqjeLg44sfM34YkuNJVHyKEjJIav?=
 =?us-ascii?Q?KoTklLflYY92LlZDTzQuEFOAtyHonM4tp5JxH+M4vCtkBe+VP94SguchNA8v?=
 =?us-ascii?Q?1NRmokzsY/Q2sFRjiKndfLUBfb6VV+CjBIiqu4LCMYzSflNVJMvAAKcD2JHd?=
 =?us-ascii?Q?V9+lfvfEp0eTe4Gy7KhwA40lAZzSb7vc+lB6BWiW1hMYSMKDiEw2RWY2Yg3D?=
 =?us-ascii?Q?7KfA/VPC7+SgVsz8T5dYdGUON0K4mY53Io7n3ngEqRCiIn+ig/4ZkMFuNGa4?=
 =?us-ascii?Q?UmvumsvgZikE9ZhUNf5VNYx3wg6umlC3pP52csraZeuiIt3+TEGBJRutCNjz?=
 =?us-ascii?Q?VFJ5nkMSOFxi0N8llkJIC2yZzumetsnSBM/ISHemQ2s8FXi9qIFZulj73ciK?=
 =?us-ascii?Q?JsL85UdrU/A+NfqTGZEyiFnPY5l44aI59PkeMVm1r6CqgJY6JKMHLyeSHNWL?=
 =?us-ascii?Q?LOkONVBIOik7oVhUlEOaXHk9012J8b3KWG7dFYhjFkDNtyVjZCMxH8iPuKiq?=
 =?us-ascii?Q?Fl7EJdQjnME1lJFfYK1ueDvqSOToNkEJMYc/qGdaPdNBLEy5E2U8TAwjK/3U?=
 =?us-ascii?Q?czrDHKqWiIxvyPU/HJknllTIIfg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f157b472-5738-49a3-8b0d-08d9b02441d7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 15:00:02.3059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZIamWSFhlWUOUm26k9xt5lMqVqrSFbK55FHFpPDtSoGdEuVu8hz7Bdh/leFEye1SKPGxc6r5NsP8dPxJHjNgzLmqBmI9Shef4WI6+n6+z/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4721
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10179
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111250083
X-Proofpoint-ORIG-GUID: dZp8C8rfTIHiuzwdIZEjm_d_R5t2kK_Q
X-Proofpoint-GUID: dZp8C8rfTIHiuzwdIZEjm_d_R5t2kK_Q
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

Hello Vijendar Mukunda,

The patch 34a0094b9ff7: "ASoC: amd: add vangogh machine driver" from
Oct 14, 2021, leads to the following Smatch static checker warning:

	sound/soc/amd/vangogh/acp5x-mach.c:190 acp5x_cs35l41_hw_params()
	error: uninitialized symbol 'ret'.

sound/soc/amd/vangogh/acp5x-mach.c
    158 static int acp5x_cs35l41_hw_params(struct snd_pcm_substream *substream,
    159                                    struct snd_pcm_hw_params *params)
    160 {
    161         struct snd_soc_pcm_runtime *rtd = substream->private_data;
    162         struct snd_soc_card *card = rtd->card;
    163         struct snd_soc_dai *codec_dai;
    164         int ret, i;
    165         unsigned int num_codecs = rtd->num_codecs;
    166         unsigned int bclk_val;
    167 
    168         for (i = 0; i < num_codecs; i++) {
    169                 codec_dai = asoc_rtd_to_codec(rtd, i);
    170                 if ((strcmp(codec_dai->name, "spi-VLV1776:00") == 0) ||
    171                     (strcmp(codec_dai->name, "spi-VLV1776:01") == 0)) {

How positive are we that we're always going to find one of these codecs?
Smatch is worried we might not find them.

    172                         switch (params_rate(params)) {
    173                         case 48000:
    174                                 bclk_val = 1536000;
    175                                 break;
    176                         default:
    177                                 dev_err(card->dev, "Invalid Samplerate:0x%x\n",
    178                                         params_rate(params));
    179                                 return -EINVAL;
    180                         }
    181                         ret = snd_soc_component_set_sysclk(codec_dai->component,
    182                                                            0, 0, bclk_val, SND_SOC_CLOCK_IN);
    183                         if (ret < 0) {
    184                                 dev_err(card->dev, "failed to set sysclk for CS35l41 dai\n");
    185                                 return ret;
    186                         }
    187                 }
    188         }
    189 
--> 190         return ret;
                ^^^^^^^^^^
Also it's a bit more readable to "return 0;" if we know this is a
success path.

    191 }

regards,
dan carpenter
