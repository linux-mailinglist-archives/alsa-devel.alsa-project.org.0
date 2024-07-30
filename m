Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7827E940412
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 04:05:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E439884C;
	Tue, 30 Jul 2024 04:05:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E439884C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722305149;
	bh=Uz0BLhD2GyMCwhQZtJ4aImlmOkDbIwa1uZX8ZrpvG6o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H7N7bMNQJ8yM5SbvSOhESYo9gxmOjhJLLCSek5VfJuBJOBQErCrsO0JjPwLHrlfg2
	 oPXoVjhWQoaPFKHbDiuM24JdQbnz9KKCLnDDtiJthbWsKb6GSfnZyIlHea/mQybG0D
	 Nl8QTg0eHjeHRnBILtSo+RHhZchYffHuDNgkB7to=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEAEAF805C7; Tue, 30 Jul 2024 04:05:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45734F805C1;
	Tue, 30 Jul 2024 04:05:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8DA1F80579; Tue, 30 Jul 2024 04:05:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB31DF805BA
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 04:05:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB31DF805BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=YZ7JOFXl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V6vW339l39k3T/SDAPEzNXmMDugaPN5SOEKcLt56MbNDZiSfHH2GO2QvHPOcLVjCwt6WUiDNzkqhj9QIFSoPF9IrUw8TAFW1gytZnH+g0acEecsHthRxsMbdusCb4tA2k28TiX++KeL3WLMzD4aFLIZfzJbZRMUO8F2ZW6wznww+mnqiaz6+mmGou/KjYakuw8PNiYjq1/OqhyL3+OOscYfpvehxm/nIHBMdLfmsnKgdLxUEV87d/LjBvzVwxwOxOmMY0LDRh4MfRxvHJmrLA82dfgYdDE9As57PyXb6VXC9BxfbqLzJRg/fjDHxBbewPmrx5aqUVHTpwSmgKcqmpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzdjireUc113LOsDnALOYOgQGRy78zRnNIDTrvhvIzQ=;
 b=Kc4SGhN0MDsvbqCV0nEfFGYN9UHc8o0z4La+nXftsGosZmjLZI1Q6yxn7A/IuQwQI++tggZvT2Bq4tDnXzZZtK3gmfl+WyiFozrI6ocVwO7dAf0bPUuMGtSbIzxtlFbVZgOmxFXfpifwF4gSUYiZ2TraYLpHcdySRMlw4nfsx8uQ4qL9jViMCkS8pDWP2g+aLZD1ty/Wxz/CUltUrG1UlosPHAeox1QDzV9qH3jSWrSmz24FsEHnj06ScJRCDu+znqrhv7zIgODOcvBvscdj/bBbMb2zJ5IAI6N5xT5W3Fanz0/NL3SbslNEpJHfMMi5YZQQhYPRZoPL5IBLixpzRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BzdjireUc113LOsDnALOYOgQGRy78zRnNIDTrvhvIzQ=;
 b=YZ7JOFXlay1p9shbmbanYFKwvYgYOUD61LR27ethu6AfbtpjxDTJSfmNNQrFlepwkZL3kcaxsSqTJYr/AsJTDS5hF1fhB3j6MCHHNlkn8Sbrf56jz1zgWg9pne5KpcpyT2vxzDMPniuaX9iak/uREquXxtvWwA/EfMR66+PXEOc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9786.jpnprd01.prod.outlook.com
 (2603:1096:604:1ec::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 02:05:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 02:05:01 +0000
Message-ID: <87v80nk52q.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 01/12] ALSA: pci: pcxhr: use snd_pcm_direction_name()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
References: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 02:05:01 +0000
X-ClientProxiedBy: TYCP286CA0351.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9786:EE_
X-MS-Office365-Filtering-Correlation-Id: 60213ea7-34ed-41f6-bd91-08dcb03c0595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VmEKtiz86idefbiANLg1LviCmf1KQLnllVuEteepTBXVIMbL+cp+zWGbEe4h?=
 =?us-ascii?Q?S9q8rn9JUhVdXqRSqjjNoD4S+/saB2Q4dILkX5e6hpqtkgobkEFPKTuxsL+c?=
 =?us-ascii?Q?YXzbZLV3qQRIzCUo4B8a+vhozc2v3+Y5WClmQ4y77tKHTRma2/O3otkKPT9D?=
 =?us-ascii?Q?M29ja3p2lz8bDXlMbl7p3JMmuliCL1L0FqOiJr8V2pnLoO3BK1bfN2x6sm2R?=
 =?us-ascii?Q?T7R5YvTtMwjKbHxaz5rOqWzzz74/QrUzIuIFBa5QZfi1BzoxOvRG858sac9e?=
 =?us-ascii?Q?UhMfCDVsFdPK7UfKtqSAahm8Qh+IYyInDwUg8Bat29QPGvRcGRw0D0yOdYmS?=
 =?us-ascii?Q?pHpv559CNjXhL52tA1XLSiWQ5NC+2FxMN25ufz5v6KulCitvn2wDCCHOoz6n?=
 =?us-ascii?Q?sFKuWCutxGtFYF0WtOpRgFqUY1FDB5HLypOynYwN1MGR2xsS0PP3a615A5BW?=
 =?us-ascii?Q?j4C3TO6/DK8E6aITgJTlaWpWeBJmDz6QsE1ZRkanHtb422rb6bJ15Md01h1x?=
 =?us-ascii?Q?oFOw4lTzfgMriKvbDM5rTmxNzYrDqiGZuSkt97ewcu+DIv7BAMJWVcy47HvG?=
 =?us-ascii?Q?CuvVk543sMeEnS54AGhSMkLKeniUGMLselu8fC/hTo703L7f0f9Fhn04wnSq?=
 =?us-ascii?Q?IAW2NB6YOv39bZ9eMEr8uPz5KjLaL2WYwD+q0MRdhBSfg3nwIsIClNVnNH+b?=
 =?us-ascii?Q?Aax2WRdz9rj723gczWeE5BJySq+6z9YSqcUAjz21CBKB3dLrjs2RAFxvTDat?=
 =?us-ascii?Q?g2bGo6EZtK/1A3anebX81j31fA0u9+Tz7y/hcxPTVOCOGsM74uxWSTo4LPZ1?=
 =?us-ascii?Q?C12tIrAbPZFIm2iSEbr0VYNme7ZOLKTbCBe06IdANC1qP0SQRzU0wChn6xQG?=
 =?us-ascii?Q?xABcGkU58AmpLBiiSMlOFAZ2yjBRBmRB9VE+wMHeRZk65BcGnxHgEU8mAE46?=
 =?us-ascii?Q?ZDhFrxum+PVPS4DQJT/Fl2gOwTQdl9Pm2oiCvXLc0+4N/AdSGg0PInrmyP87?=
 =?us-ascii?Q?MfhCsWCEmPjp7QF5xCanQSreIRYBBb20T6jprda6z+ok2PWI8g/laasIhOyh?=
 =?us-ascii?Q?79wiyGvhKvYZe6QfSTVMFN3jR2ougDcSkf9ct1MEQjb1jflw5qLRNExMCRh3?=
 =?us-ascii?Q?R67LeruHNa5VehERcnrZMTLJKClYMKtGZiEKBpgpcBR9fOkUND0/qcG2t8up?=
 =?us-ascii?Q?ZXEwodbK7C+wkQffINjJHNaxuvqlX8mWTcV8XNLprCsAw8v3yTW2OokY7R4l?=
 =?us-ascii?Q?exQHfcrB+0/24jRKBM3DB1zN2l4DTh4CST9r3p9q2eDhvxmWMIyvsvASTn4p?=
 =?us-ascii?Q?SP2Ag6Nw/DdrPsHzw0mOIDphJvHCGrL4VtGF1/USonqu6Ehw4eCjf83bo2NT?=
 =?us-ascii?Q?/jjT5eAJkHVIPhF3/q845VJjY5qbxruX2hqVgRHH0ghMCLOGYg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rxXCVvxdlmNvR/OnoKRo5HMvd6fasa3qWDe7OE6FJCirGUyopt5/OjPO1Aaq?=
 =?us-ascii?Q?jE6JoU+EljuJRt/Uqy/t2WA7gR2nC0a8iwvH4MZCh1sPMZb7MsG0Mb8Zxhlo?=
 =?us-ascii?Q?lG8xtn/AuR+bceyOzImqozoXU49n9ugWwle0eu+h6MWeY6smPDfg4KSdy3R6?=
 =?us-ascii?Q?ZU2at455pM90mOgdnlwliLSmYT7l7uRs/nK81MjpWhhuUVuYX38fS/vB6mxl?=
 =?us-ascii?Q?g5/poV4zPD8i9/KufKJK+2/vMrI1MUaBa1d+KrorLetd9QuM3O5s8gxMmHR3?=
 =?us-ascii?Q?KKKFhgvftxTVX3Mef+4CzfNysGDqEhxxHOhMeYU2p0+6ExOIrr4IKe2kIHSS?=
 =?us-ascii?Q?A01s76GHIL1nmwL9gUc7xjpCe9ffkJuIbw7bHFKK1uSo/J+Ppey7+S2GCcuK?=
 =?us-ascii?Q?B22xeHjw6v/u69D31hlUzqKV4cvFp1NYaucgQg31iXA10VmzUy+fC5F3Gdnh?=
 =?us-ascii?Q?cLCDDdcJzGS6PV00RJUyTZvFNu6yMa/o53zd4s1Efgt+8X9IhckG63f36TZS?=
 =?us-ascii?Q?anF9TBDlMLRwS8iBhMTRlcl0J2XTmmMsyldm77N0zk746PUpr/oSL2BJLDrq?=
 =?us-ascii?Q?Zy5cjquug3T5+yYRXGLF4lLkvuI0BnZ7GwMKN3C5Arh49qJKnYj050hsW2ee?=
 =?us-ascii?Q?c0lBxO8DeO/Vro72mBn+HTJAvZ8hhU63RRv3mKWFPhBtum95LWN2kxgxJPeh?=
 =?us-ascii?Q?JBKBAZNcF2wzYgLiDBxdM7qjgtzCFLeuR7UoCzN7UBzQJSfW11jSClw+u3U4?=
 =?us-ascii?Q?mpFy6XJUck/tprHMVWfkjVBKq0Rxq/SpexfOwsjTyAVZiv07Oqbaw9x8eSa9?=
 =?us-ascii?Q?43Iw4JmqZDJbfVY9FJXFPFcq3FpRiBhTte7JHKO8tVGdupvnqsuIHZvZ8Vsl?=
 =?us-ascii?Q?0OK7kDK6/Xk1HaGuJJIq+dgjBBv9JHBFGLDpsfu9X+XYiC5Ircj7q3jGlamv?=
 =?us-ascii?Q?HcAteMRJOPJalbcCE4i6eaCKv2+7vUzJO935uKDVCIGucqE6t8IY5p1Ep05G?=
 =?us-ascii?Q?gHbGNo3iZW2xUBcI8xHpjRxDcF7zNhwlSWLNdA8TqUhSVoP9ar/rq6UtDCJO?=
 =?us-ascii?Q?FcT/szGJSe8b/A6ITO2Ue8jPoodBEgVNmBt8LVAqz50xWKIhZ99V1VmKHm2D?=
 =?us-ascii?Q?A5sZTn/eYwvNPNgYldZDawhmOHtB96Xwb5/9twFMqSU1i+rYtrVicmDJq9eY?=
 =?us-ascii?Q?TggdwUmQLQsMNjeePPOXoVOCRAsPhzYRheqhYdMaZ8wqjnOrTu0Kr8iBe+by?=
 =?us-ascii?Q?friIXHWvSZrxhhPtAxhi7TO/WBHDbDG4mJhweKCAXIONNpLt9SlMsta9F7xg?=
 =?us-ascii?Q?gqq8ppWDp3vKR5FxlIqLXu4GOELKwZk7aKkLNbbvU8jZC2W1JnPf+2ye/ydl?=
 =?us-ascii?Q?2iBdkssmd+90+Si/RHIaqBslf8IhV37fvrgYRHVtYWSaU47+enG9q1icA35J?=
 =?us-ascii?Q?g+Na7c/NST+eqzJh9ZyfMPlmnhn5Ksxk2SrCOEexjVaN+h8qzU4GqQsotlDp?=
 =?us-ascii?Q?OY6k6KHA2vldBre5lAuhFFunCcl2dnCrfFL5d5obb71pCdZZnbgxCHLe0uJE?=
 =?us-ascii?Q?8phBkyAOQkpYm4B/tOHtQu6qH9PXS8JVZQPIXPXHY16qrLBQ8MxYcbh+KpYu?=
 =?us-ascii?Q?veX9iMNCIhVPmOKNpMI0NAo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 60213ea7-34ed-41f6-bd91-08dcb03c0595
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 02:05:01.8952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 g7iNxP/db7hY6XNTHR1pTHRfTSSdvZUpOTxI5XuJ3RGicAoDrEqqTRDATxRb9RZhNggBj8jfA0Nn1P2a5dUa3UuJj35WiBQsTV0dPZMujC5aHgT7eh8sU0/UdYm9GCiP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9786
Message-ID-Hash: DGGX2WLIJVILW6TWGMVOYUEOE7XE5BIF
X-Message-ID-Hash: DGGX2WLIJVILW6TWGMVOYUEOE7XE5BIF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DGGX2WLIJVILW6TWGMVOYUEOE7XE5BIF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We already have snd_pcm_direction_name(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/pci/pcxhr/pcxhr_mix22.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/pcxhr/pcxhr_mix22.c b/sound/pci/pcxhr/pcxhr_mix22.c
index f340458fd2e11..e1435afc49074 100644
--- a/sound/pci/pcxhr/pcxhr_mix22.c
+++ b/sound/pci/pcxhr/pcxhr_mix22.c
@@ -535,7 +535,7 @@ int hr222_update_analog_audio_level(struct snd_pcxhr *chip,
 {
 	dev_dbg(chip->card->dev,
 		"hr222_update_analog_audio_level(%s chan=%d)\n",
-		    is_capture ? "capture" : "playback", channel);
+		snd_pcm_direction_name(is_capture), channel);
 	if (is_capture) {
 		int level_l, level_r, level_mic;
 		/* we have to update all levels */
-- 
2.43.0

