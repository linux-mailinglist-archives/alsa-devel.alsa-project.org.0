Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 469B4678DFE
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 03:10:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4C10E78;
	Tue, 24 Jan 2023 03:09:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4C10E78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674526206;
	bh=xoEM967RBCE84rKL8tV+Es7AoOK9qkJIpDJOa31ep7g=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dWCzAenfjxxzYeWyTQG1L5BNbUmCdZUDY+gqv/hQA1KDYhyPlmTh31SY2kdRCO/4H
	 Mh/4nDnhFp/Dsv/WjiN6FwrHEcTiLBX4OUQ1PPhPf0XQazoiGnLRp412nojhEoZJuQ
	 aLJtTibrbHhmTebez1/AVqEh8PFeurAKomFiDKdQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DD11F8030F;
	Tue, 24 Jan 2023 03:08:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73BD0F8055A; Tue, 24 Jan 2023 03:08:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2096.outbound.protection.outlook.com [40.107.113.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7514EF8030F
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 03:08:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7514EF8030F
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Y6vwVbQc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uzc2eQ7V1koW19mAeTW1Yi8i0g4vi0VnPh6hoeUbR92kIetM00qUQCxTo0WyEyjNa4yCw5VAXBoBLoShthIbyG2TvVfhUgcw4Bgnnb3qPzkT1J3K5ZbRd4A3GjZwCWASZAyCOjoB5y3ADuFD6fRI0MmtPYIXHO952B2BC45nH7WFtqdx6hEr16nPIN9KGVjlzBj07C6fl63P3/xcTfUqycbiCuS6d+LXxZJNim/jT+aRNQ3gCg29st3gPN/PrI2icjNeO5+K1QcvR5gdWkemyDOoiEsWTq5cOxmJoD5jucmaxGP4WsEYtBQbDkedItQ7a7Q2x7IHCB1O704VAg9gQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08SmPlzFDGfNDbwuhDOrffmpY/DKoELMkOYgxQ6SQcw=;
 b=WZUtr5sUgz/EHPmLNoewPPc9ZHKAPp8d68qnlkw7c8e5zUZr6cmqj/b9VlC/4vrhQg6tozEvrpOwWE5E1YZSylsUyFbH0m0Woi/ogg0gXh7lftNI2qjfxBqxi6tNqmg8iqurxcSXeBm9oGlv0uvV1jd6kcN6AvcNpTHkPYRRYfCEISgVE2ev1BEOxjzQdM5Mp+cTmGxVyk6yHgtHv3rP4GHtWq9Pt9PnS29iiwBC3KKf1J1qoiGn+NRXSTFNvcJ576b3MFhv4nrS//gcdCR0kGcgIy/g7QZ3UrQnAObaQP6Lw5ymKs57pHwDuOGjjCqCgCqRO7Wr9Oz6E8zkTglwNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08SmPlzFDGfNDbwuhDOrffmpY/DKoELMkOYgxQ6SQcw=;
 b=Y6vwVbQciVvqBIjuvUXcN5BcyEaDT08CivMdwqqJnXIq2yqBCwtSx5BkCuaZzUQY4Z5WT89CmS8tOSEvo8I+EraGlHzq/UHWNU5o7jMBBFBVEPwSHQJyXv85WyBuQ+6b1TvV4gIxtzz5lxc2zf23i3TH3aONwLwppZ14BDryHwI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB7701.jpnprd01.prod.outlook.com (2603:1096:400:17a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 02:08:04 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 02:08:04 +0000
Message-ID: <87tu0gu1kr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 03/25] ASoC: soc-dai.h: add snd_soc_dai_tdm_mask_set/get()
 helper
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jan 2023 02:08:04 +0000
X-ClientProxiedBy: TY1PR01CA0190.jpnprd01.prod.outlook.com (2603:1096:403::20)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d29b6b5-5acd-4280-ea32-08dafdafd41e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gCKirk8a1NmGjG7jBO1IcD0BYEw9riDT3m4XBpMTZP4kY8jXnB+x2S3gsAvltCxVxW+PieE43rOrF1WBdLcgIvRISnDA/lOPOlGMYHkWH8XOEQBkDyIizSScatBEkUz0VZO83eH6B6hvQ73b0MQVLvvcohxTK7NxWovLS5Fx7/sBkxtxGYLssBYxF1pe5kFmmmZ+eULJhaVarV+L6sYHHrc1ZjX9CgUBhUVEcatnlEamZm4K0GWDbIAcSz7aqkieb7fHD9la7mjYBczMHb2sKShI8VlOch7cl+QUa1uRdPTvAFNxKo3zo4FKEAu0XXChUli2buCoiqAWpbVsJ5ouHhyr65lDlTbXxa2jnD3fKeftDckN69Xdf2OaJOjrjxd14DwS9vw3canTjFBGxfCzjm6eqk+ejFffQhahnN1yM5FkGmqhgRGOQeEWOcE3BGuxmxcZQFRaam5nbQc840S+WNjKywQ8nsoEDJ8cFfc8kU/Ew/cPGY/+tsXiQsLj85Uup4VPmC/vQft86JaUmxRSzRTi1PyAkT/4NGn4AHP5Q/iT+L8zckd+n11EH/ejSeLoFKdgso+hoYvpIZ8IoWBWL7PsS9nmmoMyCd2rIWwSj/47axXKRFSnBgDF3zDLt8MdmegFq+FBVrsrPKGiaEM8+VQzDPQ5PCYee6Oov959kUUtwAv4ZZize0yNCGlfXXryakVpwMwt6At22hrnl6nrnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(451199015)(8936002)(6916009)(8676002)(4326008)(66556008)(66476007)(66946007)(36756003)(83380400001)(6486002)(478600001)(6506007)(6512007)(26005)(186003)(52116002)(2616005)(86362001)(316002)(5660300002)(2906002)(38100700002)(38350700002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5SZ6jzUAIo/csPt2bcu657Q/aoJhgCqGCqNwckBmS+SHnz3vwv3QnLY6OKa0?=
 =?us-ascii?Q?MOZcEMIbB8T+ionmtSu6BHd/3K5bQtWVdicdqRBSwqNTOSEwnl/C4Mb8aoS7?=
 =?us-ascii?Q?Nh7MX9a3BegPTAUwPFk5T7ZmuefoU1i8pjJAQJFuDWicXxX7Zb/6DflIypyx?=
 =?us-ascii?Q?SK6LGOVkp5p0RU0gtIkGCUHQDS3Ngi73sKYa7McGtHE4yfeWhG68c8pIMhsN?=
 =?us-ascii?Q?XQUXB1mr9LVVPXbhLeJkotDobwUKXv+t5Khq/9PtzO6j4Njz0b/ngq8ucB4v?=
 =?us-ascii?Q?KVYRGw/atF20BpThIzALRs/WA84fF/5f4lqRqEGYcOfgHkfxPBLNGfdKONjX?=
 =?us-ascii?Q?KlnVJI8bfXfFTnkiiKyyAVjWE9AodlKKemIa6bil/C4MUqtKyX1m2Q/pxE8V?=
 =?us-ascii?Q?+yInHnH5+7/Lyau0ZYZP9T7lwENowxC+uIEbT9vyPcF2v5zxIQ210zQ3jS1/?=
 =?us-ascii?Q?8m7GDxQ+jPegZonZMTb4nHvGTW8ICD2ZYZI5RSUnl7rlgPEQmKSpgZfeukvI?=
 =?us-ascii?Q?4vSW0VzxE2Hz6uRxRdvWJ0wvZtVzmmbXz/f7lq4XjDuDyAn1bLBxot/6l6oI?=
 =?us-ascii?Q?6K6Fc80bsW5NPbuEZqr/RghCHUHNtEnk2nBpqzE0hPSeIgNUVhRHAfjg+RZt?=
 =?us-ascii?Q?RRwnQJdFaRrdnIlj/1TOO2bfSVi8jldHmAXgmSA/1Qmbp2S2eSkWfypZIvql?=
 =?us-ascii?Q?jpNmlQ710H+Bt5byLuQRbGcle6/1X4um2NMiJ3wOtJh562t5iLB1f3mwKY+X?=
 =?us-ascii?Q?MYY+PDYquTSmnN++IUzlLWS/PyScgiRFOnhrJ6SJb8GuhgcwKpY/JaYfe9fg?=
 =?us-ascii?Q?RLy5616QqN9uGPmYCJ9Le21PEuZANn6Iq0ItpJv4wDbIAh7vp3uAH4TnjbCQ?=
 =?us-ascii?Q?Txq3NmctqqXBv7lFKt5iAqeica3k+Vq3gAvSm7SXb7/ftGBjOHyAyntzjh/2?=
 =?us-ascii?Q?RXG5M55FRdfD4LjBNsaWwLeZ/XPwWHkt5h3vOF/JF8FOijR0/+ZB4Xz3TEAp?=
 =?us-ascii?Q?vGwMUcrKU8+Jwyv/Hst6ZW3D7y8Sjh+diz1bGMS7T+3sYpJsUEG9wK7omNWa?=
 =?us-ascii?Q?GWI0Um/WOSjgxmT9a06m13/WZc8vKAkOwmZGrb1NRuSNDGacUWXSchUlhJOD?=
 =?us-ascii?Q?zLuwoCLAN9oF9olsyTs4TCgrpnURaPB/C/H22OgYUPWX94tFOhYQWbOHos3/?=
 =?us-ascii?Q?yCsSjc/R8Yl+Y9WdVxaZXBh/EBzANNh+uRtkNb2NKE6hpKmoW9UttPsLXa88?=
 =?us-ascii?Q?S2kXjaAe33sLerumG5l77jW1abJYS8D4uxQ31/8FZAICLI1FhQazpK1xmm0w?=
 =?us-ascii?Q?MrJdOmh1DuJlw+dGR/8MQzoudD1A1xAg2b7s64TpR7Lxbj3okUzEBtkoo8XJ?=
 =?us-ascii?Q?feIfrXTYXML14QtnY7+mh5SP5mJofUPrOFSkztLr1ShaG79BWOGH1Igbycqz?=
 =?us-ascii?Q?3dyCGcXCPRp11Yj/wW4KhwM2URZPPSS6xlt4QIIHoLrUKFyQkio4wiOFxtV9?=
 =?us-ascii?Q?q2NosQL5ht7aB4LVuGXhuELSSfjRynxKFg5H43XtUVMCAOL4b0t20fmah5+l?=
 =?us-ascii?Q?88SyDrD1lVZDEzOi8cDJUHEYJowQ/sJwgGaqevlUroeqCJhqJP1mPW83wmgH?=
 =?us-ascii?Q?QUqR6QYYq/H9oOIA2QGctWA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d29b6b5-5acd-4280-ea32-08dafdafd41e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 02:08:04.8589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aOY3oB0CYbHwJOzjqcChfsXa2jwFdgnVcF125yCnkVyC0g5RlcNfzWBBpdcmTjY+2Tim7kiE6Q+KrDHXAtTZt9y9FKZoSYbMIXC32VBReh73VEbf2tRk39FEmlal437H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7701
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has tx/rx_mask, and is directly accessing to them,
but accessing to it via function is nice idea.
This patch adds snd_soc_dai_tdm_mask_set/get() for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-dai.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index f27b33dd97bd..9b18e230e5b3 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -520,6 +520,23 @@ static inline void snd_soc_dai_init_dma_data(struct snd_soc_dai *dai,
 	dai->capture_dma_data = capture;
 }
 
+static inline unsigned int snd_soc_dai_tdm_mask_get(struct snd_soc_dai *dai, int stream)
+{
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+		return dai->tx_mask;
+	else
+		return dai->rx_mask;
+}
+
+static inline void snd_soc_dai_tdm_mask_set(struct snd_soc_dai *dai, int stream,
+					    unsigned int tdm_mask)
+{
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+		dai->tx_mask = tdm_mask;
+	else
+		dai->rx_mask = tdm_mask;
+}
+
 static inline void snd_soc_dai_set_drvdata(struct snd_soc_dai *dai,
 		void *data)
 {
-- 
2.25.1

