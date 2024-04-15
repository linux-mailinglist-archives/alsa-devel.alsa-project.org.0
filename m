Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DBE8A48B2
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Apr 2024 09:07:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B77EFEC1;
	Mon, 15 Apr 2024 09:07:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B77EFEC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713164873;
	bh=asjB5ymnNwfKC7/+jHCn004zMn5Zj63RB4zXXBGLvWo=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XOxIeyw7JrrHMJw2nKEQnywXv8FsS9YVdwbVaa+Xd1M+FVT/qt6mGiGtS4L7yULrT
	 s5SJjl/CzD0G7wGTKI0PpoR6ASMzFE35YJMadoSCGFv6z3sIaO/6y4SMYtTrnGjrBu
	 wZYKdFWQmsHfwXudw5ybsb56WwnlC0XF99BI/CI8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E70FDF8057E; Mon, 15 Apr 2024 09:07:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 259D9F805A0;
	Mon, 15 Apr 2024 09:07:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F894F80496; Mon, 15 Apr 2024 09:07:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A695F80236
	for <alsa-devel@alsa-project.org>; Mon, 15 Apr 2024 09:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A695F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=AeTpPv0Q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQ4dx/zJeKqSYcPY7DZYnK/uspZPNxTCggRcWiGU2syOObMYThjPY+yYQ5p/46w4H3qvTWtB/4WZZkgghp3fYIiBTPvQKoBSRmV8ZnJJstJVpJ2as4KArJ4f0dfoLUaUUHRDRjcXt1fRmMK94TxLN9a+6C+1vhgu1FzG2FnTOfbasHVHlCVbsyZoF/PDixrTV14e7ez+9qeAiY7uPbxPb+ozibfF3NjF0WtX2DijJGiTmF2+k/RfdQ+2I3VPkos8Bk6RLhRPar5WF/nqOGsZtwfdKVLnCaUyjDeMJiOKgwhfY1gX+VHpOTGnDM8yQLt1Ma29l6hRqc1uSSJwWwBrDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i62pncbv3VWogTcToUsG2UHsS7zKeidCm7kf2HGSJj4=;
 b=mN8JyLWg7AG/iaoMbGbI0wqrqKZCN1xhUaFyTlIMsxWJPSsK7altOVQ2Mp1syLqwxh8PqBvfIS9vs9OppuFEaIwDGiZAQDIYPLJOr793s1EoAAXdtWjRO2mutLwhRNRwRuyIwUoHaqU7s6x8Op2/hKab7BGWfjHC1RgnwcP4+YQLn4Kpeug05XvXy5CxzfIISxE3Rot9ZdE/cXM6FEiq6TAXk0k4Y2ni8NXFHIpXTBQorlb/vhkit/+yFTYeitbc7Ymlvq8LRQUBUR5pF9WVTMHBjoQIiFOYNSSuPB3syPWnVXg2TNNofXPmTlOWvOB6lH10anx1+Rq1VCGVIartiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i62pncbv3VWogTcToUsG2UHsS7zKeidCm7kf2HGSJj4=;
 b=AeTpPv0QgfFnunPEnvsQFD8a9TMPqv53ZMVOtysd2O+dIl4z0hpwU1eCmAB5SUvbuDeg+jxW0ngACEGHipm6Lc0mqo5OKGvkbOZWUJ/KISvtoRg0GZupBZrR9LMYG0atxJv2qJDayv+0fNCgeNsfJpLQpoU7Z3sRH3JEUZM2HjY=
