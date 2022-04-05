Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B38984F20C4
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 04:07:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8B6F16BF;
	Tue,  5 Apr 2022 04:06:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8B6F16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649124425;
	bh=mMheKdg2PaE6iN5LDQj94OW5SlabyCj28fmlrSRbrQo=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cAxI+9hbOUn8hJx299Nfe/ycYUiGhHtvxgAMQl+NV7PfSXfkZKI2VDPh1gLy463mL
	 f6wKrGLUpKUfXWmh07tZ/5xxPgrhL0BTy0ZZ+9/ctJ7AG9zDU8up4x5Fl9ejhikzm8
	 ixNWxi1QlqDMyPB7eG+MOwDdc/d35LofE1oOCYvA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4361CF8016B;
	Tue,  5 Apr 2022 04:06:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 669E0F8016A; Tue,  5 Apr 2022 04:06:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20713.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::713])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95DD7F800D2
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 04:05:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95DD7F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="LM1mArGr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPaPmLLLovsYsYm379mBag041zib60WJSSU8SHfTRjx8SDaZZWhCHCEEyODtKWWVgvhSVkUt6UffSBdWbQNh94qkRXZPJLo0SRBwQHvbTacqlxZpVW7+L7VmJK6PNo7LdHNmNQrDd/ZLahxH//2KjdNcWrExqzGceqDsf3U20GcC+BemSqNljyvVZpQBT7hDkQ2/DYEtXpneC6bxaNXYCb8+lomSZzsocHH+ciJSMykFZiMecVlaWktyr6zWLmJWBcdwA526QsgQqMufC+eOhs1gvBLxEoFg2KNtmkG46ioWJQIi8sabGCaDn+WAWAIQU266K8Atw0Pm6J8m/VQp/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=md3iM+0w/c05PxOisj6yVLdRvlOSstx86f67dw+RcxU=;
 b=X5Baz2Iu2i2KTIqecEqAETTRgiM9PAdBv5QUap2tlnckdX/6+gyn6/CSOAUOQ/aXwV1UIwkKMFIesNk8/eDO/LgJAeL/nRD+0q5i7LqbTC74JpUKzJnpzBKZl5zHK2Ujae03So3mzgeS8lMsur0aLosY4haNvABmUqCndEDXdbB2obTzQu2M3tFLFsPf2Xf3i8pmuNKQu3s6mJoOcR+lIaBi0lyqo56oHgDlb6KSazhZTLBJVuNv7afpke9064Cfg9AqWHHPnZ89ypxI3GuUvGJXVgSWbB2aBEv8MAiVSrDlfEmrzYa8AsmQ/6aOf8IK8ErdvFYTu9isYl2Et8T9cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=md3iM+0w/c05PxOisj6yVLdRvlOSstx86f67dw+RcxU=;
 b=LM1mArGrVoTYaPxYHpbLJn+8NaB/X68K78NDkwDttfz15lvkxg6p/x0DinrBrO35hkyUGJfw3XFJqmDP9S0XVns7i2Rjb4bMJ/RsBqySGcTDYArofRdVjYKDVg8Sp/gFe5Cb8ZqeQ19yU77A8wBqPXCc5ZwcxqF6tFbaAlJxnCo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8525.jpnprd01.prod.outlook.com (2603:1096:400:172::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Tue, 5 Apr
 2022 02:05:43 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3da4:1dbe:7a91:8167]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3da4:1dbe:7a91:8167%3]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 02:05:43 +0000
