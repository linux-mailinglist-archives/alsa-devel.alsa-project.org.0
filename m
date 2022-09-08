Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F845B1F55
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 15:36:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE4C91718;
	Thu,  8 Sep 2022 15:36:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE4C91718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662644211;
	bh=txnJxtMN+yV56HivX7gGbmTCTB8nnAAPIjsjw3FgKx0=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=e7ranzerFYXakpyQkAbwbtpiN2ss2pdm1nkhOv9G4nc0i0AvPqW/k4qZWKLenQCJH
	 ILABlYMR4oVTvutoXyK+V6/FXktD3R6yTn4GAetyYpiqIYMwpi2nKj0v9OvRid0Y/D
	 QmXGf5NNJZhVBxCGbWAXwydmVSUv13+ZwyIRBrNs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A135F8023B;
	Thu,  8 Sep 2022 15:35:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0EBFF8016D; Thu,  8 Sep 2022 15:35:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEXHASH_WORD,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B32FCF8016D
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 15:35:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B32FCF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="wRKuEVX3"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="PJz1Gvbt"; 
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=intel.com header.i=@intel.com header.b="hKv8J/Nf"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 288D3Bv8021108;
 Thu, 8 Sep 2022 13:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2022-7-12; bh=vut1a5bukX9hA/ZlNpF3KlD0z6p5MEPSSyZvw4y6yt4=;
 b=wRKuEVX3jQK5yHBYDRvEDIAMAIWEwcpPUGkP+qlszXaO087n76aF+/ZXmBGDRPQJz9Kr
 qORIiOWH5NSd6DfwarESugoAJTd2IcbgjsGMylO6voDEm/LvExHhMWlHJABVYtuRav75
 iSt/7kmcDAQBTIScFMCIccFk3gViTBwn8VpEsdsJvTogg7iaM3Td3vHQ8u/3VcGD3/t0
 s6TK6bU90PnQYSFc3ZXurg3VNC0G4p0zvhHN+J9CWTZq2OfzXoVPMHwJzkvR6GzLvAhj
 zzuJrOHkpQ7K9vMnVcxsEx0Vy6Jk9ao9Cg7wnh3NVeh65l9QCJWidQdyRlg+ouznLdTL Zw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jbyftuxth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 08 Sep 2022 13:35:41 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 288CZNin028942; Thu, 8 Sep 2022 13:35:40 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jf7v6f5cv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 08 Sep 2022 13:35:40 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=QzsxbHtZFqbejQJwgfFa4oqbFhKaxYBmmFVZXLMs9PLZF3dJCFnFrnMZaA0/luP+Yvs7VJfHEPvpiGAfrmrSCJswqn8zlsarKHo3dR0lj9K39H3+9wTytg6sdLEPuDT+dZj8OJXglO1srMTtjHCfA3j+NXstdYo5i71hQkteoxoMCg5RuLdiqaFHOT6IVTT2o4BK9nx1PlNvOJo/A5gRzyEKSRlnyTlwH9bYgGgk5vyDYxP0Pc/Um20skpJ0ckFuGND87U7Lz8bW3dvTUkTQXK/6QyJpt4H9Ybi5/1KmIWasjHrpaz5/G/jdOEBEZhBezcgG/v+5QNhyTSY5ELqNXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vut1a5bukX9hA/ZlNpF3KlD0z6p5MEPSSyZvw4y6yt4=;
 b=oSJbcoWc8v5gH6AiHC37EDUhs6zrYpC2m2pqREiKrtG5jI3LH03fOZsbZcUUdZroaQSMHRwkZZ0e9aeId6N2FdLMGDBjj+48KNQbgGfRi1wDPiisz/LeyRKLK/FN6lceex61NqO/TcaPzfP+quEuDPoTAJvl6QgGQCo13/a8bhKT/Uhqk9uW8sogVoWzAD59sbMqv64CO4gPRruzM4roeKizxnIvDXTFBj8PcccZ8yv3u+IWG+KDqLbzyuf8H0Nt8i+JKyYQ99Ygmp3y0pKZKRrCtfqQg+62Ru3TSKKpDeUmxnYZpgkgVXlLufeS9w2NCTke9cv6OYfXjvy3GUdiYA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=none; dmarc=none
 action=none header.from=oracle.com; dkim=error (no key for signature);
 arc=fail (41)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vut1a5bukX9hA/ZlNpF3KlD0z6p5MEPSSyZvw4y6yt4=;
 b=PJz1GvbtmcGV26Gf/P6LFvK9qMCP7DTMtcs7x0ZkT9Z6hnzaIlkCwH/FxoEoPvizByVuoCqTP4do5SVoJ7fyfspEbDlhEKDX3xql542qD5PT2QasriVpzGStMEiC+e0HxAM8LHrxoYcOg3arkXI3ReFsz8/V6TWWO1jXIXOOXz4=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SA2PR10MB4555.namprd10.prod.outlook.com
 (2603:10b6:806:115::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Thu, 8 Sep
 2022 13:35:37 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6%6]) with mapi id 15.20.5588.018; Thu, 8 Sep 2022
 13:35:37 +0000
