Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D64BA5685A4
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 12:33:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D89B1671;
	Wed,  6 Jul 2022 12:32:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D89B1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657103601;
	bh=45R2S5SOw0Rxoct7Abz4Ep93mQxFNgzRSaYeLb4RItU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D76UqFJGoiuiTGVn520dRpaqFsDQlk2Hko+L/TB6NPFoRrl7AuRQ/BMlNTejGh2L5
	 39vrcUmNL9Kwg5B2nG2RTgsXzxQnJ3Mdg8jPF9zI7w8R8ePQd6S7o43UCWm3Z3x+fz
	 ++B8TEdV848XjM6OOQ1R1PevvythOZPpfrM/P55A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1BE3F8016B;
	Wed,  6 Jul 2022 12:32:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B21D9F8023A; Wed,  6 Jul 2022 12:32:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15178F8016B;
 Wed,  6 Jul 2022 12:32:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15178F8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="uYARyA/A"; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.b="b2MwWMq9"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2668REHZ003474;
 Wed, 6 Jul 2022 10:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2021-07-09;
 bh=1fgcFvpK+Ik7QXdp66SeW6EojyCLOUgyQ90Nu/GM+hY=;
 b=uYARyA/AAMi+WUbIT257Eha93BQoA6nruPNSY/EWk+sA4l7u3ebv9QgbI2xenHTR954N
 bZf59nF3cLAPJdXI6/mrDnrVukM8HZEYkOxhZpBEoJRWo26sEsIiYQIDOxe4tUerFZ2v
 W0rEm4YoKCrbO1KhaTTw7YIl1wm8Jc7TRfJ1V1zHdyymlr1oN0OcKMkfaQKeG1/9kYrK
 PPVUSCeLdbTd/qK94rjD2zFbepm/2WlZliVRfSabk3e5qnG0t4l1N+q9Uly02jSriAhd
 yxt3V6h+k1MHzFq/t+hM6PoA8MYvKfMNhMH+GXA56DYN0zwKVuqMnf6+GmOxUBSQcOMt 3w== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4uby9k61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jul 2022 10:32:09 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 266AW0AA022434; Wed, 6 Jul 2022 10:32:08 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h4ud7xjrb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jul 2022 10:32:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igAKTOU8UFrh1/Dzl3BJEgzH8ntRSiGFKxBhHefpq2iKYHgBtVJhdYYTyxb0sM92EsfszB74CiQlDRFX/UxCNFc8cugIgsnuQwJsGcBel2pg8bkpCefPRt7YoqWBS2CHmFtYPpCZkNlSozB6bMf0NvXD9qlWZC9GQkdFToSFZJMISozxW4wtm71wLOZayh5HRI6Ig/Ph3Kl6X0M370DV6q3A1tvzmYaI+j/qN69RyzcF7Zdc1A5bOb+1gikELl4KQypw3TUx1/+cqpXSxC9Nh9w33aGXH8WaFJFaajKPyJ5gzoA96rMjm0CK5/fGyR8NrFLhBTiSiS9TcdlRb5lPZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLfjVScR6KY8uZ9ucZdLSLgmApJlZwr36AQA6ktazhQ=;
 b=AdnKGeT+Iu3nPZvSwiKgvnY1o+vv/1B+/Jk5mbT/x4SB0GGOcJJz5iU9JI5sRmFAGmHA1gJgXgKJ3rGx38/SPwGmncqfOGwFgbVsX714/7m4N/WN+7KJ0d1BspXx1BQHPribK7FLF7JdwLl5e/nDSBMcbrcynMVaZjfa6/Z5rdyHZRn4nNezJCXB0iYWdPhS2gGP44NvAunPFsiwRFaiL0NOULu2unUUxudl0c44lgw4/KeG5cYTlbgK4M/hbqvAmZYLTgZXT5n76fiMX21fkdG1LENQau4BzsCLAGw4Q3l9ZGhipcvrIcUL3X1nGYtVzcQOBRm3UAYxDgVPjDO8cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLfjVScR6KY8uZ9ucZdLSLgmApJlZwr36AQA6ktazhQ=;
 b=b2MwWMq9uLuEPIqoGqNEwjS6qcseDMXQqAMPmiEn3PTsBjt8upyVX+fVeHaAdL92vjz9oWKja2vHUPQCz60YySIhkHNh9/wfKvJgNF9YpOUfa2+e6amaMdpovxMWXQtY6eYQn1yVsgJpCCXnbz6e0P27RIhQypZC0iUSL6MZkQE=
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32) by DM6PR10MB4043.namprd10.prod.outlook.com
 (2603:10b6:5:1d5::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 6 Jul
 2022 10:32:05 +0000
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::e038:d513:8896:32f4]) by CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::e038:d513:8896:32f4%6]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 10:32:05 +0000
Date: Wed, 6 Jul 2022 13:31:39 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: sof-client-probes: fix error codes in
 sof_probes_compr_copy()
