Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMoNBi1PqGmvsgAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:26:37 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5BE2029FA
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:26:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA7D36023D;
	Wed,  4 Mar 2026 16:26:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA7D36023D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772637991;
	bh=ZPo0z1HDq6hGlyJM/6NOKg3xHq2/cS1gHHNAJBN3qVI=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ACTvWoIDidh7mNKIvI+efnJLi7/eg3nT9ydoeuOMqSuyTG6XD59KBG8mpqizBVmWR
	 NXDnGmpqjC7+OJKkIcVIx/llXPFHm4cwxVSBY+aAeDSziVObzpGJBh0X1EXUULSZos
	 t0hiCetqocEz//XL7aYI1QxRNrlq4Kd/EdB371dw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EB41F805EE; Wed,  4 Mar 2026 16:25:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BC7BF805EE;
	Wed,  4 Mar 2026 16:25:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97F19F80448; Wed,  7 Jan 2026 23:26:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,HTML_MESSAGE,
	KHOP_HELO_FCRDNS,SPOOFED_FREEMAIL,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazolkn19011057.outbound.protection.outlook.com
 [52.103.14.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C22AF80075
	for <alsa-devel@alsa-project.org>; Wed,  7 Jan 2026 23:26:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C22AF80075
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=diPRsHOb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qz3di/Ip++oXgmJGqdDJqxRJUyRKvyojj+dDbXU+xD74MG2d1k+FR3cOy7H8E+yE8qvLVVJsGOoshLj81jhVBnDO6Ax1brkzTwNP6QacWmjm7Q4HYyaOELFJjbvKwvw3eeR9FJVCFie1+zeUnH/yrEc/2bhLPBXcmxjor7g1sc6+sZkjYocMC8IkHGicRoMY8Dt3bIAUmfWu7kJeVfQZmxiBTjeMpVs+UmfqDImdvxVxOpTHd53oebseV2mKnbFWZHODXQ6T/kIv8pvgl9riRb90P6/r4obbbp8zFQVxyUrJEJH+gVMxwQbQoqrXwni938W4O9dyIoq9cyip8VtsRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0ZpOzBN7TWMMzyUSRg87LAQN+jhC4/Gf96548ojgaA=;
 b=ohK1H15mHDTEVgMplZpapSBnnxpz8cxK0BlbPkRARAJyTBCoE2A5BPLOxPFqJ6I4JhAN5UFC5lUJEZlaqm800G38lvUTKVdDaH9RLC4w0BXcG9NLIpZkfJNVYY6OsK+oxbqaVqNxMui14suZ6oTaLeIsjfdUIPjdnXVwBRbWTytFSf6h6jxtNnadhusdy84ZfscZT3iAcXuH0M3r/TsmqiXVKVRAZB0PnRuc8MIHisLSwDyEguM4YQRXnQVc6laIPjGQa2B5bZ4IiTvJrB/jMhijgiIYc8k+fmwDsQlVIhktwb8A6vac9pWL+YQRgdhaQ3hqn062LvoTRfILjySt9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0ZpOzBN7TWMMzyUSRg87LAQN+jhC4/Gf96548ojgaA=;
 b=diPRsHObrjcm6irzssoNLD7PFXZ1ODEZK2AUHn2HrxlwMAE2i6346F9VQu5C/g7W/o5VjqIyWoyWxJsxzzdk5+b8IobjBvY0qf5rQ9xPurQzqWYpYl9IlmzHmIya+1KPp3iJiHTmcWEV+qmSfsBdnJHqCCvaiWtEkQUicaMxizNR1d95/CJfwhRzP+J3AscQ7K+1A3AlGcdTetuJI4M4GTubkHrQFpP211/eZd64dbyfB2AO3/dncIC7iYNpbIMVahMoo9uyxXzoHWvYjF/qZQY/S2GhefCUdLO0yws0YrFLcfJ2z8LuBFcl6iVrdNe6KeHc+f9DXNwyl8tQC+/jBw==
Received: from PH3PPF0A8D5CDB5.namprd10.prod.outlook.com
 (2603:10b6:518:1::788) by IA4PR10MB8687.namprd10.prod.outlook.com
 (2603:10b6:208:564::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 22:26:31 +0000
Received: from PH3PPF0A8D5CDB5.namprd10.prod.outlook.com
 ([fe80::4651:2a3d:d218:af33]) by PH3PPF0A8D5CDB5.namprd10.prod.outlook.com
 ([fe80::4651:2a3d:d218:af33%8]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 22:26:31 +0000
From: =?iso-8859-1?Q?Jos=E9_Augusto_de_Almeida_Neto?= <jaalneto@hotmail.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: [BUG] Samsung Galaxy Book 4 Ultra - MAX98390 speakers not supported
 on MTL platform
Thread-Topic: [BUG] Samsung Galaxy Book 4 Ultra - MAX98390 speakers not
 supported on MTL platform
Thread-Index: AQHcgCR51UwMs4gMz0Wk+HCsBgwmhg==
Date: Wed, 7 Jan 2026 22:26:31 +0000
Message-ID: 
 <PH3PPF0A8D5CDB5873FA91A7F768F4E2F10D984A@PH3PPF0A8D5CDB5.namprd10.prod.outlook.com>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPF0A8D5CDB5:EE_|IA4PR10MB8687:EE_
x-ms-office365-filtering-correlation-id: 26b369c3-14d2-4f89-efba-08de4e3bceb5
x-ms-exchange-slblob-mailprops: 
 AlkLxVwsndl/rxNUOXMa9JcMokG6ISaNrqS2zC2iebsreG8rKGzNoGTKuHAOBM6SzSQ7wu/ZTSXdjL4a+bWfBt3tW6t0ZZvmao7f0fT4B+4EkdN92dEqnmA1CU0o/0S/AcAHx2hrpeu/Cc9rE3u4mMffpJslpPLTEeTSeLyRjnV8cGmk+mHpIucPCWMVhqy3IaHn/GwxwOFeCmIulZKtJYghZq+HD62yXpUvbq78fvLKqnPXgn3P6PFtNcwiym89MLR7/0FVRpkCjddFeCWYnxwXEsnS18VYkNA2zn7e7tNtaJIc4paacAjRR7DYESt82L/oClWhumafj7Kp/dx/sYf0StgKTFxGHooCceZIVzwCCpOCph25GnrUdXJugch1NgiR0tNlO1V3sfDeQ77S/sFsZOPmy1067vw1yyX4/2fNZJAELjpvpUnohtlLzlMSxKrisxiUbPmmIrs3ys85fjcdBMJPnuAp+6jX4kh40LFV6uA7chA+USNRgyVWV2xTvtaejL2RXxy+iH/iJqfOBF2ZM6FkcOVpXmia4lDO1KYTqlyoZTaGyuHC/Sh7GMxh3lIv3OFMhhsVKybUjhK14Bi1wsbr0GW3gUaFq1JDf5TkLYa6Ie9xeSM71YqYGKtFApBQn55Z+Ubg6Ls2hLOdSy8zljwkU1m9jQF7QcAgdPS+FpUKJ23leNli5WX985LbAHnvYtfloBis2hCvx0friw7WjBfcKM4Lmg1oatgawbF6QKAoAoM90O+Hwacr8NJJQOrOtAEe+vX3sC1COtskzr6u9EzFIk5C
x-microsoft-antispam: 
 BCL:0;ARA:14566002|15080799012|461199028|31061999003|8062599012|19110799012|8060799015|39105399006|20031999003|55001999003|15030799006|6092099016|40105399003|3430499032|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?IDseDviBXi3jW++r4zxbxw/4DB3e32gUWmincPh96gn5Wl3KqP9+vExx4A?=
 =?iso-8859-1?Q?JP7qaS65Eng8kVn1X4pW7UexpduHf1+wQWTriyyNbM7RqlDhh4+bgKQwOi?=
 =?iso-8859-1?Q?OlY9KjH9mpVW1XyFb24v4YdkX615HUtkkRRS2JfR9lNtZOrIZ5/GWfyaJ+?=
 =?iso-8859-1?Q?y4jdSgb3m1HE2WW2e9s19NW68wyxvFZVze3ZhjExpwdurag7CSb+8YTn+n?=
 =?iso-8859-1?Q?drdWPtd7TIEyhMu47qeTC4TRRHC5aVeQKlRhjGf/bl9/MUD+XH2eyrI2xJ?=
 =?iso-8859-1?Q?+86vD3HwhFHsMP8VfqmTlEUzywZnvrog/hayqV6aASGmavKB7ZOqDbinK2?=
 =?iso-8859-1?Q?+HDbRZ61acrNjtPGElagZ6ANCiKYYhQkPDmRzas96+j2LKcNfb3s9ybf1w?=
 =?iso-8859-1?Q?o0PhVw8K5nnrMPe3R1b4rMVhnXoaeH+7+qJnNjXWnl0RLf+YzwFTQcfg4x?=
 =?iso-8859-1?Q?rYFp13wd/h5PsotxHoTGUvZG76drnVO+PqI5q15XPvVPmd/XXlFEwruyQm?=
 =?iso-8859-1?Q?rJ1v87juBbRH3gSNbU4c1y7ZqR7m9ZzjZQ7nx5K2obUWcIWQyQqbbZUUkb?=
 =?iso-8859-1?Q?vszuOVRNA+meO/OM6B0gFADfnanxY+2xIbOr3Osu4SHMRgPrGAYO4YsoGI?=
 =?iso-8859-1?Q?TXNeaQHQkEdlo+5S/JrBu4LeIBqvY98NWW4MzshEKbcNMo8/CY+8lDEoTS?=
 =?iso-8859-1?Q?OA7a4zArVthChk1LzjcdCuV68onVxwOUn3R6x2gudQ4qdycTeFoWPCBgtr?=
 =?iso-8859-1?Q?DedTKxjWFkf2Wmolj84A8iVDvknDXzQ38wp5MHUo2rD662CbaIS9dTU+2d?=
 =?iso-8859-1?Q?HvsuWWNJSLAYOh5sIUOPqsQ5kw61MRce8r6Tuak+IUsSG+Qiq+0UDRxTTG?=
 =?iso-8859-1?Q?IYR3eGjJ/4e0sQBlr/yl2aks5blqkAhHQj4j9eK3BV+eTZb75oZ3qHMXJa?=
 =?iso-8859-1?Q?F5mCwWLi+atDTIi36Del5Tkut+V3djAJujFfpKAWAelYfianA1AvTU3wDp?=
 =?iso-8859-1?Q?ZRT0KqKN6mLbtamEAcWfBIYFKz02o9NJ2rnQjEgMPARKXz6tKO6WPbRFSc?=
 =?iso-8859-1?Q?o2vKQdySEwIXBq412w64zqztamNIx0sQX18KN2pU5mnvi31STID7ADq2sy?=
 =?iso-8859-1?Q?OpakXXCmM4Qyv7lRowbnIoY3cGU/eKp6oa+PFMQu5oY/qHR7eJl9pVNAb8?=
 =?iso-8859-1?Q?33pcCpHKBpUN5YYXjmsLGuIIqkhMcVlgG3LNISORD52bDmW/EpZfmLBJUL?=
 =?iso-8859-1?Q?CVW2Y2N6Si6803LcszT3FtUIMVaO6Z41qudSPmIA6mZHLXvh1v+KgA8EAW?=
 =?iso-8859-1?Q?ZcxNuQuFOHyMxsGg68QXvb8UGvYEl/awEDK8r0TzUXvdvNkhMu6wW2wHyS?=
 =?iso-8859-1?Q?4mVI3nvhLQ?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?cdUuF70AyaUQEUAXynP1yqJw+xXaYdVGAVU8FRCZwdUEYdqNJC++vqY8T5?=
 =?iso-8859-1?Q?9vIlXPYuXvs9qlL0NIrCvX33K++ZOso+npZjzIKk/0tjhqwgmnpduKelV2?=
 =?iso-8859-1?Q?A5tj3DCeY/sfekz/PTUd/tI/fnrTH2A9YGl1GmEAmFbXMvwZeGjNYgjunR?=
 =?iso-8859-1?Q?RHKdd8oKXVA4IKwSxrDjczqElCKT6Ba6OhPoLK+90HbvL8cCvoKMEQL5nq?=
 =?iso-8859-1?Q?hih2v7Nbazw9KBAnrFWTbLuEFVfM1QpSjFBET5WzMadK+7QlhlJgl1XFjk?=
 =?iso-8859-1?Q?dkS5F1loFAInIHJwcDjd6nFt2DLgW6Aok4Ex23tgW8qQFQCLFtBDyoU4/T?=
 =?iso-8859-1?Q?6KXQyEJAdv/8Rz/ljK2l0DQO3e27rooPaxAFs1hqn5e7qqAlfHs0r+kSw4?=
 =?iso-8859-1?Q?rEybvqCBSaa2lus3j+dKKXiNin1+ugk/8LkUs3csjiLzNkDKQQbKwEpOH3?=
 =?iso-8859-1?Q?h6Fp8pq/95pkjUxMeYfdvzsFRMbYJeq+176mnRxb2o7fl7DxRTGnD3g5P1?=
 =?iso-8859-1?Q?ZJFvV3rJFcdf4mILKOuPhpbWadT6fDg6E85uGP2CHh19cV0crGJ4WVX/eK?=
 =?iso-8859-1?Q?IRTKPwnzP12z0bvV3RsHwDdZKeA7+nHYdntelN2JTO74ylv63lqOHGSPfo?=
 =?iso-8859-1?Q?ChewJ6k7aPA4gKlwRfrm102C6H1FpaK8D1Q/Qv9zeq+L7gMYvRu1Xeub+/?=
 =?iso-8859-1?Q?7ZljSpdb76LQK8yZGmtTuEwDnSEuHSTqPmfTJNUNrfTJVKXcXAA3rVQguE?=
 =?iso-8859-1?Q?Wmv1zuLapIHz0cQwan2IW9O0/LWqgtpwnpfYZatGjzg4dgmec54ptf4ztK?=
 =?iso-8859-1?Q?0w7lgsToLEt/74hxJ6OQEqY64jHjA3rtlpXp6LbPHnerVk6xvTd69EX9zE?=
 =?iso-8859-1?Q?vw9WAr4OFavzJWAopUuA64wXRVom1uIEDfvtuZKo6lQ8DLKI4rljOaZkyO?=
 =?iso-8859-1?Q?gybIx3ZGYrs4DSIVa7MDkUlWvIGkkFTdp88n2vyxY/ZV6th2ZxK0vLEdPz?=
 =?iso-8859-1?Q?BDTTUjHmg/TmiRGmvgif4FZjKNoNawpc8qpxIYY/ws4+DwDhx2bInb+yu8?=
 =?iso-8859-1?Q?sCZJtVd2Mxu5h6cGQweHnPecAiXM50zqmyd+I8LRlCfclC4W5UxtcDfSoz?=
 =?iso-8859-1?Q?elrnwrE61JXpcT/Wmc31NdHloxirRLfJn/pqmN1K2xdot70uyIOGKVTASZ?=
 =?iso-8859-1?Q?ZH2+WuhYgtYuLtur0SkUs7Cfo+Y+zfkbUdfak05mfpWhJkl8pjyUsBSVj8?=
 =?iso-8859-1?Q?WVwQH2Yl7mHCj5bU9bgYDREE6oBT454NEMNCCSynCq2YvAFi44/91/55T/?=
 =?iso-8859-1?Q?/cflT1ukJv9y7JA0fSAyHc6G7D7/l+PAus1zQkJys/9V9WH0+2oM8NkvPz?=
 =?iso-8859-1?Q?MsBYr8iT33CE2Go4tAaNQFcllezBpJ2GuBYnIIIxkiegxqVs7P0lpzFlov?=
 =?iso-8859-1?Q?xRaPRFkrU7jAgYE2cQLsROqtd4dPbOBAIIM8b7a54RRYsdPRlaflaO+Khk?=
 =?iso-8859-1?Q?4=3D?=
Content-Type: multipart/mixed;
	boundary="_004_PH3PPF0A8D5CDB5873FA91A7F768F4E2F10D984APH3PPF0A8D5CDB5_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-25888.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 PH3PPF0A8D5CDB5.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 26b369c3-14d2-4f89-efba-08de4e3bceb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2026 22:26:31.0724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8687
X-MailFrom: jaalneto@hotmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZMK6JPU72RAY33D7NDUC4E4C6HF6GGN5
X-Message-ID-Hash: ZMK6JPU72RAY33D7NDUC4E4C6HF6GGN5
X-Mailman-Approved-At: Wed, 04 Mar 2026 15:25:49 +0000
X-Content-Filtered-By: Mailman/MimeDel 3.3.10
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XXV6UQ5D2NS2PAEOKDLADLAJ22DDM7UL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: AB5BE2029FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	DATE_IN_PAST(1.00)[1337];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[hotmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[alsa-project.org:+,hotmail.com:-];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	R_DKIM_REJECT(0.00)[hotmail.com:s=selector1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa-project.org:dkim,alsa-project.org:email,alsa0.perex.cz:rdns,alsa0.perex.cz:helo,PH3PPF0A8D5CDB5.namprd10.prod.outlook.com:mid];
	FREEMAIL_FROM(0.00)[hotmail.com];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[jaalneto@hotmail.com,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	HAS_ATTACHMENT(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

--_004_PH3PPF0A8D5CDB5873FA91A7F768F4E2F10D984APH3PPF0A8D5CDB5_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi ALSA developers,

I'm reporting a hardware support issue with the Samsung Galaxy Book 4 Ultra
(NP960XGL-XG1BR) running on Intel Meteor Lake (MTL) platform.

SUMMARY:
The laptop has MAX98390 smart speaker amplifiers that are not supported in
the current Linux kernel. Headphones work (ALC298 HDA codec) but speakers
are completely non-functional.

HARDWARE:
- System: Samsung Galaxy Book 4 Ultra (NP960XGL-XG1BR)
- CPU: Intel Meteor Lake-P
- Audio Controller: Intel MTL HD Audio (8086:7728)
- HDA Codec: Realtek ALC298 (working for headphones)
- Speaker Amps: 4x Maxim MAX98390 on I2C bus 2 (addresses 0x38, 0x39, 0x3C,=
 0x3D)
- Kernel: 6.17.9 (also tested on 6.8.0 mainline)

ROOT CAUSE:
1. No machine driver match in soc-acpi-intel-mtl-match.c for Samsung + MAX9=
8390
2. No SOF topology file for MTL + HDA + MAX98390 combination
3. NHLT only shows SSP2 (Bluetooth), no SSP configured for speakers
4. SOF falls back to generic skl_hda_dsp_generic (2-channel HDA only)

VERIFICATION:
- MAX98390 chips respond on I2C (revision 0x42 confirmed on all 4 chips)
- ACPI device MAX98390:00 present (status 15 - enabled)
- ALC298 speaker DAC receives audio but no output from physical speakers
- No I2S/TDM connection to MAX98390 amplifiers

I have collected detailed technical information including:
- DSDT and NHLT ACPI tables
- Full HDA codec dump
- I2C bus scans and MAX98390 register reads
- dmesg logs showing current SOF behavior

Full detailed report: BUG_REPORT.md attached

QUESTION:
Is there ongoing work to support MAX98390 on Meteor Lake platforms?
I'm willing to test patches and provide additional debugging information.

Thank you,
Jose


--_004_PH3PPF0A8D5CDB5873FA91A7F768F4E2F10D984APH3PPF0A8D5CDB5_
Content-Type: text/markdown; name="BUG_REPORT.md"
Content-Description: BUG_REPORT.md
Content-Disposition: attachment; filename="BUG_REPORT.md"; size=6792;
	creation-date="Wed, 07 Jan 2026 22:26:17 GMT";
	modification-date="Wed, 07 Jan 2026 22:26:30 GMT"
Content-Transfer-Encoding: base64

IyBMaW51eCBLZXJuZWwgQnVnIFJlcG9ydDogU2Ftc3VuZyBHYWxheHkgQm9vayA0IFVsdHJhIC0g
TUFYOTgzOTAgU3BlYWtlciBTdXBwb3J0IE1pc3NpbmcKCioqRGF0ZToqKiBKYW51YXJ5IDcsIDIw
MjYgIAoqKlJlcG9ydGVkIGJ5OioqIGphYWxuZXRvQGhvdG1haWwuY29tCioqVG86KiogbGludXgt
c291bmRAdmdlci5rZXJuZWwub3JnICAKKipDQzoqKiBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5v
cmcKCi0tLQoKIyMgU3VtbWFyeQoKU2Ftc3VuZyBHYWxheHkgQm9vayA0IFVsdHJhIChOUDk2MFhH
TC1YRzFCUikgd2l0aCBJbnRlbCBNZXRlb3IgTGFrZSAoTVRMKSBwbGF0Zm9ybSBoYXMgTUFYOTgz
OTAgc21hcnQgc3BlYWtlciBhbXBsaWZpZXJzIHRoYXQgYXJlIG5vdCBzdXBwb3J0ZWQgaW4gdGhl
IGN1cnJlbnQgTGludXgga2VybmVsLiBTcGVha2VycyBhcmUgbm9uLWZ1bmN0aW9uYWwsIG9ubHkg
aGVhZHBob25lcyB3b3JrLgoKIyMgSGFyZHdhcmUgSW5mb3JtYXRpb24KCi0gKipTeXN0ZW06Kiog
U2Ftc3VuZyBHYWxheHkgQm9vayA0IFVsdHJhCi0gKipNb2RlbDoqKiA5NjBYR0wgLyBOUDk2MFhH
TC1YRzFCUgotICoqQklPUzoqKiBQMDlBTFguNDMwLjI1MTAwMi4wNSAoUmVsZWFzZSBEYXRlOiAx
MC8wMi8yMDI1KQotICoqQ1BVOioqIEludGVsIE1ldGVvciBMYWtlLVAKLSAqKkF1ZGlvIENvbnRy
b2xsZXI6KiogSW50ZWwgTWV0ZW9yIExha2UtUCBIRCBBdWRpbyAoUENJIDAwOjFmLjMpCiAgLSBW
ZW5kb3I6IDgwODY6NzcyOAogIC0gU3Vic3lzdGVtOiAxNDRkOmMxZDgKLSAqKktlcm5lbDoqKiA2
LjE3LjktNzYwNjE3MDktZ2VuZXJpYwotICoqRGlzdHJpYnV0aW9uOioqIFBvcCFcX09TIDI0LjA0
IExUUwoKIyMgQXVkaW8gSGFyZHdhcmUgQ29uZmlndXJhdGlvbgoKIyMjIFdvcmtpbmcgQ29tcG9u
ZW50cwoKLSAqKkhEQSBDb2RlYzoqKiBSZWFsdGVrIEFMQzI5OCAoY29kZWMjMCkKICAtIEhlYWRw
aG9uZSBvdXRwdXQ6IFBpbiAweDIxIC0gKipXT1JLSU5HKioKICAtIEludGVybmFsIG1pY3JvcGhv
bmU6ICoqV09SS0lORyoqCgojIyMgTm9uLVdvcmtpbmcgQ29tcG9uZW50cwoKLSAqKlNwZWFrZXIg
QW1wbGlmaWVyczoqKiA0eCBNYXhpbSBNQVg5ODM5MCBzbWFydCBhbXBsaWZpZXJzCiAgLSBJMkMg
QnVzOiAyIChpMmNfZGVzaWdud2FyZS4yKQogIC0gSTJDIEFkZHJlc3NlczogMHgzOCwgMHgzOSwg
MHgzQywgMHgzRAogIC0gQUNQSSBISUQ6IE1BWDk4MzkwCiAgLSBBQ1BJIERldmljZTogTUFYOTgz
OTA6MDAgKHN0YXR1cyAxNSAtIHByZXNlbnQsIGVuYWJsZWQpCiAgLSBDaGlwIFJldmlzaW9uOiAw
eDQyICh2ZXJpZmllZCB2aWEgSTJDIHJlYWQpCiAgLSAqKlN0YXR1czoqKiBEZXZpY2UgcHJlc2Vu
dCBhbmQgcmVzcG9uc2l2ZSBvbiBJMkMsIGJ1dCBOTyBBVURJTyBPVVRQVVQKCiMjIFJvb3QgQ2F1
c2UgQW5hbHlzaXMKClRoZSBTYW1zdW5nIEdhbGF4eSBCb29rIDQgVWx0cmEgdXNlcyBhbiB1bmNv
bnZlbnRpb25hbCBhdWRpbyBhcmNoaXRlY3R1cmU6CgotICoqQUxDMjk4IEhEQSBjb2RlYyoqIGhh
bmRsZXMgaGVhZHBob25lIG91dHB1dAotICoqTUFYOTgzOTAgYW1wbGlmaWVycyoqIChJMlMvVERN
IGRpZ2l0YWwgaW5wdXQpIGhhbmRsZSBzcGVha2VyIG91dHB1dAotIFJlcXVpcmVzIFNTUCAoU2Vy
aWFsIFN5bmNocm9ub3VzIFBvcnQpIGNvbm5lY3Rpb24gZnJvbSBTT0YgRFNQIHRvIE1BWDk4Mzkw
CgojIyMgSXNzdWVzIElkZW50aWZpZWQKCjEuICoqTm8gTWFjaGluZSBEcml2ZXIgTWF0Y2gqKgoK
ICAgLSBGaWxlOiBgc291bmQvc29jL2ludGVsL2NvbW1vbi9zb2MtYWNwaS1pbnRlbC1tdGwtbWF0
Y2guY2AKICAgLSBObyBlbnRyeSBmb3IgU2Ftc3VuZyArIEFMQzI5OCArIE1BWDk4MzkwIGNvbWJp
bmF0aW9uCiAgIC0gU09GIGZhbGxzIGJhY2sgdG8gZ2VuZXJpYyBgc2tsX2hkYV9kc3BfZ2VuZXJp
Y2AgZHJpdmVyCgoyLiAqKk5vIFNPRiBUb3BvbG9neSBGaWxlKioKCiAgIC0gUmVxdWlyZWQ6IE1l
dGVvciBMYWtlIHRvcG9sb2d5IHdpdGggSERBIGNvZGVjICsgTUFYOTgzOTAgYW1wbGlmaWVycwog
ICAtIE1pc3Npbmc6IGBzb2YtbXRsLSotbWF4OTgzOTAqLnRwbGdgIGZpbGUKICAgLSBFeGlzdGlu
ZyBNVEwgdG9wb2xvZ2llcyBvbmx5IHN1cHBvcnQgTUFYOTgzNTdBLCBNQVg5ODM2MEEsIE1BWDk4
MzYzIChkaWZmZXJlbnQgYW1wbGlmaWVyIGNoaXBzKQoKMy4gKipObyBTU1AgUG9ydCBDb25maWd1
cmF0aW9uKioKCiAgIC0gTkhMVCAoTm9uLUhEIEF1ZGlvIExpbmsgVGFibGUpIG9ubHkgc2hvd3M6
CiAgICAgLSBTU1AyIGZvciBCbHVldG9vdGgKICAgICAtIDJ4IERNSUMgKHdvcmtpbmcpCiAgIC0g
TWlzc2luZzogU1NQIGNvbmZpZ3VyYXRpb24gZm9yIHNwZWFrZXIgYW1wbGlmaWVycyAobGlrZWx5
IFNTUDAgb3IgU1NQMSkKCjQuICoqQUNQSS9EU0RUIENvbmZpZ3VyYXRpb24qKgogICAtIE1BWDk4
MzkwIEFDUEkgZGV2aWNlIGRlZmluZWQgd2l0aCA0IEkyQyBhZGRyZXNzZXMKICAgLSBObyBHUElP
IHJlc291cmNlcyBkZWZpbmVkIChwb3dlci9yZXNldC9lbmFibGUpCiAgIC0gTm8gU1NQL0kyUyBj
b25uZWN0aW9uIGRldGFpbHMgaW4gQUNQSSB0YWJsZXMKCiMjIEN1cnJlbnQgQmVoYXZpb3IKCmBg
YAokIGNhdCAvcHJvYy9hc291bmQvY2FyZHMKIDAgW3NvZmhkYWRzcCAgICAgIF06IHNvZi1oZGEt
ZHNwIC0gc29mLWhkYS1kc3AKICAgICAgICAgICAgICAgICAgICAgIFNBTVNVTkcgRUxFQ1RST05J
Q1MgQ08uLCBMVEQuIC0gOTYwWEdMCgokIGRtZXNnIHwgZ3JlcCAtaSAic29mLip0cGxnXHxtYWNo
aW5lIgpzb2YtYXVkaW8tcGNpLWludGVsLW10bCAwMDAwOjAwOjFmLjM6IFRvcG9sb2d5IGZpbGU6
IGludGVsL3NvZi1hY2UtdHBsZy9zb2YtaGRhLWdlbmVyaWMtMmNoLnRwbGcKc29mLWF1ZGlvLXBj
aS1pbnRlbC1tdGwgMDAwMDowMDoxZi4zOiB1c2luZyBIREEgbWFjaGluZSBkcml2ZXIgc2tsX2hk
YV9kc3BfZ2VuZXJpYyBub3cKYGBgCgotIEF1ZGlvIHBsYXliYWNrIHRvICJTcGVha2VyIiBkZXZp
Y2UgcHJvZHVjZXMgbm8gb3V0cHV0Ci0gQUxDMjk4IHNwZWFrZXIgREFDIChOb2RlIDB4MDMpIHJl
Y2VpdmVzIGF1ZGlvIHN0cmVhbQotIFNwZWFrZXIgcGluICgweDE3KSBpcyBjb25maWd1cmVkIGFu
ZCB1bm11dGVkCi0gTUFYOTgzOTAgYW1wbGlmaWVycyBhcmUgZGV0ZWN0ZWQgb24gSTJDIGJ1dCBu
ZXZlciBpbml0aWFsaXplZAotIE5vIEkyUy9URE0gYXVkaW8gZGF0YSByZWFjaGVzIE1BWDk4Mzkw
IGNoaXBzCgojIyBFeHBlY3RlZCBCZWhhdmlvcgoKU3BlYWtlcnMgc2hvdWxkIHdvcmsgc2ltaWxh
cmx5IHRvIG90aGVyIEludGVsIHBsYXRmb3JtcyB3aXRoIE1BWDk4MzkwLCBzdWNoIGFzOgoKLSBD
b21ldCBMYWtlIChDTUwpICsgTUFYOTgzOTAgY29uZmlndXJhdGlvbnMKLSBBbGRlciBMYWtlIChB
REwpICsgTUFYOTgzOTAgY29uZmlndXJhdGlvbnMKCiMjIFRlY2huaWNhbCBFdmlkZW5jZQoKIyMj
IEkyQyBCdXMgU2NhbiAoQnVzIDIpCgpgYGAKICAgICAwICAxICAyICAzICA0ICA1ICA2ICA3ICA4
ICA5ICBhICBiICBjICBkICBlICBmCjMwOiAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAzOCAzOSAt
LSAtLSAzYyAzZCAtLSAtLQpgYGAKCiMjIyBNQVg5ODM5MCBDaGlwIERldGVjdGlvbgoKQWxsIDQg
YW1wbGlmaWVycyByZXNwb25kIHdpdGggUmV2aXNpb24gSUQgMHg0MjoKCi0gMHgzODogUkVWX0lE
ID0gMHg0MgotIDB4Mzk6IFJFVl9JRCA9IDB4NDIKLSAweDNDOiBSRVZfSUQgPSAweDQyCi0gMHgz
RDogUkVWX0lEID0gMHg0MgoKIyMjIEFDUEkgRGV2aWNlIEluZm8KCmBgYApEZXZpY2U6IE1BWDk4
MzkwOjAwClN0YXR1czogMTUgKHByZXNlbnQsIGVuYWJsZWQsIGRlY29kaW5nIHJlc291cmNlcykK
UGF0aDogXF9TQl8uUEMwMC5JMkMyLk1YOTgKYGBgCgojIyMgQUxDMjk4IENvZGVjIENvbmZpZ3Vy
YXRpb24KCmBgYApOb2RlIDB4MTcgW1BpbiBDb21wbGV4XSAtIFNwZWFrZXIKICBQaW4gRGVmYXVs
dDogMHg5MDE3MDExMCBbRml4ZWRdIFNwZWFrZXIgYXQgSW50IE4vQQogIFBpbi1jdGxzOiAweDQw
IChPVVQgZW5hYmxlZCkKICBFQVBEOiAweDIgKGVuYWJsZWQpCiAgQ29ubmVjdGlvbjogREFDIE5v
ZGUgMHgwMwoKTm9kZSAweDAzIFtBdWRpbyBPdXRwdXRdIC0gU3BlYWtlciBEQUMKICBTdHJlYW0g
YXNzaWdubWVudDogUmVjZWl2ZXMgYXVkaW8gZHVyaW5nIHBsYXliYWNrCiAgVm9sdW1lOiAxMjcv
MTI3ICgxMDAlLCB1bm11dGVkKQpgYGAKCiMjIFByb3Bvc2VkIFNvbHV0aW9uCgojIyMgMS4gQWRk
IE1hY2hpbmUgRHJpdmVyIE1hdGNoCgpJbiBgc291bmQvc29jL2ludGVsL2NvbW1vbi9zb2MtYWNw
aS1pbnRlbC1tdGwtbWF0Y2guY2A6CgpgYGBjCnN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19h
Y3BpX2NvZGVjcyBtdGxfbWF4OTgzOTBfYW1wID0gewogICAgLm51bV9jb2RlY3MgPSAxLAogICAg
LmNvZGVjcyA9IHsiTVg5ODM5MCJ9Cn07CgovLyBBZGQgdG8gc25kX3NvY19hY3BpX2ludGVsX210
bF9tYWNoaW5lc1tdIGFycmF5Ogp7CiAgICAuaWQgPSAiMTBFQzAyOTgiLCAgLy8gQUxDMjk4IEhJ
RAogICAgLmRydl9uYW1lID0gIm10bF9tYXg5ODM5MF84ODI1IiwgIC8vIG9yIGFwcHJvcHJpYXRl
IGRyaXZlcgogICAgLm1hY2hpbmVfcXVpcmsgPSBzbmRfc29jX2FjcGlfY29kZWNfbGlzdCwKICAg
IC5xdWlya19kYXRhID0gJm10bF9tYXg5ODM5MF9hbXAsCiAgICAuc29mX3RwbGdfZmlsZW5hbWUg
PSAic29mLW10bC1tYXg5ODM5MC1ydDU2ODIudHBsZyIsICAvLyBuZWVkcyBjcmVhdGlvbgp9LApg
YGAKCiMjIyAyLiBDcmVhdGUgU09GIFRvcG9sb2d5IEZpbGUKCkNyZWF0ZSB0b3BvbG9neSBmaWxl
IHN1cHBvcnRpbmc6CgotIEhEQSBjb2RlYyAoQUxDMjk4KSBmb3IgaGVhZHBob25lcwotIFNTUCBw
b3J0IChsaWtlbHkgU1NQMCBvciBTU1AxKSBmb3IgTUFYOTgzOTAKLSA0LWNoYW5uZWwgVERNIGNv
bmZpZ3VyYXRpb24gZm9yIDQgYW1wbGlmaWVyIGNoaXBzCi0gRE1JQ3MgKGFscmVhZHkgd29ya2lu
ZykKCiMjIyAzLiBBZGQgU1NQIENvbmZpZ3VyYXRpb24KClVwZGF0ZSBOSExUIG9yIGNyZWF0ZSBB
Q1BJIG92ZXJyaWRlIHRvIGV4cG9zZSBTU1AgcG9ydCBmb3Igc3BlYWtlcnMKCiMjIyA0LiBTYW1z
dW5nIERNSSBRdWlyayAoT3B0aW9uYWwpCgpBZGQgc3BlY2lmaWMgaGFuZGxpbmcgZm9yIFNhbXN1
bmcgR2FsYXh5IEJvb2sgNCBtb2RlbHMgaWYgbmVlZGVkCgojIyBXb3JrYXJvdW5kcyBBdHRlbXB0
ZWQKCjEuIOKdjCBNYW51YWwgSTJDIGluaXRpYWxpemF0aW9uIG9mIE1BWDk4MzkwIC0gZmFpbHMg
d2l0aG91dCBJMlMgY2xvY2sKMi4g4p2MIEZvcmNlIGxvYWQgYHNuZF9zb2NfbWF4OTgzOTBgIG1v
ZHVsZSAtIG1vZHVsZSBsb2FkcyBidXQgbm8gYXVkaW8gcGF0aAozLiDinYwgSERBIGNvZGVjIHNw
ZWFrZXIgcGluIG1hbmlwdWxhdGlvbiAtIGF1ZGlvIGdvZXMgdG8gcGluIGJ1dCBub3QgdG8gcGh5
c2ljYWwgc3BlYWtlcnMKNC4g4p2MIExlZ2FjeSBIREEgZHJpdmVyIChgc25kX2hkYV9pbnRlbCBk
c3BfZHJpdmVyPTFgKSAtIGJyZWFrcyBhbGwgYXVkaW8KCiMjIEFkZGl0aW9uYWwgSW5mb3JtYXRp
b24KClRoaXMgYXBwZWFycyB0byBiZSBhIHNpbWlsYXIgaXNzdWUgdG8gb3RoZXIgcmVjZW50IElu
dGVsIHBsYXRmb3JtcyB0aGF0IGFkZGVkIE1BWDk4MzkwIHN1cHBvcnQ6CgotIFtDb21taXQgZXhh
bXBsZSBuZWVkZWQgLSBjaGVjayBnaXQgbG9nIGZvciBzaW1pbGFyIGFkZGl0aW9uc10KClRoZSBN
QVg5ODM5MCBpcyBhbHNvIHVzZWQgaW46CgotIERlbGwgWFBTIHNlcmllcwotIExlbm92byBUaGlu
a1BhZCBYMSBDYXJib24gR2VuIDExCi0gSFAgU3BlY3RyZSB4MzYwCgojIyBBdHRhY2htZW50cwoK
SSBjYW4gcHJvdmlkZSB0aGUgZm9sbG93aW5nIGZpbGVzIGlmIG5lZWRlZDoKCjEuICoqZHNkdC5i
aW4qKiAoNDE2S0IpIC0gRnVsbCBEU0RUIHRhYmxlCjIuICoqbmhsdC5iaW4qKiAoMi40S0IpIC0g
TkhMVCBhdWRpbyBjb25maWd1cmF0aW9uCjMuICoqZG1lc2dfYXVkaW8ubG9nKiogLSBGaWx0ZXJl
ZCBrZXJuZWwgbWVzc2FnZXMKNC4gKiphbGMyOThfY29kZWMudHh0KiogLSBGdWxsIEhEQSBjb2Rl
YyBkdW1wCjUuICoqaTJjX2J1czJfc2Nhbi50eHQqKiAtIEkyQyBidXMgMiBkZXZpY2Ugc2Nhbgo2
LiAqKm1heDk4MzkwX2luZm8udHh0KiogLSBNQVg5ODM5MCByZWdpc3RlciByZWFkcwoKUGxlYXNl
IGxldCBtZSBrbm93IGlmIHlvdSBuZWVkIGFueSBvZiB0aGVzZSBmaWxlcyBvciBhZGRpdGlvbmFs
IGRlYnVnZ2luZyBpbmZvcm1hdGlvbi4KCiMjIFJlcXVlc3QKCkNvdWxkIHNvbWVvbmUgd2l0aCBl
eHBlcmllbmNlIGluIEludGVsIFNPRiBhbmQgTUFYOTgzOTAgaW50ZWdyYXRpb24gcHJvdmlkZSBn
dWlkYW5jZSBvbjoKCjEuIENvcnJlY3QgU1NQIHBvcnQgYXNzaWdubWVudCBmb3IgdGhpcyBoYXJk
d2FyZQoyLiBXaGV0aGVyIGFuIE5ITFQgdXBkYXRlIG9yIEFDUEkgU1NEVCBvdmVycmlkZSBpcyBu
ZWVkZWQKMy4gVG9wb2xvZ3kgZmlsZSBzdHJ1Y3R1cmUgZm9yIEhEQSArIE1BWDk4MzkwIGNvbWJp
bmF0aW9uIG9uIE1UTAoKSSdtIHdpbGxpbmcgdG8gdGVzdCBwYXRjaGVzIGFuZCBwcm92aWRlIGFk
ZGl0aW9uYWwgZGVidWdnaW5nIGluZm9ybWF0aW9uLgoKLS0tCgoqKkNvbnRhY3Q6KiogamFhbG5l
dG9AaG90bWFpbC5jb20KKipBdmFpbGFiaWxpdHkgZm9yIHRlc3Rpbmc6KiogSGlnaCAtIHRoaXMg
aXMgbXkgcHJpbWFyeSBsYXB0b3AKClRoYW5rIHlvdSBmb3IgeW91ciBhdHRlbnRpb24gdG8gdGhp
cyBpc3N1ZS4K

--_004_PH3PPF0A8D5CDB5873FA91A7F768F4E2F10D984APH3PPF0A8D5CDB5_--
