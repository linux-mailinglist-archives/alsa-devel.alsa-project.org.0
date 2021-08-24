Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7F03F5B1D
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 11:31:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE77D166C;
	Tue, 24 Aug 2021 11:30:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE77D166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629797484;
	bh=vLqXbbR74I96S78S/DZbQ1TCtPq6H/p2WncxvnwvZ5Y=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bttUpYSY5yKnvYVN/FMLtL7eyC7yH4bUZyoyecQQspFZoTXDn8GdvuWElRYH2qYIr
	 8TpYivmtT33vabhjwtf2+80KzDql0vUJRU7qHQ1Nqp+sr7wAylQhPP3BZ9HwO9RmKm
	 zd/Pg+lKEtNk573FE42n85L6yiIGkELmyfR1ZrlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E9A0F80171;
	Tue, 24 Aug 2021 11:30:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE34BF80224; Tue, 24 Aug 2021 11:29:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MSGID_FROM_MTA_HEADER, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB754F80171
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 11:29:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB754F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="z12/jBLl"; 
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="GVUC8wi7"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="kK+aI8pk"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17O7M8d2025062;
 Tue, 24 Aug 2021 09:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=6KYVYVMDjAhSiTqTqTgePE99nt/zL23pfH33kTqnaPo=;
 b=z12/jBLlKgM94w3K9sv1hq9JqRSE4NaCbU0HycgtgrZj+DWYct818VPTrXCarb2hRD2f
 YOKxkZUDqABi7l1vGZlJ9rWHqsYoge5CwBUcPa1fWrn4Vsj06ael3IfNtwshFJaO35sw
 Zr8vgVf0t4Iq6GmQaIM7yvTERsQqngL74ZKI6v+PQczckxqfOdNqdwVb8Ls8k13EeiOo
 5Rq85JiVtHnlXnnesxpt0vZTicVzHexA4w97vmndBvC8vD5l6PKTiNrdm+/LPsPnj6V/
 VqG9EqlMy20Yo93upN7+bLCDyBia3GxorrIww9TCQq+Y7DFL5f+yxgK6Fg1eY71cHuMy iQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=6KYVYVMDjAhSiTqTqTgePE99nt/zL23pfH33kTqnaPo=;
 b=GVUC8wi7Un1ricJOjNLstKM439MkGA0KKwqwuZVX1fVqD8dNdxKo5APfr+Wpe1FCuTGW
 GFbDxV57Q137mamfKhuJMsPiGI6E2CAIgObixiu5spBO4fSGF4o4RVUboW+ROTAN0eQG
 /u14q90Q9MJIVLlRpiykpv6LKKIMkDwvWDKH5DW1WuG4cF0QN4AYtYG90QYOusOStjV0
 xK/8ivd51TzjCDGA251Llu5PO900WnpPj2GyBc80Oz3Jgl9EVw45i0dpGg3ljJvDHnWS
 0D4MPKKJrbv4hv4X+TeC/dndCmkZeGo+smgOtTJ5P1aFAqwLII92vpf/2j/5J+2dq6FY +A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3amu7vrgta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Aug 2021 09:29:47 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17O9FPtF059671;
 Tue, 24 Aug 2021 09:29:46 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2042.outbound.protection.outlook.com [104.47.74.42])
 by userp3020.oracle.com with ESMTP id 3akb8uduw7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Aug 2021 09:29:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tx+Q80eocUdwp/547Oy7ZXxMjr6w6He71YQVXBa8k0Lbj7tYR0v7aBllfAMhd7VraDWKNjg5uyQDdSJIKX9omemP7Zi8aZdAwJjyJft3xlk9Lr45WQeoe/ALnKLnhtp7jgucdyBU5opzfO7l1S3glfNKKh94Y7brYRC20u6OC05T+rqXst4V3dXs21oQAsGMi+oE/YvSNF02Qn+EcgfSroY2iVI+1ooET4eyX3H2aNCEKnnm8ETNFAkUVhV4vBJiGudnDqZre3+n8tQe/pyK2xg2hLzQQJ6nRfeXF2QySPQ6zkaMzBv6OSeNiN75XNdj1LvpvCy1C5tozAaHN1TkMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KYVYVMDjAhSiTqTqTgePE99nt/zL23pfH33kTqnaPo=;
 b=UQRNxBWahs/l/95C5kwO6/4e0pTNIapLlfkyqttE+KnPpPCbiBYubQw1VqFdREUMqOi7YDHrOXSNcl/KhtAE0R5G6KXgbv5M2jNBOHL1AmOOD3kiaBURfI8Z+giJKxaMDGDixlyOmlf+mZHvVahLbt2Wc04Qmg2NGosTIO4h3opS8FpWiywI7HuSvFbziA5RK497/uxd2S6mW8gfYgFVMcKuPUSZYj/T46Dn+unbEISDPzB9FnvMtHoy4s3hvxcAjWnkgDimNboWkTxeBwpE3bOLdoqq2ZLp+woCR5b8aU2ayqm8BFbWB0zWS407kltM66xW/dYwOQIWngv/FRbGZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KYVYVMDjAhSiTqTqTgePE99nt/zL23pfH33kTqnaPo=;
 b=kK+aI8pkOGGodxWocwLavk6boCV2WEkc8yDiZkgkrusIjvHdquGUvTIcpJlW34Y7u5JaNJ73lt3l374JclRYaR0wZ9a6nQPp2wCIhp91xsva9uNH46ShbzuG/Zl7sxShw9sUFWFXuziBadc9/VqoouYDzzivFUTEUsHylypJ1fQ=
