Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0502C674D60
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 07:34:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89FA22D91;
	Fri, 20 Jan 2023 07:33:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89FA22D91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674196446;
	bh=G3k96LtcSzogStD5LjiKdIEES+SxKpBiSa48fY0pUKY=;
	h=From:Subject:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=TsLaj3U96ZiT/U6aJ8lj3T8pjfv/gKCi4B7R+ZW35Zp07HIdI7Dv9TJIBziJBZhY1
	 0rx4AZBaBPYncxdvuK6XAGWpOVL0QfkiN2gW0Wxk1mGYqaX/hGszG96EgT1VCkQBvF
	 ec0iM/Vdjna+qV0QuyEgAGjxp4H86DJYc30PH4rk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D576F800F0;
	Fri, 20 Jan 2023 07:33:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12F92F8026D; Fri, 20 Jan 2023 07:33:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2109.outbound.protection.outlook.com [40.107.114.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC861F8024C
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 07:32:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC861F8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=K+zD13q1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YlutFUcZVG6UuQilCcXX+lOVFcYqgFOQ9Q849nDohrbbvX+ef+cGbUaZifPSwNh+KdDMuxVGcjvIPY0dGogI/tLmqePrL7EuxrEQQ1HUX+y6HTvwdUZPdRm6n1LyDs1UJqu68z/GKX2CoD017ofiD7bZcSMp9cGZgEkBWxpmdpeBCEbrGeF4n2vesXwZijHL8PV2NJu90yxW5o67UO/LLEK53DSU6DwOo9e5DZO+echQjB+9gmHOSdOyKgCAUwKsQJ/V1BGp/EaevBuQJqqW2VmBRT646BspnVi+KpXV8kJELeNUQBDK4mfX+rNRem15n5WmvVsm2rVB9e+dmY17GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=En6T02/dYiQP9yfWmHEwoZJAAg+KQ2eh1wh1rvLlRkQ=;
 b=fcttbCwebCsiH4zENxyQtQiUfyrPP9iP/w1V5lCtL0QKK42Tj0sxvL9zNCXt78K6OSbf/VIpwRT1JFeRTPVE+KludrkBkfrem7CHVuR8C748edu7F7+Vz8QyA/RTF8JygJY6CbOZ9c924VCEifeDF2BS1tNtOdJy+pcj5/lDNK1yxD8vw3BesmcNBzo3eS0aGX2xr8VIeMm6EPOPJiPjyjPW8rRcuhwY7GbPMKrO5QoCSawMjZAtxzJ+r2KhcSS7ykCX01khGADYSt1OFOMsxmJ/48Cb0VR1Fke8UX8iGjugnedsMc0U2VFqQhNiABvagciR5b3VJZi3dG4WCM+iNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=En6T02/dYiQP9yfWmHEwoZJAAg+KQ2eh1wh1rvLlRkQ=;
 b=K+zD13q1Hmqyya9D5yB26IxDi984dKMLQsl+hcBDXdDNHsjCF6MGsdEsa5LAum9+OcPKe8EcZiHqh9px3iHHn6uSHOVEe4k4/juik5+3m0i1fCHj6VCkcAZoUSlEaXggL8oZsPNwYXze6UFt8DcUAH7aA/j6MY0CDky86/PY3U4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10634.jpnprd01.prod.outlook.com (2603:1096:400:292::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Fri, 20 Jan
 2023 06:32:53 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 06:32:53 +0000
Message-ID: <87k01hlnqj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: hdmi-codec: zero clear HDMI pdata
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 06:32:52 +0000
X-ClientProxiedBy: TYCPR01CA0140.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10634:EE_
X-MS-Office365-Filtering-Correlation-Id: 02d6a88a-f8f5-43b9-821a-08dafab02899
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sb1D1w9Rczbl7ouPkBsgph3/lTB5RAq2GKFgiagD2n7NgubQmKlTLm9t3+6CUS7txyw1I41JGtzjWUcxZ1qaGWmc38z+zPGxsbpWUKHL1mgjbLpcGQstoVwepmH4DiCzHfjWeL3jhudbp5Hx6j/bhVEyR3codZcOAMVa+rsHK9/8N8IivKV3mJMf1M2PGTIpgkQcD0M2+8c1riALpmDWfoBJdbBqgRmlfxTevdD24VY2dgZOnRKpBDk8AClX8pRIFI4AXazItmAmgFFQpKzv9oXbmlIyeRWGz2x5VqPnA4FBgdnJIXmNXebZasV40sxSKXLkrGg/p0dC3qQP/9qqjZfcrFQwtz3QogSuMYRSxTQez0vbFqDV9I83IO1Ytu2pXaQMye5e9WgJeHOjXmAytJ6s3xipLs7nGtxRZJxXYqp3QVnV8G1P8pCMG7nSqwqo3ZLO5y43Lyx0FAe1xd8lFdDMIKKTMgmuUUFbAupgdHMJa6ty8bV3pH4PB+stSXo/25WmNB9Jqjp9eMg7pxXljbFleOM4bFCur0ZiMI7iTE4rmOnIFebrOXq0FzwVatBNfuiWzRmnlYlSOu1fpYzwSvLk4y/64FKNKo6m1LV+v1SLt9nCW3B1Nuyb8O/xueanZENSzOZR6JlxPcDmyBqta/UceHK//ceeJ2hw4F/B67lVWcpKqCOM29qmi9fWmcOz0zSz0so12sQcgn+QS8NtDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199015)(86362001)(26005)(41300700001)(5660300002)(8936002)(38100700002)(38350700002)(36756003)(186003)(6486002)(52116002)(83380400001)(6506007)(6512007)(478600001)(6916009)(8676002)(316002)(4326008)(66946007)(2906002)(66476007)(66556008)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/vQHW84/3xkpH80Nf9e1pGq3nNwC2ra6sRMzgEizZgjPaFAxJFdJtpHfOpET?=
 =?us-ascii?Q?srplqHdg2j5CTehFk4CPaKp6Kan1LxGw2PRgSPW+FaiUMT5SeAFAO3vco+Jg?=
 =?us-ascii?Q?L3LQkFI9mFf4bl2QZ/KSUebXqEusRN4Wfa0343gxcqJf9ARuS070iU5As1Mp?=
 =?us-ascii?Q?rqfIF2XFg/mRY0kX85MsWVO+fQnI90kL+GooZuP2IFcKsIVq060mwRhmzApi?=
 =?us-ascii?Q?FOYexje5qLt7h7bMEdw+Jgv7hcwgkRriEWOZDO9j7iF9E1y4zYKvmokUORmQ?=
 =?us-ascii?Q?PRnfl1R9XTa2me+04Ibjm+HtttTffYO3p8PmI/tagmoQBIvxAQkGPUAk+ZJo?=
 =?us-ascii?Q?8pABHczHabkt5wRhpD6K2NVFdO7ksnJsHNgNXErKvmRjWReiWkdUF1P/4fIQ?=
 =?us-ascii?Q?nTH4wr7fdxMij8RRlVue8abD0nQjm5tWtCXctKvcy82HC+vXeHVpWRurQ0qy?=
 =?us-ascii?Q?g1MqSB2sbN+jMGNHusacJgS9vk7CWcIlxaf7ai7IzcO0+7EgPh26/DmmN1KR?=
 =?us-ascii?Q?7Li7pWw4dAKanEpF41sNpWfh5Qxu6keJW6Da3vtjHZAm9031hH20d/xpqt8t?=
 =?us-ascii?Q?GsbPK4unsArMANHq4enjHwzt2OWjcWHQ5zBvyeEGnAl9s7zkt++I0ID7uY09?=
 =?us-ascii?Q?2+2tNX4vEykrrd620bMzG8qkF8rc3EYFP4kmdrCqOdfGzICn1w/Oipm/vMWC?=
 =?us-ascii?Q?dZp73G0kYBG0egGPBmnyM/0ui7OiRExu+aMDmQ91yEXQXcCRuma3RfzmyCK2?=
 =?us-ascii?Q?a5fv3+xbPiQCfL9rV0K78F/ONscnI6Q20bpbA4Bde2pKjB9Lq29VXPHyBlGR?=
 =?us-ascii?Q?34ldUItSIehrRnNz20NRawOIlvq74wBD0kux4mqRnuCZ7Iwxc/Eo4ioFCMGB?=
 =?us-ascii?Q?HRzvMKkVFOhgLvlgk26GuNk5dMHqrb4oGRP3JhTagBwjYKCwGLAD4M0EUxDR?=
 =?us-ascii?Q?nnHsg6jJQACiOzDI0P3qDtXMa1x4IMQR+rzCeJhUxNWte0jsEFHxHALm8sQb?=
 =?us-ascii?Q?U20tovLILwWPcudCV3yD7Gs81pwdNtJ7pEGjust1ICtU2MH8TaoMB5yL+Kbg?=
 =?us-ascii?Q?pSvGflQLZVzf76oviWbJ1evrDcQvQlZ0Lwi8WVBqFjcqjO2kgThPKowR10YO?=
 =?us-ascii?Q?P2Byt5k8ounTA6vPqsbTi5mJ9v2DzAr/EU3Jzcf4hhx1Mxw9CLlwcSEADHB7?=
 =?us-ascii?Q?EP1gvcMzeAdRZqiOUTD6YfK7iIEjREL6W3Ez8NrD9tBhr8cQXG8jiWLHwrMa?=
 =?us-ascii?Q?WrUESAvK7yidy1gIfUr4VlkwHGiIw0ZdZ9EFraX7j7GPTl7ClMoYNPK+KJ3b?=
 =?us-ascii?Q?etG3Cc3W+iIQ9DhlXydXFXJgj60zj2B9m4pXQOoQduVbz33Fabl71LBYb/y9?=
 =?us-ascii?Q?nHyl6dHXCvK6lcSjur/QmwA70GeU7oHAVVDWyLDHQWDs6WNzm1D7NphDAngF?=
 =?us-ascii?Q?/GMYlgnzk1q3YhVbRHUvdt6KmnCy5MYlhaC+c0TTtcTRW+BhA9jaTgTf/VeV?=
 =?us-ascii?Q?cAkydljgS/Sv8Kqpv4FLvlFb6xSp7U09DT75N+73yI6V5BLzDYSHx8gsUVar?=
 =?us-ascii?Q?UATDQzwT8MflUc23FdVvhIOTF8+1RyUc2oOKYDnPjoI7tdCVYHnctqzt7qfs?=
 =?us-ascii?Q?QebogBloo4myjapb/mYqpC0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d6a88a-f8f5-43b9-821a-08dafab02899
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 06:32:52.9933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hwymo7Q+mKwlxYyF0zXKjvAYtonFw/T7aNLcecsI6v5q03rksCmaX2kr8FYe5/qXyHJhE4hhPGP3WuNUvEEsGgM2L1htfkB+YdBwwamCXtguMwi2+kPDPwd70PJXwUpA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10634
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

commit f77a066f4ed307d ("ASoC: hdmi-codec: Allow playback and capture
to be disabled") added new no_i2s_playback/capture.
We need to zero clear HDMI pdata first, otherwise unexpected flag
will be added.

Fixes: f77a066f4ed3 ("ASoC: hdmi-codec: Allow playback and capture to be disabled")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
> Mark

This is for v6.2-rcX

 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index a2f0860b20bb..d751820c6da6 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -193,6 +193,7 @@ static int snd_dw_hdmi_probe(struct platform_device *pdev)
 	struct hdmi_codec_pdata pdata;
 	struct platform_device *platform;
 
+	memset(&pdata, 0, sizeof(pdata));
 	pdata.ops		= &dw_hdmi_i2s_ops;
 	pdata.i2s		= 1;
 	pdata.max_i2s_channels	= 8;
-- 
2.25.1

