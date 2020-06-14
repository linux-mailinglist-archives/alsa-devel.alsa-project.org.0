Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C43E1F8DDB
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 08:31:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7E3186E;
	Mon, 15 Jun 2020 08:30:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7E3186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592202674;
	bh=DtprUJyYwrqOU0xAzRGzbdUt7H/pqjHU1JRImULoM0w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N1UJ70Vsbl7NCEXrL3PFap62pm7E/vCg7fHLJMwbFM9gaBWkqkZNawoAluHUp27gq
	 5nuQx78gfutkikiJUKl+Xg8UXYdJKPameAhop67Kyn/vsF2odZvUmDMvaC6bNVduC8
	 DZ9D4HA+mvqiQtexLzgZ2Ccw0XFkHy+ds2tzokyo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5DC0F802DF;
	Mon, 15 Jun 2020 08:26:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 979C9F8013E; Sun, 14 Jun 2020 22:24:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM, MSGID_FROM_MTA_HEADER, RCVD_IN_MSPIKE_H2, SPF_HELO_PASS,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-oln040092010069.outbound.protection.outlook.com [40.92.10.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2363F8013E
 for <alsa-devel@alsa-project.org>; Sun, 14 Jun 2020 22:24:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2363F8013E
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FdzgyX+D42ePb4aWWojTPJEYbg90Ohc6RNrZJsa5z92QKdYXTWAHELzlMni7tbcbYrD25DR9SHuDK1NIQ2paUGGJH9yNwKZu17f+/Kig4HwW/qN+oTv3PEPhHxkE2mdM3s9TvTaIWvy030UxTuyzDUpXTTxnCVkvgy9VRdT1hxww0NtgeRQ8mI4q8Nu+Quv90JJY9KuCqvrmp7t9+tT15ReM9BPj1DRlpBce6LhNvtjyCTtDeZNv0xH8vZ1dPVGerdFjrVRO3MEA4HkPP6XD2VL8fYq7mn1R3GSkv2gEBCwysVzjOImrBx4JZuBUX+YilZkSZ6jVpWv9i0zuZxM/2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9JpVb8HDdgcqZbpgEag/+JakOsfoHvg+7m2Yx0i+PY=;
 b=cekcfv3624ANlsaXY7CkEMiZ0MIpz0G5o2JceRL5tD14aV26nndFSoOGZy9wdaSnrloBeXWJchiX7211E0hirL0UjRbXGNrgjcdor6oq1toD8/PizlaQ07OOU8jWLXBwuzo41uNeNuyXoF/MnOgg5Uq/nw17RQlgbW4Vew0Cn0i48Vg+l3M2nSAaiuVwhojVOnXVtA2HewIDE2WyTKka717fa5D6lelbLAURUr4iq0m+1LZSln3w1Vss2seOnMEm4JZDfVNbzTz1oqaSLVmPjWMEQfs235AhUZraMC30OGcw1pPKLx58QIv170UaET9NRvsfEKSEqoaysEPLJuDhkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BN3NAM04FT037.eop-NAM04.prod.protection.outlook.com
 (10.152.92.59) by BN3NAM04HT116.eop-NAM04.prod.protection.outlook.com
 (10.152.93.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Sun, 14 Jun
 2020 20:24:34 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:7e4e::4c) by BN3NAM04FT037.mail.protection.outlook.com
 (2a01:111:e400:7e4e::196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend
 Transport; Sun, 14 Jun 2020 20:24:34 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:78BFEF84A6F596F1C5B5510BA8F4604D3679A49A811E88309387BB4BB60024B6;
 UpperCasedChecksum:865594C9107B7BA0D54BF8DEFE6A5D00136E5E6194BE376F00481289EB99F7A1;
 SizeAsReceived:7837; Count:49
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383%9]) with mapi id 15.20.3088.028; Sun, 14 Jun 2020
 20:24:34 +0000
