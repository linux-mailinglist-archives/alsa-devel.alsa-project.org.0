Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2DF71051C
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 07:02:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84F1B820;
	Thu, 25 May 2023 07:01:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84F1B820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684990935;
	bh=NTihPacCARdgs7ZmZ3NZZDQvL2AhsPs6k2G7lqNOfZQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZdtmIGVS23+VlnzKPaoz7FhuCsd9wx7MdYEwz6qaQR77eysn0g9MPv/ZhDGSBFIy7
	 ltIlUgK/OWerEhuq985HRHc/BRQH0TVOaV5wOHjSJSUjyL5TYILlRz2SU1edeWsyMZ
	 V/myVlihj1yPoiuKJfAMh+DYjjw4rmlcdhs6K90c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C302EF806B2; Thu, 25 May 2023 03:21:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5362EF806AF;
	Thu, 25 May 2023 03:21:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35A4EF806A6; Thu, 25 May 2023 03:21:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20715.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::715])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89EE1F806A5
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 03:21:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89EE1F806A5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=W52iknGp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxpLS2iLBu9QONvD2CPasRH+Jp0B8FByLBaAbEB+msllNRhy1/Vp83bUN8A3xvhV87vwS3VihdNmnHmYObXIbEtUoxPMXETXJTZaK1O6qkhH68Ahpwh4CosZ4P1ELzxrQ6Rcn5YO4rPowS45cG+c10e3o66cGjfQ1+kjVJqKgT18PTqGZHunE+MeUq3Q/I/UMQ0OrmHRrTIIdYfW8xUOL+ZtjlZB3svAj01lwz9gx4gpr2IYN3nGYUl8KtkKOUlKYS+fUja4vtIB0Wl+ua0KOQi5F7D8kbwAp9uIsqQg6+Bpa+eFv5ms/iEPdsymNLLzZp/Pm1mGcpFltvNP44USmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLM11tDdg/Hyz22W+hCb+fuMD+nqtJa9WRZyjI1olr8=;
 b=fn6zCu8Sc/ST2/dXoL4Fb5SY1Qt1i5b9OnQSnQrcjBC1LJJ1O2DohcI1uO3sGklIm1Lhn5sya7KN2qmayXs5/+HmHj+dKAqkQjnYRlF9H+AU7ZhI0n9m/Pa3V2/6AW7a+1SwureQUvGJ79k/9vSSiNsfUAO/Ae48rGx7pv4HRZ2Ya0BIrVweEYhkTnhcOcuJguzwM4bJs3q3npS60OQoIOCJpr2mzshu/qwZx9RummacYCdsTeLonm6sxA92JlfbFX2/KHaoaLHRekDg+4ST64yLOeOJtLF9o0ggUUP17LDzUbJf9JHW49ljH90oeWoYzX/1+zvnp4hjEca5FbkCkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLM11tDdg/Hyz22W+hCb+fuMD+nqtJa9WRZyjI1olr8=;
 b=W52iknGpylbFvMpKtsbxwZi+jgvQa3LT1g6s9rPg8wU+ifPK0AMmBQV9rn1ypQ4WjOKleN8eB5u8E3JNV+BZnrRny7AFWO6CiA/BmMdZtpqMpbl0QhkpzO+NCpRtmHw2amlXlED/3NU3g6ydb34n6ysvSiZreG5a6he2Ek4csy4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYWPR01MB9477.jpnprd01.prod.outlook.com (2603:1096:400:19a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.14; Thu, 25 May
 2023 01:21:36 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 01:21:36 +0000
Message-ID: <875y8hgq8w.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?B?IkFtYWRldXN6IFPDhYJhd2nDhYRza2ki?=
 <amadeuszx.slawinski@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Cezary Rojewski
 <cezary.rojewski@intel.com>, Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Liam Girdwood
 <liam.r.girdwood@linux.intel.com>, Mark Brown <broonie@kernel.org>, Peter
 Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 17/21] ASoC: Intel/avs: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 25 May 2023 01:21:36 +0000
