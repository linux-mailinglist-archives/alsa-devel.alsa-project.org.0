Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E28776FBBA4
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 01:54:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50BDF119A;
	Tue,  9 May 2023 01:53:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50BDF119A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683590074;
	bh=m+xZfpMXy+lWn0UWWMJCstJ5QTye3AQY4Mqg76ANEvE=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vpYTtvJl742Zp7oPGGRe9eXk+JEt+LedEOvV3alfpKi4/97i4m6+xbqADtuHWOi6Q
	 iLWBMw1tyU5i6HUi/yt49i1Z8513rGpkmwYaQRRRE/OYXxZ3MvMvRGTeX9dltU19eb
	 uoIMnG4NuAFzDQk6B24X+bpFI+2mBEt7H85lK1dk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE2D9F80589;
	Tue,  9 May 2023 01:52:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80089F8055A; Tue,  9 May 2023 01:52:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14B1EF80553
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 01:52:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14B1EF80553
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=BlfHHoRl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ed3vmxlrHrKeYKqeZUcvU85tzX0I7tZ/HT+raofJooLDDueDdnR03kBIgztq10RKPPK5nAufiPxmsSZYB9Ru4mXgoNp5rOcDiGYlCPKex2cgfMROV6/vkidmDg8pOjZv0nGPoulfzSvV7Zl4qj+7O7k0nvg7yLX/cKBl1Am1CVBAiNzydCRwpV72amVGuFrM1bPN7h1HQPfMb5egAcvUVJfO79667rCaYwH7m8z51jE+lKZUQTHj4jei8rxekpWWhXp1Vq3Tnv4BzrjyTCdmiksZWRr7W6KX/GKQGITbmaWamr39oxqYF5/vGtl2WL1/9Sz+LllntRf/c0KAnp7Y8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHALLKvRqwVUSarTtmkNf+qljxSSEj2bATVBtvjdR2Y=;
 b=VtoOKb7q7eIVz0AoY8DYQRXtnZDy6CdvqtyA7IKn68wyQZXbKd3aHii/6hiYnZ8UCVJXO/BvqLPdPzlB1Kh7Yzbf17dGuSCbexwJ/0Ui/4ciEymPSez0W1KRzPXTKAVz7YJ28RpIV7azzHbM7tHG2bKZQ3Vxhnukidhrm0eL2TPsy4JReu/t3cTGVyca6Qq3bUNGnKyOwZbD7//9Cx6TnLbCeJivvHEj2lOTvTBsuI2ibMA9yhpLVkclVFhZCnNfOd8w4cec0UN/5+Q/qm0dvq8GIeC3PD8WOTMd4C1iTTo2rn9Up1kSrrbmJnKQAPNPwYvpmjg+wJIs+iEvF+hzLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHALLKvRqwVUSarTtmkNf+qljxSSEj2bATVBtvjdR2Y=;
 b=BlfHHoRlnYKhwaZ0UU5DKGAeAAn+VAqhWpxbz/3uNkKphpa+TOvGTd9bG/ER/D6rHZ/EdRyHB/00cG4TP0JzwGtNkcZBl51bTbyl1UC+pottAuARGagVSDruB794pPA2PNwn10fHvrW+M8YP3tY5qQnQQIG5BSq69R0tFHyNZ3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8249.jpnprd01.prod.outlook.com (2603:1096:400:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Mon, 8 May
 2023 23:52:19 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 23:52:18 +0000
Message-ID: <87zg6ejs99.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
Subject: [RESEND][PATCH v2 11/13] ASoC: intel: skylake: use asoc_dummy_dlc
In-Reply-To: <87fs86l6y8.wl-kuninori.morimoto.gx@renesas.com>
References: <87fs86l6y8.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 May 2023 23:52:18 +0000
X-ClientProxiedBy: TYBP286CA0005.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: c8790ecc-768d-4d32-670f-08db501f4231
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7qI1cd/nefSDl+EUreQr7U9TUXswb/dI0/TW7OSyS+GkRRvD1i5ml67Wp45xxJPIuXXQwWjd4PZw/K0jd31PtUb56HhzIcnHeeuAqdpOyXCQOBnQ2CwkPlUG7RmXPKT/cJwmrCXYLwDVfYFA65IFodQwZ7uXDisnckqO6oQ4ippRyaoPlLj2aa9hBgazj+TyKWd0cv9SpQVHQS1Xo6mnUaKUJUe5ua3TRYl0VQcqd/G+Qmzjuo5yDj1uTsrYMdP25ZqybdqYKRP1o7TWNLUxQhEV/zldD3TPIYvw16MtMEFz7EGe7kcGU+yVht96k72fy7DxKq1ED+CrZxtahy0NNuS0oIISeVqPuR7POkVk0QxuV200X0voL3QvoRzqVHgGzB8CjeWrBc57VruzZzgLALZ12RuErvdCLGKWJXJd9ZU6VUWYBc3D9iPXC4DoLd/bPzHdPOJEKSXPIWsCYSBdjRkuUPsQuX7mMaWGnNYg1kih+6FxtwgW4WPYYmYpaj5GPjW6MT2+3NCzqw6gnu3R5869F5sCDNik2o8BxcZXDfHK/KuLcLElZduKPq95zEjyGQRBnQchDJWO84U156eQKE5U1NFieFNDq8qepb5Scy40Bixx3+HtWWlfDl3815Uwa/rPbpHAx+Bq3dzO9X7PoQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199021)(4326008)(110136005)(52116002)(86362001)(316002)(66556008)(66476007)(41300700001)(6486002)(66946007)(8936002)(8676002)(5660300002)(478600001)(7416002)(36756003)(6512007)(26005)(6506007)(38350700002)(2906002)(186003)(921005)(38100700002)(2616005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?h5j4B7ZqzltgYR7OlHdjt8cuTx6lvYWOAlEh2rUxKKfmBrtZFXTOQoeLINnB?=
 =?us-ascii?Q?SoWLtDpiabCZG2fLsIsPMlKpkxVetC/kdJ/BB3jFILdgxYk19RXulr2YHKpS?=
 =?us-ascii?Q?9cZcYsR3R2DBxi7g7hlFDoyZ/iJSz7n8hNrCjoeSX9o4PCz+x3GfGcG3lvJI?=
 =?us-ascii?Q?p3pO71BbxzZT0nyaydkYTouoa+/rVTxEvvcFsRaGLODqaPZ3EopoIAqtDkon?=
 =?us-ascii?Q?yOrdDuWq0SKiL0fnbzwEyiecl5t59FVmHvzsbtkTxMkklMfxXF5og1VIxFBy?=
 =?us-ascii?Q?zGx3A+B3LpyASU6/ZaucV7dXMqT9d2eJ3iSKvlo/iyKEzKYFFModXV0IPYQs?=
 =?us-ascii?Q?QpCJZtXYdWYl4jid48SVpGzsRU0vmA8ytWP2kZ2oZuw6ZlT/9pYlOPZdk0dQ?=
 =?us-ascii?Q?okOUdk0CAACRu1LduR5iuXHcVwJ8N8xQ2qKd+unzfSoBeXOG3BjOJGuIUz1e?=
 =?us-ascii?Q?BEktdNO7Zhi7W45PNcf023y9KKdHM94a0dM+p/Knpz3R1DQdnNL2EwaMoJbI?=
 =?us-ascii?Q?NRRawvJ8ISoPBLHpsjO/tzjXg0yS7TSkpjfPv2OfeeuIfqdwYkx0gXwsP+mC?=
 =?us-ascii?Q?sokv5BTPj7wmEjvNhGr096fFyVIxiNZWopOQE9glj8VZtk6JhKWk+CgeUsPB?=
 =?us-ascii?Q?c4bqRTYff+B3HIDPrpDmft/UF/O4kLQKFQTIHRTfRbUJLgFmB/YuSkTj6sK+?=
 =?us-ascii?Q?nYBtsIbYgORhi8aeUwlcgXgIySNAV8ex3zthOHs8C/YEPKVmvgIG79WMdBHS?=
 =?us-ascii?Q?0yKYUVz+rmm1rekz8vrx0xc+AGeOPHR1F6BX22U1CiMgnAbY3jYrRktcKaFA?=
 =?us-ascii?Q?A1YFEBZVXlqaLCGSMF1RTKpAXsOOpXmL/GVsKDbOoIr3skl/bIuyfiQKMU+2?=
 =?us-ascii?Q?FIa5Cbz/etyyyvGtKAPt5HcMYF/ypVN2vuNxAUNYlci3E/15gf+50A2bvgC6?=
 =?us-ascii?Q?++DsRPVA3C2+umtGlT82N+aYE0271yEw2gyk3oQYbnES9TanUHq/cWjPu1t2?=
 =?us-ascii?Q?M3xqopFl9DqZGOZoe5HmCyDkkOqPOue/BOZetOOmX2USEYwo9NbWzkNf9P/W?=
 =?us-ascii?Q?ffZgJSuCuDMLixwlXX31a/dISV1Qi+0vDDpOeOFzo+nxmzGeix7W4uArsvyT?=
 =?us-ascii?Q?6eeGQV2qqmYC45UsWjT3QicTjazgIDRPxk1mnJUnDp9B29ZPUY9KZ0HOQ3IQ?=
 =?us-ascii?Q?W6zkC/gmYeAK+BqZLFVeDB/FhYqI+H8Hsq1vHPlGpbtFWt8W5tYHfp/sLiQj?=
 =?us-ascii?Q?5xLNLrGxqDpkIlGPIYfaP7HNET08eB4Jl1aj6TJLowduxFkhRV70eGfNmozE?=
 =?us-ascii?Q?eyKFMsdRO/u0e9hHQjwfrkrLKrmrHFAkYuaxCImhSa0VKMfnO/0kvYlYvll8?=
 =?us-ascii?Q?KP8dqwizkIcd30q2Tm/Gpbg9KMrxdzEXw9ginvuXb0ajhuXp31yEXOuNqkOA?=
 =?us-ascii?Q?0jDCu/qMNtmQDS0qKozGdpZoR1a6zrIbOKWEIdzy1Uii+iM7uCqF52wDJH4j?=
 =?us-ascii?Q?r659M+oRQcc7tXyGlnHRwY6mZ4X/cVopoKsddE8UtEMxVKBo617bwDZBZa/a?=
 =?us-ascii?Q?WZDikVFmImWyt39/TeTf+dc9FdG4q1HUDL09GycJjynxId5tzQUa8YVA2ox3?=
 =?us-ascii?Q?/OS0bQMS06rxjhJMBmtxpOI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c8790ecc-768d-4d32-670f-08db501f4231
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 23:52:18.9074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VkgDq2WalRomPEyVDPJIGaZJiS5vptBek+KUGDGiC8JpJaDO7Arcuc6X11W6pqYdr4Qx86w2FgW+RcdgLzbuneXUSge4Em0FQiF0K/RWa72vJI1q4sohZB7HU562McrZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8249
Message-ID-Hash: MBIRGJXPEVVUKYO7ASHRHNHB3QS6MQIH
X-Message-ID-Hash: MBIRGJXPEVVUKYO7ASHRHNHB3QS6MQIH
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MBIRGJXPEVVUKYO7ASHRHNHB3QS6MQIH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now we can share asoc_dummy_dlc. This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 879ebba52832..a06e05154ae1 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -61,9 +61,6 @@ static const struct snd_soc_dapm_route skl_hda_map[] = {
 	{ "Alt Analog CPU Capture", NULL, "Alt Analog Codec Capture" },
 };
 
-SND_SOC_DAILINK_DEF(dummy_codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("snd-soc-dummy", "snd-soc-dummy-dai")));
-
 static int skl_hda_card_late_probe(struct snd_soc_card *card)
 {
 	return skl_hda_hdmi_jack_init(card);
@@ -158,9 +155,8 @@ static int skl_hda_fill_card_info(struct snd_soc_acpi_mach_params *mach_params)
 		card->num_dapm_widgets = ARRAY_SIZE(skl_hda_widgets);
 		if (!ctx->idisp_codec) {
 			for (i = 0; i < IDISP_DAI_COUNT; i++) {
-				skl_hda_be_dai_links[i].codecs = dummy_codec;
-				skl_hda_be_dai_links[i].num_codecs =
-					ARRAY_SIZE(dummy_codec);
+				skl_hda_be_dai_links[i].codecs = &asoc_dummy_dlc;
+				skl_hda_be_dai_links[i].num_codecs = 1;
 			}
 		}
 	}
-- 
2.25.1

