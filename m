Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8451656C80A
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Jul 2022 10:30:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D03BE1E0;
	Sat,  9 Jul 2022 10:30:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D03BE1E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657355452;
	bh=eA1UPXTvwOsHLW5qZ+8WD7KSo6SLB8MtGHcQHBmdi5w=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fpapHwOBJRE/EUO99iNidwSl1rIGEd3nYS4N5kxMFHUCtcFqr6edUAMkZzUF7YSsH
	 ryrcC+d4RJooxnlWBrspVlmoG8O3hqrUfP40b+dOgpMu/RDXff81+wUDHNjEevQ8Nu
	 u5+AAxQOcAY1W7+Z3e7dam9BksAwSGCzS5XbrJVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D8CAF80245;
	Sat,  9 Jul 2022 10:29:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76E05F8020D; Sat,  9 Jul 2022 10:29:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FC92F80158
 for <alsa-devel@alsa-project.org>; Sat,  9 Jul 2022 10:29:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FC92F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DwE1Dbxc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657355385; x=1688891385;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eA1UPXTvwOsHLW5qZ+8WD7KSo6SLB8MtGHcQHBmdi5w=;
 b=DwE1DbxcsvCYGDUcxztIsBoenrzU86+PFRVbqKM8X7Z+vIYQ3hkuy2RZ
 wDZNPvYfMRzZM0tS0SvWUvpHak7YCtEGhuaxXNUi6ihsdp1mJmabKL52U
 Z0vSxtLU/XhACn9pfD/5OWNe5DP6gwQPGq3fhStJh6rzV2aI8UqGl3rUv
 7LXe89NLu+N8qsql0XbbECs61TqIBAS7zjpNmGFI7m+Cli3E1t/UBETy8
 1AnyRbZznf+CHvfwVn3Dh0ouo6aJmi3F0kFR5BSpuA3DN7IxHb2+dXk6p
 tnSxqLOqon+jTUg4BaWvCfAxIPbmnUGuUvfkseeiqEZYKfkTdACEcUx+x g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="370728849"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; d="scan'208";a="370728849"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2022 01:29:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; d="scan'208";a="662013331"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga004.fm.intel.com with ESMTP; 09 Jul 2022 01:29:29 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sat, 9 Jul 2022 01:29:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sat, 9 Jul 2022 01:29:29 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sat, 9 Jul 2022 01:29:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecffHw+Jnz3k0GchOiyIifltGj8SsZByONkCW8syJQOMKCqVN3HleAXS9TXPCVXLkrKfLNbMfFMUNk+z0jFsR2AxngXg3TZzDK2XisPr5C7trvHlfbT9VqYA+B2q7T6E7aESOwHuz9OwdrBhqZoNkZth0aAAiY/FRGp5KTd3FHovYm/FbhouDDXC8eSpLrCAJ73C1sQc3+WNqggjp7aMt3S1Mye4M93bh9UCXgoSFNA1MrqzW2evnJT69eG0rUBVVojoL7VZdn/UQgcWyO/NiSrGp8WMsUmTu50ANTvXCx8SqsBrzcjqOU3bxyKs8MnQJQTcIpoOeCZZxm2h2ZqwCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8n1EcTt6idp2//z2aeF8kh8dt1tkkN1UqF+GIl96BWA=;
 b=hk2kzD8+jJkiyimj5/n2zzIDG0xxjGeWS0mQZ8aLw2uQr2SxMVkwlgGZzQTcFiJOOgI0Do5dgP32YlZEksHgys3z8fUwvWMYFXozL262+9D4WpvrvW9eMEaT+9skWzakCsG/6gZK1N7uiZfkaOWHBwJU4FtRfJSSbmWekZxjeNMo4qi+Hy2d7hBN9gZoUPJbxSqXj874hlGpFimoQnyMY/xKGgGD8adfVi8Gg+cQp/igFAA9D3Ax4hHOHKmMFB9xtf1lf1KELEJ8ui/McQ9zLX70qlKXwvHH6uITQG7/zrHuyTGANX1HGWLgfwJW9eTDqyK+rCO0uqCvCLUE0NSGtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 MN2PR11MB4078.namprd11.prod.outlook.com (2603:10b6:208:150::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Sat, 9 Jul
 2022 08:29:27 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8b5:ae20:1c12:421b]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8b5:ae20:1c12:421b%7]) with mapi id 15.20.5417.020; Sat, 9 Jul 2022
 08:29:27 +0000
Message-ID: <bea65122-f9b9-e9f5-745d-246fbf2ffe30@intel.com>
Date: Sat, 9 Jul 2022 10:29:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 06/12] ASoC: Intel: avs: Block IPC channel on suspend
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220707124153.1858249-1-cezary.rojewski@intel.com>
 <20220707124153.1858249-7-cezary.rojewski@intel.com>
 <YshpLSb+MltY+6eq@sirena.org.uk>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <YshpLSb+MltY+6eq@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P251CA0010.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:50f::20) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 436467df-7986-4689-2559-08da618522d2