Message-ID: <20220706103139.GB2316@kadam>
References: <YsU4dYXYYVsfs92J@kili>
 <26db7e60-51d1-444a-7620-8225239ad7bf@linux.intel.com>
 <20220706102159.GC2338@kadam>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220706102159.GC2338@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0013.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::25)
 To CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a707a70-8234-4070-622a-08da5f3ac352
X-MS-TrafficTypeDiagnostic: DM6PR10MB4043:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: npgo2kG1WpOpoM/skvbsMZbfQDpH03R7+5WStXsov3Q+m5acfqJkNtYGrNRq4+xVHUz3ih+b92hPNVThEx+K0bISfWwg0u6ZVMP66nWKMpWdYBGuZYxYglPYzkIzRe7rwbu6b3CFCDfncFD8y5rOR/giaz/tt0m9EdwjRIi9hmHBVlyH3BLUtr6EoBX67z74+c7wE7KblxSpUxvjTTCtue737rN3cOJz3Y2Al/waG3TFSaQcMEP2nXNT6T7vIFeWdJaFpwkT0MlgNP7rtSzY7tbFnUlby7aVQ260V68peqPZlErf9eVydZOXxlwt5VAEd8IammE6A+4Ipk8lXBQhQVG61znUVRnE6BUuevblNZh4LT6uKa1747TapDSR7UUWAknmKmhWbCk5FjjEujecauVVBr4QRgdEX872E+v62si6rl477DkVgW8D5FEmvrC+J+3two+/dJ84GY8QMverccJBVrArNHTOWeFmX5NZ7TXC4Qad87jAsa4QyECyC3Gyrjo957nm/BpUmEsoXCGL9Wgn2TBAWn6PKZwzbMa7J3LItyl2YYK8ROlAV7I5Pwn2BGk6piS4ZMQREhx2I74fFUPkXt2E0/pXx0VGLhDaX0HmWe+o3Q7D9uoD2W+fXICzQ5e+0+U/sUe3gBFRE3shxPjwfrPBJ/q3sYkJuN7tQAknpIhU2c4AYttb3OYd2b/n95kY2kAyxCkeaE5DvzzHQxbSqhHE7Kl4tOVPLiAAX/p407I8wtcT4jBLUckEZ+PkI/D7L/VJ4LIdmABJ9+zW7nSpQKYyhVwSewciaVkNxkI+14MHOWg/334yjrAYZXQA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1001MB2358.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(136003)(346002)(376002)(396003)(39860400002)(366004)(8936002)(9686003)(6512007)(26005)(4326008)(8676002)(66476007)(66556008)(66946007)(478600001)(7416002)(86362001)(33656002)(6916009)(54906003)(5660300002)(316002)(6666004)(2906002)(53546011)(52116002)(41300700001)(6506007)(44832011)(186003)(33716001)(66574015)(6486002)(1076003)(38350700002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?MSd8dVgScwD1LeuULyym5AEdChhkJWwV+m2a80Bl7GiJmwy0zGNIGMWVCG?=
 =?iso-8859-1?Q?zN/soWMGDfW57RQrksZmwEWf1daRo7E0r4TIQKNwM+vTKvAGIwkAodwwQr?=
 =?iso-8859-1?Q?tEeNyvw3LV8JXzMnR0PkD2hkNvUk153wu+NrPk52BC6muDP6hw4WBO0FO2?=
 =?iso-8859-1?Q?7o9yOLcqnNwmQcvNZnYw08kIXkPquxCedt+yr2VOtyWCs/m8AeWG9jzK1v?=
 =?iso-8859-1?Q?cS2qkxsQL4JaTQWM+b/UWKdrV1CLuKZVHkCV74l91KIAkymKZ2NT5ed+wu?=
 =?iso-8859-1?Q?G5bQ4TNdR8vbUqRIM5lEwA4i8VuHJsPxIAURBI/oxAFjMNlxOV1QQO9h16?=
 =?iso-8859-1?Q?fJsxQy+A6Uo4VUWf+kxmtj38Jdn5ADU1ky3fu1PMc/dSXK03YmSAvXAAQZ?=
 =?iso-8859-1?Q?VwtwbNh9c1zu0ZsnfmQiqT2c7HVWQ2O/3oru4CmoG53xidTqwmi5iRTZib?=
 =?iso-8859-1?Q?bRLT3VRxM/v3KZyCSxUFpdAdP9pPCdKeok3WlChVJqlAlN9fJf4EmfEmmy?=
 =?iso-8859-1?Q?svbcloqBhrGY+wwv+JFnSlvNvdpYQ2wacdcsEc5+0yATbD7OgHi+qfO/ys?=
 =?iso-8859-1?Q?Sg8alGepw2S0LKXM8eqPxI1PQNlqWziOhmKMnx+tYwaUsSSm6cmLA/SHsw?=
 =?iso-8859-1?Q?WKkWeB2mBdOYdbBf1dMF5obA+e31fb4EpoH4AdEEV7gnhje6cBWKcgnn+W?=
 =?iso-8859-1?Q?dT5/i/5hap+FQd04XMoWyyfADO9sF9jAtSCw2zSoqWx7CiToZeYXA0G2oU?=
 =?iso-8859-1?Q?jWjnh7giMW8j/308LGSMPRjVg5b2+Vw/5KZkydLC1JbwUVaIHuaMXJn6N/?=
 =?iso-8859-1?Q?6UAjz/RCIFE3dqPLqJ+SzBtgQZ+gl10XLT9W64ztME2bEhsQzJYm/+qdWw?=
 =?iso-8859-1?Q?PhViURlJ6+t73I9Z/aeEC9rB83jcttMRX7zu2bFQvZ83CHg/m6TVIvsXJS?=
 =?iso-8859-1?Q?YNTmdDJG8zGWmGWce6A7XGMHEoVI38II1qym/BwT8c4xpwRzq1fWTNIS8q?=
 =?iso-8859-1?Q?MYaw5EdOOi4xZNm1r6ZRGGqvDVow0lh2Vv/jIrYzK406GW8QlnTbL4qm1c?=
 =?iso-8859-1?Q?uXpk7r/IsZpcx2biLA74kV+lmB8TS5cdEfZBBDBDrJw3L2VoHQHsx2F/IZ?=
 =?iso-8859-1?Q?NrdECejy61g9gbc9qqcCKU14Qno++8mnO7AMOJEY4K1epxszfjM21lIcvz?=
 =?iso-8859-1?Q?1jRhI5PIgcH/F/5QSwLC8Nm2mBNc+QjA3LXlatvYDmbmH8Dv5RwY6PHnEq?=
 =?iso-8859-1?Q?aGnIHj7GWuj45DYx/GTc+gMNCLoAkWq5Rf+a3C+6n0dD4+CRVpyswq6r8F?=
 =?iso-8859-1?Q?ao9sVtte5DI+e7kmno76AX4KRmsY/kM2zHgTgJQ/3XndvK53bdu5HiJ633?=
 =?iso-8859-1?Q?d/2ZvXbxtpkKD9QTmwsrkiQZcIO6JKlaMkOZ1jE3/gyxQEM5+4gdOUKR4N?=
 =?iso-8859-1?Q?sYPViHOM4IQ4wl7EzPi7yBzBN9Xp2dSbjrgMe6p45vQNK8EWkCCZ4Bt2ro?=
 =?iso-8859-1?Q?8EJbGRk1B2fCmZGMVAgjbjFQLsduua+P99X+S/mlN8Px7v1gBMVXl2ZnNg?=
 =?iso-8859-1?Q?zZJYJ8OYe5OC3BbruPIy+BmLJwuzsMxQ8sttEcEIpngEk6mJW5PijBezHa?=
 =?iso-8859-1?Q?bdIcPv5OtbQn6gN8xO/mIR/A8nn1wDRhkLYHHZb7yGafMbUmbECpv+gg?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a707a70-8234-4070-622a-08da5f3ac352
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2358.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 10:32:05.4791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BlaKuQOC+78GHG1KOq02Ax0VDf/fvyOtZ85QjZjvqXnDDMWfHTh+JsznO2MqIlVPtM2x8Rm+QOr3DRZPycSm77ZkFASDF6VRh2SG0baReiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4043
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-06_06:2022-06-28,
 2022-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 mlxscore=0 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207060040
X-Proofpoint-ORIG-GUID: NtOq90ug7vVqzKnOBWlR4Zqt0w597JbX
X-Proofpoint-GUID: NtOq90ug7vVqzKnOBWlR4Zqt0w597JbX
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

On Wed, Jul 06, 2022 at 01:21:59PM +0300, Dan Carpenter wrote:
> On Wed, Jul 06, 2022 at 12:05:37PM +0300, Péter Ujfalusi wrote:
> > 
> > 
> > On 06/07/2022 10:23, Dan Carpenter wrote:
> > > This function tries to return the number of bytes that it was able to
> > > copy to the user.  However, because there are multiple calls to
> > > copy_to_user() in a row that means the bytes are not necessarily
> > > consecutive so it's not useful.  Just return -EFAULT instead.
> > 
> > The function is copying data from a circular buffer to a use buffer.
> > The single copy_to_user() is used when we don't have wrapping, the
> > 'double' copy_to_user() is when we wrap, so first copy is from the end
> > of the buffer then we copy the data from the start of the buffer to get
> > all data.
> 
> Ok.  But the bugs in the original code are real.  I will resend.

Actually that's not true.  The bugs in the original code are something
that only affect users who deserve it?  I might not resend.  A fix would
look something like below?

regards,
dan carpenter

diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index 1f1ea93a7fbf..32fa3186c295 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -398,9 +398,14 @@ static int sof_probes_compr_copy(struct snd_soc_component *component,
 		ret = copy_to_user(buf, ptr, count);
 	} else {
 		ret = copy_to_user(buf, ptr, n);
-		ret += copy_to_user(buf + n, rtd->dma_area, count - n);
+		if (ret) {
+			ret += count - n;
+			goto done;
+		}
+		ret = copy_to_user(buf + n, rtd->dma_area, count - n);
 	}
 
+done:
 	if (ret)
 		return count - ret;
 	return count;