X-ClientProxiedBy: TYCP286CA0023.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::10) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYWPR01MB9477:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f868df-c21e-4416-52e9-08db5cbe621a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3AAWJmctYJ4Pp9d5RDwC6drcdTCt6gctQVtIe6OCePzKEhRpJOfpyZUZFhamnTN4rVWe/vE0IV67alTg60MCyPFUJoVnBI5IZ9NazGtQlxrEAO8jXkpV7+m4yqG6w4SK1WB6w3H0bGKfzL/E5Kn3lpoEoDd1O+4mg2p0dTOu5toFtyFH1EuJ6PndObh4fLfQ4t1BCrDY8JPzOiUke6oMIhLcr9fJxLf4CLpUQU5QZGsw4hIVssvr7577OncjXGmDtRITzDAngR/VdBdOHBPBVj23l+n72BAAfOib/N/8uH7s04tBV++7NCItisjRemzgmXg4C5eobuD0DHCAYpi6luXgZ7laMDFZbzp0vrxg98Dn2GT24RCX9U6IAtvVisR62X7CoMUkuvLHkFl3VRr/QdgTDQGewpnF6ThYVo4oWSBwaO2hk3M5rtB4WpuLnBPfOkXelJXtZxx5YDENZy6dGiq1AsVCX5+35tfebeoiWELFeW5JY30qsvsmQfUGZ3QZoDJfqPflFGHjsgSW9SmebWLQKg+pOc36+iNO2LVWbW0geK2/Qu/xYaUCuAfiD6eQgVANbk1seaZYOc3kLk3PvjUAqquOBGg5mM+Ff3Miv2lQb4+TQT/DOH9rr3MCsBac0QU6OR+C8ngE3bFqQeW/EA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(451199021)(38100700002)(38350700002)(6486002)(921005)(2906002)(66946007)(66476007)(4326008)(8936002)(8676002)(41300700001)(66556008)(316002)(7416002)(36756003)(5660300002)(478600001)(2616005)(52116002)(110136005)(186003)(6512007)(83380400001)(86362001)(26005)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J9vc1a8UsRGKd1fUOSJlSRI9hjz5+GkH4k7HLRhjIB2ToKP4O+w4dIDviTWC?=
 =?us-ascii?Q?LbnYYnIvVgZ4JoDogf8j97XjTfk91VQY/Rf2OlHW4GRnZbGAhGwymfaRH1ip?=
 =?us-ascii?Q?6rMENJWteB8t+8mqPKDIW1qgP4d0OtnVsJpksqn/GmYBOUyoKh5CgzyKJcxm?=
 =?us-ascii?Q?sryl+qWaTCEsc3dXQBep0IaBGGbsTrTZ2zUdLVWInns1KiizcoyWP+z4VkZc?=
 =?us-ascii?Q?UlUeUA2gvICBFoyJ2kJHrwKBjnD8XN6jmvqOAfITQd65jdIPuDpM35mE8Esc?=
 =?us-ascii?Q?v8vHwPJoRXItv3gt925G7b0JY4LPPcNfNWuo18eLd7RegO9m7PIsfHjcVQwn?=
 =?us-ascii?Q?cVRXS2OZu0BNBr8yA2RzH1dqYC+wr38UYOrBsmrkUqH1SrnF/7l43qiyv6nX?=
 =?us-ascii?Q?BWpo/QRsOApYUnMjf9IqKHDYVg8pHmH82s68j+3ibiEBc/HNdmZaSBzyTmg5?=
 =?us-ascii?Q?ndU4RNXCdWh8T7/VJQUXwDXWhOH5raT5ukSsNbTLfBkSG/tUfCavbWRIrlH5?=
 =?us-ascii?Q?5fB7eC4kx4uZQbTpO8Bw2DTUKhF/OTkDA0m6zYETIvU7BendVg12CUUuJ2Rf?=
 =?us-ascii?Q?QZEktg/QGGaSUiI08fr9gBOHcnVXJQI3WDpRZdTjxeM7o6NakDu3QtEELeYs?=
 =?us-ascii?Q?cbE7TF1C9+aWck7GEtI09vFmp4g+X7KJ0Rx4+G4JtngLhp5EeKyTtrLdeyEM?=
 =?us-ascii?Q?y9OR0/2Vb5GQtIA7UtiMWhYH5ckJLf4kX3fl3+tuAoiok565BPqUDcXTP+h3?=
 =?us-ascii?Q?yIuq9qj/DtX+9lMMOX1wZdympfv8RaLkaS6tA/KsRurubfybdg6FaA0TlXWG?=
 =?us-ascii?Q?r1DG3M3st30oGcNujn8dqV2dQC75YMuzlhRkSe2z2fflIrWjA62PxtprsGK3?=
 =?us-ascii?Q?WD4XQ1KYSmR3ZsxoJe9YsBtia1efc31Ulvb9wo3eH7LPS0TuVZLJ5SFpMVLh?=
 =?us-ascii?Q?EiCool21SvyDbVfz/EALWXlkrSDWxhaKCO7qaVHxAIzIEATf2MYcPkDSNV0d?=
 =?us-ascii?Q?DPfl+uvaRKQyOByXRjKAcg0O1FpZLzkWK/Av4+Dgrp0leMZB4cK1hOBNBN/i?=
 =?us-ascii?Q?/BRC0gyKHIgDfPJF/VU3eFMFRLSa6XDdVNQqIvzu8TuQaGq6OiRSAjKUwDMv?=
 =?us-ascii?Q?CyeT4EteE3Ajvhlx/Xl0qH40voCyAt7rcqzMv12mpC2RibTVYDaBPOF91FyX?=
 =?us-ascii?Q?v/yPMUr0B2tMGBTByzqNccvYtPrkogmuXwkhUNz69oN6qkmnb5eQIiwwJ+gW?=
 =?us-ascii?Q?8A+SUd02TzCA7JQnodFLSULGddyLKQos5LZtDABYivUfJ38LrsfJ59oqH3M5?=
 =?us-ascii?Q?JNKJKsJYqZkeEtv1Gcdx9mUDZlu4ixoR7bwywUITc6Dvtf/E/SxomDBbOZdR?=
 =?us-ascii?Q?UF4RkDMiQMQC880vOFl6tZKtlJQGdoCHJhcGcaaDp2PTyOdF0JXKgXnB8/6F?=
 =?us-ascii?Q?CgPSyN3eAMltTO6mnTtGVwCmA0DaOkQGDXE5bcFQU2sd5nIc/7Qvf+n15WJy?=
 =?us-ascii?Q?oym/mV2MjheAeZWkPdoo+cKOwUzh1uV5FTv/hialiRNtGteRSynJ+Kswzxnc?=
 =?us-ascii?Q?fRuMhahW/yEyQNwnLxWHEEJiGdd5VnMU2f0EzwsblwSdVDmfzRXx4Q5OyX+i?=
 =?us-ascii?Q?YKTU6ByPoW7RV8x2D7gHlPI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 38f868df-c21e-4416-52e9-08db5cbe621a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 01:21:36.3683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Ksh8ZtaVwlEO8mdewAw0a/ESeBjQ9z3P9b4uFMa0BoAj+pJehYY8dPu5QeoW7xMob5jey91lbucGbih/AC1TlSk/a/a8M/+dJex42+8wF0vFNivjpb+bHupCIc/N2Sf2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9477
