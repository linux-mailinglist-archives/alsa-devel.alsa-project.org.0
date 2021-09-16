Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1BE40D847
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 13:18:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C315118A9;
	Thu, 16 Sep 2021 13:17:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C315118A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631791111;
	bh=9ZdxoAbZ1DK3BGk+xt7Uy8o16G7U+NS8S/WhVE7kNrk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SI/8nF5YVeAyLn0r3yziG2DAh3ysexuvWmaVGQPKB03UOvawu322fcVM+IOAj+w+S
	 7WiMZH9SuLY5LlTzX+C3/GoOQqTBh1rEduV9u88vVteftGdpblikGyfhneQmVretFj
	 HhdCVZXigISKyhjhVpyt5XVUxw4Zm3cSe5x2hJ4E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F157F8027B;
	Thu, 16 Sep 2021 13:17:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D335EF8025E; Thu, 16 Sep 2021 13:17:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50050.outbound.protection.outlook.com [40.107.5.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3231F80117
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 13:17:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3231F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="mXDAjd1c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IW8AwjqJN7y8cWAK4uvrvJR/Vc/StyJLwamycORKpIATvMG4sFJ+WYn/XhbcjtILUtAH7AHX+fwJcmQr/diHXiOq+YlQ81dRzCI06lA5/zksYbMJ8yaA3N6z/leaBb++onJR9nuwnoi8n3GSW9bvAP9IcR8rTOOcpKWNoj5AGJenIuC6vtAQ9PoC/NzdlgCz48xbtehYH2I2jVb0UnzLVGJ+6jGmVV98iTIN/+oN6MLMBsRd09mYnK2USm8vnUn6ixURxzisHrc4oVtwEvkhtLy9FgohhSh5YmFNFYDTZR1tsSPNyriEChaBdEEGrbW9hvhierh0jNkyB71WSkCU3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=HuBUtLR+onNUCJZcoCwDtDOb8RML025duBPLRf+84e4=;
 b=BXk9lSyNqU0yewbKvoJerCPEsYqOQydVpj+7Qs0QOC46DZfQoyiLuebRQiH31Wb1m8PeXPlSPFkjfPQYle8rfmt2y8yzNnlKT+azlt9+5V+TKVEDWS8YJ4zS8T3RRgPUevisxdv8eNx1bv3fJb3YsD5lx338W/kNzCYMJJ6880bz/zVrFxUFjtkypqF0LWMFGZybn6zww/ibKxIOEWPUAE8It3Euhk4MU2RsO2GWtbBZ5jGRcM5M5kxOeeobqsz+KGrRBal8lVWOg+ZyoFiYPDjU4hj2NF2DyUF6yE0AQkG4InICZbsOfwB2czbCrGW5lPurHv6TtPjFMo8cL6y7RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuBUtLR+onNUCJZcoCwDtDOb8RML025duBPLRf+84e4=;
 b=mXDAjd1cZgo1va0ADzgdjDTz1IFF7ZEypgy+Fv1ZjQyz406q/aFh9IZOflIsU5ol+LL5tvVjsgSVoSc9R+z0aLZ6vyeK1Vm0EVw8QY2U8Pi8EUiPr2790+HjuQmpX51eGyQ3oL73+lm4rZJcghvuQoendEtgWkdsM/iEf707QyU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB4926.eurprd04.prod.outlook.com (2603:10a6:803:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Thu, 16 Sep
 2021 11:17:04 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28%7]) with mapi id 15.20.4500.020; Thu, 16 Sep 2021
 11:17:04 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH 00/12] Add support for on demand pipeline setup/destroy
