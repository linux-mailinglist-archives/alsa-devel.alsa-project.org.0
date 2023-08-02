Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D16D376C1CA
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 03:00:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35553828;
	Wed,  2 Aug 2023 02:59:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35553828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690938023;
	bh=gwXVxUdKcJNcMA11McE51xMf9y/2uDYOoHApZAW9e9k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gbcCHM49rBDkE3M2U7kcwCwRe1lvh+qdqWjbhPRUWq6W8Gj5Pe7afUvMtRr3l4qRZ
	 rVcKHzvkEQySamddleDgb/cBbfvSIBX7DIRPVWuEGwHTqTWv1lspj2ht3zp1lTBOe0
	 wZs3gcR6J03uJYm3Uk0GDBvtdwfivvBfbAa9JLco=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A36FF8061E; Wed,  2 Aug 2023 02:56:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45AB8F805AA;
	Wed,  2 Aug 2023 02:56:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B142FF805D7; Wed,  2 Aug 2023 02:56:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20725.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::725])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 944A5F805AA
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:56:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 944A5F805AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=nvaK7rIj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJu1+3pR+5GUN9OOoSxd4Vlk9HZvAlhHd7lkiFkkaZkI2J1PBycpvFacsQm2pnZMee8mHRNlwEoZtNCnTjXnqijqd4SOGJMxL6wqZn216VzMjOPzhf+5/ij7ATpfvnv4xLAW11s82dugBkM7VFYahq4epMz38iU0uL+0b3qWgF91L8U7H+ENJkWZy7rgSDstCiYqT3DduDuXfoTFBjK23LBJsIb0G+tqH+V7jdf6Sur/xj//DuBbhsKcb6bx1bheT7Z/1doXxIv/KiEtN8zcetb+XreAS20UhZ9J9166mxCp5gtqkA7P6hhc8ZkDpMW1GV/5tG+mKH5cKvAxxPR72w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwcKjdaN3u99lDr0FtGzXA+mKT/TnWiCxBDq7YJxhtA=;
 b=K6J5eQigZ2Qjq9ypGRpZVNvkqRN+I7cyTtmzpvE2qI7nb1IUI/Mevd6FocLbV9duUHmkBTD7V84LZXAdkbnEZSrnPEnUGAZbSc7c5ju3F/IUDplXjb1IkN+Gi0Wtcodi5HbINX0EYdB0goXiQc9rE2AI88fkvbthPGc0lWHVSEDN0TNlL1JQqnAjuT8Jc1/gn7FBWm2IaLKp1tES7Kl7z6kfMWHDYF+R30FptI4hJWcdGsQIOOXR0IU01430w1dQoHn9ulMZhXNJhWJMkH0qXMcc5ajeC5q0ZTnceTazwBpKZy58FZ0LneVcakrhytSh4m17nJG/hE35O8RHaUAGqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwcKjdaN3u99lDr0FtGzXA+mKT/TnWiCxBDq7YJxhtA=;
 b=nvaK7rIj4k3bWaWSCsb+KThyt97f5le5qYrNAihRPwCwuJGsBHJ1QegylBUW/UMZNz8JBOFaMZJFvcf4iPrnwo3y/YSXylDna2XzGLNcV0gVzoqfFwyuS/fAY1HqxvJQ0eIZLAiZbvCQPqCSVpqqDWHdS47l9JA/MBvSUy+H3OY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8348.jpnprd01.prod.outlook.com (2603:1096:400:177::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:56:30 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:56:29 +0000
Message-ID: <87a5vatg78.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>,
	Emma Anholt <emma@anholt.net>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: [PATCH 25/38] ASoC: drm/vc4: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:56:28 +0000
X-ClientProxiedBy: TY2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:404:56::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: 155c02c9-88ee-4885-a26b-08db92f34de7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dlqm5OUyfjZnw/9bYAq/5wu0/tsQyJLRqmJKc6XloZHMClM8PleeNWl/pXYsHhAASnWovaYH+5VO0mYcOjlKRD3CYxDjmY5ZptbMpYaukfm/i561JUaRuh2Ay5v0Vryosufohn2gGCkiZzMP5OpJZtw5d6KGvlqj9tpYqEZshSYH7Fnq7i7r+4k+9wQ/g5yD+LBMarnlTCotv8hcKNLZfmQSf8QQSR7CPZ90klaXKMWBaOe/mcG8yOPchcDwXMWjW3eBag0AyQtFj5k5EQaJgll0ppaF3iqNqrr0wOSWvBQDbJI0MzLuEC3urWCT9IGRLO4WlgnKv1MdL05EhLbnCa0I0SyO8IyyxNRauyYrwmoAS0bATMNngwKqa4DZ09xSfuCu5uE8Gbhh+nIvYQpjGXNCiBJiGZavQXkDH98RtUl5jj5jWUskBEkxhBY3WYdfIKcq4u77qSouQP2x4rkxd6mTDy6nTJRLp5gyqTsq34XsZctWzXq5NcZRKZA5jEozwBisAa/52qowiiR1wxIE5U5P2NwPIZ+2e3kJN8zovUz/iVxw1TJ19zA7OyLUBTqeNGXnWwsIS3um/eCmUz4HAZm4/bAyUMeAeyUzS7jWJg5jMl2HgmreznSWZRqYyGoI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(451199021)(4744005)(5660300002)(8936002)(8676002)(41300700001)(316002)(4326008)(66476007)(66556008)(66946007)(2906002)(26005)(6506007)(38100700002)(2616005)(110136005)(83380400001)(6512007)(86362001)(6486002)(52116002)(38350700002)(36756003)(478600001)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jSLXI3P3VfAo84cpLK7oTNBksrWvdssRBnF283kAEA7IR3N5vOPgIVmzsvJb?=
 =?us-ascii?Q?Z2A9wD8n3ccQ0yv3Ux82O66oR45HZjzf0zma+PKbdGneIS3jPcqmq3mCgzvC?=
 =?us-ascii?Q?3o4NQLq6FHKlTL0gkagQh+wurwywcjiNEUI1XJHExGPB/ERkHyoyBCg6aa2X?=
 =?us-ascii?Q?l3jcUxH8D1mLzxHA85ZZlRPv06kLdloxIlrrdyEEsDWrguM955Hv5GLlVoxP?=
 =?us-ascii?Q?+9h8Y5I2sd9060SxvBH4El26aSmDssxKx9rQd+dZcg0/0+FYzHbVO8DCJvKS?=
 =?us-ascii?Q?7Uc157h0t2Aj31m2eBeraE+I9EKyYLu8b6f+fuUqGal0MgKa1RlRryNk0yLr?=
 =?us-ascii?Q?l4ovxd31QA75SCjDGj/BC/Zux6yyZbk9Kbb5SoYBCSdhm5G8NbSLU8pQ8BId?=
 =?us-ascii?Q?S9su5Ote13ZO6mrvRm/wO5uHGy1xbY0Alv48cjaau0Hn3GCiNBtS6w3Ka/BR?=
 =?us-ascii?Q?MAZ1tmdWwnvOYpqnNrzYDdHmkCkW9RIdS6/s8eex+IFnZPjQACw8g1DUQA/P?=
 =?us-ascii?Q?6F7qNJx3D94BBwL8azP2fdOH2CbPbp1VgN44GHvJWM/Mppkh9h5r+dqQQbQH?=
 =?us-ascii?Q?Ekrx5eQLWFe3RaWCO2fWI6sp/wnGZ1bYRHU2o8qJV8MFMnXsc8g33lb7JolF?=
 =?us-ascii?Q?oJEDWQQqF/i66HFDRSTZ2D/v8LJ++JsAewuQFP6GvnuKJPlJ9G4tPmaQd1O5?=
 =?us-ascii?Q?HfqHz+VAH+n+b/pc5O65bZBUKdx6rCUbZkvRrAAd5wxPSzE2u6r9uoDiHm0n?=
 =?us-ascii?Q?ge7yvDTDeFEyiupxBQqSWDFsHLgZNL2370+MxNANd0UvZLCPt/QT7MEgZMGC?=
 =?us-ascii?Q?92GJ7WRXJsgxpIQQumYhhZ4DlAU2jVRG0Z6B2BysP7GnKTsIGswjM2nSCRNV?=
 =?us-ascii?Q?BVPkXr4m2AC097uDw97u9AJnMTFbMm/EKUUVacbdqTYKRADPwz+Iz/CbBGK5?=
 =?us-ascii?Q?/4v+nTunlBeyaEyksozL4nMC0Hj1zqgHe4zhrwexAaIPTTTC2ngSiVQu6wVq?=
 =?us-ascii?Q?igeaTET6CSkxdQyrAEtUUxN6m6XrvtIQE5OxJoFvgD/GxP9EEUo7Qn4akPfr?=
 =?us-ascii?Q?iDAgUEo3Ij4Q/Q+SAs99CUfWZSU8wvH6R9VCQAq0fEEt7HiKAo7D2zS4a/mO?=
 =?us-ascii?Q?nD7vPu2LmeLfUzuxDd/jkgDHq4hXgKwlklXn6H2XaVCMSU/1c/EIiVpoLBFS?=
 =?us-ascii?Q?iHX3pUmVrLTqjntXKJmZwyrhGCPmiGrJ2zNWdVDCHSbqw3TEws4j3dFitVzL?=
 =?us-ascii?Q?Dzq/U9k6XoJCG0/LXE9jg5LmibaJ65UHIZlmbt01kDFepxz7+8OwbjXiCUw/?=
 =?us-ascii?Q?8IkPKbLqWvqCwHy0II8hFGqTLAfmOaJDgK54kSXTBoMltvK3oOx57hxzJ+En?=
 =?us-ascii?Q?4ryXz09XBsWMl0brV82L6s6wkVzEMNGN17y2OLYRHlTP8HxTgnFQg3uab0oM?=
 =?us-ascii?Q?jgqr2ydF1pG+G3c0eQ/UmZZFMVg17O+dOcj3m/JUoZtOiP8XeU1rdL7Nqud3?=
 =?us-ascii?Q?cpGtrla9carOfg3DO0qDPxnbMRyPghNcMv0QKlBU75xfK0hn7+sgtz/DAIpn?=
 =?us-ascii?Q?fAcrFHJXYWCnZfwMZ6Wp//ZG0Ni+hdBACDUxhGQs5ftW4MpV5FdOqobaxgqH?=
 =?us-ascii?Q?69CRXtV91Ab5UYa5zLyqork=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 155c02c9-88ee-4885-a26b-08db92f34de7
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:56:29.3426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0V7RZNhS8SacQ22Ip4IaJtSOLH/U60LjZnmqu8wXbCQlKxYpIIuZUnXU6t6pHeZugIDWORhSSwVs/0EgRunxRg9oh+/O1X2N4wl9eheSUVrxh0MK1u9zpAmWfoP5Ss/9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8348
Message-ID-Hash: LYXDPNCFDIK6HYMZFL7VWCETMV42M423
X-Message-ID-Hash: LYXDPNCFDIK6HYMZFL7VWCETMV42M423
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LYXDPNCFDIK6HYMZFL7VWCETMV42M423/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge thesse into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5261526d286f..a8dec24b146b 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2615,9 +2615,13 @@ static int vc4_hdmi_audio_cpu_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops vc4_snd_dai_ops = {
+	.probe  = vc4_hdmi_audio_cpu_dai_probe,
+};
+
 static struct snd_soc_dai_driver vc4_hdmi_audio_cpu_dai_drv = {
 	.name = "vc4-hdmi-cpu-dai",
-	.probe  = vc4_hdmi_audio_cpu_dai_probe,
+	.ops = &vc4_snd_dai_ops,
 	.playback = {
 		.stream_name = "Playback",
 		.channels_min = 1,
-- 
2.25.1

