Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7BD8180D5
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 06:10:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9F99DFA;
	Tue, 19 Dec 2023 06:10:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9F99DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702962659;
	bh=JkguLnKlN6NbBtpvcp3GdsgVJu+ebS3k1h4FAncZS6U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vEusfF1JlV4qXPHCTHKbxE2C/OPteNx6UT9Z/s5t8pew7umFy7fkwfFP7chpzsCrM
	 FV4SeaqMXODpi4rNHzv4Kgg5RkgxEEFYgY2OYMsm0SycnOLWoOViQ9FQ8hiyVEBuU2
	 Y7/PTdze+1beJAau684KEWuzp4f6KFg+piv1jquQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA395F805B1; Tue, 19 Dec 2023 06:10:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52F31F80579;
	Tue, 19 Dec 2023 06:10:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90DF5F80589; Tue, 19 Dec 2023 06:10:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3334F8016E
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 06:10:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3334F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=dd1XtYIL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAyKKSyRPpEi+RWTuDBdY8siT1Iz7mGh84BYWd65zMBg2h5s2tPS9werXxEWQMtMuyOr1iHekTtW3JWP4kG3gdkW+F5hePDS6YUJtkIg+pv4friuLHWNkan56ovkOWZelYamMxQkJq9D+npcInNopJ56iaopsYQjVipSPNSjbhkLUDXfy8lYqsEqOiC05W2Swnuy7bdDO0Ww1qqxgxIrruG3DiYqCgoW5Xke+qs7GTsVyT4ytjpmUnMMusZBC4qI9UG4cqffNbvM54KhkOPalUw6FsvzoGHCAPGXmMmM6s4HROzxsnm1NNojhIh2+X4mgjpHJOEU42+8vBDXkIht1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdQoeL6szFU4iabfpuBy6jZ4zibauuxP9ZREDyEjLd8=;
 b=K7ocGbFHf7RpmbCzQspzeK/leMXEp2zvv2GtCjDWCF3SsaW96jWVZoZjS8GOIZkSsk5o1/wOxf/P83oFQH/vJeAD+rJ2AuwRam+XqHZZm/tFZi1Bn9WUtEwa9QApDa4BDJre5d2SQBAbUjFX+QSIdbyAhPPzr3xqvjuesgGvLMe5+rx05s29RpiKVVXeVcHyMrviuJ1d4iBbtqcp1RSJ6Nk5E/79YEYD+Zwuyc+0zuqcS8JIa5kwhQiwXvEnTLmXkqdbbaNvzSZDPZlOLa3ATKr78I6CjPVgg92gj1RmDEd9JQuXcJeCfvX4uSNSADlKcIIAhNVOBVqCSmaZqbUHwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdQoeL6szFU4iabfpuBy6jZ4zibauuxP9ZREDyEjLd8=;
 b=dd1XtYILrLEgz4NN7INnz/bmZUaPpwVn10NB9ltaYkgeYS6O+VkhdofzKLBDQmTyKQxryXugQ64ogRq1oDvvASsVxLlDTt+Er4Bfx/Sx/oDLbY0rUesatuNu2FfBu2zOIhlzDkfN5f3+U976ZolSg2vKV8tnhW2W7UKH+Rc5dvg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10094.jpnprd01.prod.outlook.com
 (2603:1096:400:1dc::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.10; Tue, 19 Dec
 2023 05:09:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::6d8e:5f2:f206:6fd4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::6d8e:5f2:f206:6fd4%7]) with mapi id 15.20.7113.016; Tue, 19 Dec 2023
 05:09:54 +0000