Received: from SI2PR06CA0011.apcprd06.prod.outlook.com (2603:1096:4:186::16)
 by SEYPR03MB7816.apcprd03.prod.outlook.com (2603:1096:101:166::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 07:06:54 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:4:186:cafe::38) by SI2PR06CA0011.outlook.office365.com
 (2603:1096:4:186::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Mon, 15 Apr 2024 07:06:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS02.nuvoton.com; pr=C
Received: from NTHCCAS02.nuvoton.com (175.98.123.7) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Mon, 15 Apr 2024 07:06:53 +0000
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 15 Apr
 2024 15:06:51 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 15 Apr 2024 15:06:51 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
	<robh+dt@kernel.org>, <conor+dt@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <edson.drosdeck@gmail.com>,
	<u.kleine-koenig@pengutronix.de>, <YHCHuang@nuvoton.com>,
	<KCHSU0@nuvoton.com>, <CTLIN0@nuvoton.com>, <SJLIN0@nuvoton.com>,
	<wtli@nuvoton.com>, <scott6986@gmail.com>, <supercraig0719@gmail.com>,
	<dardar923@gmail.com>
Subject: [PATCH v2 0/3] ASoC: nau8821: Add delay control for ADC
Date: Mon, 15 Apr 2024 15:06:46 +0800
Message-ID: <20240415070649.3496487-1-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|SEYPR03MB7816:EE_
X-MS-Office365-Filtering-Correlation-Id: a19073d1-bcfb-454d-2197-08dc5d1aa13d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cRJ4lKGr8NbpRH96/0K1tl1fLZTOtAT0L7+DwZOIkkZpMT89GtvBvcj+2TsR?=
 =?us-ascii?Q?XC5XdmLadiY3gqOAkDCEEloF7JM/uIDm8Ba6mrzPNKSOrUE/ksKFtFHm1ojj?=
 =?us-ascii?Q?AN/zoQhvEUfo0WMsf7JpdnP8VfGHd1re3pa4i4L9vdZRXyDcX5rhdB7ZKUh/?=
 =?us-ascii?Q?dqgGMD3hHroDzJsp7IJKENUZD9sf1aoR4oilYxGR8ArjjDa4uJIgcA/YQ5K0?=
 =?us-ascii?Q?suzVCPYOshU/8408NJSYX7bSbmLfxTd+C82JwTz9QoEKV3aCi0CK/pRUgCZI?=
 =?us-ascii?Q?86pAY8GU8ieVd+bqj2qGoc9TJACnRmN7CZulqz6lDkua0mms5gdCxrzNd5p/?=
 =?us-ascii?Q?pxW4UYB0Ytc084Fwfdv/VJz6C+NviTZgUFyaOcuD6+Dcf/Bot3EonwTRVmfN?=
 =?us-ascii?Q?KYOniFPkFzoXYjHm8jMCzjrYQT87TBx0N/BO1Ee0uJBzPwCR5adeB4+u5evY?=
 =?us-ascii?Q?ST4csEXY8mN623kqUlcpZHKMponvisbmQLhm+soB3CDN3ODPKSKgOTcRz8M0?=
 =?us-ascii?Q?aohHvAgcgrntYJZo4PKizSqS+m6HZb8dxZVq3t/GQEbmaBIUcVdeCCF1UIu5?=
 =?us-ascii?Q?Pbzew6uL8ts4tDN7nv5xRB3mJHcBX9Aq5qtDzAgc7jGxj7LTG43NceGuWvo/?=
 =?us-ascii?Q?dqmOUoDKUlLj/PqaZCo6c1EtycFOF3EzsJy3ZaUi2bf6oSRUW/Biqkj03qO/?=
 =?us-ascii?Q?Vx+TgKu7hxuhFfhBtd0XvDUtObBqBGMK4Tj0IFZnkToy3brorsg9JzUeJWCh?=
 =?us-ascii?Q?31klS8tJt94TfyG1DEWEDkx4ehqh0u2HKtbAwG4yyXoqP3RtH8r2MUuQUi/t?=
 =?us-ascii?Q?d4M0S8Uw9gQwcT86VgQ1EFVFfbt56u16yUv/NrBTGzUxN1LA4+l4BJlarHPm?=
 =?us-ascii?Q?z31F0QsJ8N6O5ydOVNA//IUDhFC/j0t5Fk6ybrLWQCUp1CZAcLky5xLk+Wyi?=
 =?us-ascii?Q?q8mioUh+VHIoawlVYHthZqtt2ET3hiSlQpqPdGGif1X3PN7NkP+pdfb9GXwi?=
 =?us-ascii?Q?jGQV9MDFSNkyZd0stW/v5aENpdYZvAADNsWy7aJtv94EegHo41gmLXgm7u4G?=
 =?us-ascii?Q?rWjVnEwf+crPhGdkS7S/dn6WFGFc+if7i3ngG/BD1UJ+25TmU2+m/911FpUb?=
 =?us-ascii?Q?eC1MWTOJIYZ00g5age7INKnf7XsIPv2V7KRHQA5etwU9diFiAOS1bM8zW6z+?=
 =?us-ascii?Q?TntQ3QbHCJzY7XH+oOe5ugV9RgKGkZta26rHKVHDpPjCVt7vAd7ssW0XsBXW?=
 =?us-ascii?Q?oMJIlnbWk1DW/djEZSRS9wmBW5s2fEDN9Nt6Z6KiXeHQmFjcedhGIIr685Ja?=
 =?us-ascii?Q?0xFJ48nt+BGQnJ2tGV+/WdoON74vA1LVKewPe6GoNMzIC0hn4V45VnsIaFVa?=
 =?us-ascii?Q?OiKt3GE=3D?=
X-Forefront-Antispam-Report: 
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS02.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(7416005)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 07:06:53.5126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a19073d1-bcfb-454d-2197-08dc5d1aa13d
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS02.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7816
Message-ID-Hash: N2HVJJG5OI3RFKI4VSI2AWOLNRYKIDIA
X-Message-ID-Hash: N2HVJJG5OI3RFKI4VSI2AWOLNRYKIDIA
X-MailFrom: WTLI@nuvoton.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N2HVJJG5OI3RFKI4VSI2AWOLNRYKIDIA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Change the original fixed delay to the assignment from the property. It
will make it more flexible to different platforms to avoid pop noise at
the beginning of recording.

Change:
V1 -> V2:
- Revise adc-delay-ms properties description.
- Fix examples of bugs found by bots.

Seven Lee (3):
  ASoC: dt-bindings: nau8821: Add delay control for ADC
  ASoC: nau8821: Add delay control for ADC
  ASoC: nau8821: Remove redundant ADC controls

 .../bindings/sound/nuvoton,nau8821.yaml       |  7 +++++++
 sound/soc/codecs/nau8821.c                    | 19 +++++++++----------
 sound/soc/codecs/nau8821.h                    |  1 +
 3 files changed, 17 insertions(+), 10 deletions(-)

-- 
2.25.1

