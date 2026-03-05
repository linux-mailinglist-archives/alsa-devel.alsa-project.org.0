Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LlaGBlXqWkh5wAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Mar 2026 11:12:41 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB21720F7C1
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Mar 2026 11:12:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29B0C6029F;
	Thu,  5 Mar 2026 11:12:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29B0C6029F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772705558;
	bh=wQAjhun6gIB90xGMtKe1jqx5Uc+nhdkmS9sDEMtGepU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mLjGNjH+/HTQ/uUlPyg/rKW7qgDQPfhAhqxuIoRDLlCPJ+Lhh/DcX7gA1KhyuYR75
	 9PmOz+sYhats03i5v72PTjThRVUXsaESuyXRyXZsN35yXyiadwly1vzzMn2Ti4m0kv
	 Zoy9PbX0VlPCmVr0/A+0iSed/XJJ0yH4mE0Qdteo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66C7EF805F4; Thu,  5 Mar 2026 11:11:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72089F804FF;
	Thu,  5 Mar 2026 11:11:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81C3DF8025A; Thu,  5 Mar 2026 11:11:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 771C0F8014E
	for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2026 11:11:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 771C0F8014E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=jS2ItkNU;
	dkim=pass (1024-bit key,
 unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com
 header.b=ooCNZBou
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6252pTUK839055;
	Thu, 5 Mar 2026 04:11:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=wQAjhun6gIB90xGMtKe1jqx5Uc+nhdkmS9sDEMtGepU=; b=
	jS2ItkNUMXjITI8eKNYnD+fgjxIFlUPC8SQmjS5ikepBGPs7IpF7I0uqNTnQn1cb
	/xPOj3oiMe6e+6nTkazT3tspfgjk7XeW4m46p9elWyKvrd20ecqkz9UE8hJC1xwS
	/mT74t1py4lBayPFqsSAPsGERuIXh1lsgm5HekUJLk55HYk/z9CmpS15FXvIZfjX
	IS2VWuGFcFDChL4x3e0WmBt8lqKtq2LIhdYElujTKJHkn9n3Ga0BOnbWL1rZt4Ds
	PpntdQUPtSpiy7A4ByBXW93INNj9YEHIko4Eq8nLV0vfdBSWCHXkH50zhXOimn8L
	DiCoKRxNvMomT6Oyk0RChw==
Received: from cy7pr03cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11020092.outbound.protection.outlook.com
 [40.93.198.92])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ckwnn5yh3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Mar 2026 04:11:47 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LrUN1ESSIevSkU24FhvO32johbHRH1YqfDajYG07/mOCXd7Am3RJLRhw5aJSQXqPa/dfq7OIhsaKzgW41VsWcPKk01FFmE123R+em5dVHQ8Q4YICL/sqHYf4G2qb9dJxuKuN+9HpOM3tCNUIUHo4fxhzS2QCGh3OX0QFEzhL/ULj6qIvsyrO4ef2dVIfJPoRpvi/Nqy0F0/YADoAtq+qFIpmfqsjzZz/xe0jk+O/ySa0GmhsBZDNVqMPLH7C927E7HOrB107CfI8tJKH7ugANuPq/vFfRf3LnLBso6p97dr1EcX69GPqkViQu8o2fcgxpo/9oQyW2sIPEzBCo5AIXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQAjhun6gIB90xGMtKe1jqx5Uc+nhdkmS9sDEMtGepU=;
 b=Pjr4T7hr63wYXzE5SNUvUZq87m4fVoGrmMXFERjPlj5EFARmbeDb2HTDRCtnLdwAhjHwgVI9LiJZgMFfckBMXA2C72P2b3xcsgMtYBeN5NQKdU3AYCnpFfDrGbp3mS432dUBw5bmzpvoB3+mujHY5BJo1rzYH0AUf5lWZTzMfWuw19qqWzg+NttqtOT3E27kYiI+qi1W4TGW1X/OM2UqaTkV9+3ledJjD/puTZFLXO3D5nRbknETJpYQ9T8biTXGA8MjzVivt07nrtXbHM/gRdZyJj5hd7HdqQJ0gpsAnccn0VhMCAhHZWXc0kBwn7wCpTidaJAdYS82OmMtLoko3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=alsa-project.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQAjhun6gIB90xGMtKe1jqx5Uc+nhdkmS9sDEMtGepU=;
 b=ooCNZBouwIZqtGXo04fmBXZxqLUUcGXXYglBiI89BWkUCqmKPkON7y2k5Fqc+qmsZVLS+Ser5pAE9oV6oq6VOxA6RnYcYiBI8nRcTJ4CaAyFDJIiAzn5Og/8upb0vezHvjbyJvl36uYHMTQcC3WDOM8GSBOiedqGvGJEfRy05eY=