Message-ID: <877cla93ry.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/5] ASoC: fsl: fsl-asoc-card: don't need DUMMY Platform
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Brent Lu <brent.lu@intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
In-Reply-To: <878r5q93sq.wl-kuninori.morimoto.gx@renesas.com>
References: <878r5q93sq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 19 Dec 2023 05:09:53 +0000
X-ClientProxiedBy: TYWPR01CA0028.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10094:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e488bd5-272d-43a6-5aaf-08dc0050bc75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WTldzpsCfGDVQL5Gz0b4bztL9IOagx9f3bitAsTaoJkDzPscs3kN8opc5mnRpwJUfDItCx+RWijH/WaGrpOrOSGFLxZVnMkGSErEawV0MeHBnbr4mEyObuNsslvAxs5gGI2/dUISzPgIdsFVDmfROHSoppU8sri6iKtb54VKWyJGvav5oghEShORFJbEZMY3zXx5V8juhoxwF2WEe6djoIx+zgGjQz0pCa7xkr6V4fQEmFeZp/YY0wSlfsjjMrV3aHUlk1cydeqFElVebS6yjUL1t9WFDT3vJZeHqsYzg24LCJPXiS1ane04vUvc4x2pljHHlkXI+nrjs23dEYBU/5VmhGj2ab7VROdusXWw21GqAQbB9lTnGl2wf/fe+nIcPpqoJK0Hg0PAzbO8KguD3AmgOEVrA3G2bN+9odaVIn9mnSG88PfK/j92PGcPw9PY6kK8j38czsrJ45dH9Gkq1rN1MMo9NtmqlWnNxYB+84D0APiIVK+GOyR45Ay2heAOEzucReEeAKOXqqfKCGp3bVTMEt/RO0YdnTlGqNltU4vIdQnK9SOX24bkx6/ARAR4Z/lyJThNBVEBCpWcIAyT6y4sk2ulykU8YT56T52cmgrLDnu8XmLBQiktBKOX3hcKvAM/6aQ9+jD5RYiGDsxqrg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(39860400002)(346002)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(66556008)(36756003)(66946007)(110136005)(66476007)(54906003)(316002)(2616005)(26005)(6512007)(6506007)(478600001)(38350700005)(41300700001)(6486002)(921008)(8676002)(7416002)(8936002)(5660300002)(2906002)(4744005)(52116002)(86362001)(38100700002)(4326008)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sPfnQ5WM6uPZ7oy2NVSZuZbvhDQnhFPSDdZl+ksv49awC8w/4uHFZU4D9KmG?=
 =?us-ascii?Q?5eli5vkFbNmoqGCkS5aokToqbdl5wrEV+jiM3roi0Nwadb/btEYp4tfLR5FC?=
 =?us-ascii?Q?BMD4ltJihVJe9M2eSHPyxhQJbKQut1cFO7hocqooBiWb6MwTuf596tWFlzRI?=
 =?us-ascii?Q?Jp4AfZ5BvogZnLsrTXwEmnXtWTyoBt7uREa/FV3koaE3yYH5eaQsoVLhEvFg?=
 =?us-ascii?Q?zFEUGfT3Jo9t5ilcTZK46DIVaJx7LSlCmY0AnrwCvW/1TviwXO6Xd4i5uN3t?=
 =?us-ascii?Q?zrdj7+HleDfd8vrn9JCuK0Jo9kBQ6/6U1yCtoN0CqO+u0Mcl4SXb8xzHWB/u?=
 =?us-ascii?Q?Z25TsZ1wbNx4QRM5Vy9NBZ8EX4sjTFAgEopleejWx0y8pRvGWUht0gzXLgNh?=
 =?us-ascii?Q?tq2zn7mNwVATORv29dj7SHdGS8jxO4/b536IkGKzwgiG4nGOPouVKiIJHecA?=
 =?us-ascii?Q?2xM1qSqGn/H8eYiZn/7FIcf2rWBHUkGgVsIWMPnGXIXwFWp8hBxiIfSm+caR?=
 =?us-ascii?Q?fAqiaALKO1H4JVSrdQGbpLBG0J0eG3+meQ5OyPQxYTPVZMPB3/P5Z0Rtiahx?=
 =?us-ascii?Q?HaDB1+4xYInuJpI8WxBeCYjFEj27Q4rMSVY/8JzHVsyBDRkxQfA3LlXaYCPw?=
 =?us-ascii?Q?fdbetOlvVzv1YhQdaBWUTgEQt85CDVtdBHvOAQnP4IjEP4sxpTYIPn3nXnaH?=
 =?us-ascii?Q?roYBMB/tMhcSw8p9cHzmuisE/0TltExtHnanVuozLZbLk1Z073fW2grMMUk0?=
 =?us-ascii?Q?UMef5OgSk2uxctL8hbLQst2egPxsdEYjRDeSshetT6jP5OY/s2xKHz5cejNv?=
 =?us-ascii?Q?YYd0ej5qR2MULcSJI/frMD4TQ9Mhr6aapatKHOs4Mb/fIMuJXV7CXgrkv0vS?=
 =?us-ascii?Q?KoJDQ3ucAz4jvVYJDqxYEvpUMi6cR2T+2KQe8XPQOMXwGov8N5CsSilZMrWg?=
 =?us-ascii?Q?85Lz0CuPs0h7mlzbr0Jdk1fFwQS3rUrGv8XVu7xqXOK7R5vK9v2D1HdbIUJd?=
 =?us-ascii?Q?xsV4912RyBNTueDxpuBSiRBXVuiDT2dst5tytW+PdfrZWD3o90AKIAbcGhb4?=
 =?us-ascii?Q?/sqDiMQtBq3bsg7Ccvmv8uXTtdMEqNt2MLxlH6CWTRoqe4Wg4SAH348Byiyy?=
 =?us-ascii?Q?+1b0SOMmSsrfW5JnHt2FAcpxpEItUDFvRL0ZxbZasSV5V5X3TWe5/mvjAAG6?=
 =?us-ascii?Q?wo/3uK7YL/EZxj4WpTwrE0KXygjs4bZT7tyaKrjHgXht80r8vKu8HI7nIdI2?=
 =?us-ascii?Q?FJiXn2zkL8jwJhc4oJl8lChqmizAzbcv73gsXy2hXD31qCDdoAZe3OBQ7qdW?=
 =?us-ascii?Q?4kfCho2cg8fRx8au9UCj87gv/7dLn49jXi8L/wr2vXpkmyV+acHvIKFqdvmE?=
 =?us-ascii?Q?MfMvL3nDDW8acSFdwpoHtkLXC/yzWQHBf7KCo/FiDk+aEh1pJsjGwrCFPsAm?=
 =?us-ascii?Q?o+IzSj42hmFikhHik6duv+h1gDBTkv6hDRpkh5BwM6YP67Q04evs/eO7iFBi?=
 =?us-ascii?Q?BC2sQJmrWqw4ZYGlX+wGwxFVzk89hk0+4hWxcvaU3dUaKFH4uJCnE6O7/m7V?=
 =?us-ascii?Q?ILxJQ7OLoEmCDU+7oZtgz9VERA647IN02u3I3VK2D5Vbi2OH4G8UTZuh5iMx?=
 =?us-ascii?Q?4FkEe5RUNjMbIXThqhUH7JY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7e488bd5-272d-43a6-5aaf-08dc0050bc75
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 05:09:53.9816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tw1bNwgH9o1O8Wz2B8CLwNTdCsMdirV5HMH7Y86F5wjsSLbOltCgriVWmX10nolyA4jNLq+WG9FaAPQASX+DOxRVhSGoj7BwzeM7PPmkdGJaSSZMHeXc4du9tjXM5aoO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10094
Message-ID-Hash: PHAFRZXS5OFPSMZXFMYAESKZPJVNQIDO
X-Message-ID-Hash: PHAFRZXS5OFPSMZXFMYAESKZPJVNQIDO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PHAFRZXS5OFPSMZXFMYAESKZPJVNQIDO/>
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

