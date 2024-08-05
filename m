Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B928A94727C
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:44:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1391A4B87;
	Mon,  5 Aug 2024 02:43:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1391A4B87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722818633;
	bh=E62+TX6G4XfDRmg37BFmjd1R2msZXwoXLs7ZjLQXKEs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sWI6mxXxvkqXhqktSlHKZ9Mu091e/sW4e3aJEhEAwg+9dNrf7KBrEUZX79vMBFaY9
	 9v9gPdukGBIL6tVkYe+cFxxVxDwwY2Ht9oculWXwP8NRpJ3BM246Vt8MZxJaSUsbMQ
	 bYj9fBiRmbQ1K89D1pViIQBXBSexVHijB7MuVahY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00BDEF896CC; Mon,  5 Aug 2024 02:39:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77942F80C16;
	Mon,  5 Aug 2024 02:39:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BA55F802DB; Mon,  5 Aug 2024 02:35:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A996DF800BF
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:35:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A996DF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=FzOjOaEI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8UUIV2DETiUQqytPYVB8h1+t7fNQCo9ai51eZjfIl1ggmrkv9ilIwqBifcAi2aunnFA11ZyfG5TNrFF73UaJLK/HpYjpaKuJtDAcadYZ/MjCSFiIiCujrJR4XQ1ca4/WUqT1vP5PFGFGpbyTXFsxLGeithaIrwyamxzzOyEkh66kKKlBhn5aH+ErniyxgkZtYvz/OuZqVOgeQja6qnYNnNQKcJT9gD8eV8YQxzUQ7BQLLnGt8Z9YrIoQLq4wvZliNnkot7NB3EMPX0dMGZt/G47LlAHggvKFaIfgCI9hiRlJCr59eB27yP02nTMC/apIPeHw6wRixSLdwfRUR1L4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6E7hugC9TJp4HKlVqIg//X4XKAVcOkqxHfcKFYvU4I=;
 b=IyuQNujUcAJZGjzS8KZzdHiv8NSOAkNixgCxUhf2iee5pOSdVPK/rx+vs7ea9XDZXJQxK47tqisDqp4+NY3yaejv0o4OMDhhnId8UEry1KCuyBfUrzn5B8q9cAwKkZGcIZ1dA6zDj8tSi707u86ncSnHV33pC5H7PsokJ69ZpsUXRAYxttBK51AKaqkmX6og5LzxAVoDlANkgyXxpXPEn9IlM9TDNclju1mfTbfcxqYElthHOb5QyxfRx3IxIKnDYV6gevcjrM+DD6C0E32urT+hb18D2iUtIg1S/1A2vdBKXL64o3rx06lcQb1O4ZFCy8T60jz5j2GjIhUxn//a6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6E7hugC9TJp4HKlVqIg//X4XKAVcOkqxHfcKFYvU4I=;
 b=FzOjOaEIq2b0Ec7HcB/UoixT8IB7izO5CD4BppuE3IbRdhNT6ELGV5AQg2yWYot3/wCaHusCou3LLWjpCTqFq6S4MA2pJWMogBVYaIg72dihABpH8Q4HCOdnVraAleFFIojwOVECkSCjjNdKpUqtIzm+0VzFLKXihRDAW0fgvKg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7994.jpnprd01.prod.outlook.com
 (2603:1096:604:163::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:35:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:35:39 +0000
Message-ID: <87jzgv24dh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 014/113] ALSA: pci: hda: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:35:38 +0000
X-ClientProxiedBy: TYCP286CA0013.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: bdc2056f-5988-4ff5-0c41-08dcb4e68798
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9KrPppJpNjuJ/dXzrNTLygcewmfoIvcl2n8M9tqhAULi6iy/gzd6lFxs7PEW?=
 =?us-ascii?Q?sCUbOjR5GaMx/zrwOHLJwGloxQOcxGS4ywHiD9VxproT8eYoxlDPRFJzJMtN?=
 =?us-ascii?Q?l6ORBumpRQ3FxvOpjaL4HMDbr7yu/SLMbMyvF2i8Y6AcOs0PIzDoqsgKRbCO?=
 =?us-ascii?Q?ckXJAP9519WrtQZe2+JbmQ1tBpeXoS/rVPW2m4hw7jK4hsgkEbgfT7woe4W5?=
 =?us-ascii?Q?85CPRYQeUnqyVJbVQbL2u4tdji170dT906FSW52G10tGs71dJgX7BqfeBAc8?=
 =?us-ascii?Q?Mr2iLyLFc3S+2A0PHvt5Jbr3t3MHa8bYCxwUopcRJPdY3ikLO5X3y3RCLSD/?=
 =?us-ascii?Q?y+xF6fK6EuFPLrLgBrDkVVvJDeC7Wt18k6rHrlJiKCVbWWqmnFZaTY49gh1U?=
 =?us-ascii?Q?8nVsIjLtDp6eVXbg11RXHrHkpdludgC/R3bC+hHxyUka/MUMO1mi3C5yRrc3?=
 =?us-ascii?Q?lElnU0zFKhlZ0AFOudzKC2HiCYafcGafAmcRlrIURr7uv56LdEfNhYGUN7ft?=
 =?us-ascii?Q?6iw9o1J+bxBHAVFeazvmfOyVwPO2VnuetYl67dk9QLsG0MLQXjUIA5iW4s+G?=
 =?us-ascii?Q?5gjuMptyvNHs83oO+iRjDx2v6GmAGJNu5SyQpw68mGk/tAxnlt0KhW1/V9Bi?=
 =?us-ascii?Q?Gq96wDFCbTdPGTMuzJ6Xlq7I9PpYIz09jsqxTAzodrBvyfI461vkptHH8ooL?=
 =?us-ascii?Q?dY/4H19rMwVLsFAbUys0DjQEDcBY6FPqJAcmoXN8Un2KmX6qdKlTvfD7K/F1?=
 =?us-ascii?Q?wDkTpvn9l1+IxbzsCfrQ/ggNgcDdkULARcsp+Pf+zRW8VUhOqDbaWRnPFIH0?=
 =?us-ascii?Q?O7XAUZW1NtVp5H+dLgWsQsgcr8XEJEVgVZ8YBOKkEO8VgkRFklP7Na6/tSug?=
 =?us-ascii?Q?YK53Npi6ISwRDlKcN915ZEc3oOR3XzZiGjqZfTUHonLHOlruwRvpirefFITj?=
 =?us-ascii?Q?IZrO6q4gV/j/sJn4GCWZLr0ZZi+zKIMbBK1hI09N18MFjzmklSUW7vj7VyzQ?=
 =?us-ascii?Q?qVNIDTrOR9oeKhI8cPPrIETv/lZBpPdcO9byppxyUg2Arki05R8QoAknhhbN?=
 =?us-ascii?Q?O5ucE4w0qGR9FO+xVspELuz6+pfp4WT4E9GnsZSw9p6I1pI+eXQmBbi2vZhf?=
 =?us-ascii?Q?f3X6BKROarzjmbqNVAM14w1B2YQItVTpY4cwizv8NlqG6gkIxXLae0qk1iHb?=
 =?us-ascii?Q?qnbXMa/Z2ljt5OGKQTZAFsV7pfzFDX3dtuhMpLfniZT75cd3kaMtAxtKx6A1?=
 =?us-ascii?Q?QVtIx/szJbZGm1F1xPhKMtuc3vkyFbpbrtAcdum5kitWors0T6v82YbwoYsS?=
 =?us-ascii?Q?fDAV4jyOp44NHoF7T8IJzaaNuWo4D9q58mDVoZWPubc+8ZiqarWoxhoDwAQS?=
 =?us-ascii?Q?ldcnrsvZQI3MRsBwlVGOxkwxUsKHjomciim7PN5A2VX0LOhbSA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vzZYyO9E/7F4tt3jBSt+0EHgdvlTDJp10wqveSAcKYG8x2FZGssVdk0emItt?=
 =?us-ascii?Q?W1S5sg5clIQu+2Io/Dfsf+pa3Meec9iZkuWZkoBSTVUWmkI18A7kapoBPkqk?=
 =?us-ascii?Q?VbdKAlElbOumSSFc7yNEdyeMhZCl7v/TBPUNp+Mp+14oEmw1Yo/1w6Sy7E7P?=
 =?us-ascii?Q?++sBeAXmQRnEH6LTleXrpFF4FQMoyXnZB/jpMqIxQhl3AE182h5KLdo0dyun?=
 =?us-ascii?Q?R93bnzsEZ6moBwvhv7j2pexx+paqOon370XgUvYr+PCjuITDR2JyLTbJbziB?=
 =?us-ascii?Q?JCX0R+1MIsBfsBPrjSj56GJrEHoiJ7aouZOMhj97P8Sc6RwFSoSGKmcZv2m9?=
 =?us-ascii?Q?vug+YsV3Pzu3ysuqBvKn/Tv+1KpCk4E0rI4pCI99HHL8wCA+yndJ0qAeVWaV?=
 =?us-ascii?Q?84G8SPyhkuJzOgtdaKb31K06EbuC5094Y2Zk53CWa6aandKh4wJ1IhdFoulr?=
 =?us-ascii?Q?A2VJKWyydF8m8A4DMQqN22a6AW6cBHULTlPsqWt834+9mVRbk7dkwEWFsc7E?=
 =?us-ascii?Q?w0+Qh7xfwDCnGU8g6KO5W3JqYi8rYZOBBDPHlcvEcYYhqNYqWLGFXl8xx2nZ?=
 =?us-ascii?Q?7MKltywCjxZBlccKp0bSfwmbYbSj9Wq5BEVReh5A9ufwlKRaezTMu5bxyZmM?=
 =?us-ascii?Q?kchmn4/6M3ZgxuY+aMvOmHfp/SDV1ashBK9aioAJIyJVBJZ4fiFwR78e/xCy?=
 =?us-ascii?Q?IsV/YJve1R4MPkYa8Ib3jaq/hCw5LPcFwvVjLuoMcslzqDLb1jcoPlItIcPz?=
 =?us-ascii?Q?NpCapyT2mJsqVGDZV4KajeClCNej8SNtmuvSnfqcaFaAV4U5URVa0Le6SGiJ?=
 =?us-ascii?Q?ix8vNbDCGYBhd7waEwMnpUxDul8TGYwiwMQH7WzfOhUgdQq2DOXHVMTb0ZLR?=
 =?us-ascii?Q?K9KZxqnZmhNKJ2w8SSZruhcbkz3n6+mvgq5awDmoZV1AGjLFf7jT5cNnUnRO?=
 =?us-ascii?Q?qxNMrVZACYjx+4ep33DBwPNyj3OwfP2CgHgAQa1psgwIFMH/LbtZ1ozV0Fkg?=
 =?us-ascii?Q?bxFj8Wt9l5/MGK4Isn8ZGc0VqAfLr/Eq1wDLO8xwDnzItx1gIYmyGP9K5bk3?=
 =?us-ascii?Q?vQ2XAzJy/nRl0cHVO2U80gHhaU7P/8BWLVhlA3+HxpIh/6GDlsiJzBPygkGL?=
 =?us-ascii?Q?wDOWdUrFqGKmpxnHER+5yN7tAyKQ+z1xYds3YPj1Ix6S+1VhhB3lnUHasqOy?=
 =?us-ascii?Q?5TDBQEcpW7ijfgJVI9hxWFKR7UGUypHefMobhrH3llUtrez1sLrpylMhKUFY?=
 =?us-ascii?Q?42AmBqDhKDQEq1J+G1Dv19ipLfgYWsSP8ubXVy3JXDrgYcPbgXAWgKEAycK0?=
 =?us-ascii?Q?ERRlRe0q/R9ciQyCb/oG4x8T92KH2AAJ9ojO986eGlVkbTygkGPDxm729R0h?=
 =?us-ascii?Q?sXWOrjtejCYxEC6Q+hQgeyZ11HTIbyxGjKpPo0C0mr0VnGl2EaWH+ZzRTE+8?=
 =?us-ascii?Q?3h9IXewhIiN7taAzbMLkgBwoXmcoS+6Pn2bWQBKLT5FltyyVt2DxVpgCw8YI?=
 =?us-ascii?Q?CCag01Rtniy5WCfVRVN7fQ53Ij+wVhFtz/3lu3njONAn5/0hG2kE4E2/RZc/?=
 =?us-ascii?Q?oNOSXVUJXY9buiSo3fywroieC3hsIEUng/Sq6OijZfdR6dm6DpIvnlFHARc7?=
 =?us-ascii?Q?vivnbARrp3XKq8Lr075/478=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bdc2056f-5988-4ff5-0c41-08dcb4e68798
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:35:39.0810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /grWJbpRfTIk0CF0pdgtcwXSFFvbC5wJZT/jrmmuh6mx4zSIc7CjpOpbKNe6/uvS8Qx8TUDz6PIqDfvYCOsZks/0tn4opIs0aa8fMphJWT3Arz5MDXSNzrCYOpJl6Vj2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7994
Message-ID-Hash: NALTJZIUV5H2ZLN3CKKYPIULSQ4UQIQF
X-Message-ID-Hash: NALTJZIUV5H2ZLN3CKKYPIULSQ4UQIQF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NALTJZIUV5H2ZLN3CKKYPIULSQ4UQIQF/>
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
 sound/pci/hda/hda_controller.c | 6 +++---
 sound/pci/hda/hda_intel.c      | 6 +++---
 sound/pci/hda/patch_si3054.c   | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index 5d86e5a9c814a..9efa43afd0c16 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -75,7 +75,7 @@ static u64 azx_adjust_codec_delay(struct snd_pcm_substream *substream,
 	codec_nsecs = div_u64(codec_frames * 1000000000LL,
 			      substream->runtime->rate);
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		return nsec + codec_nsecs;
 
 	return (nsec > codec_nsecs) ? nsec - codec_nsecs : 0;
@@ -385,7 +385,7 @@ static int azx_get_sync_time(ktime_t *device,
 
 	runtime = substream->runtime;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		direction = 1;
 	else
 		direction = 0;
@@ -659,7 +659,7 @@ static int azx_pcm_open(struct snd_pcm_substream *substream)
 
 	/* disable LINK_ATIME timestamps for capture streams
 	   until we figure out how to handle digital inputs */
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		runtime->hw.info &= ~SNDRV_PCM_INFO_HAS_WALL_CLOCK; /* legacy */
 		runtime->hw.info &= ~SNDRV_PCM_INFO_HAS_LINK_ATIME;
 	}
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index b79020adce63b..c9552b71c0e9d 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -583,7 +583,7 @@ static int azx_get_delay_from_lpib(struct azx *chip, struct azx_dev *azx_dev,
 	unsigned int lpib_pos = azx_get_pos_lpib(chip, azx_dev);
 	int delay;
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(stream))
 		delay = pos - lpib_pos;
 	else
 		delay = lpib_pos - pos;
@@ -800,7 +800,7 @@ static unsigned int azx_via_get_position(struct azx *chip,
 	unsigned int fifo_size;
 
 	link_pos = snd_hdac_stream_get_pos_lpib(azx_stream(azx_dev));
-	if (azx_dev->core.substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(azx_dev->core.substream)) {
 		/* Playback, no problem using link position */
 		return link_pos;
 	}
@@ -869,7 +869,7 @@ static unsigned int azx_get_pos_fifo(struct azx *chip, struct azx_dev *azx_dev)
 	}
 
 	/* correct the DMA position for capture stream */
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		if (pos < delay)
 			pos += azx_dev->core.bufsize;
 		pos -= delay;
diff --git a/sound/pci/hda/patch_si3054.c b/sound/pci/hda/patch_si3054.c
index 763eae80a148e..9f13732a89064 100644
--- a/sound/pci/hda/patch_si3054.c
+++ b/sound/pci/hda/patch_si3054.c
@@ -142,8 +142,8 @@ static int si3054_pcm_prepare(struct hda_pcm_stream *hinfo,
 
 	SET_REG(codec, SI3054_LINE_RATE, substream->runtime->rate);
 	val = GET_REG(codec, SI3054_LINE_LEVEL);
-	val &= 0xff << (8 * (substream->stream != SNDRV_PCM_STREAM_PLAYBACK));
-	val |= ((stream_tag & 0xf) << 4) << (8 * (substream->stream == SNDRV_PCM_STREAM_PLAYBACK));
+	val &= 0xff << (8 * (!snd_pcm_is_playback(substream)));
+	val |= ((stream_tag & 0xf) << 4) << (8 * (snd_pcm_is_playback(substream)));
 	SET_REG(codec, SI3054_LINE_LEVEL, val);
 
 	snd_hda_codec_setup_stream(codec, hinfo->nid,
-- 
2.43.0

