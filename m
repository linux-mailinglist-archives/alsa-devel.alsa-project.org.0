Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A28950B3E
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 19:12:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFFDD27AA;
	Tue, 13 Aug 2024 19:12:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFFDD27AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723569131;
	bh=p5t39OiYXTih2m+MDOXy7Vc30WChnFUOXQTXULe73po=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qJG/BwieDrmC6v3ajZW3J+ct+FDO+3yQkJU3iTYNSSThK2aahvRpEUueHzdUQO7H+
	 3xlRF8bZ221BpiSYoITGtYvgYNIFljFRSgGvzeXPqC1OKzGnoCDDXJuLA1g+07jGXk
	 BBRfzyAwTcHGF3JhdUAUFPZ6dmjm66ZhKWYsOnww=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDF56F805B4; Tue, 13 Aug 2024 19:11:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F33AF805AF;
	Tue, 13 Aug 2024 19:11:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA31BF80423; Tue, 13 Aug 2024 19:11:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15996F800BF
	for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2024 19:11:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15996F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=AcC5f3wb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rw+0UV+S0uaMlFFyXC0H3qj10WeVT5izYpAbb97sdIpkV0cgx44+PYm4eHAG2bEO/CkqMDa0kORT+WkNLs2TJXKEVMlCh3cY+udoOifbmkzX9lcJLjaPFN9Q/CiUvLQSJI8se8/7rAth1+qRf9GJ0tO6fjsovke6Pqfk1vCFirTaPHlNQEcKEmWVnrbZPg4uSpmfM68Qk8Rd6/sSouFQuoCjnOe2FcfpnsjJ9ghnu1AREcVM8R4UWyjs5+2dF9O49tWL+MB0RyKvVkRVdLQ4okoDJ7Yt8vTXGDLdr1vsfXMnt+SnXWjhgIu96vitYCA8mbfpla+PLbzKeT1DF4Z2dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5t39OiYXTih2m+MDOXy7Vc30WChnFUOXQTXULe73po=;
 b=K5HA+XAfTBsnS8CdpsIKBzZx4H2xzbGJ544RltYGx2i+WaW0HOAYdH8RQi5fOcIoRVUsWgmwO4WT/qsM1dmdz14kh2LPp82V7tCTXeO2Q0Q9HUPayHy/51ENJpLryV/STGX8XwX6bj7wCnVZQ/REIblmGF+ruuxHVc52IXhtd3bytth/C/XdATl08qiWd8C/pAnYcoY6KCapstETXh6uYWkqC8mR9oB+/qFONL0rVxz4pAhOOqQmfO30F6LQsw8OojDq+NHaygD3c+M8q3oB7CQXi6soBL8jLsD69aXCd5XiM89jXmKV59VY5mev0CIgtJK6cQwpUZWD7vhaRPJjng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5t39OiYXTih2m+MDOXy7Vc30WChnFUOXQTXULe73po=;
 b=AcC5f3wbXfsKeyT9kMSHHgw34uNaRx4hh9dw/d0rvJZfNJTVWdfU7tT2OcFUxz1+5PrjCg7RsMo4fFxtA5WA8tzTLQftS7y4RaCMZB/7VowWRiC6nxCBBeDdmeqQ+z8xoe+ASnAQlMwnWOHq46b0NxFLJq+M2ecmhUwXVqPicQ8xbPdopaxBqKfgxZFlTA2ISxMyax8RZp+xqDu79NJJc/mrSuvYhSiud3E/sVRwihkPgJraXbefQQuH9tdIQsve3CkRwHiVErQ0C2n0mOKPLdCBLbsilnTd0zsQi8wvE09f979N4y3LXJBBm6Cvsdw0DslhW03cZZ9qScPlEArlwA==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by PH7PR10MB7765.namprd10.prod.outlook.com (2603:10b6:510:308::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.16; Tue, 13 Aug
 2024 17:11:17 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::24d1:393a:f0ee:5c7f]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::24d1:393a:f0ee:5c7f%7]) with mapi id 15.20.7875.016; Tue, 13 Aug 2024
 17:11:17 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "pierre-louis.bossart@linux.intel.com"
	<pierre-louis.bossart@linux.intel.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "peter.ujfalusi@linux.intel.com"
	<peter.ujfalusi@linux.intel.com>, "amadeuszx.slawinski@linux.intel.com"
	<amadeuszx.slawinski@linux.intel.com>