Message-ID: <87h778p9mx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/6] ASoC: ak4613: add TDM256 test support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 5 Apr 2022 02:05:42 +0000
X-ClientProxiedBy: TYWPR01CA0029.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5468a86c-e0ba-48b3-38b6-08da16a8ca23
X-MS-TrafficTypeDiagnostic: TYWPR01MB8525:EE_
X-Microsoft-Antispam-PRVS: <TYWPR01MB85253FE29F329A94AA64A5D7D4E49@TYWPR01MB8525.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N6dPVIjK6FAen5c2ezslSc0S/DwJQ8hgbwRuvp8LfPsc1+nBtGOGTPWvIe2P65w3+3T2fNOtSfGG7A9USp3ROAmwoJHqoYnqb8CpjYUk0cLmrkmbnaTqPAcS6wY6+FrGTP61N84nP4qro9ZsiytAiU58Qp/wBleKC/PGS3FCFThvHz55btlJJto8772opV7A0Fc+XIpaQvGZ2yar3ST+M6xnAwBqQ1ZlUR6X5SXtm8Eisvcp4OvQ3sFm67am0g8tAZNz3xPFhWw/KgJbBzXBsh/707Aph/slfRWM+tQKQByVRLkFhGcjScKEwqR3nwFdVN/ryK17srmsMvr2OL6VZbcm3ucD1XU0OiFCkH5zZ+4HhyB/KNroJuh8EVhv9BSe6LMAE+T/I7/cj8hzYlrV1O67QC3dEHlTMzxQiaCFfoZEGWgopHpxL0NtSitqDxnucfFnAAjZbPwaczEqt/wcZ5MgYUY4HTlrbPoHU9l49mjbRLzdZMzkRzYweHQhg3RwhNbq73e/lt2U7VViYrgK0kZeKDwyLsqL1JS2SCuqh914A85YgWveaLqD6vztWachrzn9RF5zCFa6TYV4f7cq8fjkqZLXU4Y1qIHCOzILjqN9shWMsg7MXUJ1K1A/kyGja30Ac5h3cMNu6XAn/bHHx/ME7XqMwYpx6l74jac81cK1QGW5J1YDMaWj8Oo65vMyc2zIEQYFUa+EJ0uot1mCxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(4326008)(8936002)(4744005)(5660300002)(36756003)(6486002)(2906002)(316002)(66946007)(66556008)(6916009)(66476007)(508600001)(6512007)(2616005)(186003)(38350700002)(86362001)(26005)(83380400001)(52116002)(38100700002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JOaW1uCCk8T7W4vpZyYrYMqyAEDlTyjtqkG99XGv0p8oSOPBIsgpBmNMYMlr?=
 =?us-ascii?Q?uoXMC9Vpd/XH5sD+cXYWLWJ5lrjuZB3CpKSAO6sznDlU6CaMa5oD6ouOsh+d?=
 =?us-ascii?Q?CBbKPgVm3dyLWN1uV0HCpcwvqJ2ynE+JFlBEWkoD/mBiDZT+vELyUADXLr2T?=
 =?us-ascii?Q?93HcvlXBIMLmobYQk0QAqUT5A6y2P0Lw5gKx0F+iZ4H0WzqhO+/M7H+QGPE0?=
 =?us-ascii?Q?FVoZxn9kksY5D4vrhA18Oqzx5Ih6g1V1kn6HrgOuhX1IKhDN8A6/QG87N4gv?=
 =?us-ascii?Q?jtysJNwc/Ih1ugSO9vBDbGo4FHA51tbeJ4mhZk5QxYdtsZ6FTTmn3Hb/sr9d?=
 =?us-ascii?Q?tr9AnlzDPKp7weCVSUDOIOFeDV2x58sXOp8ROXWUH9/UPaQWeViKeZxIvfDx?=
 =?us-ascii?Q?SBs7+qOEZOdGV4DrX2cdmp8r5pDxwQvHpbl4AMp4FNRkJoR5gSRXoR7UVGlW?=
 =?us-ascii?Q?abI3Q/GJ0OnLvadBnQFalD21juVjK9kvCopWO6mF6YiwQHULPmME5OjDURG4?=
 =?us-ascii?Q?pJwO/RJ8JS5HwNmK30YgGVoMO3TUrGbr4x56Vfc1nf6S6h9BLEAhsZ9o6qIO?=
 =?us-ascii?Q?poD0nHzOS3414bV2uvXB4+38PbpmTgBVE83Rddzj7CKLVgo2Xh3SLsOj2s7c?=
 =?us-ascii?Q?slsOJ0dVVf7vJdKxpc5/6GXKJoezLDuWcXVExbV0HqbTIV6hD8YqAWIhKh53?=
 =?us-ascii?Q?/tyhEjoyaIgQ4ve0bjDcvIB33u/LquPW2riOSiTsZRbjFIRBULwt99+SfSnq?=
 =?us-ascii?Q?GQk4dbzwZuk6k3d8M2iweF7EuQWvXnzjxWefmJtX4+tLykOKln3/+vKObIIP?=
 =?us-ascii?Q?17OiMyO0aDXN/OkovPuRCZdlzXzC/QGhiabeiYsuSrfPDv8sTdgEin1QGk9p?=
 =?us-ascii?Q?1aktSwXB5Ac8tnW7W350n1KrZN3vc0tpXb7tXcD0zLcM6TY5KHLG8SP1i6GR?=
 =?us-ascii?Q?wzlwJJGZctEH+hPfIiGTC/AVTY6tD+iqVy6v7Iknq2uzlvzKEgV5MdnP/G/z?=
 =?us-ascii?Q?sOW5lLs0gf43p7hCBeI1b0UfpsZmubh5f1qK7O82pAGPmTtkhsScZJNXtWjc?=
 =?us-ascii?Q?gjTXNykmOcYq+7MEPvRMCXMxdv33jZ3fKE+/2DwgwvvZuLK0o+/+Sjtqtdli?=
 =?us-ascii?Q?rPjWA1vng5HxBI/IDnOvRi7O2Fj/Egl3pwW9EcGyZymMp+ic3xeUZUzAPEeE?=
 =?us-ascii?Q?cuKVNEsv0q3oJ/dCw6lvcKcX6IQZGgdratJOjE25RNESf+gpk0JyyXDz4nDz?=
 =?us-ascii?Q?Wze8Gy1H2dgNUDJC1eC+IdawNNATjBc5RVOfS+Qk8jhMsAh2phhIhyUPlM3v?=
 =?us-ascii?Q?HGFvjWoybOUIA7qJZFDVgnc/FU4wYisu5QP8oyu/4amt0LFerzP63L4xDOZB?=
 =?us-ascii?Q?iXC4q4KoOee3Y6m1aCvKFG3+rjq4k/lCQMvUPWxTJ5SO3OD4Nj8dS/tw8JhH?=
 =?us-ascii?Q?tgGXytp1rtT4xYivvXSfUpd/GsgAmfIM00Qi0p5KIt63kipFoT7gt/5AdZA2?=
 =?us-ascii?Q?5c9U2KM4a328cvbYc/9xhpAZVrcZfeyGwHRUIW6ZU+c9lWKV0ksihwVNQNL+?=
 =?us-ascii?Q?sv812FXMeVCRMWgJdHXZwfUNLePZtzwClb0Hl7GofHeChEZyaZn0bAUSA48m?=
 =?us-ascii?Q?BXhXYETy5n0fhebmZJYC682HS6DRvvKS9XDtLQ/vLkmRb34lqfJOg1rnFPnU?=
 =?us-ascii?Q?WhSKo+lHHHqIhI72wthJ0uN4VvTCJvuK2d1mWvknSq2GZbrQKISQ7VJZKOgo?=
 =?us-ascii?Q?mSkN1dwyCqytgr9DVfz44iLq5N5639kMEOmRWatGMgmuZhkXdN/r?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5468a86c-e0ba-48b3-38b6-08da16a8ca23
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 02:05:43.1730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VMWGG9aP14KT4R5rupCX0TPP//m59zmf80gCyGscbH4iYGQ0PT/P0JGyTwIzvtxCkjKFStybF0AU2EwZ8ECK6Sh8XLCpE/OLDPRCDEt7g+nlCfl91MhNsZd8nTyJXSNA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8525
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

Renesas is the only user of ak4613 driver on upstream for now.
It has STEREO/TDM512/TDM256/TDM128 mode, but STEREO only is used,
because of Renesas board connection.

I noticed that I can test first 2ch out of TDM256 mode 8ch
Playback even in such a situation.

[PATCH 1/6] - [PATCH 5/6] are prepare for TDM mode support.
[PATCH 6/6] uses "ifdef style" to enable TDM because I can't test
full TDM256 and/or other TDM mode.
"ifdef style" has no effect to current supported STEREO mode.

Kuninori Morimoto (6):
  1) ASoC: ak4613: add missing mutex_lock()
  2) ASoC: ak4613: tidyup ak4613_interface
  3) ASoC: ak4613: return error if it was setup as clock provider
  4) ASoC: ak4613: priv has ctrl1 instead of iface
  5) ASoC: ak4613: rename constraint to constraint_rates
  6) ASoC: ak4613: add TDM256 support

 sound/soc/codecs/ak4613.c | 367 +++++++++++++++++++++++++++++++-------
 1 file changed, 300 insertions(+), 67 deletions(-)

-- 
2.25.1

