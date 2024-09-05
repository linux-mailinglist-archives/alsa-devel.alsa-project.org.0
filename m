Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2747696D0AA
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 09:44:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76255E9D;
	Thu,  5 Sep 2024 09:44:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76255E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725522293;
	bh=m9fMVoSCfIrDz51TcAzBuxuDfcZoih7GWiekNNfIwbk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Peh5iG9oyT33OaLng4DPQUcecMZ5KuyDJoVKfbbBnDHQvIlQS/d4m4WnG2YpwhOMh
	 2TgmhLRatKh+lJjTMSqsTrOeAFEnuSdWtlyL7j+DQ/+5B5TfAMJ1ZAB7LjHYQ7P9Qw
	 1gyy/6c9JiPIgRqRZqI/I29srrJK2MvMwg73Ffm4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC176F805B6; Thu,  5 Sep 2024 09:44:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6465F805AD;
	Thu,  5 Sep 2024 09:44:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4428FF8016C; Thu,  5 Sep 2024 09:44:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F2B8F80027
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 09:44:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F2B8F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector1 header.b=imWqOO6U
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tBn+tbVvU/M0WErkUL4ce4lPiaNDNVV0USqIQBvuGgHYkX2YkFnTr7BRuW2a0H0/v2MAhX7SwuCg47V3JVinDv0QKG1ySaVD1OAGo38Jk/ihAL1BvJ/i8nluZYQ5kBrFA4YFnmLN4mkn2YA1E1+sDBfBRurvNGt5WoIP6x3p/d9Q0ZYf4INIuLtfUMiJc+69a7KADVpffm4b89mN3xmKTSU9VulQuUQNyYoUG7l+DVoFGURHFZdiAR8W6nlMwmeW78azBqMl+r7Xj039z8Wva941nOjMl6M5bBsCZo85UYuLSzK7Wb3HffbfRIQ0OnmtkRksfgjPPSLOpjcCDdOaCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9fMVoSCfIrDz51TcAzBuxuDfcZoih7GWiekNNfIwbk=;
 b=a/KMWii824KUuDLQ7wAR8xjWz61ExfB26KqJ79xajQAlG8SrQQuEwDDn9+M1Je4ay+6rehwQc4g+txY3gSC9jygEAaUNsxkuLl3c0xX7CNWGMg50o7wGJL1T6ykLL6C/a1iL3aWzSqyIcLIPPVULD0WZ6U1Z6NB8U+r/aP1N7km++6KzxHHJEHVejH/c0OxRQ1YVF3k8XB3qDRuUPYexOhE9oDULeM/hXgTy+kSzLaKh2m2mV4bx5D9eRDDFzwOFuB9evMDxphQgR9VA7uNERYB68FBu9vFmjSZAFWZfuak18O96yrVepHbvk45kI7zIg6VkmB6MlznUiJzSLT2Z5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9fMVoSCfIrDz51TcAzBuxuDfcZoih7GWiekNNfIwbk=;
 b=imWqOO6U7cTWGUWsBWv8qMR55HXWfKDO5imhNG8VM9kot6Xute+qnB6Bye3sMshaOCd5FNqFnlB5/IwwjAISu4EvcIdFGVMoLQMZNLyekGEUyL3voKeK04ZN5QgIPwgVgjXF0f4uH4iBjh/D3qKqfY6ByF3n9CRyQAzq9aapncU0kyIVmeWOJFa5bpczjJ7TuMcYLZLtTcPUD/dQQnWXUnAKA5HfSZjNI2MbvcFHlAz7ZhgPuVNjnVbsgf69wdBK6UM3sZjwfOufE3rLGLgQJDIWYJKGu+3Xjm68xwbQFi2NNM394cn+XdgyEKWmvPw8ZoLjXclSHAKEkg4lFhDa7g==
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by PAXPR04MB8442.eurprd04.prod.outlook.com (2603:10a6:102:20b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Thu, 5 Sep
 2024 07:44:11 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 07:44:10 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: Takashi Iwai <tiwai@suse.de>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Jaroslav
 Kysela <perex@perex.cz>, "S.J. Wang" <shengjiu.wang@nxp.com>
Subject: RE: Re: Suspend/resume Issue on pcm_dmix.c in alsa-lib
Thread-Topic: Re: Suspend/resume Issue on pcm_dmix.c in alsa-lib
Thread-Index: AQHa/2dlOSmBGT9X+kCodFtmU1kJOA==
Date: Thu, 5 Sep 2024 07:44:10 +0000
Message-ID: 
 <DB9PR04MB94980B82ACA8CFF33EF14626E39D2@DB9PR04MB9498.eurprd04.prod.outlook.com>
References: 
 <DB9PR04MB94988752ED7C43B399E0BC00E3942@DB9PR04MB9498.eurprd04.prod.outlook.com>
	<87msky1bqh.wl-tiwai@suse.de>
	<DB9PR04MB9498F7BBF2688256DEE7D5F2E39C2@DB9PR04MB9498.eurprd04.prod.outlook.com>
 <877cbrkafv.wl-tiwai@suse.de>
In-Reply-To: <877cbrkafv.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB9498:EE_|PAXPR04MB8442:EE_
x-ms-office365-filtering-correlation-id: 64571b5f-dd51-4c4c-0bea-08dccd7e87e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dUN3d2ZmVk41cmZWQlU3akpqSEpsSk5VL20rV2pXNDJSbmNqTm9lSG9kUVBT?=
 =?utf-8?B?VitCRG1Kenlxd2tZcDJpTEhyZ0NuMHdTZmZSbHEzMEk5dG1teEtXdlFVNTlk?=
 =?utf-8?B?bXZRVGxGQzFGUmtZQm5jWjJNUHRaK2FlLzBwVDZlQVNLRUU1WWVjQWFIVGVs?=
 =?utf-8?B?V2tPR3NuZXNFcHFpZi9VZHovL0ZnQUdxY2ZCd0lPM0RxTGs5WEYyMEtjVW9j?=
 =?utf-8?B?aFJUMHA1ckFRQUFFbnhkYW0vRFo3bkYvU2UvZG95WnhPYThRamIxOWxBb0Qw?=
 =?utf-8?B?TUJJUEZoSjVJaFFmOEVLc0xRK2JyNHFOTFg4elRPMU1rUFI2N2cwcE96MTI2?=
 =?utf-8?B?aHUrS3VscEx6bENnZTFQYWJXdXdiL3ZsN1pBY2UzNHF1L0ZXeCtSRldHT1V6?=
 =?utf-8?B?RGkySWoxWExXaXR6NjBJODZUM2hqVlFiaEc2Vi8rcTlGTTNUNWNNelcvVHNj?=
 =?utf-8?B?UTgwQ05iQ2tJZVRCTE41SVFKcEhPU21vR2ZvMytUOEx4Mnd6cXlmeWtITktX?=
 =?utf-8?B?RGlwREJxQkVxK3RwZldLa1lpOCt2emJiSUkvT2x2RDVCczkwNXRBS202T0NE?=
 =?utf-8?B?T1hDaUNnNXQraVBvRVNEOFpRWlZ4NFNYaklxbVVvSUc0TE1qZWNURzZvcUJM?=
 =?utf-8?B?VUtnR1EweUZhT2VxRHZTTWdLZW85T0RTR2Y4ZFJXbkp6dklXM01hMHQyNTBG?=
 =?utf-8?B?SE94NjJjQmdxM3Y1aHNvRmFtVDQ0cmZSdjQzTURycjlGU3htTUJ0TEcweEtp?=
 =?utf-8?B?Y3pSSWJiZUphdGNPbUFZbjI0UlVpVjZGSU05UFhTbExLR3g2cUNJems0Slhr?=
 =?utf-8?B?VzRUL2pxbHNWeHYrdTVTN3loZ0ZIeXdYU1RHMlBvYVd0MHhuN1NYb3RXb2Jl?=
 =?utf-8?B?S3Zmanp5ajIzVmRiYVJoeHVtWFlEbjNBNlozRHVHYis3Tks3MHQ1RGdmNmVE?=
 =?utf-8?B?T2xmZEhqbnliNEtXUFhzR3Uzc0tNWHpTMmQyUmxVZWk5RklBSjBkUnV6Ky85?=
 =?utf-8?B?bjBGeW5SZkRJWEVCUzlnaEpDWWc0K0x3L3dML1BlaDhtQUhZbGtXa2pBeGRQ?=
 =?utf-8?B?czdpTzRTb3hLTGcxaEc4Rm1STlZ4UU9zRHNFaEJqRlFtSmJuODRCSGJRVys5?=
 =?utf-8?B?YVNqMXBaK2RFb3pOTWRIdWNKaEFvOVBJbHJjQ3I5S0h4eGlRNjVGTG1WeGtX?=
 =?utf-8?B?RUdxeGQySi9YcFlBUDBhUy9wNlNHNEpKSktmOGxIdzBIVmxmNGk3bUNsc3Fu?=
 =?utf-8?B?MHZDZVZ6Zytab3F4S0N4TG5sYnJPd0t3K1locVFQRUNHU0cra0cwb21wTEsw?=
 =?utf-8?B?M0V4VnBrVlc5WlJMM0pvZkdxNmhCdk54dFpnRUtuY2s5dkNzQkV4MGx5V1FW?=
 =?utf-8?B?c3F1MDN5L3h5OFoxVU9zNXpTa2N1Y0ZTV0RiUWxuQ2ZJUEwvL2NiRlBhazVm?=
 =?utf-8?B?Q1lSdWY5YWNiZCtDa0QxRUQvaktKdXNydkpEN1EvU0c1WmIxMXVFSFI0YVZQ?=
 =?utf-8?B?a0FEL2w4SWNuMW1NRm1MbjV4TVNoem03Zkt4bDBlbzViVUp6NW9pOXJVaVJw?=
 =?utf-8?B?aVR2Q3AvM0s4WXl3K2xDQ2FCbzh0WFZjU0JDOUxya3RsMHRDeDVjenFkNUIy?=
 =?utf-8?B?MVYrUnBRUmY4QzdBaWtLMi9QWGF5U3NvYndMem9nSU1ETTlrMys4c25yQ0k2?=
 =?utf-8?B?S25WWXBLRWdiUjgyOHhONXNabC9CL1dCd25VeC9MYVVodFRhcmpDci9QZFRO?=
 =?utf-8?B?aG9XN3hHV3RDRTNPZkdkU0k5eE83dm0zVjVOb2pka0Q2Q2pTNHlUMVNvNTR4?=
 =?utf-8?B?M2IrclZEa0dBcFBXZGw0QmFzTjRGV25ZTzlMQjRkSUVpL1hFZGxMcTZHQXQ4?=
 =?utf-8?B?UHJEVnNYY3ZkanZETm8rZ2dhc1dnOXV5cno0QWRsQ2NNdUE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZmhidFpUL2pxYzEzYlBUL01rVWdXY3RHNVk5c2QrdUNGdTRvQ1BWZ1VLaWI2?=
 =?utf-8?B?ZDZwdnYzcnp5ZER1NEkyd2dmMDNDR0NQKzVESHpMN0ZmamUzMXZLTk9xK1d1?=
 =?utf-8?B?Zitud1BtTXZuaXpaK0QvcHFrNmtXT0o1d3pBWjlBNUd3cXRTUTNWWWRTMEo3?=
 =?utf-8?B?UUlEVEI2eG5haW9HOTFRSFJzTDV1elFESEI2Y2FDd2duemVkY2Y2WGEzTFlv?=
 =?utf-8?B?VDlmamwxK2x3dC9HWkZ5cVNwK0E2a29zeTJtUjFCV0Z1eTdmWWdNbFhpd0ND?=
 =?utf-8?B?SHJHbXM2V2FEOStPeDhmQ0tlVWNFRENYSjBlYWkwOEdWTlVzV0Ric3Y5emt0?=
 =?utf-8?B?RDFQTXRVMWg0R081ZXFoQ0J3UVV3c3pvRUtoZTRZaCsxZWtFV09rYm54Ri9L?=
 =?utf-8?B?cmhtWm5yVlhFN3ZaSGFJZEs5SE9NTkRHRTZySDRhWnhjVjUxSkhGUlUycWND?=
 =?utf-8?B?Mi9HeVFtRmt4c0ljZVJoSEdxOERyUnpWaFlvWTBMQ1NiNW9mam5uN3NyNVBQ?=
 =?utf-8?B?N0lWTjBFZ0Zya3oxS2J4Qm9nTk41QkhLMWVoZU94WG1IUjl2TC9sRTRXeDkz?=
 =?utf-8?B?V1dSa05nejdqdEM5V0VkNXQ0dXVHaUk5QzdRTW5oLzVBbmY0bkJmenNjYWtx?=
 =?utf-8?B?Z1JPOEc0TzJ4OHYyZnlyWjk5K1FKRElHNzd2TnVSb01Wemd1aEk2RDlDZTJT?=
 =?utf-8?B?S0RXY0x4N3dCZGtzVU9JeXUwNkRVa2UraW1BQlUrenlXWHMxalNuT20zaVVZ?=
 =?utf-8?B?dmkxZk9aOERYSHdmNnRLVERZRWxBT3ZrWXVBU0FvRm5RaERVUFMxMG1ITEF2?=
 =?utf-8?B?VHJKV21DVUl4T2J6bFhnRmxCNkIrOHk0dFUyNjFyRENXOTV6dG14dUJOMElV?=
 =?utf-8?B?ZVlsTUQ1clY1OFNGM1Y5TVF2MjNJK0tBbWVweGtTem1acExOUEJ0ejczRE54?=
 =?utf-8?B?Rk84RDFqOXBZcVhOenpwaTRudzI1UnVtTzdBNkd1VHVnTUdKOXdhSTAwcDZX?=
 =?utf-8?B?ZVZNc3VGMnMvb25QWEZ4MTdXcU11MjExK215M0xBZGFCSnd5bjBkS0ZvK3Jx?=
 =?utf-8?B?a1RxYmZLSnd1VGVFR09mT01icnFuVURxbDlZQlRCQmZpSW50ZWRHL3Z3TlpV?=
 =?utf-8?B?T2JvNktZWjdWaVhnQ0duUXovRHlwakNXUDhQRmJQelhiWHMyOU9NOE9tTHlM?=
 =?utf-8?B?MVdBSWw2YnJBem5keFoxWk01YUs3RWJjdVltTkJwdkxKbEs1aUI1QzVGcnRP?=
 =?utf-8?B?dXE3ZEMxd0JrelJ4RmV0bXFoUDg4SjZIL3dFSU9mWTNvcHZwS014WDE3ejlU?=
 =?utf-8?B?UlF4WTU4OFVsNGl0ODE2Nk41TFRkNVdzNit3MTEwenJlT2tQNFRzTG9ud3R3?=
 =?utf-8?B?dTA4NW5VZVVlalhwYm1kTDg1ekljYmlnYjRBcjRBbEoxZ0s1YkhpZU5TanBG?=
 =?utf-8?B?TEUwd0tmUjVOL1NIMU1qY2kwZkV2NS9xUkJRemxuTThMQjI1TWp6aDJMdGlu?=
 =?utf-8?B?bFJ1cEwxMjZyZ3JSekNBNWxVRGhCZFlKeHg4NmxvYlRpc0VTbXBGd21Gdi93?=
 =?utf-8?B?d0E0d2VXTjBSdFdQK1ZQeDdLbExqcER6aEloUzMrUnREdm9wZ2wxMmpyODJl?=
 =?utf-8?B?WVpXbDkyNHJPUC9xRzdUVGlrVS95T2MxeTRlbG9VQkdteVdtOXBOckE0OGJ2?=
 =?utf-8?B?cnFUMW0xTzgvOVRMdlMwRkUyNlRlU1BuR3BEOENoVU9LWlhmS2ZkZ0YxSjRB?=
 =?utf-8?B?RVN3dWRoQ1ZYcUNoR1Z5MHlCWS9zZk9STzVaSmRBNmFIb3BDQVJtb0JZcnpU?=
 =?utf-8?B?Sm5neXM3ZVNkdWRVQ29XVzQ3L2l2bUdGM3R0SWpnV0JJMVZZa0R2TWlxUnpR?=
 =?utf-8?B?UjlSaWhUQWRzWnNIaW9IcVpDVTlMMWFKQ3VpZXFoaGZPYWkwc1JJYk5UQ1E1?=
 =?utf-8?B?Rlp3OUd1UFNwQUlpeW0rcUk1MWtVL0dBdUZHYmQ0VTVmQ1V5eHVEME9rTlk4?=
 =?utf-8?B?Y1BnWkVRL0krNXZvZEc3RllIZTFQcEFXa1Jta3cxNjlUeHNlZjFJMUpVdGJy?=
 =?utf-8?B?RXlIdnFwSGJQbGpjbW56OGdpSGh3eTgwT01QOHFhbE9aY2ZYWXczSEZjVEU3?=
 =?utf-8?Q?GgCiZztBkAYk/60IVKWrM2dIE?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 64571b5f-dd51-4c4c-0bea-08dccd7e87e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2024 07:44:10.8468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 sP1jAJ8qeMJDk5gthDPBzDYZjdkmeYJgfUFhewU/5kbk+xQskLr8GiQYNOgz+Q2KOjB2Q8pCJfmffg9Oy+bGsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8442
Message-ID-Hash: T4LWEPVFSMHWRQLN3P2AXO5Y6ECTHFIH
X-Message-ID-Hash: T4LWEPVFSMHWRQLN3P2AXO5Y6ECTHFIH
X-MailFrom: chancel.liu@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZJQRFS6BWMTFBZD3MRA5ZDWOMOYW3WK7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiA+DQo+ID4gSGkgVGFrYXNoaSwNCj4gPg0KPiA+IFRoYW5rcyBmb3IgeW91ciByZXBseSBhbmQg
c3VnZ2VzdGlvbnMuIEZpbmFsbHkgd2UgaGF2ZSBmb3VuZCB0aGUgcm9vdCBjYXVzZS4NCj4gPiBT
ZWVtcyBpdCdzIHJlbGF0ZWQgdG8gYm90aCBkcml2ZXJzIGFuZCBhbHNhLWxpYi4NCj4gPg0KPiA+
IFdoZW4gdHdvIGRtaXggY2xpZW50cyBydW4gaW4gcGFyYWxsZWwgd2UgZ2V0IHR3byBkaXJlY3Qg
ZG1peCBpbnN0YW5jZXMuDQo+ID4gMXN0IGRtaXggaW5zdGFuY2U6DQo+ID4gc25kX3BjbV9kbWl4
X29wZW4oKQ0KPiA+ICAgICAgIHNuZF9wY21fZGlyZWN0X2luaXRpYWxpemVfc2xhdmUoKQ0KPiA+
ICAgICAgICAgICAgICAgc2F2ZV9zbGF2ZV9zZXR0aW5nKCkNCj4gPiBTaW5jZSB0aGUgZHJpdmVy
IHdlIGFyZSB1c2luZyBoYXMgU05EX1BDTV9JTkZPX1JFU1VNRSBmbGFnLA0KPiA+IGRtaXgtPnNw
Y20tPmluZm8gaGFzIHRoaXMgZmxhZy4gVGhlbiB0aGlzIGZsYWcgaXMgY2xlYXJlZCBpbg0KPiBk
bWl4LT5zaG1wdHItPnMuaW5mby4NCj4gPg0KPiA+IDJuZCBkbWl4IGluc3RhbmNlOg0KPiA+IHNu
ZF9wY21fZG1peF9vcGVuKCkNCj4gPiAgICAgICBzbmRfcGNtX2RpcmVjdF9vcGVuX3NlY29uZGFy
eV9jbGllbnQoKQ0KPiA+ICAgICAgICAgICAgICAgY29weV9zbGF2ZV9zZXR0aW5nKCkNCj4gPiAy
bmQgZG1peC0+c3BjbS0+aW5mbyBpcyBjb3BpZWQgZnJvbSBkbWl4LT5zaG1wdHItPnMuaW5mbyBz
byBpdCBkb2VzbicNCj4gPiBoYXMgdGhpcyBmbGFnLg0KPiA+DQo+ID4gSWYgMXN0IGRtaXggaW5z
dGFuY2UgcmVzdW1lcyBmaXJzdGx5IGl0IHNob3VsZCBpbXBsZW1lbnQgcmVjb3Zlcnkgb2YNCj4g
PiBzbGF2ZSBwY20gaW4gc25kX3BjbV9kaXJlY3Rfc2xhdmVfcmVjb3ZlcigpLiBCZWNhdXNlIDFz
dA0KPiA+IGRtaXgtPnNwY20tPmluZm8gaGFzDQo+ID4gU05EX1BDTV9JTkZPX1JFU1VNRe+8jHNu
ZF9wY21fcmVzdW1lKGRpcmVjdC0+c3BjbSkgY2FuIGJlIGNhbGxlZA0KPiA+IGNvcnJlY3RseSB0
byByZXN1bWUgc2xhdmUgcGNtLg0KPiANCj4gLi4uIGFuZCBpbW1lZGlhdGVseSBzdG9wIHRoZSBz
dHJlYW0sIHRoZW4gcHJlcGFyZSBhbmQgcmVzdGFydCBhcyBhIHVzdWFsDQo+IHJlc3RhcnQuDQo+
IA0KPiA+IEhvd2V2ZXIgaWYgMm5kIGRtaXggaW5zdGFuY2UgcmVzdW1lcyBmaXJzdGx5LA0KPiA+
IHNuZF9wY21fcmVzdW1lKGRpcmVjdC0+c3BjbSkgd2lsbCBub3QgYmUgY2FsbGVkIGJlY2F1c2Ug
aXQncw0KPiA+IHNwY20tPmluZm8gZG9lc24ndCBoYXMgU05EX1BDTV9JTkZPX1JFU1VNRSBmbGFn
LiBUaGUgMXN0IGRtaXggaW5zdGFuY2UNCj4gPiBhc3N1bWVzIHNvbWVvbmUgZWxzZSBhbHJlYWR5
IGRpZCByZWNvdmVyeSBzbw0KPiA+IHNuZF9wY21fcmVzdW1lKGRpcmVjdC0+c3BjbSkgd29uJ3Qg
YmUgY2FsbGVkIG5laXRoZXIuIEluIHJlc3VsdCB0aGUNCj4gPiBzbGF2ZSBwY20gZmFpbHMgdG8g
cmVzdW1lLg0KPiANCj4gU29tZXRoaW5nIHdyb25nIGhhcHBlbmluZyBoZXJlLCB0aGVuLg0KPiAN
Cj4gSW4gZG1peCwgdGhlcmUgaXMgbm8gaGFyZHdhcmUgcmVzdW1lIGF0IGFsbCwgYnV0IGl0J3Mg
YWx3YXlzIGEgcmVzdGFydCBvZiB0aGUNCj4gc3RyZWFtLiAgVGhlIGNhbGwgb2Ygc25kX3BjbV9y
ZXN1bWUoKSBpcyBvbmx5IHRlbXBvcmFyaWx5IGZvciBpbmNvbnNpc3RlbmNpZXMNCj4gdGhhdCBj
YW4gYmUgYSBwcm9ibGVtIG9uIHNvbWUgZHJpdmVycyAoSUlSQyBkbWFlbmdpbmUgc3R1ZmYpLiAg
VGhhdCBzYWlkLA0KPiBkbWl4IGRvZXMgYSBraW5kIG9mIGZha2UgcmVzdW1lLCBzdG9wcyBhbmQg
cmVzdGFydHMgdGhlIHN0cmVhbSBjbGVhbmx5IG9uIHRoZQ0KPiBmaXJzdCBpbnN0YW5jZS4gIE9u
IHRoZSBzZWNvbmQgaW5zdGFuY2UsIGl0J3MgYWxyZWFkeSByZWNvdmVyZWQsIGhlbmNlIGl0IGJh
aWxzDQo+IG91dC4NCj4gDQo+IElmIHBvbGwoKSBoYW5ncyBvbiB0aGUgc2Vjb25kIGluc3RhbmNl
LCB0aGVyZSBjYW4gYmUgc29tZSBvdGhlciBwcm9ibGVtLg0KPiBNYXliZSB0aGUgcmVzdW1lIC0+
IHN0b3AgLT4gcmVzdGFydCBzZXF1ZW5jZSBkb2Vzbid0IHdvcmsgd2l0aCB5b3VyIGRyaXZlcg0K
PiB3ZWxsPw0KPiANCg0KT3VyIGRtYSBkcml2ZXIgd2lsbCBkbyBQQVVTRSBpbiBzeXN0ZW0gc3Vz
cGVuZCBhbmQgcmVxdWlyZXMgZG9pbmcgUkVTVU1FIGluDQpzeXN0ZW0gcmVzdW1lLiBDdXJyZW50
IHByb2JsZW0gaXMgdGhhdCBzbmRfcGNtX3Jlc3VtZSgpIGlzIG5vdCBjYWxsZWQgYnkgYm90aA0K
MXN0IGluc3RhbmNlIGFuZCAybmQgaW5zdGFuY2UuDQoNCj4gPiBTTkRfUENNX0lORk9fUkVTVU1F
IGZsYWcgaGFzIGltcGFjdCBvbiB0aGUgZmxvdyBvZiBkbWl4IHJlc3VtZS4gSW4gbXkNCj4gPiBv
cGluaW9uIHRoZSBmaXJzdCByZXN1bWVkIGRtaXggaW5zdGFuY2Ugc2hvdWxkIG1ha2Ugc3VyZSBz
bGF2ZSBwY20gY2FuDQo+ID4gYmUgcmVjb3ZlcmVkIHByb3Blcmx5IG5vIG1hdHRlciBpdCdzIHRo
ZSBmaXJzdCBvcGVuZWQgaW5zdGFuY2Ugb3INCj4gPiBzZWNvbmRhcnkgb3BlbmVkIGluc3RhbmNl
DQo+IC4NCj4gDQo+IFRoZSBzbmRfcGNtX3Jlc3VtZSgpIGdldHMgY2FsbGVkIG5vIG1hdHRlciB3
aGljaCBpbnN0YW5jZSwganVzdCB0aGUgZmlyc3Qgb25lDQo+IHdobyB0cmllcyB0byByZWNvdmVy
IHRoZSBzdXNwZW5kZWQgc3RhdGUuICAoQW5kIGl0J3MgY2FsbGVkIGludGVybmFsbHkgYXQNCj4g
dXBkYXRpbmcgdGhlIHZhcmlvdXMgc3RhdGUsIG5vdCBuZWNlc3NhcmlseSBhbiBleHBsaWNpdCBy
ZWNvdmVyeSBjYWxsLikNCj4gDQoNClVuZm9ydHVuYXRlbHkgaWYgc2Vjb25kYXJ5IG9wZW5lZCBp
bnN0YW5jZSByZXN1bWVzIGZpcnN0IGl0IGRvZXNuJ3QgaGFzDQpTTkRfUENNX0lORk9fUkVTVU1F
IHdoaWNoIGNhdXNlcyBzbmRfcGNtX3Jlc3VtZSgpIG5ldmVyIGJlIGNhbGxlZC4NCg0KPiA+IERv
IHlvdSBrbm93IHdoeSB0aGUgc2Vjb25kYXJ5IG9wZW5lZCBpbnN0YW5jZSBjbGVhciB0aGUNCj4g
PiBTTkRfUENNX0lORk9fUkVTVU1FIGZsYWc/IENhbiB3ZSBkbyB0aGUgZm9sbG93aW5nIG1vZGlm
aWNhdGlvbj8NCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9zcmMvcGNtL3BjbV9kaXJlY3QuYyBiL3Ny
Yy9wY20vcGNtX2RpcmVjdC5jIEBAIC0xMTgzLDgNCj4gPiArMTIyNiw2IEBAIHN0YXRpYyB2b2lk
IHNhdmVfc2xhdmVfc2V0dGluZyhzbmRfcGNtX2RpcmVjdF90ICpkbWl4LA0KPiBzbmRfcGNtX3Qg
KnNwY20pDQo+ID4gICAgICAgICBDT1BZX1NMQVZFKGJ1ZmZlcl90aW1lKTsNCj4gPiAgICAgICAg
IENPUFlfU0xBVkUoc2FtcGxlX2JpdHMpOw0KPiA+ICAgICAgICAgQ09QWV9TTEFWRShmcmFtZV9i
aXRzKTsNCj4gPiAtDQo+ID4gLSAgICAgICBkbWl4LT5zaG1wdHItPnMuaW5mbyAmPSB+U05EX1BD
TV9JTkZPX1JFU1VNRTsNCj4gDQo+IEkgZG9uJ3QgdGhpbmsgc28uICBUaGUgY2xlYXJhbmNlIG9m
IHRoZSBSRVNVTUUgZmxhZyBoZXJlIGlzIGNvcnJlY3QuDQo+IGRtaXggZG9lc24ndCBzdXBwb3J0
IHRoZSBoYXJkd2FyZSByZXN1bWUgZmVhdHVyZS4gIEl0IGRvZXMgaXRzIG93bi4NCj4gKEFuZCB0
aGlzIGZsYWcgaXMgbWVyZWx5IGEgaW5mbyBmb3IgYXBwcywgd2hpY2ggaXNuJ3QgcmVhbGx5IGV2
YWx1YXRlZCBleGNlcHQgZm9yDQo+IHRoZSBjb2RlIGluIGRtaXggd29ya2Fyb3VuZCB0aGVyZS4p
DQo+IA0KPiANCj4gVGFrYXNoaQ0KPiANCg0KSSB0aGluayBkbWl4IHNob3VsZCBrbm93IHdoYXQg
c3RhdGUgdGhlIHJlYWwgZHJpdmVyIGlzLiBJZiBkcml2ZXIgcmVxdWlyZXMgdGhhdA0KYXBwIHNo
b3VsZCBkbyBzbmRfcGNtX3Jlc3VtZSgpIGhvdyBjYW4gZG1peCBnZXQgdGhpcyBpbmZvcm1hdGlv
bj8NCg0KTWFueSB0aGFua3MgZm9yIGFuc3dlcmluZyB0aGVzZSBxdWVzdGlvbnMuDQoNClJlZ2Fy
ZHMsIA0KQ2hhbmNlbCBMaXUNCg0KDQo=
