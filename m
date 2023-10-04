Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDC77B79AF
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 10:09:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B340583E;
	Wed,  4 Oct 2023 10:08:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B340583E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696406974;
	bh=VjQZzxP1/yH6suedWq436rrm9SbueRIlHAmlKCrJuA4=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=I9iIHeaxFmLFLEMGCfYgFGDfdMNuABeGk0IlacHhozjdIr8bBFkHaPXg723xDNQJc
	 1/4bzo29Z9tiN2EdBICsfJniAlzuBbkSqKR5w0PJpH6QJu3MnK+iVHoJ+KGx2sMZyl
	 OoymfCcA01vO/rrhtuhKROfDllZ0LEpkzTcVoDrE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58681F80549; Wed,  4 Oct 2023 10:08:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA68EF80310;
	Wed,  4 Oct 2023 10:08:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6394F8047D; Wed,  4 Oct 2023 10:07:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20705.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6FF3F80166
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 10:07:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6FF3F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=D4cszFjc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djAlRB8Fe/1wnXhbeYPpbi7Pwuzuwi4a+sldQGa/gMO318tbIBIXF9IkCMdb0Sh1VVB1FEv323VUM1MJ2+FBJ1WQ8hT76gx81Ag7SNJ8SLfI0PcfLCkpOZwqXfhHnUtYVT3BURHQozdu3l3EsZNHb3eEvp8/SeYuf2v/TL65qdiJbAzs1mgwEozzkPGwMmaO2pU9HzXuXoJ3lSY3jAtJaHJVjMjNhkPmfpS/aTrbxiZjq/DUyjmsRTozCHfAXMQo/xQVEsAObclReQkvJnm+Pe9Jg8x8sQWZBPLp63rwD5ug5avsCvBgryjScGsyae1Ln6ILYkz3NY6olMPs4PmvdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfmQHM0RzfkheIdZ+N3w6J3kn0+StUQLr+XYWliRXcE=;
 b=QVfbfHKqIYRHzy4VQCLDDDSeguECzrOB6+2dS27g+/BGXbHZmkI5Ap170iC9KobrOa1gsuHkUsSgDAJDBYjMDx0BWn5iDUN0igUC9dvgYBXduWavMjG6ycnf5UF3PmBizx8iHZxgFLjhyjvHRHxGBU/i5bl57D7XXZSeh7ckFgobewqRjl6V+FpWVrTxvzsFmcIGHZkdEnORSjJlZ7KrQAzs19cKveiO3QZTOjtihLxYhDHnQ9+RHHgYBhXk3OOC5ImBlB3oGK4em9S+e7qnsrSrpmZlHAJXU3auZrOruOfRhNrHE4XnBASz0IwZqK5fYpujqYXfTh4BUnltuFYooQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfmQHM0RzfkheIdZ+N3w6J3kn0+StUQLr+XYWliRXcE=;
 b=D4cszFjcsbdW1r1xvd5eRnEalgHpvHRjMzaR6sXsCx6W6Tz+ExJn6cd9MovuiJtkcgIfDblAjGSuqrm+IW6AUgoqNuZad6fgFlT8Or4UzuPPRXZaJ4eRsTbuWHk4nZ5x17QlXIKnsrRhYcLv6jlJqPyBLWXB6OxWygyHVuowOf4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB5691.jpnprd01.prod.outlook.com (2603:1096:404:805a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Wed, 4 Oct
 2023 08:07:20 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 08:07:20 +0000
Message-ID: <87il7mg69z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2] ASoC: CPU/Codec connection cleanup - step1
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Oct 2023 08:07:20 +0000
X-ClientProxiedBy: TYAPR01CA0045.jpnprd01.prod.outlook.com
 (2603:1096:404:28::33) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYAPR01MB5691:EE_
