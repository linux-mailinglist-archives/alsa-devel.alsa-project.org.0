Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKABORdTqWkj4wAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Mar 2026 10:55:35 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7817D20F155
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Mar 2026 10:55:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C19C2602A2;
	Thu,  5 Mar 2026 10:55:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C19C2602A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772704533;
	bh=4mBGTdcxQl/MysYSy+iw9fWbA9pLNB6wEyATJdtbrUg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KOYaOPaDOMfn7XNVD3zDQ+H9xrv789jBf3ynWbHNzcDjX8YTIBhDdZ5NSR7OQJmKe
	 Vb26sjJGQLBu0xmRtJ+lmVr4J/aNCBJvWww3hzprJzXcWBQ56lH9lC5G9tdxOPQ9Vt
	 bjPEY8q8aEogfbt+Cjo9+xYsBeZwW7QHFY1Ug0nQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BADBEF8025A; Thu,  5 Mar 2026 10:54:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E269FF805E7;
	Thu,  5 Mar 2026 10:54:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7112F8025A; Thu,  5 Mar 2026 10:54:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,SPF_HELO_NONE,SPF_NONE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B669F8014E
	for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2026 10:54:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B669F8014E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=hKC8au1+;
	dkim=pass (1024-bit key,
 unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com
 header.b=FAEsDpzp
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6257V1Pc163816;
	Thu, 5 Mar 2026 03:54:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=4mBGTdcxQl/MysYSy+iw9fWbA9pLNB6wEyATJdtbrUg=; b=
	hKC8au1+Ov5/8X/OkHjVs6AZunRdfMxJkuCRpLS61ECMgXjN+cbT5+ECMOQmf7Zp
	cCP2gxU6aJFrl/ZHF1aebiepNxKQotq20lERHWecfNgnda/mNP0qMn1NEHcpq/Yr
	cR4Eg91UcTI4aL2MspJ7DZqUQwYPpKU3rPAlkT7MOO/TtAmdBQEm9agnZkB999rL
	BqPMviAEdytq5kPhWACO5kwyl0ufWF09mxunKXKot6fHYbhJUgmA4tOFsd2nE6X2
	kn1u6wQ3vTpRuZ2E5GpLpoymLFuzilBU36TzH1KfDsmSejlz2hDLQ+9b2flZRyyu
	4tuaagHPFRk1YQjjF7vf4Q==
Received: from ph8pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11022123.outbound.protection.outlook.com [40.107.209.123])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ckxn05xcy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Mar 2026 03:54:42 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XO7l0YVY5uQrCr1fd+1tRShV/OqWRpXCK6giGy71NzLZ+RJG55WUH63HAxzHivsFumB65CKP6PZ0pSrEe5y86G+LtD8PLHPyGaFkhrs+lBLz/gVjx7OpUi7xQvEs8fsIxFtGeBe5keBUbUD24AAWOJq890VfdEtaSe6QjLq1ESvolvNd5rIMQ5UgK6aqjouyzIPS9XHVcKjAwwVn2hUbYolsXFCY5quXIbV1/TZckiUtaq7r15d2PvSBfa0ui7WgBIfeg8fQELhYFchuKTdzV8mC2GI6hZ2zDqY/Xb8CoBYIi8AdOQhDu62BjfSpkOwcGdygi917XH41To95Sbzprg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mBGTdcxQl/MysYSy+iw9fWbA9pLNB6wEyATJdtbrUg=;
 b=nnxKey375sP4zHYFQLA/uqpOk1w5SAo22fs3iWuxPMX3kvEjiC1rk4XvZkgu62ngiEUwoXcoYX32m82NyWNtc+xuwDDDPal8kWf+veiHboBQrD20vaNFJ5ADx95bjwZbXW8ZwleQqClrgGzegZS6jlCnMm8qVV8cEG49P4+hUQUFsGMQCVeZSXfp2sv/RZC6X7f+sW2nDwYUB2TsKQ74YqWfJC0GHoWnThBvoz+LlThlv391pPWp8Y05m0xAEZ8NKilrnu7xQsm9WvYpyWlkm9jGFyrEBQ6GGBvEm86O6PbxxiYwwE992AZl9S5fmrH/lhxeDI3XdB0mUnZxfF0wsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=alsa-project.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mBGTdcxQl/MysYSy+iw9fWbA9pLNB6wEyATJdtbrUg=;
 b=FAEsDpzpuxwhhn9m0Rd2292K3WHrl6XMhMS6UfA+jNisti/roc6WKApkIPyW2wbipiKopfg0TkUvp0TznTfZksjLG2X/4qXfk7d2NU8AiSDk5nFrLSqtMapUVD2MONiEZ84JHxp67LcR2x3X57CiczU1uBtXEzmwO7vJa551F3M=
