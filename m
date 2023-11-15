Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9621B7E3469
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Nov 2023 04:57:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BF0F741;
	Tue,  7 Nov 2023 04:56:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BF0F741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699329420;
	bh=F9wAlvT7BFPjfpdn6OFQkyt2MlGS1oHhpvVK4ovPc4g=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oc6ju1dUtJ8fvkDfy1o/46yrcre7OMbFZYPvi/gdu6pb5JIhLL7Wv6Tk0b2D+ja9s
	 3IdYMrHJkwVgZnK2hYAP5D2iWzIdubl3gdqKQ8ftAwc7hY63kcj6bJo4RsIyVl+4T5
	 /iVXwke0ikGzC8gamtY8l5PO8dxcLpgIaAhUw7JE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F57AF800ED; Tue,  7 Nov 2023 04:56:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5B69F80169;
	Tue,  7 Nov 2023 04:56:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A2AAF8016D; Tue,  7 Nov 2023 04:53:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::62f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC085F800ED
	for <alsa-devel@alsa-project.org>; Tue,  7 Nov 2023 04:52:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC085F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=ZVgwSnRT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXk917obTatXQw08h+STRyXWZKSWOC1RrB8ISsYxdOjqDf0rA6OBTy34ILy/DLBNRaV5qb8RlsoYNKbrJv1z4KbhGTc5GDE9tlQovVTiYXgo4JidmFQkpCnHC9nDoungdwrOB73kKLrEuPjaWd7038IhYL0DvozyKUJKfq+CJKq9u6pUZPWtpYTSbXvNmMzhGpFC1Ssx+bZoYnx//DqzVdo30TXIZNppeSmYnagOZxCp8wLk/ATBXoNN/+yE5iHMB4YYGwug4XRAfY6hi/DCl8Icu6ndNtod7WUkiOoHVMCkb1tY0I2RCtIDTDUVlVWN4dW++xjNV9UcGk2/vAsFUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkHpnMz/D8Mpj+015lbi6kF6jzfmW7DS+3KbSXRJs3U=;
 b=FkfH3NcAtS+9fLW4GWt477uBU+eircQAO9QmeNlNyCG1eoh0LK9ai497P6FUx6SUvh4BLMM0xKbcpdMUFPxYRRjqdzCGHpZ/h8Gt0v3dc+Rvu/U1Ck6QDjl8s5Hl8tXeWxuD8HGj2GK3n0YwhkTnkBBrj503kQ2H2KW542Ef+IbFoXEj84DHKgq4lJ6ISTEPMADhJi5KX+GOSi+H23BgGj/KuP651c0uIbrfJZV6VMwjf2fX9iV2OzriJp3rMywOVOO/feZ/jW70D2EglgG85/gMzjp3R9vZfrssCJIIhEYlhvI05skCAz2YiZOfJ2Lxkf7GoQbt1zcBFaqCqyzY+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkHpnMz/D8Mpj+015lbi6kF6jzfmW7DS+3KbSXRJs3U=;
 b=ZVgwSnRThjK24SzeToCYnJpU6vR4gJH7ISGmEl0mgIkGmZW8yaLgNwpF9K5s4eppEzvE6BBkTg+P0uz4HX3ZHrwKY4b6dqseA65rc7AnltC10HDUbWL8k46t2HWJ3P5DeDhaC5xa9pv66XTKcyPkaLAZJcJvAtVTZ7VYKotBqx4=