X-MS-TrafficTypeDiagnostic: MN2PR11MB4078:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hrDQwerlbl5vVa9/plQoZoSAoyzKrfDKfdUDmSzc8UUbF+HRVpPUiFzf1uEpZy6RB1Z+0TXazxQyPueLzByhyTSGjX/Q+PU2cx9FQwmn8wTVwh7yy0a7hB7I8Px2sPULXgnGqulBAyC6zBIwZk35NHB2nTWahNqQ0Pw6+dlFllQ57zXLIUKEg4a6mtwl3mrgVdAVFJ8hZNo4exuOBUL11uP+6LPGK/ScvBbnQOvBKF1otHz0OPmz3RD4f5dpSAeTzwv2QUeMgB+mQ7+4a5OMyjpyhmr9oAcvCGEHAOjNKs7r/u7c+s/4Ade3jjUUAA04VW+FdRTmLyFs6X9vjstvWU3dqzAkiTxiIRyAy1y2S1hw9/+a/yOk+3pfG9+W382m3kIzpkD/2PwudgGJtbeVSbIVegTwJIUDdfp9te2DOgxA6+ppE0tJOZgty98rvBJCKK13BUiLixXADBg7eWp5p4Qr8D9gpxcD0lAIh7CYQ6RoC9rcHHZ0BkXgiGUIXx0a4a5zD9I6LifZuUuqn1ftsYmmsIGvC6IkrucIxt4f1U7nVEkXTQ4xMv3XLM2aX7E4RU9oktH+ZZoLpb4i/ccOQCrbeVkPx/q8ovOHbOZkWCXFdcnH9AOxQ6qnA8/H9zZusbNTvXrTwo/qBOdli9T2etbkBOQBvYQmnRZZitOpW64yxD/649m1BktFqfwdWahBRR7jvPsi7iA0uo0zMSQZjjMGk/AOE9yGawfKsAspw9I6U7coFEaPpyw0+81P5xVRSSpBm1WorRubxZ3av5FKiLc4cAQkZQu4XJKbXRb6I5J90o8IP9KqtKlQhjp0FgIlWd657dNepOwFpMNQQus+oLBc2ej/cCjgE+Ioey3IynM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(346002)(396003)(39860400002)(136003)(366004)(31686004)(6506007)(2616005)(41300700001)(2906002)(186003)(44832011)(26005)(53546011)(66556008)(6666004)(83380400001)(82960400001)(6512007)(478600001)(4326008)(6916009)(38100700002)(4744005)(6486002)(8936002)(36756003)(66476007)(8676002)(5660300002)(31696002)(86362001)(316002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHl2NGRPcTFmOUpzNUdqOVF4YUoyMXFDUGVBUmtReTlNWk1jSW4rdTluY0g4?=
 =?utf-8?B?TWZTQkZFSlZacTRWczQwcnF0MUk5U21NdTlUYitHUS81dlIyYjJURTZVTllD?=
 =?utf-8?B?Mk5La290bG4vTWJZRWNLK1VxRjA1NmtmVTFkZ1c2cVpMWHBsbUtmcWJIVHZ5?=
 =?utf-8?B?WHYwVVAzRWNocjJ1dEhWeWt4cTA4WTBwbHRTYU9PMXVhSzlCQWNHcEUrbHlN?=
 =?utf-8?B?SmVpSlhaYVpoblBzOXY4cmg1ME44ci8rdmZraGRPUVdLeGxBWGsvMzZ2R0o4?=
 =?utf-8?B?K1c3NzYwVUROSXRUZGVmeEo3UFVpSHVabmhQSFNrYlJ4VWRlMTBGam02MkJz?=
 =?utf-8?B?UG10a2NmUk5zRzlDaE5pRi83ajlzZC9rMFNYOG94Y0ZDbmpOeXpaWWV4cC9N?=
 =?utf-8?B?bDg2N2FTL3ZLQXBWR2lidGI1VnhVWVRuMHNKSTdkbGsxc282cVZHY0NXTHFY?=
 =?utf-8?B?ekZWS0V1MWhFUHVtSHN0SmlCNjZ1eXNzc2ZKMnVKSEJTeUZhRmlhMno4bWI5?=
 =?utf-8?B?WjZvV2RzSkpNYU1SLzRDcXVmY3FuWldHcmVxcXBJSjVOOGJRdWJiV0NsbUVH?=
 =?utf-8?B?clJZd1dNWm1IVDJ2QnMwb1NqclZRUzVOZExBY0tUSWowVUpKMXMxUzY3T3ZD?=
 =?utf-8?B?TjFZUVJuWm01Nml0Rk5EM3VPUzBGbmF3Y3M3aUI4WFJHOTRwbUovWVI5VnFN?=
 =?utf-8?B?VWRKV3B5UmptRHoxNzRiQUlNYklCam5yaG9DbGhjTXF4aGhRM0FNWXExMCtI?=
 =?utf-8?B?eU1oNFNjek52TUNFa1QrNWlwYkN3WTRqdDJub1p0NDVvaTV5QmxIREc5cXow?=
 =?utf-8?B?S0RXZmRVTnp1UU9Id0ZMSjNHZmxIRFBPOVlJSXBxODVUdG5tUTlRUFJZN1lx?=
 =?utf-8?B?cUhGTkZkMEF3OVQ4Z20vZTgveDNoWUlyekVkVUpXOVRNT1hDR2Frb2E4TGNK?=
 =?utf-8?B?K2Q1cnVaaThxbFNobkFvYXB2dmo3K3cybDRSR01TR2pmcEY2MGhSNnNNRWM4?=
 =?utf-8?B?cG9DQ2JDU1daUGNGRXdvbHlzc1gyb0UzNzFIdTI4bUtNVTVmTGNVWXBSempz?=
 =?utf-8?B?Y2ZXcmFMYiszZlpGN1Ruc0E4Z1Q1MTJvN0Y4bGZlOHpkMFgyZnE0dHhKT1RG?=
 =?utf-8?B?MGlPekpyQXdyYUNUWDE3Nm12UGFhd3ZXOS9yc3dMdDgxZXg5NUpCTkN2Ky8x?=
 =?utf-8?B?WGNONFZWbERsbmJ0WFBXd1ZUcnZXdWdZd1lNczB0Z0xMbTlWNWpnWUdvdzVZ?=
 =?utf-8?B?OGxxVDVNUWcrUmpqdzlraTF4TThkTTdZYnVXMzk3OWU2RTVGeEVzVHR0NFBs?=
 =?utf-8?B?YjZFdW5RWEdrc0xrL2ZqUk5DaHZ5WERpaDN2MlJodlcwenlOa3g1YkgxaC9M?=
 =?utf-8?B?Ly9yc1NDbXdDYWh0WmNDOXF3b3NTbkZBVk5GMlFteUxMcEd3LzZFOUVjeDIr?=
 =?utf-8?B?VEZYWkxIaW03dW5GU3p0ME92MktJMVJQVjZoWnIwWTJ2Tk9Nb00vN1plM1JI?=
 =?utf-8?B?STUwZjZzbkZWY1pZRXhoOEYrMVU2a2pFcHlic1plSEhTT3ljNXlJYkZvck9T?=
 =?utf-8?B?SXE0SjYxQk1nOGFHdmZkVW11WnZKWEVNVUorNVQ1SjMvWDhYR2lab2tTNmVl?=
 =?utf-8?B?ditwWE9nV0dBUjVsM0ppaG9rdmE1RGFoaWpwM3pmWVBJKzBDR2NWYUx2VzZi?=
 =?utf-8?B?U3dlY3ZXWU1ETFNjSVRtZGhTSWhyVDdXcTAzZEJSR1dVNGpITzJ2K1hQMTlV?=
 =?utf-8?B?Zm5UMVU2ZWhFRHk3SWtCZ1kwZ21mN29SaXArUkhwUG5KZFNlMUpSSDBHamFK?=
 =?utf-8?B?Yjk1LzkvcjlVZGpNM3dDZmRtOXB1UkJ0ekRBVzFLaDNKTVlVR24veFhRTGlS?=
 =?utf-8?B?QUF6cklZaVFqWU1OY2FqeG9LN0hHdFA3aEpITGFrVDlmYXAydGE3N1VVY0tM?=
 =?utf-8?B?M2wwRS9DbnkwT1hWczBESldtaktCRU13WFJZckFjQVIrdU0xbk5vQko0aGl0?=
 =?utf-8?B?cENNRkJDT0dLeUF1R01VWEhSOEFKcThpb21nemFKRHY3Wkh0d1pGZ0xTVGxi?=
 =?utf-8?B?UDBiVlk0clZZKzRIRUg0WDh2YzROUEdkSkg2VjVXU1VnU2dOb3RkY00xcDV1?=
 =?utf-8?B?S0I5WVNTZGZJSm5NL1BIWHFUUUs3UGJNYUdPMkpWbTltZmtkNTlzTzhzK05p?=
 =?utf-8?B?eHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 436467df-7986-4689-2559-08da618522d2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2022 08:29:27.1119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3SkFKoeLJKvFu2staDS0Jf0mvWL4Dm0nsJnC5VTVzjAehd3OARHOLkNs5GgMZ12ea4NVIXqCMkjrvvCpcmfetIrzhtF2kyh3ofvvlaYrdfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4078
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2022-07-08 7:28 PM, Mark Brown wrote:
> On Thu, Jul 07, 2022 at 02:41:47PM +0200, Cezary Rojewski wrote:
> 
>>   		return AVS_IPC_RET(ret);
>>   	}
>>   
>> +	avs_ipc_block(adev->ipc);
>>   	avs_dsp_op(adev, int_control, false);
>>   	snd_hdac_ext_bus_ppcap_int_enable(bus, false);
> 
> The fact that there's no matching change to unblock is fine since
> there's already code the paths starting the DSP which does that.

True. While it may be questioned why this line wasn't here from the get 
go, in practice it was redundant - nothing was ever "asking" driver for 
anything while it was asleep.

One of the next series in line is debugfs-related one. We could either 
have every single file do PM manipulation on its own or allow for fileop 
to fail gracefully if the device was asleep. Lately we revisited the 
subject and decided to move away from the first option - not every 
fileop will be resuming the device.


Regards,
Czarek
