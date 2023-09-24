Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DAA7AC9F8
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Sep 2023 16:22:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE4A39F6;
	Sun, 24 Sep 2023 16:21:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE4A39F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695565344;
	bh=F2DP25RotOTVkMeGlbnH+3I/FJrcitdBsoEsRH5M8kg=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=n0aDca0eeVNbQzhK3qQDc/jyc2f+R6ApnTA+K0SYLkYyAMvHQGfC8OUO1VJWJSUz4
	 i5iUvjTy5gw6nktBlZsARqk/AV9nZoKAIAjGpXVGMQivnzSAkehHJedLuD6/eIUSFu
	 jHt/vA1o4sdyr3NSU/Nto3u+43gVeqZGK5dN19Ug=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F209F80290; Sun, 24 Sep 2023 16:21:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 238D5F80166;
	Sun, 24 Sep 2023 16:21:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61317F8016A; Sun, 24 Sep 2023 16:21:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11olkn20800.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::800])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72E6CF800AA
	for <alsa-devel@alsa-project.org>; Sun, 24 Sep 2023 16:21:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72E6CF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=hbCdGAPT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BM3XBSBz7A0wG9lmCzRs0G00jug9fystDqSa73cVFAS1OLbTZAVSFO26dHF1jsR7SDBqu2S0NUVrklYeJKCvMyqxHLqS6858/vdLwxcsfKZsnPLc8Q/qpInZHXS12O17EBBf3KZ7z9bVplX62iCELz7/EEoDuwozbC44S11oX+7yAHRVMVt5zOvrOSPWHNSFP+M3lSBp/bEtyfidZgvMPbvwNovaabmUOpRnaXl+HhirL4W0ukl6HJRQ5hIOaVFkvhd6C/U/uUpwlWmzUKNvO0VVIqKSVJfkLYgrlfqS/vVAoQfPOBKdGVwdB3Orseqaj5TbO4Xp/HzU+6HcWOVusQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2DP25RotOTVkMeGlbnH+3I/FJrcitdBsoEsRH5M8kg=;
 b=efJpasgSwdEHMysZejxhDs3v8OJIYxQ8XE/W16/4CExvRD6cEiKftnoKp21N/+YwpCYq6OhetV+kD7KnNSmCfT8wfUUR3Lic107hKRplcbtfKjnTmQ2UEQezSdogvsyZxV7HareuqqL5j/gSsmsJM7qqyMQZB+chfum8pDS4Tigbp0rPlPbten2iYL13TeaSHh8IudJUqIquPi3gvKJqwZ7J+wcN4fUv6OFW/a1KaTsJhiwcWBzHLSqqRuJLOLnO1K2H+SR3h6QqBz/MauKoCG2HOXCQggKT64SYiegXUzwl4CgrfOQ/X2jVzLUWqMiDu2zuMq6DM3MgdIhzuZq6aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2DP25RotOTVkMeGlbnH+3I/FJrcitdBsoEsRH5M8kg=;
 b=hbCdGAPT2VA2AERA7FPIjPKcqNdhwdbRH3e2zvgtHq3P3E9MaASYa7+37buYIvL6kYSCI78hwpHvmF52KpSMY3F7GnuRjGshmbaiZaOpQ1FnH0JScuxAc8EA54iigcGg7vdsCpVX77SaeqowYF3o/M4LywqSQuyOPsQhwwmMT8bepck6JtUv65vhJc43VZVctF1bOiJf/uNCMsgUjSoacxUbiFFLIYk+LkCm2FFQ2F4oLJbzVfJMbjwKFj0MWyWWU/ULJsJV4qWheALQ/v9nmYcwYjx13iGhmaX9xBSUg/hvlw3knhDuYB9aC9+sKUSdhSzx4hhX/Wdpx2j+s1jCBw==
