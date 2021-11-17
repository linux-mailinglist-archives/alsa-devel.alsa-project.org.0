Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB96454400
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 10:42:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1B7A188A;
	Wed, 17 Nov 2021 10:41:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1B7A188A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637142160;
	bh=BfkOn1DhkI2w5jM7yoT9YiSQgCU4dCmxtyXx4sANg5w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PoNtx6i7IYH7RhBzQh4OmFoxm8xIb3nPdMThnuQU/I5i/Rd0Fsx52CLi/YIv0F2uT
	 XaQPA8nTuPQYZuMAQ7x4NNyD1I4VG5dvIvwg7lFZRCzT6Hi4szxTwRLqbi5fzbEN0t
	 5EqxyOwJo3gRuR3IApr+Rpig0Ylomt/1pOAD9ka0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E292DF80537;
	Wed, 17 Nov 2021 10:38:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B768F804EB; Wed, 17 Nov 2021 10:38:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2057.outbound.protection.outlook.com [40.107.20.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2A34F8049C
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 10:38:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2A34F8049C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="AJcMzu2q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VolrQBIJVrZYBIY13S+4V9Wc5AINwojFsfAtWFyr1plGpt+xc625c7YQUHeedkn0BcVJXoefZlBB9woCc7/vviPbKi4WolEn0XLP8QoL9SVllzpDtgsN7LplHpsOvDB656K6gS0SDG1qXSPrvuzBU7OQ0J2v82IlZmvsl+8xIXbNyfhNLFNv+Z4XKNmQTuE4uV1e5LXtR7aBJ4bvEXd0nEDdfh2OfNq+86ceL9wxo0VSyY8qhOp2/9OptV21dHEbfGbm3hnJjPiJCLHmLJH2rCix8RYUuczf8m/BHNdZCiMKmztigTWTJHC0ktTaWL7X3UnjFZdAhIdFuKAlkk3Ifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2Ggpnh3r5i2lWYEnSpFogjWi34SGFMejbH6vPzJUwU=;
 b=PnjAQj5xJEjzCFhVDEa3Fwi3QTFtBOmKnuBAhV7gPEun5VBsQtgdyXKzCNAhoAzBod9ZmDJSEpklaOJeFjza2HQ8FUZpfhDadbxz/GCTmpyiXJkU5gMqhgNueyaphecwsQuS1Ty7DFWgxRT0BbHhcfuh4Lw3E5QMCrgqK+jZL4GBTSp0Ryayiru0/4RMDu0RaF5um/4XgdRU7fE42flG4aZGDaaWvB2+LB4gaPaY7/Z8IpR6xo8FW4XDssgoShCnlNIIGsNJ7wUEg+H/XE8YW8h04tEBCaGFxTofVKuggfTciN3sAQVxSLr+2g/49ealXMPY3vDwnb9vxQJLxGfZeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2Ggpnh3r5i2lWYEnSpFogjWi34SGFMejbH6vPzJUwU=;
 b=AJcMzu2qH/wZSHr6wLZaobQxIpGxBCJooEQg2nhMKDeK4VKYTrQuaqQeVRdJzSYanRJsCwsDIDl4ycbeLRMHeA3JNJn/ab88VAD1iH2bzQOTrQdcByFeouf4LDi7CThWmZanOerx8OZ4YcDktjEn42fBS4f3XRuylWKdNZpaKaw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Wed, 17 Nov
 2021 09:38:16 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 09:38:16 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 07/21] ASoC: amd: Add module to determine ACP configuration
