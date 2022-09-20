Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BECD5BDD52
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 08:33:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4767850;
	Tue, 20 Sep 2022 08:32:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4767850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663655583;
	bh=mpoSyIDbobJKVj+2OfHqV33MlYtnJZa5Vpz3s0wmVPg=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=duGyWAU3OvV091y2TmE+jxonwixSLyt7Mv5HjahJNt1ch56s2tZteuHZRtcZ9/I4L
	 mRJsSfe8EImRRkkvLuwffHmWGkO5m+Xf1mesCQC73aLqQvwN4ztTGO0/Tff6nJkS+r
	 2/2GiOfTkggElFPO/jp+oRyIuv7ARdqalFLYg7Nk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EA10F800F2;
	Tue, 20 Sep 2022 08:32:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DF23F80155; Tue, 20 Sep 2022 08:31:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2119.outbound.protection.outlook.com [40.107.114.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D9E9F8012B
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 08:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D9E9F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="LAh8Zd25"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UwJq+O0upPqMm9kAobe3qAqQWCFJa/XVGtvMGwd+cHjhaNgk5YWy97q25FSSNCYBguAYPUldBx7HTqK1Bg+SZS/8vwiUpimOfoDf0P2kv+SJcCNjEy+e2nKjxDNZnafQLOQHzrpWj6kX3+516vUevbLVkMd82r0acYOWrLJeiM71bdgjjXdC8GF/jKlLVJ49eyoMOaczC/uMtr2s31DwMRPEoTyhFGnqzwndqQ89aJ+DC0+HCgI9Vv86pDOqhjsD7//1Qcsu4g2fJ8eHjmy49Q8cpT4btauWd8ezyGSvVXftac1NqbyKtu0QyKtyx9XYwA1k+j9tUhATp1uo6cie4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1wZX+Jdvx4UabdeidvuZ2IA5c5uTzrNoDA+6lm12kQ=;
 b=h4xOPiIJNW7zG73Le4wF3m3BAfflvS4coRfcHtwLKpBbl3yGwuFGh/nFRUjHwfcKOUOdBZNYHNYyGUCRlSwHZL51WfcD6A0wXqKCvAk0qwThN4NiPRY2I5VTpX3EYaHrCeRCm3lfpj6ICEP1e1zOKsmjKIaO1OfO2OlTwYGOelncN7yLGuONDgCuM1b8Jnv0qTOCv0LnJ4MfBP2rH+G4ivqFfO4HCch6MRckD559ukrKkZRBH9TlkVmY3krVV/EAVHoNZtgzCsCSSzu8KUxi7rV8UAfEG5AByuHQOeMTvjEliwBH1xU8qlN9GGlf2V3oHaAkYjYV72sdrHJulnLeNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1wZX+Jdvx4UabdeidvuZ2IA5c5uTzrNoDA+6lm12kQ=;
 b=LAh8Zd25EOs/tmh5iwNMNXXKW01ADaEbA5utzgbcjikGjEx8xTCQQ9hFc96bU9nOCdYWLmZc4YVVucFSWBXd9frg32nIAmRTIvbsrsmkwu1bFTxPBL2+We+1cy97KQ/toa2ryZZJr1vYhY17yk6x4oIyLrKO25Wlcf3U3xM6+Lc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9610.jpnprd01.prod.outlook.com (2603:1096:400:1a7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Tue, 20 Sep
 2022 06:31:48 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::31e5:9cdb:edd5:cf96]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::31e5:9cdb:edd5:cf96%7]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 06:31:48 +0000
Message-ID: <87tu52v9nw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/3] ASoC: soc.h: random cleanup
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Sep 2022 06:31:47 +0000
X-ClientProxiedBy: TY2PR02CA0061.apcprd02.prod.outlook.com
 (2603:1096:404:e2::25) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9610:EE_