Date: Thu, 8 Sep 2022 16:35:19 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@lists.01.org, luca.ceresoli@bootlin.com,
 alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 7/8] ASoC: codecs: Add RK3308 internal audio codec driver
Message-ID: <202209082103.F4ICyyHT-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907142124.2532620-8-luca.ceresoli@bootlin.com>
Delivered-To: unknown
Delivered-To: error27@gmail.com
X-Google-Smtp-Source: AA6agR7HbVtj/iQyH3ASU5kwwitjVbcFF8KmPJoLqkY766XDn8Dh3UBOhRY/ZKzf3S/+6fO9ceXH
X-Received: by 2002:a17:907:31c9:b0:740:ef93:2ffd with SMTP id
 xf9-20020a17090731c900b00740ef932ffdmr6063212ejb.584.1662643521403; Thu, 08
 Sep 2022 06:25:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662643521; cv=none;        d=google.com;
 s=arc-20160816;
 b=e9f2VXE6BL+1bkAVAXCoKtvsQ955B7TuLoV5zfX9fglfluF7sOX/JOoLvs2rYd1ADs
 JQZsGe1KEJejhDcCVpXGBtyeG4Z5IhSCwK3uNOI4plVCYOEq+EZhWBbm+AqJPkVbtp7k
 FNfaPcMqerCrjvWZwFjMfZfP/1/XeFPxi2i6a5QEsCPzkMpV8QTMQvAf60J+SzFxBIZ4
 uEYYiP1nvWdlvdik345tXJy1VNzcDl9VEWIM8RtpaGiaCp9Egrblfe4oQ+VLQx2buTYq
 YXShHbSYX1DDC9QwAvv1HdS88gK356OenojGwC/xnBSPDiPAfCclvyRAw36lZ+nwnbm3 Weow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20160816;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :dkim-signature; bh=2vMtm/yKROK7LWwurR9c8MfXMJZ2wA/VA79SCqyF7Q0=;
 b=N8jUJVfju5S4JCpBD7+2aHzbyCWv8syjRSEBouD4SWNM9zyGpl655tg6oNSIP8uqd2
 Y8etZzc+LgOunxCzntqujIMvR9l6MHJtAKpI2CWNGIVmHnIo9cymwdIXC8tdZKHCpklm
 XFAr0Qu8jTBuaP08Kw1yBhHi1MnnIAiqBP/iVa5R7VC+JU29QAtv902CSXQVgsR74/mt
 ejZuWSv+T4X5nmjjsWHB6b3nlPw8JDfjMFvIHFFBIFGhlFPgnNXOitzCu9ztEpFBRDls
 yftishLsKVuoc+f2boyRQp1AXmYyZiqUT4cUEGtKe6XonYb4X6xNvMTvP6b4iCcR9QZ5 enrw==
ARC-Authentication-Results: i=1; mx.google.com;       dkim=pass
 header.i=@intel.com header.s=Intel header.b="hKv8J/Nf";       spf=pass
 (google.com: domain of lkp@intel.com designates 192.55.52.93 as permitted
 sender) smtp.mailfrom=lkp@intel.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=intel.com
Received-SPF: pass (google.com: domain of lkp@intel.com designates
 192.55.52.93 as permitted sender) client-ip=192.55.52.93;
