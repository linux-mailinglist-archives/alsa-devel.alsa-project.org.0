Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFD45B2C48
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 04:55:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A222C166A;
	Fri,  9 Sep 2022 04:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A222C166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662692150;
	bh=hr1vzwFDGz8/YNCPl9mSE5Es+URjFQd1lplSeFFLei4=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IIrQ0iW/52keToYIaJ4mfYxJf2d43vlo9LuO/LRpXMKnRInLHy/eMpz50edfIrQqn
	 WeD3AQkB0GSF9+yFSSyIkGdfiTBTHvoqD6IFQwEYbOO4DScg6mkaCn9nhgT990s2Mj
	 59Mr0g+eYfVrVz+xVnaXINHLeYX9c6AmPmqYzURA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D411F80105;
	Fri,  9 Sep 2022 04:54:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7EB4F8023A; Fri,  9 Sep 2022 04:54:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2118.outbound.protection.outlook.com [40.107.114.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D5DBF80105
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 04:54:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D5DBF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="jgmrVYc+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DrbcB5ZxAXFRUUkzl16lp674Es9yYsWCbE1FVOy17BKv654WgmT3wm0smSJN27/ZIl2iX31wDvtjmJgqUFJ4+QGRby+cWqrS0vMjRoaOsqKVgfc/qzayq7RFM3gMT/bdU+uBA1po8gylfxbjX/ry60pb+UzEkeqWiiX01C+pSUWjZEIS9HqUOhdU3F/ErGKbY7W18TfD5NQ19D5rE6eisWjTmO2YvLsvlEtx6ujpuffIACCg4RwPxKz6Z8O+fhYFFI1AFvTfrnrpTqWvlV0FCtpI8bunVCCJ7tJLrOE8bl2lW0glTKy6dnge0q2xmNlTxYzy3A9tn9XsQPVJ7HDeWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZohSThGjxO9GHJE2HNY6GWkLLoDWmJ1aHjshbs7TAhc=;
 b=RchbgzSHZsznkuHjqHC2Y8UKp+P8hNOpSNHqpo0v9hb8Ya93kJbuvLiNAsckPyjsAim9aXNuVYnYnp8WXevjpHB1QWHCW8nQEit+nhG7FAVQBimzGxKgQVF/woEYmK5XaXLbTow2nvC/29xKdpm7HYG0tKBI+y1ZvSZXL6X2GPjnnRz2O4o/0T5H+IUUXBjVkDD9wCJZ5waiFcuj1b9u5kDvRHfHoYeWFSzuQFPZ6S3Y7/RjMDAAgq4S2D6a6t3i7HL3uoLcvxM/6EwqPawu06vNri9FjHo+I/pvn25Rei0/MqH9SYi28EgO8prZizbUWUsXA6LNjkj3MuDxZ2ANwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZohSThGjxO9GHJE2HNY6GWkLLoDWmJ1aHjshbs7TAhc=;
 b=jgmrVYc+7mgOF+CnVsiX3gubJtBurg7XTTllhRCbo/IVRdR+1V+wK7vEOtptnXdtMBq1OcPnPfXlgq9tYRhAKRQCtvDOvuQK5CXhBh2/z8LFFnXydnUkFONsefzRIW0+21Sp2y68pRwTmeB1V7v2aL++lrMRA9/ZBPEwVLmCbPo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6045.jpnprd01.prod.outlook.com (2603:1096:400:48::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Fri, 9 Sep
 2022 02:54:34 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3%6]) with mapi id 15.20.5612.019; Fri, 9 Sep 2022
 02:54:34 +0000
