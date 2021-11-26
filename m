Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 834CA45EF72
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 14:50:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10AF6192A;
	Fri, 26 Nov 2021 14:49:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10AF6192A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637934623;
	bh=GxTcrIqGeGlA0XTgRw8P+kj5puqeLB8QtYDyMo4ZHfM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QBG5fTrE64hAEkB1LVhATTMhUQw0j28NOvAkHKFXaQatIvCraJNrvjAo2kTMY8Cf2
	 9Mug47bt/6DCZwCWE7iD+RzqoO+tRhVJvughq56FhxaTnQqzS1FXXoXjWX25nhUkY7
	 0Qw5dU3j6KIJpUCs/mQiHqdvf2BeaZc6p1IbMXz0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88132F80245;
	Fri, 26 Nov 2021 14:49:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EB42F80132; Fri, 26 Nov 2021 14:49:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 767E5F80132
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 14:48:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 767E5F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="NJdb/mYp"
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="234398150"
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; d="scan'208";a="234398150"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2021 05:48:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; d="scan'208";a="555270486"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 26 Nov 2021 05:48:49 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 26 Nov 2021 05:48:49 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 26 Nov 2021 05:48:49 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 26 Nov 2021 05:48:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaIAEldoUsWHuPm6JbfY75FKdxEa9el/VLbY5xmno3T5psVn6p3pTmGHha5PN/X6JXd6o3x+hFSu/0YVFJR2mz7ll1T/BPIYrtyvHMg7iWX7WLu1ARmqK1XjMyFGIzUdfO5I6iRdqdhNz0KUwXB9Ep4kO7fiX6t+p+kg40SOvVzdBOJm6G9Y+x7Qm0OHUVV/8jUrVYJOF1ALUdJC2kwFNIDGnh7z2Ul2KU2qooRfX3W6vTT+T5PqGNTN9orhkSsGCvZ6cDGV3bbLvZTgF9h2/gl/AB30hVC8lDVZfl3iVBWMM2qs7zq9fRSGQwJd/9jayCKbIDL1uq+5kX+RW09p4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxVC5q8unCzMhreOQSgsR03dCyqerhA3OtldNZdPk6k=;
 b=QCCAFtSlTnOxLVdnJYrGTkw5sM9bMcNyuK95D6DnYHQUvnuERdfo+Cgr+F644ZPy05XcEIhnXqBmHbeVOXE9oEBKmY1p4MfC4kxFOQj01460KGBcFma5X+88WFplxz6eDEPtyXEARICQnwxdb8LW6lDb86QpqPNO5roKVTaZ6WBoeLXajfKF9WZ7UMG+tt8xUAdp++VnnuUWbF5uQDnr1GH1/7m1MdR2/16ugQ+1sAk2zYHCcIZof4Y9ueCxqmeuRWM7C+a7zSNvrC04XuzqD6M7qoUqqKJLa75Y5SzodHq9PqoMSFpIrMuG597KyF/dCdh5uMN6nGom4KdiHQ84Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxVC5q8unCzMhreOQSgsR03dCyqerhA3OtldNZdPk6k=;
 b=NJdb/mYp9dBibGb+kjGx5NgDJNvSfa5CJxi9W29L44FHkqA1vDdgL+M2jP83dh6aT+lVjYxGtH9WuFtwaTsKwWs3x9pf/KsnVRlPfZOsHa9keYC6tBOmnethlIz/uzomCWG6IJIo4/OCkUtJb6E/qEWV0IdZ7Ap0sKD5psPIpas=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN6PR11MB1891.namprd11.prod.outlook.com (2603:10b6:404:107::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 26 Nov
 2021 13:48:48 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542%6]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 13:48:47 +0000
Message-ID: <111c2150-cc34-56e1-e4b5-34ccb14c84ce@intel.com>
Date: Fri, 26 Nov 2021 14:48:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.0
Subject: Re: [PATCH v3 1/4] ALSA: hda: Follow ACPI convention in NHLT struct
 naming
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20211110103117.3142450-1-cezary.rojewski@intel.com>
 <20211110103117.3142450-2-cezary.rojewski@intel.com>
 <s5h5ystvkr4.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <s5h5ystvkr4.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB6PR0601CA0028.eurprd06.prod.outlook.com
 (2603:10a6:4:17::14) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
