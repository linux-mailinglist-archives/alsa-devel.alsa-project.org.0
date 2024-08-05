Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AEB9472C5
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:03:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D8305558;
	Mon,  5 Aug 2024 02:59:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D8305558
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819574;
	bh=bevcthK2bi6br+bqsVEf0IiiqV/pJajYz7O+qMhTIl8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WKvHuo7UyBojQF+Q3IfIyPIM+lqFA45LM6Ihz7jQJUkUb33u7Y8nGX31PP8NWX45c
	 MEOvzuuXmrFHdkEACS6FP6PRVANvWNnllFyg6s/sB+TzVO0Pb2WcU8n/7K+8siU7gE
	 jNMTGO+nxqOoax+97kRtoLjkZH1MFvS3lJBMkvQw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF95FF89CCA; Mon,  5 Aug 2024 02:41:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C0FBF89CBE;
	Mon,  5 Aug 2024 02:41:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77087F80793; Mon,  5 Aug 2024 02:41:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF459F806BA
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:41:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF459F806BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=SmdkfgGS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=syrX0w8BVq+jj4X0V0WpFsdxell21p4anLcLHAdtY5DT3mYCa7OiLitLmGpoE+41/24rHSoS9sHFsDSG6sgX1qTJqnu8KIuzS0wq3omQX6bNFJMabck8HDGEG0mdeTXcUubfYHS+nahiYM17O/sdC43KHJwl75FFSyelcbDU6/yHE1/aCk/UOdIeflwdTPx2uWWxmi663RvIC6WYuVhw0jBDyyfAvgLzGi+Vf/v/sH6yuUgTG+dnKLbg3PxnGt0JJ1BootyQv2B0jxda6fGUgusFToU2keTLtTY96+baZOFb0YhAK1pZK3SQnZQ4c/Ue6xANFWKi2EPs3s+FeimWgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpFRCf7W5pU2P4g+EvAIrCXepWMVTDFrfik+o8lt+YY=;
 b=MqDlPm07vxXL9Qcok1394Tug5/FZfqUFfE7Eaeb30lQh4pn7YK4yBoua+dtS+Q1IBRij+RT/kw51kFTAZJkdj59XN6JqBU0C1ANMK4fgeQO0gOjZKxR6k6iYhX28/zJQ6lO5EZAlg059IESk7gIj8antCdXpVWw17O4OQJ9t09wejEu/zTRzhky/hCzL/5F0mm6t4cO8fcValVW/sRrNjUmzGCOaYZ0LTnfHnX6jvYgpgFzys4nmnglPgQkg6WkYI4lTgXncdiTXTFLqtd5HlAbl37ncZp3xEip7qHfeAbGtUDnop3isIRnAATOO06WrdA0jcvLtDRQ2jtEfjTjmkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpFRCf7W5pU2P4g+EvAIrCXepWMVTDFrfik+o8lt+YY=;
 b=SmdkfgGSst0rCH38vcl2u83DHMGmIYQU6cFQhH1Ek7u3LHpo5Egmcar2hz9B4EH5HT7j37LbT0HwYoF5NkE7VBQy13s00z/uhBxWKH7Y6xq/ys9nDdNkUt1Og0F2bgUd3U7mNO42s/b3Xb/XVm2rmb+ipbXMwqIoAJMd/Gjt5jA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8678.jpnprd01.prod.outlook.com
 (2603:1096:400:15a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 00:41:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:41:24 +0000
Message-ID: <8734njyf63.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 076/113] ASoC: codecs: cpcap: use
 snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:41:24 +0000