Message-ID: <871qslmf4m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: ak4458.c: move ak4458_reset() under CONFIG_PM
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 9 Sep 2022 02:54:34 +0000
X-ClientProxiedBy: TY2PR0101CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6045:EE_
X-MS-Office365-Filtering-Correlation-Id: 366c21cc-6ce4-48f0-4af5-08da920ea02c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rx7KJ+TeRtpOM5Nd/FQMmQqUOB9rAM66qITFJb4VEwvUo16xImbenYkjr+/vfwpIdYA9pJtWd7YkwY5+jEnkBVnxm2ak5e4FaRNKYEptUuZkc8Paztt1O7QtpKhrgHNyh8xEeOMuQ63Z2Ek0cqdH/yoheGZYCd3Tcc75D3G2NAyzagLZxMndmZPtM2NMlGN7jbfk+KgbxDYvTSDzWVvz11IZPXdS6vB/4qEjDXV15ChRnDYZjOjB8mq7P0SJqXNEfcW6dL4eX9AwEU9Yzpm8e3moiB8pcWIgyUvJCIAPuhsnwik4RLI+92zT5sDN/9Fmivn1GM9FL1f+MHgKVtxH/upzqST2zZDEcQbLRp+5Ew4UiUHNhhGytfGRHuDqVM1DsA2p+q8VcuxxlVPBelK4xwb2cBcGGht4agIXLuHptPK9XRgZs920HHY/oQ91UWyaKoykMBFOVNHEv/W+4VB9rVvCpty1gMsHIK95MRRUIhnpqSrlz9DAdwcZVvMjqy+kkU3JbC0mcHhCZa/miHCe/Kt/1SwAQmZoYsPQ0Tkse7xi+1CEJ8Ou7GIfRXrPNF7fBAV7UhqJ5wRlBTFAqg/c8clVCRCENOX6OTEzZaAZxxB9C8BCtjWp4l6czrQEzQ4M0Rdvxet2l3lTVvATOYrdOrgo0BvIMKbWAWT0vsTr6aqNvUvACEJ3PhSaYiZgbLxldtVd1Yyg5zJ7Fj90N0Rhm+uHutUCXqM66uyaUgRbaRXlNyycDh8tlH7Q4l9LNt/lcN2eupJ2hGBLR9BEN5/SCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(66476007)(66556008)(66946007)(36756003)(316002)(6486002)(110136005)(26005)(4326008)(478600001)(8936002)(5660300002)(41300700001)(6506007)(52116002)(2906002)(6512007)(8676002)(83380400001)(86362001)(186003)(2616005)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tijopsa9NdSyMs2tuiGMbCmIGJqKDSxe8g9LWBp6sGwz1/lsa7Za/YwZaB3E?=
 =?us-ascii?Q?F5G/+4AZ3BFbnmigUkBMSVGy7SZqe1padhVJOBlpc2jsgCLIqo4MLAFj+QI3?=
 =?us-ascii?Q?bh8h0B6hY6iaQSLtJG/LFRJbxkwuu7dqWcOMDDoDUWuxwfaYlhm8SSU1A7f6?=
 =?us-ascii?Q?uvCt9s6+JVswQRMi+G1Z2xBGf5Mv27UPi9MA10SWuKFICPl6lRAjF1IH0TC/?=
 =?us-ascii?Q?fUvE9nFJSQhuA8VumRgJfAi39yMedVicHSElESUiiQpMV0xpF8CZ6Y/BIBsR?=
 =?us-ascii?Q?7XhmtFrJaxbG2XRIO9AwEIqYHKlyYG0NNFKhCU6uuYpL6WFXHl3ulP0kML5u?=
 =?us-ascii?Q?MnuL4YF0KSCEPZ7Cvbmoqh6QmdZJBM+kwBS0ea2ezNRRO2Lc6K9/j6HPVsfV?=
 =?us-ascii?Q?E8nQqvwAeIj86MN5Hf1OYFeadAyN+5onHIEoi8oDej/TdwxCfIBh1GhYLAMW?=
 =?us-ascii?Q?SJ4sCM+KcdmdXb3Zh8YA+Pcdw9G7MNMBS+Nan5Jae2kEK/Yya5h+K2TSDgLn?=
 =?us-ascii?Q?MafuCXbbg4MqXqnCUaDf/LI/BGzrgO2nyEGp+QXb/tjjdZpTNZRuocgwbEo1?=
 =?us-ascii?Q?FanzBEjHpe2rdng3c1lIFLrh/LMXalvbDsrNKXQUnRgZCZRUTlo3BN/nsn8z?=
 =?us-ascii?Q?rNLvGRb7/i2b14OaaxkAl+9T/Zkqlf3BGN3n3rsGwDX72BMvc5ZmFnXGPzlv?=
 =?us-ascii?Q?pUKq6WaMkmpc8yz+KKHnqem8/Z+wfmcwXTHW1/dgqYud601Ccn3xS91G1K+A?=
 =?us-ascii?Q?jNoN4ZlBIbEWo6fjEAGSr1Aq9vUKSYk3ClJgF9oKFLxEO4VZUHY/lSnR692Q?=
 =?us-ascii?Q?cHL9MVR+9G+wAEGCBEVARXuOsB6h+AhJjYF/wbEjqdzwhIcKfyB9IpsTfdGD?=
 =?us-ascii?Q?w2uuFCYDMnKNaTdOnKBr9GWtmAfEce7NK9Z+qhME68GyaNhktlXOULaptKpE?=
 =?us-ascii?Q?Wcevm30TFePjUbsCSwieA/XmcdOld6/olW0HP7Rsoodes4SYqKWj0OyV13Yv?=
 =?us-ascii?Q?gsEuag1KO6mA8UTr7FYVLJlkwabnxU/08vERtWUbP40OAN7HBYcIDF3tXZZN?=
 =?us-ascii?Q?GqnATGPWM+xcU1vgpciwjth6zBSMwUS8EfDmbgWDDlyqK5aY1JvuHOcCHd73?=
 =?us-ascii?Q?Y1l3abeBSamyY/JhECbt2j2SNrOHd+CdsLy9M05afO8kU20e3t37CaNfFJDV?=
 =?us-ascii?Q?Y/6tI6b3De/SG9IuS7ywhdx6ySY2Via4iV0RJctHZiFAM4DojqhgGS8LiyGI?=
 =?us-ascii?Q?YOA7Hfie1yY8moYq2UYOC7hQyqxRNdEoGTedpz2IzSvoZsAYOD0qbgHsw76/?=
 =?us-ascii?Q?Ax0exOyrsl75PGAQ7O7tem0aNNIucrSxJU7Ob0oQynuI69gwitC+zmrf+TcO?=
 =?us-ascii?Q?flxQ2fwU97DkHFXLfoqAaWlI906qRX+wPCvKEUBQ8jvvaYC4kDj9V0yK0KC9?=
 =?us-ascii?Q?iWvz95hMyUA0OxiVx1bRTsEDJgifsgdDvOsDjeuZFR70ROV1k5wNnTw23R1l?=
 =?us-ascii?Q?0/i0YBU43XCFJrti2WDd5C+nEdbpf1ZprT2IUglW6r7yBF6UjEs+gXErt06s?=
 =?us-ascii?Q?J3I88bAkTidgjAqNsfwFfJW3A3ZVlSswSg6eopYQXLcYxtP4KZXi42QYmJqY?=
 =?us-ascii?Q?eNlNonlg/MxWg7VfIPlRHRE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 366c21cc-6ce4-48f0-4af5-08da920ea02c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 02:54:34.2050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BIvUIoCG15q8IH8iPqvYYI/MUekwGlGBoTLpbWfx70ERkJW/iYWjfNc9DBfnL7MA6US4NQ6Nu/cJWZuT/NhX0G09r6wNBDftsefWqxTB0Y8n+mWR9lRmhEezCDdpyJXY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6045
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This patch fixup this warning

linux/sound/soc/codecs/ak4458.c:631:13: error: 'ak4458_reset' defined but\
	not used [-Werror=unused-function]
  631 | static void ak4458_reset(struct ak4458_priv *ak4458, bool active)
      |             ^~~~~~~~~~~~
cc1: all warnings being treated as errors

Fixes: e9e7df88996d64 ("ASoC: ak4458: Remove component probe() and remove()")
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ak4458.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index b534212096ee..4735aae3bfbd 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -628,6 +628,7 @@ static struct snd_soc_dai_driver ak4497_dai = {
 	.ops = &ak4458_dai_ops,
 };
 
+#ifdef CONFIG_PM
 static void ak4458_reset(struct ak4458_priv *ak4458, bool active)
 {
 	if (ak4458->reset_gpiod) {
@@ -636,7 +637,6 @@ static void ak4458_reset(struct ak4458_priv *ak4458, bool active)
 	}
 }
 
-#ifdef CONFIG_PM
 static int __maybe_unused ak4458_runtime_suspend(struct device *dev)
 {
 	struct ak4458_priv *ak4458 = dev_get_drvdata(dev);
-- 
2.25.1

