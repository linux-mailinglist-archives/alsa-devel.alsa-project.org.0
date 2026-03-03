Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIsIF/73pmk7bgAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Tue, 03 Mar 2026 16:02:22 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C441F1F46
	for <lists+alsa-devel@lfdr.de>; Tue, 03 Mar 2026 16:02:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1575C60247;
	Tue,  3 Mar 2026 16:02:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1575C60247
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772550140;
	bh=YsOCkiVwy5nmulw6dJ7/KATQFGOJ5bhB0jyL+iXc4po=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lkwDe3WKi8Pp/xQpfma+ICsQ42NlJPVbk4pGxDylEDNO5TugtS7ufuJhLfnFjpINS
	 FCA219NJ+zWRJCByLSWneRNqql0ufx6/jb5JNx+thMfm1m/hY7tDz9NsbJuuynT9pG
	 fBtXdHrs14Fz7kjYHmMJcbyHLEIMkjzz3fVOB+gM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55D2EF80603; Tue,  3 Mar 2026 16:01:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2854F805FD;
	Tue,  3 Mar 2026 16:01:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AE1AF8055B; Tue,  3 Mar 2026 15:58:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,
	URIBL_DBL_BLOCKED_OPENDNS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1D28F8015B
	for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2026 15:58:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1D28F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=a11R+mF0;
	dkim=pass (1024-bit key,
 unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com
 header.b=bKbmYxNB
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62350Qw83188466;
	Tue, 3 Mar 2026 08:58:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Nj/SEQxxREyou9jblE1MSCAnOxyvfb4vbl3ujrIEYYo=; b=
	a11R+mF0DMxU7iEkVXCe6MsGFjh6Vxw57TwKB3pw+G5T4xXrNY3baqYYflAUKnH7
	dk+6KFejhadpXXSE1hp8n7+xNMsroDBrBP8ZZlzJFxCOms0DWbl1ZR5rcAQBPxx8
	cZzxA+lzdTu1lmSpF798N96t+Z4Cp/9wjDVRjj5ESpsOhsk65jVyHD/uQs5CfmS5
	L268nsym+jAdk8yacO8aejC6qQf4a2SE/b9AOwsT22SMvXjEURbgK75UyeaLzaq1
	KLp3s8cyZvLomNaUYT8Z6CrmnSyTDXo/zCuWPP2133BAVyTrBlZMectdqLABHb27
	W7ZHMFdnj+NnAKK2mmQ7Xw==
Received: from bn1pr04cu002.outbound.protection.outlook.com
 (mail-eastus2azon11020111.outbound.protection.outlook.com [52.101.56.111])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ckxn03dtx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 08:58:29 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xs6dIIxI3S32cwPd5QMc54H4W2YT8BENjqCzkWUNbOgrjB/8eXurKjgQ2NV4n9QF5wiaYSO+2iaJ5gJILKLIer6va/1veu/lZePLeaL6qW3i79neFuHO6zM3aROhlA1stItmz1apUEUFIlAoPtA7UI4QvSGE2lp51UB4LaRqftmrU8+LyqooeDvdtymA6vC26o4y/zmGMBAz39d35tc8hlMFctwlhUbWoJpj35EAVZvnJt+Ih9aIXmM7pTCrpX97yMwD8KqUvVooMC48NX0tS1BT+YsVADWy4D/inODkm0GK5ye/rlWW0Ksm9Q7nD0+BKokor6OhNUml0fR6bbjqCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nj/SEQxxREyou9jblE1MSCAnOxyvfb4vbl3ujrIEYYo=;
 b=osE86YiP54UVgBLuEzygVJdrIgXOP6PfJu4rjly6shZ5HLF48He3f82AcjjYpG97E2JR3uYhTVGXzBHTU7SM/DSR88iUiJeBVWbP1FBa60MeINGXm2yqm096EioDp2MWp+GlKe5vKOpkRwiElh07epUOJV5cA5Z7gELBcFeoYVh0iBVzclh6g/FZZEXuU2zJ3FKao4k+MT3OsLLBFT1syKwuIVrYN9k5BAbYttxkgo2wKV1zcLMO+6I8EgXOSg5sutEvR+o65FzwL9OTMKHRhOn1xnWc8vkqLUK+PKcGrAR+Wd9J9KFXgQom7IKd3tF28+bEjikM9P26usL7lF3TIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=alsa-project.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nj/SEQxxREyou9jblE1MSCAnOxyvfb4vbl3ujrIEYYo=;
 b=bKbmYxNBq+iQxz/8oB2QT7g/SvzZjiZ7ajCQNs2sceVNb8cjHQg5viql75ccEDbTo7kkSx5AqmUyQ1YRoj2izvDzcUrgJCAnbrURi/NRdhGy0Q0EMDRVMhbD2859OTW7K73lj+78cL6E3XPsPMSyZQUAbxMRkCsdKe86zKDElAU=
Received: from CH0PR03CA0187.namprd03.prod.outlook.com (2603:10b6:610:e4::12)
 by PH0PR19MB5442.namprd19.prod.outlook.com (2603:10b6:510:fc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 14:58:24 +0000
Received: from DM2PEPF00003FC7.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::4f) by CH0PR03CA0187.outlook.office365.com
 (2603:10b6:610:e4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 14:58:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DM2PEPF00003FC7.mail.protection.outlook.com (10.167.23.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Tue, 3 Mar 2026 14:58:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4999B406542;
	Tue,  3 Mar 2026 14:58:22 +0000 (UTC)
Received: from upx-mtl-008.ad.cirrus.com (upx-mtl-008.ad.cirrus.com
 [198.90.251.5])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 25FD0820257;
	Tue,  3 Mar 2026 14:58:22 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH v3 2/2] ALSA: control: add ioctl to retrieve full card
 components
Date: Tue,  3 Mar 2026 14:58:00 +0000
Message-ID: <20260303145815.9930-2-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260303145815.9930-1-mstrozek@opensource.cirrus.com>
References: <20260303145815.9930-1-mstrozek@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC7:EE_|PH0PR19MB5442:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d5093232-e56e-4fb2-fbfd-08de7935513f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026|54012099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	QszCk2Z992FLk1cDhDTgySC+Ch1XI8c8i1LwlikmMZV6kW442oVzms5372IdqiRFQ29XIfPlV/j4iEoTa4gsQmolnBoNS3yaYwM+vkt5J1P67dHc79fuEFJVa9uI7tMZwU6EOciFaSvZPFyEukaG602B7MhmW6GjdSRwvBEW5mbXa89z9kjSl5xEFJFd/L7m2Eawdqmb4y3b9u9jZTUonN7ONzwuyPL7+oIvEKuMBlkUzm+505ihm3Pefadisji+GWH6MlaKfEQIDUVftD+VFI3T7ihqo0bfHj5nn1RR+Yu9SEvmONv7Q0qymjq9CCEZ1ELstndJPjOwd1Igd8Dq1GCsK3c2oACrmxRFjW70mF+dhWIMs8qvR+O7IZhhQcPT+i3WK9EHMrlshMtc8BQhOUkduMgJ0nWVhzGDwOY6yNYwL5XYWxvTFwi9DRBhQm5/6csz4K1uNykxozIprMUtLwCvbqW3p3StmMI/BDfTlqQMWZIbipgCBJfQhNDkmklFMyAgiBqRLRVmTWMoOMfhsnaAq597pY2CpX6NkJ0vKP5lIEbaVpTwyyAvIFhog9LZzmV0SFzjlD3i+kfxkELL9h5bmxqvkpcqtxq/WyyImuR0y6GpWJx4iQsYz0xtnq9sEwvIQlRS/LK/3S7S7e/Ktd+s3yKOaGMJ0c6Hixo6qcfNwf6nHrLJH0tDp0QSTfot5WebouBdrDhsUZmcO+a0+1Ks7UE8n4anH9lTG2UXk9GBLvpLD0nCUlrHQBOd+rtfaoJFkliiuNYSlIpG3REapSzfmGuRzuk+aK0FJnH7LLpZpGN3TDQpx1rSJd97EjOCEwga2kga2JMgC4KQzPDi3A==
X-Forefront-Antispam-Report: 
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026)(54012099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ngb2epmlFYr3LxDupzQR+Sa3FWGL0u1ad2WbLZyDWjLcnErbTlaTsLl5AzWNV2fsFsiG5QVVRJrS31v25MAQqYCDYdOczWRfk7BlQvYive2htFDnBxVjjCDszZ7h3r+PJqCjIhDfG0OpGl54M3tU3RoncGsEsIL0F/bz2rLKijFhFAoOGcRiR/ilATKRIaxNde6HaG1Z+7LX0auNu8Hm9j7qouuZG3TSpy/x8Iu2AZoblsmbEFQqGXNpb0YGYgA6QGiiTMlOpl2KgiFS6P6qsxdZrEZuVz+op2Xtab7cVFmlq4a7ZSn0S5VLKS1O+5jMaUMKUbjTlvQyua9zTC8Ou5Wk83Van/jbfhK2rallfgZAVHZ/pL+2mmZ+ejmZNJABxD9DFV/K7qAIuVz20OlvDv93RE+KhEtmDwaIeJG3xvGo7aPDPQYJGZvOm6ztGN85
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 14:58:23.3832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d5093232-e56e-4fb2-fbfd-08de7935513f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 TreatMessagesAsInternal-DM2PEPF00003FC7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5442
X-Proofpoint-GUID: vLQ8gYPHPX3R6PpbDHy8coSo1q_3UyFo
X-Authority-Analysis: v=2.4 cv=VtQuwu2n c=1 sm=1 tr=0 ts=69a6f715 cx=c_pps
 a=uOxnHlk0p54I2XS21iaCKg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=NEAV23lmAAAA:8 a=iox4zFpeAAAA:8 a=w1d2syhTAAAA:8 a=KAeA-HvSNB7zO9yIcbMA:9
 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDExOSBTYWx0ZWRfX4uWWEV3c17J9
 lk079vGJDXkTOFpGUBGyB0Ey7x+L6TtYEROmq+r0Q/OBW0H1hqfhTe7QTWGrJeyzLaJYo+nGie7
 Oii8rrmJuQRMwPjAkRy6PLXRbTnmVz4dVSgQ5aDx3iy7VFZ3NalFxpuX+Pwlth5K1zjuwKcKeW3
 UmsE8Gw6CPHOAgCE6FzW+MvJtQvxYDsnvtqjmFhQWHmj2D9NaEp9cpuXusc5umUpRW6NlNNmUAp
 YMDDOWQLZrCGXnZfcBZcFW4FwOqB4R0Xocd3/x1L1xcwLl0R1RELvvEJ4EoZlC6WAEePyWgqLHg
 R3y3x92l4+XqNuHlM3kSdLEucdTr9jPON9vJW/U5e2skdrc8OCJ2YSd2j9Pjr8H/D4LbJ2q8yYY
 niZUigAP4hF7vosyFjvXhWhKQwS2/RgX5bwbCas5mDse1HQPzHWeLsW2QZnWWlvnn0gGlWTEc9x
 tWmQ7PlNwRXGg7w16KQ==
X-Proofpoint-ORIG-GUID: vLQ8gYPHPX3R6PpbDHy8coSo1q_3UyFo
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: HMGD5CJH5JPDMFHD4THYUVMC67NZYKHB
X-Message-ID-Hash: HMGD5CJH5JPDMFHD4THYUVMC67NZYKHB
X-MailFrom: prvs=45224df68d=mstrozek@opensource.cirrus.com
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: A7C441F1F46
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[alsa-project.org:+,cirrus.com:+,cirrus4.onmicrosoft.com:+];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:perex@perex.cz,m:tiwai@suse.com,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:patches@opensource.cirrus.com,m:alsa-devel@alsa-project.org,m:mstrozek@opensource.cirrus.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mstrozek@opensource.cirrus.com,alsa-devel-bounces@alsa-project.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[mstrozek@opensource.cirrus.com,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[alsa-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:rdns,alsa0.perex.cz:helo,opensource.cirrus.com:mid,cirrus.com:dkim,cirrus.com:email,suse.com:email]
X-Rspamd-Action: no action

The fixed-size components field in SNDRV_CTL_IOCTL_CARD_INFO can be too
small on systems with many audio devices.

Keep the existing struct snd_ctl_card_info ABI intact and add a new ioctl
to retrieve the full components string.

When the legacy components field is truncated, append '>' to indicate
that the full string is available via the new ioctl.

Link: https://github.com/alsa-project/alsa-lib/pull/494
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Takashi Iwai <tiwai@suse.com>
Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
Changes for v3:
 - change components field to a dynamic array resizable in 32 byte increments
 - removed SNDRV_CTL_COMPONENTS_LEN define
 - sanity check if 'components' requests more than 512 bytes
 - added a commit to clean up trailing whitespaces
 - alsa-utils link no longer needed
Changes for v2:
 - do not modify existing card->components field
 - add a new ioctl and struct to keep the full components string
 - handle the split/trim in snd_ctl_card_info()
---
 include/sound/core.h        |  4 ++--
 include/uapi/sound/asound.h | 14 ++++++++++++-
 sound/core/control.c        | 35 ++++++++++++++++++++++++++++++++-
 sound/core/control_compat.c |  2 ++
 sound/core/init.c           | 39 +++++++++++++++++++++++++++++--------
 5 files changed, 82 insertions(+), 12 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index 4093ec82a0a1..2b58f79b524d 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -87,8 +87,8 @@ struct snd_card {
 	char longname[80];		/* name of this soundcard */
 	char irq_descr[32];		/* Interrupt description */
 	char mixername[80];		/* mixer name */
-	char components[128];		/* card components delimited with
-								space */
+	char *components_ptr;
+	unsigned int components_ptr_alloc_size; // current memory allocation components_ptr.
 	struct module *module;		/* top-level module */

 	void *private_data;		/* private data for soundcard */
diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index d3ce75ba938a..422b0b07613d 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -1058,7 +1058,7 @@ struct snd_timer_tread {
  *                                                                          *
  ****************************************************************************/

-#define SNDRV_CTL_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 9)
+#define SNDRV_CTL_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 10)

 struct snd_ctl_card_info {
 	int card;			/* card number */
@@ -1072,6 +1072,17 @@ struct snd_ctl_card_info {
 	unsigned char components[128];	/* card components / fine identification, delimited with one space (AC97 etc..) */
 };

+/*
+ * Card components can exceed the fixed 128 bytes in snd_ctl_card_info.
+ * Use SNDRV_CTL_IOCTL_CARD_COMPONENTS to retrieve the full string.
+ *
+ */
+struct snd_ctl_card_components {
+	int card;
+	unsigned int length;
+	unsigned char *components;
+};
+
 typedef int __bitwise snd_ctl_elem_type_t;
 #define	SNDRV_CTL_ELEM_TYPE_NONE	((__force snd_ctl_elem_type_t) 0) /* invalid */
 #define	SNDRV_CTL_ELEM_TYPE_BOOLEAN	((__force snd_ctl_elem_type_t) 1) /* boolean type */
@@ -1198,6 +1209,7 @@ struct snd_ctl_tlv {

 #define SNDRV_CTL_IOCTL_PVERSION	_IOR('U', 0x00, int)
 #define SNDRV_CTL_IOCTL_CARD_INFO	_IOR('U', 0x01, struct snd_ctl_card_info)
+#define SNDRV_CTL_IOCTL_CARD_COMPONENTS	_IOWR('U', 0x02, struct snd_ctl_card_components)
 #define SNDRV_CTL_IOCTL_ELEM_LIST	_IOWR('U', 0x10, struct snd_ctl_elem_list)
 #define SNDRV_CTL_IOCTL_ELEM_INFO	_IOWR('U', 0x11, struct snd_ctl_elem_info)
 #define SNDRV_CTL_IOCTL_ELEM_READ	_IOWR('U', 0x12, struct snd_ctl_elem_value)
diff --git a/sound/core/control.c b/sound/core/control.c
index 374e703d15a9..d793dbf85d15 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -876,9 +876,13 @@ static int snd_ctl_card_info(struct snd_card *card, struct snd_ctl_file * ctl,
 {
 	struct snd_ctl_card_info *info __free(kfree) =
 		kzalloc(sizeof(*info), GFP_KERNEL);
+	ssize_t n;

 	if (! info)
 		return -ENOMEM;
+
+	static_assert(sizeof(info->components) >= 2);
+
 	scoped_guard(rwsem_read, &snd_ioctl_rwsem) {
 		info->card = card->number;
 		strscpy(info->id, card->id, sizeof(info->id));
@@ -886,13 +890,40 @@ static int snd_ctl_card_info(struct snd_card *card, struct snd_ctl_file * ctl,
 		strscpy(info->name, card->shortname, sizeof(info->name));
 		strscpy(info->longname, card->longname, sizeof(info->longname));
 		strscpy(info->mixername, card->mixername, sizeof(info->mixername));
-		strscpy(info->components, card->components, sizeof(info->components));
+		n = strscpy(info->components, card->components_ptr, sizeof(info->components));
+		if (n < 0) // mark the truncation with '>' before NULL terminator
+			info->components[sizeof(info->components) - 2] = '>';
 	}
 	if (copy_to_user(arg, info, sizeof(struct snd_ctl_card_info)))
 		return -EFAULT;
 	return 0;
 }

+static int snd_ctl_card_components(struct snd_card *card,
+				  struct snd_ctl_card_components __user *_info)
+{
+	struct snd_ctl_card_components info;
+	unsigned int copy_len;
+
+	if (copy_from_user(&info, _info, sizeof(info)))
+		return -EFAULT;
+	if (!info.components)
+		return -EINVAL;
+
+	scoped_guard(rwsem_read, &snd_ioctl_rwsem) {
+		copy_len = strlen(card->components_ptr) + 1;
+		info.card = card->number;
+		info.length = copy_len;
+		if (copy_to_user(info.components, card->components_ptr, copy_len))
+			return -EFAULT;
+	}
+
+	if (copy_to_user(_info, &info, sizeof(info)))
+		return -EFAULT;
+
+	return 0;
+}
+
 static int snd_ctl_elem_list(struct snd_card *card,
 			     struct snd_ctl_elem_list *list)
 {
@@ -1988,6 +2019,8 @@ static long snd_ctl_ioctl(struct file *file, unsigned int cmd, unsigned long arg
 		return put_user(SNDRV_CTL_VERSION, ip) ? -EFAULT : 0;
 	case SNDRV_CTL_IOCTL_CARD_INFO:
 		return snd_ctl_card_info(card, ctl, cmd, argp);
+	case SNDRV_CTL_IOCTL_CARD_COMPONENTS:
+		return snd_ctl_card_components(card, argp);
 	case SNDRV_CTL_IOCTL_ELEM_LIST:
 		return snd_ctl_elem_list_user(card, argp);
 	case SNDRV_CTL_IOCTL_ELEM_INFO:
diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
index 4ad571087ff5..d325f9d0b8a1 100644
--- a/sound/core/control_compat.c
+++ b/sound/core/control_compat.c
@@ -456,6 +456,8 @@ static inline long snd_ctl_ioctl_compat(struct file *file, unsigned int cmd, uns
 	case SNDRV_CTL_IOCTL_TLV_WRITE:
 	case SNDRV_CTL_IOCTL_TLV_COMMAND:
 		return snd_ctl_ioctl(file, cmd, (unsigned long)argp);
+	case SNDRV_CTL_IOCTL_CARD_COMPONENTS:
+		return snd_ctl_card_components(ctl->card, argp);
 	case SNDRV_CTL_IOCTL_ELEM_LIST32:
 		return snd_ctl_elem_list_compat(ctl->card, argp);
 	case SNDRV_CTL_IOCTL_ELEM_INFO32:
diff --git a/sound/core/init.c b/sound/core/init.c
index 593c05895e11..426ed8916aa9 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -590,6 +590,8 @@ static int snd_card_do_free(struct snd_card *card)
 		snd_mixer_oss_notify_callback(card, SND_MIXER_OSS_NOTIFY_FREE);
 #endif
 	snd_device_free_all(card);
+	kfree(card->components_ptr);
+	card->components_ptr_alloc_size = 0;
 	if (card->private_free)
 		card->private_free(card);
 #ifdef CONFIG_SND_CTL_DEBUG
@@ -1036,19 +1038,40 @@ int snd_component_add(struct snd_card *card, const char *component)
 {
 	char *ptr;
 	int len = strlen(component);
+	unsigned int cur_len, need_len;

-	ptr = strstr(card->components, component);
-	if (ptr != NULL) {
-		if (ptr[len] == '\0' || ptr[len] == ' ')	/* already there */
-			return 1;
+	if (card->components_ptr) {
+		ptr = strstr(card->components_ptr, component);
+		if (ptr) {
+			if (ptr[len] == '\0' || ptr[len] == ' ')	/* already there */
+				return 1;
+		}
+		cur_len = strlen(card->components_ptr) + 1;
+	} else {
+		cur_len = 0;
 	}
-	if (strlen(card->components) + 1 + len + 1 > sizeof(card->components)) {
+
+	need_len = cur_len + len + 1;
+	if (need_len > 512) {
 		snd_BUG();
 		return -ENOMEM;
 	}
-	if (card->components[0] != '\0')
-		strcat(card->components, " ");
-	strcat(card->components, component);
+
+	if (need_len > card->components_ptr_alloc_size) {
+		unsigned int new_alloc = roundup(need_len, 32);
+
+		ptr = krealloc(card->components_ptr, new_alloc, GFP_KERNEL);
+		if (!ptr)
+			return -ENOMEM;
+		if (!card->components_ptr)
+			ptr[0] = '\0';
+		card->components_ptr = ptr;
+		card->components_ptr_alloc_size = new_alloc;
+	}
+
+	if (card->components_ptr[0] != '\0')
+		strcat(card->components_ptr, " ");
+	strcat(card->components_ptr, component);
 	return 0;
 }
 EXPORT_SYMBOL(snd_component_add);
--
2.48.1

