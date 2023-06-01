Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9698719D0B
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 15:12:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC7DE6C0;
	Thu,  1 Jun 2023 15:11:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC7DE6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685625156;
	bh=c4bL20rOBML60whtgmoAont0MYrgD6CZo8XxGt963Bg=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=h/e6Rrl/XnNJjU7nMkhtzmKb8j5mw1r2vLWXGk57vJuq8FuqJp8jHB3klAMfCynLQ
	 6lx5PVKzoVcgsv4RhR8n9xbRfOpvYjJlTVFgzajrdx2HrxZEgImmrf1uU8ffhBITir
	 NSNsm9OyZJjGfXvMrjrLq9HfP+jAlkyjZUUGSd1I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E6D0F800C1; Thu,  1 Jun 2023 15:11:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4F4FF80132;
	Thu,  1 Jun 2023 15:11:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0126EF80149; Thu,  1 Jun 2023 15:11:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D41AFF800C1
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 15:11:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D41AFF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector1 header.b=hN0b7IYU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5tk2ib8b8vphlVAHO+tMa5Hj0aMzfrcZuR+FdtYAHBol5aCzn+WsQphCGpKfkdkiQkw+FV4QZhzyKAqmyj5rOFK8jr+S6qKJpcXaDbsGd2JcG81156wKYTqXilLN/TpfoHTPEMMIIh2WO02xeU0y3pfmGXYKTk0Ovu+If5cIihew9hKUPu1sK7zk+ih72SHPuQtK5W30rCpYPxmI6Cm2JzSs18TsCIL7Bnn2hABY7i18XrlIkPjyAQqxVseE37tELnqYSlmHSENSozSUl60PzCI4NMSk/YWykdjPFXNiKFg71clk2ECPSMWARnYnxOmaOjd6tFKNIsPPAxzdKcdyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibmkqlQZxQ7Zh/uYYzGwr8c5GTtV+lPG8G/NxOoNm8I=;
 b=SfjiN5AHxh6DpTiMRFmWCbZpS0ynoyYTQJZxWOipA/bHF334tdqw4o/S9DErW9d5KELWsEWZ3mtnhMpj+K7amsAXXdN6yQqE2Xi1zRYbCcTCXtQz9sKVP+sixqHfhgp0lp4XM3vMEJ5qid1H+MOxhRjHILRhbCHjLDdaeHlG2F0qM0oT5avU0K+2OzB8tLh7e88BR9cAo8LytOglk/YMxHUUP4ni8VIyTnp9QNtDTk0opx0a7LNPHEEEUViAbAloOKZeT6Ec4eSgxq+N+DemjtaLvDuZCGMD5vxVfnY8lffRjqfoo7O0bEyTTewhllNJPgs1CxTXnLiIxf5J6eyu+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.4.225.30) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=infinera.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=infinera.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibmkqlQZxQ7Zh/uYYzGwr8c5GTtV+lPG8G/NxOoNm8I=;
 b=hN0b7IYUczFZug8iRZIAN7YZa81y6Mo5U+hsu0GhhibmU6pMNP9xMzaqtOQnazUrHY1E47o0/g8JjlYKHO1DxE/NYdkjbGyBbiBKXztndQM52KeXgtkZBqW/Y4DoCm+Rbu2+LKPBmZTsoXi8Z6gaOufD5qmFGPrVjNG/T58fZ8cE7mrVszKCWkK+HMKAqma3SNV0LICnn5I/EohjhhqcVIHqa3212APtrQWnNlcUlnBN/HXcy5/7jQ7Z5keL9rJ5CjZYSCUn94ZgqW2YMXab2PqxI0lB8xMKR8z18NZlzQTKYflwS4934hW6CWcLntELwdops8Y2dz7t4BEyoikzzg==
Received: from DM6PR02CA0057.namprd02.prod.outlook.com (2603:10b6:5:177::34)
 by BLAPR10MB5300.namprd10.prod.outlook.com (2603:10b6:208:334::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Thu, 1 Jun
 2023 13:11:30 +0000
Received: from DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::e7) by DM6PR02CA0057.outlook.office365.com
 (2603:10b6:5:177::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22 via Frontend
 Transport; Thu, 1 Jun 2023 13:11:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.4.225.30)
 smtp.mailfrom=infinera.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=infinera.com;