CC: "perex@perex.cz" <perex@perex.cz>, "cezary.rojewski@intel.com"
	<cezary.rojewski@intel.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "tiwai@suse.com" <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [PATCH] ASoC: topology: Fix route memory corruption
Thread-Topic: [PATCH] ASoC: topology: Fix route memory corruption
Thread-Index: AQHa7aKy1QkthXgmgUKaNI8G30a7XrIlbFaA
Date: Tue, 13 Aug 2024 17:11:17 +0000
Message-ID: <e486fcb1a838a9bb254706141885f306a5865d20.camel@infinera.com>
References: <20240613090126.841189-1-amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240613090126.841189-1-amadeuszx.slawinski@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|PH7PR10MB7765:EE_
x-ms-office365-filtering-correlation-id: 44328a8c-b444-4659-dca6-08dcbbbaf1a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Y2ROd0c5QTVTZnRUNmJOTlVvS0NCblRUMngzNG1ZaGJ6eVF6N2VxY0JPOVkw?=
 =?utf-8?B?dGJSU2JDeXNnU1orOGdTWXY4OGhCQjhzOXZmZ3JpS2lqMXc4YTBjbzFvM3VN?=
 =?utf-8?B?SitVZ3YwcFdNbjY5RXNDQWN4VCszRXZsaE1kQmdEVE1pdzFSc0p1ODRwbVRS?=
 =?utf-8?B?b0plcnhQRHluMzBVUlQxTTVrTExXMEd0Z2szdXFrWHFZRm1tUjRSd29nZnBi?=
 =?utf-8?B?a1VtYXpHMTVJTFN1a2lCOWVpb0ZLakVwemhkNXVXeHVBWFI2VzJjVGkxd2RN?=
 =?utf-8?B?OHZoZUVjRjhrZHNtZ1ZJd3kwTDZEdmttNGt6ZkZCWC9oa2pObjBBVTI4Vjdm?=
 =?utf-8?B?SlBsSms4M1FBMWVQZ0kvNFVneXdnWVUvWFl5SE54ZzVmSzk1czM3R3NKdm5l?=
 =?utf-8?B?cTAyVUlhUXdDemNFT3FSL1BtVGhmdDRyZlhNNkRlQTVVa1JVdllnNWRoSGRz?=
 =?utf-8?B?bGNhdHlpejJnNk1lZzM1RzFuNUpnVlNBMmtSdEUvQW5uSXpxdlRtSDJjcHg5?=
 =?utf-8?B?QmxhZnhaVVkrckdVbnhJRm1yZFJCTnVLY0xsQ3N5WThQUWVXeWZBV1VsNFgr?=
 =?utf-8?B?cTMxQ2RoQnBRb0VHa3BsK3lDYWJBRWs0bnI4QTZKTWd5VDJ1WnBjdHFqelhK?=
 =?utf-8?B?Nm90SFcwR3FFTDJZalRtbWJnSVczYjQveEFJRzJkMUIvTU1TVWNJV1p1djhD?=
 =?utf-8?B?L09qSFVLS0U4emJPbUo5VHFLaUV1RjRPamxBcXYyZWxFeDVhZm9LdHZNMUZ2?=
 =?utf-8?B?V3JUbEtneG43ZENvQnhKL01ReEZuQmFldUhRVXUyVjAyMFpteXBrUzZCVUto?=
 =?utf-8?B?Sk04b2h6RTBhMmU3L0g1Y1pBRlBqd3c0WG9TTnlDTjV2MnBRckpreGVubkxh?=
 =?utf-8?B?cSsrNWVwR280OXJqLyswNjJKVld1VGdVTVJvTlM2WkxKYllKOHlnUkwxUWpY?=
 =?utf-8?B?RGxibXEvNUMrODRQejdZVUIxaDBqcFFRVm1CZVJaV2hUaHFJK2xqZGdaQjVh?=
 =?utf-8?B?MDVOdFV3R3h0N0ZycXh6bEJWUWlwUDRHTGc0WjdTcWlZYjNraEV6NTFJRkh2?=
 =?utf-8?B?b3IxU2VBbFhFdWtkcUxPQzJFSU9VeVMvZUdKdUxmdHh2YS90VG5IUjB3cFMy?=
 =?utf-8?B?amFXeWVKU2hVTW9FcitZRTFsOEs2Nm5yMlYvWWpsSjNmY2R2dHRCS0lwTnp3?=
 =?utf-8?B?azBsUUU4S2d1ZHFsVXp0a1Y5VEZlMXlTdG5BZ2xycDVLWm5hUmdSYS8zZ2lo?=
 =?utf-8?B?a3Rldjc0OEcyUlZiRlZoZ0l4ME9hK3gvS2JJbFIySXU1YUJqWGFsM3orb09X?=
 =?utf-8?B?MTlkVUNESnZXVmtkV2dUSWluVVE5TnZXdTNLRWNEWGxHb2I3VHVZem9hT2Z4?=
 =?utf-8?B?Z1YreEZGWFY2TC9kcTdwOTMzckxlek9pbEJkSUs5eXlTeU5IdldFM3FhdFlm?=
 =?utf-8?B?NjlrN2FoSjQvQTVkNkpqYUF3QldCZmdLUWVRSEUwLy92MFNFYlRZdkNCYXN4?=
 =?utf-8?B?Q2cxOUtlR2M5QlJ0Mk9lVTBBOXZKUU5YQk5vT2xkQU5KelVRMzZSS3N6R2I2?=
 =?utf-8?B?RkZlb21FY2x5ZWlqdmkxNVlnK3VBNFVHWFl1UmV5ejcxU1h3NGZmSDFXOGlh?=
 =?utf-8?B?SFNJa2wxc0xHMnhFaVBTL2tZMjE5WUF2S3Q3RjNBd1dQNCtzeFp3cWV4bmVK?=
 =?utf-8?B?UklvbElETlZ3eTVEbnB6dTd2SHArTXc5cjZTNG1FTFJHTnZCRGh5ZUhKUGhZ?=
 =?utf-8?B?K1lMZUhLbEdtbGk0QTN5ejlRbG5jR0d5cWZJN1B2L09BWFZyR1d4U3hwS2sr?=
 =?utf-8?Q?s1foGmtS7fRpZLa3lbkOBA1fLf9o6d4fYN7XY=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TlJjU0prbHlVZGNtM1NIYVZXMjVlcTAzUkM5cUZhYUo1QVAwcmFaM0J2c21W?=
 =?utf-8?B?QS94ZENLY2g2V1ljT3hxM1pnUW12SGdPalArbVp6V1poVlBFa0xFaXNQampn?=
 =?utf-8?B?Q1QydlRzeXoxSFBtUHhxK2dDZTR1cTBHcEJtSDNwMlpvdUtCVForWDZsNThh?=
 =?utf-8?B?a3ZBdlRwZURJV0dLYjE2bTFwYWYxb0hYUUZiSmt0UDkycG50Sm5Jb2EvbGVl?=
 =?utf-8?B?OTBSRTBTRUlEYUpwNVhtcERRK2dwalRmWnk5OCt3ZFN6bkZueStCcGUzU3ZK?=
 =?utf-8?B?N0pMWnEyVTdpSXFSbDFTZjZzcE5IN29ISGM2NkExWFBxUElhSERKSUJUK3Iw?=
 =?utf-8?B?bjhZTEg2RVhHWFUxTm5salpmMG0xeEhPOWhBdlhUaDltNzVWWnFtV3pIZThj?=
 =?utf-8?B?dVIzTDlRSmNzb0l3TjFtMS85YWRWb0V1LzJZU3c5N1dqblNtM05oNHJFb20w?=
 =?utf-8?B?SVpSOEoxM0tPOWZ6alZLVnZiYWhRUlFNM2hwMHNxL0VLSHQ3d3ZjYzlBRG15?=
 =?utf-8?B?UXdHcWhXVTR1MlQ1aHRFM1dRVlJ2b2RkMTU2WEVud0Nlc2NvajlKYitoWWNH?=
 =?utf-8?B?dnEyUGI2N3oxajViTVZJUVFQMjc4T05adzR1bnordE1YbE02OFlSbmhrR2gw?=
 =?utf-8?B?eXFZakYrd2ZsdlRwNExEOUw3RnBUamtVcFVKR0hHQzdEYkJORTF3SFZKS0t1?=
 =?utf-8?B?Q253ZHBKK2x4aTNuSDBYbG9LNEZKTDJPUVVEejZNMmMrdFVwa25wQ2ZXeTBD?=
 =?utf-8?B?WFFxZGFtQnhVRUdMR0Z2UkxEQXVrdStMVlFXNExtd3VUTUcxckdhdldRdDVF?=
 =?utf-8?B?ejlJQTJBUG1DT0M0dWI0SDlrQnQ4ZHQyVGZNTXNudVJ2SktQdjBFVGRGa21N?=
 =?utf-8?B?aW01eXY0SFJkNkZ0VDR4dDdPMFZwU3VrSUZ0QzNXdWtWOHkvTEN0clloWWVZ?=
 =?utf-8?B?eE1kbjJsRCtaTXhtcnhtNExQbzBXMXE2T0doYU9UZlIzNGZ4SUJlUFVOOE5H?=
 =?utf-8?B?Y2VZL2RBZ2ZvdmpVVG5uU3laKzRLU3JRN01ZQlE1b3NNd21Ic3FLaFlIQWox?=
 =?utf-8?B?MGQ1UGFycDRWS3hBSnczUUhTczRCZFVxRlVBUjM3U2JrQzJBVVREWWJiUDVy?=
 =?utf-8?B?amVZQitOcmpYczcrVWRieGloOXZzWFJFWXQ2VU93d0EzQmhPalo0UmlOSnpr?=
 =?utf-8?B?eDg3YWZTczR5Q0tEakdCZ2JJNWdsSFd2cjhxT1JzRHphRHpsNUVSYWxla3Yz?=
 =?utf-8?B?RksrcFNzdk5aNVRqZ0RKTjN5Y3k3OHhVWGlXMFlYbkhaNUMwR0N6L0hpU09F?=
 =?utf-8?B?WlBPRlErWGpkQzNWaWhkeVp2Z2ZmZHNvUjFsT0xNYXpOaGR0cTlxVWZYWWEy?=
 =?utf-8?B?eGNYK2xIR0JHRmtONTNoaUE0bStmeTJISzRoVWpCa3dKWmVOZUtiOTVBY2N0?=
 =?utf-8?B?Qmo2REwzcHlJbzAvQTArWGZ0QzEyVUsvZ1JNTGEzT01BQWY2Mnh6NzdOeHo0?=
 =?utf-8?B?dkU0Mm93cHNld1dKM2w3dUFVU2dSYTk1bFhFLzRveVhnL3NkU3Y2by9YT1hh?=
 =?utf-8?B?blNGMGZnVlk0WGYzdEhhMFpuRXJPVzliUmRENVdLSFRwWjZtVm9pYllRbUZn?=
 =?utf-8?B?YXB2Y0theEhKSmljQUlqNG54NnJSRkhKUzg0VllDUTdpWFhPN2lRdnBuSWtl?=
 =?utf-8?B?VERzQ3RqdkFXQXl1UG4zRGxSUjh3NXBqTjlWNFpuVzlycU9hNEdKRk9DSUtD?=
 =?utf-8?B?MnQ5ZnNpTzE5YWxIV1hwTHE5VWxTd1RQb05hR0RhRmtIQ0tUUTMyNU5INDFx?=
 =?utf-8?B?V1d0UThITlR5bTgxejFUaXI4SWFFZ0REci84T2RGSHlHYUk4YmZwZUZDQlJ2?=
 =?utf-8?B?a0NhblhSSWo0YmlIbGo3ZjI0YjZLN3N2UXc3VC92SHJ1a1ZpNkF5azZmSWhN?=
 =?utf-8?B?WFM4K1ZEVm9BdVFwL3l5NWJuL1BGNjZmdzJiMko1TlJZMjBXM0doUlp2SnBX?=
 =?utf-8?B?d05WNFNrV3JSMkJqNTQvd09sN0RxWTYybDdXNS9oeUV0VTVya0hETU8yUlFj?=
 =?utf-8?B?S25lbmY1eW13ZHE2YjJlRDJ4Vjh6bWNvL1VlM2Y3dUJSNFVNNDhEVEdMK1Ja?=
 =?utf-8?Q?pdt+/4Zha4nfUTVIUsHI8c/YR?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4AE039B01A3F749847FD5CF81AA1B32@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 44328a8c-b444-4659-dca6-08dcbbbaf1a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 17:11:17.1903
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 kI96gIdeELviT/9xE+VdnWAIkRDu/4v8U45BSd5h6+gIXVJ5ydLPAyq9I+wignNKg+LWgYT5LKq7vFgS46H9uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7765
Message-ID-Hash: H45IENSYOOBM7WG4KN7OAGOFINIIC42X
X-Message-ID-Hash: H45IENSYOOBM7WG4KN7OAGOFINIIC42X
X-MailFrom: Joakim.Tjernlund@infinera.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H45IENSYOOBM7WG4KN7OAGOFINIIC42X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gVGh1LCAyMDI0LTA2LTEzIGF0IDExOjAxICswMjAwLCBBbWFkZXVzeiBTxYJhd2nFhHNraSB3
cm90ZToNCj4gSXQgd2FzIHJlcG9ydGVkIHRoYXQgcmVjZW50IGZpeCBmb3IgbWVtb3J5IGNvcnJ1
cHRpb24gZHVyaW5nIHRvcG9sb2d5DQo+IGxvYWQsIGNhdXNlcyBjb3JydXB0aW9uIGluIG90aGVy
IGNhc2VzLiBJbnN0ZWFkIG9mIGJlaW5nIG92ZXJlYWdlciB3aXRoDQo+IGNoZWNraW5nIHRvcG9s
b2d5LCBhc3N1bWUgdGhhdCBpdCBpcyBwcm9wZXJseSBmb3JtYXR0ZWQgYW5kIGp1c3QNCj4gZHVw
bGljYXRlIHN0cmluZ3MuDQo+IA0KPiBSZXBvcnRlZC1ieTogUGllcnJlLUxvdWlzIEJvc3NhcnQg
PHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4NCj4gQ2xvc2VzOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1zb3VuZC8xNzE4MTIyMzY0NTAuMjAxMzU5LjMwMTkyMTA5
MTUxMDU0Mjg0NDcuYjQtdHlAa2VybmVsLm9yZy9ULyNtOGM0YmQ1YWJmNDUzOTYwZmRlNmY4MjZj
NGI3Zjg0ODgxZGE2M2U5ZA0KPiBTdWdnZXN0ZWQtYnk6IFDDqXRlciBVamZhbHVzaSA8cGV0ZXIu
dWpmYWx1c2lAbGludXguaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbWFkZXVzeiBTxYJh
d2nFhHNraSA8YW1hZGV1c3p4LnNsYXdpbnNraUBsaW51eC5pbnRlbC5jb20+DQo+IC0tLQ0KPiAg
c291bmQvc29jL3NvYy10b3BvbG9neS5jIHwgMTIgKysrLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L3NvdW5kL3NvYy9zb2MtdG9wb2xvZ3kuYyBiL3NvdW5kL3NvYy9zb2MtdG9wb2xvZ3kuYw0KPiBp
bmRleCAwMjI1YmM1ZmM0MjVhLi40YjE2NjI5NDYwMmZhIDEwMDY0NA0KPiAtLS0gYS9zb3VuZC9z
b2Mvc29jLXRvcG9sb2d5LmMNCj4gKysrIGIvc291bmQvc29jL3NvYy10b3BvbG9neS5jDQo+IEBA
IC0xMDUyLDIxICsxMDUyLDE1IEBAIHN0YXRpYyBpbnQgc29jX3RwbGdfZGFwbV9ncmFwaF9lbGVt
c19sb2FkKHN0cnVjdCBzb2NfdHBsZyAqdHBsZywNCj4gIAkJCWJyZWFrOw0KPiAgCQl9DQo+ICAN
Cj4gLQkJcm91dGUtPnNvdXJjZSA9IGRldm1fa21lbWR1cCh0cGxnLT5kZXYsIGVsZW0tPnNvdXJj
ZSwNCj4gLQkJCQkJICAgICBtaW4oc3RybGVuKGVsZW0tPnNvdXJjZSksIG1heGxlbiksDQo+IC0J
CQkJCSAgICAgR0ZQX0tFUk5FTCk7DQo+IC0JCXJvdXRlLT5zaW5rID0gZGV2bV9rbWVtZHVwKHRw
bGctPmRldiwgZWxlbS0+c2luaywNCj4gLQkJCQkJICAgbWluKHN0cmxlbihlbGVtLT5zaW5rKSwg
bWF4bGVuKSwNCj4gLQkJCQkJICAgR0ZQX0tFUk5FTCk7DQo+ICsJCXJvdXRlLT5zb3VyY2UgPSBk
ZXZtX2tzdHJkdXAodHBsZy0+ZGV2LCBlbGVtLT5zb3VyY2UsIEdGUF9LRVJORUwpOw0KPiArCQly
b3V0ZS0+c2luayA9IGRldm1fa3N0cmR1cCh0cGxnLT5kZXYsIGVsZW0tPnNpbmssIEdGUF9LRVJO
RUwpOw0KPiAgCQlpZiAoIXJvdXRlLT5zb3VyY2UgfHwgIXJvdXRlLT5zaW5rKSB7DQo+ICAJCQly
ZXQgPSAtRU5PTUVNOw0KPiAgCQkJYnJlYWs7DQo+ICAJCX0NCj4gIA0KPiAgCQlpZiAoc3Rybmxl
bihlbGVtLT5jb250cm9sLCBtYXhsZW4pICE9IDApIHsNCj4gLQkJCXJvdXRlLT5jb250cm9sID0g
ZGV2bV9rbWVtZHVwKHRwbGctPmRldiwgZWxlbS0+Y29udHJvbCwNCj4gLQkJCQkJCSAgICAgIG1p
bihzdHJsZW4oZWxlbS0+Y29udHJvbCksIG1heGxlbiksDQo+IC0JCQkJCQkgICAgICBHRlBfS0VS
TkVMKTsNCj4gKwkJCXJvdXRlLT5jb250cm9sID0gZGV2bV9rc3RyZHVwKHRwbGctPmRldiwgZWxl
bS0+Y29udHJvbCwgR0ZQX0tFUk5FTCk7DQo+ICAJCQlpZiAoIXJvdXRlLT5jb250cm9sKSB7DQo+
ICAJCQkJcmV0ID0gLUVOT01FTTsNCj4gIAkJCQlicmVhazsNCg0KSSBhbSBnZXR0aW5nIHZlcnkg
c2ltaWxhciBjb3JydXB0aW9uL1NPRiBlcnJvcnMgaW4gNi42LjQ1IGJ1dCB0aGVyZSBpcyBubyBz
aW1pbGFyDQpmaXggaW4gNi42LnggdGhhdCBJIGNhbiBzZWUuIEhhbmQgaGFja2VkIHRoaXMgcGF0
Y2ggYW5kIG5vdyB0aGUgZXJyb3JzIGFyZSBnb25lOg0KDQotLS0gLi9zb3VuZC9zb2Mvc29jLXRv
cG9sb2d5LmMub3JnCTIwMjQtMDgtMTMgMTc6NTg6NDkuODM3Mjk1NDg0ICswMjAwDQorKysgLi9z
b3VuZC9zb2Mvc29jLXRvcG9sb2d5LmMJMjAyNC0wOC0xMyAxODoyMDo0NC41NjQxMDcwMjQgKzAy
MDANCkBAIC0xMDYwLDIzICsxMDYwLDE1IEBADQogCQkJYnJlYWs7DQogCQl9DQogDQotCQlyb3V0
ZS0+c291cmNlID0gZGV2bV9rbWVtZHVwKHRwbGctPmRldiwgZWxlbS0+c291cmNlLA0KLQkJCQkJ
ICAgICBtaW4oc3RybGVuKGVsZW0tPnNvdXJjZSksDQotCQkJCQkJIFNORFJWX0NUTF9FTEVNX0lE
X05BTUVfTUFYTEVOKSwNCi0JCQkJCSAgICAgR0ZQX0tFUk5FTCk7DQotCQlyb3V0ZS0+c2luayA9
IGRldm1fa21lbWR1cCh0cGxnLT5kZXYsIGVsZW0tPnNpbmssDQotCQkJCQkgICBtaW4oc3RybGVu
KGVsZW0tPnNpbmspLCBTTkRSVl9DVExfRUxFTV9JRF9OQU1FX01BWExFTiksDQotCQkJCQkgICBH
RlBfS0VSTkVMKTsNCisJCXJvdXRlLT5zb3VyY2UgPSBkZXZtX2tzdHJkdXAodHBsZy0+ZGV2LCBl
bGVtLT5zb3VyY2UsIEdGUF9LRVJORUwpOw0KKwkJcm91dGUtPnNpbmsgPSBkZXZtX2tzdHJkdXAo
dHBsZy0+ZGV2LCBlbGVtLT5zaW5rLCBHRlBfS0VSTkVMKTsNCiAJCWlmICghcm91dGUtPnNvdXJj
ZSB8fCAhcm91dGUtPnNpbmspIHsNCiAJCQlyZXQgPSAtRU5PTUVNOw0KIAkJCWJyZWFrOw0KIAkJ
fQ0KIA0KIAkJaWYgKHN0cm5sZW4oZWxlbS0+Y29udHJvbCwgU05EUlZfQ1RMX0VMRU1fSURfTkFN
RV9NQVhMRU4pICE9IDApIHsNCi0JCQlyb3V0ZS0+Y29udHJvbCA9IGRldm1fa21lbWR1cCh0cGxn
LT5kZXYsIGVsZW0tPmNvbnRyb2wsDQotCQkJCQkJICAgICAgbWluKHN0cmxlbihlbGVtLT5jb250
cm9sKSwNCi0JCQkJCQkJICBTTkRSVl9DVExfRUxFTV9JRF9OQU1FX01BWExFTiksDQotCQkJCQkJ
ICAgICAgR0ZQX0tFUk5FTCk7DQorCQkJcm91dGUtPmNvbnRyb2wgPSBkZXZtX2tzdHJkdXAodHBs
Zy0+ZGV2LCBlbGVtLT5jb250cm9sLCBHRlBfS0VSTkVMKTsNCiAJCQlpZiAoIXJvdXRlLT5jb250
cm9sKSB7DQogCQkJCXJldCA9IC1FTk9NRU07DQogCQkJCWJyZWFrOw0KDQogICAgIA0KSnVzdCBs
dWNrPw0KDQogSm9ja2UNCg==