Authentication-Results: mx.google.com;       dkim=pass header.i=@intel.com
 header.s=Intel header.b="hKv8J/Nf";       spf=pass (google.com: domain of
 lkp@intel.com designates 192.55.52.93 as permitted sender)
 smtp.mailfrom=lkp@intel.com;       dmarc=pass (p=NONE sp=NONE dis=NONE)
 header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;  d=intel.com;
 i=@intel.com; q=dns/txt; s=Intel;  t=1662643521; x=1694179521;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=OMvZv2eYL2pXyUOUCI+CS4HiX6/ZWd3w3f9vgW2URoQ=;
 b=hKv8J/Nf4k3B0flzZhPhSoqn8z3ylSm3ynG5ktptjGPNCC92/+Lq3XPm
 Cch48S89gj9Y7Uk8aocIrRTADE6ASE/KZZTGC+MP9hSzhsZU9z0LsW/JD
 Yy4W2ek1EM8wdUAjiQrps1BCHZWp803HqStg3omZ6EqBYerm8Rt9ZB3Rb
 tqfZibNuivJXu4cJT9/b2HSOGpgdcdbfT9wX2quLzk140Uagp5/6RF8DJ
 3KYVX8UCAlM8ccbFSwBqq41nNKTMkQq2tw6Q3O+yrZklL0eDc6Irnp+Q7
 rrWK1fnkA9330SwRpEGv7Evlu+sFMR0By4FXnWX+SvQ04eZFZE9UBSMnF   A==;
