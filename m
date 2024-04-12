Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8158A25DD
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Apr 2024 07:46:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CA7A2BF9;
	Fri, 12 Apr 2024 07:46:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CA7A2BF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712900801;
	bh=UbtCdkBEhYUPhuw5Py452bZT8HEaaLxOTdR1WoJ7S1A=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Q34O162Eegol7JAhofBjTNN5cAfUbSaQKDv99GIEtlEyvtolQPBGtoB35I22NO3Wd
	 kUkVxqLFzt2dNDiYEKh2n2uIzvFGXN8foKJ6o5Ipfwr2Jklj9QHHYmjIrkOEvnEOqn
	 2WQTkb68aIFxajwake9VdCCTU9YYAFJLBVV/Jwew=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBA7BF8057B; Fri, 12 Apr 2024 07:46:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C7EAF8058C;
	Fri, 12 Apr 2024 07:46:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C623AF8026D; Fri, 12 Apr 2024 07:46:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9F1DF800C9
	for <alsa-devel@alsa-project.org>; Fri, 12 Apr 2024 07:45:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9F1DF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=azod7zeQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=issbIJ6J9+ZUi244OD97Gse9EbKfHIBOs5V4BlpoPCPXU8jdFh7TaBcHWUqm2LzWMyNTiN0cD9kkLrnT8KqP/FRShIhgX5T2surSf3Yqu4+5iSHHbatzvkwrqdC4xKpoxCcK++lr5b0K7F3LxKOGqI3hIH5dnZePriVeeQwjAoPqTjTmMzBk+Be4Ekt9J2OFaLVFj6IwWipdCAU4BcJqUngYJGW7Zr6eexiCnn2Uc2w2icVhqi/3JRfp+7p00dm0rM8FKJh+B0+XrmJZEURjUSv7lUl1tEeP4mrowwsgPU3u8y7oxg0OWOZ38HK0S1Yl7c33OrFLLcp1iRtfa4QB5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khy4uMj1pySqc6bV4AnBYRil8uWQjQmB1JqFkcnOlqg=;
 b=XvrRhUmCfKrdRRgvHb4E+DkanHmlfXqFuRTH4XkvRnLWf1UD/goTu66VUkvN4gY+n4mSObbEy9rYlWAofZ1dYhcIyPpNoAzCOTWtTMhPVAQcCiFx7MU6uTpOGE0lqePhODlUMnV4yjNdwimx5b/1nZBcPgbtzbXjIT7fgc5WJfxW6N2b2dS9mciJx1+bb0PCcLAKqGPoY+bSTQMJfin/D0w0iSxxgCnrG0JEk2IMT/o0WcPBE9ktLi8OxYeR01DJZAzhE1uCtllCyikNqBtRLDQi1Zkk6wPCY/NEmbBHWyd+PWRHOgAKBYdo6MbeLBxp5FYMrIjEdzIRpPUBnuyI8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khy4uMj1pySqc6bV4AnBYRil8uWQjQmB1JqFkcnOlqg=;
 b=azod7zeQA9Jlb7+jHsw1KaEo2OluPrbND3A/pLkQdgjG53Uk4EdkQxh8Q30q66myjc/e4NVzBisCUosPho1GW/3HtZwZCJwQauNwXay8AfJgPGIQ0CXyKKlaJLDodIO0IIWCPFJFNijEzW773b2K0UHszuaHQSGKG6ee8EV+FYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYVPR01MB10684.jpnprd01.prod.outlook.com
 (2603:1096:400:2ad::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Fri, 12 Apr
 2024 05:45:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Fri, 12 Apr 2024
 05:45:43 +0000
Message-ID: <8734rrcewo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: dt-bindings: renesas,rsnd: add missing
 renesas,rcar_sound-gen4
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 12 Apr 2024 05:45:43 +0000
X-ClientProxiedBy: TYCP286CA0196.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYVPR01MB10684:EE_
X-MS-Office365-Filtering-Correlation-Id: d16fb10f-2d1c-45fd-0326-08dc5ab3cb3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wjN2b1CAowwYCsL6RlmrqxtTzKPBNEqs50iMrsgk5QfK+Q0vIy50+SCQZopv5CHSo6ZBLafbFwxQHm5p7Eb0XURxz0dDUlj1S0l2B614wxLsiN1NXdNRaMYgIIwct54yRu2pQ5D6w4nzy7AG0OhVUV+ld3mT5WdR3cJzD3LbGHp01pWJp4IrqFYOE7mqm3NMEW9m2OgjtiQ9Cu+UGYHSFcNMFDt6HassX1m/S3OCTFtoe8skySpfEOwSBfmovPX46m92o1iRxkWHfZp1/iaX0wnZ8Bbg3reoL7jXpq8bjsTjYPWU1e5pzgSgblH9ye2/J0GpdFFbaukYb20iS2pXbd6wJBPEKbCRWnjK2w4R2hFgKY06t4fvPEDGSy0s6dxrKmN4pBKhMMs/+2MaWlm+DP82Z9dBb4XK3fKX7d1OGStuGRsO6YZGG/Sw+UVh4HCKkIISq2ZufWubFXLjlNuTcGbchV2tMhfMmX4zMGPEU2GfqQDCfS6oixWlsazk/Gq2Yngq//jbms0ewKIHyrx3vQV2U3FKxOuYyZYdAqQ//hhDR9Zbi2OSLOFRmEDwLub6m53nsGr9kmqaKRZrpjatiJx5Opfa2lCSk/MqxQ7PTjM4/SdtnPjOUr6sZ0azgRQ1f/AT8TX0Z/Uze/hjLBckv9nLOsig5XDfuLmVMK3oPNYlEvNTeSnnWrhXdDnhLZjV3WIEN7hjXJv4QD8+3BEWBA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(52116005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?u6edojzMFfWiRhhVygTnuqW4hk37B71Pny9Mtfh0F/HXP4lpTzHr5xwpOY16?=
 =?us-ascii?Q?t9ydBzNVOm8LouLk8X3wBjV8aHr3JALWQhMKUWohcP3Bw2TyOnXPJoAhflwr?=
 =?us-ascii?Q?RFbQ0UF/6NfHyRc7TRNf7gwtf49msvUCx0mY7QblDv9Pi3FEWl94GpBxx6TC?=
 =?us-ascii?Q?FU/56pdx0b44xvcOT6tVnppPZwuQwI62CZ6hEW2h9+ScjRkmnT07kgpJpVjU?=
 =?us-ascii?Q?xa4DUsD4bBs+ezeuE9rt8FBingkP2ZjYcYuD0LS+HT9+6+sopk0My89JIh6/?=
 =?us-ascii?Q?DMzflFOWeGdErQxDcKxUaJLP2NGZYKO73Evf75dsINww4Kn0l+d5aE13a/Ql?=
 =?us-ascii?Q?G4DCsaWMuBpr6tIsuZlas/6ncfFbFPQlG/ACroFWzvuAXFP5K8tvx9fsJylD?=
 =?us-ascii?Q?zO16SYT5gKuPIub84QDyPMiwc3dNmd3YEHlIyTzzxQrCBqaBf6HBHPMOjTd/?=
 =?us-ascii?Q?gQB/h6yieoHiQY7yOmWBXrWwGLJYri0VrcXbCX7gBoN/w/CGYxon5D6jS2uB?=
 =?us-ascii?Q?s8YqPeN4alQmaaNLowwOmFjk8seMD4McG/qEhvoxmNKioWgz1NkKGowzxjOC?=
 =?us-ascii?Q?2OjwPHAPXW/xI4nV7PCB0qZviLuyOQNBr6fL+cye/qs+RAvCuyDdZdDfWXcy?=
 =?us-ascii?Q?TvTn8Ar3ZClRPl5hrrl0MM8JKBsHp2pKmdaNp8hpM8gnYy1q7OidFkPR3n5Q?=
 =?us-ascii?Q?olTtp1PUSCr/CTmx/URvbqLRHrjzMH5PbtoAHwRwcz2FpzRPwLhmUy7CgTBt?=
 =?us-ascii?Q?SJs25sTRneXvkLFkBFhoZxncudwIOvsZHjZXGPJGkOLKrZSVVRFTN8aPTon0?=
 =?us-ascii?Q?mG4uCb94IS8r2wOVFFJ100HLiwqYX17Gs+x0s1fUAo1ybKHXNcXSZRDCFjvP?=
 =?us-ascii?Q?u58OdrPy+XUvUOOd9FnQ3SWCSBHAoRNL35MIfzVPR/8Fa5sFO9yGvl8Hhp3o?=
 =?us-ascii?Q?9vDgPm8qsVU6VyxnWYiV8dBlFWRz2UXFn/tWWhZX1ZPu6mjN+Uue+aoMTBrT?=
 =?us-ascii?Q?e6Q4P3IqfAeFrTmaXFNvxw2EDcIGOcBjMUQJbGcrfaLhLiGHTA610c9RS6hZ?=
 =?us-ascii?Q?11kObC1TSf4pvvmaQlawiN9A90Wv/6A8a61NFpUmTlhnkVMbVWdxj4BvSbO+?=
 =?us-ascii?Q?ro8oC3rCMpdBp2KW9XdaEPrNjCkMsTaqlWT6jYJUzZUVv1rYCBUHW9z0VTYL?=
 =?us-ascii?Q?1PEurcKF03XoKwlpGfZy+lNIgguaWFDWSwfKu6WOmF1lLgEOFnKdDk6JQq4r?=
 =?us-ascii?Q?1c3CUiDf1h0YshzBNlo4Uo8EAAMn9K1dX/1KBUODpQTcPGo9biFuP8Yezhs4?=
 =?us-ascii?Q?9OIQCLu9akAtPscEBrMzeaSuR7NA69pEXLdUyl9Mq4R8h44OmEgSpDm1vdsU?=
 =?us-ascii?Q?Lc5IhHX+BSWgBnCs87W/PAumh0vKzfL/lTDJ+EXgRCG0S30OD0Hv5WtC36OP?=
 =?us-ascii?Q?/qI9xwz9hBQ/fQ31TSlUp9HftYbGZPGzIPa6xJ1tCuuG9NzQOevm/SuunOYP?=
 =?us-ascii?Q?eZRrlE9OCStXynnfYCxkbhF+A7wDDN5lxsDm664az6IEsSvshyNfwVsQfP0P?=
 =?us-ascii?Q?2/Ql098Xd1Bly34wxiBE/lkyvz80RSBUFc3SPiru6kF6U2MkSiGHoPF8Q1b5?=
 =?us-ascii?Q?h52/AIMMjfnkAyL+7RRs4a8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d16fb10f-2d1c-45fd-0326-08dc5ab3cb3e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 05:45:43.6360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 oQnAEwfdPIm3FoATX/mzOZsCtbVqtNgwVyUSKo79DzrvqCVG/4AV42k1i8kZp56R7TTNTrbL2QauchDEcYBy6JzFtpxyGhgCy8TlR1EjUu/5vN1ymlTxPwpEFZ6mmBU5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10684
Message-ID-Hash: B6MHSKI5XN4B4TIMWXJP2DJBQTNOXTXG
X-Message-ID-Hash: B6MHSKI5XN4B4TIMWXJP2DJBQTNOXTXG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B6MHSKI5XN4B4TIMWXJP2DJBQTNOXTXG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It is missing generic compatible for R-Car Gen4

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 0d7a6b576d88..996a13f21b63 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -55,6 +55,7 @@ properties:
           - renesas,rcar_sound-gen1
           - renesas,rcar_sound-gen2
           - renesas,rcar_sound-gen3
+          - renesas,rcar_sound-gen4
 
   reg:
     minItems: 1
-- 
2.25.1

