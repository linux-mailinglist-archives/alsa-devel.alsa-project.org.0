Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D86781F8DD9
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 08:30:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89307165D;
	Mon, 15 Jun 2020 08:29:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89307165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592202636;
	bh=YMsIR1eDgxeUwM45YZ+Sm1UA1uOphFvUxT+8BekQjKQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bjkMQ3QANkTAhNJRFVQkF5S5McgO6fzbknxcP+KZF4qtzHtcAGF2AWvaK4+IursMM
	 5TlPQiczX8z0BOZR8EzEljXvZaf8T9oemc12Edhz2ykkyhih0Q5AK2M/VFnBIXvZKI
	 YK6BlwgdZl4ECdr2kyBU3XLyNvApay8cwCVveTdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6710AF802DD;
	Mon, 15 Jun 2020 08:26:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7FB5F80232; Sun, 14 Jun 2020 22:24:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM,MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-oln040092011060.outbound.protection.outlook.com [40.92.11.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0455AF800CD
 for <alsa-devel@alsa-project.org>; Sun, 14 Jun 2020 22:24:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0455AF800CD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J35/XmU30mkD1F71xGfnb0Ajb4bZ0Z4XdtLYQmfYyhjoqLIZBkY7szMbSbotkkkk8zhRpppVyEPhISU+kKLrkxqoOeJjIOOBdoEL2IF5yZWEdQiT+xHhyNdeKwqemCYg6SXQceCh0qG/bAF0I7PwmG0wnNMRAxDLUkeIjdyZIqpU3XtA8NqcmUMeU3cgarpJXhW5kJxfY8N2b2VeoNp7277AkjDj+avi2FuvxBhOiMlU6hzBULMffIPwQPBqxM2+O7uGDQdgE0wXROoeyIgykVmnlZZINVyV4h7p7LDNLHI85bVtyzZmeWz6MemVntnWiG6GPt890pn2Sz78IUAYyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcZ3wF7a1vkw2R3w3FS0u2qCmCrGsFY7IDh5w6tr8aY=;
 b=k5oLik+VhHYiM3+GnYSjaRu1xIklpxPID3z6KJdhBNrzydMi2R6fKonV6VZlTUS3MiWKhPZflJgI+INpDtuERbH7+OZMFq4qXumPCt6Y1TKx9hNA0FammvAGA1nN4iR4SMbaIfVAaSqAMRhdULuzpTX0bJCM1cCh/nKUHDIDatPs4ru0wXFfxYz90WKFounJ0HXvSKVLklYCVpyWAL3mFYoroSKy56BSz3Dy+GZAyq2RVn8yW22PsivjodO8O0LsShTZXQZqjyU/DNV1mkGb/ci5RsH3snTseJxs59YV6k5wEMyy+CQ8OZyRMHfIqVgkUQk76Zl+WERpcoJMNJedZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BN3NAM04FT037.eop-NAM04.prod.protection.outlook.com
 (10.152.92.51) by BN3NAM04HT047.eop-NAM04.prod.protection.outlook.com
 (10.152.93.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Sun, 14 Jun
 2020 20:24:32 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:7e4e::4c) by BN3NAM04FT037.mail.protection.outlook.com
 (2a01:111:e400:7e4e::196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend
 Transport; Sun, 14 Jun 2020 20:24:32 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:6C80D74A27556BFDCEB85960F601F64E9E541CD70CE542BC54022981E99DDB24;
 UpperCasedChecksum:8A6B33913D99C5A26AE80D07AA0B0B5D676120C4D5D2A4A8D880622DB4CDCB8F;
 SizeAsReceived:7752; Count:47
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383%9]) with mapi id 15.20.3088.028; Sun, 14 Jun 2020
 20:24:32 +0000
