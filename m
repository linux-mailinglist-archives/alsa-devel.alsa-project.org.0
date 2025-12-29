Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEPVLLJWqGlutQAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:58:42 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 415AC2037D1
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:58:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D03E60267;
	Wed,  4 Mar 2026 16:58:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D03E60267
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772639921;
	bh=3il4T2JwneCdTugRjzFQ/4dypsNUfF8vhPUzD1leOj0=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QYQAcj3nXZ4uQ+1WcLq8otZ7Dmyp1kOMh5aNEqBSHmaUikAGPkTG3fvej0/AoX8uL
	 kC8QzSJSBP3wZ2nFc4kXXjUN7vTWR9N+KWUhICFFjXOmEIE8HMhxUhsm4twtMIEd3T
	 PmaM5loB0DTT8RS0zZ0US6qGhPCqqYlyrHbbXxUI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 919E6F805EE; Wed,  4 Mar 2026 16:58:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67472F805EF;
	Wed,  4 Mar 2026 16:58:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDFCBF80533; Mon, 29 Dec 2025 01:20:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=BAYES_50,DKIM_INVALID,
	DKIM_SIGNED,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,HTML_MESSAGE,
	KHOP_HELO_FCRDNS,SPOOFED_FREEMAIL,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from CWXP265CU009.outbound.protection.outlook.com
 (mail-ukwestazolkn19011024.outbound.protection.outlook.com [52.103.38.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AFDC6F8007E
	for <alsa-devel@alsa-project.org>; Mon, 29 Dec 2025 01:20:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFDC6F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=LzosEkAM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yv1Z80gS8bTdjiw6DqcR/+e6aDDat1UcLIKm6cM7Cw3jIXaAj/LC3oxYY0LCPbKO2A/MvQp27pnCmxLZajcJ0+OcSpnP5ay5/3TS25ScLfsVcPydDNrWLvYrJHCiEyM1xivQxygNnLtCfs+fmqEak9zdjQI+JjY+RyOtd++hnt1w32pE4eSrcM3E2Cdwopywi96Syco6Rdu2vUPwj3gpn/t8z92yubHeWmh2fEvwYk2D/ih73Yos21BuBD2a+2nWdqRKOkpUssT39dyPD71uxwOVssNaEweCXXjpPxfL5LyE/lAIhSXJlq3ZTsn2iuEQIBECBe35zEi1lpRXJcD4Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89x7pzueKCLSHfQbs+fPIwh+rtOh1NhjK++VIcKPq5k=;
 b=oovDz6ZPwwsAmvWi8Lie2iewVTLqy7ZeCYCwRe/oSMyrMcmm2x1z7OB3ZDSg/ADAziKKzMy0bwiBS5maijwWEiLU0mlUPeiPNRRUoQd//qd6dkimu1lht23PXqzNz1/6vj3Z44BoD78KRYX+eaRKrNAc4dPAJqha4l3a1XW4Gtjrf0M1csyPqgSNglxUGrLjLqijWzpmP21O+bku9oQEoAY86KI0yxTTBp2GVfnz5li7p5eTZqRtnilx1ZDYV0RLIqo8lfxye+wZkYNCfvk3kWnW3/z4N+dipRMeybY4b5iKiLHFXTIZSMwvCqTEetaBNLWJDmhZ+x+GxwdAntg+wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89x7pzueKCLSHfQbs+fPIwh+rtOh1NhjK++VIcKPq5k=;
 b=LzosEkAMJjYG2UEC9ujK9L3kCKpbY7usvHNJa2c1KApAv2e4Dprd3McKoKld+cTFOrZTmH8wJhmljLUgwzd0P2Uur5tQw1PV8dY5dnT46sNwo/cAkci3si0Wvjcfve4ZAX/1K6QOJIP3mMHjGE7oa2CfDdSc9FzMRZ2zzVevAkVbOiYv5X3Rk652zNjJ5xSDhHtnHdueAIckSOd6N6UFZTkxPoxh39ORqMKzSYxHcpgfGnZAwnego87Rg/TRUZ3viDRRTD79NB9bGm0LC5iE69YTTqL6SeRxv6oBGi1cRTUOZriI2JoJIUmy1W2wDT8I8DQUcdugXhS/l8Knct0RCw==
Received: from LOBP302MB2325.GBRP302.PROD.OUTLOOK.COM (2603:10a6:600:442::13)
 by LO9P302MB1628.GBRP302.PROD.OUTLOOK.COM (2603:10a6:600:3f9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 00:20:07 +0000
Received: from LOBP302MB2325.GBRP302.PROD.OUTLOOK.COM
 ([fe80::effe:2765:164a:28c8]) by LOBP302MB2325.GBRP302.PROD.OUTLOOK.COM
 ([fe80::effe:2765:164a:28c8%6]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 00:20:07 +0000
From: NA NA <realgamehacker@hotmail.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"takashi@kernel.org" <takashi@kernel.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>
Subject: Add Linux (mainline kernel/ALSA) support for Creative Sound Blaster
 AE-9
Thread-Topic: Add Linux (mainline kernel/ALSA) support for Creative Sound
 Blaster AE-9
Thread-Index: AQHceFdbEr3o0pVc7U6XvDyMIrAjwg==
Date: Mon, 29 Dec 2025 00:20:07 +0000
Message-ID: 
 <LOBP302MB2325D63D0065F06DDF50E89CCDBFA@LOBP302MB2325.GBRP302.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LOBP302MB2325:EE_|LO9P302MB1628:EE_
x-ms-office365-filtering-correlation-id: 4a351b1f-265b-4aa0-d4de-08de46700575
x-microsoft-antispam: 
 BCL:0;ARA:14566002|39105399006|19110799012|15080799012|8062599012|8060799015|55001999003|31061999003|15030799006|461199028|20031999003|3412199025|440099028|40105399003|102099032;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?Qg5wMSlDCFpIeApszCQpTm30jI1+VBDPjQoE5xinL5ah75LrUsLKNGp5YB?=
 =?iso-8859-1?Q?SJLJVn7h6G/u+uzJDIQBCfyXIsx2fOkMMYM/AtDl+8KFZQf3/y/qaa4Wd1?=
 =?iso-8859-1?Q?R49BeaOZId4jQHqc36+ZAoGlDKRVsjC7F/GQJXHDGHa8vzgXHjMWnbdsVS?=
 =?iso-8859-1?Q?7mJ3s0bKHvKyzMDfZk/sGifuCHNsfXj/tUNpms2ODJdMNy2JgTm2w261Mx?=
 =?iso-8859-1?Q?ABp2XA69yn5atwwkZWuP4dGWEfOya/MkyKscTR30w78plJz9k/dldZE0i9?=
 =?iso-8859-1?Q?IxsIIJaNejBtRpUp5s7ISSMbq/HGPB828gTibHMCu57K6CqozpKn9Xd5b2?=
 =?iso-8859-1?Q?WKzxY8rhVsc2CUCjZZbx19kHAtR7R4ce4KMKKbSSxqVpvJU2W9oTItflmY?=
 =?iso-8859-1?Q?lpR/GYU01GGdGM4j6BtfUU3DUJ2fE3L0N3o3fIEMMXQmUgdZZrj3Xmnze6?=
 =?iso-8859-1?Q?pinwkuLUijR2aPrg3hINLSwy7RBqY/D6zVsjqyl7rNZzQQ2ChQxXbeYndo?=
 =?iso-8859-1?Q?lD+KKLwOFVnU5sQCaYSGgLEVAws6yyKswArf1n1oAEa4HgrRW4rUzFXFTi?=
 =?iso-8859-1?Q?HyQPVQ4Epa3oyBRZ2cJpbYrDWck35pMMwra56uGUOVmqIWUDHXigJr1b+4?=
 =?iso-8859-1?Q?vFA4dydeFfxVHOfg8CNS0YHZR2qKbS1/2hg/YTICY/Iml0bkymvtVQqPEH?=
 =?iso-8859-1?Q?2zTmAYdN6VWxsyuiilUnSwax5XjDG0o2ZvvRu7PPnAbkMTHTQ0QO/gKlRf?=
 =?iso-8859-1?Q?1fDbTzRGVKurfWHILsYno/JwG452B21Wm3z3O+upoP80+F7FpSLF0FHuAg?=
 =?iso-8859-1?Q?MbJyZWDtNOEhgUebYWq2tK2fRuuOcW17/xgW2BM+eA4BL2lisb47i1jE04?=
 =?iso-8859-1?Q?Y0o7y+up6+3rcBXDw1WsMxYm5iwJpvsYEyrIA75Rl9LC4ficijNB1QVi5g?=
 =?iso-8859-1?Q?N/+NzyjHDO+ybL0ecbadj+HSV3Xi198oRRhKF/2xTxtbEdqwS7I3CR+KCe?=
 =?iso-8859-1?Q?EiFdxInoj/dEiOY+rF9Kv3K7Mby4Mcp+mE5Wo1tkRY2jeLOn63EruDPM8b?=
 =?iso-8859-1?Q?0zxBH+4GYRsHFqNLo05p0Ef28xiepKN3/sTRLN9doih90IcjjcuBD190Ry?=
 =?iso-8859-1?Q?eSQCbfFtPIrV2dQLO5bheijS/SruDoS4NXd3oi1ytMq46ciHlRTCp2cFh/?=
 =?iso-8859-1?Q?2qSbdQnjzbqCkJ4CubPUZGvv+Y8a8nYuHzWR1TKMdO/vwogBNVCTfe1DR2?=
 =?iso-8859-1?Q?pMRAfVOLEPV6h0QmQ8B5EVvH93oDkTRhL2kntDPnTWwE1j1dMRwJ5sLbUx?=
 =?iso-8859-1?Q?CtlvEz1N/mxzY6virIaL1+R6Pg=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?nIqg9YryVaQ0VdcnJS4QINOTzTfh2H4d1mdMtMKRV1qfojXr49HMwIp4XZ?=
 =?iso-8859-1?Q?lpexwVaskE7HolExSU0WgDfkiHZy4/pqpVWVfc/0u4vTMqt5T6ez9krysG?=
 =?iso-8859-1?Q?MwMOFoF7p0wArNsJuCwsXgb5W4hgxD4Tm2ShNu7q+6I66NKIAjQECubgOF?=
 =?iso-8859-1?Q?uq2SYp4kT3J5uqhG1NewkEyD6HVVSc/4oJg/wI6MHaqkNJ5FGIpPcffj6E?=
 =?iso-8859-1?Q?6xrl1s1RHxrV7quVxo11rqYFg+ylciLNBwjCaxC94eV00+KSxvmTFYfYCL?=
 =?iso-8859-1?Q?DdYxVga30EuxHuVYnc2a2qHPBgCtZTMQd6xE7O2ol3OV86SbMI4mnnV5eu?=
 =?iso-8859-1?Q?WUsaAyuNCSzeTBg1W75ySmSWwUV2tr2EaR4Q497zMUdKMCNXoR6XSuxIBj?=
 =?iso-8859-1?Q?I6nwD3wWzJHLlSE8DaFhEeIQvp5qlsiXMwdC3QqK9xMXa/sJVNtV2sEmFG?=
 =?iso-8859-1?Q?jtGEXLe5+n2ov0Vlemd/seI+vrsjYcAxYU1VmkYQN4N/mcPQZ5UaGNx9lo?=
 =?iso-8859-1?Q?BZDnZYtK2UIhql2cFor0Q3CWL5OiTGyEU1atgyVhdzj+FqPJFcTn7oBfSI?=
 =?iso-8859-1?Q?0rgXdFcXPUu0WUxDQrMlb7JmtcJx4XTlr2g5fHX2GGzQBujQ0GCjfJEWhW?=
 =?iso-8859-1?Q?jcFUupbB2qA1JwZsU4NRiBl0JMRee1nzZTUGQj+vcV9RocwO252I7yKMol?=
 =?iso-8859-1?Q?3EHIxmdTzvKclBLmcSzm9dKH0h7aTDQECeugUV9+SCzAVBQq5kKcrFlElL?=
 =?iso-8859-1?Q?MnfDUwPPkqU0KyOfTv3KFqDEFbSF0ws/J2DivpW9NCokAZ1KeL5UYy8p6m?=
 =?iso-8859-1?Q?DxTxLV5iNuFjqnpc4EaJ4Tben5yjLaE/uShVo8mSMiRenDj+VBFQRyla2Z?=
 =?iso-8859-1?Q?EV6QsxS7WqNhMAt4Jqhk79xrNjRscJhyUUr+1OhhyTj7z3V9Z1Nd5KfAYE?=
 =?iso-8859-1?Q?tLPxcI04D0CSAwShNPus8B0j1e5DHFV/vZ2BxoCk1smgll4pNNqiFTm8pV?=
 =?iso-8859-1?Q?L2z1cZiKW+5TMhBRyErhvcjVangdSFsSRtDRRuODNVr9vBQ0J+DAliPgo1?=
 =?iso-8859-1?Q?e8or0q5pcogdityZ8WTRs3+mR4vvTua9vct7xYndnjLuHxtnKL3pcwTiyP?=
 =?iso-8859-1?Q?GJ50xARkldY8AR+V/YhjiLheL+ZRNED86Vz0qskfuDPYZyrexSzcGQXfYd?=
 =?iso-8859-1?Q?wl6oCW9sM1YGvSPm5Ozaa/CnCFlLMLnYq1JOH5oX+deh4sbR83T9oDx3kY?=
 =?iso-8859-1?Q?aHaGOcc0QVNFlC0gW8HbYt64xi8gPdTOInjIX95kmM64nv2OLizpNrPffG?=
 =?iso-8859-1?Q?ocnxW90Z9SYv/R6GMRiAuTkW/hJbnKwbVvSJ3UXl8pWHRB+5IiXolr4O8K?=
 =?iso-8859-1?Q?schXfGdroptII+IgBBvp533c7XcyNyNwTYTT8B6vUS0wPh96KIpFMkQBYP?=
 =?iso-8859-1?Q?GgDjk6WCZ3gDbfDE?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-e5553.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LOBP302MB2325.GBRP302.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4a351b1f-265b-4aa0-d4de-08de46700575
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2025 00:20:07.4539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P302MB1628
X-MailFrom: realgamehacker@hotmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NEZFVOY7ZW3LR2TMLAVVEWZB4PUDWIYY
X-Message-ID-Hash: NEZFVOY7ZW3LR2TMLAVVEWZB4PUDWIYY
X-Mailman-Approved-At: Wed, 04 Mar 2026 15:58:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Content-Filtered-By: Mailman/MimeDel 3.3.10
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3RMFEWKMHBVHIEDSSCR3BNU2OO3TUKOT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 415AC2037D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.39 / 15.00];
	DATE_IN_PAST(1.00)[1575];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[hotmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_REJECT(0.00)[hotmail.com:s=selector1];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:rdns,alsa0.perex.cz:helo,LOBP302MB2325.GBRP302.PROD.OUTLOOK.COM:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+,hotmail.com:-];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	FROM_NEQ_ENVFROM(0.00)[realgamehacker@hotmail.com,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[hotmail.com];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	TAGGED_RCPT(0.00)[alsa-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hello ALSA/Linux sound maintainers,
Please add support for the Creative Sound Blaster AE-9 to mainline Linux (k=
ernel/ALSA).
I've been looking to switch to Linux for years but the lack of support for =
Creative Sound Blaster cards have always stopped me, But with all previous =
sound cards I've had over the years, I was at least able to boot up a Linux=
 Distro and test it out a bit.
But this year when I really wanted to make the move away from Windows 10 I =
discovered that no Linux distro at all can boot, each one I tried POP, Mint=
, Arch, Manjaro, Zoran, Fadora (Names could be messed up because I tried so=
me I never heard of before) before I discovered it was because of the lack =
of support for my Sound Card, So I tested removing it from the system, and =
then Linux would boot.

Thank you for your time and for maintaining the Linux sound stack, Please g=
et support added so I can finely move to Linux
