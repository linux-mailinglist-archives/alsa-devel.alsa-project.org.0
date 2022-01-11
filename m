Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D3748A855
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jan 2022 08:24:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4555318A8;
	Tue, 11 Jan 2022 08:23:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4555318A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641885841;
	bh=aTykxLXgzDaS2MlKhrHbn/YHucBK3u21bNmoTaKE3vY=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ac8btl1LRRvdeB+Z3VeWV8M9ClNNaZ/NZy5aQvdXhJ7lOZOI6xWc2mPZbCzSZHEr4
	 TBg8S7qWodAJVrEkM1edr9NocczF5CWWh70VLcOliwvSvB+oOSQ896W8AB7BpB/dBs
	 Vrgt3Njymr0RWhtCE1yjnFj/O2yPemhBBn0/xcdU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9846FF80430;
	Tue, 11 Jan 2022 08:22:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1232FF800A7; Tue, 11 Jan 2022 08:22:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C3B4F800A7
 for <alsa-devel@alsa-project.org>; Tue, 11 Jan 2022 08:22:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C3B4F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="KrQ9zQD/"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="sVWjKNEt"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20B3T9Dk030508; 
 Tue, 11 Jan 2022 07:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=eziV8snVh8RTOpnQKOth4aJunQ4dcCi08wM8UqXcVsY=;
 b=KrQ9zQD/5xtSdk7nvAPeNVdYqqnnlBs/zJEEkK3PKPv0lX8xlfMBWosxu5JxTkQ2g7Sr
 j8LSRhRAOiKj3SndmF6pcdSWDYsSw0/l5D9JTbGX2Si8LmV9GPwHawzt1cE2pBNf2fQs
 V9ADX/OEInKDBDdZIb6sMjdf7qua4apc9D58GdrWEseDGc2meZsjmr3x2jg1Fpwv9XHR
 XUJXK7NyiIwXMfCcHWzFH0Nfy+w/hyVBv+r1upT08KuboxOtMQIEIbhHjCoCqMD/fV9x
 cAYpNWUIiAzEjXNImhD/vu4HsOTc0/Kelz317/ChUhU6TAcMidgRlEZuq7ZpqGb+ngj8 Lg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgkhx2da0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jan 2022 07:22:47 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20B7FaFU146815;
 Tue, 11 Jan 2022 07:22:46 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by userp3020.oracle.com with ESMTP id 3df42m8gw6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jan 2022 07:22:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhkRNEl1wtGwp01VjUEtd9gawx2AMHBrlj0ZgzZ+kEdIfLhEOWC2bFwV/LV71IuNR46rSWq+usi8GnhTqyds0qOEyUhWtuQmEOuuRdUY+5lKFp4i3kZlnfI/Gs2HykxYxQ8m2mgyJSSUzoBqJ3YkgcfRLlNw0vhxfaRnvUsqMxT+EoBNCIdEMW2FbeN7moKpTqesRmHP3GWk3m1uRIPqm1foOt7huHiyEyRpU+zl4Hg+EiNvSXWItJX4//W8RgnJp6b+NMxOygK+tcX0noCtAcMeTH1N9Q4dmGL5Q6QKcgAyNmcfrkd5OntYLZuKxXtYwZ3xhjFFPFqYP1mjFK//rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eziV8snVh8RTOpnQKOth4aJunQ4dcCi08wM8UqXcVsY=;
 b=EqvIlegFIE+KTbquBKgkgK3Im1EjD1MS+DCdt3sCH4XRSzVCuDZwmJgqCl7WftdchvWBwb1/ry9yT1PIpckXk7mSLBASaZaVmp6PBVGNPX5kFLT7cyXDrsZlBlhvG36MMFx3WUqqBKHzhIZHDDGb6KndlOc66UrIO7N1aWhFrTi1M+y5qUilrAVBr4yAb3Q5/1hyP4VQ5CCjb5gvGVN1VN1E9gy35KmVDS8uXW3buaxFAkdmRVxG87k6/VlQiH65jCT+be8Ksi8+NkkZITQVQ/lesj8+BJeh1zMvNq2MVpyJwgD2FhPZoaF3M03usD3ktlIsUS1BXMuVZ9UrJvIyag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eziV8snVh8RTOpnQKOth4aJunQ4dcCi08wM8UqXcVsY=;
 b=sVWjKNEtTaM20ec6FKXUY1reY6ZuZR3iQCw6rTOPOhrbGH0uSJUbf7qhYDhtdpEXmBFDpJiPSH+pr93CfOcgXE2Ffv1x8NEeCRIXT8txgxGlpiRhL4EqemGtOe1bzj1drbjY/GOI1twVQPdCxKD2zZWHuO5dUenTFJoABlC/8MM=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1568.namprd10.prod.outlook.com
 (2603:10b6:300:26::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Tue, 11 Jan
 2022 07:22:43 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b889:5c86:23c0:82b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b889:5c86:23c0:82b8%4]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 07:22:43 +0000
