Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B81C678DFF
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 03:10:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48345E74;
	Tue, 24 Jan 2023 03:09:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48345E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674526215;
	bh=vBTOQaZ49F6ANUXrzwapNKExAQIm8jWSCaG1V/yTnVI=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=j8W3S9S5N5U3vvwewLw+1UO1rdI2QrErCIcUsGEwxrjYJCii9Yw3Vaph0a87JUr0f
	 kaOql89mh1H+u31JOrY3Zu29IudxwIF/hIOhxXBgKEFcmvCcYyQTXP2/J6arQwdPv3
	 IbFtxWADplCj3tSEbRasmOF5pKKSbnV+Ga1kH4Hs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F9D8F80563;
	Tue, 24 Jan 2023 03:08:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 715ACF80558; Tue, 24 Jan 2023 03:08:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2099.outbound.protection.outlook.com [40.107.113.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D281F804D2
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 03:08:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D281F804D2
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=b2qw3pxt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bb7Idy5gbGVL9r5Y2Mqga7dlpkjYC3X0aVLZf4R2lbU6SiEvR90Fj/VEVEPzbs5TWSpylqw31wPcK0hJViqL7R2F1t04S/rlubD9gdYAtUjUdgq6VV5FHQEUwkMk72n4ZSKlsCdKOGD1eUmTivLE6KdxRoZ/+z84Q7AxVKazEi2Q6leoW94ykWCAlvRr0QleOHQN59lQ6VYPwedmeTlkZUHJdqJ7tBTi95bUCEsn3YREq+tw/+pjrD7vDYzp3sA3YGE0InhTafEVmCYbAZYbogg6g27NuOhfwvehWxedqHXWXDkRG7gj4prU1afhS1fKe9HpgH7eZFpS8wcRHSRT8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/fZ75kVDHBU1wLcbZHXe1AOntqNjN8UwMjt0c1H/XI=;
 b=FpIaWfdwdQ80Ir2BmlfbjaNBsPuuYOIAmpsC/hkgKxqMiRU4iXzha8nZC7YO7/o2738rZbcomqAsITBD7tTna7ZDNsEMQDGyeBiAxp7JWpzwQL0+DFSDAT3687B4K9q6jXnq+DmfUpwM0Rne0GODZ+gtWPbekI+nKhFliXvVNemBdBJfIEs4pPAU0vmblmf28Csr4Bi04Vtn0rKMjiblc58zkgVpj1GactgtB9XYG5lv4zpV9D1OckXJVmpxwqSMr2GwhQAu6m0pmsLlwh6csTiGvj4t48XXUvvzvGW3vQRzRBw3ssMehfIIf7x+CPEwp+4s9Zg4fzbLuiZkU+HIkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/fZ75kVDHBU1wLcbZHXe1AOntqNjN8UwMjt0c1H/XI=;
 b=b2qw3pxtgw4CCCUcR9pkejVStu2kcB9xRNfWQZCgJvk4OCAmOqnOITqlSTvxW3OOzqL4MHRg9z44Z48fxYM2c7sOeXWqGnQ9szMR5SgnD9j0d62C0rCiC415HCEL79KUEdYbOou7VZyc89SgOG7SLeOfadC0jAfymeMl3KKyY2o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11738.jpnprd01.prod.outlook.com (2603:1096:400:3e3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 02:08:18 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 02:08:18 +0000
Message-ID: <87r0vku1ke.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 05/25] ASoC: soc.h: add snd_soc_card_is_instantiated()
 helper
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jan 2023 02:08:17 +0000
X-ClientProxiedBy: TYXPR01CA0055.jpnprd01.prod.outlook.com
 (2603:1096:403:a::25) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11738:EE_
X-MS-Office365-Filtering-Correlation-Id: ee4aba8b-2c12-42ee-8ae5-08dafdafdbe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OkVSrQhqEkvXAvj8uFxLUrXhZvPgxXqCL6lPcyIzP9/hf0LNDTzZzgn3S8bNndngmha6DZ5M2mpdLgHVJfSjZT5d17Rv0NqBIiNqvrWz/31F57Fv91pGInK0iAy3b1iDrgjpePE4leXGbiUmoBcakAkNlkszKMxP9Qwwq+iUhaodKWwt8Q6mk10cqKA95iXhIXAet0N4ybv2m4dg66K98JZbG6XBZfKy5b/LsRX4DHVfJD1WNqfHkWPQnHsVAoFGIuh182VFqDrMKXyE8AxiPmiq9XYD/9p9hYa4Ya3UbPcCDBlxuXSh6DJjg/Zcap3cBSx9mV8AtUBuoKkSgMXW2419BKSU9wgLpPwHy5ok06BAl5LYaY1p0n3eAwtjVYk7uvI9GOoB3pU0azGhaqvkO3JpbSVVA+Z5C85yFNzo7gZ081kjBvPztyFYCCxP8bvuHP/bh527WY0f9a4gn07C7+xawASOIEEIiLIT+Ws3roDrqrSMG64sd5V7ha3c8GKV7FL6HY+nQVHCQcn7+ttM3Vy1nABtE9tH9DIxe3/8f2iEUMgUbansyVrYjsn9RQIphk02PX0FT6bjLQ/FsiigXUzLDCkI3T733jLIsVxhOnBuKdGCzCcS2vPSyylDmxTrb2sfOIC+Bm7KF5i+WxL51MHakXApo9jlak6/p7AmJVyHGIwNyrbXBKUOHnCufnL5GARJ4dxajuahHLcshqUjHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199015)(86362001)(36756003)(52116002)(478600001)(316002)(6486002)(4744005)(5660300002)(2906002)(8676002)(4326008)(66556008)(6916009)(8936002)(41300700001)(66946007)(66476007)(38350700002)(38100700002)(2616005)(186003)(6506007)(26005)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FtZTD22O48B2Y9cMYgmQ/W8eydM6AThR/hIe2ePJXAuL/XrQBLUimCWcQGVx?=
 =?us-ascii?Q?1MlbCaY3uUHCmqTtBWEQoeziPMs+j7ax9wQrwUU0NeWneywOMnp+QvYp4Uug?=
 =?us-ascii?Q?5ztew9SuDHt9z6psTTm+9pygDm1WI3Yg3XnJh1duE+R+q/3ZJFsmzZb1O3gq?=
 =?us-ascii?Q?i63pM6CyTFdXqoAgyUomEr0ntPfQc6qXyO1zpFbbG+Kd/3GZ7pZTK5T57Vrv?=
 =?us-ascii?Q?V6CBZM38fj4cD0si+ssYlNo6BW82b6OwJWdgf1ZjI+yf4OvsgSDNJVFRe+Po?=
 =?us-ascii?Q?Z8OYkvY24XEDuzN+Va5d/p20Sf3MsljlWmLJdAPthGLQUrblv+KVGMn7DkgK?=
 =?us-ascii?Q?nZrtTKCNDhMEx5zjx/s8l0dN+DZ0wdfqD4ubzblsLimVaTa9XXKxWXE1ZvGM?=
 =?us-ascii?Q?A5GN7smdNgL1u+uTJubLk65PY6YqTA3aQHi+g3LvHkjmGM2ALjuKFBWU2pKc?=
 =?us-ascii?Q?HFGXE2DXG2WMBkcE1pr1sLRnMGxzX/hN50TtNMjmVo6nLe+rbMpIZgHqdRCY?=
 =?us-ascii?Q?Vs7xfk71qWdruvtPsoLz/SYElyVsjmFLC0IKCd7ETqKuYot5E2wl4o4OZ8UN?=
 =?us-ascii?Q?DqNbKhyqIRo3ER0mDROnM/F3q2OvTrzA6jKIZTcR34AGdKgWDKhwi2MTGTFy?=
 =?us-ascii?Q?m0HMka03jAMN1nT6QTWbbnnpEo92eT8NPXa9AF47h1RiCJnIWrtrmSAyNcUA?=
 =?us-ascii?Q?5jfLpxxRMpX+XyUTCWk+H+5efYRFMuX9f/62hqyYh5TrzaUGV5ZxEYzNw2gV?=
 =?us-ascii?Q?7B3tNXRkqjJ/9vRr/tI6Y9KZtkgwZ3RBv/gqUly+ZHmG2hxPoSUO1paTp8oC?=
 =?us-ascii?Q?sj++01kTqpRAvGMZeGAOavlRdtJ7A0D7oZw/04sRKKt8Rae4WAajI8QX8nDM?=
 =?us-ascii?Q?kwV66z13Gg7KikE+bNskbNdyu1d3dSGdqZmN1sD2mMcjmFZK57mYUq1AUX1W?=
 =?us-ascii?Q?HkTCEVwl5wnF/HkIcKXHX664Sf+KWcMQUPUTowilNJMpgKanHMNDyPv4cGWv?=
 =?us-ascii?Q?YIeb4LZi3I2inLIPwQMQRxCCVS2C50F/a5UNwNqLM1yGuY07E5qzvr5fN21l?=
 =?us-ascii?Q?3eug49jOWWfmh8J4gF0UNHUtdhxTwPocotsQWlsAuuPXMTkHNLAEFG3pUgka?=
 =?us-ascii?Q?t5JjrsmSy6377vigAK5+2i2mChtyPhOT/YCnWHfKF2OygPRWp7/q7IsLv8ok?=
 =?us-ascii?Q?Rhv3ls/1J7h0IYcOK2/+ffD/exNfDjxHU+V2xYf4/tvaEt+wm5kUlBycHuu9?=
 =?us-ascii?Q?7yuXzzCXctMblznx3sazOdTqvmrdgifj2ZDMYjGMEEpIGeHvZbgS0BMiNFu4?=
 =?us-ascii?Q?vIIYCqr55UckD0ApJPwIjltCoQUp3kU4PT4zqxKJR4dF7lpNBoUYN0wFqU42?=
 =?us-ascii?Q?U24F8i9CBkBmcnusLpOZwZelHg8X0HA2yC9Ozz9Z/R3pSddxOOMAfJpaZRU7?=
 =?us-ascii?Q?QIgPRMebfrHquE0gMA4DaWM7/aS8dCZKrajRuqsMo0UYPiO02ZMpXpsIXTRT?=
 =?us-ascii?Q?HJFsoLgzzdjkwMgpfCt1Y0PNRxUpHE8oTA+5AxOlakw8V68eEUfUQpdW5TA9?=
 =?us-ascii?Q?uAx4lc1EF/33EWnTcGEGqKMJuRaeZrQMtzqN9EJE8nXjP9QtgJUbh6DDukEG?=
 =?us-ascii?Q?OLcM0w8FQNuahIH6WZTuvVg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4aba8b-2c12-42ee-8ae5-08dafdafdbe8
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 02:08:18.0163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v8T51VzP6V71IYkjp/8Sq+Hx5+3xwNVMzzcJ6auRy3WYhvsIvYN6IJMQtTF2vl2GuEDbclxbni41d3COhnasuGR6uD0V47UOzkSwyfWPXK+3QV2h/80lQC+RbfZwEGyC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11738
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

ASoC framework/driver checks whether card was instantiated every
where. Then, it should check card pointer too in such case.
This patch adds snd_soc_card_is_instantiated() for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 37bbfc8b45cb..e58b43b5da7c 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1052,6 +1052,12 @@ struct snd_soc_card {
 #define for_each_card_widgets_safe(card, w, _w)	\
 	list_for_each_entry_safe(w, _w, &card->widgets, list)
 
+
+static inline int snd_soc_card_is_instantiated(struct snd_soc_card *card)
+{
+	return card && card->instantiated;
+}
+
 /* SoC machine DAI configuration, glues a codec and cpu DAI together */
 struct snd_soc_pcm_runtime {
 	struct device *dev;
-- 
2.25.1

