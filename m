Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA266444FE6
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Nov 2021 09:03:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 630281670;
	Thu,  4 Nov 2021 09:02:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 630281670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636013010;
	bh=kOhBfqQxuNnzAnW47rQnHEip+c9hHFrrJYPAZC855qY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XVDiFP369E4sS6A0/CragBZzCFtOJPFcA3xwmPaS3XAdLrgLyi/tiNbCO2CkwXbH5
	 TUf7P90ncRbQHpTqgwGxgk+r1qpYNmWPrroS/Z9XuwD4F5rClpSdbSDzjSkrSx7VVB
	 ZAuR2xJq39L1Dx8MOW1QJBqFlrInd0wpHDYLsbKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9DF2F80125;
	Thu,  4 Nov 2021 09:02:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FA0BF8025D; Thu,  4 Nov 2021 09:02:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on071e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::71e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6642F80125
 for <alsa-devel@alsa-project.org>; Thu,  4 Nov 2021 09:01:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6642F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=vivo0.onmicrosoft.com
 header.i=@vivo0.onmicrosoft.com header.b="daisJbed"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfRvkf5ig3T814/yiFQ4QFku0DMyJ7vPbvTOeV0h+mwVeSydHMjBhplHCkN4CNK0GRdZRIqlC43b/aMFAj7q9t1AIqd8JKOG/weTFb82PlRe8w3AGudv4/GKDB3cElevMRPPLn1Wy0S8/lgxQs5gpnjSfgsiTntCsIBho6zyp/mpsb/hQEocNj3dDMYCw+iplY8d8Y/rdn17b6WgzbhCETbRRWb1RfTA6fKtis+Db+dQ0Bpexu04e5+Y0CBM8/2WFWJlw7PsGPbptP900k94zx28jZiGlacbF/PBwqFHdgiZY9EFiqcRJFGAvSC8YSscRD8dvaptpiE+YSZjOOllfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USEQJsSq8P0LRj8o7+Qc8h96Ror9gUlvtGDei+onOIs=;
 b=QtDsgi0W12tmcKMOsDuGXxDoYnQ7vngrl1jO+qxMkX3o9Up/ltb638bWv0laPUyL4htTs2ngb0rEZQRBo29OUsf6IT0uaPmVLHk57kkAfZLTIFWL/yTYwxK00il/LueOkoBZSu/es40ncKWIKTE1eUdxGkPl7EHcXS1+yRZsIU8OGc6ZqEEMamutocorNQVBYYkf0l9pK6GVXyqMhNRNqJMzq0gytMGCIMKqMyZYhqT3b0JBVw3sUh/ODIAhyDczHNETguEvasq6p+uP79IDEWEqKCYhQK/ajfwacY8pTj/ecflfzQsnQdIXPdsSC1q8sK+oXZsqOvW1etXA1BEAcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USEQJsSq8P0LRj8o7+Qc8h96Ror9gUlvtGDei+onOIs=;
 b=daisJbedodmDPoeIANjpecuvJMXuc9rR2e7HmRmB2XBpaL7FJc6EZSfzy9UolBft7cpP4OFgLR0HZTeMRAhr5YMnDCz080TfBC3ZpHz+DdACxycugZ5kbKCk1hmFZtoCZCwYLBuZ9yesE47uPUJycRZl0nzDU2LnYo0knQpEttE=
Authentication-Results: perex.cz; dkim=none (message not signed)
 header.d=none;perex.cz; dmarc=none action=none header.from=vivo.com;
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com (2603:1096:202:2f::10)
 by HK0PR06MB2356.apcprd06.prod.outlook.com (2603:1096:203:42::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Thu, 4 Nov
 2021 08:01:48 +0000
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::814a:4668:a3bd:768]) by HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::814a:4668:a3bd:768%7]) with mapi id 15.20.4669.011; Thu, 4 Nov 2021
 08:01:48 +0000
From: Guo Zhengkui <guozhengkui@vivo.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jeremy Szu <jeremy.szu@canonical.com>, Kailang Yang <kailang@realtek.com>,
 Hui Wang <hui.wang@canonical.com>, Chris Chiu <chris.chiu@canonical.com>,
 Cameron Berkenpas <cam@neo-zeon.de>, PeiSen Hou <pshou@realtek.com>,
 Werner Sembach <wse@tuxedocomputers.com>, Sami Loone <sami@loone.fi>,
 Elia Devito <eliadevito@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: fix flexible_array.cocci warning
Date: Thu,  4 Nov 2021 15:59:41 +0800
Message-Id: <20211104080017.589-1-guozhengkui@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HK2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:202:2e::29) To HK2PR06MB3492.apcprd06.prod.outlook.com
 (2603:1096:202:2f::10)
