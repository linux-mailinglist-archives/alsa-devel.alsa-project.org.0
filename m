Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FA47C499F
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Oct 2023 08:09:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C7CAA4B;
	Wed, 11 Oct 2023 08:08:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C7CAA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697004543;
	bh=EXEB7cJKgUnjD5wjyktvNnGotIKfYfTYsreVaGdSdZg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=l6eIsNxDXYG8yD7uaofKnxMejDE6Im2PK/uqHlxVYeV/zZH2i5co+plbKy0Wtfh1Y
	 fbI9kLp2LMvggVhspGRYmWrrzpHcrL1wJX0iGX0s6fmiKNlWUaXWrpHb4TwSTwm3u5
	 eRZfL4Iyyen/kQ65tR7gzNY8DNkZ3Gdc4AJON7tw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A283F80536; Wed, 11 Oct 2023 08:08:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4070DF8027B;
	Wed, 11 Oct 2023 08:08:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E40DFF80536; Wed, 11 Oct 2023 08:03:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20720.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::720])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0C3FF8015B
	for <alsa-devel@alsa-project.org>; Wed, 11 Oct 2023 08:02:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0C3FF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=GlclWb2O
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdsdU5Lxo1Vgr3cTfPJqWd6hV/ERVI7pZ+MkVQ48KaOLhFrhzqWG/i4XaFj4GZPiyFn2kM4OWnrXw5Pn+sQQYoAveAqJDvoopUjrryT2r3zfXp9PGeXbbVz46n04w23m4pRS3UieUC0v4m0Jd1MU1pkuAErcmUnop8O7xDcsR8TWKYPWPeYNanEe6QW2eZEMEXSgaapglc+GBAafNc2badZThNJi6sjZRhStlluSCTtj1/ieNO+5mOt+KMJLpBhWcSVlapqAQLxb2NH3L/upbpkwC7ko3JuHNUPkfcAAjn3GtenQu3iNFEjGnQgCO2qPPYTb6mnoHbgNheyQ3LfBYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zeGuK3F5SLMcub5EDC42GBcEOmqFkDRDtz/i9SOrP/E=;
 b=Uq7FG4zIBcsQ8OjH9EPKH3hoF5Z7PaW48buHAgpFyfQa3uEM4vS6FZOapkM8wERgCJRUc0F/o1anNZVZFrQhNdj+i7dq3gI/5ORgF9SYqaJqyds/0Jq2SKcUleSgUvc9DFRHTjd5rE+8j4yS+iWO9eTlQh2Zg3cN9U8guCXDlgL0Bbjs9HjwVSrrhUzofsYeizZUx89HeUS/q/DMDFkxxT7j48MiFLKw+6mVv+fWA4Ravc/jz8nphn1zvYaT6XqO+mbJ7TeVTFBkPANssbTnyk9+xSVOLyUFe/JC3yF94TgHX4x6SV6oqUUpwGaUsj2ja2FkQirKxljTv/HrWDH+xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeGuK3F5SLMcub5EDC42GBcEOmqFkDRDtz/i9SOrP/E=;
 b=GlclWb2OtL+k0hs9LZLO4o8jVFWzlY9/UVu0RVT1iNxWKL3c6EyzJamOwVX4mAJYtf/ENjh9Mva8WX6k9ET7OIFoD4DqUybk5thsO6ZPGOzNsaQz/XM09vI/wSwNU3TFLq7ngF/iSNUKGTc+pV9/dQXccSGZgV3axseF+7kDyBQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB8532.jpnprd01.prod.outlook.com (2603:1096:604:18d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.40; Wed, 11 Oct
 2023 06:02:22 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6863.040; Wed, 11 Oct 2023
 06:02:22 +0000
Message-ID: <87mswp1ytu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 bard.liao@intel.com
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: [PATCH v2 0/4] ASoC: makes CPU/Codec channel connection map more
 generic
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 11 Oct 2023 06:02:22 +0000
X-ClientProxiedBy: TY2PR02CA0072.apcprd02.prod.outlook.com
 (2603:1096:404:e2::36) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB8532:EE_
X-MS-Office365-Filtering-Correlation-Id: 60306bee-29d0-41ca-ea57-08dbca1fa26f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rdQYpbMalIOW+7mwnoNwTSisPgLywCZG0EtQSgPP6sbcxFVm8hRy1sqLF4NnA1v+DRKOkZ5pAhJQO20ZqXGIkTGEUZ3ociMh5AidL8VivDLzZ60i9ZQg95DuzgZagm1HKJRZZ4Qj5E/ITUXWxkiiO0PP8LPTNxyb1lFK9KM76kkAhgrBJBgy8g31+8NGpz9qDOF9hMTA0ePOShAvBA41jP+ieAmyHfwTSxy5TydlbWmtZDT5vSX31A8WHgoJErDhAQfG+nmICP2aGY2Zp/tiA6VSaVAi2mEGvh7nmoKrrtXFxk97j8zt9zUcVQiT498SbwU4XUntEJqkio/YeTMGtY6lMStQysRekewtG50uFaDmWVeyQbg3bUAs87+RrlAUkvnxHWKjWeNPZ9BaAaOJHS86rwL7ryUBw0iNUKgm8dxlUw+Tp2A/Gijqltw+F1XsThQCi+JS0zZ2PAdHrMUD5hI+hONf8MjQK5iJ8IV9DzY3Iqw3Wj5ofJ7iW3lry2X8W+FLd5vq4kfu1t2VssWlm99+934vWTlIh5ZJpZzfOSPgBZHG+4PNSWu6lodmX9fw3TWxFipuHQapy/KB0vwUxvmTj2z3Q3TnTGCFE5oCtIs8wJPQEv/W67EFS2FNfVfv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(346002)(39860400002)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(52116002)(6512007)(36756003)(38350700002)(86362001)(38100700002)(478600001)(26005)(2906002)(83380400001)(6486002)(966005)(6506007)(2616005)(8936002)(4326008)(8676002)(316002)(41300700001)(5660300002)(110136005)(66556008)(66946007)(66476007)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4Xlds5a4XyBy6W2Ol5P9zvr/Jq2dA9fhYeotA74W6TqMRECj56QNofL2t4Yk?=
 =?us-ascii?Q?j9ckPq6L3RVCD8E18pCCQboNVFlQkQ8N6Oa9Eu/JmTiNHKBgxphVykSic3CZ?=
 =?us-ascii?Q?Ixs23E4b66HhD2chb6XgkhFVggEm+a8nwPb2LObOw4tVAfsDgcgggFxBbVnL?=
 =?us-ascii?Q?HLuYpBAUlxFl4MSlrnrPQ8qizyzeMd+9j947k3bq2RIXKxkcusDIPBHScSl/?=
 =?us-ascii?Q?xatv1JuA4p4SNe50+MSGWb1anW9ZLgUz7atO946v5TG43om6uO65SGE+xcqx?=
 =?us-ascii?Q?T3MHudVRC/dVF2taE1E7ca5kvJ9hSnVar83VzmbueorZhylyld1o7wsAuMAm?=
 =?us-ascii?Q?SYkFoleMbGeAIZ9hE8K3ZmtT0fyf9BAlPDEghD70gna0g8UmNsJgzoBDroQw?=
 =?us-ascii?Q?hZyAWldNO7zRW3zfM8cba+uGhacmECBtFDez4T6XqFQAQoBqUqPAscqRlXpS?=
 =?us-ascii?Q?e0TeL5ZEmwnukMS+cY9L18QGJlwyYkCs5wtUxNG2AlNbw4DtQ9fvVMKResGB?=
 =?us-ascii?Q?Rwo7OocZZoedRZMp2ud6QB00ZRWSjc9LfNWEHQBtVJIiQyWx1m4UBqh1FIZy?=
 =?us-ascii?Q?6rm8aQxeN/9WolkSSXEomdu5JLWlkJsZlNXOiGwVUhKN/aldcBtCMah+farc?=
 =?us-ascii?Q?kG/eM4/jBLLWGR/nEwzsPKX9v0Ao/ffAW++tG9oIVWOLwbHjlvXvJHo1YWqy?=
 =?us-ascii?Q?UdtLmPHQTm4yluN61slHbK8qCfpgpgEEMQLcPUYVe5aF/02G0scGLG20hLVg?=
 =?us-ascii?Q?vkuCXMqxI1OOG/j7fwN93EOKHh2g8wObtEOzjaNqrHb39OgVc7O7LXB+AfZk?=
 =?us-ascii?Q?zL0s10hlmufdEQnfnEH3LG45A8c0T7sXVUXW4uVTYSJcf1lnfYLzEeWeCZVl?=
 =?us-ascii?Q?r2ftyhVLGxSL6UiENdhAP8PMntPQ8NGF8fYBA+Mv2pFA5b5pHAGPb3HuSSKS?=
 =?us-ascii?Q?iWBc7DcJmaa9HYoD2L4QN6BbwvBbwK/b+D5IlSHxCt8W/AR2rogPFKgPrTTd?=
 =?us-ascii?Q?4UO++Ln2J2Lw9zWUruK0pI+VCaUQHQMcKSo+gLTQRyJaTqz5rFLoJF4uy/4q?=
 =?us-ascii?Q?PCGqzPLj1l/xyQVEJONie6eoixO5Pnxogc74iMbeGR1utNV3x3op+OdIO3ql?=
 =?us-ascii?Q?bDHkU6/u42fKfOFPDQ4TMR3Phud+lO/WtZVU7NXDNt+8fGP8/a04BIt9oFhL?=
 =?us-ascii?Q?otuSQCoGfcV2j9XbYgOIMOnXyJ2Ct8bNOLixcU3IdBbY6lfWlKsTm9JexilM?=
 =?us-ascii?Q?B2177ecFcIxjWItfP1BBDEU2E3lysWX7+KovyBq/Bdtfy4nyx6I7s0uj5Lkc?=
 =?us-ascii?Q?HZZIkP3twmjPKBZALvajcv1wW5RVtmEYUdm9YnvZltDRBmJ4HlZ7JVpmqAIk?=
 =?us-ascii?Q?zMQevtKhYC+FWPG9Bhj7NSN4YZd918kp1AS26T9akWFOk3yKRxxXEMkeDdK4?=
 =?us-ascii?Q?5lwaKG5eXcSQT7TUHGkyZPi+dWzBKZ/byTGYeHebYD3LxqvVgNeIqao3CQt6?=
 =?us-ascii?Q?d/JFL1jv6gHrk8Urcs894S0tSOLQNCBjuSlhS1qCE5kA0NxbDk2D2Qy8QSqQ?=
 =?us-ascii?Q?bCFoRAvtyNwk94MVFxftMkvKAw6jUCCMH4ksE967LmN/Wbervf5OnvxS0VqR?=
 =?us-ascii?Q?SGEjUvfoC6MpnuidW08XUcU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 60306bee-29d0-41ca-ea57-08dbca1fa26f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 06:02:22.3475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wmOw6mY8o1W8QpR1/OWn6EfK+KUtcdn4SBJ/HKrv3JziWe2vfLgr/8Kr6h7p9fg/XOsiL32gLNxp0a/WnGef6a9IkdYngv1HEk1vey9oauBEhzvukYsg+BpPI+HiSHdD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8532
Message-ID-Hash: HVAPI3ZZOHSOI46EEGXLVV65EYL3UW7V
X-Message-ID-Hash: HVAPI3ZZOHSOI46EEGXLVV65EYL3UW7V
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HVAPI3ZZOHSOI46EEGXLVV65EYL3UW7V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark
Cc Bard, Pierre-Louis

This is v2 patch-set.

Current ASoC is supporting CPU/Codec = N:M (N < M) connection by using
ch_map idea. This patch-set expands it that all connection uses this idea,
and no longer N < M limit [1].

Link: https://lore.kernel.org/r/87fs6wuszr.wl-kuninori.morimoto.gx@renesas.com [1]

This patch is tested on Audio-Graph-Card2 with sample dtsi,
but needs Tested-by, at least from Intel.

v1 -> v2
	- makes CPU/Codec connection relation clear on comment/sample
	- fixup type "connction" -> "connection"
	- makes error message clear

Kuninori Morimoto (4):
  ASoC: makes CPU/Codec channel connection map more generic
  ASoC: audio-graph-card2: add CPU:Codec = N:M support
  ASoC: audio-graph-card2-custom-sample: add CPU/Codec = N:M sample
  dt-bindings: audio-graph-port: ch_maps property

 .../bindings/sound/audio-graph-port.yaml      |   2 +
 include/sound/soc.h                           |  66 ++++++++-
 .../audio-graph-card2-custom-sample.dtsi      | 138 +++++++++++++++---
 sound/soc/generic/audio-graph-card2.c         |  29 ++++
 sound/soc/intel/boards/sof_sdw.c              |  14 +-
 sound/soc/soc-core.c                          |  85 +++++++++++
 sound/soc/soc-dapm.c                          |  47 +++---
 sound/soc/soc-pcm.c                           |  73 ++++-----
 8 files changed, 363 insertions(+), 91 deletions(-)

-- 
2.25.1

