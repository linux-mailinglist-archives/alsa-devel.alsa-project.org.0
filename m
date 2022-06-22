Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE8455427D
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 07:54:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 295051AAF;
	Wed, 22 Jun 2022 07:54:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 295051AAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655877293;
	bh=4P/IvA3SXqUl1OrZU81GTw4As4XbhNu5mJldnu+kcj8=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QTA3kpr9jDzyoDSE/8tSwbjqW+Znc+O9kgG9jtik6B55289wHbKhmEow2YF6rGZp6
	 4nU8XARL+wfo+gMec49vPSVPPD9msxcRhuJTXHi9DUyQtCD7ABinUISUd6Ij7CpxFo
	 v/o9vxF3dynQU0RiurDzsun3/ar5TRdiqGYFRow0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF33AF8019B;
	Wed, 22 Jun 2022 07:53:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B4FDF80118; Wed, 22 Jun 2022 07:53:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2095.outbound.protection.outlook.com [40.107.113.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51A0DF80118
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 07:53:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51A0DF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="D4g7beqV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bg5PTrHip+0gu6Ur2HkP8+sGb4ATzscvxoc6DAuOvdrG1aOnsqDALarNNMfeIEnuN2zblxVLaEwf7YrJVQBfAfUAmgFJzRyCamJkNdQ2ET2CO9qQTB23ibT0LHc9tPzRpUHwtEoFwhuyFDiQGOzr3kcMutG+pJRdWLMq2pCKRE4/Ug1YX8H87P3BinuM7tKfz6lC6pB/vKjzACUnSQDZwk1Jq9yt+3ZS7H617Rk3ancQ9KokRCvDZhJg0ENbV0h3LSbhaRhFgI/GpCrtVZAeAjIARo7rTdGiPesRsT7fFLJlKtzD7bN4OBn+dydfg0ik0XgsHp8PX0KeaMJrp4gCyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VSPsbEBrJgKMVRGO3+WPNALvOO7rBAsLWjk3JNoPEQ=;
 b=fnT6vbhTNeYXLu4RDN+Joa6cebPGbCA4CfHFRzz59/VEMkTOs4+iuD7aeoR/yTulqtCb/ee+o1GfrD/ekxcUGdpxaxQ2fmI7SDboSP0Hfmdjp8DwzFtppPxHhx+zfg6Z1L1hpK+UJucB4WUKjjEQp4/FAIfT/Nf19W/uHO7YiqfjoiKb9vgp8TSrzTica8ug9+JZaEvUcaR3BdwF4/P3f2yXhFSWL+w+zMHPmK8eCy2ziB1adAqd1q7FPZtuNZtVdcEYBU81m7QlIl88TTul+Us2Z1AvFwpYaNFicxBnkHzdC1zAxk1s9rYi4GGu8yZbdhCZv1UWs/SDrnDHQ5AQhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2VSPsbEBrJgKMVRGO3+WPNALvOO7rBAsLWjk3JNoPEQ=;
 b=D4g7beqV5RbCaHTmpUdW3uGMTuuoOkZ4w0c3Er7yMvRDqeHuiAeltuf0ul6v4SY6t16i2lO0QAq1oMziVDCR8024uDsVDdgKfe4vlSg7sL2Io3+pbZ6OIyTu3oW/hp9pylrTY93EtcS5Og0xNuSF67/FQBPts8bw5GqVQmGMCtE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6929.jpnprd01.prod.outlook.com (2603:1096:400:b8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Wed, 22 Jun
 2022 05:53:41 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%8]) with mapi id 15.20.5373.015; Wed, 22 Jun 2022
 05:53:41 +0000