X-MS-Office365-Filtering-Correlation-Id: d5e028ba-9a5c-4ead-3e97-08dbc4b0ef14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Xs3t6f51LDGoUuAq/rU5wmJBhem/glPh/e4B2N2D5G7mjIdDjIEKpg7KyrKSdMGks1zMqVmFhpfPmeec7MXYPAqPDwT3VY9biCVc+zCQWX4+kCTiPnB+eHLNp7SKNqbwJ8pTOWCTyNV0Pkn6dN0yTvYB+vRugsQis9S7fuLxIsZTZSgFzbgUVBosB3xzZaqj2D7PtvWSq8Pc4G9mvz1U0rj4bCEaQf5xmW+/zbOXf+R6IIzMc90/Ps99AtZD9+n0/mVd3dW3tUnqh9MXm2N88IE8ljA1eDZqgIZ8PH4K6QQKvYdLIrG/rN8fdSsT9Gkp22nQ6sIJQ9OSrjp5IYTTjJ9uwfew/i+kiaLiv5Lw5rNWcPGVwU2C6raE/kqBiqIrWcKjXDss0gWTg/gReRPWSjCNFHYlGFLamOHP1FYxR38svqjlIMM4Rr89+YPTiueXJ/npGhQ3BJfPsVyq8oo1wb4iYRvZLjutHfMKXQ/doH34PQWS3qjDkNkHMH9Ps83SmwwwE025HYFMhZroE+K4G0OUns27VBbYaTqYfs0WY+8zuBIjms4L5JPGhXP3G7YbWVX3MDGf8Tga5zEHhoBsdzovNUGPbF6UtnFpfPJRm8Vw47KhYKGarEsp6RzeyGfE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(136003)(39860400002)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(66556008)(38100700002)(38350700002)(66946007)(54906003)(6916009)(41300700001)(66476007)(316002)(6486002)(478600001)(2906002)(86362001)(4744005)(5660300002)(8676002)(4326008)(8936002)(83380400001)(6506007)(6512007)(52116002)(2616005)(26005)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GmV7xapAHqsqG3qko8VqvfzdtyGiqW/bEroBsBSItFzNWHc1j+BSvJxVVq6s?=
 =?us-ascii?Q?OrRUAu0Rw+2mR7/TlRtBeqrnQPlMKeC8OlRvFqoe/ZwcAC3jO4EBe/iyZdVV?=
 =?us-ascii?Q?QAJPG3vdrfmAX738knEmrPKsV2vsp2YbgELByL9FYhzXLWI63wXj5p4Ub+UK?=
 =?us-ascii?Q?l/y0wL77VHf8xzwvc/7xdwUHwVEjfS9L2e4sgMRsvxdHr3tdSGrC7lRzAPvQ?=
 =?us-ascii?Q?KP/AkN9xdV3lWV/3RBkm5S5q302nZcu2laETsEXC/b4O1HBszMjR/bfKmFEn?=
 =?us-ascii?Q?1HZ14K9iXZpkpfbg0KVSbvbFZzLssoX2BMkK3TuF5cLUI81F2huqwM6aDnR0?=
 =?us-ascii?Q?2QSdfeJK1AFq+tPIIDKD4L/OVJ/1Uwq1gzgBgE08UIluMIBJhHyWYHsk6aE7?=
 =?us-ascii?Q?UCOsyYibub7z5NnfPEXsWj+Dryi5tESf5JPJ7K7z96onZ3SvPwi48yACDKBa?=
 =?us-ascii?Q?AGgm25NGYyUtYBNb97nzdF2rqAJiMCwlljYBy2Ioze18YJ9eH82l8oCkLRO/?=
 =?us-ascii?Q?GWY7OOe9roGCBi0lXOAYlqouI1X1TvPwBWbt54VGQDHohEWtgtcwXGK7D26o?=
 =?us-ascii?Q?r7qq11qlRS46ig8Bge7MDlfLOG7LMV0LyipzPNlOtbXu0MoFlDO69X/Or2Ie?=
 =?us-ascii?Q?dXkpKX7Ri9hg4Sk8L9wMJclFDHnQCoVXXjdhtKHtQmRWDOd71B6G7jQh4n9u?=
 =?us-ascii?Q?VUF/T/IOMcomUYZ3aU2R4FyTGwukCnAGTPbeG7vKKIqEa3OnOPaEHb9wTmBO?=
 =?us-ascii?Q?474KIkyokMIzTYNG1ezhwbKk88VLQpRBR8I+RphZWUZfy4vVEZAQkvIYos5K?=
 =?us-ascii?Q?LhupE3hh2PLOpuPMlrXvwksNnnQkXQI12aFr13+7N/V3Dv1vWydVlqDE26lK?=
 =?us-ascii?Q?7e//CIn4yNew2cmSUrly2B/pq2mFvlAkWWg7u7Pu71OM2VyaylZiQhgeQzqn?=
 =?us-ascii?Q?9DxVHeNL99sEgyuJ8XBcRSBhpqMQFjM/Cpl0yGNvC2nnRraZ7h3Jc01qw9UU?=
 =?us-ascii?Q?HHxum7Piedq98nFsUN2W3wP3+yTzQbwMAXCxu9j+bCg3wnv/ocXF2L31VLsi?=
 =?us-ascii?Q?jpxh/NEu8KHxbTY39rh/foiijh2tBaGOV//Sc9oI6OjxWWFyhTLRhusAJqZS?=
 =?us-ascii?Q?npTHGoQrNhMTSC+ZpNpuc7yz1OWBEnM038VRsdyRILLbIR49ZTbZeErQ4Dq4?=
 =?us-ascii?Q?feDJCPzJYK4yTRC/en0TrAL2R18T6kFu9fr4jfJNzFwXnbGx5YgZ/NwBdcF1?=
 =?us-ascii?Q?fbh+u+i3pSlJ8rAgCBGiILyOBF4tBf3Y3csNTyHFBIXhYjewVPRIpmEtjuFE?=
 =?us-ascii?Q?scoO1Lns8bqz52MdbT9GHUU+0gJBbXeuXWIQe6yDzCoM0Gk0i4OBS4SE4k8B?=
 =?us-ascii?Q?bO4hoXC9RNTsDVK9llxn44lb037PKVfpuI7RHB8VybrIt9324pIeHruHunVG?=
 =?us-ascii?Q?4PWK5w2e+kBuxv9goR4AOJVFPPwVQGjEKPdwVqruwNLLfy64f4eMOP5l95fC?=
 =?us-ascii?Q?4oZTuTHH7Z/rCY/DevjT7SudM/6oT5PxwJOpCzWVnZxFKsF6l2PYfBPwehhB?=
 =?us-ascii?Q?BxATNkXkWJywosNfeYd7t5j1YZQZ0aEduI58ZyHkQE8KglRGE5q2jSIPUL2Y?=
 =?us-ascii?Q?Gkh0te/JFSbL2awSl0Qp5wk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d5e028ba-9a5c-4ead-3e97-08dbc4b0ef14
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 08:07:20.8658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 L1ZbwXmwgbFsGH22+Mq6HsEXz9Qsu12iO6Jo49CQEyb2RbzpY2GHhzCKV/nJW9seMF0dl1boSdBH8G4kX3XqSNyOiUN6UI2zGKocaPeksYW/k9CQIVpR2VLmOUEKtFiw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5691
Message-ID-Hash: S4S3PBSXOXN7WKOOWTPWC2MIS3OQWABT
X-Message-ID-Hash: S4S3PBSXOXN7WKOOWTPWC2MIS3OQWABT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S4S3PBSXOXN7WKOOWTPWC2MIS3OQWABT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark
Cc Pierre-Louis

I would like to post CPU/Codec connection cleanup patch-set,
but it needs to be tested at many situation.
Thus, I have separate it into small sub-patch-set, and this is step1 of it.

Current soc_get_playback_capture() is checking validation of CPU/Codec,
but it is too complex, and unfortunately wrong when multi CPU/Codec case.
This patch fixup and cleanup it.

Kuninori Morimoto (2):
  ASoC: soc-pcm.c: fixup validation check of multi CPU/Codec on soc_get_playback_capture()
  ASoC: soc-pcm.c: factorize CPU/Codec validation check on soc_get_playback_capture()

 sound/soc/soc-pcm.c | 55 ++++++++++++++++++---------------------------
 1 file changed, 22 insertions(+), 33 deletions(-)

-- 
2.25.1

