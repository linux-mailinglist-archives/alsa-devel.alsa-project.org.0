Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A250DAD3C0E
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jun 2025 17:00:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F174C601EF;
	Tue, 10 Jun 2025 17:00:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F174C601EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749567646;
	bh=uXIBZzDAdE4/OMH0fBsCo3mndhpBs2uKraxMsjn4B2Q=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=UT0RPCi+nUh6syXmQbPh2q2WK3tT/DKHXhKsic5f+kuIruMj/E7HaG+h4xE97p/g5
	 VJdKgFyW84pGtrq1vlSw9nMsYsdV4gfGuMYrGXWmogRpCvSFv1rJkxHfPXYl4ufnhs
	 TFMr8g14dW1ZbbkNF2nTW0RKu1i1fWaqr0LDny7s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F918F805BD; Tue, 10 Jun 2025 17:00:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C03DF8025F;
	Tue, 10 Jun 2025 17:00:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92216F804B2; Tue, 10 Jun 2025 17:00:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,
	T_SPF_PERMERROR shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20728.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::728])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89EBDF8025A
	for <alsa-devel@alsa-project.org>; Tue, 10 Jun 2025 17:00:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89EBDF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=palmerwirelessmedtechcom.onmicrosoft.com
 header.i=@palmerwirelessmedtechcom.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-palmerwirelessmedtechcom-onmicrosoft-com header.b=Ougeuq9G
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TL9SLSgRN4gjHXWTTbr1QVepUMNokgkVhZsmwum/UuapC2fsJxU68aItsKe/YR29GpppKEs7uWlGHyASZyI9tNWuicb3Ys1QCmnJZwBXw5UYfhBLbls8JNI+kGnUYB5u/jc2TubMTwzmOO60ufpgdTJlgWA1cJwTZSNdjR8ieBieCSh5i73oFOpxVG4l9DIZp14EtcemxJ+EOWU5vDiae8vRXwIk+0JUdcNfsLk2vjr0PeMX80EqEOYtu1fWCAs8KvcL4zRSkzN3iNcRBdrwQNNdgPpEtFM3E+IShlPW/VsXxNAiFp8XXv0Fu9FCbzWEVwFYXyb2jaslKTNMl9faIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXIBZzDAdE4/OMH0fBsCo3mndhpBs2uKraxMsjn4B2Q=;
 b=LNUxajOXQ4rpwD2CSVAVkHZ+wOhIpc6xa75ilv5jqyO6gNgvfI56bImsXgTKc+wbGtlsXBkfkRU2gqliwZs1zSqcQkPVknAno7urCfM04hhFhCFwwuL11D2MQWPy/qUVynqP5jaYQnjgChHqvIulU9V4knCJ6NU6FUnTeLf1IsrexveiyOI7KDD2sLoCKMdiwFb3azd9ok9RPVjCJsjQAPSR5rre7PstqM51gMz961YsGgi/wHtdTDgDPU9xsT2YhwjlVxmxlStEXMVDoyX8mR5oWV8cZJDqhFbP9UzxjXDcRR4x2PxaVpQI6szkal9EpcElflOozBHWHJK2rB2cYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=palmerwirelessmedtech.com; dmarc=pass action=none
 header.from=palmerwirelessmedtech.com; dkim=pass
 header.d=palmerwirelessmedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=palmerwirelessmedtechcom.onmicrosoft.com;
 s=selector2-palmerwirelessmedtechcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXIBZzDAdE4/OMH0fBsCo3mndhpBs2uKraxMsjn4B2Q=;
 b=Ougeuq9GVFh8yHuMO+3iDE16B/ESM/7uAdaMU+CT7zJbzjHN7QbIGDXCMnKYmEyH8NSwusgpjG8b0Cl7MlMcm7T0NTPwR3jMMm6rXX1oaAeOffncmSXIO7vjUSKr81ZUfpM6ZKzpGnXRR+tLS24gNtjEqImXKy0YYOff7II/JFQ=
