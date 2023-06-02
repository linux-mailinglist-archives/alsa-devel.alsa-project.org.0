Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B4271F92E
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 06:13:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F136F112;
	Fri,  2 Jun 2023 06:13:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F136F112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685679237;
	bh=NG2BCgGLuS2n1dqO/mPWXWBzyUGUOW3yp7CaA1poYZo=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=q5iLMKkEfy4Jx1ErF9z9bDo/CvTqKu4yxQyWLNtVgVXrsG+guwL3ZJwnfBM6sVIHu
	 XQClFeCj9l5rGTl9tvN2+3bff+WLHkiEJIHJJXTfjabxpbAafWjqyC0o0tG+MpBKVS
	 OlOf4KCBxYK4zfDd1YAjm/UrkJZsLdhsDHFMB/wk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AED5FF800BD; Fri,  2 Jun 2023 06:13:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36DB1F80544;
	Fri,  2 Jun 2023 06:13:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5F1AF80548; Fri,  2 Jun 2023 06:13:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C02BF800C1
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 06:09:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C02BF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=BFrpyLK5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2hS1kT6DcbkbSxnQSYfiTCchajnpFmDweutlQ4bIz0nHdkQ27hLEh8KsWskYv/7Ik+GCrCrAFvITTmO3Ukm7R+1wHY+nitctWrD/FQ/CiBI6L/rGhw+LvDSnyCl1f3oWmUrnZHRsu15BIfWdKTtaQ2Qmaro3MAiw3Z/febnZKlf+S+oKA/FJRuTBTZuCEpNviDHcQsJR7RvyZnXxz3fATTGdl1rTMjS/402Sw0qcdX2kbItWYX7sPtuFw7t1DdN88UkzKSKp2Aa6gfzDGbecl33W/xdoyDP8US+HUwWBGHmLo0RBfj2EHA5C5XSNyF5Ba9UPfaBmbiHvMLC1JmGsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDpD0mZI36DkCbqGgaFT38jDo8+kAWsAqxbWkp4/jn8=;
 b=nNvrGUQz5BKepX0AMzrffpqqZwfsrtWiWyQku9TL/Wwh9x7W69MY+E54/K9xlxVTCsrI7PiaH1/b3WINrbrkIDNC6JVjQHDlBElH4wNdrex831NKRZTgkDkgnyNVxuy1R63w1o4J+SjG770Ralvfi+MZX2l8293/UQooNwsEc+Agim4GiwjRFeBIRx8o+6oGqooCRe8h2sVWS1nbtMRswm/M+UAov4C1i17PQSTa6+fLJ44nT/QyuylN8anYMBEPPQeu60QEGAHjdf6H7CbhE39OfJ8QLxy07516aAP68iw/7O9FK0XY/YX8ry0HSDzNDgYYX9MXYY0Al1weNMGC1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nuvoton.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDpD0mZI36DkCbqGgaFT38jDo8+kAWsAqxbWkp4/jn8=;
 b=BFrpyLK5w52+ssbRWXxeCzlS1F9LadARzB7RYYzJgF2DzpmOIWXDKwWCRp6ENGWNL0wPUTX4xYKPRStw26PPdyED4/aeSGw3pnTzaQ+4TcrFmKhsSIJ//qWbgUrj+2A3kwqM+80w3FnRWOjpUMQGZRGVy57hPWuFPr5rKtlE8nU=