Message-ID: <871qvhqm56.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2] ASoC: soc-core.c: fixup snd_soc_of_get_dai_link_cpus()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 22 Jun 2022 05:53:41 +0000
X-ClientProxiedBy: TYAPR01CA0073.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4aeae8a-80ed-413a-39f7-08da54138f89
X-MS-TrafficTypeDiagnostic: TYCPR01MB6929:EE_
X-Microsoft-Antispam-PRVS: <TYCPR01MB69298E982B00DB9062D2AE8BD4B29@TYCPR01MB6929.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +CsoqxXdtJpnd8Z4i43LEsxc//qNEQfrQEaKR54ocLr6tuwDsQp1klKTvMvOygTjpwKgs8e2zePemF2AlqBGScA6CuMsUOmRQM5Fyih/wi/+EuEHYFqe7q2EyZzd7Zvh2wYjGWmLHEmfaberkPD1TnGDZuA02q4s2B8iIZT8Z2V5xb6NjG+i+CpoB9GYrcOUEAnxFP7bJmURpd68CE2MLMRfAccgPPBMsPoNCz2/bbZw1MpyK6iav5dy+Ri2bCi3V+IFnqNx2hIMmLRFcW9NIt06C6seXrYgoYMSVQ+9i5LYUIg28sSom2LOKULHzhN/uWMjDheHZIQm7a7J0uoz1X+KGqhJmHz5VVb1Aptt7dFkvjlYmFjsA3kHhHn9WwNXiWagEgPchrojbGvAA0526+BodkDd0o278FBmjQsg8v5ur5mgp2FUQRk0GLh6BRrJMRykeq9IOhltiHkipXjIEoy3b1iTf1ZWDAYzcjZQOv4vol+IIW3q23vEOkUsVJnANV6IrxDPedb/aktiGIiWgRVCZfVEdef4ugHQsXBf7DcQhBtcLWzfUAMbTaBauTO6ZCx0Ho9yZy/tHLxOxlIJBWUZVufm/gSOWUhBebTDnPcogEPGXoleEkrs9V3vWdWEtQSMJtxmU4LcbiV5goa6Orb4TM43lOOFv8vXlJ1wu0zJW7zW27xFCtRM/UbPTtFs5g54JvUXL6kv+m6H1PuuduymDSvln1et3tJjBXgcfF7nXsQ/92o3DR0CknGSdsWr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(316002)(186003)(2616005)(38350700002)(86362001)(38100700002)(6916009)(66476007)(66556008)(4326008)(66946007)(8676002)(36756003)(54906003)(6486002)(478600001)(6506007)(5660300002)(8936002)(26005)(6512007)(4744005)(83380400001)(41300700001)(2906002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MSL8vCd0aTqRgL9RwGBFA4E9+nPWfXRgAcK08/XJQlW+nqQ6bs3ukk4eCUI7?=
 =?us-ascii?Q?n65OTQnUCFcJfWq0uFwFk62v3/fKNrtXX/IZO3Ez8Skc5eXhOkf4r7Y+0xlW?=
 =?us-ascii?Q?4rbKGujjmc7yCFAVK4g8/xzK4Hmzv3a49YV0MxNXdesPKv+jmj03fMtij4sc?=
 =?us-ascii?Q?n+32DD3jDkApKv2L7eyto1baYWcJJhUBSzNSrCswe45lZgcv5MJ2GzMJemnv?=
 =?us-ascii?Q?1wYjAhETQibX19aWeecm4pBQlLMl7sxdcrWFJ9stn1guWxxRn+un6xk91Rxr?=
 =?us-ascii?Q?HfOCiFeawtoDb3tWW0l4tk+t8oKXPRS7ywXOucFmYZCBnRWyL1Yz8XA/5AMx?=
 =?us-ascii?Q?/qBerob4urzN7e8fa+DRYLSLiutmWgwq7mr1xukkF5dJfbE/dT6oh1LWqYD/?=
 =?us-ascii?Q?zoPvN/qufBl7lciKC6hBxWNLKfKfwgRlIbn+xN9nWrGqM7GbgUomNlzvsUI2?=
 =?us-ascii?Q?LS7SwJKXm85VF10EvcrJtFX24CmRDeF2XfypFP9PksGWFFaTIMipnFXyvzsu?=
 =?us-ascii?Q?vtmGmobgMGl9cnWXJrbYoJS5AiYX4/D0fA2+CDOKufefWybM1Xl4ktgtn8a+?=
 =?us-ascii?Q?UzVf1FS1/JiwopTYuV9i7WvomAKkCRdOn7Db8ffWoUw5Zi0uLrFD0yxW1bcU?=
 =?us-ascii?Q?d5lNnP5ZAwhbdPFEc94t++nOiwpRd6sZRlQssHvW98/Gd6tKQb5fa/uczx4v?=
 =?us-ascii?Q?9PTAAL0BTTEre2pYcuXRMoJZcVZ0ZiCwwN4KYyCdHQw6SeCGhuAPTuuzRu5n?=
 =?us-ascii?Q?7pKMG8Hhs6NBweJSguqjT8iBKj99vy3cNpfAY8Qik2aqzCGX72GHWTrsMdgU?=
 =?us-ascii?Q?TeTAaXPFTgNTgyWYR7RY6zV6iP/z0bQ85EXXEt94VZhyutvloU1/gfJkiGsN?=
 =?us-ascii?Q?gba79Am/6SgeVnQk7bET+Rj79IXCf70IAjaHriHMJmoGjI87TCMBNpMLF2oe?=
 =?us-ascii?Q?1RzRLyt6QvjNParQPWnrHj5ccUH8KdKCMeLTknFDOm2VaGApdwlhx0yEr5Xv?=
 =?us-ascii?Q?kqVZCisgFyz9f9KrWHMVYJMqxagFp3TkNHhgeYFxVihy1nweqQiUc8V0X+dT?=
 =?us-ascii?Q?uvfQ7tkKpO42p0EgfXt7rzzoMtMY1YcqfS6ZKB3I8lbAZt4FW7v9sR1lBMGp?=
 =?us-ascii?Q?oUvrKVi79323E4Mr/CCQIYHo+/EAoz1xaB8nLdr15P0WSyJy+I/7AHi08kNK?=
 =?us-ascii?Q?zeoTk4D+KrK1r+pwyZCm755lLI9X20jT6PigyUKuqZFjBO+jRaUyH0i0A4SY?=
 =?us-ascii?Q?y71gcdzYymfQdUSeNNDUKOtZSQTGk/z6x6aNF65ibeTtokYvbYkVvL7OkZPF?=
 =?us-ascii?Q?PKxiVbtKMsH8KUfo6CdJLxK1VAHjYbJLa7NCTSCiQfL9JXUnLmdOc3LNtHHg?=
 =?us-ascii?Q?l0Z5UWYDPhVnYPAm9ToglcUr/G/Os1uNAF5OA6CLIV88tZelSNDm16MxvGjX?=
 =?us-ascii?Q?BcLSsFRK/Rl8QMM9zywIR40QEhqvReo04uflrifwwNYM5bR6B/sUDsX8o2LG?=
 =?us-ascii?Q?HQ6/fgog/w0ohil8gXbkvimXex3W5oQC/MqWGUpWUzCKm1fJ05ANgPm+PY9w?=
 =?us-ascii?Q?kJPGHKSTSFtk4hIAN4IotmU050y+Z5Ioe5uaICatvO3OMUG9zXNepXMT8Ds8?=
 =?us-ascii?Q?/tFzKBGEffoxexDvuELbUSoCm6gOifyU+1mFYzk+nqwcBBBcaQGlfLf0/AgX?=
 =?us-ascii?Q?7CvX3emTKfTLqvA+OKdJUEyOHXHfFfWPOfaoXthSWVAGw17s8kUDSBwePkLY?=
 =?us-ascii?Q?+ynSY/uoG7N+XVm80M9ys9gPotk5ruqcgiZjY9MLUlrKOr8hGBCW?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4aeae8a-80ed-413a-39f7-08da54138f89
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 05:53:41.6530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vdl2tkjeNXHc9x+/kmFk1l3B/xuhhc8g7H9+7KjSewMJ9V3YPAK7oS2b0xzL+OHq+tCanh6L5AtgTthSDiVmYBBL5c3wM77xzOXqYmVdEZKQYcWxF0m3NYHl/dJnWJlT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6929
Cc: Martin =?ISO-8859-2?Q?Povi?= =?ISO-8859-2?Q?=B9er?=
 <povik+lin@cutebit.org>, Linux-ALSA <alsa-devel@alsa-project.org>
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

Current ASoC has fixup both snd_soc_of_get_dai_link_cpus/codecs().
I guess cpu was copied from codec, but it is using "codec" naming everwhere
in "cpu" function. It is strange, and thus, error case will be issue
(It should call cpu function instead of codec).

This patch tidyup it, and try to cleanup.
[1/2] is for bug-fix,
[2/2] is for new feature.

It needs Tested-by/Reviewed-by/Acked-by from someone.

Kuninori Morimoto (2):
  ASoC: soc-core.c: fixup snd_soc_of_get_dai_link_cpus()
  ASoC: soc-core.c: share code for snd_soc_of_get_dai_link_cpus/codecs()

 sound/soc/soc-core.c | 146 ++++++++++++++++++++++---------------------
 1 file changed, 75 insertions(+), 71 deletions(-)

-- 
2.25.1

