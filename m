Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QB3yMvX3pmk7bgAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Tue, 03 Mar 2026 16:02:13 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D4E1F1F36
	for <lists+alsa-devel@lfdr.de>; Tue, 03 Mar 2026 16:02:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 785EF60232;
	Tue,  3 Mar 2026 16:01:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 785EF60232
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772550124;
	bh=rYwZ/YOdDmCkdkWnf7NlqilK9rTRBM6IBAPVnKl1gRs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=TfMh0roRbQhhj97t2DdjvVA4C6r4k5hq1c/cpee3EJasrNDfc66smw3AYqQqn8VmY
	 qFUa07bc208v2dIL+6L2t4P6Gwmz1KRAwBCtReJVFeBMCqnOswNyoJORvCyDA6LphK
	 rNdoHunsIS8vKktktUg0T6FJQ/6HzqA8nrLXPPmU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EA8BF805E5; Tue,  3 Mar 2026 16:01:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21C74F805BE;
	Tue,  3 Mar 2026 16:01:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87379F8015B; Tue,  3 Mar 2026 15:58:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED,URIBL_ZEN_BLOCKED_OPENDNS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E03E9F80496
	for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2026 15:58:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E03E9F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=CX1nTKjP;
	dkim=pass (1024-bit key,
 unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com
 header.b=vjmHqiBD
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6237FvqG3406224;
	Tue, 3 Mar 2026 08:58:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=wAcsY9LKR593YkEM
	8+3l2onE/5McnlxDOs7XtGVn2xs=; b=CX1nTKjPaPYNVfBCLEDxwvrZcG7rDz9+
	zcH5xaH4jx8g5gY2ztg7MCUTZ3AwQf/8LSEKJLWcHZjVqBoDUXYMo/BtOW6Amc6U
	9Q8EIvET0FCk0opWYDA0eYaK9P3i+4CJoytFot/xfs+TmZ5HmTPw4aCHMiMv+3an
	OHDf/VWYGUORq4uMdBP/8eJq2B9X1p65Sanbp/hSWGuSDfLrXaLm9wqkEpWj1NpW
	YfWvTbExOvJNDvJzCoPcP7NHK/Ef1aIwr4SNqVI36Ro4DPkGPMvqoZ+q07q+1Jfa
	PwItmomcAevZTM8ObNW42y/NXBQJcXYfnjPLbtejgJZe3PiR/djnkQ==
Received: from byapr05cu005.outbound.protection.outlook.com
 (mail-westusazon11020099.outbound.protection.outlook.com [52.101.85.99])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ckxn03dtu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 08:58:28 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bokdQWvKK8jkdjGk1t3v3XrlRjSZEf9zAydNUkoI8bOhibrFztOQbksUHGazh52U7IEAU1ZZbCtp6mWYPHm+6EM1GOQKsLyylltX5+cMNr6mm+peCieGN+Gtf2zYSrDXfkNgmsG0hSZ6awXPRVB6ibcqWwZleD88iW4KZM8qY1lX8bTF41EsKcehdub+5Jg8Rv+d9EURWwGkcRR/dvqaFFwPFB2u1jCt6zyg/DS9f6DxkLcOHZiDhetysSM+/pkt/hE9+FfISGYRcNeoLZYyyT1lvd3BmZYCo76W0gvlX1L3uJRFzSxeqTHcMcxHK3lfqMk8Duai8F8241ns4v3wag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAcsY9LKR593YkEM8+3l2onE/5McnlxDOs7XtGVn2xs=;
 b=DngU9mquiOo8MZfbMDT/V8gidhw/8ewPwftDglpUtvue1+W5e385gwVknSAnhlbP0hjDyrQ7IdY9fL1jf9Uti/TbmD3dlgwAlXALPgzHb6M8CoFCeYWfZWpOpzK6W7KIyzDDV+P43OJi+JRkZIYoUihbHUF+VEPrTye+QfVL3paljkwotbhIdh9lj2E4mR1QaI86qaArQ83wyLSw1AV3tv/fGahm15IrWSSPBVq1/q9219XUDdauXDBOOjpFzcVDZeTQwOqSAhba5bAO9HSBhDFMnEKi//yFQML3Xo4wos0j49gm53kdyHSW/DUAJ269FP5V6tXlSRJzZ4RjXSKtcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=alsa-project.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wAcsY9LKR593YkEM8+3l2onE/5McnlxDOs7XtGVn2xs=;
 b=vjmHqiBDyGrTgMimKlFV6LDIEWfau9SoVnSmnVOPkETBlmzGoODYt557t5FtGPdQyNA5Kr3K4ldAw65Mi9YI+07oZ1dTIqYbVICw3KMwSxrtorcc60ofNfxQHL6yo6C5IXk9kDRvratQmNiOIMNjWprDrzpk5Jc7kYFx4aMN+Ak=
Received: from CH2PR08CA0024.namprd08.prod.outlook.com (2603:10b6:610:5a::34)
 by DS2PR19MB9102.namprd19.prod.outlook.com (2603:10b6:8:2b1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 14:58:25 +0000
Received: from DM2PEPF00003FC9.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::d0) by CH2PR08CA0024.outlook.office365.com
 (2603:10b6:610:5a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Tue,
 3 Mar 2026 14:58:12 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DM2PEPF00003FC9.mail.protection.outlook.com (10.167.23.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Tue, 3 Mar 2026 14:58:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3F02B406540;
	Tue,  3 Mar 2026 14:58:22 +0000 (UTC)
Received: from upx-mtl-008.ad.cirrus.com (upx-mtl-008.ad.cirrus.com
 [198.90.251.5])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2272782024B;
	Tue,  3 Mar 2026 14:58:22 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH v3 1/2] ALSA: control: tidy up whitespaces
Date: Tue,  3 Mar 2026 14:57:59 +0000
Message-ID: <20260303145815.9930-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC9:EE_|DS2PR19MB9102:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 603b74c9-90b3-4d10-c351-08de79355170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info: 
	r3D1siiVO5h2cuf0utt86LTVwNLuhH7fSlCUizmrRluEmp2+G++cBVtMgN/19w4pCKii0/ADX59vh9LhT3EYhBztqnoKeX7CPdkSza4dbLjwp5E8V1GrHGLmslpgQVXodPSPWAruiSWqohdIHSPdPf10fg1r6jhMEgzQYnLz8gieBMU6sj2dy9iUboJ5qsSVjcjwF7Nbl9A+riS7TwtmszWgP2mca1lQy2c/mK0RsM9UgrfmAwVrJgPQZyWfPS/AjawHTRS4tTeEdwqanSWJNkWq+NomfWuJgHTU3/EMWPKW4VfnFzINBNJ+TASlaKW8G9g+hUU92BtM921aGOTsQZ7L27KIpmTrjpgN60MBeNLaJWNcXwTzb7FKTQL+2yYcRfs2NnL52KXz8zR6K7XpUoQuuNKTbGtDeGVrPb4iV/ts7cnt41GXgLAyZlK0hcI2m0BGD1FgjWjmKQIyuo1w+lpaIje4gQbayQzGihV4Yf+xfnM1Orv5sRjRVA/Jxr6HeEhWBC9Pj1zgVALcFVd+fuePtZ8ddCOLg1rE0MPhG5bWCoX8XUD6P71+qQzOJcLad/Eu7Fko1D8ZxOGOcgW8+tjsrVdf0tUwqUFlxK0rRpvXT8oqmtCF7GY53ZYuZ+eaPps7Lg0m+9jh8UeFgzgkgztqd16kGt+ezXzdUVqrbNLqZAPGI+s7Z+31EAjTnpB3IZEa6lYgXnvBdPWM4g2q129IXgTWJv5vVLMRuHFbqoTVz7rQYLVuYsl5hzozxC4KCzwzrsMUZBegGfmpvkdR+OiON31zOeSY1j+LzYJUPfuIUMdRP+TE7SId2TmeFR2pUk2mSkiWHfP8W5+t4QcUJQ==
X-Forefront-Antispam-Report: 
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	XHEwkF4H3j24HzM1dWakKNpEsMeH3i0grirHvOyAoShPn66d6PvYhUJLRlVnxMWwUzuQm8JnCjFMt9TdcNk7q10qQQZEgMc8fUTiYTRketClE9Dazxgfv29brqLm4a1JB/phTGhx0HmGP17lgsJTy+zSnrbze/GylaCh8Y8Q7zagLo+a6pNTYSAKPG3QXHwxEgGaTCAO6PJpmWU3mqjgTrFElf5ZYHSqylYGvaew1JQohk9EAtFIkyK9Q6aoXb6BBCDDGKXWRv7dpzds/+r9TXRtP5T3MOGKD03a9Gl0EEquzr9aOON+ibmsLpXLDGYKpDu5RrHtdcF4jQy97xVnr8JvwraovqTUrInF1z2thfjZNiXsQ/W2gvw78iYVa6jqZYsmhTRWY/WFYZiLx7yDRJNfDmYi7NG9wOHLUPm+HGipmqqnh9xdmj1WoCSS1Q1/
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 14:58:23.7031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 603b74c9-90b3-4d10-c351-08de79355170
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 TreatMessagesAsInternal-DM2PEPF00003FC9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9102
X-Proofpoint-GUID: XsBGtCZhnaMM3WfRQaT9C6CgHM9xeNZ_
X-Authority-Analysis: v=2.4 cv=VtQuwu2n c=1 sm=1 tr=0 ts=69a6f714 cx=c_pps
 a=GGH+j3rhJf5zTl2H81NwCw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=UOLwL_aBn4USr_LkpIIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDExOSBTYWx0ZWRfXyzS+0RvLr24x
 km+LuwFSaBJIYVmtHiwvmBLq+T4hZujQWfQDk1An6NlfrD1M/kRpKuu5CLsltK3TDQMTgzj4PYY
 I74dlzhNeGfjPulvwml3nqk+PAaa+IhMESymAuT5KrJhvXnYMwYRXzgcgb2OR/3Kpq9YiqbEjE6
 BEszkWVGxEoBlS9ZoFrEnwP3iODKMA1FfuH+bBP56LqEpWfQFtOTARChP85rKM+eZWYqqo2kPlm
 PTELrvZt/hOUoNwv0LMHqitQn4Wmbouy6zBLuGRrw76Gxmyb2i9EcV7s4qW1M2MaItxmMPgPVR5
 RFOoWk73AJKL66EeTQ5zS5VsooKnQIZiHLvw7sLzo89WSnT3gD6pX2pUwlLkd5RBll6lQYwDwQH
 BsLVV1qSnZ1cgV972zZ4LfFWMBok6FWmmZ78TyjzWNW4squyW3K5nxxzjgWDJPsx7zkTNb2P/me
 i0yE+PgJmDbi/T9Tchw==
X-Proofpoint-ORIG-GUID: XsBGtCZhnaMM3WfRQaT9C6CgHM9xeNZ_
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: I2ZRCXUP7OL7DJIPU66SXTQLCEHCNUWE
X-Message-ID-Hash: I2ZRCXUP7OL7DJIPU66SXTQLCEHCNUWE
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I2ZRCXUP7OL7DJIPU66SXTQLCEHCNUWE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 44D4E1F1F36
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ASN_FAIL(0.00)[243.224.48.77.asn.rspamd.com:query timed out];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:perex@perex.cz,m:tiwai@suse.com,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:patches@opensource.cirrus.com,m:alsa-devel@alsa-project.org,m:mstrozek@opensource.cirrus.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mstrozek@opensource.cirrus.com,alsa-devel-bounces@alsa-project.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+,cirrus.com:+,cirrus4.onmicrosoft.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[mstrozek@opensource.cirrus.com,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[alsa-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[opensource.cirrus.com:mid,cirrus.com:dkim,cirrus.com:email,alsa0.perex.cz:rdns,alsa0.perex.cz:helo]
X-Rspamd-Action: no action

Clean up trailing whitespaces by the way of changing card components array.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 sound/core/control_compat.c | 2 +-
 sound/core/init.c           | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
index 16bc80555f26..4ad571087ff5 100644
--- a/sound/core/control_compat.c
+++ b/sound/core/control_compat.c
@@ -417,7 +417,7 @@ static int snd_ctl_elem_add_compat(struct snd_ctl_file *file,
 		break;
 	}
 	return snd_ctl_elem_add(file, data, replace);
-}
+}

 enum {
 	SNDRV_CTL_IOCTL_ELEM_LIST32 = _IOWR('U', 0x10, struct snd_ctl_elem_list32),
diff --git a/sound/core/init.c b/sound/core/init.c
index 0c316189e947..593c05895e11 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -722,7 +722,7 @@ static void snd_card_set_id_no_lock(struct snd_card *card, const char *src,
 	int len, loops;
 	bool is_default = false;
 	char *id;
-
+
 	copy_valid_id_string(card, src, nid);
 	id = card->id;

@@ -1031,7 +1031,7 @@ int __init snd_card_info_init(void)
  *
  *  Return: Zero otherwise a negative error code.
  */
-
+
 int snd_component_add(struct snd_card *card, const char *component)
 {
 	char *ptr;
--
2.48.1

