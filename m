Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 020159602B0
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2024 09:07:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2BEC828;
	Tue, 27 Aug 2024 09:07:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2BEC828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724742453;
	bh=//YQp3qR9XQHEo1MFpKDMobGLxLbL4eg37WyrR82aEU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qBpB19LcqjKbU83TDn/BaT8A44qIAf+coDSUP6z7CBuT4Y7G/gZUaDYV7yA7aOjPE
	 n8Bg8BhQKCFNhtMyUcfSfYPgQdmok9FEK8pwKAPG505XxhMnQ/DbIh6LiVWNeWaxfV
	 oLL94H5VT/fFz6crU63nusj1DgSV9nRclWca+O20=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC7AAF80589; Tue, 27 Aug 2024 09:07:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01DE8F80528;
	Tue, 27 Aug 2024 09:07:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 272DBF80423; Tue, 27 Aug 2024 09:06:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2606::624])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDD12F800AC
	for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2024 09:06:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDD12F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector1 header.b=Nr45xn7Q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p17DjpQD81ifb8pVIM5mq5G+udI2ixbh+SqE7TwUV6xkKZ+ZniFx99BMo5Qwywg1byYYM6mHlUXA3lZNz7/Xu7149a4dHKAQFBf3fBn7xnpS4BWI2Uv8oWqzu/FCozvDEHFA+Hkbo+oK8KMzfahmOF8ZI0Kd+MTLUGU62CinL1CaXFjrc/+OuzoQaLwDqCs7/Uztufi5wlW5HSK0icNt1fYVYMakbaiiO1GJSjYRKkqGWgDenj5QPAVbhmYfAb990ipEEDXMfxjxAkH4RApY8A+bL8f4MFDTLLIzUW9/GwJSNsNCNcdJx51uQ4dvnccb5V6+njnxjKO0DA/BirVlYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dg0TFlj4Oybk4UcmH3ptF6H1FTVPus1YTw/3cWPq1pY=;
 b=ggaXNWwwYiqrEn9h6Z9eX/A4NT9c2CiEDir1r/nh2dWVlbQ3p+vjxrJwCBkQqup4lejKii75g6YRmmz5QelDq7DBbiY47UK3joEeJJi4QvDjyqfDgQwH9MsWfrUyVq2UyaHYooPU9024F0QtpWyxud9qphRPrFiRSktJspaWqyw11f0a3q9iVXCB0yKAn1Rttiwv/LLE/v9xa77TeTm9Y5HTnGfrP0FVXI+pnZRFYhNohBrk1hQccHhCysJqRxusnouE4Ao5aTsSSBvZ/Lv/9CEdBfmAKhrFsm2ccWxxJrvvnGocCHpAXcxbicVF2dw3bX03ZN2NjjptPi0X0Xs1Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dg0TFlj4Oybk4UcmH3ptF6H1FTVPus1YTw/3cWPq1pY=;
 b=Nr45xn7QRZyiP2ZUB/nBPJbx0iF/w5Xmh5P72g9ER/cMUrHsGMW7lxhWTEz/iBB5NGVQ64v5bcCJLgHuHdzIYJsZdSPt1nxuHvY1Lm0IyhzGtgcfFfsLCXJAaH0OpY4g2RGOY2GmqqCy4qTIkWTWyD+iyS0h15WVzQdm6SuBSL7IaeIjabCDXe3kqVBhUBooAu7zys1hEGB/p26mmYqPlgi/10Ik9R6Ef+jGQWjvntytX0KFoxje1lXkInP1SopsEBzS6tj/dfK/Ew+RoPHB97evgZ+Siozezc0AuuDABsgTZ9j0e23ZIxodf3dhD5JRex6aNISefsU9WU7tR9CGaA==
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by AS8PR04MB8867.eurprd04.prod.outlook.com (2603:10a6:20b:42e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 07:06:39 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc%5]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 07:06:39 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Takashi Iwai
	<tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>
CC: "S.J. Wang" <shengjiu.wang@nxp.com>
Subject: Suspend/resume Issue on pcm_dmix.c in alsa-lib
Thread-Topic: Suspend/resume Issue on pcm_dmix.c in alsa-lib
Thread-Index: Adr4TBMiIwDq2dUQRCKJqjtaPB6H/Q==
Date: Tue, 27 Aug 2024 07:06:39 +0000
Message-ID: 
 <DB9PR04MB94988752ED7C43B399E0BC00E3942@DB9PR04MB9498.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB9498:EE_|AS8PR04MB8867:EE_
