Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCF659821E
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 13:18:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 068B89F6;
	Thu, 18 Aug 2022 13:17:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 068B89F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660821500;
	bh=JDmmvcxj7fNzFmt7uf4F6OeOVgMX3dENAogDC4tIF5c=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mhPT+r6F3a7dWcOhFTq2a4SDoEHiYUjerPC96pWOkqgZ+KcQiLDYwIITYSKscSBvf
	 VUd5wNEeZjdSXXU7cGKqjQY+bM4FrJD6SyCaOdDmQ5LAaZSu1AqgWjs6tcufrdHN48
	 e/LJ47D/+nPkgj/wdY9EZf8ekOUqBnNzwdLstNUI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F437F800B5;
	Thu, 18 Aug 2022 13:17:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63AD7F80430; Thu, 18 Aug 2022 13:17:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12446F800EE
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 13:17:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12446F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="RlvjBV0n"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="A+3XcOrK"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27IAiabx026978;
 Thu, 18 Aug 2022 11:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=Uggc7F4fQCUWiwC8N5cx37gZ/hVveuCrltLgR3FKSc0=;
 b=RlvjBV0nwNOlorVpWDjkQpqnts2m7sGP24CY2z47jaIswP60VVCoRiLJ4SUlhtivw2rI
 Tm1pRMQ/lAUSLTnyKK4uJiWn8ReonZi69kg+cAfbfkRMO/xf8K4IfkeIrE9Q7YPj8NHU
 kw+JMvupdkTYOoMDs5O3kr4nAl5Ejj7Tk+XL0kHmT8guEf22V3TgeYtNPO6fBWUAdx7+
 MMSd5jQBVhIsJOMk/h0upQFmB0I4RfAqGYkEw6YB73iH4Pyvw8qyyQtplnb4DHsFRVZd
 jrgVm72CCnlTt6L4FiWtACQAJClTVKObR3BP7G5RnFQ8WWruid28ulkDlSXai2giV8mN gw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j1kka04ce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Aug 2022 11:17:12 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27IAXs0d015328; Thu, 18 Aug 2022 11:17:11 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3j0c6e725e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Aug 2022 11:17:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpOwNH4X9QEOLXGlXxPFkqR3Anwn0gefHl15QHj1CXI8Qd2e94hodO/EaVAzC82XIcOK0NpW2fvgbmMkRab1D/BXa7J8PFniNWwbQ56F6FZBXwOk+iMOEbBSpwBBmYR6aeAnIThiyyHcYH2hdihBlgeUNqNiFKMKcrQf3SfNzgZocNpcYc5Hn88TofjGrZqGkDQr8xOhI8s/8Y+dUNbhb9k1cusgH2ZEm2nKIl+JzREZGP4s8EiPobIXo5pqgM6QOVK81wejXcAY2sZq2Wt3IQAcVRh1CDRhdEzJEh3bdv5ih+1wTigRvm6J1qgUu44E/qaz/8nnYF7emTaIxaydMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uggc7F4fQCUWiwC8N5cx37gZ/hVveuCrltLgR3FKSc0=;
 b=fNBxt8yp/hm4PdKCngPnBnwIlwvzwRPPKT4xhMOx8otjnQ28eQ18rrLQitRB6HXrPyt0opt4lLOMNgD1wgEz+6VIlo1OHqjAbZjldz40wIH/MVUoLZ9a/3j9F5OdpMI71zR/RuzCW6b0aT/Hgoloft8pnPiFMJSFe9i0NcO5mMO5ONoZ8CRbh6ShNqaiuKemqPHOroWbIbFTLyDguKB4nBIY9LzXLByD61e3w0CV4V75uwwylOp4wHemyVVoNvlLr0LGHoicnKYFrJERsF1XJWgbNAjFwrPyUHe0BbTo4THPnj5IeSc1V9aP9FLNjg85LiPfhaKy+TjmtODi2f6GjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uggc7F4fQCUWiwC8N5cx37gZ/hVveuCrltLgR3FKSc0=;
 b=A+3XcOrKRO94WwmlCYvfSpbKemuxp5ChwRI+L0AQZoP5rbUloi9hK25/U5xGOJEcvKHxhFSSxcgLCYl8MhEEXirFRKMwqTxT2eFtb9eOA6VvaN9YZxLpoDvUCIlfazNPS4udX1f4sTB5CsP9soC6Gn9oV5cQwBr9IeaUddqOs8A=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4738.namprd10.prod.outlook.com
 (2603:10b6:303:93::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 18 Aug
 2022 11:17:09 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5504.028; Thu, 18 Aug 2022
 11:17:09 +0000
Date: Thu, 18 Aug 2022 14:16:59 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: AjitKumar.Pandey@amd.com
Subject: [bug report] ASoC: amd: Add common framework to support I2S on ACP SOC
Message-ID: <Yv4fqwwEyAeAxq7T@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0060.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::11) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13159bd9-672d-42c9-164e-08da810b30fc
X-MS-TrafficTypeDiagnostic: CO1PR10MB4738:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VbZtPx8tgfTZKeZEotwh7rpE5/jW4R9qohM1Lc4fkx3NCC/QcMFGJSJmE5QeyuuWxalRkb6EgtrGGU/E/gbi7SJp1ob0ONdVDh09xkBSN4u8m1mwVCIq4nM40umRuaShse0NV0IV2h1F1tgDXn0OcS1ezGHGztEXadoBTFAc78vRTWrAkBz4A+1H4JrU2C0/XLM13JpVFraXoIveXWE7s1T5YrlWuHwEiD6tSenM3Rf58NatC6cnCTda+h4u2QJ1NQ8vXnNDSXzKJL8osPhS3LwXCFQ0h7dWk9WrN7Y/aMPCw4mWwPuNoMkNNU/uqavGBMR2pg4RXi1FlVJiZYviQIdfmDIXEJRF3Baymn61uNFZJuEoe8RRdvp2/hylYfQ6WNI1He9DUr0CeOQV0RrjurX0V/KzWeCW/UzRV0VgBFg7n8H9gNX3gG/lsisx3CxLA5ZQb3W2BNODRihcU1Gm4806dnY05dztckJvSRTvSh5uAOi4q5MHEFR8urJZu/FplLAlDzSV8dS9b73RGgJEn7GtFeaTyi0pdIhtf2NoxPjIlsNc3yEWY6ZeOtirqnWQCpgRWEnCm9xZzGM3KbqoTVVrW+c9VMWh39/SdojDw3h8qCXS71MPyDWCSg3YQ+PWC+b+Pw9Fvy3hptexUepGv45lOmWHxRtplDfMKOr8bXdW6PMUWlYoFiY2Cd2dcjFx6RyfRNZmKYkjiwZQNMEhBNYUGce1q85TYV89B4ikt1hmK5drPAhSsAYJYpHdHCxpxAyPs2ppmlI3WYru/kbkDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(396003)(346002)(366004)(39860400002)(136003)(376002)(8936002)(83380400001)(5660300002)(316002)(38100700002)(66476007)(186003)(66556008)(66946007)(8676002)(86362001)(6512007)(44832011)(6916009)(26005)(2906002)(52116002)(6666004)(4326008)(9686003)(33716001)(38350700002)(6486002)(478600001)(41300700001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?toow4jNlGefm76crD0ENJub0UmnPBjY/eIL/qOGcS85YIh0JYFNwjT01r0AC?=
 =?us-ascii?Q?kEELqimdMYCeuOSQtl7T7srHg1puEPJBathKProl2yoqaC3Lbhgz5Y57M/vu?=
 =?us-ascii?Q?/hFg/Dvy4KwKYG28dQtny7LHZG4AHwta96ZImmCiQhYh2P4XkWNi5YOFkauB?=
 =?us-ascii?Q?fzOArwwHiQW04++YeogDuB7m9CvLto5yaeG17APiN7vWlS1kh/oJb1NZ1/uY?=
 =?us-ascii?Q?jZ20kyBpyGe2xPdx0RhATkgrPAeXr/WidUDK3Ct8yyPHdDrlgWyhWR4BJwd6?=
 =?us-ascii?Q?pI1bLleyS6tTZaIF8U1JpLlu7VhJ+IPBWQFbtpXY7p/K8RgDP4bUEZmcAYSZ?=
 =?us-ascii?Q?Pk1ot2vZqoATM1Q+QIuMRoF/zOjwMbTlafX4MrTvhHoHYuxqsilUS9vv3ooO?=
 =?us-ascii?Q?WStuVWijRUs696OUb2jueNZTvY8wU0rCzLLmkbpktLimNuRzMOMErBASFqE4?=
 =?us-ascii?Q?+5EeubXvwMSR/Q5QgUYKX30E4uHZ4bAqmxW571jXBj4LH/ga7vbVkKTyWdtN?=
 =?us-ascii?Q?i0RuwMA15gHw4YlELyOJTSJVZB8HjZ5h8NhBbXBt5690WQjRySTm6jbc25RE?=
 =?us-ascii?Q?43g6aUTX+FtSzwuoQTqlccOXJbA90eMkZvG5Nefrz/fBXTZHM4kAuPFHEzK7?=
 =?us-ascii?Q?jyh+NG8716ezKh+KrrI4OG/huLt9JkCWd6jQyuLLjkiQ8sftJZT8ocqwMzmB?=
 =?us-ascii?Q?PZ75bcSvWxBtoJzolRD0gYwpcl2+FauNQBgkZXAPuVV3Z+HNKbaewXUiwVI+?=
 =?us-ascii?Q?DVAzLyHpvNTyXHxpg4oDWXyNkq4YShSIsIrv2x0mYccNwVjkDxXMgHfTFihZ?=
 =?us-ascii?Q?iPipDe29F0Hq3fjCuYudF9sMqyK6rGr83kZuBXA7qQZNZ5CUm8h4eZoRogME?=
 =?us-ascii?Q?nq74sutK9mx5aJhwhBwCJDIIiZ7Xb4qJ/yKRwANfGVKaMvjIVlOLWIZPOx6n?=
 =?us-ascii?Q?HMVZcM+KeuqIjXjYw/29KOTfkW3Z9qzuwWvo+Iw6vv9Qmf4QC/485yW0cp5J?=
 =?us-ascii?Q?oRCcd2hfvCQyFw9518mpl9lpQznf2SY4ooeHTdF8M8+Bs2zL4JowDdt+XGm9?=
 =?us-ascii?Q?aWeJtZ8NMMR7OhFrxpO36CFfXXh+fGmBtVsqiYmIJPSKkwdOVv3gCfks+WXo?=
 =?us-ascii?Q?Aa3+riWebgrl+K1KfaTY+NvOwwDNL4Ddkje68GJMS9gTsJAzzYwx1jkxHJyl?=
 =?us-ascii?Q?TkIgLUIOXWV2H8HdZZ7D+DHCvhlQ/jJFpkE0UxUUZcsqzOYtmS0SVChycErx?=
 =?us-ascii?Q?0AJI+TFS2bhW2I45rcBgN4ekvd2VYqGn/jVCophPKos9eln4asyL5aC2TWI2?=
 =?us-ascii?Q?TE2Dgc7HJHqLhrw/kjAeGiqTLAq3LLo0FFkPhNFNkUaefbayXbt6dMOQ+SyA?=
 =?us-ascii?Q?3RmWMbClehkWQFQcoA9q089kY9iCGem+YqFamin429DQWRRuEJH4STOIr+i/?=
 =?us-ascii?Q?3v5apAllUzYFfQ4grCJFiYtQ50vhOuXwan/4c4tT6DgCBEVerprL4alwJEPP?=
 =?us-ascii?Q?klS55J8ZOj034EKV465THqhul8SQhVzL6mS9ovr7HaqcfXPxVVbzSJvl6sjq?=
 =?us-ascii?Q?KZ8wfw/WjYWpYvrY1RX7sGm+k/5MCU1BilhVGF4WjR9/u0okK6y6iVU/jiqU?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: TBiYRhYbsTg48wAjURUK2oP54HTzGVS4kYHkX9tCjdVkQtwt2Knvr41zwccEAcE0bb4yw6bxP70sGmQcs9+KHz00AXim15gtM6qoZp9LgJAmE9Mo0ZkrJzG4i3v2JNAOoAgduEAsEv/b33f/itSnd+IbhNi3q5ju1Vpgbj0J0JJtIDgqT8dE0FoOGksCEV01cvTmd/iQ3tZXduvc4hKOddSsNazE6qfVUVsLxvva1gMNGhgu3TG1IU49Tx7bWzodPKEcnQIsHkalmVEkevTaK8NhiYm8QGn62KyS8w+35GAncQEasolSscpG/mIs2BHDmPjZzaf+vJ9HNDIZVK1h0OYFsJ/gzUdz8+Kgpd8erVxpySlzT+YC3P6QLYl/g1u99Bwq1e/Vceu+ht8RwUhIhR9epbroJxA8r0WIdxH9iLyrYC0/et1FeSRMZEzm+4U49gmB0IY9iDIweWpPJYQAJ6yHFQ0N88K9r34JOLBuiWdre96mbSsPV92kPtlFuVHPPJL8KcbDvSTzSC1v1Q3bzbH0FfeEq0XzHsc0UsNCIGCiQjT0TfWug+yOPCzKB+tQf+erL1hmGGZnYkVVQ6IOZo9ohYf/P4/TyyYhFuvkNy7yEpEubMC1tEuLx4O1XkFVoHlgzlk4e1hVHaKnFVx4u5ziCbXmTdN53M10fM685LTpjc+D9YBMtYinrOJBAGHskLhfK3n5R5nTXluYfpYZrYjfmsGa+3jiTYp1RxqjIk/HZi0OZpC745jTqnyF87DxWJE+ZP46vyxj6iKkzzwjpqLZGQQoTU7mAAe/RozX6N8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13159bd9-672d-42c9-164e-08da810b30fc
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 11:17:09.4359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lKv4UV22uA3Zw6D3PBN0hwBLqLwni8ywYl4RsF3bIdCBDHWvfVdTfpokM3eNXuU9j+qTx2EOmd7NQfVp4R8EJcKCR1Z1BMMnupH1c6Ys27o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4738
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_12,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=888
 phishscore=0 mlxscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180039
X-Proofpoint-GUID: G3mUfJ98jn5pc5SZJexrDJixf4ukjTJa
X-Proofpoint-ORIG-GUID: G3mUfJ98jn5pc5SZJexrDJixf4ukjTJa
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

Hello Ajit Kumar Pandey,

The patch 623621a9f9e1: "ASoC: amd: Add common framework to support
I2S on ACP SOC" from Oct 19, 2021, leads to the following Smatch
static checker warning:

	sound/soc/amd/acp/acp-platform.c:199 acp_dma_open()
	warn: '&stream->list' not removed from list

sound/soc/amd/acp/acp-platform.c
    173 static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_substream *substream)
    174 {
    175         struct snd_pcm_runtime *runtime = substream->runtime;
    176         struct device *dev = component->dev;
    177         struct acp_dev_data *adata = dev_get_drvdata(dev);
    178         struct acp_stream *stream;
    179         int ret;
    180 
    181         stream = kzalloc(sizeof(*stream), GFP_KERNEL);
    182         if (!stream)
    183                 return -ENOMEM;
    184 
    185         stream->substream = substream;
    186 
    187         spin_lock_irq(&adata->acp_lock);
    188         list_add_tail(&stream->list, &adata->stream_list);

Stream added to the list

    189         spin_unlock_irq(&adata->acp_lock);
    190 
    191         if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
    192                 runtime->hw = acp_pcm_hardware_playback;
    193         else
    194                 runtime->hw = acp_pcm_hardware_capture;
    195 
    196         ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
    197         if (ret < 0) {
    198                 dev_err(component->dev, "set integer constraint failed\n");
--> 199                 kfree(stream);

Use after free.

    200                 return ret;
    201         }
    202         runtime->private_data = stream;
    203 
    204         writel(1, ACP_EXTERNAL_INTR_ENB(adata));
    205 
    206         return ret;

Could we delay adding the stream to the list until right before this
"return 0;"?

    207 }

regards,
dan carpenter
