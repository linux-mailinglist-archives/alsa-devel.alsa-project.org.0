Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 872FE6D8B8C
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 02:16:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E78301F7;
	Thu,  6 Apr 2023 02:15:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E78301F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680740165;
	bh=diRjpJDvyPIY0bcZ+gJaKvZ2adShAM3f66ROuJAAL1U=;
	h=From:Subject:To:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=H/iFyskU09JZR8NP4lqLbFEp7o0g1zYiQCqkBGV6BDcXgF31Y6DQ+MvvjjjVW0eXX
	 ivXNpGRBg+q2iJ6/dobd25GJ7D47PCcecMcYMEAF72CfghvDaK6H63+TveJEd4i1z5
	 DFT4l7VySLc5jgVVKzL+qfgBbOlT92X7IvEv6Elk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 272D8F80171;
	Thu,  6 Apr 2023 02:15:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8456F80246; Thu,  6 Apr 2023 02:15:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20726.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::726])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8125F8015B
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 02:14:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8125F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=RTWQco5f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjHBF3EHpHAMpZNsg6Gw6ZzkclCrens7C2s61kVV56vrqjlkBCsGL6rZCWGG0eq9RvsjZGFy8178vpjPjsfN9rl6E+ZJmRd7TExrr4hz28mtwZWulmLZ7Kjg4rGy35OFtrm3u6vbujfQ+FLLwA1JdQ34nH34WIxIhZsQhpFTRFTGEF9B1SLDyl21InKGLdsY5gNDFkene0YxZflaIdCn6kifduuACmgtDXx1QQ74OsGO/nBRx7v24y+d1LGwTLicsVP4oL2ATk9nRNIUcIegqKUBvEnUrh0vRxgY9mtC+AxZdysIJ4D1IuzW7eJ7qPgRWlhZV7I14zhE2iX/hVa47g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OXgjfXAIWuKBptx+o52M1lOWv/h358WDzYWCvVnwqA=;
 b=ZoJjQIt9VMwfxvnAXSPQLuNX2WkuaukAq9vZ4/+YJ+LpGZ1lK9HN14nAvrdHxLXCPX8bktUS+ciWxRwkGzGSxIwufehe+93E0Gw3eApbBBByEwtw+gJ0VF/tquTn+ocVUy1AIJUUl1z98ZF5Irjh/zsfmxcPqZv+k8aIQu/Z9LX1EWhiY4hZIkxQPvCs1r88EYRLr8zD/scqDzqZbJrsxIra36gcRaPjhTChs9sZKSjBXg/I4ebYdAjGNGakbhXRU7BnlU/ly1j3lqdz1aGmMO8k5BkQiosYMKEMrSQnZQB672yXi8N4PnTCaPbsc/ukRH9xqiihc0U9Xv2jpAZxaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OXgjfXAIWuKBptx+o52M1lOWv/h358WDzYWCvVnwqA=;
 b=RTWQco5fN+s1X0xzLLJJeqGmuUKAfwX+ZDRUsmh/ndPhvgWAi9gbodtWIY9lLutelFvoG3piRVP/6FA1oYSnTe9zS8nruY0i6VGfF1xHxIq7UYI8r5+7c0bIlKGnMDDMsMbh9iRRnblWC3ekaxHF21xZI8dkwBBXTMmWCu8aaGw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Thu, 6 Apr
 2023 00:14:52 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%4]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 00:14:52 +0000