X-ClientProxiedBy: JNAP275CA0037.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::7)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27e4403c-8840-4e64-c964-08da919f02e0
X-MS-TrafficTypeDiagnostic: SA2PR10MB4555:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qq/S8Ulfz3z/p21MhnatBgwZ6WvdbFKpV6+S681Aw7hpFD7I7w9HzetsHkBMiRtm6QQwhaY6GrvKjBURQ5ybuP9X1/GkgBn8MVe7NUQUvBGWTZWsp1jUso/zquU+03tRjtAJxPjo/rPcn/WOa5jdX+h/+ReNbSkT0lgg05+gjidx7WfWhScDInToXNiRx1UcCnZsGDcdgPgEzNdN/KzlNjvY1hgvKh6a9cVrkiBKzFSbDDERJWMoy7e2T0zUtub11HC4htmpS0vFwSHcc/lYc52DvoBvnzcvsmByLB7EJraHaeQzfuf/XMmuZ4m4d2WddQWNBZPlEQiIUGJIS3N34LoVlDSNZNWmFpUJQr5otL/NnCVjyvi+Wrulw0N9WgiO3cZxFPLYfsLsXwd8mdElZKJzQ0YHuwW+23A7usMNDb8zPzVeU730Qlf8EIdHx9T9vIApqfbMiRpaicGDq/xX/DvYUs1GflA+a58Lmf3CUVjeTtCBwTunEB9p8dzJNsMGzgZMI/+b6VtdkNvoyFl2bej50J3O2DRr9eEBDyWeDfCRZGC9Ii75MU8zT5v5sCne6kgJkCiGFkZ5kdajHtdkDxW1/9l6FVA30NGWX/FFkZkLNW+xvRriSo4DkmyA4VPAwPN3o0TVFfrvtSuE1g0a6/ullTOiF7JNM9kShXHMxpOIg4MKp/FyAKgUfBss7rP2p5mjfcLjJhGIvcNw0n6hPKKdhI73MzT57y5HYrK4yLmDmwrTIPEr1okC2NLu/ln9HFxFiCvzd2CgSeXdw2/4vw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(396003)(366004)(376002)(346002)(39860400002)(2906002)(66556008)(66946007)(36756003)(44832011)(4326008)(66476007)(8676002)(186003)(1076003)(83380400001)(7416002)(5660300002)(8936002)(54906003)(478600001)(316002)(6512007)(9686003)(26005)(6506007)(6666004)(41300700001)(966005)(38100700002)(86362001)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZpKmSpTuIYTosIwdtndcuL/knKcmPsk5x5c19P2g4/dgkVKyJEWw4X94z7br?=
 =?us-ascii?Q?GfR7wFQXoU5upgUnAXX6JeA+gzLeCNPhD9S2dqrksh9veAIfOYsIsL2lVpfu?=
 =?us-ascii?Q?MfTU7WPPFBbjwuJjPZIMlpapftmWcM12ju2HwMPrLr+MMH5DPx3lT/rTwMq3?=
 =?us-ascii?Q?UICcNsCPDomgjEZXm4EQi9tqcIW3E1pKtq4YNtBVlcjUgfV49wwEX9j4PL/l?=
 =?us-ascii?Q?YiVD14KRsbP1dD5RzH1iiNe84or/2yr1bnk53hcbSZ3VCSJl8g2cij+fAKoE?=
 =?us-ascii?Q?4Q0lOXPZ3y9Ugg0scJLfA6n840s59kBPwVPuDw7WiZQWprc76Z7dQSAPAeBP?=
 =?us-ascii?Q?TRaM9tFbA4FLxq78JQNOlaPsOTCTiIQATFW9Wvt9jTfJoGMkcnBhfvYjDR+r?=
 =?us-ascii?Q?Zdro9TwM6BLMP64t4UM/bY5PhS8FRQauBB7oDqzNBIMlOwFFIHxivnQK3E2m?=
 =?us-ascii?Q?suBwC1VwI93jD7EGGwYiu6RhjuOuf3ezqF+/7afQRH0RSa1LDsj6OxQZZyeq?=
 =?us-ascii?Q?8kmUMH+BpR2QCUexpCW0MLuHfOBOqBMCdwiHfDMF+HZjTvRpA2Jz+GrrpZNn?=
 =?us-ascii?Q?crazYOHQlk4s73UOf2Su7/N5y3Cu1LQmhfoe+EeTi4f+3x/541M3PGlJ8lAI?=
 =?us-ascii?Q?PcpynJkZmb4nxVyjByOL7FHKjeFVtlO3calX61AAlWVNagLAaBe2i5F+Qw7g?=
 =?us-ascii?Q?kJ5/wjscyWEgTuPhgCRAt/Gt1/HKLNgX2NBWzjjnz8GSOWDglg+Vj6SHvxhL?=
 =?us-ascii?Q?Lo36mScSyxk0faKz/fktkcqAHQUrJfghjPXuhZih5aGglAJgIZL9bhb6Taur?=
 =?us-ascii?Q?tIT0rPG85pbGpHqXittDshtr2+uu+nkiJdT7oBfn06wVozl5GQI+ThmaYwNt?=
 =?us-ascii?Q?YavYjEj3B0N95OV6JlQKIHKefQpDTg0tld2S1QVZi+NihqscISTs87K2OIUg?=
 =?us-ascii?Q?8nks47PbmMZbQDl4AOwZCiFjKngJ6lAKv1xsFXx5AOR+VYyMigUncJjRmume?=
 =?us-ascii?Q?3opJXHcL1nk4rZa29278YjXzdjW2BZ4HFoLRNOycgjGujDV3pbTS10PTwafL?=
 =?us-ascii?Q?SRoqgQWuGsRk7QFquciy317AbWkWTuk1Vo3okKkB4G3C46JihoqI8pl31PH8?=
 =?us-ascii?Q?nTvybtWmE30BowAt0ju9dKEZLqQcyHZTkP6sHKbei0hJ4v3vkcbMOuK9KTsN?=
 =?us-ascii?Q?6wSyQ+sNDk28mlLOpSR1itciwnbTipcqHZv4bsaNroIRdN/q8YptS1U33Hlv?=
 =?us-ascii?Q?kX9CiQ6REemPP00bqzm4Gew6OKPH2Te8nvQpVd0OYNT9Q9eUK70cXTwm4Go0?=
 =?us-ascii?Q?D3sod0rO70aos1YjRuKFhz0ojTrx3J5+tF424qhuYVz0gCUWlWGSWd3M8FbX?=
 =?us-ascii?Q?IOBhgjGOX1x20mHIVrerb59JIhTZZMw8t835DloyOJz864J3YDWvK8Owerzw?=
 =?us-ascii?Q?TFJ/V/+ZS2VlzfjTPQ9y7MWB7cnyI9XfTiBsegi9/d08bltThD0b1VL2P+TM?=
 =?us-ascii?Q?K0XYmfc0QlDaq6x0jQaOVIZbntOmk3Qt0KgJg/tMTzDONh4fwzc4jbJTGkZ8?=
 =?us-ascii?Q?42jIKYsQ1V/nME09TqfDl5nHdjspsCzI+1qI8wRiGotcMvt4CDC5UVqxxk9W?=
 =?us-ascii?Q?vg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27e4403c-8840-4e64-c964-08da919f02e0
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 13:35:37.7490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6BYb9Q2yvYPgKuQqQMUhvcH55pQZXu1yuGkpAUPfYBM8Rfk9XwtA2cgER8ErmvWcIs+PKyPaprdYGhJb/pJeqmOqKFfyzYwItQkDGIObqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4555
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-08_08,2022-09-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209080049
X-Proofpoint-ORIG-GUID: 8hnXOZVrNHYbIa6o7tOmCluSEmz4jeFg
X-Proofpoint-GUID: 8hnXOZVrNHYbIa6o7tOmCluSEmz4jeFg
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org, lkp@intel.com,
 Takashi Iwai <tiwai@suse.com>, Chris Morgan <macromorgan@hotmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Johan Jonker <jbx6244@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>
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

