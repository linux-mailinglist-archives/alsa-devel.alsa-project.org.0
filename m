Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AEC6AD966
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 09:41:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A18F213B2;
	Tue,  7 Mar 2023 09:41:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A18F213B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678178510;
	bh=H8pzGBn/Xmtw/MdTtcG+q+5Z5tWrtSLxmJccdev1lsM=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=M7/lHw2KDe5ICRnFAxWNym2k1eS/tVpve5HFgGTCIJ8HxmdEu3zSUw7lG3duH0KvC
	 U+56T+GS1p/JzNEKHFp7v6dBvtioLNWlBgyuPEmipEo+4TUJXjPX/H2Zo4RH8hqEmC
	 4ZwJ2ArGWaeqpO5aa/hAuOfdp3LhplK24pH3a9Ws=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0951DF80236;
	Tue,  7 Mar 2023 09:41:00 +0100 (CET)
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 0/2] ASoC: SOF: amd: Add pointer callback for amd
Date: Wed, 8 Mar 2023 14:15:07 +0530
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7I7GPPSRFUSNBM4MYTOLVV7JYFCQKL4O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167817845922.26.18383455049932755085@mailman-core.alsa-project.org>
From: V sujith kumar Reddy via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, ajitkumar.pandey@amd.com,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7983F8042F; Tue,  7 Mar 2023 09:40:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DATE_IN_FUTURE_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99610F800C9
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 09:40:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99610F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=XmC4bGVp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KwG8zOnAH88rA6LdpDHC7401di7FpzXbns/V2oHQZnbcGVEMjYVxqmfiY7ntBtqWMN483Nbc+3o+mjOqEJdW45BQeAnI/eP92qHUp6Wm3CCKBKhkvsmVI8Um2rkTZ8OZI/sWLH5ogDX75cchR+M2x/VR6znN0AjYjSgzQl651qHp+SsyUFyXc7r46S0CnEDMUPIkSspliO+33fC38lUuSuSJIQ7deddzu0S3LC2GhlbgLu4GkpjaM0jrUtBL/Mv/QSqXSFMOXlyzPvabrL49Zl0gx7mQ93D/8B2su5CDmvYJFbZo60A3reIOmPudZdzEk8O8bvLOqKEFKtCU/TrclA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4TlNDftitA+kNbZAwsq83agQjMVHzxqstbOIzsgzbE=;
 b=DRC1daiErb+BIwayVo6KYwVQQa7pPFf2X6VdTeR6s4OepDs+8y3evgwr9w6jH7iwGKE8aGrNWpG41VFeJE9clP+Zd5uyXG7B9k4QVsN5asbqoe8zchhTTG7M5b8YXSzI6tbtFWbN8SHj1i7oKbaHDG7XSZex4qIUI2gCyBzAMLoNrOcBo/IYADHTQmAs6G5AXOOCutc2mM3h6BW3OIctPRPgx499XjBSd5ivNBhEKrcCT3r1CGCsfXnBS+YFXtG9ZsXhYp1NBMADH6ebxnd0ujPV1TDmu2qlk/7sbzl4QJ+G3rqZEjLMrv/ledikOjPZcV/jnanyysJg8Og5KlDRKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4TlNDftitA+kNbZAwsq83agQjMVHzxqstbOIzsgzbE=;
 b=XmC4bGVpfKopsDu7HH2vW8Wc0WRPmWsTr5fnTSdp+Pr39Z7hrNe4ry7QIpIRKw5U1tUCbYhIqf/k1HVE1TBB6QmRAFKUOvitQYLcYuB9Zk24PsTsoXTu5VXkAKNWwv6LYkHNYHAWcm3bYGkgQTXbP+9jkb+LtipNXRIJqx2vu18=
