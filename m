Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEBD79B0E3
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:50:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C4EADED;
	Tue, 12 Sep 2023 01:49:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C4EADED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476235;
	bh=ngGbqft2F/6DW32LLG6xCqbQe5vFXLGEJYGNmoScU8Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZS4tOsuoM9xobemEI48a4MaK6Ft4iMlL/00qyUFFlzlX7g3RMWh5HGjXCz9oPsWDz
	 U6gJpmV2zX5AfYjI8DX9Pb/xMh0v+fGVLtn7y0KhewMfAkFTL63zjvNTYApGQMAyYH
	 L9NtoRjwdhh/xjD1k5u+XxxqvfdQIA9lA9Vf65IM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7F55F8057F; Tue, 12 Sep 2023 01:48:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45AD1F805D9;
	Tue, 12 Sep 2023 01:48:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBABCF805C5; Tue, 12 Sep 2023 01:48:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20719.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::719])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 079A7F80537
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 079A7F80537
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ektRJAUK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nevUOGnlkRfEghTsGvyhiVlMo3i4OpSaROngjb6c3II3YoI96NABtifg7JS59vn2Zx3/2W75o5rZEUKlxhJUPjYOgnMHIT5/H2zqCGzPtexFq5SEX+qVAJW1Vvp64YRX1ajogjmA5kcdFv/eisd7D25sKH6BJS4nQHogjzSDccS4t46YDM7AcVjHhOQwBkEmN5yABorCWjRzaspm2LK9DNtktO/ZIH9OYU6YEz/uQRmMixTO5bWmksfwZzjse4VpkzwdfGXuIGvqHsPfQLrqSdGCkXd229eddrYjOF/4ffUYB7XDxkGyDMTYYCv3fXU7aFCKy0+nA2Y2zGwVvEu1XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4EMusKxjbQqR3D7XRw/r4v4X+SKzblia1tx4Zgn7hDA=;
 b=dru2nIG9vvUG7izW2A+ZB295BThHv0BrZygXF8JhSyJ9YnS9TISbFZYI2yyj1gVmPyIKSRsAyR3wTrsCkixqrp+uK7+P9b+eOTQedqPeIQtctGN1otiI6LdKjEIEMyfvUZyTx/YKYqJyNpOOhrCCc+gNhE3jO4IFYjbIkne1ly7EMvWqvYfxmx+QAPnRSrgWLD9AWbdpwk2uzBwYDMjBib31zjicIiZ//KD+kHEbloRYUpN1FxDMqQuvU/z9Z9A6pKUGYkk/SV4nO8iDzWcwI5oBPP4Zp/6oK7TcXXDiINZHPCPFENOHJKmsKHqXFgrdySKfG4VePM+odIvvn/bXKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EMusKxjbQqR3D7XRw/r4v4X+SKzblia1tx4Zgn7hDA=;
 b=ektRJAUKr2Ihkix/AfC65xwf6V7qp+9N0QVoTy72/m8WNKBt8ahCulFxq20woIARns+z3okNEFmX131DUOjWK266D978CZzzXo03bg6Tb8sI4eW5qJNPuniLhf2kReyC+n8cwI5NW321Q1TrTh/N8/vcWUloVdtaHDn75jkfmqs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6192.jpnprd01.prod.outlook.com (2603:1096:400:4b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:47:56 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:47:56 +0000
Message-ID: <875y4gs24z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 08/54] ASoC: dwc: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:47:56 +0000
X-ClientProxiedBy: TYCP301CA0032.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: 379f2a05-40c5-4861-4451-08dbb32185ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+UHqoEoox5zFXCnigIYx5V5laANP+rAOxgqU9ATPRjBa8vyRRMXiApIQTI+fwt6AWHUU6bGDApqK1WvZzQrDcAhSaTk0tfNUZrDE+WnNXOb6wQpZvaVWo6+lm8P4Jb9cP/Lq4wxqNOw7xR4bawWOGsZ0sM1QhlNegdhSglkAtXPScKLRU7p9dI42q/7TfC13IKNYVPd8cIfa1P/abZ5fyYK0PO8ThRrzjSVcQVQzpKRt0+iwspqb8ayjYd0XCLfFD96uMe/k+PyWIcp+1OY0q1j71vWCTNkrBAhnWOvCZnOQl7swN2MQEGU1UJhzXt8kHK3rW5i3q894m01RunBAkO6CmPGSMj8Ng6bybkv7QwHHEkHP6vod+W2btPRjEDQ6HENc0oWISDyqndoqu/Ih95vbjtDPcTc5MSEUoKGgd1r0XxjaI9bZXaY4AcrcxTRKzxHdu77vtGaEXBMsvKSBUu113mHPRGFwpYUdH8TxVKaQ/sYsU0cIISA5OTo6vXAjAenAwIxcs955fbxGNZSD8nET0f8X/euR++B3gUhoRkiz+pScYJD0WM1STtt6lb/HamGNjrvnF+mpp0yLXf9HGaF7JNNJp0UU4WpBVKEabLBnXSO7Hd4OuC7j19UTTQAJ4TJ0VkWaTznXjhHToE3prg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39860400002)(1800799009)(186009)(451199024)(6506007)(6486002)(52116002)(6512007)(478600001)(83380400001)(2616005)(26005)(2906002)(66946007)(66476007)(66556008)(4326008)(5660300002)(316002)(110136005)(41300700001)(8936002)(8676002)(86362001)(36756003)(38100700002)(38350700002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7sUKL6z5Q+df2zfzpX45zX0wTZ6q5cNbxBmKrWWOnP0tMpGIVp9WW5cgjG4t?=
 =?us-ascii?Q?csGOi8JCcDZMFEO+/WP29TIRmRpirrSAdSilxyd6eXcJlBhj9h44cuBmpzVS?=
 =?us-ascii?Q?dl9Riylm+wFh3Io1WmeCzcyG5cTpDWo5kZjmOWkstnSolsC1o88ttsMssxaV?=
 =?us-ascii?Q?5fzwUiom10j6NmLKFfUSimwL2rVHEwNpJCDoLWPICzsTIt4tuaownhdtZkYP?=
 =?us-ascii?Q?NslkTiJM6rpW7eAfexUbYwZO1l5gFuQLsXu41aRl5xb+C9KZiwX+oYSa9/vb?=
 =?us-ascii?Q?IEQb/1Q54vc2GoP1Imju/RzELeNCcaTzrcahISkR4iSING8Gjxtep/KEssJU?=
 =?us-ascii?Q?3d7PqxXJPa/Ih0f+3qDYKgpUuCjW79fkLDFxslhDF/E9Ao+X2c3sJQXfutC8?=
 =?us-ascii?Q?2y0z38lTmHBh3WmvbmHbOv4PUqptGv6iW6kKD5YTHPyhK4zxPnUwIFMSdn0K?=
 =?us-ascii?Q?21d+gM+Iiv2Ifrwx7pwlC4AMBQd6Ug8mEvooRuvfOxcIQk3P07bhuCveGOQn?=
 =?us-ascii?Q?tKdL7LJZSDVoNQsJWtX75XI1OaeJDA10oRbNb404y9GVYB9H/FtW+8FEdV+y?=
 =?us-ascii?Q?F3czWuRQsCpjEIZRXnHmBOLEqero7Ep/9VOfaiHCF1LNSlcDyZqj/lguyKRs?=
 =?us-ascii?Q?kd4Tbfhe6/K22R65qHjNB0aIHJ/P1ycbBKPl1HXcrqrKzri37s9xgf9CCFkm?=
 =?us-ascii?Q?P6f5jD8AN8ed3eD7uoDIiRKSwDksOvMMYJyoPmwF5CSJtXqxWYo0hT8b+fBq?=
 =?us-ascii?Q?8paJ+qAm7TZpgkNLJbXxwOgs5hbeo9VaW17tcX5RiejANTme2c8MWlhdoRc5?=
 =?us-ascii?Q?JsYmY7xfXUvgNiMNEzzcwTCJnKxy7/i4FfTPUspkYsKVex+gVBnExEmQZw0h?=
 =?us-ascii?Q?+Ijwe16+wumEgkUguBsF3bYKRjXLp7ykBS4gDhKFKyIHQD4y38aDEQOPKm0i?=
 =?us-ascii?Q?BbsdNEYYfZAi6+478MKQ8Aee/kbzW32LDIno9jJLWk3NSKccTHQlkUAa6saM?=
 =?us-ascii?Q?zJdji18MXPGHmX3NSTabKSJ0aanPgg3YUHRP2SJhoVzSrYgxMfv8w5ej8WhN?=
 =?us-ascii?Q?oBAadowjRhQBvqWYT019v0FtesMOqDEBoda8ly8gO63kuZDxNYeg3mmDe/hJ?=
 =?us-ascii?Q?e7b/+wwImvWwwN+15cd01blkOGDyHbNeHmcumF/Fzofqk8xcj7h9mMuMAnwB?=
 =?us-ascii?Q?y5BedZTtaVQQ/TcWqZFaid9P9WKmuIxV71rT0jgbkTfWvHZcR/Yb7yicd0vi?=
 =?us-ascii?Q?Ve5gWwcKPD0yYpEZYaxCIeGOvEanxqXmugIJzGGBh00H89I2D3aj96IL+SHA?=
 =?us-ascii?Q?OKS5dZSWKottNm0Kd3RFUOGf5BCabo8SxfYEL9AP/cRG0sZT9CCm60zTn5hM?=
 =?us-ascii?Q?OHzZJeolwRKUKGFWbjW8o++vJ50r/SrUlC/NKwRwRi6Hq2eWQl9gcf0zwIFW?=
 =?us-ascii?Q?MsVeN+hVpLpybBaIcq/fnhHeowMw0oG05VS2U4TKB9tZcUMVoEHaPIVIYlUe?=
 =?us-ascii?Q?8ykr1Z7l/+vByh3MHoJbxKgxl9C0LLqtQf0Gfk2Y4Caxo28RtcONT80HIIFW?=
 =?us-ascii?Q?QnYPaVsRaZX+MKRKiQpex9dYVtsUrCNR+H5e6GamBDWKzqnMBVYItmC0tKxh?=
 =?us-ascii?Q?nBZB4Q32ekjTGh9pcHUIF0w=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 379f2a05-40c5-4861-4451-08dbb32185ec
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:47:56.6106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 S48DzHccO2IURNEHceONjMVYoKJwYf8Qmb/vkPTd4E1ANY2uYPHCPPIFRkVFcjwUH9LdwTLF+4P9oSzviycKJpKTslP9OxZxcMVg4a9xLr0IlybOlWLyoopHsAHomSow
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6192
Message-ID-Hash: H47S63G7M7FH2YHGCJEKGHH67YU22YBR
X-Message-ID-Hash: H47S63G7M7FH2YHGCJEKGHH67YU22YBR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H47S63G7M7FH2YHGCJEKGHH67YU22YBR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/dwc/dwc-i2s.c | 2 +-
 sound/soc/dwc/dwc-pcm.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 22c004179214d..2ff619a296554 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -235,7 +235,7 @@ static int dw_i2s_startup(struct snd_pcm_substream *substream,
 	struct dw_i2s_dev *dev = snd_soc_dai_get_drvdata(cpu_dai);
 
 	if (dev->is_jh7110) {
-		struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+		struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 		struct snd_soc_dai_link *dai_link = rtd->dai_link;
 
 		dai_link->trigger_stop = SND_SOC_TRIGGER_ORDER_LDC;
diff --git a/sound/soc/dwc/dwc-pcm.c b/sound/soc/dwc/dwc-pcm.c
index f99262b890082..a418265c030a5 100644
--- a/sound/soc/dwc/dwc-pcm.c
+++ b/sound/soc/dwc/dwc-pcm.c
@@ -139,8 +139,8 @@ static int dw_pcm_open(struct snd_soc_component *component,
 		       struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct dw_i2s_dev *dev = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct dw_i2s_dev *dev = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 
 	snd_soc_set_runtime_hwparams(substream, &dw_pcm_hardware);
 	snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
-- 
2.25.1