Hi,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/luca-ceresoli-bootlin-com/Add-support-for-the-internal-RK3308-audio-codec/20220907-222555
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: arc-randconfig-m031-20220908 (https://download.01.org/0day-ci/archive/20220908/202209082103.F4ICyyHT-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/soc/codecs/rk3308_codec.c:748 rk3308_set_dai_fmt() error: uninitialized symbol 'is_master'.
sound/soc/codecs/rk3308_codec.c:998 rk3308_codec_digital_fadeout() warn: always true condition '(l_dgain >= (0 << 0)) => (0-u32max >= 0)'
sound/soc/codecs/rk3308_codec.c:998 rk3308_codec_digital_fadeout() warn: always true condition '(l_dgain >= (0 << 0)) => (0-u32max >= 0)'

vim +/is_master +748 sound/soc/codecs/rk3308_codec.c

786c160ad64ae5 Luca Ceresoli 2022-09-07  680  static int rk3308_set_dai_fmt(struct snd_soc_dai *codec_dai,
786c160ad64ae5 Luca Ceresoli 2022-09-07  681  			      unsigned int fmt)
786c160ad64ae5 Luca Ceresoli 2022-09-07  682  {
786c160ad64ae5 Luca Ceresoli 2022-09-07  683  	struct snd_soc_component *component = codec_dai->component;
786c160ad64ae5 Luca Ceresoli 2022-09-07  684  	struct rk3308_codec_priv *rk3308 = snd_soc_component_get_drvdata(component);
786c160ad64ae5 Luca Ceresoli 2022-09-07  685  	const unsigned int inv_bits = fmt & SND_SOC_DAIFMT_INV_MASK;
786c160ad64ae5 Luca Ceresoli 2022-09-07  686  	const bool inv_bitclk =
786c160ad64ae5 Luca Ceresoli 2022-09-07  687  		(inv_bits & SND_SOC_DAIFMT_IB_IF) ||
786c160ad64ae5 Luca Ceresoli 2022-09-07  688  		(inv_bits & SND_SOC_DAIFMT_IB_NF);
786c160ad64ae5 Luca Ceresoli 2022-09-07  689  	const bool inv_frmclk =
786c160ad64ae5 Luca Ceresoli 2022-09-07  690  		(inv_bits & SND_SOC_DAIFMT_IB_IF) ||
786c160ad64ae5 Luca Ceresoli 2022-09-07  691  		(inv_bits & SND_SOC_DAIFMT_NB_IF);
786c160ad64ae5 Luca Ceresoli 2022-09-07  692  
786c160ad64ae5 Luca Ceresoli 2022-09-07  693  	unsigned int adc_aif1 = 0, adc_aif2 = 0, dac_aif1 = 0, dac_aif2 = 0;
786c160ad64ae5 Luca Ceresoli 2022-09-07  694  	int grp, is_master;

is_master needs to be initialized to false.

786c160ad64ae5 Luca Ceresoli 2022-09-07  695  
786c160ad64ae5 Luca Ceresoli 2022-09-07  696  	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
786c160ad64ae5 Luca Ceresoli 2022-09-07  697  	case SND_SOC_DAIFMT_CBC_CFC:
786c160ad64ae5 Luca Ceresoli 2022-09-07  698  		break;
786c160ad64ae5 Luca Ceresoli 2022-09-07  699  	case SND_SOC_DAIFMT_CBP_CFP:
786c160ad64ae5 Luca Ceresoli 2022-09-07  700  		adc_aif2 |= RK3308_ADC_IO_MODE_MASTER;
786c160ad64ae5 Luca Ceresoli 2022-09-07  701  		adc_aif2 |= RK3308_ADC_MODE_MASTER;
786c160ad64ae5 Luca Ceresoli 2022-09-07  702  		dac_aif2 |= RK3308_DAC_IO_MODE_MASTER;
786c160ad64ae5 Luca Ceresoli 2022-09-07  703  		dac_aif2 |= RK3308_DAC_MODE_MASTER;
786c160ad64ae5 Luca Ceresoli 2022-09-07  704  		is_master = 1;
786c160ad64ae5 Luca Ceresoli 2022-09-07  705  		break;
786c160ad64ae5 Luca Ceresoli 2022-09-07  706  	default:
786c160ad64ae5 Luca Ceresoli 2022-09-07  707  		return -EINVAL;
786c160ad64ae5 Luca Ceresoli 2022-09-07  708  	}
786c160ad64ae5 Luca Ceresoli 2022-09-07  709  
786c160ad64ae5 Luca Ceresoli 2022-09-07  710  	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
786c160ad64ae5 Luca Ceresoli 2022-09-07  711  	case SND_SOC_DAIFMT_DSP_A:
786c160ad64ae5 Luca Ceresoli 2022-09-07  712  		adc_aif1 |= RK3308_ADC_I2S_MODE_PCM;
786c160ad64ae5 Luca Ceresoli 2022-09-07  713  		dac_aif1 |= RK3308_DAC_I2S_MODE_PCM;
786c160ad64ae5 Luca Ceresoli 2022-09-07  714  		break;
786c160ad64ae5 Luca Ceresoli 2022-09-07  715  	case SND_SOC_DAIFMT_I2S:
786c160ad64ae5 Luca Ceresoli 2022-09-07  716  		adc_aif1 |= RK3308_ADC_I2S_MODE_I2S;
786c160ad64ae5 Luca Ceresoli 2022-09-07  717  		dac_aif1 |= RK3308_DAC_I2S_MODE_I2S;
786c160ad64ae5 Luca Ceresoli 2022-09-07  718  		break;
786c160ad64ae5 Luca Ceresoli 2022-09-07  719  	case SND_SOC_DAIFMT_RIGHT_J:
786c160ad64ae5 Luca Ceresoli 2022-09-07  720  		adc_aif1 |= RK3308_ADC_I2S_MODE_RJ;
786c160ad64ae5 Luca Ceresoli 2022-09-07  721  		dac_aif1 |= RK3308_DAC_I2S_MODE_RJ;
786c160ad64ae5 Luca Ceresoli 2022-09-07  722  		break;
786c160ad64ae5 Luca Ceresoli 2022-09-07  723  	case SND_SOC_DAIFMT_LEFT_J:
786c160ad64ae5 Luca Ceresoli 2022-09-07  724  		adc_aif1 |= RK3308_ADC_I2S_MODE_LJ;
786c160ad64ae5 Luca Ceresoli 2022-09-07  725  		dac_aif1 |= RK3308_DAC_I2S_MODE_LJ;
786c160ad64ae5 Luca Ceresoli 2022-09-07  726  		break;
786c160ad64ae5 Luca Ceresoli 2022-09-07  727  	default:
786c160ad64ae5 Luca Ceresoli 2022-09-07  728  		return -EINVAL;
786c160ad64ae5 Luca Ceresoli 2022-09-07  729  	}
786c160ad64ae5 Luca Ceresoli 2022-09-07  730  
786c160ad64ae5 Luca Ceresoli 2022-09-07  731  	if (inv_bitclk) {
786c160ad64ae5 Luca Ceresoli 2022-09-07  732  		adc_aif2 |= RK3308_ADC_I2S_BIT_CLK_POL_REVERSAL;
786c160ad64ae5 Luca Ceresoli 2022-09-07  733  		dac_aif2 |= RK3308_DAC_I2S_BIT_CLK_POL_REVERSAL;
786c160ad64ae5 Luca Ceresoli 2022-09-07  734  	}
786c160ad64ae5 Luca Ceresoli 2022-09-07  735  
786c160ad64ae5 Luca Ceresoli 2022-09-07  736  	if (inv_frmclk) {
786c160ad64ae5 Luca Ceresoli 2022-09-07  737  		adc_aif1 |= RK3308_ADC_I2S_LRC_POL_REVERSAL;
786c160ad64ae5 Luca Ceresoli 2022-09-07  738  		dac_aif1 |= RK3308_DAC_I2S_LRC_POL_REVERSAL;
786c160ad64ae5 Luca Ceresoli 2022-09-07  739  	}
786c160ad64ae5 Luca Ceresoli 2022-09-07  740  
786c160ad64ae5 Luca Ceresoli 2022-09-07  741  	/*
786c160ad64ae5 Luca Ceresoli 2022-09-07  742  	 * Hold ADC Digital registers start at master mode
786c160ad64ae5 Luca Ceresoli 2022-09-07  743  	 *
786c160ad64ae5 Luca Ceresoli 2022-09-07  744  	 * There are 8 ADCs and use the same SCLK and LRCK internal for master
786c160ad64ae5 Luca Ceresoli 2022-09-07  745  	 * mode, We need to make sure that they are in effect at the same time,
786c160ad64ae5 Luca Ceresoli 2022-09-07  746  	 * otherwise they will cause the abnormal clocks.
786c160ad64ae5 Luca Ceresoli 2022-09-07  747  	 */
786c160ad64ae5 Luca Ceresoli 2022-09-07 @748  	if (is_master)
786c160ad64ae5 Luca Ceresoli 2022-09-07  749  		regmap_clear_bits(rk3308->regmap, RK3308_GLB_CON, RK3308_ADC_DIG_WORK);
786c160ad64ae5 Luca Ceresoli 2022-09-07  750  
786c160ad64ae5 Luca Ceresoli 2022-09-07  751  	for (grp = 0; grp < ADC_LR_GROUP_MAX; grp++) {
786c160ad64ae5 Luca Ceresoli 2022-09-07  752  		regmap_update_bits(rk3308->regmap, RK3308_ADC_DIG_CON01(grp),
786c160ad64ae5 Luca Ceresoli 2022-09-07  753  				   RK3308_ADC_I2S_LRC_POL_REVERSAL |
786c160ad64ae5 Luca Ceresoli 2022-09-07  754  				   RK3308_ADC_I2S_MODE_MSK,
786c160ad64ae5 Luca Ceresoli 2022-09-07  755  				   adc_aif1);
786c160ad64ae5 Luca Ceresoli 2022-09-07  756  		regmap_update_bits(rk3308->regmap, RK3308_ADC_DIG_CON02(grp),
786c160ad64ae5 Luca Ceresoli 2022-09-07  757  				   RK3308_ADC_IO_MODE_MASTER |
786c160ad64ae5 Luca Ceresoli 2022-09-07  758  				   RK3308_ADC_MODE_MASTER |
786c160ad64ae5 Luca Ceresoli 2022-09-07  759  				   RK3308_ADC_I2S_BIT_CLK_POL_REVERSAL,
786c160ad64ae5 Luca Ceresoli 2022-09-07  760  				   adc_aif2);
786c160ad64ae5 Luca Ceresoli 2022-09-07  761  	}
786c160ad64ae5 Luca Ceresoli 2022-09-07  762  
786c160ad64ae5 Luca Ceresoli 2022-09-07  763  	/* Hold ADC Digital registers end at master mode */
786c160ad64ae5 Luca Ceresoli 2022-09-07  764  	if (is_master)
786c160ad64ae5 Luca Ceresoli 2022-09-07  765  		regmap_set_bits(rk3308->regmap, RK3308_GLB_CON, RK3308_ADC_DIG_WORK);
786c160ad64ae5 Luca Ceresoli 2022-09-07  766  
786c160ad64ae5 Luca Ceresoli 2022-09-07  767  	regmap_update_bits(rk3308->regmap, RK3308_DAC_DIG_CON01,
786c160ad64ae5 Luca Ceresoli 2022-09-07  768  			   RK3308_DAC_I2S_LRC_POL_REVERSAL |
786c160ad64ae5 Luca Ceresoli 2022-09-07  769  			   RK3308_DAC_I2S_MODE_MSK,
786c160ad64ae5 Luca Ceresoli 2022-09-07  770  			   dac_aif1);
786c160ad64ae5 Luca Ceresoli 2022-09-07  771  	regmap_update_bits(rk3308->regmap, RK3308_DAC_DIG_CON02,
786c160ad64ae5 Luca Ceresoli 2022-09-07  772  			   RK3308_DAC_IO_MODE_MASTER |
786c160ad64ae5 Luca Ceresoli 2022-09-07  773  			   RK3308_DAC_MODE_MASTER |
786c160ad64ae5 Luca Ceresoli 2022-09-07  774  			   RK3308_DAC_I2S_BIT_CLK_POL_REVERSAL,
786c160ad64ae5 Luca Ceresoli 2022-09-07  775  			   dac_aif2);
786c160ad64ae5 Luca Ceresoli 2022-09-07  776  
786c160ad64ae5 Luca Ceresoli 2022-09-07  777  	return 0;
786c160ad64ae5 Luca Ceresoli 2022-09-07  778  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