Date: Wed, 17 Nov 2021 11:37:20 +0200
Message-Id: <20211117093734.17407-8-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM3PR03CA0060.eurprd03.prod.outlook.com
 (2603:10a6:207:5::18) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:22bb:b216:ffff:73e1)
 by AM3PR03CA0060.eurprd03.prod.outlook.com (2603:10a6:207:5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Wed, 17 Nov 2021 09:38:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecf7d978-0b2b-43d9-9001-08d9a9adfb68
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB580734B77F3F1413E5A2BCC4B89A9@VI1PR04MB5807.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2YgQDgS+PQC/6Gq0kn42ZnQdA71v9EMTzljqNYZsxhcNqhNFI2/mgraOvQG8lnVBOx6cxKHAC+ZPuEb10w5WdRWd0ALI5CD2E/HKewyg7ZOaton5Nwzresd1qFpqhymEm6wp6pP2TNinDj+dVCBSAOrrKB3F61BsCEjqjR0ogh5DoeG6ysp4KfvzHziR0VIPtEOX7uZ+++0xpUiSzCSjyaC8059nTWu/BFOsF1VigfPsuSJhVeSRFMeiBGsuGP7WpmFveIakErr/B46mBYsPdgZCriZu0rMnHk9XRc288FuKHRBGAhy5OG9+zOZ9lgnvPMMnZarcb3eNHEAzseeErn/unwccu91ZJxxPIQ5E0nAMtpyWX9HMSVhXm8NLJmTvAWd69eLxt2OPqL5tiwT4VBXkYQih5Do1+o97YKT2Ylkg5uCsbKupG9MyAWRj2SwmOLP6MeHH2nfdlLlEpvtCs1LRK9Rgo+/1JPGhm5GqpBkpmz1bm6+FsZ6S8RcylnimS6Wxl9BjncHc0acPOljTQd3sbmS4eeF9KnwrUinB7fvHIhhzJuhH7InN6G0B0/0LqE/7bPry7uTjd07m3/V+G4u3I4YV0h9S2Bg33xAjjO5/2PVwkiE2+/jhTOUwyCMxXN0+Vesx7h8lAT69vgA8Og==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(5660300002)(508600001)(52116002)(86362001)(8676002)(54906003)(8936002)(66946007)(186003)(6512007)(2906002)(6666004)(6486002)(7416002)(6506007)(1076003)(2616005)(66556008)(66476007)(44832011)(83380400001)(38100700002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?alHuqOEwWc96+xycJx6HANBDoG9T7BUG7dEu8q/HH62wl+tJhM7hSp7+0dxn?=
 =?us-ascii?Q?DpIz1VNDhoLLO8W8vUO1Ug/6sHaUM4udXuuA0Iaw7B9AP6EZ0t8/y9A8rakD?=
 =?us-ascii?Q?+erDyplrN4/rNjUXHNfWUFPK9DM+iygJi4vzpeE8NBQRSlF4T6j+cytVQcvP?=
 =?us-ascii?Q?hORYd/VVuXnxXNigY3MwM0SSrMQtdizuUhoFbCLoIhrqQVlwYjozvvFh67CW?=
 =?us-ascii?Q?mXuwm/OSyj3wnbhyjdgqQRrGiHOuexCsVy4gegD+x3QgE8Wc+QBuPxlQsMdm?=
 =?us-ascii?Q?xmlXUWF9iBvWyVChC8YfW/BypGlw0mjo6sNkSNLrVpI1Xx/iOgr5AEkssyNu?=
 =?us-ascii?Q?Tf3mEXN79dtZx2XPo5NEt8tNsyUtp4+TCj03n2bDflD695HfPrjlk7YfcUig?=
 =?us-ascii?Q?6GqQ5HTw6eFNF5YPqwfEmyHDEqcGO1whEraTgvpG7Qcarqvr9HZO2aQSLts3?=
 =?us-ascii?Q?Co5edE6jSekSq3WF4ADMNTSoZQxhvpIAHKKm/Lt6WZAKc/9a1MDIC4ghFT7S?=
 =?us-ascii?Q?+XnL6aAib0qJI4DTRsfhYxvu3YktNBUgwQZ/1f6KAbHe92Bpi7U45jkwUvZq?=
 =?us-ascii?Q?RIqbhTUDjbgUXqdRoGhJdah9svOmHK8I3ZP4mXLsMZfkR57ohlfcPIWOYb3S?=
 =?us-ascii?Q?x7y42KVCBAVtNy30onkSkEU53RWyg6lP2lsBh+HVO6LvSJzTZnogPnIPOZuf?=
 =?us-ascii?Q?+DCwnFA4anQz0XtiPovnMFOn1WmbkYIeBuHmbzDLf1t07oLjpgjIqaj0p7ML?=
 =?us-ascii?Q?KVIp5LG8DZMdIeUQkjUUrxSbgg6IkySdnIPktIR+7bQKtPGyv4pIg9tIP4og?=
 =?us-ascii?Q?BJnAK0qsj6KJQ7vU2P+4B5aUodSEjehUeV1NtONsh6E0+SeBvWrXmA/1AvCP?=
 =?us-ascii?Q?Hts6kQNAsJJq/7QeQHz7dCxcFmcZfsDVYDdHw1lZ7+h9Y2a+VqtdS4w1n3B5?=
 =?us-ascii?Q?OnkcKTNvn4oa7MzkoO/TfTVeKmUedtkGKuF9lnXCDxAHA02A6if4nJNGn7S7?=
 =?us-ascii?Q?POFsjsF2UerNjIL6o3bNlpAJhUpnv3hJFkJ8Y8jECwRz2Mlv+FW5ZLCAI4Jv?=
 =?us-ascii?Q?ANzXyhw3zK4EzJpJD+5JxIArouWRZ7z1xHrBYA9RhIH3vHW6okVgeHb4vZEg?=
 =?us-ascii?Q?EvhthTWFm4mxwvy56U+L0XnqkLAkU5gSvCDkuS2kndy6Om/W142MwoHPrBFy?=
 =?us-ascii?Q?cPMlVNaLf96Q1g7HgnFlvwNZoc8XL7RUYYNQhlQQ8XWUy4ifHWqxLPOqIgVX?=
 =?us-ascii?Q?77xBFjFg5+QrGvP64uWj+qvKhbSZcs3LHGIfux0ThjMUndK+adR7s/EYHXO4?=
 =?us-ascii?Q?5wOQl/tie1hrJOgxI6XBAqTtdu8t7ZTY0oHk/tcO4YNVDbm2QGl1NanRHnMy?=
 =?us-ascii?Q?CUQcPebpt/pPXKgm+Unyt2Wcv/sPPc0J19cvb7Nm9uOS/2f6+e+RTi45kk35?=
 =?us-ascii?Q?hFGYjjhDqlQAatak+FFXCK0MwWgSz6QTZDIpD4/xMwes8knY1oJFug2iQh2w?=
 =?us-ascii?Q?WllA9UCuIT+lpGnLOsJZvpidX4Z+ASJY+dY5hucc8U/1jQneiJkCS/emPjis?=
 =?us-ascii?Q?vxC5rMxqmYS3V8lZ6yBpVWTdVJPhVjbyHpn7kua/SJsEaXbWQZm4otBLiiLx?=
 =?us-ascii?Q?VxLXDrR3LJ18WycOuWwQgH2dqJ0PWQ/s+DsUQmF/RjMNEZ7ea3EQY2RHLzJ8?=
 =?us-ascii?Q?ZfSFygIeknTBtz442dQZCo/6+SuH9CCIJ0FEVchScLNmqbJj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf7d978-0b2b-43d9-9001-08d9a9adfb68
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:38:16.4524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AU52seh5GvanwKFYf2Nhx0n0z2pG7barkm6GJr/Isx7iC4eO5SQM6e+EaL77HRyGoWVeWwiD7VaEExACjrocdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5807
Cc: daniel.baluta@gmail.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 AjitKumar.Pandey@amd.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 Julian.Schroeder@amd.com, linux-mediatek@lists.infradead.org,
 Balakishore.pati@amd.com, yc.hung@mediatek.com,
 vishnuvardhanrao.ravulapati@amd.com, vsreddy@amd.com, daniel.baluta@nxp.com,
 Bard Liao <bard.liao@intel.com>
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

From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>

ACP hw block configuration differs across various distributions
and hence it's required to register different drivers module for
distributions. For now we support three ACP drivers:

* ACP without SOF use case
* ACP with SOF use case
* ACP with SOF use case for DMIC and non SOF for I2S endpoints

As all above driver registers with common PCI ID for ACP hw block
we need code to determine ACP configuration and auto select driver
module. This patch expose function that return configuration flag
based on dmi checks for a system. ACP driver module probe register
platform device based on such configuration flag to avoid conflict
with other ACP drivers probed for same PCI ID.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/amd/Kconfig       |  6 +++
 sound/soc/amd/Makefile      |  2 +
 sound/soc/amd/acp-config.c  | 81 +++++++++++++++++++++++++++++++++++++
 sound/soc/amd/mach-config.h | 29 +++++++++++++
 4 files changed, 118 insertions(+)
 create mode 100644 sound/soc/amd/acp-config.c
 create mode 100644 sound/soc/amd/mach-config.h

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 2c6af3f8f296..092966ff5ea7 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -96,4 +96,10 @@ config SND_SOC_AMD_YC_MACH
 	  Say m if you have such a device.
 	  If unsure select "N".
 
+config SND_AMD_ACP_CONFIG
+	tristate "AMD ACP configuration selection"
+	help
+	 This option adds an auto detection to determine which ACP
+	 driver modules to use
+
 source "sound/soc/amd/acp/Kconfig"
diff --git a/sound/soc/amd/Makefile b/sound/soc/amd/Makefile
index f1d42bbda709..4b1f77930a4a 100644
--- a/sound/soc/amd/Makefile
+++ b/sound/soc/amd/Makefile
@@ -3,6 +3,7 @@ acp_audio_dma-objs := acp-pcm-dma.o
 snd-soc-acp-da7219mx98357-mach-objs := acp-da7219-max98357a.o
 snd-soc-acp-rt5645-mach-objs := acp-rt5645.o
 snd-soc-acp-rt5682-mach-objs := acp3x-rt5682-max9836.o
+snd-acp-config-objs := acp-config.o
 
 obj-$(CONFIG_SND_SOC_AMD_ACP) += acp_audio_dma.o
 obj-$(CONFIG_SND_SOC_AMD_CZ_DA7219MX98357_MACH) += snd-soc-acp-da7219mx98357-mach.o
@@ -13,3 +14,4 @@ obj-$(CONFIG_SND_SOC_AMD_RENOIR) += renoir/
 obj-$(CONFIG_SND_SOC_AMD_ACP5x) += vangogh/
 obj-$(CONFIG_SND_SOC_AMD_ACP6x) += yc/
 obj-$(CONFIG_SND_SOC_AMD_ACP_COMMON) += acp/
+obj-$(CONFIG_SND_AMD_ACP_CONFIG) += snd-acp-config.o
diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
new file mode 100644
index 000000000000..c9abbb46b6f5
--- /dev/null
+++ b/sound/soc/amd/acp-config.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license. When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2021 Advanced Micro Devices, Inc.
+//
+// Authors: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
+//
+
+/* ACP machine configuration module */
+
+#include <linux/acpi.h>
+#include <linux/bits.h>
+#include <linux/dmi.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+
+#include "../sof/amd/acp.h"
+#include "mach-config.h"
+
+static int acp_quirk_data;
+
+static const struct config_entry config_table[] = {
+	{
+		.flags = FLAG_AMD_SOF,
+		.device = ACP_PCI_DEV_ID,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "AMD"),
+					DMI_MATCH(DMI_PRODUCT_NAME, "Majolica-CZN"),
+				},
+			},
+			{}
+		},
+	},
+};
+
+int snd_amd_acp_find_config(struct pci_dev *pci)
+{
+	const struct config_entry *table = config_table;
+	u16 device = pci->device;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(config_table); i++, table++) {
+		if (table->device != device)
+			continue;
+		if (table->dmi_table && !dmi_check_system(table->dmi_table))
+			continue;
+		acp_quirk_data = table->flags;
+		return table->flags;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(snd_amd_acp_find_config);
+
+struct snd_soc_acpi_mach snd_soc_acpi_amd_sof_machines[] = {
+	{
+		.id = "AMDI1019",
+		.drv_name = "renoir-dsp",
+		.pdata = (void *)&acp_quirk_data,
+		.fw_filename = "sof-rn.ri",
+		.sof_tplg_filename = "sof-acp.tplg",
+	},
+	{},
+};
+EXPORT_SYMBOL(snd_soc_acpi_amd_sof_machines);
+
+struct snd_soc_acpi_mach snd_soc_acpi_amd_acp_machines[] = {
+	{
+		.id = "AMDI1019",
+		.drv_name = "renoir-acp",
+		.pdata = (void *)&acp_quirk_data,
+	},
+	{},
+};
+EXPORT_SYMBOL(snd_soc_acpi_amd_acp_machines);
+
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/amd/mach-config.h b/sound/soc/amd/mach-config.h
new file mode 100644
index 000000000000..608f1e199775
--- /dev/null
+++ b/sound/soc/amd/mach-config.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license. When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2021 Advanced Micro Devices, Inc. All rights reserved.
+ *
+ * Author: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
+ */
+#ifndef __AMD_MACH_CONFIG_H
+#define __AMD_MACH_CONFIG_H
+
+#include <sound/soc-acpi.h>
+
+#define FLAG_AMD_SOF			BIT(1)
+#define FLAG_AMD_SOF_ONLY_DMIC		BIT(2)
+
+#define ACP_PCI_DEV_ID			0x15E2
+
+extern struct snd_soc_acpi_mach snd_soc_acpi_amd_sof_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp_machines[];
+
+struct config_entry {
+	u32 flags;
+	u16 device;
+	const struct dmi_system_id *dmi_table;
+};
+
+#endif
-- 
2.27.0