Date: Thu, 16 Sep 2021 14:16:34 +0300
Message-Id: <20210916111646.367133-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR04CA0037.eurprd04.prod.outlook.com
 (2603:10a6:208:1::14) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5708:8600:b29c:ccfa:a961:8ebd)
 by AM0PR04CA0037.eurprd04.prod.outlook.com (2603:10a6:208:1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 11:17:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ba1a511-d7dc-46de-fbd4-08d97903830c
X-MS-TrafficTypeDiagnostic: VI1PR04MB4926:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB492622C105DEF7999CC3E389B8DC9@VI1PR04MB4926.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ao0D8HVvIGeI0xJGIf58exJTnbZMK0TC+aRwd/U7W24dDA6p2qLK/cwM2CeTWzWCvvGwYM5YLU6HrVzu9LDDhKnLWDjOg/8E09dp2m18bbM91PexC6W08wQyD0/GvYyfeUEWuexTxS6Za6VAI8xQdTutqFG7jn5yylYLl7bbNCe7QsOrVOWu1T7mXvZkVopRV8tBrPvf3jbTz0DIAMQ2SIV9M7xjxBQQFSyXltBXBhpHOMfmTxsJiYooQNoDsnyHKJMvsbiBnsd/0aqByYJ583uGdiGcLklDXNyUrI4PCuNv4R6ZLoixcmS/Po4EeiKcw1YjZkH+AeNxMcx43E2+98OSh+3vZWxO/QNeb6zKJ6YoMBgIZUhcV/3bUJfseD0m4IUX53qVYi4/vlK3i5HcDgOR+KTtV28MhtGabzPE2jR43GimP1fprE+0bX/0yAfTZsnfLJ9G9yekcj4sEtDcjfYsG2mGh34+Mo+XzdMXyZHLrNDEQhvooagtUbSbkSwRxkxaVinQdGOLRrQQxEQR+/G/90I/7Ky+CnMxk+cEXA7cbNr867v2ar9V5CLHC+ySqJHP4Y9rCAHKufV+09V3hcSXZonL2MOIMxYXJNWczswUteWtoxEG3js11O94ryqmbCUmKgnHoXwuNn0nBnq2TvkHaM9T5SsTi+bYuQyPOa7x20viQvTWW1Sb/2k7Yx4ioNqfHOnhpkvTfA04Iepp7PX/TG4V0tD43GWsAMMmNsE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(4326008)(8936002)(6486002)(186003)(83380400001)(966005)(6916009)(2616005)(5660300002)(66946007)(52116002)(478600001)(8676002)(6512007)(6506007)(86362001)(2906002)(44832011)(66476007)(66556008)(316002)(1076003)(38100700002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTRoWVNGN1lOTTFhQ0h2MEM2Mmx5UnlHV1BMeGNSR3MwdGFmQ2h5SWRVOEE3?=
 =?utf-8?B?Smpmc1FnSHBhaTJpd3JvVk1mMWI2d29wa1kwS3ZnVWtuOU1XUU9vOU9YampM?=
 =?utf-8?B?eFczWXZqRzVUTkZGMGdNWDFpTGZqdmlwUDVPY0cybzlPYnBkdHRFS3FBNGk3?=
 =?utf-8?B?SkNVZ01zd2RKT0t4Yk5NVFoyMU1WeCtsU0tseEJseTZpeERSMzlNbm51bG9V?=
 =?utf-8?B?U0N4K3JMNDFLWklZdjNSRHRnb1ZGK0dUcEd6UzdpZlR3eVZoQ3hqeThLcXhs?=
 =?utf-8?B?dnNMN3BzVFF1eCtjRE5pMHpZQmM5WlhLcEQ1dHVYNGJpUjF4bW1FSUtlT1Ax?=
 =?utf-8?B?cU9kczkzakRhZ3ovakJ5MHZBUUhwanY0UllYZ1ltS2NJTUx6aWhVeGRmRVAv?=
 =?utf-8?B?bTVJZGNZdkV3cFVvRUlUMHE4blJRUlZMMHJ2MFgvM3RoRnF2S0RQQVRWZU9j?=
 =?utf-8?B?ZGxMNURaOFVnOEJkcGl2VEFzMmYvWlRpSlNQSmRjdE9iVUpadUZ1OS9mNk45?=
 =?utf-8?B?YjFtZi9SR2dXaHEzU2pQNjFCTDdmV2Q1Zmg3WndrYTI3K0xiZkVGMjlrTE4w?=
 =?utf-8?B?dkxiTHVEbG9zRitvbzlKWTBRSGhoZmtBcDFONzNnc2d4N2lkS00rcXV5V2dz?=
 =?utf-8?B?MEZCUmthZkR0anpyOE90K0ZBbVhFcERGZFZPamxHNlNocWpZUmJiaVFlcjNa?=
 =?utf-8?B?Q0plQVM0Z3d3YWVycVN4a21SQUZ0aXg1RVdvSzAwQWprMDhMa0xkeVhQeldk?=
 =?utf-8?B?NWZOTEw3NSthTVpJY25pSEJRbmwwU0drNXZwZkZOUXNaaWZ4WFJmR2FvT0lJ?=
 =?utf-8?B?b00zTTY3elBxNWFTR25XYWVObFV2TUtZYm9VZE5aVTB3L2lwdjVjUnFObnNp?=
 =?utf-8?B?ZEVuUVRRMTN3OUc3aWFIcC9obzBjemVYTmZtZmdobWV0SUxoRXVhY1laZGhh?=
 =?utf-8?B?TjVTOWlWSWxXenh1V3lGd2VsNTNBWnBpQVE0bFFGU3M1UUw4SWc4WGNFNzFM?=
 =?utf-8?B?dHc5cnUrYnQ3eU10enVYTDJHQkZJcUt2aGh0NHVGQ3ZSV2hpWHdQQm95eXkv?=
 =?utf-8?B?OGM2NzVzSEliK1RyVVo2REZ6TXMrRys5cnEwQnpLTW5zK012eXlkQ3N2V1pD?=
 =?utf-8?B?ZytRSzdham1EbnNVYWR3Q1JFK0drR2NBaElINEk1WFE5RzJjMmNWT3hsZkIv?=
 =?utf-8?B?bUd5dlpKOXdSUzdsYkJVcGwwb3kzdUhMWlBjc3hqc0VKWWQ1TmxtZEdTZXV4?=
 =?utf-8?B?dFo4U1lvbDczWFdHSDh0ck1lZTUxZ3VrTnlEM2c0em5oZW9LQjZjbS82WlN6?=
 =?utf-8?B?NlVyVVVGNEpsUTI0UGpIZWExTThHTEZ1UDh6SGdIZVcxZVR2c2VpN2xuOEY2?=
 =?utf-8?B?RlVkSTJEaW9UQ0hmWFpUWXBYbVRZbGF6U3hFcXpyVUpqT3IrbWNXVFZsT01D?=
 =?utf-8?B?VGhOd3VrV1pOTUFpV3F1S0pYaG5Bdm9hdlhFYVppWDRVTnBIYU4yei9rTUdm?=
 =?utf-8?B?cXpsVW1id1pKcXFadGE0cXJrbisyY3VFbFBJNkRBSHpRL0dNTTRRUy9zeHZL?=
 =?utf-8?B?dGNyNzNUbXFINWZCNmsvK0lSTUxtd3ArRlNla1VsdmQzMUdtd0lqVWZ0Qmc0?=
 =?utf-8?B?Y252SGdkSVd4WnV4MGJ3bDlzQkRzZjZEVUp2eEtER3MySkM1RUVrQmFOYXVT?=
 =?utf-8?B?V2NwT3llZVFZalByN2Y3MlZ2MlJoTi82Tk9lZ0NGNEs1NVhLY1FLWTBlZ3Ft?=
 =?utf-8?B?ejRyQk8xMnJEcG44a0RMajMwbktieUNBcVUwRlErR09aTGJxeUtSRTJna2RB?=
 =?utf-8?B?NlVMREY0VGlGWGpQM3p1UlFFLzhEUW0rQlBJKytxZ0k0a3NGb0hQdWx3T0hO?=
 =?utf-8?Q?uPyy2wftKqR2r?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba1a511-d7dc-46de-fbd4-08d97903830c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 11:17:04.3293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +zZH1XdoDfYUpwPQo3zuPgl4u/jYXW7tA0Bx9Fkzji2O5WUu7d+bZr8ItrY5IV2P43ek4Dpw9Owxx+tM3he9EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4926
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com, daniel.baluta@nxp.com,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 peter.ujfalusi@linux.intel.com
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

From: Daniel Baluta <daniel.baluta@nxp.com>

This patchseries implements the new feature to setup/teardown pipeline
as needed when a PCM is open/closed.

Review with SOF community at https://github.com/thesofproject/linux/pull/2794

Ranjani Sridharan (12):
  ASoC: topology: change the complete op in snd_soc_tplg_ops to return
    int
  ASoC: SOF: control: Add access field in struct snd_sof_control
  ASoC: SOF: topology: Add new token for dynamic pipeline
  ASoC: SOF: sof-audio: add helpers for widgets, kcontrols and dai
    config set up
  AsoC: dapm: export a couple of functions
  ASoC: SOF: Add new fields to snd_sof_route
  ASoC: SOF: restore kcontrols for widget during set up
  ASoC: SOF: Don't set up widgets during topology parsing
  ASoC: SOF: Introduce widget use_count
  ASoC: SOF: Intel: hda: make sure DAI widget is set up before IPC
  ASoC: SOF: Add support for dynamic pipelines
  ASoC: SOF: topology: Add kernel parameter for topology verification

 include/sound/soc-dpcm.h               |   1 +
 include/sound/soc-topology.h           |   2 +-
 include/uapi/sound/sof/tokens.h        |   1 +
 sound/soc/intel/skylake/skl-topology.c |   6 +-
 sound/soc/soc-dapm.c                   |   2 +
 sound/soc/soc-pcm.c                    |   4 +-
 sound/soc/soc-topology.c               |  10 +-
 sound/soc/sof/intel/hda-dai.c          | 176 +++---
 sound/soc/sof/intel/hda.c              | 177 ++++--
 sound/soc/sof/intel/hda.h              |   5 +
 sound/soc/sof/ipc.c                    |  22 +
 sound/soc/sof/pcm.c                    |  58 +-
 sound/soc/sof/pm.c                     |   4 +-
 sound/soc/sof/sof-audio.c              | 709 +++++++++++++++++++------
 sound/soc/sof/sof-audio.h              |  32 +-
 sound/soc/sof/sof-priv.h               |   1 +
 sound/soc/sof/topology.c               | 362 +++++--------
 17 files changed, 1034 insertions(+), 538 deletions(-)

-- 
2.27.0