X-ClientProxiedBy: TY1PR01CA0199.jpnprd01.prod.outlook.com (2603:1096:403::29)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8678:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ecb517f-49c4-4e1e-aa94-08dcb4e755a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RW1jnDfoFgX1JKKuYajexqhAD9enBJKruw5J8RmCOHvx3A8kcosWW39aVUc1?=
 =?us-ascii?Q?PbkPtAxgHXXYKN61m01w0qGm/uVPk6LnQxkxS7pLWPajskbjH2Rs9iT92Yvs?=
 =?us-ascii?Q?hJzYtbSK6x15dc8EAybsYF6cxi+IX4z34aqTF2EN9KUV6x+1pUFPlOuTYaOw?=
 =?us-ascii?Q?AZ3uAbjSPrGlcgTbDi35rOKfvsQOpbWOXZMpVPT/7wiucOb7C6PaBrXwqqc/?=
 =?us-ascii?Q?vqsNwOMV8UTnYm1dZnXHsTodxcm8AD+/6MwpS1wk+LFhI3OFxtnCQBqX1+3Z?=
 =?us-ascii?Q?OvtwBGHiYnaQrlfd6xMkvyWSHpZmq52lW4bHWTH5URDfIxUKbvNwKY7Xgino?=
 =?us-ascii?Q?lxZf1VTtSIXwp96Rcn0W4v31gPIIS7DIPoHaRYIO29+A5Oy3nrz30q/vd3Jn?=
 =?us-ascii?Q?viP8hwF3xt/MGYErTbHOBKZn7QqQ7RKE7bHePGmt6lsxj6fOy40sbDu7k4Wz?=
 =?us-ascii?Q?evv6JHFaWh/Yy2ENaH9RYHxYy1No09Zo4Ks8UyWFYqs5r2ctyPD+bDhQ7MXk?=
 =?us-ascii?Q?yJMJV3HSk7R0iFHRQXLNok66yQcc/CqabJRC4C/dtAwCghEzmjRRUY5PAwVa?=
 =?us-ascii?Q?lbpkPe0WHUAznWMvGGBC6UbmPTQDo0fRe7SOx0HjGXFUJazL6PksSQPW5eDa?=
 =?us-ascii?Q?xKaaRhaWWpzUj4rzUGym6XBciD2+oIS8TBSQFDx4Eapn1nW2QQp5Uwpnqmde?=
 =?us-ascii?Q?5QQrY5hE9xsud2sPxaeBRamJLyOyKyMmhuZ5uvyhHzS/YCEJpEtgUSAGbuMB?=
 =?us-ascii?Q?OcmgNOj7G4URB/z1vj3xxhmCqRWj0hbSgJ/IZvRBDxiFKwOOjC7xBfLjzBaG?=
 =?us-ascii?Q?0AaSzlrN0yYwgw9dkuTN5LuBjjEbmqRhexeKHNqwzNO7UQxRrW4Vbnwwhzcv?=
 =?us-ascii?Q?OVjfNrYoE8GHU7o8llEUFkezkROuXY1QGs7mzgRLlxX7f7zabpWBIIMtgGUf?=
 =?us-ascii?Q?0QWgI2siyjKqDRAFITyfet247a5pKXZTEdUQY5AtATPpysTskIRVhp9omWoZ?=
 =?us-ascii?Q?yZMlz6XrHlk3P1J7efEuuB0Z0EWDk475Km3RAkPtg6keYABAGLy3SBxnTCRG?=
 =?us-ascii?Q?ZpGxPI25T/5fQpf9TY3MMtsmrzuLp3taHJKKOeV4oZaKlgiiEhaUAf6z7Uju?=
 =?us-ascii?Q?5GSU9DbpmlJ9C/agSPvValse+MZNpJk6ir2gQTX+G7ZSDV48Eq73iH5jdjNo?=
 =?us-ascii?Q?HXowlb6TwG2ZGndPI6ambRfvfMrGGN+qfnrxUoLhasSfIAw5Kqvoc0OjJGfw?=
 =?us-ascii?Q?cNDD0F6XbLaCq+TVmTit/5caV5ETeUVvmAFp4Qf+4+6axDXfR1+w/z5ukEZZ?=
 =?us-ascii?Q?KPBVh1rbUhMD+ArMZnl2ce7LEPRymjqgXfT5fkEXoRjaCpxtl+ipkuBV4qmQ?=
 =?us-ascii?Q?chrYFBf0UbF6iNcI3zHbJneKpzA0EEJ17pdK3hIn1NdxJ596AQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DhhYkt/1qCycCbU/S7QbQ0mgi2J4Lo6354w+8XsHhHX+qVCcG5tNF1yOYwmd?=
 =?us-ascii?Q?AUtT5+0UbddIT1J2BEW8OeHxx0yj3KF5yi68HIJFruBXdYzJNGSEhJ3KNzIc?=
 =?us-ascii?Q?vcw/HA5ycrn6BdfUtbZnCVRWIfDHVrEJT1QPZYF2CcLDdv2m01V/QeQwM6xk?=
 =?us-ascii?Q?/uOW+Bq/jP2HdH+AvhgNsiZ5sTGgEjBS/1CZP5W/1UJZcMz4mxX5azg9NhVo?=
 =?us-ascii?Q?ipcnvIE2x4XaOqE1LmmrZfFDbFTRQIWT4EHOSWlbUZ+gUOgtUF3aWf1kp5Fq?=
 =?us-ascii?Q?fTigbPSC/E0D2My027Y9sXvjiYW9dn0JIcnnF+nUbKAtZDXApyhVTtQ4dB8/?=
 =?us-ascii?Q?g9k5WsEMNCRwPbWUqI4hx2pc2fQ1QhZH15mdop9jW+LSXb565h7oSDmfk/iT?=
 =?us-ascii?Q?2joekrq2pgD9V3eOUu5hAsob06P82HBz80uphyqqj+5kTnJ8Lrso6XTvqxD1?=
 =?us-ascii?Q?o3xoiZqbbph5ojGP75espw7SmtOoqnLqGc65MhIzsEkiwmZGWTRIfvwDLeha?=
 =?us-ascii?Q?RcPUbCfeGDMdx2esLNBvael4w+5sn8g+ayeITU34tgEU6rbU5j3tbOTTkK9N?=
 =?us-ascii?Q?ZUUZHc3omf1UpDzuidSItOmT6KDLRw+r8Th99lwqo1lYHJYD6WKLJ+ywH/MQ?=
 =?us-ascii?Q?KUuCZe6vN4BG2wdCTr5G1PSTqMp4OoDHMtZWvugP2wfMFEUw5+hRqhOMMS3Q?=
 =?us-ascii?Q?njSF/9Obva0IJ1iQ/jB7geuBzfWcuoFuNPtX1JcoL1E3vHlt9JHTBbmrUnFr?=
 =?us-ascii?Q?olF84ORc2B7j3qTlKQylzoRquM2Rn1h6WFzd5lM2qQ0WWUcE2wQku8t5c2fV?=
 =?us-ascii?Q?XWlrF5cPzMYLDMhZqbW1MblutFKX0aPE48wuk2Hg08Zj/Bg2xFYtfJAbEIS/?=
 =?us-ascii?Q?LR9xLGYvxH6cLncP9xIWvvZIxZhmFCJbFzwGr7aLdnXA7OvHipbqGKfxwxmr?=
 =?us-ascii?Q?eQamZx2Mnu87li6jTfDx2V8oCYCI8TjBS/m8l8ABGx5Fzv2rCu1khKxQfVkP?=
 =?us-ascii?Q?AKOrvhyJfVVIKr/D+ZoSlPl25NKEUJbyxQ/eu5DSppe03829SnOW8Eq0o/Ib?=
 =?us-ascii?Q?k8XnAvncJrMfZAUCPA0iOI59qyfnWEN1+MDH5x/i9v4H940X2VA/PuhtUzDa?=
 =?us-ascii?Q?nD0fajYVPTraF/CYReTUr1LzXwaonenXzWnpirGDnyiGu5//wWHRXF2OnwzH?=
 =?us-ascii?Q?nmLRJEvlfs73cCq9oobqHRHf4zauOwVKjFz3O1E5uvmsiyWcmFgu8paE/n0Z?=
 =?us-ascii?Q?slfCavsWu8On4wvO8EIyn71U2jNWJ9Ff8ZW1XOD6ThwXGxuf5FiT1U4PSXdP?=
 =?us-ascii?Q?Tw6th97xUXUfXOQ6SA3EITei/SGjB0981rEwFxf9lOE8QgDSGAMGPXDroE2B?=
 =?us-ascii?Q?ntfzLG5GxaKUixYJt2YLVnOYFlz0KjMIB+rfXhQjV6chi7HgAL+yjtlJWKMY?=
 =?us-ascii?Q?A6d8eK1ZMyuf09ClDOihRUFLAgqyGrg7b3pVuWJmtwbaI9todAJ2IrHECUwa?=
 =?us-ascii?Q?TcLQ2wCbE+/EBbojOfcdEmrgh/e5meQim/Tma48kbPZs7FKMWOkFwb6HXI+I?=
 =?us-ascii?Q?Y4kq2wsjZYIwu42E+GT4tpuQAiM5kAOJ/KPbCz928pLYDamB3QH8Ct8r5Nfj?=
 =?us-ascii?Q?tkAN971GzNE1LeSC7yBrXlI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8ecb517f-49c4-4e1e-aa94-08dcb4e755a0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:41:24.7778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VHAMfLUYQuY56SjkV1AASz3dNhkSPNtas1+FcvP5jd00q1mhv7WsItUr0t8JPg4VZ8XdTFKQnUMrumHtEtaCleFMA7Dj7XaTlIT5drjY2AIEhDQkZUcU4iwy9VOhgI4G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8678
Message-ID-Hash: UANS2ULWYKJC25O27EI2JQTTMF7WXEUR
X-Message-ID-Hash: UANS2ULWYKJC25O27EI2JQTTMF7WXEUR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UANS2ULWYKJC25O27EI2JQTTMF7WXEUR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cpcap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index 4f9dabd9d78a6..e8309458eb86e 100644
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -1271,7 +1271,7 @@ static int cpcap_voice_hw_params(struct snd_pcm_substream *substream,
 	if (err)
 		return err;
 
-	if (direction == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(direction)) {
 		mask = 0x0000;
 		mask |= BIT(CPCAP_BIT_MIC1_RX_TIMESLOT0);
 		mask |= BIT(CPCAP_BIT_MIC1_RX_TIMESLOT1);
-- 
2.43.0