x-ms-office365-filtering-correlation-id: db82b9b6-00e8-4383-f4bf-08dcc666cc3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?tt6sWWWCdQQAKfXxr3VYjMCRveuRAyws9e8S/Nos9lC4bserrpK3Q+9YWeDP?=
 =?us-ascii?Q?rT55WpLuD1xaPXGFvMssardQK1eO/BYEDTGuH4dhR16SI5GRkP9b2dW3mdMa?=
 =?us-ascii?Q?9Eh8jZpWz3BFLuImV6zs5qOBwGmMWrliPLjRix9/qLLDIwIH5dT4ptGblY/I?=
 =?us-ascii?Q?/mR4DqGgUqODH5ghyRVzmpSmR+MxMYiO2rHhjOxAwfRvo5Y7arU5j063KpD6?=
 =?us-ascii?Q?7Bjs0sY/7TbiQFvxQz0P1Zv04bK0Ln34IVh8s2kHKkgVklN3155RcP5pionl?=
 =?us-ascii?Q?qVAWR56ygzX/LSwyM6mXJIQl3LV/ZJy24nWVeiMdxZW1CdDeRvQvE/gyTSIG?=
 =?us-ascii?Q?hgUF6i66AMc7mBROzpJKyfvTkbCZbYMUydqnLihfK/TxsshYZOR9CA+x7Ix9?=
 =?us-ascii?Q?B/I9RvDAjYZB+317G2x3qXh1FhmVx+4Akq9iD4O3aEh83aTg9RyjH+TEYxWl?=
 =?us-ascii?Q?RFFN8DKNHp0UbGSZv0DiGxybdoWLusDptLagZFrPS+gLe6aRyxoOXv0W99w8?=
 =?us-ascii?Q?x2/N+xea6+4ZPNLt5eeDu8lF5gUaAgFaDI5XLueRFIwozNYTLp7dpUDtfANY?=
 =?us-ascii?Q?jKaWksuQhltMA1WYen6HvEQMSoZmejN1syfNjfwY1qo4iFLei/+18dyJR3yE?=
 =?us-ascii?Q?T6elAd2PZZZ/GJru2sZtUC/6IcsRc7OkPlT7j3e/HnwQ99Ba1AC0A8jJGwv4?=
 =?us-ascii?Q?uuSWxTRCYDStrE6MrTsiAT9KUOIBWGFz9Rah/fiq1okskbUbkd0eneDBACKY?=
 =?us-ascii?Q?WXLRubTx++7l1H9l09lfCTRSlfBlQvdmcBnvveB6QOtQnbqbQrbsJmdt8Bi8?=
 =?us-ascii?Q?1TCLCMPJA8gtOMj3I6UXAjdIgPYJkVKZSZnhwIppYAuxakp3lYktIWFGr3+r?=
 =?us-ascii?Q?/MUQZTKGhVLouPtSDdtbQjtcN8niNla6U3H3EiysMrQOOWuNrwb9l2ZnsKMR?=
 =?us-ascii?Q?KEOgdPWwncFKftvPkVwwAUS+xaCMOWl9Lt6AF7IKEJ0cK1s1tAxcEu1IavoL?=
 =?us-ascii?Q?GnE4FyFGm0coFUybc5yp+G8sidwrb75Ok+/9aIxiRdJDhvUBZd70INQHMgng?=
 =?us-ascii?Q?MXQCHEU2CwX+U1/C31z8EGKr23BDQ3FdAFTq4XIq67KVO0b8YDFqJr7Aw9hO?=
 =?us-ascii?Q?V43Dqm7aku2o5CPhTkaECbJUgY8SYTryA93482awQpCjMzcnj2yvo3WiqpcJ?=
 =?us-ascii?Q?s/42Tf5L4nbjK3DtBl1RwpW+jEjL8YomU6xCSU4n7/eONgm20ui63KkfVOLW?=
 =?us-ascii?Q?JbiXMWV934c5Va3ku9b4o+ph4kHMxxAw1gblZZKwEFTJTKqUUsdoD8mhxX7f?=
 =?us-ascii?Q?qCKs0uZDLt+/O9sioqBYCPrp21dAeoW6TEhQ5QnE+FuUUFaHj4LenUEvq+Tr?=
 =?us-ascii?Q?0oqZhbR6CW7DN9WAFXI8dYCMIkvaTotRTmNbrX+4DPp8DXdttA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?FAfGOrPKiUuYZ6x+TNp2wAQPJxN7JwzY25IMQTECoftqpjYRwcSvrqCb/CP6?=
 =?us-ascii?Q?Yi+hwfYWcaqOM5ApDCm/It17jvZFXrClMgvUxLRL40EUZYW7mBYL076TeX6O?=
 =?us-ascii?Q?Zu/Nm7DEA5StMLC5i2S0z3cFQ13SNjFiov6g15wA9sVgRljBm9d6/CKEILgm?=
 =?us-ascii?Q?qp4Wkh5yLvAybd9dNaTiFbbEO48NL+kkJ5OonJUzov3ZwDuZx09HPhrztZ1r?=
 =?us-ascii?Q?mjnLsB1mH2RlsXxzOVC+MXD8eBR0VZhdcTnoak9l1S+w/u0dFZeJfQ787ZcD?=
 =?us-ascii?Q?ePIZ/mOp35YloSiz22qRbKHE/HPwOKTY3GhnVd8Fe0HwF7tynIz3M0iALU/j?=
 =?us-ascii?Q?EdtrkWCHOobWhMCfq8U3TJFyIUaYOIg35WkGHFd5qMQenc9pYnyMbmNzOcF0?=
 =?us-ascii?Q?itgT349Dv1lYvzJTXYF/LkEw6MviS/+tcsIv5DB+1V/tVc8xqCJxWHXqfMna?=
 =?us-ascii?Q?xIsxFnyQTIAwCKr3P5foHNwVjuVz3nr8i8SxqqOhC+u+LDqaLJGFXSazfdp5?=
 =?us-ascii?Q?ijxzBMRNrMBFAMdtFXwtAw2zM76FqFD897kYGY2B0Z/1Tf5IyjUU7Exj1Hpl?=
 =?us-ascii?Q?EfL35y3Q03EAu0V4O9nEVs/J1Z3syGsr6MXVb0e/cPZrNobaAnTgwaFucZuC?=
 =?us-ascii?Q?gle3tdQTAODhgYcr0p2St+vU1wlyAx/+11Zn7eQuLay/UsrbO1dghrpHTg/a?=
 =?us-ascii?Q?0Ax46kUr9wmwtM8A45+vVcFm9Qm19cHFb2PNQyXG4UtdIJuafZ1PMIdke9Co?=
 =?us-ascii?Q?csLM5Y7UDEQ5HimA8J5FEO4vQtbpKDidM86dvjGUt8kJZAFHB3YVIG6k4pUx?=
 =?us-ascii?Q?EagHDs+ODSuuV4JTRKPewWOwa2OseKdxGlLa56GS4A+snNWrGG0rSS0Xxgfm?=
 =?us-ascii?Q?9oklxngTUZHwnFUnwvR5E+NbdSTHAJzx/jwjUBb/JlVcQp9gWltCjqLCFADj?=
 =?us-ascii?Q?P/L58s60eT2fZz2q9hovatl2ANlq28LY4a7Ale82HYRG8NIqr4T6CyzfqmkO?=
 =?us-ascii?Q?A6pMqcIlbnMQQCHF0an34Vd3iTKAuA9Y12/FFXOiS4yo7AuIS9aloZ+toCnl?=
 =?us-ascii?Q?Gg5yGzcjn2QvMaNZFBYZDv70Lsl5DUccnRo9ldU31znqNik3Kf8hVsaZuNsJ?=
 =?us-ascii?Q?7xOdz1BCKbCb8d5Bh8Yt2BdZDdkBcyoAege8RKKyJMtWmlrGPcd85Uu/UZ0O?=
 =?us-ascii?Q?3WDPJT13zeQAvgMO1tY/zYi8WHtX3InBlDM654TFgyNt6AfAlz5Q0yik/q/j?=
 =?us-ascii?Q?E6EEPZEWcl7dCdORNCjrp+mueixa/+wSRDMmxPjnqLPZ9XObvaHCpMQE8h20?=
 =?us-ascii?Q?omix7KKPu//0FSZ+NrZw6KorwAJ7Kq/VgTeKsG8ZaFHOd+oY/cLVZ2x2aoe/?=
 =?us-ascii?Q?heul7vjYNPOWZLfyTrNMgh6NDGSs6nCTcsXgwTXAFlH3wUqiNX4hwO5ws5sw?=
 =?us-ascii?Q?YxAdqkQb7YOW7mxqNGMSQUCNSZ1GAnancs3BDWHam79VCPiKw90niDnpgTEw?=
 =?us-ascii?Q?xNGIBBlYLRTyMaXh+a5/lPVn02Ybzk0WZSJ+QnS+hvYR4PyPET/VGKUiqvjU?=
 =?us-ascii?Q?GGIoRQhO3bnDbmVXhVp2CzPsJW7c/j29yst4xmPZ?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 db82b9b6-00e8-4383-f4bf-08dcc666cc3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 07:06:39.4855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 u74jlisPCz231XwvJmXdCOvALXv1//4c40K6c1sbopzzqd9GeFtAbYE/JWqG+RedNro+xsfnIyBXWDWPP4FiFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8867