Message-ID-Hash: ISFRRHYBP7DAAQCXCGO677R55HMNG5AC
X-Message-ID-Hash: ISFRRHYBP7DAAQCXCGO677R55HMNG5AC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ISFRRHYBP7DAAQCXCGO677R55HMNG5AC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() is now handling DPCM and normal comprehensively
for playback/capture stream. We can use playback/capture_only flag
instead of using dpcm_playback/capture. This patch replace these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/boards/da7219.c    | 2 --
 sound/soc/intel/avs/boards/dmic.c      | 4 ++--
 sound/soc/intel/avs/boards/hdaudio.c   | 4 ----
 sound/soc/intel/avs/boards/i2s_test.c  | 2 --
 sound/soc/intel/avs/boards/max98357a.c | 2 +-
 sound/soc/intel/avs/boards/max98373.c  | 2 --
 sound/soc/intel/avs/boards/max98927.c  | 2 --
 sound/soc/intel/avs/boards/nau8825.c   | 2 --
 sound/soc/intel/avs/boards/rt274.c     | 2 --
 sound/soc/intel/avs/boards/rt286.c     | 2 --
 sound/soc/intel/avs/boards/rt298.c     | 2 --
 sound/soc/intel/avs/boards/rt5682.c    | 2 --
 sound/soc/intel/avs/boards/ssm4567.c   | 2 --
 13 files changed, 3 insertions(+), 27 deletions(-)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 1a1d572cc1d0..435b3a4f7a54 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -173,8 +173,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->exit = avs_da7219_codec_exit;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/dmic.c b/sound/soc/intel/avs/boards/dmic.c
