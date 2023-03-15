Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AADFC6BA815
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 07:44:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 216031305;
	Wed, 15 Mar 2023 07:43:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 216031305
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678862643;
	bh=fDfSXbZ7Qb5f6ZjmufKU8miupRKeHNWgVTkWP92SzYI=;
	h=From:Subject:To:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=knGXDTDjABaxERVjC1DR7Eu/X5mS9SNJYt2J/V1raN2NEJfvHXiylY0h+lhOU51+n
	 IbynPSS2pHhzhwqtNpcuU8Cw0CUYhjcGghjwENizxIh8eYjI9GsIVTzgR6XD52JQPC
	 DelAto3JQfx5OwZkvAxPgU9TprOknTMOjYgrj0TA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C932F80093;
	Wed, 15 Mar 2023 07:43:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAF39F80423; Wed, 15 Mar 2023 07:40:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-3.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25755F8016C
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 07:40:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25755F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=SYv6RETw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjNqWwXh7mBS/rWTDjeQdXmGnSaL4AZmZRXSDY6+v7vRMZKcsvFhu3bkBCS1pMO40jKa+ZpTSJedj2bWyK3x38UfOVMx21jGsxxqo1vKqkARXChq6263KVm/SEiva80cAOh4bDcD3Vs9NbRbZRezXnAzudM0FNRL4tG/RVsuFI9ZmPlM4qRBoGtQULb0mRyGr3dr69Gz4aNuUjPVJxDdcv+rjsGcnUCW1W7G5I2GEY4u2PoxM/0s975m5+hTNBleTkbZACR2dua7JQtgZPLe6nqIHfedT9J6pPSdt1EEbVb2hzL0e8taeINzOAonP6AN5eHw7HrPjqpEAIfLyTjoDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbhh5LLibxzejuLjFWGtyoE42jFeIftGkppRrfatb+g=;
 b=aLzRfoLOFbJ02WwdnkxX1ujOLWVw+NA0gspPtPY02GjaPQpTWVfXCscEeimKieHhSiMRlJMjgWw7fQghqJLXNXkHdfzqneBXN7cPqDZaGdRpTlFB5WxGSJ7zEH2ocEURZHQzVcO7WS4DGRrH+zM/XawcPl2YPMTZaJWLUNnhVZZQ+/rHjSd+4wuwzUh/7Q9KZzF2zMSfX6X/j40ATtUeMlU2UdCVNs34dxgNraaTiU43o+07yuxdhgw+eT6gSec5+YBEbe/Ms6FtZO7BZQCEVkdWff7nQKJVmpm0yA+xn52wfA0Dd24/ome+76j//SQ2qonYbhhdpBhtoDXPrjISXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbhh5LLibxzejuLjFWGtyoE42jFeIftGkppRrfatb+g=;
 b=SYv6RETwSeELMGs4+iADjS/sxtOZQnTvc6QxldnzzQgGqB6rgCNQ3WBULftbkqO8j2DhoVLYJrkvobJohxjzE/uaFneJMUtQ0LeCVoidYEAuFTCD1KzIUcXFIN7sDVAj44SaeV16Kb+AgJDJm65A9RP6uXwGvBD7fDknAr7mmVY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB5755.jpnprd01.prod.outlook.com (2603:1096:404:8054::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 06:40:39 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%7]) with mapi id 15.20.6178.027; Wed, 15 Mar 2023
 06:40:39 +0000
