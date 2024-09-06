Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3418196EA14
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2024 08:23:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFB891F6;
	Fri,  6 Sep 2024 08:22:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFB891F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725603790;
	bh=8FGZvMaZmGspgaHFH4Q6XPtZ4rXcAy3QIbHe+4ZHG+Q=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aKHRsFsCCTrdXvxu9FXbGaEUBfmPXfm1ceApX2iPKZM09S2QB+pDZuH3vuzujcx+R
	 WvJ5GYNH7SBRpo/iVA6JVwp0+QORerGX3biqPiFhCgnPkHNXYWZnV2LNx1+zBAI0bd
	 ypWdb1lUQDmnsd9HbBDXPoSKAV3+702TR1NTlkBE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2E5FF805BE; Fri,  6 Sep 2024 08:22:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BB99F805B0;
	Fri,  6 Sep 2024 08:22:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46494F8016C; Fri,  6 Sep 2024 08:22:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2607::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 227ACF800E9
	for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2024 08:22:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 227ACF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector1 header.b=nYJTDPxi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qaCCnUMtLORHjQTSf74VQYmRDl65XyAJ/1WN8oXNkoVpeuhZ27oKmjWNfyDE2YNzSY21SrRz6mQv4pYDuU4SwjPPpp3s52GWcA6VW0qZAih+0NqQUxHFzgTB3TjZIiS1CHQ6kMqdxik3BBFSl7llsRAdzEfnxrKkK6TR8ZhcX3MG3rectr7euIfZiINYfL1ehdedULraGo08VzuTZV/Z8HgFZOsofGl9JVNFvZZLwAln00KEe+LbCTCpi/BW4otN8jfddMnVXr5LJxTDFJSrz4a5rvyMWvbcNlYWadenvML9pYy4IRWfdeafAL5bKzJ5lcTHKrwAA9xooWspGBHCnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FGZvMaZmGspgaHFH4Q6XPtZ4rXcAy3QIbHe+4ZHG+Q=;
 b=FhUhM/xNB4UgfIiEJ+I9EM3wfE/IeDIPO37CtewQnKeHGQ7BH20TIEc7DU91nlULhIWOmYx4I6+r5L/yEHiu8BcgYnIwz0SxD21b+soOJySeQXmqfp1RPuzGXkAVHSZtenAE3PHEhbcbmLeLay+LBWnyfd9Q41gK3Y5lky7F/Wwux8XuWTIa+nMYd3r9mOpzfWE9T82hbOf5SAVpZc8hd3b/lQ8p5M6fjdd62S3vAjB+v4T+g0MjcGjac+ZhizOLkdXxrVmpO9Mf6ftpNFS2tQkLNNc9nH//r29F1Re+mRtg/wBFQjapDg/S+nOdHoR9rMqxpRyhAW2OR7BF+TrCiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FGZvMaZmGspgaHFH4Q6XPtZ4rXcAy3QIbHe+4ZHG+Q=;
 b=nYJTDPxiNQ10TRumBEnxIZAuiCn/EJL2kmEY/8bxnfvRyFv86lXqkMFysKoHrI/pkEPcpOPNz50B8lLe+KEYDOkj43bg2+Y1jLbz76xZkMMGvI8K7R3WZblRDvfWJw3aLRTuyhMGMK3xe46EbZkQbQ3jurnTtXXxF+RdM1FwHuqEUIQ58vtK5mz+NNV4mwzWBaIYQbYlybVzI33fWubinsFvc8SSGKiD5dyfqcWLRzG6o4pc7JDgoUkg6ndu6rTYo3Ewh51qGWdujwJNuvEBvQgOIbW2OQw2XBKVEPL4Pxn6H3u+zMshPPpoqPg02jSn5KB/yw7SJmkyDhadQ1+PMg==
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by VI1PR04MB9906.eurprd04.prod.outlook.com (2603:10a6:800:1e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 06:22:24 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc%3]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 06:22:23 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: Takashi Iwai <tiwai@suse.de>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Jaroslav
 Kysela <perex@perex.cz>, "S.J. Wang" <shengjiu.wang@nxp.com>
Subject: RE: [EXT] Re: Suspend/resume Issue on pcm_dmix.c in alsa-lib
Thread-Topic: [EXT] Re: Suspend/resume Issue on pcm_dmix.c in alsa-lib
Thread-Index: AQHa/2dlOSmBGT9X+kCodFtmU1kJOLJI110AgAAcX8CAAD60AIABFiHw
Date: Fri, 6 Sep 2024 06:22:23 +0000
Message-ID: 
 <DB9PR04MB9498DBD22C18D9260C9F848DE39E2@DB9PR04MB9498.eurprd04.prod.outlook.com>
References: 
 <DB9PR04MB94988752ED7C43B399E0BC00E3942@DB9PR04MB9498.eurprd04.prod.outlook.com>
	<87msky1bqh.wl-tiwai@suse.de>
	<DB9PR04MB9498F7BBF2688256DEE7D5F2E39C2@DB9PR04MB9498.eurprd04.prod.outlook.com>
	<877cbrkafv.wl-tiwai@suse.de>
	<DB9PR04MB94980B82ACA8CFF33EF14626E39D2@DB9PR04MB9498.eurprd04.prod.outlook.com>
	<87ed5yh66b.wl-tiwai@suse.de>
	<DB9PR04MB9498BE3E297E22281C0E6914E39D2@DB9PR04MB9498.eurprd04.prod.outlook.com>
 <877cbqgr31.wl-tiwai@suse.de>
