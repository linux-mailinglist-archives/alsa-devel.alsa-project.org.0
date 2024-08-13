Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDC494FD35
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 07:27:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28237211C;
	Tue, 13 Aug 2024 07:27:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28237211C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723526844;
	bh=B3mG+kfjakc5UBBFZFl28yCRzGqVGuXiJuw460PvYAA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ixn5EulNlLAuS/U3DyfkPeF16na/wDh51oII2ZrHjIGIJDk0VZeNEACUE0S2bWYYT
	 eaVacOKZuh7LqoM8TKQnjkCpOj7hOTRYphoJw8p4xGkvnx4MgIIc7q2xEbc7+qZFE8
	 ba9oLNsPGcp9UgcsXV58ELw6puBBFak2WCEOXSq0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5621EF805AB; Tue, 13 Aug 2024 07:26:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B4E0F805AF;
	Tue, 13 Aug 2024 07:26:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14D7CF8049C; Tue, 13 Aug 2024 07:26:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from PUWP216CU001.outbound.protection.outlook.com
 (mail-koreasouthazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c410::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E971F8016E
	for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2024 07:26:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E971F8016E
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vyrXvb2l+E+ZhMs5mokN3wiJe05PSYZqKZg8xRGFQlX4tyH+fxLHefxfm8ZWkSGTgIItZjMNJq+nrgKtsMYmjdMzAKVnIw7bvV5E9hoM+w2sABr0Rq6lIeEwIw9gpVzhVJfNSjTJek9xh+7FeZECo5Iuez3drm1LHTjDk/lZreBDOsPNY2IY498Cnf0DYK8gXLXXOJzALmnMfjVr8Z4twsq1J7q8344F7Kfqi2Vg4uMWHHM7jvNiOGDSRp4jsaiQkaRKRe5Tf/ASqlV4PtqTtHCJP5O8cuRJnWuYIXaTJGdAEqA+BUupWNOaGnho1VPmn/rhVckfAZboI3ofs8EU5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hniFXpeXFM8f/yDu2tCjvFtUja1kcLrRI9rmqjXpJTk=;
 b=jjD2i3urNPTDPRrH96UUuMLU4zrR/68eDCWy18bxWHp1EZuXpVIKfm2eINYnbmiUsJ62pzLZ2xzIFJdcA35hoBKa+uObO/huqgfnuXKRLV6CG/m1D7HolSrdf+I+T7TimPZCGfalLd7jr88LNQ8aRSHf0Xe0EFd/jZZ7Lbwwzn7ExC+Xdt7RE6ye/NwFZwf18drLl2EYHfod3YNY6e2kRsrwjLJ43eCSShWilCOylcipl2TGEJqUTfeEk+2Nw08uOGsqO/uk0BExle9SlgYUQhenXAsVektluEEXXfSflNrlx6PYCo7ZEWjX7C2+I0T3XOVTXjjTptyMhj0S7Li3wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14c::11)
 by PU4P216MB2027.KORP216.PROD.OUTLOOK.COM (2603:1096:301:130::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 05:26:17 +0000
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756]) by SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756%3]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 05:26:17 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Kiseok Jo <kiseok.jo@irondevice.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] Add a driver for the Iron Device SMA1307 Amp
Date: Tue, 13 Aug 2024 14:26:07 +0900
Message-Id: <20240813052609.56527-1-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0078.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2::11) To SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:14c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB2337:EE_|PU4P216MB2027:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d4b6ad6-083c-4b59-e20a-08dcbb5874da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+vxA+zBrSoguUKXvd8dhu8tTQ+Ug0yKb+tYNVVtmp3+RJ+yXccIRvIE1xjeB?=
 =?us-ascii?Q?e6RpHzumFitMONkuv9pEh5On9JcQpHkz0V+oG6M8wZGid17EMTHW2NqbrJXW?=
 =?us-ascii?Q?qR9zmlWFb72+25xHTheiyo3C+O13QdBa5M/1cZ3QXP3Ey//87zGCke57/ZYu?=
 =?us-ascii?Q?HtDQSfcKFbTvXAEBs5BNFutMkfDVEfBAGqVagKfbOgOEZhzccIH+OYoEj0dV?=
 =?us-ascii?Q?NcgTpimP/jPiwfT911LSu2R7mXtB1E9hpkfPR2nUVVufKelnyKOKrawCytTv?=
 =?us-ascii?Q?3dkzmZVA1cdlPLN9Kf4d0M+5FNV8tZxmdCho2uMTQAi38zayuMkErgdDSvfO?=
 =?us-ascii?Q?O4whGnUs9DirgAAasYkRp4Of0H/ceYdr6q9QR94DX6HyhMoqfcC/mE06vfzZ?=
 =?us-ascii?Q?E7t9GUgjRO32xrWzitxTA5SQtlhn23o6HMLwupFoaTcNQoKyV0AVMpc/vQRN?=
 =?us-ascii?Q?JaMVO6OjXzZS7YlshUttoZfjztLMk0UoZ/HruFTeZHuJXqOBM8SMafN3K54c?=
 =?us-ascii?Q?0ITPpupJiQdJ3TkDboQvEDNbtvHWGKJdnP/UUFHwGG3W1JQtmkXzdl4ARRKN?=
 =?us-ascii?Q?lX9W/doA4trslyblyGtVKM3FHveMpeBlDgMgpn0TzuwvwDvRjaX7MdzInFIx?=
 =?us-ascii?Q?eWwlQ3nWAcIFGxFdodJClTQvREUBXEPEaj7UoXaP0bfIwAFLhDqhaymopRgC?=
 =?us-ascii?Q?DfZ6nTF758FKyJLAY2tgLoZXKJFxBTJ2Ef5F/xb1UDMGQKkQaXu7X7ox6/5/?=
 =?us-ascii?Q?oFEux+3pq1CmO2bvQjdEjbrQ46DXYM8gkbHHas5CW7GjEjif5ZlZL4qD0kRu?=
 =?us-ascii?Q?XZCaNKvw5UxHsOAVQ+Kr67q6nf/V3cIgThQM9FB4SYx3JiD1fnRr3JzZ1ssC?=
 =?us-ascii?Q?kK9KLQvErNxqcFaWD+K8ZBqEj6gYAcuELb5p/nPTsB0jijkJVDA207Qs6I4i?=
 =?us-ascii?Q?nkrj0iIqhe5fVN8d0YTIdKLXKN/wanvreAW0AEQ6u7AxHVCgmiqq2eBV/jVb?=
 =?us-ascii?Q?WrtkGr6rYJjwWblDoIS9ZQVXB85wTuZwjYAlDzeFqj9ltxpedJy2VtleyIl4?=
 =?us-ascii?Q?58VV3Hnpy1u+YBh0IBcjoxnIH10rxMfkoZN3Eu9swOaUGeRoYVFzEiqP0/PV?=
 =?us-ascii?Q?dBoGcnZ5z3tmXO8iTlYJ3Ond9GEnlD/SK4V9QbnWPSg/k/pzqqTnsq2Ya0y4?=
 =?us-ascii?Q?RODX+7KGv5FEGPT35fMg8RsHSF2FfH6+CdjDxBs+T7U6rRBAYQD7j9E40+OW?=
 =?us-ascii?Q?wnrTSQnzT/5VxcLpDKG0knpjqvOCT/NMQrrTh6uKbHXXIKnyg6l/vuAcRE32?=
 =?us-ascii?Q?HhJgy/HvTR0fpFIPgkcrSaM1dS2VWmgv/3meNbMtxNlBgUtFubRe84KmRJto?=
 =?us-ascii?Q?ZaNFrig+LNy8KxLFK7U8X+ktTe+1W29M6c5ey0qjVPI/keenSg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2337.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yBjGNjXW0Jg7829FxbQtOR+NogfIQMGS5HZU+jBapYSD92sxD3+e46WIv5kg?=
 =?us-ascii?Q?lyTF0YNEcSGIRa0QVaU484P7MVVUSr3OaFw5vRHIqXc6FzG6H4sA5wqVs87b?=
 =?us-ascii?Q?KC0xJ2urP1lW8DFYcaTqqT5FjPbmA17n0Ok6hlYNTCKn4aZFh962lpzHHDdF?=
 =?us-ascii?Q?btARuMuooIw1ZzBmzODdlLH+PfJfWVRW1UYnrKyNJa2ikixHISt9USHA4v61?=
 =?us-ascii?Q?vMU/JYYB3OMv8YcW8i+UrbIsDXmxTQSqv68eqwKOtaZBRVJDyBzvlmXO1V2W?=
 =?us-ascii?Q?63vBpSE5cTzeYv71GfOgOTgkm6+JPLPnTqLU63QmgOlU1jJp1XfT/VBJTX0Z?=
 =?us-ascii?Q?EJZL/GMJNr4f/1kF8RSY4WNZz5ZSjpu++3qlTYQEC6YoHI23eNR8e46SGLQ2?=
 =?us-ascii?Q?kndpdYvxTPx1dT4DAofj0DMHb74rurXmTt3v2lYF4/lnOGQKk6Ky2x0kk7rT?=
 =?us-ascii?Q?Vp4bKsZLFzf9lVLUTTl6JX2mXeltSObesoKYOOzokp20IkRS9yKo8FiX78M4?=
 =?us-ascii?Q?1HpfF/f4FuM2j5jTIH/LZEHpYYvowJKiyF9Lkdapejx8pTMwudvfWiJ5C0Mk?=
 =?us-ascii?Q?6T0pAV3qgrMyoajS3jDsmjtMoRhqsKZRY1OBsOILPW00zl7Lw38h2xLyU4Fy?=
 =?us-ascii?Q?tDga2bNFHDRHJPLQcdaWWxS5mcV6gU1OBVIuz1t6ZTp+RP4iFQ7jxKo1AEPK?=
 =?us-ascii?Q?WGR50Ii21HONEfFzCaVlknMs/1Iw4AhzHp1/MBJBk0ZjAgw5Ce35+dW55/Lu?=
 =?us-ascii?Q?4zEYajK1fpZqEuaXHkWu5gs1gDjSmVDIVYfBS+EDOAeSExdK2L6j1nO3rax4?=
 =?us-ascii?Q?z1zkGiL5i6Vx3kGnoWkqNtFkqJDCF+CBvBmOI8ZAkNNaQiEQgSnv8wFn/M1S?=
 =?us-ascii?Q?SODhvRDsyPCYjVHiAe+utNQ4PD8kumAULVR4LB99rZV+dZjUu6PhtmJi0TZ+?=
 =?us-ascii?Q?x+6/cSQh94h+g2vodzggoehvakdpKlk8Lg1mQGUhDGjPcmjGvrW15zzCJl7O?=
 =?us-ascii?Q?YXP/1mqf8N6mEAwlMU9nCVhpKVta3LD+qbl+ro2M5Vffoit0A/i48+NfROip?=
 =?us-ascii?Q?rmzlafD4wKgxpB/7vPaCdkllhmQpZmsqKC4qPBiKkGhoJ6X/Alta4UMTQp7m?=
 =?us-ascii?Q?ij7K1bRpjvD5zWJubsAclayJytyk2G/0W5BoeDJOTd7CTB0W+WKJgHsEmHMs?=
 =?us-ascii?Q?iPxcqZrNILXrFYk5TV8SHFYiQ5rwObw0A1yFx0NaBfZeUXD4Ved9vdIahPOu?=
 =?us-ascii?Q?UL3B/P7Y7BNGI0qcKdAzVx/m7zukonLiEyTqd7CZVM4u1exAxXQ5fq9uyK3w?=
 =?us-ascii?Q?R0FOH/iENXN59JJhOSvyLqaCls+5A6sjHRE3ywXYYdu0mU1qOZmM7nk+BGUW?=
 =?us-ascii?Q?YaZKnErEPCEqpZ8U6mTTkpFD4mTExfuorUf6YGmiR6NPFH63POLvVbcNYF+X?=
 =?us-ascii?Q?QkUIhdOkUw/VhEYUoDcMGxKMow1W2A1bKzLXeXNfeh+3fgYzp7ST58uuAdVw?=
 =?us-ascii?Q?KEcMAmZmnZN2E3dgxokM1QpWs1KYKTd71xnG8Fm8w7tuasd5YFrRZQM3vvNt?=
 =?us-ascii?Q?UYcwGZG1w3Zr2P9lE4XwugZxTaO+IQUW4NLYl7ZW?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9d4b6ad6-083c-4b59-e20a-08dcbb5874da
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 05:26:17.3036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 EJm08jXzZF6ZVfx3pktOyMk3hzk0q+Gh7zsl8+YzZBy/pYcArWSvTbtETTJn8KRMNN23HCluxeRfCrf/8X1oMNtvCNhNs6V65uXQIRRnnjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB2027
Message-ID-Hash: RYHBUFE6IJDIGXJX7KB6QVJVDSMOIDTA
X-Message-ID-Hash: RYHBUFE6IJDIGXJX7KB6QVJVDSMOIDTA
X-MailFrom: kiseok.jo@irondevice.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RYHBUFE6IJDIGXJX7KB6QVJVDSMOIDTA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This adds basic audio support for the Iron Device SMA1307 amplifier

Kiseok Jo (2):
  ASoC: sma1307: Add driver for Iron Device SMA1307
  ASoC: sma1307: Add bindings for Iron Device SMA1307 amplifier

 .../bindings/sound/irondevice,sma1307.yaml    |   67 +
 sound/soc/codecs/Kconfig                      |    8 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/sma1307.c                    | 2630 +++++++++++++++++
 sound/soc/codecs/sma1307.h                    |  456 +++
 5 files changed, 3163 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml
 create mode 100644 sound/soc/codecs/sma1307.c
 create mode 100644 sound/soc/codecs/sma1307.h

-- 
2.39.2

