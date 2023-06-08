Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC8F7277B6
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 08:49:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BAB11D7;
	Thu,  8 Jun 2023 08:48:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BAB11D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686206966;
	bh=soE74QspTnfSgFer54Ejzyt6MVaAcTTqE/rNKlhhqMU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mBLGjP4jEpoPP9KZUVTWjJTdvBUFTvF4Bhw/tFbwTNAtMVksYd5T/n8dGtBY/JcGb
	 GEvloQdixtiK7i+2FP7xNEB9RvZEmb6F09PyPgjSqku64Vm8ZEEpgwsN4vZFWy7W11
	 PVE1nv6PJ6Vi4awtUcZxtT32GXvrUBrGywYruNeI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64BC3F80130; Thu,  8 Jun 2023 08:48:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F13F3F8016C;
	Thu,  8 Jun 2023 08:48:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B865DF80199; Thu,  8 Jun 2023 08:48:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3634F800ED
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 08:48:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3634F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=o0/Plu8Q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDW4awpLsrW8LAYQMcUSykJYc5jdKNcIR7q4CD3ESyZ2V3hEUFGaZmVgKRns3lAnJ92Eq2VrihDToS0Yl5JOWP3t7MrJO+9/glU5QdsaRYcXgFqKMpUaxKQvD63KfGa3aUOOg6nLgXxyVwerq8seBSxfAuVwZ5QRowUfVJiMO+cC3bmFMfP2ywbEtFcpkTV/nJEs+c3bWR2zcGWslphtP1DQP4NPBBMAA6ZhdYNytXE2LrLKnpPwR2neWAwBftKo2d2MifQIWN3faaPBTW0vwD/EywybPWv6g73LYVu/YRTtkuBpznAc/hGfDJSR+aYJ7qv7bSrJiu5vjbQH1OgSrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UfwPS+k6MlCacj2NE84aqB3AtFdqVGpkz6PMBf2Qi8E=;
 b=NUjEQtoRnJB4OoBM/qugj5kBotiSi38NTFjuRiSOr8ncQDjjzUVLwdEYSGSup9rsV+PDiltBQKWe/Vx7VuTV0aYldkRu6Ty99GUrcT2DITLwcPOsum8E3G3DdPPE6rM3ZCUZ6dCxtBMHjphmUo9zXIgN88xJByH1BOGfTPFZLlSernpnO3NBNmNZgpmQjl62BSzdKs7XotEh8dzbl9vq/NI0X+LAo1bX/RV37bkh7ShdxirGnIckiTiEhte51ySm8tVTVtqOs0LCdzmBSA16qk7H0+sNa0nCBopiH57JhPekw9gzqZdfoIw+kWu+DbIh8t2+CTq6asD+4I0L21wIYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UfwPS+k6MlCacj2NE84aqB3AtFdqVGpkz6PMBf2Qi8E=;
 b=o0/Plu8QeHIOUAKZrvKu3l5PopcMLT/SMk+yaoPOwlad+W5Z61b6PPwX/8XzKiEfNm266xUxu6AhwFvRKwOlcDAsP3kmDv6HpnF7oOw37AhjoQ3m2SnQXfH4SRzZlHvYA1bxb3mEWejs37/Ddlr7U3tPb/mX2NfiwVCDbcLqQEY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11864.jpnprd01.prod.outlook.com (2603:1096:400:3e0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 06:48:18 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 06:48:20 +0000
Message-ID: <87sfb2fo0d.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Takashi Iwai <tiwai@suse.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Walker Chen <walker.chen@starfivetech.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/5] ASoC: add new trigger ordering method
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 8 Jun 2023 06:48:19 +0000
X-ClientProxiedBy: TYAPR01CA0009.jpnprd01.prod.outlook.com (2603:1096:404::21)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11864:EE_
X-MS-Office365-Filtering-Correlation-Id: 678b73fb-4a4c-4c41-1803-08db67ec588a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CZ97QZSELqXcobaAc6QBjQRwAISesKmFdd3lndLv+XM2k7qfUcATixkEs7C3Ueguq/g9hfN2ApwkBHbNhRDxgmUDsBX4Kj3g6D9zyuJ8renV43IX49Deu6ak9FpxB/AuR15bDU+sGz+PNXQ1XLXNYKe0yz7KRtx9dd9bWgH41aN1AHK2YLiuY5XMJ38JOk/Udb6BxOHZEslsCNE6sIzcL1yZBfUWrPU6WciMedk5Lfoy1GwJTf9gnmxlWuqRtH7LidVH8OTiGgJFEiZP9X+f22CMd2ej2JZypaEjd62BZysdZxzZo5paWubhvQvnGN+GoAxTRm6kpPySeH4TGascztl3qO9jTk9jOVvRGvagkhRtY5xEZv5obrEXzkGeGQ+pfP30D3SEh0eMLQO1gKzm59jTiaC5HwBmY+xRPcHElTQzHy6JC7dh7FE8i1eyPGFOGmnVlSl+KcKKTwFsGX5qxBXxN2/SOEa0wz87zFrWV17rTG/I2BiSbx+VGpe7VhhwRL3bkHAgl12WNwYzm/AbuwIEi2ElkFnNAJ32FQzAF2vKdmcwkqtJh7xQpBsMVSyIuLfwUJC3HqZluV161Bndh+YJV9Rs+1OaEiR7VtON/9E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199021)(66946007)(8676002)(4326008)(66556008)(36756003)(86362001)(6486002)(966005)(52116002)(8936002)(66476007)(316002)(41300700001)(83380400001)(7416002)(5660300002)(2906002)(478600001)(4744005)(110136005)(38100700002)(186003)(38350700002)(2616005)(6512007)(6506007)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FJCDXILca/SeM8cOA/1SDC2VEuYFxquEIIM1GH86lICL8QovgFfbrOyGnMNJ?=
 =?us-ascii?Q?UbbAJMcJOH94H3bFviCq23v6QKdoBxzuBpkWnCf8shpWX0yXeEfazHEwOfj6?=
 =?us-ascii?Q?R7w248jteyeTzWzPQ4a2L5O4sgk3l7ZWXG5EFIyYdKlSm09cqzW226bbSDsD?=
 =?us-ascii?Q?hv/qmUN6J9esNwj0/09m0ZJeCYdKFvEFhlrtPhmMRxxFIXRRqwHPajcXsT0W?=
 =?us-ascii?Q?ElVZ8kulJNyPgdC2oRL1ZuEtqzylEoSQBsoCX+Ff4NTBx7WcDPoefHP6tQMS?=
 =?us-ascii?Q?PYuCJGUq6a43bliIOYDnyZtSL5pFAnj7q5NtwEK/1JVovuE2661uAXNpTZ7Z?=
 =?us-ascii?Q?fH4ST+Qs0prG7X3Z6y4adWhCR/mUvdqfGlCQGpFuINO2pg+Rod9xEISt8EN3?=
 =?us-ascii?Q?pmLTTuFnMN3ab8My9KdFrBz+U1SrU2B3W61ezTCoIS5Yarm/0V83pzxQlq9Y?=
 =?us-ascii?Q?c4P4WVvHhyauYS1+/PoY4tFh/xi7LMkE4qy/aXDVsrBcnUy/9SyssPPfrc3m?=
 =?us-ascii?Q?Y1hLLhMS+QOhQxON1g6GExcdeQiuoyVNLSdNkT3tnBV/Y5JOLJ4WpTEKBYFp?=
 =?us-ascii?Q?wzUju6kATM1MXwUeIQa1S8mCRq1ED8G3gB7UMkiEy5fiVJJ3KcxFRvcdm/Cq?=
 =?us-ascii?Q?SvN9lcyHz7Ug8CtbMR8+dG3a/Dznem1tlm5jZz4qb24U4R0JU2iLAEtAowO2?=
 =?us-ascii?Q?qKcrg6hlhH+0RzNkLe4g+JTPsZw1qsUj9uNDH/XxGc8SO1eNdFJqBHCcEe0s?=
 =?us-ascii?Q?U2g1H4gEKg7doJ0JFqlEkyVuTHKlcpfURmrHI5CL3sbDZ5gugDoiUiO8AnHh?=
 =?us-ascii?Q?1HKKpkMq0TeY1RqGXqo0fyWcNAFPwcCgXfVEPlrC31oT6iBvwGz95fsNpo8a?=
 =?us-ascii?Q?m8BdB2rOa4lBm2yS+7BPtPNgyqIX59BaHTndhbk8ZarQsGiQTy91rfL66LV8?=
 =?us-ascii?Q?wgh2DyxjvBth9JEXeLA6sW3XCSdPylwPRVVVRc8sleB+psIsXZL6vr4yse5a?=
 =?us-ascii?Q?3PYQiB8SLxatsGM2nlASg8WOh0LEmsf8376JhqipVSxvQINLymjMQaLQHkbx?=
 =?us-ascii?Q?KqA0SKkvlvr4zJtXu6JztcAGhrGuLcd0gkAoKFdW6R7BJbuRCFl6qc52KNby?=
 =?us-ascii?Q?a979dZCWR4JNV0//5vFI5DNEL+PvhW5GkLJ7M47RNYpC7RAjHnSdxHPYlxVY?=
 =?us-ascii?Q?7jMlqBt0cl2qTM11IY7xUyz22v1xAoC+14pjuMi2gGnOsr+UwXnhQZsvxO5w?=
 =?us-ascii?Q?4F5ed+bHSnYQAhfz3h21+NSl+rQ15MwlkA+P7+71MyyHe+RL1JbRyF/PWIxs?=
 =?us-ascii?Q?pBGWwGLVxWxOOR55V1+4eLPSOjsibaIGF3L9EKOeILFAGEZ7sewWAgnRGdX/?=
 =?us-ascii?Q?/Fnc1duxF/0K5q4hjrGDUMmTqpqc+VztKdmOnucnOkZhUSkLD/2yMz41Rya7?=
 =?us-ascii?Q?bXbQVLvEo9xVER5T4n48h5C+NdZHbSkVgF3XzO4Hhl3O/rYjgX/odS3aBPR0?=
 =?us-ascii?Q?cE2u4sEscmjcjiWlBEcebGIpB9eMbjUyuwcS21WbkhVuDuxE+BaxcIsGBzSx?=
 =?us-ascii?Q?zk8Y9gMNN6UETveX5QpiQ9S1LT4NR5iUhA9ww+2A4AGP881sNcW6belZhH9Z?=
 =?us-ascii?Q?VTFg03Wo9+1ijrZpmQ7rINI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 678b73fb-4a4c-4c41-1803-08db67ec588a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 06:48:19.9707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +OWXCOLicIQEMDMhusGsa8EMLPt4XDjTlu1IRFpou4a6LHQiucFZYvQGqlDkJeNUjha6A0Ygssnr/rwCrirdjyfBdr2pbTOZ6s70OXEELq7F5qA7tYd6tQdHKBw0j5Mg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11864