Date: Tue, 11 Jan 2022 10:22:32 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: James Schulman <james.schulman@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: [PATCH] ALSA: hda: cs35l41: fix double free on error in probe()
Message-ID: <20220111072232.GG11243@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0099.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::14) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80830004-7dfe-4766-7f03-08d9d4d328b3
X-MS-TrafficTypeDiagnostic: MWHPR10MB1568:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1568783987924DC872271F6E8E519@MWHPR10MB1568.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H6XzadGAX8iIUo1INm6bcyYPpNeKjVjpS57EFrE+z5AApZzQrau1IIEthXJgCHvpVjaEbdkal95z1kb/u3R17aA/Up29TrfHjtZ8LzUr1VzC1rFLgQVOdsOQH9JkKFVwQm8bBPIVU0yqIauwkWVAr++cYln5bPRB8/Rv64njVmnQgSUMge/ywnY9NL4g9Ic/sHNq1bQ/JAABbpqrrzxYfd+T20F0tLXJelslJCMs5uQ1jQEjocpmTOSTwmz1m/7kspCs7RcWG1mXWa04sF5gjTvHOid0YOC9ZIn7/pjt5EQsgli46UZl1eolZv/Rxeh5xiF7qnVNxZs4q2Tbo4JKRygaVi+9X6v0qh4cW3y2h1Uj/UIR25iLyJvTLuQYt75AkiMW7O02NAoO0uwM9/K4VeKSydUO/mWyBf4uwUUsoTkpvI2wSUafV/M9p9PYVtQMuzl/NDWlqjlByRNO1arSI11G1gtRvVw0CoaRE9ZOahXTTGEiquMIjHEW9Ur/bHYNXEtObplvs5XW3UnhwxR7q51F+A0xA8I/OXyBwv3yik6G1sQkd6S4JhZi9N5TrZ4RagiOtKWFG0H2JaXet0OqBW+RLzJtiRIxwujh7NnLD8LhXxA97da2xapaYYz5FSdPrC6nVnHPy4t1VyPzxt2NZ4UHBT2C6wds9X/hZimkjutWOb1k0eUWOjPxe1phA+2XKCem9NC0zIJQ6JXbWauUMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(6486002)(5660300002)(6666004)(4326008)(186003)(66946007)(4744005)(66476007)(66556008)(26005)(9686003)(6512007)(33716001)(2906002)(8676002)(44832011)(508600001)(8936002)(110136005)(316002)(6506007)(33656002)(38350700002)(38100700002)(52116002)(54906003)(86362001)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zdUROYJCl8jAmSoW6iNpV8y3xzmNwoHUo2PR+IHSQuAhOPQwM3Sfku6O9gAl?=
 =?us-ascii?Q?x793+JRW7pii3zK8xEGK9qWWd7PVNjhvIG8+McI3VljWIS4DPjCJvqW3FEDZ?=
 =?us-ascii?Q?/axNHCX9s3bqY3NnasQ/uINDYiyfdWLHhz54vjWbwZSpBa9v4nHSg+YNapOT?=
 =?us-ascii?Q?txgZkgKZd7rLivFbOEadErSG/MYgaiaEEw1QZXxcclo7xJndX5vL8HGCtcJX?=
 =?us-ascii?Q?ncuaGADEeCHaQTmo7ddodVXthN1PNGjRCkR821Hpbekan4IFTAUMhFuvSXLk?=
 =?us-ascii?Q?jyA7RGCD51VY1C941P8VVyvTQt+YttYMl7lxDipH9dXxKoVSyB6Q8CAuMEOo?=
 =?us-ascii?Q?QHm614kf0jJ6VUU9zaQdx8voUFxe39ChVrQxsU66Yvp+mseN1czi9E/o2zve?=
 =?us-ascii?Q?VF8wxZkB5WikniP/5DW0e2ezRke4dRkOJV2AvgtleKXAaKRj04YIhZ/BVsue?=
 =?us-ascii?Q?j7LPHbodUyk51zwZjglV0ZYV/LB66jdPi1/kROKk6chL0ghssWsJtPsvCxWd?=
 =?us-ascii?Q?zwbv3AkLANFTFC1AqK8ivcMXkMtx/MHj9T27WYv4TMZls4slUR9V+fQuilbb?=
 =?us-ascii?Q?pyIh+OKKPeJWN0stSNadwC4Iwk8Wo6akzzoJRHekCDGAWoeqaib9wo2R0CN9?=
 =?us-ascii?Q?b8AHhUkTW3RrMu8mSCvMNAa/e9OEyKuG6NUkUFq5LeMQ+vyRZvish/QO9D4Q?=
 =?us-ascii?Q?A4f9irOhoebPSkFaPK8trlHJ8NSBW5J6JwJuufgTbeWZ3VfAsNJjTJ5KPVQ7?=
 =?us-ascii?Q?fu2dnGsFV6jik6LS08UqLhpjA3zfM/BC2DmqaQ61lr4Oi1e8FzLtYRgfp6Jw?=
 =?us-ascii?Q?KSWLvl+/OnwBIyerZVZ4gjcz6Mzn73vjcq4p4f4t6YXeIfsRNIkjjVFYiS7i?=
 =?us-ascii?Q?OWdsHCubEeShF0LSXuI2sN2BL2eKAnHx9pW+4qUg0tcVeZfPY2Ab44D3zyMR?=
 =?us-ascii?Q?us66sUEodZx4I5PNEBhnvclCHpspNcUvsyU+KNsk4fG96b1XqOuabzUNCaRs?=
 =?us-ascii?Q?PybdDVZdMFZZT7sdR4jutln5AwNUTe52VfAlhl7bOsrUClxdLGv8UdRpmnnV?=
 =?us-ascii?Q?+0Xnw0JVRoZjyFf1e097RpTXZ8IgZKMRybX2yfERdR7P3m+SwZFsTd3gmeM7?=
 =?us-ascii?Q?GLw0brJbI5dWebhVAB6G6tnMoY+ZgqR+woiwVnGIuYkJtcfxg7Ve3u6yOPTm?=
 =?us-ascii?Q?AC+HR6wjBIdZjL7EanvGqbhrE4BV+H750JvgIlj6WjzBaY2T0dEqliANIHI4?=
 =?us-ascii?Q?JcxJ0GTR2cDvum7KYfn1DgTDtiFt7sYQog8jtPwphLJaWbBfEVaeTwtDXL8K?=
 =?us-ascii?Q?yHTZXhKT4POfyAATTzWaJlk0Lw7g6pNz/yT5Jg+nj5EP+xjbYZetXQN2cprp?=
 =?us-ascii?Q?syayl8UodB2jQDcm7hI3F+1rjqSv7qp+HvDmV8FhT5o5rHRjJHBRtByLOZLa?=
 =?us-ascii?Q?BJsuGbzar7nMNPhAGoMjYRJ60h3+GdeodsYI65eqPkIw+GU7ZAgpPkyBkOLh?=
 =?us-ascii?Q?TB5mmuCLjLtah6817py4LgUSOoP0/XCESYOh5jGP/+2N2PzcaSaNLGwIGmNb?=
 =?us-ascii?Q?NWupwLkVdHPy9dfOWrcuPwx+KxeuQFZQHKP6c81Kchb4Um7aLbcWGmj81Uei?=
 =?us-ascii?Q?3/uzKAhM88yR7uj3kUsn65yqf8TEINRpg9ZgHyOJTHbESX8Jv15n7/MNvNa3?=
 =?us-ascii?Q?L61UfruVj9/DudE0bR4bDNxUQXs=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80830004-7dfe-4766-7f03-08d9d4d328b3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 07:22:43.6925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bk+fvIJYYINkIR6cfwM13/RAxJBhl6Ou5oAYSHMhLxlnV5XlOaFbxETeT688WpdVePToOlFbnscDOD7PxH1lDeQIzlNSo31T/3L0CM5nSgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1568
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10223
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201110039
X-Proofpoint-GUID: _rbvdEPn-y3Zwrwmp0k5BxOI2L3Gw6Ja
X-Proofpoint-ORIG-GUID: _rbvdEPn-y3Zwrwmp0k5BxOI2L3Gw6Ja
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 David Rhodes <david.rhodes@cirrus.com>
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

If we encounter an error after the kfree(acpi_hw_cfg); then the goto
err; will result in a double free.

Fixes: 7b2f3eb492da ("ALSA: hda: cs35l41: Add support for CS35L41 in HDA systems")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/pci/hda/cs35l41_hda.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index aa5bb6977792..30b40d865863 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -477,6 +477,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 	if (ret)
 		goto err;
 	kfree(acpi_hw_cfg);
+	acpi_hw_cfg = NULL;
 
 	if (cs35l41->reg_seq->probe) {
 		ret = regmap_register_patch(cs35l41->regmap, cs35l41->reg_seq->probe,
-- 
2.20.1