Message-ID: <878rfyjz4p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/6] ASoC: remove unnecessary dai_link->platform
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 15 Mar 2023 06:40:39 +0000
X-ClientProxiedBy: TYAPR01CA0138.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::30) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYAPR01MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: 708e1de9-4311-4828-9b16-08db252030fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aqNqLL+/j5cm5kZ4UM9icLZfuKu/fLO0DydeNf80NehIW8TTOkuljNHZXMw8P2uAPTMXGlYo1s/BPkmKBBzL/H/Mdfv9FkM6m0WciJS6+Yi5W8K5OVHCIPAEdUATYK8aXdvIX8m6hhAsnqnnS8kxy9RkdDBfkVcCFVI1HFkTd6XYyR9wi0umau2M4d4wHrMg9QUhTZaJcYuYmYoawA7YPCd/P1bVUPvvdPzjPXhbUqXQV2feiMOnWbuFoyjBZ63YWGX5Z0vq3LZso/+21sSf6zGdQgi8Iv+bicP7xP9cbYWfFo0GeLtpvQqNQb6Rf7AkzUHLeciCXpekJgvZOHHzdoLR/ZiukJbIi5oVWM7/gDzi0HcaT5bXMmkcvZUV5RMgwkDB+aS7nZD84pruLW6QFXa2H6aGA/vj0dEHgjZBxCxnsk7/bDL624TdRrPoQvXvJCmje2GmdYiFMoYRfbf0jRk+r5FYpMVQFYEu+p5tkNwK1gB8BtTHqE2eTJZeCYQMITtM9TibF90GWQDME/GujYjwYMM8nChZAJ8BJG7HttLsWoFIY6cCE3WXCaT2GkPU1AmM3i0vxzAqeIzX8AbUrQkwGB0UO8Cr8sVTylVrIG2KsS6Af8O7dKVBNEmyfVei8O29ST1yCAbnqLWBq5eCCMdgH4uuSMG64AwLfGzZV6s6R2OW+nDfrMy/9hUCpFQoNOKI8QJS6lW431w8ywvZ0g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199018)(36756003)(5660300002)(83380400001)(66946007)(478600001)(52116002)(66556008)(6512007)(6506007)(6486002)(2616005)(186003)(26005)(8676002)(316002)(4326008)(6916009)(8936002)(66476007)(41300700001)(86362001)(38350700002)(38100700002)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ugc932HUsr+l5pQ1J3m40Ae7nlCvQjnCFd1NvrBg7497g0c1kFOZsIgbHL7y?=
 =?us-ascii?Q?jtDMJFEq5vVHvsDmkksDfdNZ/lJcV9CXMsFV11qUQ6QwyckzyO63UcPzau2/?=
 =?us-ascii?Q?d+Um7A3LyNcWs+ryJ2xWJBvnxxctAZ30zzMwxjJvH4wjFnxgbTr+ofE6T7eP?=
 =?us-ascii?Q?RrFqqBUm3GGZZQ8xfSm645zhybJWChEdFle1ax/PnvBAa6DTjh+KZV2lTen0?=
 =?us-ascii?Q?gtAAg8WhUOV4tEu3naGlW7Y6ayqCUh0016gj531r1B9Aa/GCFcGF7+IpZ00+?=
 =?us-ascii?Q?I4t48LOPCChGPQTPQ0iI9dKliQQUS7iIhdX8+GmSpxx5FseZisnMZDsQfnfk?=
 =?us-ascii?Q?fppziS+hZwf6V98+8kcUYoRrzI6AGBlzJngwxbL216MBOEksCJlw8jBE0jbS?=
 =?us-ascii?Q?Yrm/NjRFHEK+gfibLMKy7ts3tDn/BbQxJJtgEuJs4EVOZQXO9n0daU/QN38C?=
 =?us-ascii?Q?laS/U0SiW7nqjC3ibAMQXkMV507w+/HUyJTSqs26noPZZ1/mJBZOjoKt5dFH?=
 =?us-ascii?Q?36aqbrtMej/odPSa8E1MCQValMuDQNNkL31GT7H7+V1/ZVNw42F5XMFZ4Dc2?=
 =?us-ascii?Q?i3tsF/0adkrPxVZV7/15Cu0JqQ1Yd8USMoW6gXxpPKFOX+ZBWRxPYEsQa6r4?=
 =?us-ascii?Q?CrNJmFknau3+8yUdKPW+jNh/I2Op+0QWHa4vMPWyKVyHgaJqcYZ1sQN7Fn1X?=
 =?us-ascii?Q?F8jjFUDLQko1QgZ4ZKtSGEwldQ1eH2MNv0W/qvDe3DlxUCfymuyVJl9pWakl?=
 =?us-ascii?Q?i16mxLCIzJVohcctuih1HNUnJ/7ymqpYRFKQPKZz3wmr1qRvSC8cdw5B1V2q?=
 =?us-ascii?Q?5/rnDT/9d0f08cXDBwgFqCwKpiEESddGr1qhlD0Wz/YTI3F3yk+X+Ji7iQYh?=
 =?us-ascii?Q?YO2UdVNBPmxVoLMmWtGY27netGjxmShfYpviVjMBFu6AaaHfTjfQwSqSU5rJ?=
 =?us-ascii?Q?MaIHaCmE+sgFk3GGVohRmEj7KfqA+Z7rp/DBUc9WYZDDbTsB1cIUzZKIRQ6s?=
 =?us-ascii?Q?67yBOzMbfr5PxjWoohAts5KBCI3aE8jZW36D95oMe+kIf3JHumaLENQGQlUH?=
 =?us-ascii?Q?TK03VFp2/RBpCCmEPhbqGoL6wmyEiyiR0V8L5goapd0jBLd7aqXLDvOgX+O8?=
 =?us-ascii?Q?03BKbfgMoDa4c8JDF/s4J6iJ4YEf9qqI/rcmguFrEPqRkvWOjTzK+n5n8WlJ?=
 =?us-ascii?Q?h6ZdLw2OFOJOBwWYK9HVedEevc5gKaC6NNPMBEwh5Bdotp/G9cDES8aTjqdm?=
 =?us-ascii?Q?nN79vHuWdfFmoDIBEbAOJc0nQBIRs0Rdh2ad4klfCq4EWPqs4ygNdDNrqx6r?=
 =?us-ascii?Q?rgXeBNMbhQp7Gw5NLIeUzfKG4LmvMeMw7ZUoz5+zuxdd6HdqPFBjQBnjLYLs?=
 =?us-ascii?Q?/5wE1dBzbXl9BzkRCrU4KDNoZIr+L6OD7yLJ0i/nCg/GQIIXBk/thOeMWDhC?=
 =?us-ascii?Q?/TPq0/Jr0XadrAiJFV5I0ERJ7fO+eJPORegjeoEOG6SGE6EcjEY+G5wMIMge?=
 =?us-ascii?Q?NKweYkKhM8AFHymlURCwkigbJJrdGwVVJrdvLZ8DufAJTInfVdkhv3lLE/KO?=
 =?us-ascii?Q?fCzdjh1Wtn+t+valL2XNSqKIZFpbh+4H3/j5IwL4A+2rKRVaX6G89nP0yFeQ?=
 =?us-ascii?Q?RV+nqcpSnQaxNSmf6IMiASM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 708e1de9-4311-4828-9b16-08db252030fa
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 06:40:39.5218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 d8aS6+yBxQ0Iy86JFQNvwHucOwWwCj5FF10QJx3JOQYCcBdelrm39nwBbCTMI+urkV9UoFLAjh4K2YcTvDMV6N+o6QbE6ahscq4xhQV0U3YwbCNT5EMqtiYDg015k9g8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5755
Message-ID-Hash: JCM4IIC3ACE2Y7AO2CNFFXOZHWG4B5NH
X-Message-ID-Hash: JCM4IIC3ACE2Y7AO2CNFFXOZHWG4B5NH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JCM4IIC3ACE2Y7AO2CNFFXOZHWG4B5NH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