Received: from MW4P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::25)
 by SA1PR12MB5671.namprd12.prod.outlook.com (2603:10b6:806:23b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 08:40:44 +0000
Received: from CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::a5) by MW4P221CA0020.outlook.office365.com
 (2603:10b6:303:8b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28 via Frontend
 Transport; Tue, 7 Mar 2023 08:40:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT088.mail.protection.outlook.com (10.13.175.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.16 via Frontend Transport; Tue, 7 Mar 2023 08:40:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 02:40:42 -0600
Received: from sof-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 7 Mar 2023 02:40:40 -0600
From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 0/2] ASoC: SOF: amd: Add pointer callback for amd
Date: Wed, 8 Mar 2023 14:15:07 +0530
Message-ID: <20230308084509.1496256-1-Vsujithkumar.Reddy@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT088:EE_|SA1PR12MB5671:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eefa19a-f921-4a5e-6168-08db1ee7a40b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cghJTt72wQ7sUCElfDyrFVWB80GhRRkN7tkMjFt3J5TZum8toHG2QmrvUvDA5oI1vf/gjNZG5pafyPaS9FKAoWugNI8hJaYW7Yp1CbdMFexVW/kMAc3kYOkNTJVMIsAb0StGKy+KbYNA6WopU7bv+tQ+SxK8+RbaQoo70c1WbaIjlOma5zGy89JqnzQ6tJPpKri81I4ib9dSYnP/f6bZDYd/L+P8y9Z6QMH7Y100dhNFYxWGW0EI1PCnzhMVIynyRymwPwFQQsqXm6kD2AzHwrfEaEnDvzevJ6GvFHwRmsLnFXRp/vCjwhyZ++HfL0L5aBojlINSQniR8Ihp8ho5Otq0tTIRtIou3Www5IRolPt+oiPGERQEoIncjjXBAD/F9IbHgYGstU3FyOZ02331KSFVNcJXUaqCYkVQBUe9j+NgB0K5dNV8SzH0+KY2fD6iWDqvvLAuT8Ggef0Yh+pfs+xEz2Ninudb5XMXRoW4QeonwmwhrjQ3uLBakmqxQC14RLkuOTizU7a1T/OeTJCEbOGxDORHJ3NccBtM0OViwpzPfTxS284BKilMSqnkS4MTNFQFdrxXNP8h3Vd78RAdWxJR887KjxdV1/pJGSrKY2tl9WbhGtqOb2B5J4hY4nG48dQboqrVFnUHwFOGV2RKi7UVrLEj0M8KuPwzy5AwAdbEvVyM4n1Qy6yQyYW7iKvDQyKeJIjtVtX8lU4b2lM43OM3BRSpyjNwGBGlZgVh58E=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199018)(36840700001)(40470700004)(46966006)(83380400001)(70206006)(70586007)(4326008)(8676002)(86362001)(82310400005)(186003)(81166007)(336012)(40480700001)(2616005)(356005)(36860700001)(82740400003)(36756003)(478600001)(110136005)(316002)(54906003)(6666004)(1076003)(426003)(47076005)(26005)(40460700003)(7696005)(2906002)(4744005)(8936002)(5660300002)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 08:40:43.8889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7eefa19a-f921-4a5e-6168-08db1ee7a40b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5671
Message-ID-Hash: 7I7GPPSRFUSNBM4MYTOLVV7JYFCQKL4O
X-Message-ID-Hash: 7I7GPPSRFUSNBM4MYTOLVV7JYFCQKL4O
X-MailFrom: Vsujithkumar.Reddy@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, ajitkumar.pandey@amd.com,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7I7GPPSRFUSNBM4MYTOLVV7JYFCQKL4O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


V sujith kumar Reddy (2):
  ASoC: SOF: amd: Add pcm pointer callback for amd platforms.
  ASoC: SOF: amd: Enable cont_update_posn variable in pcm hw_params.

 sound/soc/sof/amd/acp-common.c |  1 +
 sound/soc/sof/amd/acp-pcm.c    | 34 ++++++++++++++++++++++++++++++++++
 sound/soc/sof/amd/acp.h        |  2 ++
 3 files changed, 37 insertions(+)

-- 
2.25.1