Received-SPF: Pass (protection.outlook.com: domain of infinera.com designates
 8.4.225.30 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.4.225.30; helo=owa.infinera.com; pr=C
Received: from owa.infinera.com (8.4.225.30) by
 DM6NAM11FT034.mail.protection.outlook.com (10.13.173.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.23 via Frontend Transport; Thu, 1 Jun 2023 13:11:29 +0000
Received: from sv-ex16-prd.infinera.com (10.100.96.229) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 1 Jun 2023 06:11:26 -0700
Received: from sv-smtp-prod3.infinera.com (10.100.98.58) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 1 Jun 2023 06:11:26 -0700
Received: from se-metroit-prd1.infinera.com ([10.210.32.58]) by
 sv-smtp-prod3.infinera.com with Microsoft SMTPSVC(8.5.9600.16384);
	 Thu, 1 Jun 2023 06:11:25 -0700
Received: from gentoo-jocke.infinera.com (gentoo-jocke.infinera.com
 [10.210.71.73])
	by se-metroit-prd1.infinera.com (Postfix) with ESMTP id 0E33E2C06D80;
	Thu,  1 Jun 2023 15:11:25 +0200 (CEST)
Received: by gentoo-jocke.infinera.com (Postfix, from userid 1001)
	id 147C2200181B; Thu,  1 Jun 2023 15:11:25 +0200 (CEST)
From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Joakim Tjernlund <joakim.tjernlund@infinera.com>, <stable@vger.kernel.org>
Subject: [PATCH] ALSA: usb-audio: Fix "cannot set freq 48000 to ep 0x3" msgs
Date: Thu, 1 Jun 2023 15:11:16 +0200
Message-ID: <20230601131116.1014250-1-joakim.tjernlund@infinera.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 01 Jun 2023 13:11:26.0234 (UTC)
 FILETIME=[922387A0:01D9948A]
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT034:EE_|BLAPR10MB5300:EE_
X-MS-Office365-Filtering-Correlation-Id: d1dae5a8-baf0-4f93-af71-08db62a1b6a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rhzaQ68ZpUOn7cKo5y5kIeIDm2M0RM5WRWGuHcV8v+gkTv65ij+ShPbGk1yGvwU8kSbfY19Jj/7ZOHvU5MRiw/Ut/qBAJiSt9Q6O+oD909vbn59XJ7Uo0cfWH92ZJBu9702PKWs4uf77/02gltMzslqvam6pFSgXX8RFsCc8V0Dhr6ofD8nKLDwwPQ0fQd3L9U+mc5Kfy77gbshb5ukFm+2P9upMEI5KGBlc174F9E9KvweAzDktmQ/DjrnGHlxY0Y3bZBaZBjSNAkUT1ZN+BUxPqeewaV30WZCUxhzs7KtrjqTrQxcNCGl93hdsBTCUNEEZ7pjeyUyaX/xHBZW3iJvFHDrZ3VUOtwp5FC74duVM9Y6mUgjR79NN1ddlaOUs/Z69u+DV6r9P2Xl/vpAXFOLwhIPzVu1FECsw941IJRriCb6JWtPI7/fu0/WYLl+BwYhjRovk74qpiMV4dB90XOgu1zWYPJXKCAsoLEyKP44SEil8cJkwbauT/NeRXX7idGUiqD7dpUDJA6KGhNNnJ2nkc48cP6xya/xsQdnij0vBCewk1m2s+hQ8wKC6ja1QYd2KxLmjBMlhFUQBuAZ9Hv5uO413jRThrxQWhDDr/5TvPyDw6/LilAqnYXqKnlkzHTIL+/xCIdRF7dR4mhKrzb9NmkhgCS/km1aLnxQhzcG2ALRg53KLRt4VwhCY4713fnzavmHdTuhjr+lu7eaTqDc98Jrgpw5yOXyZD8XVsEx11hpApNbAVeCSx+rzh7MC
X-Forefront-Antispam-Report: 
	CIP:8.4.225.30;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:owa.infinera.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199021)(46966006)(36840700001)(47076005)(2906002)(426003)(2616005)(336012)(4744005)(6266002)(186003)(83380400001)(36756003)(82740400003)(356005)(40480700001)(81166007)(8936002)(8676002)(5660300002)(86362001)(478600001)(110136005)(70586007)(4326008)(70206006)(36860700001)(41300700001)(6666004)(316002)(26005)(44832011)(107886003)(1076003)(82310400005)(42186006)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 13:11:29.5819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d1dae5a8-baf0-4f93-af71-08db62a1b6a7
X-MS-Exchange-CrossTenant-Id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=285643de-5f5b-4b03-a153-0ae2dc8aaf77;Ip=[8.4.225.30];Helo=[owa.infinera.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5300
Message-ID-Hash: F47UTTW4AZND7VJFVI6F4IPKEFP35LA6
X-Message-ID-Hash: F47UTTW4AZND7VJFVI6F4IPKEFP35LA6
X-MailFrom: Joakim.Tjernlund@infinera.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F47UTTW4AZND7VJFVI6F4IPKEFP35LA6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On some USB speaker devices(Jabra/Logitech) we see above error
msg when connecting device to computer and kernel is probing the device.

Moving the snd_usb_init_sample_rate() to after usb_set_interface() makes
the error go away.

Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Cc: stable@vger.kernel.org
---
 sound/usb/stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index f10f4e6d3fb8..d9ac8663a48b 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -1226,8 +1226,8 @@ static int __snd_usb_parse_audio_interface(struct snd_usb_audio *chip,
 		/* try to set the interface... */
 		usb_set_interface(chip->dev, iface_no, 0);
 		snd_usb_init_pitch(chip, fp);
-		snd_usb_init_sample_rate(chip, fp, fp->rate_max);
 		usb_set_interface(chip->dev, iface_no, altno);
+		snd_usb_init_sample_rate(chip, fp, fp->rate_max);
 	}
 	return 0;
 }
-- 
2.39.3