X-MS-Office365-Filtering-Correlation-Id: f84577e8-6da0-4abb-898c-08da9ad1cb94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B4KDtHiNlkX5KeFJt06/ynpQ6coHfPyfDcIxB3DgzU0Cf0mTyN3IHcicBOv2sfAi2wyIqDjNWpxfDUSwQEW2TByU62FQtxERnqwqYCoH3ZjGjV3tf7j7LpNnojMInwlEH0KPTLZbQpDGqZEe4K30PxftvOU0c3oH2GdQ2jQ2qEzn5nncs4Df5BzvAFlSVdaIEWFMBpyquCBZxmA9y+MXUggTy3jRjZRo2gtHoQFOkHwClqJyDYT5MALy2/LxectMi/vdUl4pRXJbyVCFXv7JAk9gX8M59xrg+LO2xI5ul3b4anYPAscrqBoiBgt9VhI3RFfajNlnfpSEx8cLEc78SGeyxxObIC69OJk29A/j/4BCxZMCKaJa3f3CmRxQol3Boz/7oVNCb+bEn4kRHJxVZQ8hS/vnreHPUM7zTJBA5R/nqxlZHdBb4p+p4zeMuLXX2QfPMptBGL3daJbntNmUJ9/IYnQ8I/0Jnh/CwowTAVnezauNrZ5PUZPipRW/9fzCjo03JC28sehjWGs44yo4HIEsBbny4TSkEwRJSZmKFi/URHg5ihjb4uglZjlguXMsDSPKQP7ZFilVy8FPRlyvScRHxX8OQ10ax6jaR1AggRH9lTCANdLYnnZP1x3YydCwpqPR1BzVXIoxLZhLb/FKOw0mNoMcirqSUcw/R327EztrpcxaqxntusuxkmM8mouMQ7HA2XHQsxZSwcYIwwOUBVWRmLOrFYI9uN0SbgYc7PVHMkaY31vdsNS+t1kvkaHwlpKuIQ7UoOeuP68KlHmLNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(451199015)(83380400001)(6916009)(2616005)(5660300002)(316002)(4744005)(186003)(8936002)(86362001)(26005)(6512007)(66556008)(6486002)(6506007)(4326008)(2906002)(52116002)(36756003)(38100700002)(38350700002)(8676002)(66476007)(66946007)(41300700001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DNjs7GrNWjNtxtAYJRyU4CULCm2I1RAT8v9sX33MCtXomotWIG1Xr1k5W58A?=
 =?us-ascii?Q?VIUrJj4FUr+XM09Aykg1u9ugCiWxcCWiozFxbbMKNVtoHAyCJzkYF7l6xExi?=
 =?us-ascii?Q?hAj3ZK+sb+oVIFxi+uVh8T3sfPiiRsC86Vy4yVFTSgNnCCNSY7JeigAt9EDk?=
 =?us-ascii?Q?vcfbsEHaj3I3Y8tVr366bPe7015SiCO6t/uEm43zcJfSO0X2izOwCNXchuIw?=
 =?us-ascii?Q?yMY/oqXUv5lpLnYkj3HRgJko8to084dC0myzmc6dqOLI3Oqy+6tL1g8WQRup?=
 =?us-ascii?Q?EKHo5ER5EQ5Ye0jTxO1q8r1ZJqGPU0f8o6oVOpcz6D9kJ0xonEHDAmEZp67n?=
 =?us-ascii?Q?D2oeaaq0zspj04CCpi+0ebB49xhuG0MLZ6Bb+bGlwDeJt4Vb/y8snaSIDE//?=
 =?us-ascii?Q?KoYW2tjJtEZAKHLdFMT1nbWKjZXUsZuO5Hj5LWrPogCKgXvJH2oi46s3PDuk?=
 =?us-ascii?Q?xYlnE84dpGnjIY+MYVP1K0ya+7g6OiT/tP0SClG6khHtWJpLfil4ACU8FaNl?=
 =?us-ascii?Q?sD0WLdBMBaDee8Xop2KAGfLvcH0U+V3pRdFxRm+9p68cRge8iu9M0SSeciou?=
 =?us-ascii?Q?Kne64gG1o6NvcGBFHiHYiO6rTrFyiur/Q/rVhGKoTqu2e0jnOZ5CYXIxGMh7?=
 =?us-ascii?Q?QsU5FNu5wQ+Y7p7h/7mSbUgOSmHXpHTzT4oTkFKDMVWYWqebSgcjMCdi3tVu?=
 =?us-ascii?Q?hMjpGj0s2m6VCtQx15JPMQK/laQwvCQQrHE/dKbrhBzhIEV6F7+7QDIidxmU?=
 =?us-ascii?Q?RS+0BIatRmeRUrB2UYeO2DmExi0AiDiVChiLvoo9vgd8cWvkZcJrJTezolbO?=
 =?us-ascii?Q?fMqk5ybSAcKjL+ue0im6uGgAyB7bsyvhJoxShVR+AIwdvXHkg1zLzitRoW7P?=
 =?us-ascii?Q?U0ujOJLO/kcqk3Gi5c5+4t/qlo/qB4lm9XadqDkDdev33FhDSVbq4sJi+Nbm?=
 =?us-ascii?Q?JZ/4zzhY9BclnNUQdkWOMG9pbnSfGr6C0id9NEFhjuCe8z070yFYNzAJD08W?=
 =?us-ascii?Q?Mmt0orciH0cEdqqlcV0zeTlFxoEWRAmrMnfRIB2tG1evq+3GfNLru9bSt5Sa?=
 =?us-ascii?Q?XnGvFMXekqE8KQ38A+q0XUHdGtpWR3039ievqpbai2l3bpWEi/S/okJ5V1hY?=
 =?us-ascii?Q?I3HfHCaVgJDpeuDoBJffF5Yh8CzcMyYdOgEfJvMmHgLDI272a9+DCXNVN0Bx?=
 =?us-ascii?Q?JK9YCvujv2Jy6jrnmwDSdDUHH2gAhFt8Zh0e4Kz9a0kpb8AWyP95WAm+Rxyz?=
 =?us-ascii?Q?PBJhNMKr5RKN2Y+XLPopO4B09jGZ/Su2/bWyw4Of3gQDwVT7SbN6DOqnL4hK?=
 =?us-ascii?Q?fClL29Ly9+Kvphut6GAsm1AEkB0wgoA1UmZnM6QaXnslsZEFkOXwGYxSTBnJ?=
 =?us-ascii?Q?upKXSGzd8uoGnqV7PjzXerKtM3Y0xNldJjHxCCUgBDaUmyNx3dHDZom8OXUo?=
 =?us-ascii?Q?zJ+reBHAUz0z+XN9z8gyo5KPHQ+jiNhvUt+4+MBQwPpoI5gK3xO3moZsmvD6?=
 =?us-ascii?Q?59tYhIMHUO2/9v9HiG8V6vPfXF8TdikKl2WkeqznASx4rsqpDJGV8dEYsYN6?=
 =?us-ascii?Q?96ODmGfbAg8S3WyhsshFFZ9s7JGYtZTccsb/qCRbb5WfOjL2yQ03Bmdd8SIt?=
 =?us-ascii?Q?xvkoogA59eM+H9sHSWMmSAU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f84577e8-6da0-4abb-898c-08da9ad1cb94
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 06:31:48.1947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dchc6X52zfXHsVYubxwHM72ACLdLt4qy9oMNfxeasld2Xz2V+DDpzUmLzZHQTiPqSV2UYAWjefTfSv9zIrdNDo/9ZsiBUVAekGjvTJgRt/a8KoNTFEzxNScff/CQeOh0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9610
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


Hi Mark

These are random cleanup for soc.h

Kuninori Morimoto (3):
  ASoC: soc.h: remove num_cpus/codecs
  ASoC: soc.h: use defined number instead of direct number
  ASoC: soc.h: use array instead of playback/capture_widget

 include/sound/soc.h                   | 16 ++++++----------
 sound/soc/amd/vangogh/acp5x-mach.c    |  2 +-
 sound/soc/samsung/odroid.c            |  2 +-
 sound/soc/soc-compress.c              |  4 ++--
 sound/soc/soc-core.c                  |  4 +---
 sound/soc/soc-dapm.c                  | 23 +++++++++++++----------
 sound/soc/soc-generic-dmaengine-pcm.c |  6 +++---
 sound/soc/soc-pcm.c                   | 20 ++++++++++----------
 sound/soc/sof/topology.c              |  4 ++--
 9 files changed, 39 insertions(+), 42 deletions(-)

-- 
2.25.1