Message-ID-Hash: U4M3OVOU6VZXQOXVVCZEY4IKXHTRLP22
X-Message-ID-Hash: U4M3OVOU6VZXQOXVVCZEY4IKXHTRLP22
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U4M3OVOU6VZXQOXVVCZEY4IKXHTRLP22/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

This patch-set adds new "trigger" starting/stopping method.

Link: https://lore.kernel.org/r/874jnihm8y.wl-kuninori.morimoto.gx@renesas.com

v1 -> v2
	- tidyup const vs static
	- care missing starfive

Kuninori Morimoto (5):
  ASoC: add new trigger ordering method
  ASoC: amd: use use new trigger ordering method
  ASoC: atmel: use use new trigger ordering method
  ASoC: starfive: use use new trigger ordering method
  ASoC: remove old trigger ordering method

 include/sound/soc-component.h        |  11 ++-
 include/sound/soc.h                  |  23 ++++--
 sound/soc/amd/acp-da7219-max98357a.c |  20 +++---
 sound/soc/amd/acp-es8336.c           |   2 +-
 sound/soc/atmel/mchp-pdmc.c          |   2 +-
 sound/soc/soc-pcm.c                  | 104 ++++++++++++++-------------
 sound/soc/starfive/jh7110_tdm.c      |   2 +-
 7 files changed, 93 insertions(+), 71 deletions(-)

-- 
2.25.1