Received: from SJ0PR13CA0055.namprd13.prod.outlook.com (2603:10b6:a03:2c2::30)
 by MN2PR19MB4045.namprd19.prod.outlook.com (2603:10b6:208:1e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 09:54:39 +0000
Received: from CO1PEPF00012E61.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::9d) by SJ0PR13CA0055.outlook.office365.com
 (2603:10b6:a03:2c2::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Thu,
 5 Mar 2026 09:54:39 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF00012E61.mail.protection.outlook.com (10.167.249.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Thu, 5 Mar 2026 09:54:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2F977406540;
	Thu,  5 Mar 2026 09:54:36 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com
 [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 222FC820249;
	Thu,  5 Mar 2026 09:54:36 +0000 (UTC)
Message-ID: 
 <c4392a10442c436484d9758c54622888b07a3a74.camel@opensource.cirrus.com>
Subject: Re: [PATCH v3 2/2] ALSA: control: add ioctl to retrieve full card
 components
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, alsa-devel@alsa-project.org
Date: Thu, 05 Mar 2026 09:54:35 +0000
In-Reply-To: <87seagx6c4.wl-tiwai@suse.de>
References: <20260303145815.9930-1-mstrozek@opensource.cirrus.com>
		<20260303145815.9930-2-mstrozek@opensource.cirrus.com>
	 <87seagx6c4.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E61:EE_|MN2PR19MB4045:EE_
X-MS-Office365-Filtering-Correlation-Id: 68c2537f-fda7-4ddc-e4af-08de7a9d36ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info: 
	qGngIdTVdsuWWHeDllsrz/3D/lIgpqw88AB6heRCjERuhlhpuyIr0NG358qs+uR4VhWPWoKfliXO/16iwQWIyJXIJXwicqtUvQ8X1r+yxyxJfpxSVdzE2+MFvX0X9ejppjywyHuBaj1h532wYPLCzLS0F9/BSaAaX5oxXA4fGy9qG7IrZl9rKtUfKMioyQStv5xmUsyby9dwWoVImbdRjsYhXMH9/LQMzzx3aJZmIR3MG1nhTfUNkVyViU8nT4fSQYMIOScz4VFR34/kPYeDp/KUPcA7P5gd638vvDGIYbA4t0jGN8REdEpAV2KG9rB9XH9M/OY7MPpaUPtq4tDg/1LP1UKp13rH+JwDbIpB7bzcnyxZS6zR8Y8Q/zQipbKSxJb/N8gKeMo5V8ejtOv1WrBHSxmTsg9YFk29xtOoGl4MrVjpRXywmmcn+JelcufrR4jXFkeb2Elqr3HlnMphmv09/SSn+cyaq+Bw7nZGgHQBQHvgt3Y1554BWG/6jSBh3V+ziUtir+xVyr5QiyI7N4zDpmZwVlKWWgIpHMI2lmMapK2K/Gy82qeBUJQiJCgIbFpwVlIWS8RY1VSLTmUlJH+c/4/8RfjSIyzQNffNhHD8OVbAQR8zHLyAKpdVFnyYxChqNFQ/bWn9AExe8WL80rHUJd6CBhe6E1k+gPatvd4Q1q3wDkKJAi2dK1yaPV2XvYiNntUyLXzH2paHgiClarBHC/gweMqSB1NTOerV+KL+hgndpenMFTmFi5OjdOAU
X-Forefront-Antispam-Report: 
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	WaW/zHlcYXDn6YLv/pto/YrPrVjw4AdaNh1htkXUnNPgh2S5O4wQnJfxMn5cM+qJVW2r+/A5l93RJ45t8skKJvRJ275BY3VCjdpW1Nv/3xqMEg4Y010SPuknO64OtrdhBhy4lxoYd9KwGF5cUeTQhDCwpJCcwnkX2/GntONRVh3ggUh4DDFqAAgCELCpoY0pGZCmWG6MCFdXC3rpS0MHfWmY3YfaWWmsDCCqCoF3TUhwtld3CLW8A8HWvWHK2EBJsWQpSV1S25GObSYORZ9RxFbW7N36Ikc2XZZi828wZxBOo54N0AVdgH+JuCTGNnbsf7IMf8fKN5CrAssxGllLcrRGTjRSgx7uZVrnkIxDOBYazebwMWWleieZL636TWn5Z421doki9c/EdAealyFMukhuPhIp1Np2stJDK78lTN0rJY0ii1v4eCKD91Ab8kXi
X-Exchange-RoutingPolicyChecked: 
	Eo4ontM3VoVxaIeDIhXPE8oBpXRsWql7G/Cgtf7QQ/8qyCT51eErZMmKgs07TIJuGuVWB/Ih8XrppURCof7LB6MIe8A0nqsT4kKuntKzceOVL7YKFEBVDE7nT/PJCrJk3zEMyDq/CSSfsIC0QtX4rBff2WxmSiIhuOea9TIrGwro+p+T6KsXJ4x//bAj9J5wLfauam9ksvB+b/kh+sPJZed+W5mIDGKjpPsd6jEamE0OjVE2FsHNV8s+khRaac/ETfeVpR4DgMmx+I7DVuTNKZWteo6ygDtuwLI1aGG3rX9EflBr3w7wZSr5/U4dIP0YpPM5Nd6A4urCQCIZvYVo+A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 09:54:38.0079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 68c2537f-fda7-4ddc-e4af-08de7a9d36ef
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 TreatMessagesAsInternal-CO1PEPF00012E61.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR19MB4045
X-Proofpoint-GUID: UIY8e0Ur7qP8pWoN5-GSxDXqxWCH4KDy
X-Authority-Analysis: v=2.4 cv=VtQuwu2n c=1 sm=1 tr=0 ts=69a952e2 cx=c_pps
 a=EEuUCq1UVZeKBjwkVe0TyA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=9h6u7VJflIDw7AoY1vcA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OSBTYWx0ZWRfX2Eq20xOS/pon
 G1qpzX1XAQC0OS07T9Eqi7s5DPB7qmvJuKbf3mHU/Iis2EL9CAKReqxmpOt8dt1EGeyDKnYcN5F
 tSh1hH7/S0gRwjsQHTOXq4WtCzBdi2VkU0/+CSFPDH2gcjpps8EL948JxoDe22ofmPGuw1UJEyP
 FtxTQ8/fr8e1p4rPJ8bqa7X+Ug/vXblYJtF8OppLF81JqqmlcnfIEA86hogjBvI/RCbCdh9tjfH
 wzB0azPVUYzLSBocwj9+Q+Kwz31lT/2Ht8KvhpWhKFEQ/LK8sXAtRr20JMs7r1yVB6g7/RpeSnH
 W23wej0f8d/TbChwPAhP8Hs1Kpi7ifbJuYpD4IPQ137U6/OCezS7jKsWHS/blsBg03Bwp3aUCA3
 iLGhN+217sM9C8A5ROxbQXJCj/Gvbt+CFFGz0Y2J2D7ctZp4G2Pt3x/r/9PL3f62FBc/HEM+oA1
 C7DBZXspmi1kEIL4WIQ==
X-Proofpoint-ORIG-GUID: UIY8e0Ur7qP8pWoN5-GSxDXqxWCH4KDy
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: S3MALFBDFXUTWOZ2XZE4RHPEF45ENIHX
X-Message-ID-Hash: S3MALFBDFXUTWOZ2XZE4RHPEF45ENIHX
X-MailFrom: prvs=45249f0d35=mstrozek@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; emergency; member-moderation;
 nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size;
 news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S3MALFBDFXUTWOZ2XZE4RHPEF45ENIHX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 7817D20F155
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+,cirrus.com:+,cirrus4.onmicrosoft.com:+];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	FORGED_SENDER(0.00)[mstrozek@opensource.cirrus.com,alsa-devel-bounces@alsa-project.org];
	FORGED_RECIPIENTS(0.00)[m:tiwai@suse.de,m:perex@perex.cz,m:tiwai@suse.com,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:patches@opensource.cirrus.com,m:alsa-devel@alsa-project.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mstrozek@opensource.cirrus.com,alsa-devel-bounces@alsa-project.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

W=C2=A0dniu wto, 03.03.2026 o=C2=A0godzinie 16=E2=88=B647=E2=80=89+0100, u=
=C5=BCytkownik Takashi Iwai
napisa=C5=82:
> >=20
> > + */
> > +struct snd_ctl_card_components {
> > + int card;
> > + unsigned int length;
> > + unsigned char *components;
> > +};
>=20
> And the ioctl can serve for two purposes:
>=20
> - When length=3D0 is set, the kernel stores the current number of bytes
> =C2=A0 and returns without copying.=C2=A0 User-space can use this mode fo=
r
> =C2=A0 allocating the buffer.
>=20
In alsa-lib all data must be allocated beforehand, so this length=3D=3D0
query is not very useful there, it will just go into a [512] array
anyway. Are there any other users that may benefit from this?

--=20
Regards,
Maciej