Current ASoC will ignore already connected component when binding Card.
This will happen mainly "CPU Component" is handled as "Platform Component",
which was needed before.

	static int snd_soc_rtd_add_component(...)
	{
		...
		for_each_rtd_components(rtd, i, comp) {
			/* already connected */
			if (comp == component)
				return 0;
		}
		...
	}

Some drivers are still using CPU or Dummy Component as Platform Component,
but these are no meaning or ignored.
This patch-set remove these.

Kuninori Morimoto (6):
  ASoC: fsl: remove unnecessary dai_link->platform
  ASoC: atmel: remove unnecessary dai_link->platform
  ASoC: ti: remove unnecessary dai_link->platform
  ASoC: soc-topology.c: remove unnecessary dai_link->platform
  ASoC: simple-card-utils.c: remove unnecessary dai_link->platform
  ASoC: simple-card.c: add missing of_node_put()

 include/sound/simple_card_utils.h     |  2 --
 sound/soc/atmel/atmel-classd.c        |  5 +---
 sound/soc/atmel/atmel-pdmic.c         |  5 +---
 sound/soc/fsl/imx-audmix.c            | 14 +++------
 sound/soc/fsl/imx-spdif.c             |  5 +---
 sound/soc/generic/audio-graph-card.c  |  6 ----
 sound/soc/generic/audio-graph-card2.c |  9 ++----
 sound/soc/generic/simple-card-utils.c |  9 ------
 sound/soc/generic/simple-card.c       | 41 ++++++++++++++++-----------
 sound/soc/soc-topology.c              |  8 ++----
 sound/soc/ti/omap-hdmi.c              |  5 +---
 11 files changed, 36 insertions(+), 73 deletions(-)

-- 
2.25.1