From: Jonathan Bakker <xc-racer2@live.ca>
To: krzk@kernel.org, sbkim73@samsung.com, s.nawrocki@samsung.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/3] ASoC: samsung: Add machine driver for Aries boards
Date: Sun, 14 Jun 2020 13:24:08 -0700
Message-ID: <BN6PR04MB06600BE1873A046B15997B55A39F0@BN6PR04MB0660.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MWHPR2001CA0018.namprd20.prod.outlook.com
 (2603:10b6:301:15::28) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <20200614202411.27843-1-xc-racer2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jon-hp-6570b.telus (2001:569:fb68:9c00:8067:f823:1e15:7520) by
 MWHPR2001CA0018.namprd20.prod.outlook.com (2603:10b6:301:15::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21 via Frontend
 Transport; Sun, 14 Jun 2020 20:24:30 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200614202411.27843-1-xc-racer2@live.ca>
X-TMN: [Y/ozhho4lx2yyaLm93DhevL2/9Y17Gk+S3MKRk9IL0U5jnyyzZDp/pz9Ww0MaZcj]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 244e4131-3344-4f21-2cde-08d810a0f23e
X-MS-TrafficTypeDiagnostic: BN3NAM04HT047:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RxDad2qNFApuXUdyugTUG2gQUxVUx9dsxNdpoZkKhU3soEuzJZxuiPz+WdYHpQyL0GIMUTepSyE5PrPImhGRSxbqAys0LqTAKrywrg6WtrOcTq1YH7aSTJqbYjARX1xlti+crD7IEsywZmNNmbQht3aJpoIz5Wovsh+GfbI90JXhYtSoJXE1gvsiTxOuIdjKNVgQ5VHICxlULjHBKscOdlyzDczb3wC/wIqJIzO40IvCJSWSe+s4VeRT+LIbw0bW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR04MB0660.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
X-MS-Exchange-AntiSpam-MessageData: LCzcBroy0Ldtih33G+a3u5P3ToFEvFJ9SB6fIBrJgaedeZi6WmICdo3UjqSbogGABrH/CuvbSJsD+o7NUMQxKnfe0PV5gDQfXgMM/uwTcXHxzYYoxiZFQ+fKpROTVaC1QzKCKjSmpu2bUzOnZnI/RcI/5kD3MHtHsEAaMQisPGlis1WNxM4FKRVXbTpE872u2xrowzay9mO5Bnc8ahpT0w==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 244e4131-3344-4f21-2cde-08d810a0f23e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2020 20:24:32.6544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3NAM04HT047
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

This is a machine driver for Aries boards which are based on Samsung's
S5PV210 platform.  These are the first-gen Galaxy S devices.

It consists of a WM8994 codec connected to I2S0 along with two
codec-to-codec links to the modem and the bluetooth.

                       ---------
                      |         |
                         Modem
                      |         |
                      ---------
                           |
                         AIF2
                           |
   ----------          ---------
  |          |  AIF1  |         |
      I2S     -------   wm8994
  |          |        |         |
   ----------          ---------
                           |
                         AIF3
                           |
                       ---------
                      |         |
                          BT
                      |         |
                       ---------

Jack detection is relatively complex with various GPIOs, an ADC, and
an extcon device all involved.  One oddity is that the headphone jack
is shared between the mic and the analog tv-out and is controlled by
a GPIO (earpath-sel) and the proper path should be selected based on
the jack detection.

There is also an oddity with how the speaker is connected.  It's a mono
speaker and the spkmode pin is pulled up, but the connections aren't
bridged so if stereo playback is attempted, only the one channel will
play.  Therefore, when the speaker is enabled the entire AIF should
be forced into mono mode.

UCM2 config files are available at https://github.com/xc-racer99/aries-hw-files/tree/ucm2/usr/share/alsa/ucm2

Jonathan Bakker (3):
  dt-bindings: sound: Document wm8994 endpoints
  dt-bindings: sound: Add bindings for Samsung Aries audio complex
  ASoC: samsung: Add driver for Aries boards

 .../bindings/sound/samsung,aries-wm8994.yaml  | 147 ++++
 .../devicetree/bindings/sound/wm8994.txt      |  23 +
 sound/soc/samsung/Kconfig                     |  13 +
 sound/soc/samsung/Makefile                    |   2 +
 sound/soc/samsung/aries_wm8994.c              | 695 ++++++++++++++++++
 5 files changed, 880 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
 create mode 100644 sound/soc/samsung/aries_wm8994.c

-- 
2.20.1