Received: from PH0PR20MB3704.namprd20.prod.outlook.com (2603:10b6:510:20::22)
 by SN7PR20MB5214.namprd20.prod.outlook.com (2603:10b6:806:266::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.27; Sun, 24 Sep
 2023 14:21:17 +0000
Received: from PH0PR20MB3704.namprd20.prod.outlook.com
 ([fe80::71d:b0ad:718c:811c]) by PH0PR20MB3704.namprd20.prod.outlook.com
 ([fe80::71d:b0ad:718c:811c%5]) with mapi id 15.20.6792.026; Sun, 24 Sep 2023
 14:21:17 +0000
From: Julio Merino <julio@meroh.net>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Invalid jack configuration on Mac Pro 2013 
Thread-Topic: Invalid jack configuration on Mac Pro 2013 
Thread-Index: AQHZ7vDjmMA66dSkDUmA/s56GSvL6w==
Sender: Julio Merino <jmmv@outlook.com>
Date: Sun, 24 Sep 2023 14:21:17 +0000
Message-ID: 
 <PH0PR20MB37045973AAA56760E9F2FDB0C0FDA@PH0PR20MB3704.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 2
x-tmn: [yvZD72D8zhMRnVU/w2lIBDiCOjKTYGom]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR20MB3704:EE_|SN7PR20MB5214:EE_
x-ms-office365-filtering-correlation-id: cca3542a-586f-4479-2843-08dbbd09845e
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RTUU/ZFcuUuKuhYH/wub4LHp7mrmi3MaYLQflNXXDiUxp3yuMqU92ZCQmpIHic0ZEaHPp8/037byvV+XKISRoXtYR2SmESBBaVfkp7Bp2iAHXWQsAC0Ju0b7sy+lBnAuKI9COEINTexL2jaCAVsto65ctNtfUTaLa0SkrANph0nC4k47wXxHwPwITgNNv8w376ams7IBs9e7zjo9jXFlcCLWY4O+yyFr7w9noOFuX8reybfUcNR3sNEcdUxoAFZgo/sVlqHCoLdNnf8+mjbrt0A6O3QKne9RYH8XWH0b0JJ1ji9mJKMakchGK06IfmeRHj0gItQy1WWWI1+1viH+3NPQNwgcHHQwnyY38D69vPThGcD2wD4kNFCxSkr+Pkf4M19plm48MJn29uTNxGyu1jGw/bQvTaL/ZsXh4CtH+rmwFp6IdRaqprNvMTyeJ88mjzfpP6tTyOdDRU+Jwv6izzPu9flN1f1jVj9hzJKqGvNsvlj5D9rfDdphKjwlBFqBJWf9LKYVnROJJq9FCsQN+D5F8CKv4C163nhi8dKu9hCUM7VeP5+85sOINcjR5j0bgJbZfj3RGe3GafHgIGusqh30YSzCzDbd8H0mLvy4j8Q=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?POulL0XoggNkv56tl8BI4YhwHF7W8RBi/156UEbTGAu2rL1q0IWzUvPlj5?=
 =?iso-8859-1?Q?FNOpGlPB1QLj0UqAOtL9xXEqzD0BU/TRBokihouqLpNxmlannmi0tWOrA0?=
 =?iso-8859-1?Q?AkvbNJuQVOctjt+nP27l/M+2US4U2gZ/oFEUbVopAtanQtdHzKZ85mdSz5?=
 =?iso-8859-1?Q?CSar3DJ4wnwojs++p6xVLymFTfaVOJ4XOAk5oVD5IGEmCkEv2xUGw97hSg?=
 =?iso-8859-1?Q?XKOvuyV65kUo9/2lIgZGr3dXhWcd320K4/yk7iQaXCTVgbSrgMSVkDVkD1?=
 =?iso-8859-1?Q?mM+1/QKBhlBuvwGjuFZk4mdgQ6V/dWdXFwUoUxmxmo331N52kfAsxzmy99?=
 =?iso-8859-1?Q?w9hxQutC4flJcjWsRB9oFIQy1v5myWqf/+Q3D2RGmPv2z50RzZlghyjimH?=
 =?iso-8859-1?Q?7aVa+vL/nxZzw5InbkZDMs2aMZqO2i/6p0+/61CCbJb4hQmbYcoZQYFEFG?=
 =?iso-8859-1?Q?Mv6SvH8KPjrcxQsHX/RDJAhCyQrCPUoA2KdqyoKi117Nrqp1wfiRVKw8xL?=
 =?iso-8859-1?Q?cu8DFSa2iKsX563ynuX1/83I/bCuTPCvzAwnrjGwVEp6MaPGXcgTrmS4+d?=
 =?iso-8859-1?Q?V7xOkV6CU3NeswB7r1T9qYj7m2q9wTZG82gOY+V8PIAH1K3iy3kSU9apDF?=
 =?iso-8859-1?Q?qGsxCgE9y840kInGA6oXOuROPH5quiINrQTWDmn10qQ7vLPQge6g9slyEo?=
 =?iso-8859-1?Q?m1FDJdlq8Yewv52+YkITMzvaj20FAB5HSZ3mwurBJNEw9KLRJQCxSHOYqA?=
 =?iso-8859-1?Q?OyDsDdB5H+qzhN7mqcS1o81iIWBaxa7yGx5z9MEeSd1bQpEkSq2PF/iolE?=
 =?iso-8859-1?Q?uOEYycDz+GIblZhFw5p5aT4AtvPcwIYSw0L28IdmFnc+rbDy7qOo4YpoaO?=
 =?iso-8859-1?Q?AM96KUpGnbSG15PY4Nfn+vloLPuu4fbguT4u503Vbq6o3C/ijMswbjSoan?=
 =?iso-8859-1?Q?dPAnxly6qAMXciv1Hj82AbZ4JFbbFajgGThW3+6hJZJlzO29iEOAcunJqG?=
 =?iso-8859-1?Q?1Cz0jDqn3BE8IrwOhTMYaQShG810GBIedYUn5rWaujGekRvvfNuwOjUsfr?=
 =?iso-8859-1?Q?hr29lscLyeObUxhpAOd8qFN3Qw6Sc1FaY/r3SSZi+lOrFKV+X4RBCyzHNM?=
 =?iso-8859-1?Q?5Z3smbh1u3/Vw5ZixtftlOsrqMIG+do9TT4NceZs3G+CzUxj0n87DvZxkO?=
 =?iso-8859-1?Q?3AyFuo5kowh/mB2kDMw+N4LNJrw10ME2eXqytmMTxmsYx8N5bkQCTG7Z?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR20MB3704.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cca3542a-586f-4479-2843-08dbbd09845e
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2023 14:21:17.5643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR20MB5214
Message-ID-Hash: 6JVIP4U7TLEOGX7HMK4NGAVZTH3YP4IU
X-Message-ID-Hash: 6JVIP4U7TLEOGX7HMK4NGAVZTH3YP4IU
X-MailFrom: jmmv@outlook.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VCY3VLSYUJ3GUP373XKNSG4HOVYMYAJ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,=0A=
=0A=
I have a Mac Pro 2013 running Fedora 38 and, while I get sound, the jack co=
nnections seem to be incorrectly configured. I tried to follow https://docs=
.kernel.org/sound/hd-audio/notes.html for troubleshooting, and went the rou=
te of trying to figure out pin configuration changes... but so far haven't =
succeeded. So... I'm sending this as a bug report per the instructions in t=
hat document.=0A=
=0A=
Here is what I observe:=0A=
=0A=
- The machine has two jacks: line out and headphones.=0A=
- The line out jack emits red light while playing.=0A=
- When nothing is connected to either jack, sound plays through the interna=
l speaker: OK.=0A=
- When connecting speakers to the line out jack, the internal speaker is mu=
ted but no sound comes through the speakers.=0A=
- When connecting headphones to the headphones jack, sound comes through th=
e headphones BUT this only happens when something /else/ is connected to th=
e line out jack to silence the internal speaker. Otherwise the headphones j=
ack seems non-functional.=0A=
- The volume indicator in Gnome switches from speaker to headphones when so=
mething is connected to the line out jack. It doesn't recognize any changes=
 when connecting something to the headphones jack.=0A=
- I tried booting with model=3Dmbp11 and the only thing that seems to chang=
e is that the red light turns off.=0A=
=0A=
Here is the output of alsa-info.sh:=0A=
=0A=
http://alsa-project.org/db/?f=3D07112f6bc87c0938b38394e7d52aeecb307afcbe=0A=
=0A=
Please let me know if you need any other details. Happy to test out any cha=
nges via a "patch firmware" file or sysfs settings.=0A=
=0A=
Thank you=