Message-ID: <87edoxx3wq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/3] ASoC: cleanup mutex lock
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 6 Apr 2023 00:14:51 +0000
X-ClientProxiedBy: TYCP286CA0287.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: a0e0cf53-e085-4a55-4e52-08db3633f11e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Eo3Ylycz2iUBem6Kp/17DsLqhKV2oQGA5jy/+43tED/LJpw2fDr9BcTfO+mzTgwriGVXrxzFg+tB9RXqBqgJgnDD55zZB+QiBQwsBSix4ZXNVMY52hgGhkjwjOir7L9iTu+pWPOUipm0e7dEZ5omi+qiz0fVbkBjGSq1u7yTbGuoMPJUh8j4bsIMnlzpbUgtcUC/McTvvEfPMBIyfDFuKXHc9R43W3FBf6mhJ6+0aN9TGyecBn1AdO4onYZ7j4KfEKpLk2Q0LxNWF4E5iQ0T8GXi+w/GKpvg3ReWZlF1x+Qk5/QEkhMvx+LIODAtwqajpKrU0E1IHZou7Qz+4+SHwgs/Zyim466O0tcEri8dBRKYL/MlkBmfogT8V74KtvpotDSIy2gSEzHjco7+bQHc3lGjpWWKcDDQAOLIWFSjCSirR4WGNmjHK631DpucIkriKpKKRCl1mPAWc3X0POlMSo5F/n/6wX4yQI/aemnAs9k/mPdhbhAycv6VnJrnF2B1B7n4uNaSvqIu6WKwxT6vn8PjzHgF6/v02rT1MmKnW5DdcJzEYXVJv3XBV44ufWOI11icgfq9rg6fXkJ0IGwcEXTwCAP11tGw0gUuc41aKKKhXSlfD6cRtKTb1m8oLnTs
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(451199021)(38100700002)(8936002)(6916009)(4744005)(8676002)(4326008)(66476007)(66556008)(66946007)(41300700001)(5660300002)(36756003)(86362001)(6486002)(38350700002)(2906002)(52116002)(478600001)(83380400001)(316002)(6512007)(186003)(2616005)(26005)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?c72Qo4QSwQbvt80cikihxJUs3qDgPO9N6BwXDxaqygxdGQhWO/Urtqzx8/6r?=
 =?us-ascii?Q?fugl7FrRhSSrHneZRtJ0cCnqtU8eQY6cBShk4s+hBkXeyjlCjB4gl4ReP4Nx?=
 =?us-ascii?Q?fY6P7/KeZJKfaxYHSzdNcvHAcOxG1rkI6A/gZCWXSAo2lMBGlyEHIxZzxsPq?=
 =?us-ascii?Q?XtKFPNQl05bHU+WfMdvUXdD6lKvCj/zBElcZcrS0MRxY7kNrImC5tgbayAn6?=
 =?us-ascii?Q?/EGHQJu3FryAsUnVPgPhqH2JUok8Ez4LRaYa6omD23QeK5dSB5EPAfVynYRf?=
 =?us-ascii?Q?fLK0C3pSmd6+rv27QsvHdsOHztV/kzqJwU7S19mkmWXZQ0O/z5R9lzE60Wp8?=
 =?us-ascii?Q?ksyIokBA+L+e0jJPeeuCt29GL6txomunUCMM3iotuoyZEEbZX+N2WK12lwP0?=
 =?us-ascii?Q?wEq4CLl7LqSUiotJaBxs3+ITtBTeZv3JI9QcSdFqssfzkLEvWmchhsx/F8cv?=
 =?us-ascii?Q?TxD69crSn8mMXJnf/eGnD61wyfjHcdoxee6LafKd+ib05gdSTgXVQ37JBt6q?=
 =?us-ascii?Q?yolDxcwop6YnKeBu6SSDhIJ6JKHqLEruDoGQUPlteRlrcEbRbUi0GXXc4v8L?=
 =?us-ascii?Q?e287lhB5HYMZJo+KR/cme8DsyVma9NBhTlpcW/2E1mKXC/Kpe27NIZQF82I8?=
 =?us-ascii?Q?mmb3ZTCwCykTBKxIOvFop/eQe1uB1l5/JedlDh05QmGa6ta4Md6Ix9p2xnTC?=
 =?us-ascii?Q?8F7ncBkzt5zUuD/pn3OnEEuwvBPgZZsXPuJLA7ye5yRNgfjtBaQnVfOIR68W?=
 =?us-ascii?Q?wWd7QtvmSot1DqwxFzi86oRPm94+9yh2bYy/AzAQPE19O/iUjfs9YYt0gXxK?=
 =?us-ascii?Q?uzjvVcQmQTIa8XTMtU5ITI0TzzkOd77cdzLDOyQOmCDmkR53CF80VGcVaAt2?=
 =?us-ascii?Q?lFyWL2lXfxf6pol71vgIW4arV8BEutgUNnBNe+V+4ynFPDYhacUU07nxQd6G?=
 =?us-ascii?Q?+ALh8zCkW2Oa6SCcWhRTzRS7eP2EBQA+ePlGeY3cE/F4hYa17UNHMIKQYVKG?=
 =?us-ascii?Q?vch1D5WJLgIh2lmzrynM/z52p/1yAde/VvaBm/pmpJ0i4X4Pxv9//coF2iXe?=
 =?us-ascii?Q?eYlQuX9hRdU6pT+acFJr47q1VN8YtX3naOwVJ4DkMUCHCwODAZOBHof8TuLg?=
 =?us-ascii?Q?b198d+du1uvYKjxdPnbLlQX51cN49IdWVjrd66UaHWWMSzRC43MYQH/h5v9m?=
 =?us-ascii?Q?3X4ERW3aJ7S+vzg2uPlK3O9gyxjAuwEPw+CkLCwg6umEdtFFMRB8i9fDIaZS?=
 =?us-ascii?Q?ZmWyMf6Mz/iD7j1zuE2+rHMAc94qH9mVU5gCPmsV3B+YaOIiL2NqFO0qa4Ir?=
 =?us-ascii?Q?CQP0883eDkn3tjT57pPo1v43Zyg9dzQ5C7gKaUxgJC0imeX1DBVuWvRoAmhx?=
 =?us-ascii?Q?IYPFNkv3054nRQUeE8cx+SX3Wkmo/UJL/Lq2jetxKzJE0H/QoZRtqRFte4+V?=
 =?us-ascii?Q?YCs+OZ7xOe2KYhuHjdHzNsXGlN8l40VRiHSRmyUDwggA2L5tReUIxT1me1EQ?=
 =?us-ascii?Q?kHue7mVPwELyWWWRMi9Q8/64xcRlHbXICqSsr5hbz1MnUJ/8d4Sd4ofVcpl7?=
 =?us-ascii?Q?ZzMzD9lwYiQ1E+RCGLA2aIZYkel3qe4cKeppCPiI066wRGAi4bDORZOvjscR?=
 =?us-ascii?Q?JXKKGs+EX2ADtzHuTbLc6IY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a0e0cf53-e085-4a55-4e52-08db3633f11e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 00:14:52.7950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GJnMbMQQmIa/9nal23u2nLucE56HmO1AP6NPvZ30JNGNMRMzl2BW8RZgt9E+C5FYkw8+ogxupehpzlNphazB/b33nhCQKPjCIE5elRhYGu7NQ17v5F9t7PTzd4D9B0Mg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8440