Received: from SJ0PR03CA0269.namprd03.prod.outlook.com (2603:10b6:a03:3a0::34)
 by DM3PPF35A22D458.namprd19.prod.outlook.com (2603:10b6:f:fc00::718) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 10:11:43 +0000
Received: from SJ1PEPF000023D3.namprd21.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::80) by SJ0PR03CA0269.outlook.office365.com
 (2603:10b6:a03:3a0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Thu,
 5 Mar 2026 10:11:43 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D3.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.0
 via Frontend Transport; Thu, 5 Mar 2026 10:11:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5CBCC406540;
	Thu,  5 Mar 2026 10:11:40 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com
 [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4E15B820249;
	Thu,  5 Mar 2026 10:11:40 +0000 (UTC)
Message-ID: 
 <cf59b85f5bfa3607b7ef799714df56bf42daa67a.camel@opensource.cirrus.com>
Subject: Re: [PATCH v3 2/2] ALSA: control: add ioctl to retrieve full card
 components
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, alsa-devel@alsa-project.org
Date: Thu, 05 Mar 2026 10:11:40 +0000
In-Reply-To: <87v7fay4l1.wl-tiwai@suse.de>
References: <20260303145815.9930-1-mstrozek@opensource.cirrus.com>
		<20260303145815.9930-2-mstrozek@opensource.cirrus.com>
		<87seagx6c4.wl-tiwai@suse.de>
		<c4392a10442c436484d9758c54622888b07a3a74.camel@opensource.cirrus.com>
	 <87v7fay4l1.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D3:EE_|DM3PPF35A22D458:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fa983a7-8813-43e7-bee0-08de7a9f9973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700016|54012099003;
X-Microsoft-Antispam-Message-Info: 
	BhojKolqEqA9jx0I91CdbedbVfGkpY6FZIaPiSnKbw3fJW8oSuaqTK4X+vWkg6QHza8ar6NicXweTW49Cvaw5P9IAV8pZeMq7dfHH7b51zT3gZdAJ4abW8kJBzKXlayKfwW/Z2aMhh3qXgjCDMI3aRDcEK/fT7tPlxKsj8suniLqIDqjTV6G63BmpoWAgB57Ovio6hoOvTwXOI6PsKqjtN192QWR4sB6bOsoZFXIhYU52L5NH7kgj03XYFrWKdKwrdNpP2V99g8uTRIG3aRvyHWrwpagapf/PYUSYIQqUN9IOiOQPH4jhxD0Xeq0Rd+L0H1Jk8Xe9b1fR/hqKAAAJ8fQFpBf+eOpAe6nWaBxMp6vNUyI/lSATYHeJ9aWAmCW6gpIwj3xpFOXRHzAYTmyMSz47MTCekF5DWZpuZs3B57mnuPcgnlUD8PdFmArc+xroywK4pcOrW5sXjF1QeALqXDf+vP93PYc/zXG5wEbx/ovaq9UL6lEM2RDGijBQUVf9+BeoBjKGoxoo0YD9eoXVvEXFvWJPIwXTrmZ4bK5g9XquNT35jdwXwcx0m6IL94iu3DduUxkGCBedzF47qPNie0phij+PL2q3O40Y71SutjCI3pM/FChOvi5ZkwNYAMWGeup2QAZ5vC3GpRqlYlw9YUppAmS5huj0NAvz9+hQbBFADJJAcdfLKMpfHqOro/BLQe+rls+6srnwYPOACuOFqn5W0j+9/7FHuHLonaukhv+pQnRhgZeLwKuEMDrU/AslSCwZnpouH0iK/qBAfamig==
X-Forefront-Antispam-Report: 
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700016)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zPSoV7EeBBjkcGB9jgGa1ILx7zHJ4l0IkE3a5TsiwxwwexvyNvzrNG5Lpc9eBJZHbpRHlaIqiEHbmICwOeWieDjp3ukVq/iprwHaC0BWd4xxXre+8q7aFROLvHTcq2xcHGLasQGN2L/fXe7rb9Uf0ih/yuFgrc3JeSTR3u4eptH+UiB/qOF7PXX13KMXSUYxlscfdA3gYdDJI09yPqFnhk89uhc3m2vzuBLHhHpZKXUdYgwTjgSL3f6tRZ5bNq89iC4hTjoeaOFnkYXh3eCcpUmmfnUdsD0I5qAfAqQULmklzIjVTmT5YIqBUTDDwUcVFJT7fEbv7hjI2FqF1f9/NU01X+tyxMmWL0zf2gnavyDBXaKz5nyzDJynXeD0kzaME/QDp3Utub0DXi+06ixNw5PcOkVZczJCDmyhaT0URrzFvqLq7RNKOxY5IAT1MBEy
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 10:11:42.2735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6fa983a7-8813-43e7-bee0-08de7a9f9973
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 TreatMessagesAsInternal-SJ1PEPF000023D3.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF35A22D458
X-Proofpoint-GUID: 2QG6Gzvv-zj_1N96YQRdVh_b1TQT3EBC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4MSBTYWx0ZWRfXzm9VMP9NKv+S
 KZKCTcDTC8jVsFVp3zNGKK0cW7nVlKA1/5iD+Dtn9ThrTTkF4AyUyjW4B/Lpe9e8DCcYCzFOq2y
 eNQx46UMSZFhb/opzCH8XwwjB1/qZhGfCwkjISda+o9V+p1x/RdMRi3rg9TsTC7duTM3tnp5H9G
 FQLsQBWFFw3sEOVE7vdzqQcy38M4al3Jvd3OoU6ooOazRGcRoCbmOoFqXAyasZ9t4vNBLU41dEZ
 5lSzxbf/XI05vJ9fOpR0tq1aWEwGB1oIuKqN1fYDx1lLDcsgXhJKKdXJhsRGPMpUTZZhDaCp/3G
 iJiB28zce9USaSE2FtPimL7RJqfWLp5PLolcqjMRctbq/3WF1vIExMp3mSW13zlSlA/GknYu3lA
 H6Ik5JEfO0BfcF7ANeLu+BdbQdPwm06pkf9tMW7lpmXCdTItozlec/w60fXlAzuB32UCFa4NO/D
 YvbAamC/zTFVjMJMeRw==
X-Authority-Analysis: v=2.4 cv=ZaIQ98VA c=1 sm=1 tr=0 ts=69a956e3 cx=c_pps
 a=o952g1rkoyfyBKhMC2IAFw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=26c7szWueH6J9UoEEJQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 2QG6Gzvv-zj_1N96YQRdVh_b1TQT3EBC
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: YFGVKDDDS4CJTKECRTKD4BOZM3ZIU3PF
X-Message-ID-Hash: YFGVKDDDS4CJTKECRTKD4BOZM3ZIU3PF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YFGVKDDDS4CJTKECRTKD4BOZM3ZIU3PF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: EB21720F7C1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+,cirrus.com:+,cirrus4.onmicrosoft.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tiwai@suse.de,m:perex@perex.cz,m:tiwai@suse.com,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:patches@opensource.cirrus.com,m:alsa-devel@alsa-project.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mstrozek@opensource.cirrus.com,alsa-devel-bounces@alsa-project.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mstrozek@opensource.cirrus.com,alsa-devel-bounces@alsa-project.org];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:rdns,alsa0.perex.cz:helo,opensource.cirrus.com:mid,cirrus.com:dkim,cirrus4.onmicrosoft.com:dkim]
X-Rspamd-Action: no action