In-Reply-To: <877cbqgr31.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB9498:EE_|VI1PR04MB9906:EE_
x-ms-office365-filtering-correlation-id: 5ed98567-63fa-4f51-2f3f-08dcce3c44ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?gb2312?B?ZzVTZDNjQms5OHBCMWdlVkRtc0hTbTR0SzZJVDlGMHlHWmRHaXBYajdZRGVG?=
 =?gb2312?B?Vml2VEUvRVdkZFYyMzhUQkdINWk2Z1JnMDNjeHhHNDdSNDhDeHNycEVpS3FY?=
 =?gb2312?B?aTJJSWVGdkpIcnRoYm9JTXpHZGdTQ25XOVZOSlNIbDBFWk4zSWtCSE5RNWwz?=
 =?gb2312?B?MjVwaVJxM1BpSlF6V04vSWRyb0dnY1R4eUpndlhOcG9pajMyYThVK09RWEh3?=
 =?gb2312?B?QXNTd3JOc2lWQVhyOFZzUHBRcHlSTzltKzhzbll6ZndHUkl2UXBPV0ZQeVZo?=
 =?gb2312?B?MDRIQ0wxaHVVOEVPZmNscXJsclBVdmgwNUh6cEdCNlN6bWNuVEUyUDU3Q1lx?=
 =?gb2312?B?MVp6U3RXRDJUNnVMekp4TTdCZlowYUowMlZQVUNqM1pvWkZ6NzI0UGtPMktR?=
 =?gb2312?B?aHZQTnEvRk5vU2tNTEdDWjA4Z0pEczFpcXR2OGh5VFk5bjBRV3BhV2JrdlI0?=
 =?gb2312?B?Ymd1WnNYWEphRlVzTXNVcEw0TzBnQWo5WXZkY3pvTVNtR1hGaGRQSVU1SW85?=
 =?gb2312?B?RVIzYW5PS094cXpUU0NzS2NubWxkcTNHekZPYU0wWGk5UzZ2QmJYdXFTTkdJ?=
 =?gb2312?B?T09UQjR4dzhVN0VtK1V0R3N6WGtRTU4vbGZBWkJwWkJ2dVoxMmNTZThuNUcy?=
 =?gb2312?B?dFRwd2U3VndFcjhvaUlxWGZGMnhxbDVCTG1sY0xXbGNKRFV2aXNqbU9NdzNH?=
 =?gb2312?B?U0lKalo5SmFxd0I2dURaVzZTU2hjWmE0RWRxaUtTMVMwb0Fnc3VTU2JsZUZT?=
 =?gb2312?B?d1FVL1RDUkVTQ2w5QWxzNVFUY20reXY1TTN2WS8yYWZYQUZFU3h6Y1hOenQ3?=
 =?gb2312?B?VTJkMjZId21SRUNzbTE0TEJ5eUprczF6anQ2UnlQT2IySEFPaVpSWFJnUExX?=
 =?gb2312?B?aHp0YmR2WVpLWEZxNDdVSnd5U3Q4VG5ROEdhbVByeHBUUDUwckRFSjVlV0Fv?=
 =?gb2312?B?bjZaa2lnMXlMTnArOExsTnlsckNYYUJKdlRXZlVBZDlESVFpc0xBS2J3WllJ?=
 =?gb2312?B?YW9vWkpjWlFraHRURFBNVUFWRy9aQmp5TDg4ZnFyZFkzVGRJMUxWbkRpMlpx?=
 =?gb2312?B?cGdHUVYvNnN2RlVPUXVKUm1OVTFzM0ZrWlE4TmRRUGJrZU44eXJIeHZtNWxU?=
 =?gb2312?B?aHZRYjJUaVA0L2JzbDVFSGFibkhCNUxUTnZXN0dxZ2dKLzVQMXpWL3hxaTBh?=
 =?gb2312?B?TXVaVXV1RTh6b1dyZFdhYU9yN2EzUXBubGhJd2xwS1Mzb1YrZFBiWGM5dzZo?=
 =?gb2312?B?ZGg4WFJpNDdxRVRJQTNZWFF0b1gzR2JJcENwbW5ScEIyRVd5Nm9EbzFJdnNv?=
 =?gb2312?B?dXcwazVwUUo1bXQrQjhqY3ZtQ0dQdEYxT09abUQxbHFPZzc3TVBBbS8rQXZy?=
 =?gb2312?B?a2pGVWdpQ2lWdXZTUHZ2QWdKSVYvRE1VdkxMV055NDZ3S2RiamdsdDE3WVYv?=
 =?gb2312?B?TkYxY3ZTd0l3eTQ0citSTDVrcU1OS0JpWFpIRGtxVDRnZE9DVkRaM1RhZnJl?=
 =?gb2312?B?RWhhTWY1bzB0NW4xc0hGNFl4cjNydmtXVnJsRFc1cWhSbzREZjIxNHBDOWNy?=
 =?gb2312?B?bmdwRzMvdllrWUtwaVptdjdkRFpKTXg3TDdLeGl2YWJDdGxicEhXYlBrZDJz?=
 =?gb2312?B?czJCMGlyMHUvbVVaNloyQ1V0UXE1R0hmYktTN1pHSW1xRGNYN0FtdW14V1hJ?=
 =?gb2312?B?d2dURmdTdnA5NDFvVlU4b3BCMWM3VlNKaWthaW5iOTZIOUROSlBNenRXV0FK?=
 =?gb2312?B?V0oxZDJ1dHBZRkh3eUR5OVJRREI5SUpmRE5HR0hSL2JDeGdKMDNQM1pvQUlZ?=
 =?gb2312?B?VVg4TURqRTBOZFQ0b2gxYS9YclREZDdlY1QwMlRYUnA2UU1TZnBwa0cwOHNX?=
 =?gb2312?B?eVJnTktvdWNyQ0ZjVVY2dFVYcGV4VS9NamgwdkRsQ0oyWnc9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?U1cxT2k1MENlLzlnb09XM25RS0NsVHR0ZzZnVDNPYlJvMW16b1dSY3pZalVO?=
 =?gb2312?B?enJMWlRTaWxUMUt5Q0VZMGV6a010RVhjdXFMS21TTjdBOHhZK3BrNFFOMkJ2?=
 =?gb2312?B?Y2VOOUVtK0lSQVM4VVRWL1pQTDhPamRjc3hsWGFGaitzNG5XbUNwcWF6M1Ry?=
 =?gb2312?B?cldCUHptODZoQmRteVpUTmg0UEZmRU5HOUxIQzdkVVQyN2hMYi9nM3BucjNH?=
 =?gb2312?B?MW5lNTJzeGR0SDFCd25VeTB1R21MRWxEVGNmYUp5c2lweGl5QjkrZk14Z3Jr?=
 =?gb2312?B?NFpNSDRzZ1VKYU5LaGlTNm5CNXljZVUvVGdVZ0RZVmtQMndvYktXNnNpcUlC?=
 =?gb2312?B?NEJQVDN2cDFtM0hvdndGSi9HVjFxTWJwclVTZUs4RGRWYzEyT0Exd28zMWFG?=
 =?gb2312?B?R2JrRnYzWGYwQWtuZlByclgvS01qM2pINit0Z3VQdUNkVnJyVW5IT01MTkxj?=
 =?gb2312?B?bVVnbEJsL0xxSGNFem9zQ1Y0bzFRSXBnYlI1cThkSGttUWsrdE03WkVEcVRt?=
 =?gb2312?B?aytuTlF1SDVhTmI4YUhkbExGY3NKaFNLd2Vad0dUM3orNENmaE5tb0VJc3N5?=
 =?gb2312?B?UjFLYk9rNUdzeWFSN2JPd1pKaSt3WWJ6ZHNyV2h1T0lZd3pYM3NNYVVhTmYr?=
 =?gb2312?B?V1lxZUZkTnQ3dUR0MmtLUHhXNWVwOGNRK0E2NWk5OG1mNllPSjNtWmlqUHI2?=
 =?gb2312?B?cVczdmtOLy9YdTVmUGhhbUwwaUNCNWhvczFDK1hINlpaTWpmWmJoUkxSNEdx?=
 =?gb2312?B?bzlBQnEyeFpSdElIbHo5ZG5RYWhwZjNjeS9Ra2ZrNFpGV1dFb0U0TTNHMFhG?=
 =?gb2312?B?SkhkYkc4M21SMWFqK0FublhBd2RISGljSjJIcVJrVnVObDlNWTNhemtad2Ro?=
 =?gb2312?B?enVkTTNyS0dLQVpaNnk5cUhkZzg1K3EzQk9NT3VIT3NXSDdYM2E3MG9abFNq?=
 =?gb2312?B?RytuV3NXbWhGWm9NS1hxRk54QTlmc2NiMGJQZ0ZyUVdlYktWTHJLeUFRcldU?=
 =?gb2312?B?WnNISUJRWUlaOWd2SXFTai9xbmdETWl0QjBJUXlmcDhNaUR4L1BMNTNXdjBs?=
 =?gb2312?B?Vzk5ZjJ4aTVaVHVHZlRabUhxOVNYTFY5WXNkVEJxcGl1aDQyeUVaRW1NRERa?=
 =?gb2312?B?MVNvZmVQRTBWT0VQdjVCaHJLN1NBVnI3TDdWV0p3R25lOXZqRDhPUmRxVFNN?=
 =?gb2312?B?NjBqSVhFUXFtcHI2U1J5blFkeVREU01tNExTS1I4NERLeXByejVaeTI2SmJk?=
 =?gb2312?B?UlI0SklLeXUzVkc0Z2VWTUtCS04veWF3OUpuTzZtUnVCNDh2aDlnRDdDWk1M?=
 =?gb2312?B?eisrSmVGRTA4dXI4MHZxTTVlRVFySXA5dXFPc1FqVW5uWjRMMm5GeGppQjlr?=
 =?gb2312?B?MEhidGxHb1MwRkZreUlmNmhhYVVOZVQ0UDEyVk1qZWYrYVNKQVF6anNMSko1?=
 =?gb2312?B?YmVQQVhkUzU3UWIrNUtsRU1PdDBlbXlwOFlyS0tnVVBSK2NPc2ZxS2VsR2Z2?=
 =?gb2312?B?R3E0SDRjVGlYbjRqMFJ5NzdCQlkvZEZ2WjB2dXQ0NTRBTE1BQ1FKODBhNEJJ?=
 =?gb2312?B?UlpEK1JhaGJQRmpEZFppbWsxcm9LVnlyMUcxUHlvU3JjUzV5MVI0OG9xL3JU?=
 =?gb2312?B?MXp2YlFYVWlTVVF4Mzl3YVJ5VmROQVB4ZU9hcHVXN3dhcGpjbXArUjdjL0o2?=
 =?gb2312?B?S1hzVkVpQTZESERoTENRSjVXeFBsSDNWT2V5Y1BoR3VtSGtLOER1cjRjM0t2?=
 =?gb2312?B?cVVXM0F2NElrREpMekNUOHNtZGw3VWxJem1CTXBDdUp6WHhUa0tZck03K2xu?=
 =?gb2312?B?Y3BLVW9UMm51eFNUU2hiQUpzaUprZndWNlduU01VS0JZTE01REkrc245NFJY?=
 =?gb2312?B?ajR0YnV0UlVxc0tJdVhvaktnTGtDQ2F5clVJNE95TGxJRHZFOTRXdm5MTEdt?=
 =?gb2312?B?SDJGRmV1c3F0dWIzVnpVYm1lVXZyWlhsMWpkR3hyQktTQ2podzVZbUxiR3Bh?=
 =?gb2312?B?MEV0bjI1b1JpVHNJMXJVcSt5V3c1aHVWUjBZWFpEL1JpN1VoZkIyZGo4YnFT?=
 =?gb2312?B?UXF2WmRJV2tNT0hqckpYMGl5ZUMxdEYwMG1kcndZL1pnZHBPdGp4WjNoRFRN?=
 =?gb2312?Q?jxQoT9YYJvMjMxLkYdbdYXwyN?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5ed98567-63fa-4f51-2f3f-08dcce3c44ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2024 06:22:23.0555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 ReVQqGNC+eNbs1nFXRKYIrt6B8hSSRMQkxt/qIbIgTB+3WCiWMAopYWfHL5u/mQf5ddYH0JvLsLlYW+OZ6tx9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9906