MIME-Version: 1.0
Received: from localhost.localdomain (218.213.202.190) by
 HK2PR06CA0017.apcprd06.prod.outlook.com (2603:1096:202:2e::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.17 via Frontend Transport; Thu, 4 Nov 2021 08:01:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84d04080-349d-4a3c-fa67-08d99f695a0f
X-MS-TrafficTypeDiagnostic: HK0PR06MB2356:
X-Microsoft-Antispam-PRVS: <HK0PR06MB23569A08573DF3DE3D3055B0C78D9@HK0PR06MB2356.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5crAR9UiXpHTXCM227024CEgkCiWRs67b0fvywymlqvsg4k1DyVfT0q57nCZR52PxhKvy2wovasY+B63MBvo1etuSrVFNFaEkxv1E3gl0W17Ho5VgijpAObCaxKIiKj5NxNhvgVSfq5tVyBBLdTZZBV6raf3D2rJZphbgsIsZav48zh377lRxAPbl4F/zkaS6kFhX0zEhYHFWWS/J6YohLVo8XEEageHG05OTCAs+2sacAJX8Eux/0x0x/iSZisQ6n0/rhM76y/a3NuR9FIIpZ/eT8D39nfb9R7SAcpK/4kvvXlmoqT5trbDFMzFdqeP2UX7y/MQljGSYQJB55K+0FDvaP/7xdZGXXHFIQiC+zzajskWlgl4AQkz9zFzc9WbMNIMa5i7vPIurrCXcmdj/NKkBsTYl1NSjiemgIq7OBzAvY5TZRoCT/+c1uhEjKrWv5b+u0WAcnsxPNaPvNBrWBPSf0f8bUr0WacnpNZPgPBb+n7MZK7uZnFsuj8APmyJmariEeAHnG2y7JZmm24pyRcMiJQXfk2haJ49ZiQ3FubITC3KTZ0bfdAc7/+tnijGFet9Gi+tXORGGuQwtdKHj4+/es9viugNYGR7lPGEAyiTJtbf3SgkTYEBIAuBIuRMkT5Meb3SyYpw+P1hW7f/VLKwo7yuQdcKT4YkH2rqgQIcMzRjM0m95Vnjl68llHWnduFv/DZEl5y6A1ewh4cEaTIxtRtF2SqS6bhFUDsIlDQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3492.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(508600001)(2906002)(110136005)(86362001)(36756003)(956004)(66946007)(2616005)(66556008)(66476007)(921005)(6486002)(6506007)(6512007)(8936002)(8676002)(316002)(107886003)(5660300002)(83380400001)(52116002)(26005)(1076003)(38100700002)(7416002)(4326008)(6666004)(38350700002)(4744005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2RkVDRCRWZiaHhoM2k3TzVKZS9QV3BTcnJZdkdSSjZZSG9OT1dtZmU3RDNq?=
 =?utf-8?B?K2FTVzlwbHptaElhMEFoMFg1TEVYbVl2aVdXOVI2Z0N5VmgrbmFVUm5LVmx1?=
 =?utf-8?B?bHh1Q1Bzbjc4STBGUzNUemMxQ0tHVnRYczB1akg2OUI4RXdSZExBZDJldVEw?=
 =?utf-8?B?ZzMrRkQ2cXgrN0ZYYUMzTDRDTG40WTM2N0wxUGlCMWVIdWUzNk9QNG13UVNX?=
 =?utf-8?B?enFEaFZ2bG1xVmUra09mRkFWNTNnSWEzNUk3ZFFQRFphZFZIZC9uay9HaCsr?=
 =?utf-8?B?a1hWdVFPb0VqSDVNYVErTkRWdnY1ZDZMTmhnQWpiRWJvRnVVVTJrRURNZ1Bi?=
 =?utf-8?B?WGdzVE02NTFYaGs5TGxvN1Rsb095RC9oeGp3bkVuelBLeWc2OFkvYlpmaDZx?=
 =?utf-8?B?SHEyNXAvb3hxQTd2SkRsWDdHcmVkeFphSlFTR1ZNMmt3YS9zZjRHcHRLMFBC?=
 =?utf-8?B?UVRZV3o1S0d4eHRGSnEycVJvYjYrZTc2MDFMamw5RzNVMGRwc2NVYlBERmYr?=
 =?utf-8?B?TSttbWRtS2N5OEJVVVU3U3RGSFRSZFpBc0thejlBRmdvSTlkRmNVcC9SdWdC?=
 =?utf-8?B?VHFoblUyTVVSL002K3d2YXZ3eDEwU2tYVnZpZEVDS2J1TDZEaGliYkE1RDNw?=
 =?utf-8?B?cEx4NnRucmc2QjNYL3FKT2VCZU91bXNTR0dleGkydmxmVlNjK0ppK0V6aE5W?=
 =?utf-8?B?Tng2aFFHVXZsVjFkM0FicWRFcG9hbkxaZ2wreWFYZEY0QS96akJFZUN5QWR0?=
 =?utf-8?B?TFlNSjlHM1cvS3NtMWxxRE1zbGlza3hKNFZuejZpaTRqclhPUDBxd3pvSC9G?=
 =?utf-8?B?cmY0UXFGUG16TVMzdlNDVzlxckNqRXlDc0V3NmlIdlBpQ0R5RC9TLzdhRDVp?=
 =?utf-8?B?eGw2aEVKdjRLU3MvSGhoaFlWb2l3TlU3aTYwVkpRUlprMHVRUzRKaHAxZllF?=
 =?utf-8?B?TTNYUlAzcEwrZzhGZlduREU2RWJFaDRoN1NzQndxa0NPUHJjNFhobisxR0tw?=
 =?utf-8?B?WC83Z29Ld3ltVGhKbGlra2tGYisyZ3FDQitkRythTnVoVzh2WnNQd2xRbi9a?=
 =?utf-8?B?RGp1c2dZR0RqT3VKb0JJaGp6QXE4Qlc2OTBpUWwyWkNHKy9FUjlFV29laC9T?=
 =?utf-8?B?QTVLRTlKa2hFM0tEazVZTno0Q09IeW82T2Nta2pMZGliOG5CckJ6eVJPYmNQ?=
 =?utf-8?B?WGczdWY5MldvZ3NaSWwvRkFoTFVaSlFQTi9mb2FBZ1V6RFgvQ05GR2NwcEVE?=
 =?utf-8?B?SzAzekY5czR0cDVseWV5TnRUM3VwanhiWGkvZWNIay8yOE1vdjBPU0ZGSXN3?=
 =?utf-8?B?K1Z5WG5zeFgvWldtaW42OGllbUt6cTkySGozN2t5Qy81ZVZnUmplR2xrM3N6?=
 =?utf-8?B?aGRhOVMyNytKanFreGhUd0VsQkxvdUhYQVFtSldPZnFramFqMEEzZGx6YldP?=
 =?utf-8?B?Y1J6dy92T2N1a292K1M0cVlnSi9GeUhuQmFlSjZXS2NhR0ZqMklCb0Y3aG9w?=
 =?utf-8?B?OUFoT0w2dC9rcmt6QXhDczBBNXJhZ21jOFdpcWNINldxY1JVSXVqcHNSV094?=
 =?utf-8?B?SmxSUERnSWxBclJLZjlhZGkzTHB0Q3dHaU96L2ZzNEl2a0cwMDJnalVTZ05M?=
 =?utf-8?B?TWgzdVJzYmFOczJCV0JRSEdCVlBhT0RhQWEzMCsxem1tVjk4T2x0bTc1M0dZ?=
 =?utf-8?B?TDVzREg0bEVlYlQ0TVFvQmN6dTVCTTVWbllUNVYxOWx5ZytSK29XOTNRcDhC?=
 =?utf-8?B?SHN5QXZYd3ZBdmI1cENxR2w1UDg2TzI5ZXdJaHVuQnlOSkM4SE8xSVBQRmFB?=
 =?utf-8?B?U2pIUzJVUHZ2MXBNY0JkWDF1QmR6MWVPN2EwV0JTWEpBYVdMNVpDMGJxaUlq?=
 =?utf-8?B?ODNFMDNIYlVTYTY5aHN5Y1Nxdnc1S1NRZ1crcE9YYW9ieVRyekJ3NWF4MEVw?=
 =?utf-8?B?THc2d1kweHJUT2htd21TcFJNdnRkblRWNm84YzBtcTlGYWVQNmZ4MzUwblBK?=
 =?utf-8?B?cDdTVkJsbUIwUEVhaWR1cnRobjIvL3hyQlFRRGpmU0wzemo2MVBzeXMvZTRY?=
 =?utf-8?B?ZFozc1JXZW9rbUhFTllad252YUZ6aVROTFI1bkJjWHlJS0EvUTBBS1piVDRu?=
 =?utf-8?B?WWZHWFBYcWl3Ukl1MG9FVDZ5ODBXaC9WYUZzT2hWQ1BIMnlZTVQybVZ3aDBS?=
 =?utf-8?Q?cTRXJpWZXnqk+uPk8VWfyIw=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d04080-349d-4a3c-fa67-08d99f695a0f
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3492.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 08:01:48.2813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l72F7MkeGN5ILSm9jZ2VIUAgtXo5Zx/V7rec/DbNGMOnua0FVk4qyeHjfOtclNKB0Cl+v5yumX2o15TvU2CmRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2356
Cc: kernel@vivo.com, Guo Zhengkui <guozhengkui@vivo.com>
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

Fix following coccicheck warnings:
./sound/pci/hda/patch_realtek.c:128:4-24: WARNING use
flexible-array member instead.

There is a regular need in the kernel to provide a way
to declare having a dynamically sized set of trailing
elements in a structure. Kernel code should always use
“flexible array members” for these cases. The older style
of one-element or zero-length arrays should no longer be used.

Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
---
 sound/pci/hda/patch_realtek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 6322fac9e694..7935c363092e 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -125,7 +125,7 @@ struct alc_spec {
 	unsigned int pll_coef_idx, pll_coef_bit;
 	unsigned int coef0;
 	struct input_dev *kb_dev;
-	u8 alc_mute_keycode_map[1];
+	u8 alc_mute_keycode_map[];
 };
 
 /*
-- 
2.20.1