From: Jonathan Bakker <xc-racer2@live.ca>
To: krzk@kernel.org, sbkim73@samsung.com, s.nawrocki@samsung.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: sound: Document wm8994 endpoints
Date: Sun, 14 Jun 2020 13:24:09 -0700
Message-ID: <BN6PR04MB066019A8783D22F1C4A588B7A39F0@BN6PR04MB0660.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200614202411.27843-1-xc-racer2@live.ca>
References: <20200614202411.27843-1-xc-racer2@live.ca>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MWHPR2001CA0018.namprd20.prod.outlook.com
 (2603:10b6:301:15::28) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <20200614202411.27843-2-xc-racer2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jon-hp-6570b.telus (2001:569:fb68:9c00:8067:f823:1e15:7520) by
 MWHPR2001CA0018.namprd20.prod.outlook.com (2603:10b6:301:15::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21 via Frontend
 Transport; Sun, 14 Jun 2020 20:24:32 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200614202411.27843-2-xc-racer2@live.ca>
X-TMN: [e1yVr75bp/mrckUddMU5geJ85D0K50JNe5LUCtLwnqMG7ZmD0twNUWP923M6GIJg]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: dda2dd32-31e3-4343-abd0-08d810a0f39c
X-MS-TrafficTypeDiagnostic: BN3NAM04HT116:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ftlHKz01+M8KWQdzIL5YG91NWwcZb+32UL2crzCnb9y4uLJsrUofI8saBnwujoHUYtBnIAnOfrYrmq5zQjrXyqG6bthXKTiRxBscHPVACK/s5D9D5rXkgjVMmEej1D/CuXjGLHYTgYisQMgHEZrl1K21ON/agHdR2Eii+XdpVWd1brgBFQ+MB9k89DxdHKB0K3li2WU0Fwmqltazxyn68g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR04MB0660.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
X-MS-Exchange-AntiSpam-MessageData: HgyaJGq4Mw4MevomK8cio/8KTCHfFDAk+1DtG5pMpfHaoG0BKcKFiYql63XpgIFLq6KDmtlVKcdwFprH3SGGpWfBhLFDgc8IcxxxKrmchhSe4nUJBq4tJk2RFhoMJDgTVN6b9HSphOJTzxUnQW7a13chAInkv4YfUAsXT1Df2iup2lgKpeKRRxjIUsZUUWkV8/rBGBebKKdTnBzUT8E/eg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dda2dd32-31e3-4343-abd0-08d810a0f39c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2020 20:24:34.6785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3NAM04HT116
X-Mailman-Approved-At: Mon, 15 Jun 2020 08:26:09 +0200
Cc: Jonathan Bakker <xc-racer2@live.ca>
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

The wm8994 exposes several inputs and outputs that can be used by
machine drivers in their routing.  Add them to the documention so
they don't have been duplicated in any machine drivers bindings.

Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
---
 .../devicetree/bindings/sound/wm8994.txt      | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/wm8994.txt b/Documentation/devicetree/bindings/sound/wm8994.txt
index 367b58ce1bb9..8fa947509c10 100644
--- a/Documentation/devicetree/bindings/sound/wm8994.txt
+++ b/Documentation/devicetree/bindings/sound/wm8994.txt
@@ -68,6 +68,29 @@ Optional properties:
   - wlf,csnaddr-pd : If present enable the internal pull-down resistor on
     the CS/ADDR pin.
 
+Pins on the device (for linking into audio routes):
+
+  * IN1LN
+  * IN1LP
+  * IN2LN
+  * IN2LP:VXRN
+  * IN1RN
+  * IN1RP
+  * IN2RN
+  * IN2RP:VXRP
+  * SPKOUTLP
+  * SPKOUTLN
+  * SPKOUTRP
+  * SPKOUTRN
+  * HPOUT1L
+  * HPOUT1R
+  * HPOUT2P
+  * HPOUT2N
+  * LINEOUT1P
+  * LINEOUT1N
+  * LINEOUT2P
+  * LINEOUT2N
+
 Example:
 
 wm8994: codec@1a {
-- 
2.20.1