Received: from SG2PR06CA0240.apcprd06.prod.outlook.com (2603:1096:4:ac::24) by
 SEZPR03MB7568.apcprd03.prod.outlook.com (2603:1096:101:12b::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.27; Tue, 7 Nov 2023 03:52:47 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:ac:cafe::ba) by SG2PR06CA0240.outlook.office365.com
 (2603:1096:4:ac::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29 via Frontend
 Transport; Tue, 7 Nov 2023 03:52:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 211.75.126.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 03:52:47 +0000
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Nov
 2023 11:52:46 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 7 Nov
 2023 11:52:45 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Nov 2023 11:52:45 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<robh+dt@kernel.org>, <conor+dt@kernel.org>, <YHCHuang@nuvoton.com>,
	<KCHSU0@nuvoton.com>, <CTLIN0@nuvoton.com>, <SJLIN0@nuvoton.com>,
	<wtli@nuvoton.com>, <scott6986@gmail.com>, <supercraig0719@gmail.com>,
	<dardar923@gmail.com>
Subject: [PATCH v4 0/2] Add DMIC slew rate controls
Date: Tue, 7 Nov 2023 11:52:28 +0800
Message-ID: <20231107035230.1241683-1-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[211.75.126.7];domain=NTHCCAS01.nuvoton.com
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|SEZPR03MB7568:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d15aec5-6e8d-491f-e2f4-08dbdf4501a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1+BfwN0XYlGhKvTfZ6KmLZ+C67MWSF9DC/HJQT0qoQcy6VfEhuzd5S7Nd8T78HPtO/FRGp7s/2uG6st29ihs7En5F+VFFqMvOpwsyVZNFoKIwZY6FvYEE/JAwGS3feW69lHqgsWwQXRHZ3pN9qhuA/KEgW/T9dI1f5uyL+qrhBKo2b6vehwROeI/fWtHttjSo1IDG31/NEtIHqXuA43Q3n4m+6V/FyAGwGexKZuKDtUUsnS66vS5f0bDRjuJLQ1gaIoFy+rFJSduA2oFlUqV8482pDyb4a/63zYVm33O7wIOa5RLTAw5Y1i0Fo11qq5PafcnGh6s4407KRKD8unPLctEekHfaS/65IVcVFUT9v9T4Gm7IPwaG0++G1aCp9LAe4zcYMVX2C0Qxq495Z38tbT36uklOMIXed98PV+FownPaS1Xk+aWRf0uIUuoP6wj8rasZ6AyPXshTftDfOaPVaq6HrM1XTx06nrWHFbCYYyjnDvTIyGkqgigTBMA8B26uHGUknaqjiap17wtPi1Kl148QNcZPFH8iU7Zypd2kGCdBmkC+HdWOOxM38qAslCE9mJKq7qKhdy9JMbUtRRRHR+CoZnyOjItU9ITGxgTuOJiv7/gS8OPT8dt2QCo0f6UNWDcc2Z94+cky8RGlfv5pXzpv+esLP22WmtlyO9IOOe35i8v80/d5frjrrEmXeHckINqOjzoxMAmk+FbtbZKo9wKtT9QmO7DkpbPK6EtYfqpZAWGiPTvha1FONuexfeTwOJouzYHDrSYHtic0GLgQ6Dl16c6xFUx3sBMAVW5px4=
X-Forefront-Antispam-Report: 
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(82310400011)(40470700004)(36840700001)(46966006)(426003)(336012)(40460700003)(81166007)(83380400001)(6666004)(82740400003)(26005)(2616005)(1076003)(54906003)(70586007)(478600001)(6916009)(316002)(4326008)(8936002)(36756003)(70206006)(36860700001)(2906002)(4744005)(41300700001)(8676002)(5660300002)(86362001)(7416002)(40480700001)(356005)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 03:52:47.5062
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9d15aec5-6e8d-491f-e2f4-08dbdf4501a3
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7568
Message-ID-Hash: RTLK3YQOSZ55YG6445HNZDWDLRYPO7YB
X-Message-ID-Hash: RTLK3YQOSZ55YG6445HNZDWDLRYPO7YB
X-MailFrom: WTLI@nuvoton.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RTLK3YQOSZ55YG6445HNZDWDLRYPO7YB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Determine DMIC slew rate via property setup.

Change:
V3 -> V4:
 - add "maximum: 7" description.

V2 -> V3:
 - Update description of DMIC slew rate and remove
   "selection" key words from property name
 - Corrected variable name of DMIC slew rate from c file

V1 -> V2:
 - Corrected description of DMIC slew rate.

Seven Lee (2):
  ASoC: dt-bindings: nau8821: Add DMIC slew rate.
  ASoC: nau8821: Add slew rate controls.

 .../devicetree/bindings/sound/nuvoton,nau8821.yaml       | 9 +++++++++
 sound/soc/codecs/nau8821.c                               | 7 +++++++
 sound/soc/codecs/nau8821.h                               | 3 +++
 3 files changed, 19 insertions(+)

-- 
2.25.1