Received: from IA1PR15MB6008.namprd15.prod.outlook.com (2603:10b6:208:456::5)
 by SA0PR15MB3856.namprd15.prod.outlook.com (2603:10b6:806:86::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 10 Jun
 2025 14:59:57 +0000
Received: from IA1PR15MB6008.namprd15.prod.outlook.com
 ([fe80::a280:9c40:1079:167e]) by IA1PR15MB6008.namprd15.prod.outlook.com
 ([fe80::a280:9c40:1079:167e%6]) with mapi id 15.20.8813.022; Tue, 10 Jun 2025
 14:59:57 +0000
From: Steve Broshar <steve@palmerwirelessmedtech.com>
To: Lars-Peter Clausen <lars@metafoo.de>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>
Subject: RE: Request for help: How to upgrade a sound driver from kernel 4.14
 to 6.6
Thread-Topic: Request for help: How to upgrade a sound driver from kernel 4.14
 to 6.6
Thread-Index: AdvGm2GwhjF7ALRDTa6EaezGwRm8LgAxw3iAApIRTDAAQOOYgAHacZbQ
Date: Tue, 10 Jun 2025 14:59:57 +0000
Message-ID: 
 <IA1PR15MB600848657AD18CFD8DE71F5FB56AA@IA1PR15MB6008.namprd15.prod.outlook.com>
References: 
 <IA1PR15MB6008974A825847331B10762BB593A@IA1PR15MB6008.namprd15.prod.outlook.com>
 <f278f7cf-dc78-4fac-b27d-2a7fbce08b62@metafoo.de>
 <IA1PR15MB600894BEC69309E17E839812B561A@IA1PR15MB6008.namprd15.prod.outlook.com>
 <4e315810-dcf5-48ac-ab86-f7c481a1c49d@metafoo.de>
In-Reply-To: <4e315810-dcf5-48ac-ab86-f7c481a1c49d@metafoo.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=palmerwirelessmedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR15MB6008:EE_|SA0PR15MB3856:EE_
x-ms-office365-filtering-correlation-id: 2efe55ff-ebaf-43ae-12a3-08dda82f7746
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZDdBaUkvelVCdDR2RGFYYXRrN0pHRGgvb2FkK0dmaHlhME80cFU2bjlwMWlY?=
 =?utf-8?B?RktKd3RrTkNpTWM4d1VLcjJHU2VzbkZ6ZDFodzlVMEpEYUlkc2tjbzRNY0pa?=
 =?utf-8?B?Zjc5cFFaT2dEOUVTU0dqL1hRdjJQdFk4NXg5ZHRlbGczT2pYUGhFSDkra3NF?=
 =?utf-8?B?QUFRcTVxWFpzV1JiNGNaTnN1Q1ZBRElnWnZuWWJwZmZzRXVpand1QXQxOHho?=
 =?utf-8?B?U2tPNVlmWFBGUENSelo5cXFMQmZra1dkVTVhRCtDL0NBcS9yNUNWbEkzeGgz?=
 =?utf-8?B?SGczWmZ3M0o3M3lNZXBGbVFWQlNWZGtTQmRDaDNKNWhLTkdtcEhVYUNmN2sz?=
 =?utf-8?B?RDJGTEtCeFkzWnZucjQ1U2IyVzZVYndPY1MxajhmM3IrajFxdVd1RWZMcVFT?=
 =?utf-8?B?KzkramNJMUtvMjdSVlN2RmxZUU5MRFJOT1hXbmxTdFdWV0xzV0xpTGpKU0Rt?=
 =?utf-8?B?Um1wVXVJbEEyY1dLamdYVCs4UDJaZ1MwNEhOczh2d1puN0FnaklyN3dXamhD?=
 =?utf-8?B?cVJRc24xMEd2V09Rc3RwYm1yUHVXNlFrU0I0bkIwQytWa0FmYTU0cU9DM2N1?=
 =?utf-8?B?OW5lb1d3UEs1ZVRBYjQ1aVYyVTV1UTBMUlg3aFl2OTNXRmVMRlIwRjJYalVi?=
 =?utf-8?B?Z2wzbkQ2a05pVmVPREpLa2xUZnFwSGtUcGJqM3l5OXUrdzIwSVYySEZkNmcv?=
 =?utf-8?B?TzRxVCtLQ2RUS1ZpK1JIZHNRTkFadHpPVnFsY0pSWlczY3pVNHlPb3Y2VzFN?=
 =?utf-8?B?Z2FEVWxRb000aE5BZG5MSUdmSTdldmxISUxGMDJ5VGI4ekZjamI0MDZjQ0hR?=
 =?utf-8?B?TFF0TThxSmY3VG02TVJocFJORk81WHMxajh5Q1pXTFB4Q2daRlg3cVRoQ255?=
 =?utf-8?B?QUpjUnZwRHZtbWZYZnZkOUh6b2lDb2l5VXoxT20ySUdpdjRmbjVoU2lOOWpl?=
 =?utf-8?B?WUFYT1Q0VjZtcXNncWZKRHRua0ZZdFZWb3BlS2R1Rmd4Rm9KSEM1VTZ6dUx2?=
 =?utf-8?B?Qk1ubnNFRFJoelNIenNYM3U3eGNsR2hEMnNJaWdyRmVzVlBVRGoyUUZ3dGxp?=
 =?utf-8?B?Uis4aStzQTV0czJUMVBVOVlqTlArYU9kN3VkUVpGTzRhOUlhcCtCcndLejNy?=
 =?utf-8?B?amFVckg4aWl3Q1VQTGRqbWFmcCtmeURvNlZUekxpNVNWZXZjWXhrWWxYS0dV?=
 =?utf-8?B?OTVNRE9BcVhxQkxPVVhJV21OV0UrenBlVmdrRXhrT01nTTRZNlpoWHQyR1Bx?=
 =?utf-8?B?TGd0UHZEdlBlRWdCMjlXL3FIWmkvTGFTVGlYTVlKUkJ6SVluT0xhOG4rS2sw?=
 =?utf-8?B?MTIxeG5YRWRHSy9NQjBOL3BTOXRoM0RtcGY4THBzajhXUFlveGtMWlFLdkhm?=
 =?utf-8?B?Yy94YWFBZGVHS296YkhQUjEvbktvNGpvcUZka1pMZCthdm5CcDdHRFcxMmd2?=
 =?utf-8?B?YXdBVytwbmlWTHJWZzZrY2dpVlhERHhTZERtanpxSEROVFR4RENqMXQzY1c1?=
 =?utf-8?B?dFc3ZUtuNjNKa0FIWGlXQUlmQXRiUWRqU3l4THE1UUM5bG8xdDZHaTI4SjFO?=
 =?utf-8?B?ODJjcUhLQmFOTU5TQmFldHVxc2d0T21WajJWOFVTUkJsUjJLelFCclAwK04v?=
 =?utf-8?B?RXRldnNMTXBUM1JDTjVjd2NzOVV2azRqemRjenJlMkJCVjFyUDgxWlpyVzV3?=
 =?utf-8?B?cHJ1M1hoMHlJYlkyOFQxUXRmV3dGc2tsOG00Z2tXL0J3clVuYWVkblFnc1k3?=
 =?utf-8?B?YXM4OVhOdVR0R21mbTh4N1JPLzdLUnpNNnkzeDJiYi9HZWpEclRZQmZCQjBa?=
 =?utf-8?B?WFlNKy9GdGR3d0lPSUJsemtTR29mRXdrdmZLK3BlMm5IT2tySitlVEM4Zzk5?=
 =?utf-8?B?bkhJOVl2aHZLdGNvS0ZFSjczWEx5UFhIUHpJcHFuSFZNWDdZNThNeitwamJD?=
 =?utf-8?B?QWZSRmtJK1A5K0VjZjdGbzlQQk9Fb2NpeG9iVzNmYmJTbDB4UGVhdXJ5WktL?=
 =?utf-8?B?K05GeVNoNFh3PT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR15MB6008.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YzJKdm5UMThuSVh0UEQyWDV2Rys2SFo3WlBVejZqa1ZDdEUxYnlMODU5V215?=
 =?utf-8?B?M0lSS254d1owSGNaenpyZEFtckVIRXJMK2RiZlFoaUU0b24vWmgzc0NjVHI1?=
 =?utf-8?B?bTlXMi9BK1J1TkorcWJrbmlGKytnaTVYdWsrVlA5UVQ0RWtsQmtuT1ZndGZW?=
 =?utf-8?B?VTRIUDVRbldYSkNiN29VOFZMRFVxbkxQL3EwZFVxWm5FSUQ1c0hUeW50dE1h?=
 =?utf-8?B?a1NEbzFNV3ZXaE5lOWlob0E1ZFAyZnNmMngzYmZKNHpodkdnUjJaZmlNbURr?=
 =?utf-8?B?djFkYmdhMlJ5VERQdDNGZHRHcHB3RnlEVkZuUXhuK3NkdzV5dS8vY01aNUx1?=
 =?utf-8?B?emJ4N2RrUFJhODlSTkhtM0JVTmhmTzhlOFVsYnlFdEVxdGQ0RDhSSnFmMWZJ?=
 =?utf-8?B?TThLb2pSVnhLSFJKd2RraGtscWxCZzRiMlBkampLY2Y5M0cwYkVkSWNTUXRR?=
 =?utf-8?B?K3ZuVzBVSU81SWVGaTdVY3dHSVdJT200OHVVdGZmRWRZZm52RTlHbnIreDR2?=
 =?utf-8?B?OUM1eGRzOVhRazMveTBtcnhZbDVrWXQxbllTdE1XZWpOemFDd0VtS2lQMmo4?=
 =?utf-8?B?WDQrTkJhQzZnbFkwMm9uNldVeG9uc1I3dVdNRzJraW5WNUZqbFBIVW40Nzll?=
 =?utf-8?B?eVNXS282RC9OeTd5Umw1K1YvK1BhblluU3VsendNbENQK0srSmxjUENWejRO?=
 =?utf-8?B?cEJOK0Q4U3NQRXRvSGN2aDlySldTK3NmdEgyejBSOWhhbko2Y0Z2ZHEzY0Nv?=
 =?utf-8?B?NWhROXE1QUJrYm9FOWw2dlFwRU1SamV6VmJ1VmRacDY3U1pWT0E1cm5LY0li?=
 =?utf-8?B?OXArZ0RjUVZnSHBYbk5WL25lUmZRcmNQR0xISDZCcTBUYjI5SG8vcUVKWEMz?=
 =?utf-8?B?c0JaTUg5K2FQVnZKeEdnWUltYmNEQmErdHVNbFAvNExncFRSekVHQ0tzVTdR?=
 =?utf-8?B?dUZQKzhYdzE1U0dqeDJaMUNNM253QjVFQ1F4VFZMZzRlZkhDOVN4aGFaWTNG?=
 =?utf-8?B?RGNUOWR2dEl1bTlReFNhcmEzSkI4OW1mbnhNaTVNa1BqeW51NGp2WFB5ZFA2?=
 =?utf-8?B?MWk3ZzNqd3poTW1JY3JCaHdlVkxUR3FIMjlZVzJncFZJUWZHZGdwdndvLzk1?=
 =?utf-8?B?QXR5UXRxcHpuUmQ0RzJlUEc5YXJuTUhjV2N5NTl6NEdhN3laOU9SZDdEMnUw?=
 =?utf-8?B?OEdLR2J4WkVMVnVwY1NkWFRpTms3dUxPVWtJcnZ6NVIyeUxsVUdwcUQyamM1?=
 =?utf-8?B?WmU2Q1ZJTCsrMENIYTVySG5HcG81bTQvWnl5SjZmVjhCQlRVMFZ4VEw2WDBS?=
 =?utf-8?B?QW1rWC9ycEJ4T3ZRWENyY1hieVNldm1ETHR3bXh0R2FwSU4ydjNXM0tkUm5z?=
 =?utf-8?B?ancvc3pHWFdiTDNhU0Z2VTlBV0xhckJoZEdJcUVyVzB6N3RnT2JiNnhiZGJK?=
 =?utf-8?B?ZlZ4MVp6UzNyUTR5dDMvM01kTGE5N2xXb1ZGZGdjZUZXdGpwZFo4MWhZdjZL?=
 =?utf-8?B?dWJFa3M5VDhWTU5CbDVLQVc2bjc5RGNBQ1RQTE1CME5nMjZuVEpZY0xqWkhS?=
 =?utf-8?B?YVpFeWpwM2lzSndMZmRNYXFtcWxobFp1bTlGU0VTL2ZoWStma2NkUlIzQXFF?=
 =?utf-8?B?aEFFcmcrYXc1UEZEOE96dU1GSVN0WjE1Um5GMHY5WjNYYWtZeFZ3aGtIdlhq?=
 =?utf-8?B?R0FsZVNqWkNRZVFYeFkxTXdwTE5XMlk3d1JXV2Q1WHp4UkdOeWNEejlYMEla?=
 =?utf-8?B?WEhTRWF6T01NaDdJNnprVnJpYTQvUFM3ajlIcFV5QVR0OUZXVEFadFp0WHRG?=
 =?utf-8?B?elBUZFI0eW9ZOVNvUHR1YzJCZlFLL1lNeUwwdi9xc09xcW9oTU9QYXRXendK?=
 =?utf-8?B?RFZUZzZJa3dYNjFkcWlvZUpQOXI4akpZMmtjWUV3RVo3aEJyem1ndEZFb3h6?=
 =?utf-8?B?M2VtRHdGVzdSVWdtaEloQWZrazZMbE9NaVJzb3dHQW4rRG1CNXE4SkRtbi9u?=
 =?utf-8?B?WVExUGNxdFBNUTlyaXhuSFBDWHFHTVVnazF3L0UyNmpheldkdC9xNkRqSlJN?=
 =?utf-8?B?Yll4TFhGbEk5TElla2ZIU1lWSUJLNEJjRkRsb2FBQkRWY21sUFp1L2ErMTVY?=
 =?utf-8?B?cGhyUGtXRHduMjMyd3hRKzdmOTAwdHJlWjIvNzNESWRrcWg5R1NSZnExc2VK?=
 =?utf-8?B?Tmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: palmerwirelessmedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR15MB6008.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2efe55ff-ebaf-43ae-12a3-08dda82f7746
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 14:59:57.3852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 18187d5c-662c-4549-a9f0-3065d494b8dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 RBnOq0N0CftRuFCZd7clr3HMPOgk8uo8C0RzpSccuudA07P59WmPRFiWEGfV6WzAklomM4DrTzHn3Zs8wRHCQa0KleDjxrngB46u4vEFsIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR15MB3856
Message-ID-Hash: XUKYUFPV4JFNVLB23PQN2YBV7PECLWL6
X-Message-ID-Hash: XUKYUFPV4JFNVLB23PQN2YBV7PECLWL6
X-MailFrom: steve@palmerwirelessmedtech.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4IE3MW4JRV3KSFVXR5GIRRG2X2X4K4TA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

VGhhbmtzIGZvciB0aGUgZGlyZWN0aW9uLg0KDQpDYW4geW91IHN1Z2dlc3QgYSByZXNvdXJjZSBm
b3Igd3JpdGluZyBzdWNoIGEgZHJpdmVyPyBJIGNhbm5vdCBmaW5kIGFueXRoaW5nIHRoYXQgZGVz
Y3JpYmVzIHdoYXQgYSBkcml2ZXIgd291bGQgZG8gZXhhY3RseS4gSXMgdGhlcmUgYSB0ZW1wbGF0
ZSBvciBleGFtcGxlIHRoYXQgeW91IGNhbiBzdWdnZXN0IHRoYXQgSSB1c2UgYXMgYSBzdGFydGlu
ZyBwb2ludD8NCg0KLXN0ZXZlDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBM
YXJzLVBldGVyIENsYXVzZW4gPGxhcnNAbWV0YWZvby5kZT4gDQpTZW50OiBTYXR1cmRheSwgTWF5
IDMxLCAyMDI1IDExOjMzIFBNDQpUbzogU3RldmUgQnJvc2hhciA8c3RldmVAcGFsbWVyd2lyZWxl
c3NtZWR0ZWNoLmNvbT47IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZw0KU3ViamVjdDogUmU6
IFJlcXVlc3QgZm9yIGhlbHA6IEhvdyB0byB1cGdyYWRlIGEgc291bmQgZHJpdmVyIGZyb20ga2Vy
bmVsIDQuMTQgdG8gNi42DQoNCkhpLA0KDQpUaGlzIHNlZW1zIHRvIGJlIG9uZSBvZiB0aGUgY2Fz
ZXMgd2hlcmUgY2hhdGdwdCBkb2Vzbid0IGdldCBpdCBxdWl0ZSByaWdodCBhbmQganVzdCBtYWtl
cyBzdHVmZiB1cC4NCg0KR2VuZXJhbGx5IHlvdSBzdGlsbCBuZWVkIGEgc2ltcGxlIGRyaXZlciBm
b3IgeW91IGNvZGVjIHRoYXQgYXQgbGVhc3Qgc3BlY2lmaWVzIHdoaWNoIGZvcm1hdHMgYW5kIHJh
dGVzIGFyZSBzdXBwb3J0ZWQuIEJ1dCB0aGlzIGNhbiBiZSBhIHJlYWxseSBzaW1wbGUgZHJpdmVy
LCBkb2Vzbid0IGhhdmUgdG8gZG8gYW55dGhpbmcgb3RoZXIgdGhhbiByZWdpc3RlcmluZyB0aGUg
Y29kZWMuDQoNCk9uIDUvMzAvMjUgMTQ6NDcsIFN0ZXZlIEJyb3NoYXIgd3JvdGU6DQo+IFRoYW5r
cyBmb3IgdGhlIGhlbHAuIEkgbGVhcm5lZCB0aGF0IHRvIG91dHB1dCBJMlMgdG8gYSBzbGF2ZSBk
ZXZpY2UsIEkgDQo+IHNob3VsZG4ndCBuZWVkIGEgZGV2aWNlLXNwZWNpZmljIGRyaXZlcjsgdGhh
dCBidWlsdC1pbiBkcml2ZXJzIGFyZSBhbGwgDQo+IEkgbmVlZC4gSSB0aG91Z2h0IHRoYXQgd2Fz
IGdvaW5nIHRvIGJlIGVhc3kgdG8gc2V0dXAsIGJ1dCBJIGhhdmUgbm8gDQo+IGx1Y2sgd2l0aCBp
dC4gVGhlIGJvb3QgbG9nIGNvbnRhaW5zOiBwbGF0Zm9ybSBzb3VuZC1hdWRpdG9uOiBkZWZlcnJl
ZCANCj4gcHJvYmUgcGVuZGluZw0KPg0KPiBJIGhhdmUgYmVlbiB3b3JraW5nIHdpdGggY2hhdGdw
dCBleHRlbnNpdmVseSBhcyBpdCBzZWVtcyB5b3UgZG8gdG9vLiBJdCBoYXMgYSBkZWVwIHVuZGVy
c3RhbmRpbmcgb2YgdGhlIGxpbnV4IGtlcm5lbCBjb2RlYmFzZS4gQnV0LCBzbyBmYXIgSSBjYW5u
b3QgZ2V0IHRoZSBkZXZpY2UgdG8gaW5pdGlhbGl6ZSAocHJvYmUpLiBEbyB5b3UgYWdyZWUgdGhh
dCBJIHNob3VsZCBiZSBhYmxlIHRvIGF2b2lkIHRoZSB1c2Ugb2YgYSBkZXZpY2Utc3BlY2lmaWMg
ZHJpdmVyPyBEbyB5b3Ugc2VlIGFueSBpc3N1ZXMgaW4gdGhlIGRldmljZSB0cmVlIGJlbG93Pw0K
Pg0KPiBIZXJlJ3MgdGhlIGRldmljZSB0cmVlIHNldHVwOg0KPg0KPiAmc2FpMiB7DQo+IAkjc291
bmQtZGFpLWNlbGxzID0gPDA+Ow0KPiAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gCXBp
bmN0cmwtMCA9IDwmcGluY3RybF9zYWkyPjsNCj4gCWFzc2lnbmVkLWNsb2NrcyA9IDwmY2xrIElN
WDhNTl9DTEtfU0FJMj47DQo+IAlhc3NpZ25lZC1jbG9jay1wYXJlbnRzID0gPCZjbGsgSU1YOE1O
X0FVRElPX1BMTDFfT1VUPjsNCj4gCWFzc2lnbmVkLWNsb2NrLXJhdGVzID0gPDI0NTc2MDAwPjsN
Cj4gCWZzbCxzYWktbWNsay1kaXJlY3Rpb24tb3V0cHV0Ow0KPiAJc3RhdHVzID0gIm9rYXkiOw0K
PiB9Ow0KPg0KPiAJcGluY3RybF9zYWkyOiBzYWkyZ3JwIHsNCj4gCQlmc2wscGlucyA9IDwNCj4g
CQkJTVg4TU5fSU9NVVhDX1NBSTJfVFhDX1NBSTJfVFhfQkNMSyAgICAgIDB4ZDYNCj4gCQkJTVg4
TU5fSU9NVVhDX1NBSTJfVFhGU19TQUkyX1RYX1NZTkMgICAgIDB4ZDYNCj4gCQkJTVg4TU5fSU9N
VVhDX1NBSTJfVFhEMF9TQUkyX1RYX0RBVEEwICAgIDB4ZDYNCj4gCQkJLy9NWDhNTl9JT01VWENf
U0FJMl9SWEQwX1NBSTJfUlhfREFUQTAgICAgMHhkNg0KPiAJCQlNWDhNTl9JT01VWENfU0FJMl9N
Q0xLX1NBSTJfTUNMSyAgICAweGQ2DQo+IAkJPjsNCj4gCX07DQo+DQo+DQo+IAkvLyBDb21wdG9u
IGF1ZGlvIG91dHB1dCBkb2VzIG5vdCByZXF1aXJlIGEgZGV2aWNlLXNwZWNpZmljIGNvZGVjOyB0
aGUgYnVpbHQtaW4sIGR1bW15IGRyaXZlciBpcyBzdWZmaWNpZW50DQo+IAljb2RlY19hdWRpdG9u
OiBjb2RlYy1zbmQtZG9jLWR1bW15IHsNCj4gCQljb21wYXRpYmxlID0gImxpbnV4LHNuZC1zb2Mt
ZHVtbXkiOw0KPiAJIAkjc291bmQtZGFpLWNlbGxzID0gPDA+Ow0KPiAJfTsNCj4NCj4gCS8vIGF1
ZGlvIG91dHB1dCBmb3IgQ29tcHRvbiBjYW4gYmUgYWNjb21wbGlzaGVkIHZpYSB0aGUgYnVpbHQt
aW4gc2ltcGxlLWF1ZGlvLWNhcmQgZHJpdmVyDQo+IAkvLyBzaW5jZSBvbmx5IG5lZWQgdG8gc3Ry
ZWFtIEkyUzsgZGV2aWNlIChBREFVMTQ2NykgZG9lcyBub3QgcmVxdWlyZSBzZXR1cC9jb250cm9s
DQo+IAlzb3VuZC1hdWRpdG9uIHsNCj4gCQkvLyBzcGVjaWZ5IHRoZSBidWlsdC1pbiBzaW1wbGUg
c291bmQgY2FyZCBkcml2ZXINCj4gCQljb21wYXRpYmxlID0gInNpbXBsZS1hdWRpby1jYXJkIjsN
Cj4gCQkNCj4gCQkvLyBkZXNjcmlwdGlvbiB0aGF0IHNob3dzIGluIHVzZXJsYW5kOyBpLmUuIHZp
YSAnYXBsYXkgLWwnDQo+IAkJLy8gYXVkaXRvbjogYSBxdWFudHVtIG9mIHNvdW5kIDspDQo+IAkJ
c2ltcGxlLWF1ZGlvLWNhcmQsbmFtZSA9ICJhdWRpdG9uIjsNCj4gCQkNCj4gCQkvLyBzcGVjaWZ5
IHN0cmVhbSBmb3JtYXQNCj4gCQkvLyBzdXBwb3J0ZWQgb3B0aW9uczogaTJzLCByaWdodF9qLCBs
ZWZ0X2osIGRzcF9hLCBkc3BfYiwgYWM5NywgcGRtLCBtc2IsIGxzYg0KPiAJCS8vc2ltcGxlLWF1
ZGlvLWNhcmQsZm9ybWF0ID0gImkycyI7IC8vIHdpdGggaTJzLCBib290IGxvZyBzaG93czogZGVm
ZXJyZWQgcHJvYmUgcGVuZGluZyBhbmQgbm8gZGV2aWNlIGlzIHNldHVwDQo+IAkJc2ltcGxlLWF1
ZGlvLWNhcmQsZm9ybWF0ID0gImRzcF9hIjsNCj4gCQkNCj4gCQkvLyBhc3NpZ24gQ1BVIGFzIG1h
c3RlciBmb3IgYml0LWNsb2NrDQo+IAkJc2ltcGxlLWF1ZGlvLWNhcmQsYml0Y2xvY2stbWFzdGVy
ID0gPCZjcHVfbGlua19hdWRpdG9uPjsNCj4gCQkNCj4gCQkvLyBhc3NpZ24gQ1BVIGFzIG1hc3Rl
ciBmb3IgZnJhbWUtY2xvY2sNCj4gCQlzaW1wbGUtYXVkaW8tY2FyZCxmcmFtZS1tYXN0ZXIgPSA8
JmNwdV9saW5rX2F1ZGl0b24+Ow0KPg0KPiAJCXN0YXR1cyA9ICJva2F5IjsNCj4NCj4gCQljcHVf
bGlua19hdWRpdG9uOiBzaW1wbGUtYXVkaW8tY2FyZCxjcHUgew0KPiAJCQlzb3VuZC1kYWkgPSA8
JnNhaTI+Ow0KPiAJCQlkYWktdGRtLXNsb3QtbnVtID0gPDI+OyAvLyAyPT5zdGVyZW8NCj4gCQkJ
ZGFpLXRkbS1zbG90LXdpZHRoID0gPDMyPjsgLy8gYml0cyBwZXIgc2xvdA0KPiAJCX07DQo+DQo+
IAkJc2ltcGxlLWF1ZGlvLWNhcmQsY29kZWMgew0KPiAJCQlzb3VuZC1kYWkgPSA8JmNvZGVjX2F1
ZGl0b24+Ow0KPiAJCX07DQo+IAl9Ow0KPg0KPiBUaGFua3MgaW4gYWR2YW5jZS4NCj4NCj4gU3Rl
dmUgQnJvc2hhcg0KPiBQYWxtZXIgV2lyZWxlc3MgTWVkdGVjaA0KDQoNCg==