Message-ID-Hash: LXHYD4K6MCE5LJKUCG7G7ZM4T2E7P7SF
X-Message-ID-Hash: LXHYD4K6MCE5LJKUCG7G7ZM4T2E7P7SF
X-MailFrom: chancel.liu@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F5SICTCP3KG2VUAFNY5GEXIDXR3JDC6W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi Iwai, Jaroslav Kysela

We found an issue on dmix in alsa-lib when do suspend and resume. It can be easily reproduced by following steps:

1. Run two dmix clients in parallel. (Only one client doesn't has such issue)
~# aplay xxx1.wav &
~# aplay xxx2.wav &
Here I attach the asound.conf we're using.
~# cat /etc/asound.conf
defaults.pcm.rate_converter "linear"

pcm.dmix_44100{
    type dmix
    ipc_key 5678293
    ipc_key_add_uid yes
    slave{
        pcm "hw:0,0"
        period_time 40000
        format S16_LE
        rate 44100
        }
}

pcm.asymed{
    type asym
    playback.pcm "dmix_44100"
    capture.pcm "dsnoop_44100"
}

pcm.!default{
    type plug
    route_policy "average"
    slave.pcm "asymed"
}

2. Let linux enter into suspend and then resume(Repeat this step if not reproduced)
3. After resume, aplay will get stuck in snd_pcm_wait(). The GDB shows:
(gdb) bt
#0  0x0000fffff7da9264 in __GI___poll (fds=fds@entry=0xfffffffff480, nfds=nfds@entry=1, timeout=timeout@entry=240)
    at /usr/src/debug/glibc/2.39+git/sysdeps/unix/sysv/linux/poll.c:41
#1  0x0000fffff7edf468 in poll (__timeout=240, __nfds=1, __fds=0xfffffffff480)
#2  snd1_pcm_wait_nocheck (pcm=pcm@entry=0xaaaaaaad2cb0, timeout=240, timeout@entry=-10001) at pcm.c:2993
#3  0x0000fffff7ee54a0 in snd1_pcm_write_areas (pcm=pcm@entry=0xaaaaaaad2cb0, areas=areas@entry=0xfffffffff560, offset=<optimized out>, offset@entry=0, size=<optimized out>,
    size@entry=1768, func=func@entry=0xfffff7ef5190 <snd_pcm_plugin_write_areas>) at pcm.c:7699
#4  0x0000fffff7ef5020 in snd_pcm_plugin_writei (pcm=0xaaaaaaad2cb0, buffer=<optimized out>, size=1768) at pcm_plugin.c:354

It seems that sometimes after suspend and resume there's no available space for data written into buffer. Then aplay keeps stuck in snd_pcm_wait(). I checked the hw_ptr of dmix and found that hw_ptr is always 0 after resume.
I don't have a solution now so I turn to you for help. The version of alsa-lib is v1.2.11. Could you please help check it?

Regards,
Chancel Liu