Message-ID-Hash: P26ADLM3IHVH27VHLL4YSTJFKQMVTAFN
X-Message-ID-Hash: P26ADLM3IHVH27VHLL4YSTJFKQMVTAFN
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P26ADLM3IHVH27VHLL4YSTJFKQMVTAFN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

ASoC is using many type of mutex lock, but
some of them has helper function, but some doesn't.
Or, it has helper function, but is static.

This patch-set adds helper function and use it.

Kuninori Morimoto (3):
  ASoC: expand snd_soc_dapm_mutex_lock/unlock()
  ASoC: expand snd_soc_dpcm_mutex_lock/unlock()
  ASoC: add snd_soc_card_mutex_lock/unlock()

 include/sound/soc-card.h  |  17 +++++-
 include/sound/soc-dapm.h  |   5 --
 include/sound/soc.h       | 105 +++++++++++++++++++++++++++++++--
 sound/soc/soc-component.c |  12 ++--
 sound/soc/soc-compress.c  |  60 +++++++++----------
 sound/soc/soc-core.c      |   8 +--
 sound/soc/soc-dapm.c      | 119 +++++++++++++++++++-------------------
 sound/soc/soc-pcm.c       |  17 +-----
 8 files changed, 216 insertions(+), 127 deletions(-)

-- 
2.25.1

