Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BC88029E9
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 02:34:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A5C41CF;
	Mon,  4 Dec 2023 02:34:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A5C41CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701653685;
	bh=JkguLnKlN6NbBtpvcp3GdsgVJu+ebS3k1h4FAncZS6U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WuGx3oYXvQk9xloW0S1/IbnK5QmRHJAi+vzzLHP03ht25NlDiDzN5ilV4Webluyq/
	 gp9KbJcQ9/1ePRLmc7gsdevKngVgGanYJlSRT5UU96F8SBQXaUMpP7X0PXeEqv56AS
	 aHFaxUIcDJcRKCTU7CwveYVIKVsMx72zq5Qc5OqM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 683E7F80557; Mon,  4 Dec 2023 02:34:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CEBB2F80578;
	Mon,  4 Dec 2023 02:34:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2512F800AC; Mon,  4 Dec 2023 02:31:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F90EF800AC
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 02:31:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F90EF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=hQUN8gc2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfG6JJMV/JkADAI0y0Qjvo04q0iPXz+FvR7qjsxUyY/zM7FHhnhhValMll4zYf5RTX+/rIMnFHRsmD3EPPxXqGOzM/yUZiYnR9MpEuq2PfPJFdIWPkIY1pj64v1VPA77JKvKUINF765dHW1As1hmz8p5yWlzeQPSws2XFA9XyWhzbCkdeh3DZE/gCt/bqLLRc1MVHRtN6MMhFLjbd3smrv8myYwRxWcsVx1Mta80v5tVf93EPwwNH+vMkVOKza8izANEwKlSIhAZMlMfpyhER0ttVNZ7g75DpYlJtLmxSn9RMwH3FF3+RCBhSsPE1TRK3vbT11FEoRBRfk0+Gsoq7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdQoeL6szFU4iabfpuBy6jZ4zibauuxP9ZREDyEjLd8=;
 b=fSShOnClzJASKDPJ+2oM/0Ael8WuvWmhq3lJDpUjuRVbV1v+x1nqb24AzC6vC8Q4gA9HYJCQa8/patqYOFzPv7m9c9gEPL7gjDBibhn9as8TNn813M5z91n7t/iw5Ajp04Ud6sggggp+A2Z7+YwzPumuMEn0qkRFeHTV57/klDcK6zdeL4U0cr/3zMJz3ytvcUq7K3AEhklxcKQJp9YbucgrM3Ln77EOCiVmm35GWlmJ/dSKahXatDoQBt752cwIKU6O7TTit2OsaVDvgbeTrvrUjq9T6hWWIQqvL5lURjD//7DHEBMehUbq2TCErlPzKQhYsqJSmhv6jw5aYUzZag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdQoeL6szFU4iabfpuBy6jZ4zibauuxP9ZREDyEjLd8=;
 b=hQUN8gc2XykgvPmbGo6XS8C/nWVpxnGK+gXfR5AIwaVVVkyvNgfGxlDwNPxsm1WV/0jU6A8bi7sP9gfe0SqGutlfyhThzPtJ8AfBk95rTvAm3L6kEErHPdrQ7z/F+EdbQcvyRG+EZ+X8wNK2BabB9onuNl+l/rFGQK51bupnR60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9747.jpnprd01.prod.outlook.com
 (2603:1096:400:22c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 01:31:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92%4]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 01:31:28 +0000