W=C2=A0dniu czw, 05.03.2026 o=C2=A0godzinie 11=E2=88=B604=E2=80=89+0100, u=
=C5=BCytkownik Takashi Iwai
napisa=C5=82:
> On Thu, 05 Mar 2026 10:54:35 +0100,
> Maciej Strozek wrote:
> >=20
> > W=C2=A0dniu wto, 03.03.2026 o=C2=A0godzinie 16=E2=88=B647=E2=80=89+0100=
, u=C5=BCytkownik Takashi
> > Iwai
> > napisa=C5=82:
> > > >=20
> > > > + */
> > > > +struct snd_ctl_card_components {
> > > > + int card;
> > > > + unsigned int length;
> > > > + unsigned char *components;
> > > > +};
> > >=20
> > > And the ioctl can serve for two purposes:
> > >=20
> > > - When length=3D0 is set, the kernel stores the current number of
> > > bytes
> > > =C2=A0 and returns without copying.=C2=A0 User-space can use this mod=
e for
> > > =C2=A0 allocating the buffer.
> > >=20
> > In alsa-lib all data must be allocated beforehand, so this
> > length=3D=3D0
> > query is not very useful there, it will just go into a [512] array
> > anyway. Are there any other users that may benefit from this?
>=20
> My suggested API can work even with the fixed size 512, too, if 512
> is
> hight enough.=C2=A0 It's just more flexible.=C2=A0 And there is no restri=
ction
> about alsa-lib data allocation; the function can query the size then
> allocate, too.
>=20
>=20
> Takashi

OK, will prepare v4 with this, thanks

--=20
Regards,
Maciej