Authentication-Results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1296.namprd10.prod.outlook.com
 (2603:10b6:300:1f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 09:29:44 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 09:29:44 +0000
Date: Tue, 24 Aug 2021 12:29:32 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kuninori.morimoto.gx@renesas.com
Subject: [bug report] ASoC: rsnd: adg: clearly handle clock error / NULL case
Message-ID: <20210824092931.GA22090@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0003.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::13) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (62.8.83.99) by ZR0P278CA0003.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 09:29:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba05a241-ddd9-4920-016b-08d966e1b4fa
X-MS-TrafficTypeDiagnostic: MWHPR10MB1296:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1296BFAD90D7F6D55C0E0E868EC59@MWHPR10MB1296.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NTIpzkLv1tyy0pIm4MbbDFlziRUTgl4rq3QjQrekGp2LitoHnZ3wrnHqSzZv4LcF/IxUzaKI7DkYDcI56zNwN+UhUB4m/n7bWuraFycgr5nVA6vLtWhhONG+vAem1MSmu3CnuIwQPkdSOAjocOS6tf2vbVv4tBQxHI3jMMhHwnFnhWb9WNa109xQiAHym+07PWIMGnkQBYmbCGdr4YZZHU7FR0ePGHu5Bu0QKxxM7LCHPr5pK2dj0GiSLBu34OSDAlgRsv4WLttR0M9RzX+hDzAqgLTsYFSveiTgctKTcMq3p8+I/qbsPUyQlluxheFNk+jNFrhHDDlu/JtGHEHpokAMm6BxLsGo2Nfg6b2ckYZYfLYQUCJcPOFh6y/WWUugwwogzGnRTRQCyXLyxv7T8iOdJtF+FUhED9gcu1h+wFGmRx2i7MOGpLsn0IKbWYLtY3eObDCtNq2fRvkTmIiWqNZm4EKFxdIAmHQZ70A1jM7jmLHachqm2am1T/Ggfsn5R6lD3pp9nhDhwfgdhkkI9kfvILWvye2BxwXzKMWBzAMOkHsHWUysEnTkaOQ6+9sec44DYGDgUl/ttbmQOycSanJ7UNDVG7wvFQw7t/VZt2oQp/Wob28tQquUGNUK9JkMj1WuplL8x7ctGrnsqctboE6UrITAIJufHkRK0S6dmcEmH0yjL9DEwTdTLt18jGTOKQY6soyMKGOG4MD53bFhhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(39860400002)(396003)(136003)(346002)(8676002)(33716001)(33656002)(44832011)(478600001)(5660300002)(83380400001)(26005)(2906002)(86362001)(6916009)(6666004)(316002)(9686003)(1076003)(55016002)(66476007)(9576002)(38100700002)(38350700002)(956004)(4326008)(186003)(6496006)(66556008)(8936002)(52116002)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?12XQo0FK7YIXt48bpp+0J62yc93vAdXVMmyLZt/i6ROa1pK6yWoVab06Wl9b?=
 =?us-ascii?Q?h1Wuvfm0HG5udLdy60vtdcp7qkLV1/9hl8xUhAPJBK5cuFrfgfwCVfw3CNuY?=
 =?us-ascii?Q?V7kZaiE9IIu2+zxBIw39tp2udNVWIxvaIT/gUH3nfGWKwGOMdzlALMr3PTGS?=
 =?us-ascii?Q?peV0EF0CFWjOx0le1LXRc3CvbCoaM3oaYEf/WZfI/vQxN7yS0utz2AvUveY1?=
 =?us-ascii?Q?z8VxYyo/a7eo0vrYa2Qz05BdSk8f58ZWtIjrUTIkHfbTWPHs0JwABT0dCRDL?=
 =?us-ascii?Q?xhSquIkypKjtP8bBCZ0FpvSXxYOvMxwtNgYRD/YbPCCMjSagjwbqwC2pNJEI?=
 =?us-ascii?Q?/Oy7WYPlliYrWUOoHzJwCtxHAsMwkexXPib6EpIFp12FZCp8+xemuB9FcSfW?=
 =?us-ascii?Q?INVQryvgMS3xB7Ie2ZY6vNVz8rDZ16bYDQD4THl1xylDWAywT2x8TcKXfWCs?=
 =?us-ascii?Q?Ld4bp+ONZZyywkMzBpsXqSsi6lS2ZMBcYv+tVqPr/VeOwQBZTj/tcqGfPGKO?=
 =?us-ascii?Q?12cQvGs/Lknmk4GrrHyYKkYWOXBDd4+EHDDP3CtePWTFadCokEqdcf0RO1Kk?=
 =?us-ascii?Q?PafWV3UANWLkGDr9GrrkCv0eSCvZplgWUxd+rUmB52zSg1Aoteclcab0Ai6B?=
 =?us-ascii?Q?5ISMQez6VSfY/ix2UlTmnCpNubshZ1v3tC1v9oxONcs76i22ngCiIuN91vU0?=
 =?us-ascii?Q?WpOOi3U4MqPUPM56HhOQBCaOhGTVl7D79grbCG9lNzOPcC1N+2dYFytW5cQI?=
 =?us-ascii?Q?zFaIcQRLsGuDWu6k0EmWVppjJN87yB2gZZveA7QYS2XSEZJeEgkjDg9NiNCc?=
 =?us-ascii?Q?zLDzyExrJdicmXRvxCRBp8NsaqSIAlzfhok2vpK+DmQ0pRznOX73UQjTd5MM?=
 =?us-ascii?Q?JeTKRrOYsfmGOfZ331wHM2/R3y6zMXS+HnQgMMYscW40005dmPSkD4a2xsSo?=
 =?us-ascii?Q?HxZ5Egrr8HFu9AeO0HM11WsgGbe15C3/X/CqCkdTB1mmVfkxIL5otBeJujzL?=
 =?us-ascii?Q?pwU/P+HKLDqftcPm7PWJ7keozLzuuOavhFOdl0c+fLcudXHjz5cuZ+kcjvSh?=
 =?us-ascii?Q?C0iT5iopU/ot0Laq0I4KSuT5m73biQKxwmrzgzRJBb/73JIUEvnIjboSgWnM?=
 =?us-ascii?Q?PKrzu+jQcbB3EXTLnkZJoFvm89SQKK2e509zyoabCkmGMXaDMgk3tmVnGtEY?=
 =?us-ascii?Q?pLmMeWr2/Wb+GCdDRCcsbbIiUxpgw6Kxdz9D9aER2jd0GBYTqqhWuPXagXfy?=
 =?us-ascii?Q?fJxOuQXgpS+PXEJz/LYx/MFMEn4leKCpEmIxM708c253f10xHhMcZovPt+PS?=
 =?us-ascii?Q?uzAPrn1c/MMzWL/GvB1OQwdz?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba05a241-ddd9-4920-016b-08d966e1b4fa
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 09:29:44.0593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yvDXlZF2OxQ8vj/RT8G/Z370rgZfxJcYrQ0h+QgacHEKT3VzxTucU/QryszMb8f0cYtR0I0u5R411Lyw1UedXWb601iPSYVknjZU3mXaq/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1296
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10085
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108240061
X-Proofpoint-GUID: HkbKJK_1hVduJHjLcuZOuPcTkZ05fDEe
X-Proofpoint-ORIG-GUID: HkbKJK_1hVduJHjLcuZOuPcTkZ05fDEe
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

Hello Kuninori Morimoto,

The patch cc64c390b215: "ASoC: rsnd: adg: clearly handle clock error
/ NULL case" from Aug 20, 2021, leads to the following
Smatch static checker warning:

	sound/soc/sh/rcar/adg.c:396 rsnd_adg_create_null_clk()
	warn: passing zero to 'ERR_CAST'

sound/soc/sh/rcar/adg.c
    386 static struct clk *rsnd_adg_create_null_clk(struct rsnd_priv *priv,
    387 					    const char * const name,
    388 					    const char *parent)
    389 {
    390 	struct device *dev = rsnd_priv_to_dev(priv);
    391 	struct clk *clk;
    392 
    393 	clk = clk_register_fixed_rate(dev, name, parent, 0, 0);
    394 	if (IS_ERR_OR_NULL(clk)) {
    395 		dev_err(dev, "create null clk error\n");

The clk_register_fixed_rate() function doesn't have any documentation,
but generally when functions return a mix of error pointers and NULL
then the NULL case means the feature is deliberately disabled.  So it
should not print an error message.  Perhaps an info message at most.

--> 396 		return ERR_CAST(clk);

No need to cast this.  The types are the same.

    397 	}
    398 
    399 	return clk;
    400 }

regards,
dan carpenter