Message-ID: <87h6kybvnz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87il5ebvom.wl-kuninori.morimoto.gx@renesas.com>
References: <87il5ebvom.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/5] ASoC: fsl: fsl-asoc-card: don't need DUMMY Platform
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 4 Dec 2023 01:31:28 +0000
X-ClientProxiedBy: TYWP286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9747:EE_
X-MS-Office365-Filtering-Correlation-Id: a8930549-58a3-4eda-8f78-08dbf468bcdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DY2vE2VcvdzRiQ+4vhu09mnYvAgSoOYx3ZjKG0WwfJ2aeDkDql9vAMTQB4XmhIhCl6eHrbm8rjoc8MhDPNfrL5s7tF+dx0aScixC6Tk+XNc9Brb6+97o/T7Rsg+/IvpIEq2yTIULWibJlQGGFsW9hijm8OakcpfK6dEEiUd6DSniysx/IbudcPXCwk/RahSwEkStC4FodsTDjDaa+JOWMyJe9DAH9MxTYKs2/8/lwFUshM7kHKr0FnJVb+94/UDXnB1/39jipt/ziRxou5nfpoVJrbQPgVKf1xEj62athQF5RTuBGO86NlvBVJwxILZCYd6F469tcC18juhmnNMC50HQ8XPKrDStXaYPYf9SpeJcRWmeKT0LVy3Kllq4kRJ6saahzZgJv51T0c9Rz2IM3OpGrQoA2BRYrhrg7hPepf7UcSSSrqLHC0IuJQD6IHrqMOk/guhEJkkheJ7F7hZND3JSCY1oPTcemtqCWezqgpIIFEDdYZ8EGzIhlZkoz+xF2dWM0YQ+ttztkKh9rEWvzryoBEoYj0At28MXwHE1pl8uAmxyTbqwXmNMP1pOrty0OtobhyYoDo1BE9/TXGaka7u1FwECTQ8U5eXyjYH1+sm8gA9US3PbqQUPCgoR4I9H
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(52116002)(6506007)(6512007)(478600001)(26005)(83380400001)(2616005)(6486002)(66556008)(66946007)(316002)(66476007)(110136005)(54906003)(41300700001)(86362001)(5660300002)(36756003)(8676002)(8936002)(4326008)(38100700002)(4744005)(38350700005)(2906002)(7416002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Qz+fH5H6r/GYaOcfMw1YIWRKmWSv92sYU4CP7BZNCj/RKBa+5ni1kuawmYHz?=
 =?us-ascii?Q?53FyWpKMa0tmJgkqDSQV4bDJ9NXVqRmio6wIyWAw3vomqsGp0fJcaLdhyAca?=
 =?us-ascii?Q?2Sdgvt2Bh9q6iOGGhsCH+UL6E6R0NZjhnNObKnI52CLroF4u9uBs4MU2LtHH?=
 =?us-ascii?Q?tgDsXC75CN8Ls8Bz8s1ubIxc7W5FvImXMDnXMcvKHGxx5/r3VC0Z5tfxJGjp?=
 =?us-ascii?Q?rDa4ihYyaPV6r8jtFT5cqg22VI45kLh3Hxci2BfS1teMDi1XaAEMrJlDdkLU?=
 =?us-ascii?Q?jh0EBPuujZzcQAXV9cn8s8ADe7npEmn8E3yTjnSh78if4K9Afpp0ifMM7849?=
 =?us-ascii?Q?Fniqn4hzBkbGjXsbwEDEG8keRiyUDD0X6xNtXkobL3v2iU52K6OEWcD6blIl?=
 =?us-ascii?Q?S9GEeT/moZzKpPdRFluayRle6GKkulUNzWgEDZ+M2OVvdj80O2Vkwz1OfbjQ?=
 =?us-ascii?Q?MXU5mwiuOI2ZrF1POhNl2uXy05K4Ail9vIkeHMGVQPdZVxWEB5O+r+PS/GOc?=
 =?us-ascii?Q?uwMhE6cDlUG0U19SyQnGNxo7dY2dWALi0COQLbAbSdn1J/F07+2a2qMbCamT?=
 =?us-ascii?Q?5syd+pQVaZ3VukLTxSWt45+5/1h02WdTTqtsiKb0Gk3N7dtfiwx3gFz9E527?=
 =?us-ascii?Q?th3DO0txG2tpOKel4O4iPLqdk63ebW6GbObmIVS1JovvAa9bWgwEcHCenrT8?=
 =?us-ascii?Q?ayyNvqsOYHTllSx8d1WvLIuh+yHFOOwSbtR5G8bwMaMDM2Wt3Ysbz1zhKBVU?=
 =?us-ascii?Q?XkUVCfQpByIM/GWvsxKtJKbwNWfyX1ht0/qI2clZ/nP+ICWtL/mP+49L8ZQZ?=
 =?us-ascii?Q?wkzJ+/WdpH+bJOsrA5Yvl6iiR+zaFeeKHi1n4qh91v9VgcI6ltSCk59RMfSI?=
 =?us-ascii?Q?H1Rxd9KDnTWc7BvcoEp5Iv6pd9Nup/USwFgG5tBkK2AYRFOKVTwCWgSqVnis?=
 =?us-ascii?Q?oHzAeb4aHcS/b/tl2kOfAr7OILb9HpYj1j2F9hhyzZP9ewW+vyGhRPk/CKrN?=
 =?us-ascii?Q?zSlSopSUtdNYcEQoP5KPaBqChFRvKORvSDyf06vruS+hoi/VFim5Lt9eMBh1?=
 =?us-ascii?Q?DGx6eaY9MGz4ORv7utSI7fnA6XBRsFDnnjjXk6cnqueWjMAdtIWQmd+52Ts5?=
 =?us-ascii?Q?6w0V86hVhmha0im/Ck3czUgx9RbyyKnt/3r+uDqnXQKeCZb4PMVSNPsp18q5?=
 =?us-ascii?Q?e7skezGZ1Zd38Dr1i7vCMLAKNuOgUdlDl24xFxfyffXhNVAB/ZaqWod7BerK?=
 =?us-ascii?Q?easVmxbMYW3uisrhKd/lIp+1sad0MrrS1BV2k8rKOsAoaXMNAOmG4+qPXvmv?=
 =?us-ascii?Q?VEoSJIiqt9L/2etLm6uJ7kjKCpYukTjTRwzVXntk8QqlWM8aO0feaI/vFJWX?=
 =?us-ascii?Q?rSQTfaZg08r2zcl/D8S8dl+pgw2q8uwkb0KcPb95RTbd2TTxmolTdrkEHcOI?=
 =?us-ascii?Q?CE46UM3WqLeyaprGxPCnvJXuFg/G/Bsl4+EI6SJanNNkdr5mbtZjLc5B5Olr?=
 =?us-ascii?Q?PyAowH7TD5ttdu81VUFGCyXdnhAnbnNLciMNdEpcpxu6/+0PHW6aIm2o5Yh0?=
 =?us-ascii?Q?dQfV7LRJYRJd4t2WbN68Hgr0iN/jgb+tBQTz7am9YkKD0D3TLCJhyRZOJaD5?=
 =?us-ascii?Q?1WO8/tdFYW/sgLx9sMCM154=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a8930549-58a3-4eda-8f78-08dbf468bcdb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 01:31:28.6460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6w/C3lmz7ImVOBc725qZDKkVu42rAMSPQ+aTSMv7nSBzRRN9TPvbIgtAMnHVTfsu/R3wLBZjfeuv6kdOtFH1H0fY4WmC6YOJ2belDgbxes/bfZBGnnwO7nMj/awj8WR0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9747
Message-ID-Hash: JEFPCE5M2GHHSFSFG4HLREBLV6RWW5XC
X-Message-ID-Hash: JEFPCE5M2GHHSFSFG4HLREBLV6RWW5XC
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JEFPCE5M2GHHSFSFG4HLREBLV6RWW5XC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can use SND_SOC_DAILINK_REG() with 2 parameter.
DUMMY Platform is not needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 7518ab9d768e..bc07f26ba303 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -305,8 +305,7 @@ SND_SOC_DAILINK_DEFS(hifi_fe,
 
 SND_SOC_DAILINK_DEFS(hifi_be,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_DUMMY()));
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 static const struct snd_soc_dai_link fsl_asoc_card_dai[] = {
 	/* Default ASoC DAI Link*/
-- 
2.25.1

