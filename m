Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 850559DFC00
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2024 09:36:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7C57E97;
	Mon,  2 Dec 2024 09:36:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7C57E97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733128606;
	bh=JywZbVEAWQ2OhFPBs0Y+n5Hg4Wz/y455vC+n/e4GX1o=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kdvaU26EwkzzMaie/F0IrJPlNux+RQRYV13zPd6vPz3dehchxBg2dxE81eCa/alun
	 e+SVIX05RTTPVm2kTx04VXEs8tNOkcJvZLFg0jOybnT37QSsc0OVduUen1waEEZw/q
	 +oBU32Lj8kVOqlnGSKMU30vOamaBQ0KH+lLtLU7c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 992BCF805B6; Mon,  2 Dec 2024 09:36:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A633EF8047C;
	Mon,  2 Dec 2024 09:36:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6530FF80269; Tue, 29 Oct 2024 11:35:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A36CF800ED
	for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2024 11:35:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A36CF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=iU+nW5Jg
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 49TAL103023560;
	Tue, 29 Oct 2024 10:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=saQfx507La+y71kQDhqv2PRbGDVm8wF93hchmVKECkQ=; b=iU
	+nW5Jg7SjK5nuoqY97xiVWbPMH+tC0t0ciIklt/kQBhUJrO9uhE8igKwuZo4Nuxh
	vfazEd/ZlfaWDh7GWuyDmRc6mMRdgSIE4JYJdCCd7iSRZZYJUNq2h28oNi+I3tVE
	AGX5QCqYqGhC5ySRqYq5IjrC/sygZvgQaGIdidgbmcsmJZOIhMGn53Ln6c/OhpT+
	8VVKkJFn6L9GgEykcTzMQAY15oN3zG/ybBSRM8X1ku7nP+XPqessEtqvgVbK1ltD
	qNvTZtTlNgxAljCZ1+T6o/exjlFs7kkxC09ZjdNt8lLxwCBbjFL+bYPV+UnKhcNr
	JN9XJsxqyHlvlPhcSJ6g==
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2044.outbound.protection.outlook.com [104.47.74.44])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grt701f1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 10:35:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EoXp2VHEXu93OcdvWiCrLckMqamzwIjVYaBx7i3NB3d2LmMEJU94EzAVGgbDH7mMQu8wfzAN2BGD8amAjKN7/wMZPvvgkx9aZaGFn/v1osLP89txiarPODyf7K0xT1Rsnk5I0ovGw46+rxpYFXjfXraHDJzo0+BM/PXWWL3zu0e/2IYa3c4879nPIIVDEen/7m8k7nMFkXAquKe48bnRY+N+La/iPkjTH2W4gS68kAuSHOsmBm2+BjzvBxbBB9xGJ5sWZmWmkUwi5Dt3ngeUrnwvAFpvt2QScMeBmkAmIPbb8BuekZ4s42wj3Qx6hXVeeLXAT2A9kICO0YhpY4X9WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=saQfx507La+y71kQDhqv2PRbGDVm8wF93hchmVKECkQ=;
 b=fjC/nOQpNHESd0EG6+ARmfWNfxGLNtGydVKfTuksLFZblZM5XUXs3Hf2aLAuGv1r2EIMktN2RRImge7LSmzL0dZ+7JNuFtel6ETTvu/kTLdMbwkKLg20R5IFUVIUG3z4PayqUbVBfFFNp4aCGKB6cklgp1e/M3KB+XW+llIpRg4TCXnv8xwG1WNeYP3px5+fF3UgwXi2yHAhQP6isx3a7/du4opQsHvnI6IAcCuIKAmFk36h91chb9NAdjdQ6DQOTJyKjwia2WlwO0H9RWHWXEPYzh9T8inakeOzuI2WiUOMCuRZsbTBiXtXjUPcvrqeGgVEc1G4Pl0enjjGmOTmAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7266.namprd02.prod.outlook.com (2603:10b6:303:79::10)
 by MW1PEPF0000E7E6.namprd02.prod.outlook.com (2603:10b6:329:400::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.19; Tue, 29 Oct
 2024 10:35:09 +0000
Received: from MW4PR02MB7266.namprd02.prod.outlook.com
 ([fe80::e3ea:a241:26b7:40ec]) by MW4PR02MB7266.namprd02.prod.outlook.com
 ([fe80::e3ea:a241:26b7:40ec%6]) with mapi id 15.20.8093.024; Tue, 29 Oct 2024
 10:35:08 +0000
From: "Shalini Manjunatha (Consultant) (QUIC)" <quic_c_shalma@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai
	<tiwai@suse.com>,
        "Raghu Ballappa Bankapur (QUIC)"
	<quic_rbankapu@quicinc.com>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "Shalini Manjunatha (Consultant) (QUIC)"
	<quic_c_shalma@quicinc.com>
CC: "Krishna Kishor Jha (QUIC)" <quic_kkishorj@quicinc.com>
Subject: ASoC Kernel 6.1: Query regarding dynamic dai link/dapm registration
 during bootup
Thread-Topic: ASoC Kernel 6.1: Query regarding dynamic dai link/dapm
 registration during bootup
Thread-Index: AQHbKe1Gc5S8n76XiECQmF66Dv9tsg==
Date: Tue, 29 Oct 2024 10:35:08 +0000
Message-ID: 
 <MW4PR02MB7266556C7EA581EB90AE81EDD44B2@MW4PR02MB7266.namprd02.prod.outlook.com>
Accept-Language: en-AS, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR02MB7266:EE_|MW1PEPF0000E7E6:EE_
x-ms-office365-filtering-correlation-id: 42433ad0-7fa4-4ec6-6df9-08dcf8055c72
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|8096899003|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?S4J9CstlLujvro6C4zbOOfu5PkrsotQTIvd/ha+tgYnmGZ86RjgeO8c1+AXf?=
 =?us-ascii?Q?0zRWfGxD6a4gNMjp606uUVEkCWdTgOgEoorUsPP8E/Kw4A/qCl48rLPoKQCz?=
 =?us-ascii?Q?K/8k9UT/KqtadbUMuao0ysUlMOBeNT5u3uLCWyUMJ+V61yWw3pAZf2r8gU/+?=
 =?us-ascii?Q?E6TZhqmAtzg/YY278bLoNwQ0SEcHWHJRjhUZLaRMyIHP2IKeq0+NITR7tf3s?=
 =?us-ascii?Q?zuVU++NmiEytFX//8/y/X3JAaTpY0/Sjl8rITQr1hJh0H52ZRqYm73GKk2q8?=
 =?us-ascii?Q?nke/42rxXrVnRvMKw2jz7HGOJ+DCYZ/bOBR5fgCP0IvcIWfSoKhLKX6ZRa0K?=
 =?us-ascii?Q?47zHztSrRA96dvt4Q4W6KjIDBijbvJzt/w432Y9Q3KuhtxLGDcy7Q+9vaKMD?=
 =?us-ascii?Q?cNgf85+cfgFAU/fDvi0G9cdZ9Ss3D/Ks77tRbfYXJ2JlMgq+tK+TkYdKXnLs?=
 =?us-ascii?Q?t6OXkWIWiFmcYZHRi4BVaa0Dn1sbcbWbK9Mykz84jZzO/7A6/rLnKxBi39x0?=
 =?us-ascii?Q?AO/J1s9h60KcZZcOe0U8NrMTd/nRBFWG4Jd+kFUpFbLYhqeA5lajfTNnOxA/?=
 =?us-ascii?Q?WJNHWNa7UqZyb6UUlKhtDfzCxuTTdHHgNdgDM8BpDGi3AvhLRnu8lV4P4fLF?=
 =?us-ascii?Q?8ouBhNlr2vFiG7uBLeCpdkpEqJm4T6STQQC64Y/Ye6M6Js1paKx+UZvaAGQ/?=
 =?us-ascii?Q?ETbV0bYbU3Vk2u7HNN5OjlAxhmmSuY7Wcrne7TJ33vDl6b2uEXpQC+21gYV+?=
 =?us-ascii?Q?Mh2iCUfVeU2Ahga4mgSz2gSVnqSIPAL/FYv6ncmeH7cfHSdtgDHU07XFquR5?=
 =?us-ascii?Q?Wr9B/qbRdqSthiTh9vUoXW0GQIdAsy6judVJjoiCCyBprpgLAfitcLTTrVry?=
 =?us-ascii?Q?z9dHVXio82n25pGG8ZgzRNnFggW102ONXohFlLuk4A8i/G4iHolL1vgRa13P?=
 =?us-ascii?Q?qV7K8lIIqHjmrYeJcG33YFhjN3erEK4GJNn8aRvl27bhFOEaaF21uB9exIMK?=
 =?us-ascii?Q?OLDQSRz3JEh2xJokvNZhpqWnujuvdZTJ1HT4rktlaX/IMO1mCvVGyd8iCfrX?=
 =?us-ascii?Q?XALVuFNzWrwTdqSV+0lDEY7FbMMC/aw5GbZHyqjO7kbRzR75Kx2Kse/xt1gd?=
 =?us-ascii?Q?xF8vvS19sLLRIXoUs8MORainUl5+jyGxypn2L4sHWDs+HOgDsOqgIjMH08jM?=
 =?us-ascii?Q?ollrVYXDvzhMlKcgNjV/Kns4ex6pUEG3JPURhiek91vNipfqtHJeZ1y6sWTE?=
 =?us-ascii?Q?/TNT58N8PPlJQr4C2DUTO/uYFV0/+wopNsKn09kkyPuR6epfXnaRLhfnzSMV?=
 =?us-ascii?Q?inccsZX6UQ3rG2ytv3KZhGjMj4NpSvIsvqlbptjpRoQd0F+0RLOY0QKvnGAL?=
 =?us-ascii?Q?72NPNIs=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR02MB7266.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?IWcc9h9Xjdx2xCm1KHqOFu3DMh6toeU+eQDLBTGqHMQVXXnhsglcycUl5GSR?=
 =?us-ascii?Q?QdwPInnEsR8Xz1sALLIVoHxWAK4wJZUv9L2EjcbcTSAlg3u+LRPplIlTIHZn?=
 =?us-ascii?Q?xQlVcgo9YZ0tbrLp7IhqeNsXla4OXGgixI8bcGxoHzvIEJWqBRb11gu1XeVm?=
 =?us-ascii?Q?0HMPIDjdaUQ+nu5rqO3zNrSedZzSdaFTlrWsLLcaLQzlXWRtLZ/6CQv8rOMd?=
 =?us-ascii?Q?VtWZBGFIGGZXGPQ0qE3C30mmo5gUtX06lntK1I2rl6nPbMuZ6iEnpoWL76Zm?=
 =?us-ascii?Q?EVvobl6Yj9Gn8FyDr1lnJu/uHJmQZQvfAviANshY1xk4k+OjKl7jGqKfmpud?=
 =?us-ascii?Q?vnJq79k0xi6uFyoJ7Sa7vd4XVX8nyxZUAze1A9qPa9lmzVGE9Edar6QtYELQ?=
 =?us-ascii?Q?6hWAaxJ6X7rjHYgTlvvMui9M7I8UoOlGSl8yGTciB1p0qWJQcKffh+WAs/Tr?=
 =?us-ascii?Q?z27Wd/aBqpeQeLiH+vKhlgg8zFWLvLnAAxmaTQXyeodg2D/3jGM/Nflv3YGB?=
 =?us-ascii?Q?f+XvraR6gn9TZeVYMZVMK9Q7WemuiSNzBTuY+Q6iEq8mlFfaG8OMkGch4Kso?=
 =?us-ascii?Q?ZLBDr8fWXt2M8vwKQAe23I5IoMLSxTfyAeGRITf+LxZ5swhUxqVvgnpbUNSw?=
 =?us-ascii?Q?Mnu4gU37JHM38ulSrWstc+raEAYzoTjLDlhSeLFpg7I93Vyd1uoO0RFrXSk9?=
 =?us-ascii?Q?P9WzPjeKyhlrYfrGd69BXcGYRkBah6brw5ZGGP6PuVfJdcleg9cfvteE+JJQ?=
 =?us-ascii?Q?iXJRYXJv6diKSEN5Sz4BwQ5Q4D0qmQxXaRSlRmaxHWf7la5mwM4arBUVfObf?=
 =?us-ascii?Q?EZs6kDs49Ygw10FrBQMw1tVxoq07giJkLE3S3ux4BjgrjLstutSfPwg7qrqg?=
 =?us-ascii?Q?V0Mz+nDftQjpEPlFVddG9MDCcyYn5uy4cN04WXCcSja6oRYm6MVFKIYENtQ+?=
 =?us-ascii?Q?mYVxeTfmsD0xLFtHt2/5DYg5l8QyLcF+L8yNRVdMZWq8GJ9EozqWj1WjPjla?=
 =?us-ascii?Q?7fJwz3HTUJu8Wf5wJCIBSpYR5wH+ccxw3THdwCAC8+sC9ROeS0VH5H25EZ4M?=
 =?us-ascii?Q?PjIV6/R3a1TrsxZYXYIJ8IcUEiY/8aq6DENnCcvhSw3yRdqahVdJqxU5yWGT?=
 =?us-ascii?Q?oaL/Hk5ppX4Z0keXoII88pF+wb1F9rgm2jHFLpf4AdtXTR/3DKTNjPM0gyX2?=
 =?us-ascii?Q?YfpaFnYYujSIh8LqNI3+Ar0TPYVpjvsJGOlQwvjOt44+q9+8yuxBhzEKlNXY?=
 =?us-ascii?Q?o8G/aD3YzcGGsRGCvEP9qpRI9n2f9n52y7n/Qz2cObQzkjr7RU3FKlrt3hja?=
 =?us-ascii?Q?KZ3IJyh74XasyLGyvU8Hzy4fdz8SZdYZD4TJUMVZvp7VmkW/9/5htdGyc30W?=
 =?us-ascii?Q?uYjbUdAthvbTACxUI65k7sFHdC2OHOtO9bWX8Y2T2avRp4mTe9QgX61LFtR1?=
 =?us-ascii?Q?2GW2Ff5yYgkdKuj8RpbboacHHljo7LkR4yAT3EIOlbfWDY2SIu/AgT68kSVd?=
 =?us-ascii?Q?YdPgVOl9CH9fr6bnC47ygY/GpPwycbUj+QmvwJ+J1KkGjuzLePDbAY6eNjY5?=
 =?us-ascii?Q?iOPIAMhMPGzFSqHLlDSufo812PuYMiilfu0UJhQv?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	EY1EBiUPmt8bQYXzT/21h8g5s9jF9342Id1lAPPBVVXmglWaQaOUMFG1QIHPZRff1UgjJp0FtwLDsuXnwOH5WJYcBLF8o6tFZb80mKJhk7E2vEnsZSTKmcXYdJhhRj3B5B+L/W8wU8D9wY6BQbXivyopqcLidQ7uqmOfi8QlBL4ccQN2LmL0I+fvAzKazKzmbevFKmC04UibajHhoQBmYGP3RLIH11VMFG9mSaZjRRtBT79LWt4ijM/g166Y8kKvpYg5T7zl4wKOZjiHbk3Fy/s0HtLFAA3I4EiyXwYPpVbIamTWBzg6OrMuZQtSHSRU7q+TeVAsO0gKIQhU22pszrga6UtvpDG6FRavbE5EEGw+G2+stHX01rPH7oD1DYkuwWyjtEvj98m6WzeP0D1AjwlvE8zsMUO5I1JBPMkKHKyfNkf7xIGzzCsDPHGMDYI79OQ0pEYOJPKU2zla2/8HGFjAP6nhLDOumJwaTok9Y8jdR4N8DVFHun8goyyn/TcP6Vlk28I8vmFxBmidF0eJD51wo+mfOfCKPEC+2/Uzd3mUHfuCF705oJNJcTjTLupWHLJSlioABjn1MivLEL52Gs9wmPRZ7Itg7ZdUtJ1f3Ibst2FYAR0RfCl2A+PvKGOF
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7266.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 42433ad0-7fa4-4ec6-6df9-08dcf8055c72
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 10:35:08.9223
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 u7NI+u6X77v4ttDxb3thXLBGVcX+aieyHSQMmMO7sp370KuVnUvmuoCp4FVBix0x04WAwtiMm2VVmMrlz8qYkOr7jvyHisUM3DurwQ9Xtp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW1PEPF0000E7E6
X-Proofpoint-ORIG-GUID: 1itcb0on5yFV9zqkiyYD55kBYiZUNUH7
X-Proofpoint-GUID: 1itcb0on5yFV9zqkiyYD55kBYiZUNUH7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290082
X-MailFrom: quic_c_shalma@quicinc.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QNTQFXQR54Z743APZA4FNPDEKTQCQ5YP
X-Message-ID-Hash: QNTQFXQR54Z743APZA4FNPDEKTQCQ5YP
X-Mailman-Approved-At: Mon, 02 Dec 2024 08:36:03 +0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B5NNQXNQRRYCOTY3BPQ4QI7KT2YWO7FX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi All,

On kernel6.1 based Qualcomm target for automotive platform based on Android U, we have a feature early services to launch certain early apps at early init of android bootup cycle. Hence in order to launch early chime sound of audio at early init of android boot up cycle, we need to load all required audio kernel modules at early init stage in order to get sound card registered.

We have certain KPI goals for every early apps to get completed within lesser duration so that we can achieve final KPI goal of android boot complete as per the target specification.

In this journey, while optimizing the sound card registration through machine driver probe to achieve lower KPI for audio early chime sound, we find that for early chime launch we required only selected pcm front end dai links only.

Hence if we keep FE dai link structure in our machine driver with only required items for early chime, overall sound card registrations gets completed within 200msec from the time it starts, which is a very good KPI number to achieve.

So we were trying out code change to split overall FE dai link structure into two, one for early chime and another for all other required dai link's, then some how we need to register early chime related dai link during early init so that sound card registration process gets completed quickly, later stage we want to dynamically load all other FE dai links.

Could you please help us to suggest on how can we achieve this?. Is there any possible way out to avoid static FE dai link registration for all required ones from machine driver during machine driver probe, instead register only limited list of dai links.

Later can we dynamically register the dai links in order to get PCM devices entries created based on use case.

Currently we have this API devm_snd_soc_register_card() being called with snd_soc_card parameter which has all possible FE dai links populated at once.

Queries:
1) can we register sound card twice during bootup, once with limited dai links and next with all required ones?
2) can we register dai links/dapm dynamically based on use case requriement?
3) If it is possible, could you share any reference from any other vendor who is able to achieve the same?.

Regards,
Shalini M