Received: from [192.168.0.164] (89.64.110.117) by
 DB6PR0601CA0028.eurprd06.prod.outlook.com (2603:10a6:4:17::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Fri, 26 Nov 2021 13:48:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f99203e0-cf1b-469f-f5b4-08d9b0e3786e
X-MS-TrafficTypeDiagnostic: BN6PR11MB1891:
X-Microsoft-Antispam-PRVS: <BN6PR11MB18916D89FFC6DAA0638182AAE3639@BN6PR11MB1891.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fLWEVFnaXpekP6v9RQHu/ktX/2ATACece9SlQpfZnDnB8FGOounAhyUmbE1aBRLEvyu66hDaufS+USZfMxSbNiZ66JEUi1lqPjHwGRqhHNkm3E21cUS372vE6WG2vYiyWfQ55ATgdTNagwiYfvIF8Dpe8N/1bQFpQuPVPzu97VafG7mpu6uStPDZJYN7eLrGdw/784jBpT+v3VjWFMJwuDTnzWaPvvlGQe56/YMfmprvb9J1f3aIUymz2RfrXLgg/dnJP6RKIi7fhYkhtM/1WV795cNJ9PKTzBp0566yQZzaca4686wL5+pGtR5zNDFL7KAlhWprDYTmcU1uErWF+WCZR+A0JZ57vuL1GmBBNAbrNoy9mw4WeCYROCKu22r8fxUex64WXItFr4DT2YXf2vIZ7aGuntBinFKZIX9yAqA3o0krfmByDdooyiPLyJLWmY5dB7Rgboe+WIVJNFOD7aQI6ROkEvZp8oED1zr4dMeGzYqi5iseb5feG9/B+FF0/09jF0y2nu8fIfbnBMVqMdh65PBCkdhcvCooaHH0X/xzc8xlCRIDbBq9alHpOWaJNXbA9GBpMNJhOEYxcwcA899caZ2veg1NOfuJCx0hOEdgaibB628UqQBw4o3mUd24oQyrryAj/ENJluJ/iqakPPuDs5bWsp/Yuu5at5NPWPeMugiW/Nl2LTOMfa4QMAVLKCCBitWMGuKlM/L0/GWDfIJwFMoAxcep/g3VIs0BdU8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(956004)(53546011)(26005)(508600001)(66574015)(6666004)(82960400001)(86362001)(36756003)(6916009)(2906002)(31696002)(83380400001)(44832011)(2616005)(4326008)(5660300002)(8936002)(66476007)(4001150100001)(66946007)(66556008)(31686004)(16576012)(186003)(8676002)(38100700002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGRvTzJlRkpUL1lJZFduaDlkc2pyNXBpdTN5QWVLa3JSMzZ5VDhIOHg3eUVr?=
 =?utf-8?B?SzR4SUErNi80STlBb1RmR0VPU0NlcmhqNE1EM2pCUThXd3Zqa0lSOVI4b2dO?=
 =?utf-8?B?YmtwOG1uMElkall6cEE1Y1NaK3Q2NHo4UzRRVU9GMDRnNmU0SElDbXF0TGVz?=
 =?utf-8?B?aDgyckxReTNDL01hWEwrd2dFVGhrcERxVWkwNFVFMXpxT0taV2lZVnNISzNI?=
 =?utf-8?B?eDNZNWlzdDc2am5yV2poR3FCVnY5UEUwdXprdjdwa0dSMlNDd21iN2JqQS9B?=
 =?utf-8?B?bVZTNHJTaTV1MkpVNXd4M0NvNk5UOThibFRrVWZtaTBhZUxIN3FzVW9WYkcr?=
 =?utf-8?B?WUljaXFUMi9saWVsWE5pdUlSRmU4Y1B3SGJBOWx5ZERzQ3pVWnRNYmhTT3N4?=
 =?utf-8?B?L1dWRElBZmtHQTdoYXpXQ05zMGM1SEs5Skh6YThBRkN6RStjU0lTZUExdFBH?=
 =?utf-8?B?WWxxdy9jSnFGQmZUSHRIbElaYmZRWVFqWlNQa3MxNVl6QUdZUm4vUnhORDVD?=
 =?utf-8?B?UzYvODBvanFoZ0tTWFFtK3dOUnVtc1ZEdHNmQ0NuVDVQSWxvOXZ4VDV4RERw?=
 =?utf-8?B?V1JSaVhDQTI2TjdwMGdDdHp1bkM0NjNIRWcxYkVKTlh1dEp0VVhOOEVtZHFC?=
 =?utf-8?B?QVFPQVpHckJHenZUTmN4b0NNdG5tRTdpd25pSWwySUtiVXkrN3lXSmFNUmZT?=
 =?utf-8?B?QUdqWGFUOUwwOTFHajlYWmJ3bkk2b2dBc3A5STV6dXRNdkpMcGpjNTl1UGx6?=
 =?utf-8?B?M2pSRkNCVXY4dmJhNXpRSElCWHpNbkhCRlNvbmhWQUNaM2dNck9iZmlEV1FO?=
 =?utf-8?B?WU5LSWlqUHo1WHVkTkdZK3JxQ1oyekRDWUZLRW1qOFdQeUNKdjFwK1BrdEdr?=
 =?utf-8?B?UXhUSGZ1NE1CWTBBeHlkQ3J2S1d5T3BtbzZnejlMcFhtMjFUTlpTNW50L2Jy?=
 =?utf-8?B?alJoRzYyQ0Y5emk2VHVkdEYwY2cvRDJhSVNFbkZGdmZZUWxJUHRnY0RJZnN2?=
 =?utf-8?B?RllVYXNmdFBScFhwS3NURDBBK2g3RjU2NWp1Y29Vd2pzQng1RzhJRWlNdVJZ?=
 =?utf-8?B?eFZPS0UvZW1LVk9rampPQlhrUy8yemJVWUsxSnJManRuOEswbWd5VWVkd0dX?=
 =?utf-8?B?dHhMNytXTTlic1B2RmYxak9RUzF1M1A2bHpVR3h2bm9iQkN5NVlHWmZNeE95?=
 =?utf-8?B?bDE2cUpYalNPaWZQWlk5VS82OHBsalhRMjZWYVB3Q0gzeVVzMTZvTmdMdlkx?=
 =?utf-8?B?OVhrcXVrREpPK0lLSzVObTI0blVTOWhOS3daS3pxVnNwK2dON1Bpc3JwakxL?=
 =?utf-8?B?WEJnUFVLRTlBL2VKMXgwKy92bGlqM3dzUGhiVlBnSXR6NWlVcnlpMGhlM0Vo?=
 =?utf-8?B?L2xDdzc4dnE5ODZYNUpsZ29KT0I3dGErTllWZFg2K3g4a2FHQUY0azVrVkRt?=
 =?utf-8?B?djU5OVg0M1pEQXVvOVhYaW8xME1aUGt5NVFObUEyZXNuTk03cDBGYUxjWmJE?=
 =?utf-8?B?a2IwcTBzbFR6YlpobEw2UjdQN1JQSzlBREVKcFNzRjI0Zm1RRXVyMXdUM25H?=
 =?utf-8?B?ck9BdVk4dGoyMGVWS3BpbWZkMGRYb3FhMG81aGdsYUhHK1BKTGdaajdCSUdU?=
 =?utf-8?B?ejJkR1grTUVYUm5vYTFrdDRnb1ErV1A0cno5emwrRnJyNFlKYnRwRkhoYjZD?=
 =?utf-8?B?RGN5VWZEZy9xcVZHek5jMG9JK1NJRnRqdmRCL1kwNWI2blJnaTNWYWdnL09B?=
 =?utf-8?B?UXNpdmtjVkxxUzRrN0VQVGpQQzNXOEdHa2p5N2hNR3JGTGxkbFVzVWZ3R2Vn?=
 =?utf-8?B?cnAzbyt1aHVjM0o5VkhzOEZJc0dtNW42dDhDQm5rLzI3R3U0ZEFIcDNPSVVB?=
 =?utf-8?B?ejNiL0EzMGhiREVNYncrZVQ2dno4Y3VvTjFWMTJzUkZHT0NYU2FEeFNEbUF3?=
 =?utf-8?B?UlUzSCtwTTJpblNLVjVPbWNDMnVpc2JyOEwrVkMzTWx5REFQMWp1MDVDNU92?=
 =?utf-8?B?TmVTRGtJdlpGUDNtOG45dnNaZG9TeHlnWFlWSStjUVZmNTZ3eFJaSmpVR2pK?=
 =?utf-8?B?Zm11TlBPaFM2dXRNRFZzUkNPa3dhN3VTUys0VDQwN0NDRjBzSDJQbUx6aVZE?=
 =?utf-8?B?cTRWcit2U24yQmp1b3F3U1ZMdkl2YnZDWHpWdTNSdVRYQ3pyZXNnUVN3ZWEr?=
 =?utf-8?B?SGZJZ2wwSmcrYzBsWS80aG1JQ2c2OE44M05VclB5Q3JHQ1BIYjZKRS9BbW1a?=
 =?utf-8?B?cktQektldkwrSEhCcDBoWHpEVWtnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f99203e0-cf1b-469f-f5b4-08d9b0e3786e
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 13:48:47.6397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BqexX/RtlHa6VtvdE3KK/BagCeg7DuhTgWnNTSFENAv+je+xUJf0bSPcj64BnYn0NqIVtrAlwKi/dZ77eHTiGQ35uXdm7yYr9WayK7tSuDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1891
X-OriginatorOrg: intel.com
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>
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

On 2021-11-15 10:19 AM, Takashi Iwai wrote:
> On Wed, 10 Nov 2021 11:31:14 +0100,
> Cezary Rojewski wrote:
>>
>> From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>>
>> All ACPI table structs except for NHLT ones are defined in postfix way.
>> Update NHLT structs naming to make code cohesive.
>>
>> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> This turned out to be conflicting with the definition in
> include/acpi/actbl2.h, which was newly introduced in 5.16-rc1.
> 
> So unfortunately I'll have to drop the patches for now.
> Could you rework with 5.16-rc base and resubmit?

Hello,

Sorry for the delay in replying. I've addressed the naming conflicts in 
v4 - this patch has been dropped and all the rest updated. Additional 
work will be done in separate series to align sound/hda/ with recently 
added NHLT-structs in ACPI tree.


Regards,
Czarek