Message-ID-Hash: LNBQ643IHPNVJNFZE7BU3OARAWGUBMJT
X-Message-ID-Hash: LNBQ643IHPNVJNFZE7BU3OARAWGUBMJT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EW4CISOHSOP2K2CUKCPLUPY6XJWPNKGX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiA+ID4gPiA+ID4gSGkgVGFrYXNoaSwNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBUaGFua3Mg
Zm9yIHlvdXIgcmVwbHkgYW5kIHN1Z2dlc3Rpb25zLiBGaW5hbGx5IHdlIGhhdmUgZm91bmQNCj4g
PiA+ID4gPiA+IHRoZSByb290DQo+ID4gPiBjYXVzZS4NCj4gPiA+ID4gPiA+IFNlZW1zIGl0J3Mg
cmVsYXRlZCB0byBib3RoIGRyaXZlcnMgYW5kIGFsc2EtbGliLg0KPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+IFdoZW4gdHdvIGRtaXggY2xpZW50cyBydW4gaW4gcGFyYWxsZWwgd2UgZ2V0IHR3byBk
aXJlY3QgZG1peA0KPiBpbnN0YW5jZXMuDQo+ID4gPiA+ID4gPiAxc3QgZG1peCBpbnN0YW5jZToN
Cj4gPiA+ID4gPiA+IHNuZF9wY21fZG1peF9vcGVuKCkNCj4gPiA+ID4gPiA+ICAgICAgIHNuZF9w
Y21fZGlyZWN0X2luaXRpYWxpemVfc2xhdmUoKQ0KPiA+ID4gPiA+ID4gICAgICAgICAgICAgICBz
YXZlX3NsYXZlX3NldHRpbmcoKSBTaW5jZSB0aGUgZHJpdmVyIHdlIGFyZQ0KPiA+ID4gPiA+ID4g
dXNpbmcgaGFzIFNORF9QQ01fSU5GT19SRVNVTUUgZmxhZywNCj4gPiA+ID4gPiA+IGRtaXgtPnNw
Y20tPmluZm8gaGFzIHRoaXMgZmxhZy4gVGhlbiB0aGlzIGZsYWcgaXMgY2xlYXJlZCBpbg0KPiA+
ID4gPiA+IGRtaXgtPnNobXB0ci0+cy5pbmZvLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IDJu
ZCBkbWl4IGluc3RhbmNlOg0KPiA+ID4gPiA+ID4gc25kX3BjbV9kbWl4X29wZW4oKQ0KPiA+ID4g
PiA+ID4gICAgICAgc25kX3BjbV9kaXJlY3Rfb3Blbl9zZWNvbmRhcnlfY2xpZW50KCkNCj4gPiA+
ID4gPiA+ICAgICAgICAgICAgICAgY29weV9zbGF2ZV9zZXR0aW5nKCkgMm5kIGRtaXgtPnNwY20t
PmluZm8gaXMNCj4gPiA+ID4gPiA+IGNvcGllZCBmcm9tIGRtaXgtPnNobXB0ci0+cy5pbmZvIHNv
IGl0IGRvZXNuJw0KPiA+ID4gPiA+ID4gaGFzIHRoaXMgZmxhZy4NCj4gPiA+ID4gPiA+DQo+ID4g
PiA+ID4gPiBJZiAxc3QgZG1peCBpbnN0YW5jZSByZXN1bWVzIGZpcnN0bHkgaXQgc2hvdWxkIGlt
cGxlbWVudA0KPiA+ID4gPiA+ID4gcmVjb3Zlcnkgb2Ygc2xhdmUgcGNtIGluIHNuZF9wY21fZGly
ZWN0X3NsYXZlX3JlY292ZXIoKS4NCj4gPiA+ID4gPiA+IEJlY2F1c2UgMXN0DQo+ID4gPiA+ID4g
PiBkbWl4LT5zcGNtLT5pbmZvIGhhcw0KPiA+ID4gPiA+ID4gU05EX1BDTV9JTkZPX1JFU1VNRaOs
c25kX3BjbV9yZXN1bWUoZGlyZWN0LT5zcGNtKSBjYW4gYmUNCj4gY2FsbGVkDQo+ID4gPiA+ID4g
PiBjb3JyZWN0bHkgdG8gcmVzdW1lIHNsYXZlIHBjbS4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IC4u
LiBhbmQgaW1tZWRpYXRlbHkgc3RvcCB0aGUgc3RyZWFtLCB0aGVuIHByZXBhcmUgYW5kIHJlc3Rh
cnQgYXMNCj4gPiA+ID4gPiBhIHVzdWFsIHJlc3RhcnQuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiA+
IEhvd2V2ZXIgaWYgMm5kIGRtaXggaW5zdGFuY2UgcmVzdW1lcyBmaXJzdGx5LA0KPiA+ID4gPiA+
ID4gc25kX3BjbV9yZXN1bWUoZGlyZWN0LT5zcGNtKSB3aWxsIG5vdCBiZSBjYWxsZWQgYmVjYXVz
ZSBpdCdzDQo+ID4gPiA+ID4gPiBzcGNtLT5pbmZvIGRvZXNuJ3QgaGFzIFNORF9QQ01fSU5GT19S
RVNVTUUgZmxhZy4gVGhlIDFzdCBkbWl4DQo+ID4gPiBpbnN0YW5jZQ0KPiA+ID4gPiA+ID4gYXNz
dW1lcyBzb21lb25lIGVsc2UgYWxyZWFkeSBkaWQgcmVjb3Zlcnkgc28NCj4gPiA+ID4gPiA+IHNu
ZF9wY21fcmVzdW1lKGRpcmVjdC0+c3BjbSkgd29uJ3QgYmUgY2FsbGVkIG5laXRoZXIuIEluDQo+
ID4gPiA+ID4gPiByZXN1bHQgdGhlIHNsYXZlIHBjbSBmYWlscyB0byByZXN1bWUuDQo+ID4gPiA+
ID4NCj4gPiA+ID4gPiBTb21ldGhpbmcgd3JvbmcgaGFwcGVuaW5nIGhlcmUsIHRoZW4uDQo+ID4g
PiA+ID4NCj4gPiA+ID4gPiBJbiBkbWl4LCB0aGVyZSBpcyBubyBoYXJkd2FyZSByZXN1bWUgYXQg
YWxsLCBidXQgaXQncyBhbHdheXMgYQ0KPiA+ID4gPiA+IHJlc3RhcnQgb2YgdGhlIHN0cmVhbS4g
IFRoZSBjYWxsIG9mIHNuZF9wY21fcmVzdW1lKCkgaXMgb25seQ0KPiA+ID4gPiA+IHRlbXBvcmFy
aWx5IGZvcg0KPiA+ID4gaW5jb25zaXN0ZW5jaWVzDQo+ID4gPiA+ID4gdGhhdCBjYW4gYmUgYSBw
cm9ibGVtIG9uIHNvbWUgZHJpdmVycyAoSUlSQyBkbWFlbmdpbmUgc3R1ZmYpLg0KPiA+ID4gPiA+
IFRoYXQgc2FpZCwgZG1peCBkb2VzIGEga2luZCBvZiBmYWtlIHJlc3VtZSwgc3RvcHMgYW5kIHJl
c3RhcnRzDQo+ID4gPiA+ID4gdGhlIHN0cmVhbSBjbGVhbmx5IG9uDQo+ID4gPiB0aGUNCj4gPiA+
ID4gPiBmaXJzdCBpbnN0YW5jZS4gIE9uIHRoZSBzZWNvbmQgaW5zdGFuY2UsIGl0J3MgYWxyZWFk
eSByZWNvdmVyZWQsDQo+ID4gPiA+ID4gaGVuY2UgaXQNCj4gPiA+IGJhaWxzDQo+ID4gPiA+ID4g
b3V0Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSWYgcG9sbCgpIGhhbmdzIG9uIHRoZSBzZWNvbmQg
aW5zdGFuY2UsIHRoZXJlIGNhbiBiZSBzb21lIG90aGVyIHByb2JsZW0uDQo+ID4gPiA+ID4gTWF5
YmUgdGhlIHJlc3VtZSAtPiBzdG9wIC0+IHJlc3RhcnQgc2VxdWVuY2UgZG9lc24ndCB3b3JrIHdp
dGgNCj4gPiA+ID4gPiB5b3VyDQo+ID4gPiBkcml2ZXINCj4gPiA+ID4gPiB3ZWxsPw0KPiA+ID4g
PiA+DQo+ID4gPiA+DQo+ID4gPiA+IE91ciBkbWEgZHJpdmVyIHdpbGwgZG8gUEFVU0UgaW4gc3lz
dGVtIHN1c3BlbmQgYW5kIHJlcXVpcmVzIGRvaW5nDQo+ID4gPiA+IFJFU1VNRQ0KPiA+ID4gaW4N
Cj4gPiA+ID4gc3lzdGVtIHJlc3VtZS4gQ3VycmVudCBwcm9ibGVtIGlzIHRoYXQgc25kX3BjbV9y
ZXN1bWUoKSBpcyBub3QNCj4gPiA+ID4gY2FsbGVkIGJ5DQo+ID4gPiBib3RoDQo+ID4gPiA+IDFz
dCBpbnN0YW5jZSBhbmQgMm5kIGluc3RhbmNlLg0KPiA+ID4NCj4gPiA+IFRoYXQncyB3ZWlyZC4g
IEFyZSB5b3UgcmVhbGx5IHRlc3Rpbmcgd2l0aCB0aGUgbGF0ZXN0IGFsc2EtbGliIGNvZGU/DQo+
ID4gPg0KPiA+ID4gSWYgYXBwbGljYXRpb24gZG9lc24ndCBjYWxsIHNuZF9wY21fcmVzdW1lKCks
IGl0IG1lYW5zIHRoYXQgdGhlIFBDTQ0KPiA+ID4gc3RhdGUgaXNuJ3Qgc2V0IHRvIFNVU1BFTkRF
RCwgc28gaXQgcHJldGVuZHMgYXMgaWYgc3RpbGwgcnVubmluZy4NCj4gPiA+DQo+ID4gPiBPciBp
ZiB5b3UgbWVhbiB0aGF0IHNuZF9wY21fcmVzdW1lKCkgdG8gdGhlIHNsYXZlIFBDTSBpc24ndCBj
YWxsZWQNCj4gPiA+IChldmVuIHRob3VnaCBzbmRfcGNtX3Jlc3VtZSgpIGlzIGNhbGxlZCBmb3Ig
dGhlIGRtaXggUENNKSwgY2hlY2sNCj4gPiA+IHdoZXRoZXIgc25kX3BjbV9kaXJlY3Rfc2xhdmVf
cmVjb3ZlcigpIGdldHMgY2FsbGVkLCBlc3BlY2lhbGx5IGF0DQo+ID4gPiB0aGUNCj4gPiA+IHBv
aW50Og0KPiA+ID4NCj4gPiA+ICAgICAgICAgLyogc29tZSBidWdneSBkcml2ZXJzIHJlcXVpcmUg
dGhlIGRldmljZSByZXN1bWVkIGJlZm9yZQ0KPiBwcmVwYXJlZDsNCj4gPiA+ICAgICAgICAgICog
d2hlbiBhIGRldmljZSBoYXMgUkVTVU1FIGZsYWcgYW5kIGlzIGluIFNVU1BFTkRFRCBzdGF0ZSwN
Cj4gPiA+IHJlc3VtZQ0KPiA+ID4gICAgICAgICAgKiBoZXJlIGJ1dCBpbW1lZGlhdGVseSBkcm9w
IHRvIGJyaW5nIGl0IHRvIGEgc2FuZSBhY3RpdmUgc3RhdGUuDQo+ID4gPiAgICAgICAgICAqLw0K
PiA+ID4gICAgICAgICBpZiAoc3RhdGUgPT0gU05EX1BDTV9TVEFURV9TVVNQRU5ERUQgJiYNCj4g
PiA+ICAgICAgICAgICAgIChkaXJlY3QtPnNwY20tPmluZm8gJiBTTkRfUENNX0lORk9fUkVTVU1F
KSkgew0KPiA+ID4gICAgICAgICAgICAgICAgIHNuZF9wY21fcmVzdW1lKGRpcmVjdC0+c3BjbSk7
DQo+ID4gPiAgICAgICAgICAgICAgICAgc25kX3BjbV9kcm9wKGRpcmVjdC0+c3BjbSk7DQo+ID4g
PiAgICAgICAgICAgICAgICAgc25kX3BjbV9kaXJlY3RfdGltZXJfc3RvcChkaXJlY3QpOw0KPiA+
ID4gICAgICAgICAgICAgICAgIHNuZF9wY21fZGlyZWN0X2NsZWFyX3RpbWVyX3F1ZXVlKGRpcmVj
dCk7DQo+ID4gPiAgICAgICAgIH0NCj4gPiA+DQo+ID4gPiBUcnkgdG8gcHV0IGRlYnVnIHByaW50
cyBvciBjYXRjaCB2aWEgYnJlYWtwb2ludCB3aGV0aGVyIHRoaXMgY29kZQ0KPiA+ID4gcGF0aCBp
cyBleGVjdXRlZC4NCj4gPiA+DQo+ID4gPiBBbHNvLCBkb2VzIHRoZSBpc3N1ZSBoYXBwZW4gd2l0
aCB0aGUgbGF0ZXN0IDYuMTEtcmMga2VybmVsLCB0b28/DQo+ID4gPiBJZiB5ZXMsIHdoYXQgaWYg
eW91IGRyb3AgU05EUlZfUENNX0lORk9fUkVTVU1FIGJpdCBmbGFnIGluIHRoZQ0KPiA+ID4gZHJp
dmVyIHNpZGU/ICBEb2VzIHRoZSBwcm9ibGVtIHBlcnNpc3QsIG9yIGl0IHdvcmtzPw0KPiA+ID4N
Cj4gPg0KPiA+IEknbSB3b3JraW5nIG9uIGtlcm5lbCA2LjYgYW5kIGFsc2EtbGliIHYxLjIuMTEu
IEl0J3Mgbm90IHNvIG91dGRhdGVkIEkNCj4gPiB0aGluayBhbmQgdGhlbiBJIHdpbGwgdHJ5IHRv
IHN3aXRjaCBvbiB0aGUgbGF0ZXN0IHZlcnNpb24uDQo+ID4NCj4gPiBJbmRlZWQgSSBkaWQgc29t
ZSBkZWJ1ZyBvbiB0aGlzIHBhcnQuIFBsZWFzZSBzZWUgbXkgY29tbWVudHMgaW5saW5lLg0KPiA+
DQo+ID4gaW50IHNuZF9wY21fZGlyZWN0X3NsYXZlX3JlY292ZXIoc25kX3BjbV9kaXJlY3RfdCAq
ZGlyZWN0KSB7DQo+ID4gICAgICAgLi4uDQo+ID4NCj4gPiAgICAgICAvKiBbQ2hhbmNlbF0NCj4g
PiAgICAgICAgKiBXaGVuIHR3byBkbWl4IGNsaWVudHMgcnVuIGluIHBhcmFsbGVsIHdlIGdldCB0
d28gZGlyZWN0IGRtaXgNCj4gaW5zdGFuY2VzLg0KPiA+ICAgICAgICAqIDFzdCBkbWl4LT5zcGNt
LT5pbmZvIGhhcyBTTkRfUENNX0lORk9fUkVTVU1FIGZsYWcgYnV0IDJuZA0KPiBkbWl4IGRvZXNu
J3QuDQo+IA0KPiBPSywgdGhhdCBtdXN0IGJlIHRoZSBjYXVzZS4gIEl0J3MgYmVjYXVzZSB0aGUg
c2Vjb25kIG9wZW4gY29waWVzIHRoZSBzYXZlZA0KPiBzaG1lbS0+cy5pbmZvIGludG8gc3BjbS0+
aW5mbyBhdCBpdHMgb3BlbiB0aW1lIHdoaWxlIHdlIGFscmVhZHkgZHJvcHBlZCB0aGUNCj4gSU5G
T19SRVNVTUUgYml0LiAgQWxsIHRoZSByZXN0IGJlaGF2aW9yIGFyZSBzaWRlIGVmZmVjdCBvZiB0
aGlzIGluY29uc2lzdGVuY3kuDQo+IA0KPiBJIGd1ZXNzIGRyb3BwaW5nIHRoZSBJTkZPX1JFU1VN
RSBiaXQgYXQgaHdfcGFyYW1zIGFuZCBod19yZWZpbmUgc2hvdWxkDQo+IHdvcmsgaW5zdGVhZC4g
IEEgdG90YWxseSB1bnRlc3RlZCBmaXggaXMgYmVsb3cuDQo+IA0KPiAoQW5kIEkgYmVsaWV2ZSB0
aGUgZHJvcCBvZiBJTkZPX1BBVVNFIHNob3VsZCBiZSBoYW5kbGVkIHNpbWlsYXJseSwgIHRvbywN
Cj4gaW5zdGVhZCBvZiBkcm9wcGluZyBzcGNtLT5pbmZvIGJpdCB0aGVyZS4pDQo+IA0KPiANCj4g
VGFrYXNoaQ0KPiANCj4gLS0tIGEvc3JjL3BjbS9wY21fZGlyZWN0LmMNCj4gKysrIGIvc3JjL3Bj
bS9wY21fZGlyZWN0LmMNCj4gQEAgLTEwMTgsNiArMTAxOCw3IEBAIGludCBzbmRfcGNtX2RpcmVj
dF9od19yZWZpbmUoc25kX3BjbV90ICpwY20sDQo+IHNuZF9wY21faHdfcGFyYW1zX3QgKnBhcmFt
cykNCj4gICAgICAgICB9DQo+ICAgICAgICAgZHNoYXJlLT50aW1lcl90aWNrcyA9IGh3X3BhcmFt
X2ludGVydmFsKHBhcmFtcywNCj4gU05EX1BDTV9IV19QQVJBTV9QRVJJT0RfU0laRSktPm1heCAv
IGRzaGFyZS0+c2xhdmVfcGVyaW9kX3NpemU7DQo+ICAgICAgICAgcGFyYW1zLT5pbmZvID0gZHNo
YXJlLT5zaG1wdHItPnMuaW5mbzsNCj4gKyAgICAgICBwYXJhbXMtPmluZm8gJj0gflNORF9QQ01f
SU5GT19SRVNVTUU7DQo+ICAjaWZkZWYgUkVGSU5FX0RFQlVHDQo+ICAgICAgICAgc25kX291dHB1
dF9wdXRzKGxvZywgIkRNSVggUkVGSU5FIChlbmQpOlxuIik7DQo+ICAgICAgICAgc25kX3BjbV9o
d19wYXJhbXNfZHVtcChwYXJhbXMsIGxvZyk7IEBAIC0xMDMxLDYgKzEwMzIsNw0KPiBAQCBpbnQg
c25kX3BjbV9kaXJlY3RfaHdfcGFyYW1zKHNuZF9wY21fdCAqcGNtLA0KPiBzbmRfcGNtX2h3X3Bh
cmFtc190ICogcGFyYW1zKQ0KPiAgICAgICAgIHNuZF9wY21fZGlyZWN0X3QgKmRtaXggPSBwY20t
PnByaXZhdGVfZGF0YTsNCj4gDQo+ICAgICAgICAgcGFyYW1zLT5pbmZvID0gZG1peC0+c2htcHRy
LT5zLmluZm87DQo+ICsgICAgICAgcGFyYW1zLT5pbmZvICY9IH5TTkRfUENNX0lORk9fUkVTVU1F
Ow0KPiAgICAgICAgIHBhcmFtcy0+cmF0ZV9udW0gPSBkbWl4LT5zaG1wdHItPnMucmF0ZTsNCj4g
ICAgICAgICBwYXJhbXMtPnJhdGVfZGVuID0gMTsNCj4gICAgICAgICBwYXJhbXMtPmZpZm9fc2l6
ZSA9IDA7DQo+IEBAIC0xMTgzLDggKzExODUsNiBAQCBzdGF0aWMgdm9pZCBzYXZlX3NsYXZlX3Nl
dHRpbmcoc25kX3BjbV9kaXJlY3RfdA0KPiAqZG1peCwgc25kX3BjbV90ICpzcGNtKQ0KPiAgICAg
ICAgIENPUFlfU0xBVkUoYnVmZmVyX3RpbWUpOw0KPiAgICAgICAgIENPUFlfU0xBVkUoc2FtcGxl
X2JpdHMpOw0KPiAgICAgICAgIENPUFlfU0xBVkUoZnJhbWVfYml0cyk7DQo+IC0NCj4gLSAgICAg
ICBkbWl4LT5zaG1wdHItPnMuaW5mbyAmPSB+U05EX1BDTV9JTkZPX1JFU1VNRTsNCj4gIH0NCj4g
DQo+ICAjdW5kZWYgQ09QWV9TTEFWRQ0KDQpUaGFua3MgVGFrYXNoaSwNCg0KVGhpcyBwYXRjaCBj
YW4gZml4IHRoaXMgaXNzdWUgb24gbXkgc2lkZS4gRnJvbSBteSB0ZXN0IGJvdGggZG1peDEtPnNw
Y20tPmluZm8gYW5kDQpkbWl4Mi0+c3BjbS0+aW5mbyBoYXMgU05EX1BDTV9JTkZPX1JFU1VNRSBm
bGFnIGFuZCBzbmRfcGNtX3Jlc3VtZSgpIGNhbiBiZQ0Kc3VjY2Vzc2Z1bGx5IGNhbGxlZCBieSBm
aXJzdCByZXN1bWVkIGluc3RhbmNlLiBJIGRvbid0IHVuZGVyc3RhbmQgdGhpcyBwYXRjaCB3ZWxs
LiBBcmUNCnlvdSBtZWFudCB0byBkcm9wIFNORF9QQ01fSU5GT19SRVNVTUUgZnJvbSBkbWl4IGFu
ZCBrZWVwIGl0IGluIHNsYXZlIHBjbT8NCg0KQlRXLCB3aGVuIHdpbGwgdGhpcyBwYXRjaCBtZXJn
ZWQgdG8gbWFpbmxpbmU/DQoNClJlZ2FyZHMsIA0KQ2hhbmNlbCBMaXUNCg==