index 90a921638572..620ac4f07206 100644
--- a/sound/soc/intel/avs/boards/dmic.c
+++ b/sound/soc/intel/avs/boards/dmic.c
@@ -22,7 +22,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 	{
 		.name = "DMIC",
 		.id = 0,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
@@ -30,7 +30,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 	{
 		.name = "DMIC WoV",
 		.id = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.no_pcm = 1,
 		.ignore_suspend = 1,
diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index a542a67e21d0..b2680296440e 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -39,8 +39,6 @@ static int avs_create_dai_links(struct device *dev, struct hda_codec *codec, int
 		dl[i].id = i;
 		dl[i].nonatomic = 1;
 		dl[i].no_pcm = 1;
-		dl[i].dpcm_playback = 1;
-		dl[i].dpcm_capture = 1;
 		dl[i].platforms = platform;
 		dl[i].num_platforms = 1;
 		dl[i].ignore_pmdown_time = 1;
@@ -222,8 +220,6 @@ static struct snd_soc_dai_link probing_link = {
 	.id = -1,
 	.nonatomic = 1,
 	.no_pcm = 1,
-	.dpcm_playback = 1,
-	.dpcm_capture = 1,
 	.cpus = dummy,
 	.num_cpus = ARRAY_SIZE(dummy),
 	.init = avs_probing_link_init,
diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index bc3065c6ceda..e89bc6ccbeaf 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -43,8 +43,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->id = 0;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/max98357a.c b/sound/soc/intel/avs/boards/max98357a.c
index 183123d08c5a..2e5ef281e222 100644
--- a/sound/soc/intel/avs/boards/max98357a.c
+++ b/sound/soc/intel/avs/boards/max98357a.c
@@ -79,7 +79,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98357a_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_playback = 1;
+	dl->playback_only = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/max98373.c b/sound/soc/intel/avs/boards/max98373.c
index 8e221ecd34b0..d728a171a571 100644
--- a/sound/soc/intel/avs/boards/max98373.c
+++ b/sound/soc/intel/avs/boards/max98373.c
@@ -131,8 +131,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98373_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 	dl->ops = &avs_max98373_ops;
 
diff --git a/sound/soc/intel/avs/boards/max98927.c b/sound/soc/intel/avs/boards/max98927.c
index 7cccce99f92e..21d8957c7498 100644
--- a/sound/soc/intel/avs/boards/max98927.c
+++ b/sound/soc/intel/avs/boards/max98927.c
@@ -128,8 +128,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98927_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 	dl->ops = &avs_max98927_ops;
 
diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index b69fc5567135..9b983dbacd95 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -207,8 +207,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_nau8825_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index 6a1e121f082f..7b7251a0bb07 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -180,8 +180,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_rt274_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index 3551a05bd599..a6e1395d62a4 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -150,8 +150,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt286_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index 2923f3805bbe..e13d2a5d5976 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -170,8 +170,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt298_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index b2c2ba93dcb5..5e42e2b1b82e 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -226,8 +226,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt5682_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index 2b7f5ad92aca..f9f6aaf957f2 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -120,8 +120,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_ssm4567_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 
 	*dai_link = dl;
-- 
2.25.1