Received: from PS2PR01CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:300:58::30) by SG2PR03MB6326.apcprd03.prod.outlook.com
 (2603:1096:4:176::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Fri, 2 Jun
 2023 04:09:36 +0000
Received: from PSAAPC01FT049.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:58:cafe::3d) by PS2PR01CA0042.outlook.office365.com
 (2603:1096:300:58::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24 via Frontend
 Transport; Fri, 2 Jun 2023 04:09:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 211.75.126.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 PSAAPC01FT049.mail.protection.outlook.com (10.13.39.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.24 via Frontend Transport; Fri, 2 Jun 2023 04:09:36 +0000
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Fri, 2 Jun 2023
 12:09:34 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server id 15.1.2176.2 via Frontend Transport;
 Fri, 2 Jun 2023 12:09:34 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<YHCHuang@nuvoton.com>, <KCHSU0@nuvoton.com>, <WTLI@nuvoton.com>,
	<SJLIN0@nuvoton.com>, <ctlin0.linux@gmail.com>, David Lin
	<CTLIN0@nuvoton.com>
Subject: [PATCH 0/3] Add NAU8825C support
Date: Fri, 2 Jun 2023 12:09:21 +0800
Message-ID: <20230602040924.188913-1-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAAPC01FT049:EE_|SG2PR03MB6326:EE_
X-MS-Office365-Filtering-Correlation-Id: f03cc33e-480b-49c8-4e2d-08db631f2d90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2f8g9EAsdC3h+aUJ9u8Ryk7xCmIWbTR1WPRLumDoFHRzAR8cXEOYdH1SOhR1CFiMhw1+M7rOC25vKiKSBY9lpOnCbsSsS6ZdvTFNlTNl6xgnK40axuDANQgMlbevqxyYsSMxkuqwMBrfbU4WBEsTWoa1UhztKEF7Cu6ScFtynZDhrbcvfH9q7ilyrusDJecDdW0ditTalzwDj0vpfEKK0NVIwf2f1DyjDxMInowYXnn6OJSq94urhLjUw8gJqUNvNwhvR/XCKa0oFu4ygrtiLmvNXosi2spUaya6NKxxUjgMdNpapif/B+DqxJyg+uGd8KsRWFtjZXLwaDphr/hHyze9i/1wT31r7iYR+W6AeYs+zrWH1PazLHi7LS6SWhDpbZoxt1ecKVcHm2QSptpFCCpjgH/OC55vyVUtWkU+NSNMttoASnlbebHc2bMHxA3u5SMI9YlAYKChBxgtIGhI5Cy5upo0RStYdO4kc8TX4R48HUpV7goVfapDevrdOIGMCLg3MLd6s8hR93esqOIMPkXuiauQ4FXBfx7zqPKdFcWOn6ciSaWtvpMPQCx42PTpVa9psgBk2wEWpNLqw5zyJaGGvDhIrvB1Cyopuc/f9jc7xcLZiY7ozSAPyhodrmNoejf9Fm8pc13S16rKF7Y2BzWL0vCDBjBUIzzj0RmAj++MDlCxvpbQe/fDboHwGI1eky9oNpb8GaKQ63Op0UG7r3NP4OtbooE4l+PTey8bMspG7Osf6k0ABHM9vVrhbOni
X-Forefront-Antispam-Report: 
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199021)(40470700004)(46966006)(36840700001)(5660300002)(4744005)(8676002)(8936002)(41300700001)(2906002)(6916009)(4326008)(70206006)(70586007)(316002)(54906003)(86362001)(478600001)(81166007)(82740400003)(82310400005)(6666004)(356005)(40460700003)(36756003)(83380400001)(40480700001)(107886003)(1076003)(26005)(186003)(2616005)(426003)(36860700001)(336012)(47076005)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 04:09:36.1531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f03cc33e-480b-49c8-4e2d-08db631f2d90
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	PSAAPC01FT049.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6326
Message-ID-Hash: 773FCVZTBP2C3YP7O4E6KVAVPBRBM6BG
X-Message-ID-Hash: 773FCVZTBP2C3YP7O4E6KVAVPBRBM6BG
X-MailFrom: CTLIN0@nuvoton.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/773FCVZTBP2C3YP7O4E6KVAVPBRBM6BG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series adds nau8825c support. The driver can be used on
NAU8825B and NAU8825C.

David Lin (3):
  ASoC: nau8825: Add registers patch for NAU8825C
  ASoC: nau8825: Update the calculation of FLL for NAU8825C
  ASoC: nau8825: Update output control for NAU8825C

 sound/soc/codecs/nau8825.c | 111 +++++++++++++++++++++++++++++++------
 sound/soc/codecs/nau8825.h |   4 ++
 2 files changed, 97 insertions(+), 18 deletions(-)

-- 
2.25.1

