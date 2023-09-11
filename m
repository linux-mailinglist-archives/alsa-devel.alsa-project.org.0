Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F4579B15A
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:52:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE997DF3;
	Tue, 12 Sep 2023 01:51:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE997DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476361;
	bh=r6Sp8jlTAybJjpnMBBT37Ee0sd6FcntUAvNum5qII9c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pz7F1YxDdobqbfJIkXpWBvVFpAxf+dL3oJTATMCc9pH6Q1/HSE9XWIJ/jqp0MDT2t
	 DZSsFVeU+hmqTwnC2G6QgX6OtEwJUYoLWPRf3vyxzdAGasKNBiO7lBVNbXcWyLDKwl
	 z8rf5CjpLsrdLKjUh9KoRLcyRQQ/E2DFbc0qFETA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39094F805D3; Tue, 12 Sep 2023 01:49:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A039DF80570;
	Tue, 12 Sep 2023 01:49:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6DADF805AD; Tue, 12 Sep 2023 01:49:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20729.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::729])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DCFAF80588
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:49:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DCFAF80588
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Iw83yTeG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5b6ImhD+asWyFSYcwdVXk7vFsKzpMGFXMDuhVuNlDmzPFVm8xrpgpyla/Z9YpgeCC8cWx9n3HYE88Pm6pV4DTjPbu8LdEcNOs2+Rd5zMOzFVHeMpfaaNfNdmYoEgJY1Qqo3ihK9ucHdeHPb6YGkWm8/FhBqRD5CFQ0DXf2HMTjby/ks1QRxxruzXXeEuJAfvHxqirERHA16vvnDEe1tFBjL8PNyT7wI8moRlh1tKiJ8cb+yPrhu3nESQ8ZN1lbhDHQHmYVVHMl2hjn1YyUcEjv3TIQAlOdBcMqHBrtlroVFZ166gZkaADt3fNg421uDjxh27P4mUD6UhmBXe0wCOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxfjofD10fuP3QidZAIUA5e7RmT93s5CeQs91uxSgzs=;
 b=YGl3knx2Q/fry3hTcY9spQXMTZ6coLBONSoAoBmCPRTMffyfzym4EhQZuOx2WohZ2vb1Tq2SBAU8VI2dhEC/bSIfqD5L/GgKwKDLay2FH+zeT3grbdtMd5/SOZEQHTuKBYegH176bCizWbIXjwoHSxNkaBuV0eRnFTNXMWEf459oiAZEwCwxmP74M53De9MQkdLGIrjVJjPCgc3rC3210nqJ+9Agbc6wiRjf0xX8Qf1gkTAL/WmS6aOj/WRQ23ILtv28o7WtdbY27VEq1Suj0RUByUoK9r2vEW+6LHL7hnwyXIZCXDXE/X6VAMNpS/dbK4okgGP8DRjodTw0Z14cEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxfjofD10fuP3QidZAIUA5e7RmT93s5CeQs91uxSgzs=;
 b=Iw83yTeGgTOtQBottpOzvXZtEGZMvfM0HYhxojmrp3vWifAmVNvnUnTzGaQpsThNYXiyp0KGozyU3ApqK704OAjHBTXYDOc43cn6H9GN8DfRuY6G/0vWGtkI72qoTidgznwBRv1KHmwxXU7tGwIDf4qypVwSA0r4daWVhbnkJBM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSRPR01MB11567.jpnprd01.prod.outlook.com (2603:1096:604:22d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 23:49:02 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:49:02 +0000
Message-ID: <87r0n4qniq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 18/54] ASoC: atmel: convert not to use asoc_xxx()
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:49:01 +0000
X-ClientProxiedBy: TYCPR01CA0145.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSRPR01MB11567:EE_
X-MS-Office365-Filtering-Correlation-Id: ba32bd0e-e64d-423c-318a-08dbb321ad0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zhNNXboZYE25w4qhjeJIbdxkFw9UlOT8BHUJ9XsJsj599G4KYUVW4PEsfSdjAK57IY9235ExSzBB9B3dv9mY2Z0u8nguYV9NtjvYcDHjP5IffKcJBpolPeVcn7GMS2rx1Asgqkr0xDCJF5BgsvGODTOabi3yNomkZMTQyKASZMOQ83vGqTJeslv4LHPACxRc/xUKf6KWtN+PGJW8RmFgYQEk8zcQFXFcvn9CoqIEBcD03+1e65ZQUm3amdpVkNhm4w6LoOfUPtLbQUj2V31tLRiyYvx3BP8cSb5KfIpcky6N+B/LG5DCrrllyJtqITG3mzeJxiRJpHufwkiq6RMWo+yzjHG765gtlif3wqFOkVriFcNhqiMOCo2E6uxP5M2+sUyjZVOd1evr8JZjZFJ37Zxvbcg/SJZfUz0ru7IhJ6yfiGEQ4EpqOqLepzJayhXS7X2qS42BJIIyjnjPXukoYhh8hljFE2phgEKIhKAx1UQZeGF1qGk9pAwOdoQUHb99gnCtcNmT1pyYn6BGyukHNEDVQ2vajfSoaSPt8Ab6A0UZ6Y1FyGyGTdyjToR4U0N+5a5XIi9KoVZCWoQOURfKSUctBswfW+/vAk7vaqMMuzdYxr06ltrodLuBzT2k7fQ0CaTqfjyoT+kodqSnE3ITiA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(376002)(136003)(186009)(1800799009)(451199024)(6506007)(52116002)(6486002)(6512007)(478600001)(83380400001)(2616005)(26005)(2906002)(66556008)(66946007)(66476007)(41300700001)(110136005)(5660300002)(8676002)(4326008)(8936002)(86362001)(36756003)(38100700002)(38350700002)(316002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eItmzjLBfiQvtqGY+a1RpeKzbIpLtBXls6wtygEuUYLmb6pfaywpLpOSMqof?=
 =?us-ascii?Q?EpeUCWqCTbD3Ss/ebKhtzlzFeTP9swku/E8w22cIouExoa74x6U4GmqSB/Pi?=
 =?us-ascii?Q?WbRU+h2UhC74vNI5jv6sCcn1twPCOc/UujxA7jSvNpIKQe5tlVLWKsb0JCn3?=
 =?us-ascii?Q?JGi++MRWSvph0GxHOz0/mZzrMZhUNUogm82YzYhgjvc44SPWJlPeiSyCOwQF?=
 =?us-ascii?Q?dOXnWAcz1aJq2/qs5vk8fgrHj4/3MJgx74gBB8C9zMfWCMbfO4tQpxAW6v1t?=
 =?us-ascii?Q?V9dlt91OoEJnfM/W2pev/va+E2FvMNww7C0MO+m/YbHx6wU0aTJ44Qiwwgf4?=
 =?us-ascii?Q?CccYA9JsDSI3ik0HD9iLK5xSn981Fc+PrE1gnlJxEgKzpdvzDxOqx8G7HT0w?=
 =?us-ascii?Q?z6F9ArJF9sGU4iutNZZmYsXtrN7foZyZJfOYtFPPWo/kIbfv1/RhY3VOMCRn?=
 =?us-ascii?Q?7xSuZIX2WfhbxHNBafpYqpUtdw7256xaALsjEOhrBMbNbG9ZkMQaXmFxgqUv?=
 =?us-ascii?Q?HPCi1putcIkCH3AiiZpmL9CrSRgn6rxBp86hP2UOc4BqdjnQO5j3bE626r6J?=
 =?us-ascii?Q?gd+WIUNFqpnFNitbchbuG0Hcl92JlThE0tPkwtBcwZrWfNBPum7JF8MMNTNV?=
 =?us-ascii?Q?5BADMB5E6rUKOZ2zA89RrEWJWCnfnVAlo+UMobSqh+VLJOoQg5XTodbN7UQ8?=
 =?us-ascii?Q?osiAKK+HPRj9kHzbbYBNCmvsG3SlQi+wHLHFVM6/owNYCMS/ThJsdNGsWz56?=
 =?us-ascii?Q?85oFbsFMHu59FWyd+LTBqJfmgnFVLq1GXnKEHqUTXdg3ymVwF0JJ1lmPD4am?=
 =?us-ascii?Q?TgM9Un43jGnGAP0tECOs8X6BtN39UMljJKpu4goh4AvZOoGRr87vIhpzVVlG?=
 =?us-ascii?Q?6ZH9thsEIezEHZegk2XuEopKaJIp/6XX6DH16GVcTnr7SGK+ykTUPdaPjQBt?=
 =?us-ascii?Q?hk1DtQt/brcHZHsU5UZutPkCZk/u1bklSQ6wJMCMj11Vb0Sp0QVj7rb+iWXX?=
 =?us-ascii?Q?A7ImQMHZ9EkqaVnNgRxOeLZ55OobOWmHK3cJGvD+fXkrmgpa2Qhq4vWREy37?=
 =?us-ascii?Q?1CJ6UvwKl4hUIp0+hwzRuN1TDsoqvW2iuHhwCyNRs/0vfEsA86MbARE7+2Gw?=
 =?us-ascii?Q?KEaDRBQiYJ6FvjRg6ywdzzxognT9xgJqnTRdhMeHL9lkActFQVYI/apKbyUu?=
 =?us-ascii?Q?cDV5vtnWItgDyxwWML1JYDxsueqVf/QKZe1oGBN2BJ1YPp00/d8DJB/PARTV?=
 =?us-ascii?Q?I/6ecwHpcCxkpzIfAjEbNdIMq2JZp6Q32uAWBXBJl2E0g/6dq2TtxLbVmkW+?=
 =?us-ascii?Q?DlhvY8L6OawqOM7ljzCK8aEb5my122V5CCk5HZe6EaTlxNkFNK8SjYXknyy1?=
 =?us-ascii?Q?ctxCgCio7HV4cUGnhxfa0O2kTd6ivSobgn759J1EcNi2uuSc/4c35jfC+2wM?=
 =?us-ascii?Q?cg6YEY7wX1hxj4X/iJtEnTokGb5cUJl4OFi2dVDga2OEH/7Wefi16TtUbEMu?=
 =?us-ascii?Q?MYGgjWPWf52y+z8HI5AuQgsCzNDj2j5g389NJt6TTJcZdZTLVceCWyntHSH0?=
 =?us-ascii?Q?y9kA6zyvX+KWBClxdu4AG7fPbDuztRgoDoHrPf/kzmn2VnseGEQjBJs4qM1A?=
 =?us-ascii?Q?WkA5A/KkZxVtM5E8vmxRa8Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ba32bd0e-e64d-423c-318a-08dbb321ad0f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:49:02.3062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PflgPTUczvLIem23tx7mPypvUdgUARQrOcmHs4fYtyQVPUYZGyuT9VU1hHqbyEBajvulbHnAz9jkIanHuA4s1yiwPZEca+z5sv8ZGSpy7uoWGJQuGZUZCASE5QBoVHF4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11567
Message-ID-Hash: QFR7GCBQHP27TIGEEUJ2YD3MEHY2KNMV
X-Message-ID-Hash: QFR7GCBQHP27TIGEEUJ2YD3MEHY2KNMV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QFR7GCBQHP27TIGEEUJ2YD3MEHY2KNMV/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/atmel/atmel-classd.c   | 10 +++++-----
 sound/soc/atmel/atmel-pcm-dma.c  |  8 ++++----
 sound/soc/atmel/atmel-pcm-pdc.c  |  4 ++--
 sound/soc/atmel/atmel-pdmic.c    | 12 ++++++------
 sound/soc/atmel/atmel_wm8904.c   |  4 ++--
 sound/soc/atmel/mikroe-proto.c   |  2 +-
 sound/soc/atmel/sam9g20_wm8731.c |  2 +-
 sound/soc/atmel/sam9x5_wm8731.c  |  2 +-
 8 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
index 4c1985711218d..6aed1ee443b44 100644
--- a/sound/soc/atmel/atmel-classd.c
+++ b/sound/soc/atmel/atmel-classd.c
@@ -118,7 +118,7 @@ static const struct snd_pcm_hardware atmel_classd_hw = {
 static int atmel_classd_cpu_dai_startup(struct snd_pcm_substream *substream,
 					struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct atmel_classd *dd = snd_soc_card_get_drvdata(rtd->card);
 	int err;
 
@@ -141,7 +141,7 @@ atmel_classd_platform_configure_dma(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params,
 	struct dma_slave_config *slave_config)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct atmel_classd *dd = snd_soc_card_get_drvdata(rtd->card);
 
 	if (params_physical_width(params) != 16) {
@@ -338,7 +338,7 @@ atmel_classd_cpu_dai_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params,
 			       struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct atmel_classd *dd = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_component *component = cpu_dai->component;
 	int fs;
@@ -381,7 +381,7 @@ static void
 atmel_classd_cpu_dai_shutdown(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct atmel_classd *dd = snd_soc_card_get_drvdata(rtd->card);
 
 	clk_disable_unprepare(dd->gclk);
@@ -478,7 +478,7 @@ static int atmel_classd_asoc_card_init(struct device *dev,
 		return -ENOMEM;
 
 	dai_link->cpus		= comp;
-	dai_link->codecs	= &asoc_dummy_dlc;
+	dai_link->codecs	= &snd_soc_dummy_dlc;
 
 	dai_link->num_cpus	= 1;
 	dai_link->num_codecs	= 1;
diff --git a/sound/soc/atmel/atmel-pcm-dma.c b/sound/soc/atmel/atmel-pcm-dma.c
index 96a8c7dba98ff..7306e04da513b 100644
--- a/sound/soc/atmel/atmel-pcm-dma.c
+++ b/sound/soc/atmel/atmel-pcm-dma.c
@@ -52,10 +52,10 @@ static const struct snd_pcm_hardware atmel_pcm_dma_hardware = {
 static void atmel_pcm_dma_irq(u32 ssc_sr,
 	struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct atmel_pcm_dma_params *prtd;
 
-	prtd = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	prtd = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 
 	if (ssc_sr & prtd->mask->ssc_error) {
 		if (snd_pcm_running(substream))
@@ -77,12 +77,12 @@ static void atmel_pcm_dma_irq(u32 ssc_sr,
 static int atmel_pcm_configure_dma(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params, struct dma_slave_config *slave_config)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct atmel_pcm_dma_params *prtd;
 	struct ssc_device *ssc;
 	int ret;
 
-	prtd = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	prtd = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 	ssc = prtd->ssc;
 
 	ret = snd_hwparams_to_dma_slave_config(substream, params, slave_config);
diff --git a/sound/soc/atmel/atmel-pcm-pdc.c b/sound/soc/atmel/atmel-pcm-pdc.c
index 3e7ea2021b46b..7db8df85c54f3 100644
--- a/sound/soc/atmel/atmel-pcm-pdc.c
+++ b/sound/soc/atmel/atmel-pcm-pdc.c
@@ -140,12 +140,12 @@ static int atmel_pcm_hw_params(struct snd_soc_component *component,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct atmel_runtime_data *prtd = runtime->private_data;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	/* this may get called several times by oss emulation
 	 * with different params */
 
-	prtd->params = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	prtd->params = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 	prtd->params->dma_intr_handler = atmel_pcm_dma_irq;
 
 	prtd->dma_buffer = runtime->dma_addr;
diff --git a/sound/soc/atmel/atmel-pdmic.c b/sound/soc/atmel/atmel-pdmic.c
index 0db7815d230c3..fa29dd8ef2089 100644
--- a/sound/soc/atmel/atmel-pdmic.c
+++ b/sound/soc/atmel/atmel-pdmic.c
@@ -104,7 +104,7 @@ static struct atmel_pdmic_pdata *atmel_pdmic_dt_init(struct device *dev)
 static int atmel_pdmic_cpu_dai_startup(struct snd_pcm_substream *substream,
 					struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct atmel_pdmic *dd = snd_soc_card_get_drvdata(rtd->card);
 	int ret;
 
@@ -132,7 +132,7 @@ static int atmel_pdmic_cpu_dai_startup(struct snd_pcm_substream *substream,
 static void atmel_pdmic_cpu_dai_shutdown(struct snd_pcm_substream *substream,
 					struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct atmel_pdmic *dd = snd_soc_card_get_drvdata(rtd->card);
 
 	/* Disable the overrun error interrupt */
@@ -145,7 +145,7 @@ static void atmel_pdmic_cpu_dai_shutdown(struct snd_pcm_substream *substream,
 static int atmel_pdmic_cpu_dai_prepare(struct snd_pcm_substream *substream,
 					struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct atmel_pdmic *dd = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_component *component = cpu_dai->component;
 	u32 val;
@@ -191,7 +191,7 @@ atmel_pdmic_platform_configure_dma(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct dma_slave_config *slave_config)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct atmel_pdmic *dd = snd_soc_card_get_drvdata(rtd->card);
 	int ret;
 
@@ -356,7 +356,7 @@ atmel_pdmic_cpu_dai_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_pcm_hw_params *params,
 			      struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct atmel_pdmic *dd = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_component *component = cpu_dai->component;
 	unsigned int rate_min = substream->runtime->hw.rate_min;
@@ -501,7 +501,7 @@ static int atmel_pdmic_asoc_card_init(struct device *dev,
 		return -ENOMEM;
 
 	dai_link->cpus		= comp;
-	dai_link->codecs	= &asoc_dummy_dlc;
+	dai_link->codecs	= &snd_soc_dummy_dlc;
 
 	dai_link->num_cpus	= 1;
 	dai_link->num_codecs	= 1;
diff --git a/sound/soc/atmel/atmel_wm8904.c b/sound/soc/atmel/atmel_wm8904.c
index 00e98136bec25..01e944fa11483 100644
--- a/sound/soc/atmel/atmel_wm8904.c
+++ b/sound/soc/atmel/atmel_wm8904.c
@@ -26,8 +26,8 @@ static const struct snd_soc_dapm_widget atmel_asoc_wm8904_dapm_widgets[] = {
 static int atmel_asoc_wm8904_hw_params(struct snd_pcm_substream *substream,
 		struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_pll(codec_dai, WM8904_FLL_MCLK, WM8904_FLL_MCLK,
diff --git a/sound/soc/atmel/mikroe-proto.c b/sound/soc/atmel/mikroe-proto.c
index 30c87c2c1b0bd..18a8760443ae6 100644
--- a/sound/soc/atmel/mikroe-proto.c
+++ b/sound/soc/atmel/mikroe-proto.c
@@ -21,7 +21,7 @@
 static int snd_proto_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	/* Set proto sysclk */
 	int ret = snd_soc_dai_set_sysclk(codec_dai, WM8731_SYSCLK_XTAL,
diff --git a/sound/soc/atmel/sam9g20_wm8731.c b/sound/soc/atmel/sam9g20_wm8731.c
index 0405e9e49140e..d3ec9826d505f 100644
--- a/sound/soc/atmel/sam9g20_wm8731.c
+++ b/sound/soc/atmel/sam9g20_wm8731.c
@@ -66,7 +66,7 @@ static const struct snd_soc_dapm_route intercon[] = {
  */
 static int at91sam9g20ek_wm8731_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct device *dev = rtd->dev;
 	int ret;
 
diff --git a/sound/soc/atmel/sam9x5_wm8731.c b/sound/soc/atmel/sam9x5_wm8731.c
index cd1d59a90e021..d1c1f370a9cd5 100644
--- a/sound/soc/atmel/sam9x5_wm8731.c
+++ b/sound/soc/atmel/sam9x5_wm8731.c
@@ -40,7 +40,7 @@ struct sam9x5_drvdata {
  */
 static int sam9x5_wm8731_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct device *dev = rtd->dev;
 	int ret;
 
-- 
2.25.1

