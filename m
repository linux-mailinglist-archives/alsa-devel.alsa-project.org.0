Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAE979B468
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:02:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48953F73;
	Tue, 12 Sep 2023 02:01:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48953F73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476921;
	bh=8m5liTkIxxmRIrdkreBOfdL30oVJ52TAmmLpDj67tSU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c/w98zA9n3PC2dG3w4kDGJ/8DVQcarDkvGGLX8wsFiRkvR3ug9IqTpX8qZGSCmqid
	 he4Yi+pRsXsMJTldJzBVm/Tah+eSHqv/V3ECdC0RFXqyO8Qx3A51p5I6RJLCShKlf6
	 zhldLF20oTw8Y1mddco9iPeZeDKPRf+rZQcuLgN0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F18ABF8075C; Tue, 12 Sep 2023 01:53:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23958F80571;
	Tue, 12 Sep 2023 01:53:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E036F8058C; Tue, 12 Sep 2023 01:53:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20725.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::725])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68016F806BD
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:52:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68016F806BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=UT0d1fRK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BCypmibrBdAyDIxwkfQQvMM2IvIF+o5+HJXvCI+M3RzueeZw9X229I2qP5K8YmcsBYZJJok+RSZsXwybPbAW9PmxwqTJjdqeULz1JhNfFpAVdTGypx9LLGe3VaCUdhsRb24mNFjPVHLOJBLjd7fGe9kdNKI55u3LKgDaNa3pC4q5/E/he3sbV61+EwH+maGPuxRhCRA74OfU673tivZjSnbzL8kGZ1DpYOAyt+uMDEzzQMpkeiTf8F6ZinCpLxca66UqV5Suh+eGrC1y8oc2m9WXmJR+64y3ALFbiWcQCb4Zo0UT6fXLO8XfBfDlj4qSVuq9Alz39HJB8qY+NpdzLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghmeLQI8lWDQV4jiByPs7FHbFKayQgiNozvuJ2EwMyE=;
 b=dzQOhzuj1ZUtmnP12kOBNRHS3GAO7gdwvB4pcS81VSft6ilwFP1wmNy9F/z5l2EV8JZgknesEOvfRBKRfH1tlTJ8lNjnMpc/XIh9Q0OxnluVS4usK1p9b4RJtQsQUKAIld1lEleXCmxduvbmiYBGYZG7BX43iEN340xXiQDwD2dcxu+CZt8LDKBFDHKhv5QJK4E0S/HooUKK5ke72EoZbp0d2jOaz3p+BYNSOEGTQpE2eduXUVd3EhxThA6jYOdgRrPcqmR02cfNQNXGwOMsHUcl21/o902IjTovXjtNn7OvjLinwPJTv3ufN494mV3pxbM2evBvE1oxsXWxLQFfIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghmeLQI8lWDQV4jiByPs7FHbFKayQgiNozvuJ2EwMyE=;
 b=UT0d1fRKzvbFXNJmNhIku/i9wtmzXL4jL77DRYrkCGHVXOCmjjcgKlnMAb6v8YGJk6NfOxjcAtt+sl/WOEOQHJdqLUQelAUtB7CkKyl23aKG6vEfnk+HFnu1O2o+wmNEBMR/7vB0nUNpRv+fzdliOB+GZMtyzxKnwzVL0MQz4HA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5990.jpnprd01.prod.outlook.com (2603:1096:604:d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:52:02 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:52:02 +0000
Message-ID: <87il8gp8ta.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 49/54] ASoC: soc-utils: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:52:02 +0000
X-ClientProxiedBy: TYCP286CA0127.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: b1b0e40d-8db1-48c4-38f2-08dbb322185b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ItuSoWVgELvfQEbokU/mCg9gcnIQxq1ic9qECwT/tJt0phUkPjAoALjZ5ZQwbLg6cZgmeMNDRXNW3YukXLavbNEa/4WsiYEkCDWpQ9qfRc2EdNNtO8BrxbdCY3UW+AcRGQuvvczi5loAzzwobLgf/DHaf0EPnY2Ds5iE53qOtY2JZxGP77P4L5bvcZXBbansVUI3/wHvdilytj6khrizd5fA1OCKBrq0zSTZrlBLIBTadRzw1akpXThhXFSt6v+wx+T5FYowpw8myc41f7HxZDYI4qZPICfUV+2hbdAdaINotA9KdxfhEhvcjMhtJdoQEp4YDY7+441PUwXwxp1J8POSHxAbUXRw5Mxz6fFHIxlF7fQhbZmSQrJzXiBGdbfpSjzySTTcLAODAIcdCq3XBHRgz5i0K+jizOP99okY/SnRoF/nRLxPT5shCcQpSuPITkhcBTEJ5ltZ8/QhxR8Fgxa6rB9YS+FKJrLybXYAt3hkB1F6DEx5LwjmjKBoXO3qX6X/cgyt8I5Kf2LgELqa34KE0XaDKuwO5wr/0TBdsa/wccu1lWRY8FWsic9HrT9DlKmNRxN+Ktzb176u5TwjZhs4bC5Rj5gQG94xUcbpIwuS7Iz8Jv+TRsMTlni30e7dJFvVQNbVl04sTBaFsxYRkA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(1800799009)(186009)(451199024)(83380400001)(66556008)(110136005)(38100700002)(36756003)(38350700002)(316002)(86362001)(66476007)(66946007)(8936002)(8676002)(4326008)(41300700001)(5660300002)(6506007)(52116002)(6486002)(6512007)(2906002)(4744005)(478600001)(2616005)(26005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AnF88QCPivOg+yZfXuWXs2mhb79hz0FgoahHmMNXfrqovlH5M9XwmGemboZg?=
 =?us-ascii?Q?Q/j+ff6fTEIM+6vd3DPOZNnS9Fhs2gcF1qjGSNSkWvuwpKizL51G/SqDDGeL?=
 =?us-ascii?Q?JeHN5fX1JlaxSlldjaqeVty7FXCBDL2bXsSjCUzhcqPmu9MryiZg0t/yNnje?=
 =?us-ascii?Q?AXRDfoimYic68fIL1uSlhSodgTRZq3hkLA9AX9vuar3CTCfs1QEL6FavrA0S?=
 =?us-ascii?Q?yVw2DxEOGPsbXQmxcAiRF9LQKVloefy1Vu/K/t3z/3ODCkvsnb0A47IkDfnY?=
 =?us-ascii?Q?2k8byaCzYKhxWfcLiPDxZvksMPAPB+IBOOOB08JdyfKI7IKTnBOrrT+pB5I6?=
 =?us-ascii?Q?P9V5d7ZOooJXnFMtCo7Jh+ZzjKlYGGAG6zQDAsoM3T0Osg3W/ETsjeQEYNsm?=
 =?us-ascii?Q?Afr6e1r+LpPUy5IU+gUN+0y8SWLq6dJW5pVukgHg667ceN4Rl3720jzuWUsf?=
 =?us-ascii?Q?QFKldVwtXnU8Jg2xUxas7AIFT86bluG08xk32+HAgNbRRooe6xyhn/a935/g?=
 =?us-ascii?Q?QXepeyhb5G4BBzbDauvGSuHJADPXQ6uv9LZtsXr0E//npo3nmW60wfPFIHqr?=
 =?us-ascii?Q?76BKFAENWdymaUnhFWTXpNPR1WPEW8zATAWvoqMwkZgI9kjVESt1YCfQEWYK?=
 =?us-ascii?Q?JVJ1WOezj9kwoFAWjRoE+WvAGocVOSd6zxzuBDEPck7YxrwRpgWGI0tGd++T?=
 =?us-ascii?Q?TEklQ9EuRJxjxhlbFqhUR+zcyBrB7/xNPVXNqhxwlab9I0L1VBZqxy9r/kjx?=
 =?us-ascii?Q?QCZhdM0jYd3xb/fpK9CgBB1cdFzLurwdNq58/o+0KhuOzPqi4LNR2oKQsL88?=
 =?us-ascii?Q?U3izeBPx1ika/Z4Yzj3KmbFK43CLITwkSLNSvAlZBR2rtkOR0zCCTL5JJLQS?=
 =?us-ascii?Q?txQG0K3bE1MynbDYxjFuPxbAQN2jV6WBVntbLJH/O+JCJaQmhxAkJ40FnEsR?=
 =?us-ascii?Q?FfDG4stfa+c7X3nvazPeWjl6hsyBPMkRZahYERddEzVzCSca76CYdVGIOzaW?=
 =?us-ascii?Q?bYrQXptlHNChyIZe+uHlyPjpggbjlBy/iKJvk84V6v4CkItoQCGg1oGCk1pk?=
 =?us-ascii?Q?2I9xW4ejGx1i4IZ7RkRxITzMw2b5C/Cnkhv2uBpySvotocxZwyilVdOZx5TM?=
 =?us-ascii?Q?G76kk+sFR9BQUalVq6rU91dywsdqn7Ag448/jB+2qZgm41Z+LsvzdHsxCqjp?=
 =?us-ascii?Q?oAr/C69cA06kXj3XGb9h571CwwPTCLaptyJ9xeuy7w2ZIwQxPLF3nBnqHrEz?=
 =?us-ascii?Q?SNIP6hU450YVu6Eh1Mz44p+3kR01x3P+SPbhhbtUEZwgTueR4A8HQsRK0KEW?=
 =?us-ascii?Q?3KLTgAfOWHNspuKt80uTKSRnXuPtc3Z1GU/dUisPSapoXMbvTj2TXzutyBiZ?=
 =?us-ascii?Q?vXg5VxvwhI+qkD/Jok5TNcGP08diTV8dzp7pBPyATYQEwN5BDXScUufgfx6k?=
 =?us-ascii?Q?2Sj9Jz7K4Wgy8IMfzEDWeT9FZ9QleZON7spGansdNRO3Vz9+mAYYGAWWghY2?=
 =?us-ascii?Q?EqgH/Z43H9NI3grVsie7gEBZDraRQoT92Odrd1gQcKSn/5de0HvPMkrau7YE?=
 =?us-ascii?Q?9FGWC8iCx+QevHlmxwDjX57VyqKevfitsWIIhrn4HyKXsDtpDkhPMFVPtwk9?=
 =?us-ascii?Q?iocGrnR8iAcoUd396Mp1yUw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b1b0e40d-8db1-48c4-38f2-08dbb322185b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:52:02.3172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 A4uTwA80yx1rQMl99hwrH/sNQUJDWCYwdJqgRwOpVG0M1idMLo2NXemXEZYDlH1Q8JYLB6JwlyQ0rl21G7rcrsD5gkZQrkkBOybmLJJHdx4FrQIVpNjlEvBI8W1l9pnZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5990
Message-ID-Hash: TKWBG3L7HOCMVEPKQBO4MPXUYKQX6KF2
X-Message-ID-Hash: TKWBG3L7HOCMVEPKQBO4MPXUYKQX6KF2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TKWBG3L7HOCMVEPKQBO4MPXUYKQX6KF2/>
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
 sound/soc/soc-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index 04f87e998f1dd..2fe522418dfc1 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -115,7 +115,7 @@ static const struct snd_soc_component_driver dummy_platform;
 static int dummy_dma_open(struct snd_soc_component *component,
 			  struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int i;
 
 	/*
-- 
2.25.1

