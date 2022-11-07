Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D194361EEEF
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 10:27:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59E77836;
	Mon,  7 Nov 2022 10:26:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59E77836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667813249;
	bh=DN38sVpdWkrfyHJSZTu6FKgH26iIzsWwLbDHZ+AaMF0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HGbm5ovOko8mUkwYAI87U82X2aR2L8pUP6156PELvfAKkwUrfT0z2kgG898v9P3n3
	 s4TpXxncgTAzkeQ7EajFu9aOyCtQCs1B4Jne31j1J5vXt7Kfh0cncAWzIFDnWzTJz9
	 vPR5e3QolT8w5DNbLv/nC9ugMM8Ju0QZJDhqy3Ng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA531F80116;
	Mon,  7 Nov 2022 10:26:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 922A1F8025A; Mon,  7 Nov 2022 10:26:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_72,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DC45F80116
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 10:26:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DC45F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Vday7Dli"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667813190; x=1699349190;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DN38sVpdWkrfyHJSZTu6FKgH26iIzsWwLbDHZ+AaMF0=;
 b=Vday7Dli+kYZWI8J4TeLgLtxivebvj87NOgXuF2N59C3iIuRXqy/+k0j
 FYX0tyI8kaabhmY2t40PNzkSfMYTXQyGITZlzkOUoa5/jroSzrJSy4w3n
 19zFfJPhcT4kj30ta4qYVX04IDi+dvwE48vJkCRI9U/yLxubdxKkcv8cD
 wxS3pRe18g2TiCsyD6g7CcDaZyJo8Gui5HL2igP9GjW9lvdE0Ls/FCpxX
 DG3HlmSInYzl5ztBO6uYaK2St0shi1MHEnoBFcB41TQA5fdWwUXB52ON0
 bD5R2vXx8pLizKOY2JKD34LI2vjKMWnQGUFLS1iUQVXzsmpdqhJ63fSKF g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="337085139"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="337085139"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 01:26:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="761033424"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="761033424"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 07 Nov 2022 01:26:26 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 7 Nov 2022 01:26:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 7 Nov 2022 01:26:25 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 7 Nov 2022 01:26:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PdWpcmILv0ifh7rgp2C6FZ1y99ij0e3cjBBN+D1cu3V0eTun4C4A7l4cpImLtkWS1rqacP4TXJkzgEVgbZaP8tTWvaJewZtPRMlEc1MyhBphyfr9XzWGratFQ1SSDmKfMfcxifgOT23L7+QU9LZZEFOUcax1wvpdZ4MZEEZm0yqbQ5Ho6qtBaQC21WNVyLIRgPkVL6P9SKo5e3x+EgFZ1V01OTvvCmSmLkFtCFaDhWlOfVJwMvS7y8vkI5DbmfCAjj4VStgDx091tUlx43WP3tWaeUXPATS3qk/H2Xeu+dfSOD+C0i3pGJsOtNRGyYLlZaYlifBG8gyGbRAjWPNmlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4UeyIbsl04IJGPMfZ5h+gQuMDZLJyWerx3fJg3Tuak=;
 b=hUBtbxmiFScPUbbW8BKX//BT+AACjb8z6yWZ+MIBiok+TEKpaNdpQRxu0htNHf/pBaLNyTiN9L0Obc2wC5ReacLsQKxtne/benMAQOuxiPYxBU7Ef21cwTUKBo9eY0MwC0OAr8/ZlicE9c9WNbH12V25r1A6xWTSsWyP/dxv+PYYu6yTOGmXIIiISSUi1BqBWatN1MGX1e+ucAWYfReXRcdHQnOxNOYVEw50xG4ag7oSidclZy0arv/xmNK7FCrOE9uKdP/xVFXljpvrwppDih9W/i8Hs6C0JX62ua1j9iDJut9rcoFbeNzV+TmwR3RhBDVK9W675TIZk/EhRcaw0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BL1PR11MB5556.namprd11.prod.outlook.com (2603:10b6:208:314::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 09:26:20 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cea8:a6dd:9b7d:49ba]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cea8:a6dd:9b7d:49ba%6]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 09:26:20 +0000
Message-ID: <3ebce110-1a76-e59b-2172-616a3c0f1984@intel.com>
Date: Mon, 7 Nov 2022 10:26:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
Subject: Re: [PATCH 2/3] ASoC: core: Inline resume work back to resume function
To: Mark Brown <broonie@kernel.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
References: <20221104131244.3920179-1-cezary.rojewski@intel.com>
 <20221104131244.3920179-3-cezary.rojewski@intel.com>
 <925c6405-f651-f68d-73f3-46cf85cb2fa5@linux.intel.com>
 <Y2WmRUBJ+7K5zBm7@sirena.org.uk>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <Y2WmRUBJ+7K5zBm7@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::13) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|BL1PR11MB5556:EE_
X-MS-Office365-Filtering-Correlation-Id: c80e393f-62c7-4097-0480-08dac0a220fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /vHFFqujU6AGGsR47QilTxfNO+MvmvH5gwNjfjrR7s8T3Zhn3U6AAWIz7b9SwYRULqmBCVapAHrSUy0gn71QSHIeiSccA3+4wxYwXo9w+kab4JWZeVGBBIQSF1JSgaWe8onlaO/ift8TSKYxIgfBsS8bFPyinyYxJKhzU48CMCEbGP5+sJEMAUlSEze+scYRNanyWAmgqCD8p8+FrK8vYY4mMv0dm14P+fqNSIUUj+wxxUzYvI4g9gSvT/NkhpwLxizE17td6U9tLg+WiZq/oRe1mM5ie1Ma1n1/yZQzdUaHtg4BoOodfBsPs9dq89J/DvTx1J7cbkGP3km2JsC6h7fEbqKmuZESDXW3koJWe1wpWjS6dFV141uZEZ3mvxzKcY7EBMkxh2mLlytZcmqy4YOTmoqmmUPusZ3zTEO9mHijc5Jl+q6g3qM3eoA1+jVCgEwLGZhr4pfLwT3KhT4VFkb9iGDy1PPbSTdF2ts6N2pcCC85UJe/EaQGZF0pQFqQey0kftWKnf6OwleSxIAR7uBPYD3ciQfY9b4EqlT3WMJeQOddktAR5QC/jMks0RBUqQml6NWd4qHRyWttcRJ3pRykfkDqdTrxID1t32BUgElS2ax58NQXcCIPhAg/jqwMmpVIy+GCTOJ/sSspt08jdHiu8rq/7nC3xuRHJwCuInzw2yKryMfHvFhc3V6+yNaqNRdv+S7Bth3hkHK96mwRWwAhq8IQhOIcaf2tKgfg6yvyY31XVtt4/9wKcsnrwo9N9Z5/I+vRQNnT9kARr6aVW8CRLJFD/ZMUrxYzQQdndbg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199015)(83380400001)(186003)(38100700002)(31696002)(82960400001)(44832011)(2906002)(86362001)(8936002)(5660300002)(6666004)(41300700001)(6486002)(478600001)(2616005)(53546011)(6506007)(26005)(6512007)(8676002)(66556008)(66476007)(4326008)(66946007)(316002)(110136005)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVF1cTY4ay9RR2ZrOFhuZFNlU2xEOWp5Mnp1K3lIbktGQStmZHRBdDRQRkc2?=
 =?utf-8?B?OXRzbi85ZVZJUmtyRnYxTnVGNVhPY3FMNWdPM2NlcFJ3QTZUSjBOWEZtVXlL?=
 =?utf-8?B?YUsyclJrb240SXIxYS92QWZNN3RuaTAwQXJRWUQvdDRnRmZDRmlEVFJZeGFh?=
 =?utf-8?B?bGF1WDR1Q2hGZnhEU2VraGhiY3Z5ak1objdUayttam5RUW1GdE82V1VEWlBk?=
 =?utf-8?B?M3NKcWZTM2tmOUM1OGdtT0kzaDEyenNGeVJ6ZkVOTExMOUJTUnU1MzFicFRM?=
 =?utf-8?B?bW05dDZkeWExTnRUZ3Z6N3Z5V2dCM3FqbERQQkxPR0VzTWZFU05OeWljY2Z4?=
 =?utf-8?B?cHBTUnVYMmVSKzNIZVcwcFJuWk5Pd2M4bkhuODFhRk82dmVKbkdXcTdDc2Jv?=
 =?utf-8?B?Y3ZQVURtNEQrakYxVllITHkyc0Q1SWdib2oxVWpFRnlMcVRoVTVmQ3VobVhO?=
 =?utf-8?B?NFM1MjA4dElnYWVqcDQxNnh2VDJMYS9naU9XdFBFSmtDdmxDRTFJb1dzTHU0?=
 =?utf-8?B?K0ZNQ0VUd1c3UjJsd1J2ejVvSmhaZG5HMC9CbjJ5WkxFbmJ3VXlTS0NLNnlu?=
 =?utf-8?B?dFRFbERER052Ykw0WENnS0NVRExFZ3duL0FKUkNLdnhmUlF6WWpMWG82WG9C?=
 =?utf-8?B?cnMvSFY2Z2JHaFhnSXg1QmozQUJNVWNFR1F4Rm1UUDFSQnFGdThvd2M4RC96?=
 =?utf-8?B?QUtFUEozYS9YZDRFZmFqdmg1VUc0cXVjVlJqTjZrZ0NYV01oTHRTQlE2QTk1?=
 =?utf-8?B?WVJab3FqNnB5bmhyTnU1WGVnY0t5RnNBK3FlaEpxMXhIQS8xMmszcmNuellG?=
 =?utf-8?B?UTgwSDJRdWZoU0JNTW1yWUdJdUU1SENmemJLaThDVVh2M0h1eHFvaklWRGRl?=
 =?utf-8?B?dnBQQ1ZVbUcwS293V3lnMVdrbkpxSzkwZ09qcEZCOEtCT1I2enp5WUk1UCt3?=
 =?utf-8?B?eW8zT2pmNHFsUmxhN2NTZ1dGWHNJdWlEQmVIYVprL3dUME5pbWh1dTdHTTI1?=
 =?utf-8?B?K1VZbHdDMHBoYWJITmRucnhnV1hDKzIydktDazlFOHl5UUZLVVlwWU4rRHhZ?=
 =?utf-8?B?YWZSWnh0NGZnWUJvYTFna3RUTy95YkJZMzBHV0xOR0w2N1ZLUGZlNURIa3hW?=
 =?utf-8?B?bGw3Zy9SaGlSYlRuM3M4TUQ1NXI5eHRyaWswbFBtOVM1U2hFNHFqWnhaQ0Rr?=
 =?utf-8?B?UERQeVVDRStINW1EQlhOaTFLU2R0ZDdqUnFxMGkrT09kVmV2SERPbHBCdThr?=
 =?utf-8?B?TVZDNUo5c3pMcDJjZ05ySGc2YmZsK3k0M0NxUS9OR2VZOU5FOTlmMDJzTEJ2?=
 =?utf-8?B?bXJpeXhuMy9aVnBjQkkyUkVYOXRoWENxUlhQa05hTlB0UmlIajlSVkRmWHIv?=
 =?utf-8?B?bVZpWUhPTUw2cHFlT0l4YlZUaXEzRk42ZTRGOFZFaXpKaUdlcUdwV1NuU0Jz?=
 =?utf-8?B?Q0pBbU00K2lPSy9kdndQMTdZRDFjYWVmaFg5UmlzMFlBQnc0eEZYTmhBVENh?=
 =?utf-8?B?SUh4eDhVNzlaWmFVS3BURnozQXpRSFNTbmJWbTN3aXc0eUFDQWY0Z3JpS0E5?=
 =?utf-8?B?NEIrZU0ra01LZUFIalpBcWV4YjF3Skx0S0lzMkxOcnNINXQyWEtSaDZ3Y1lC?=
 =?utf-8?B?T3doSXFtbHVhc3FkdjY2QzNDWWhvVkcvOE5KbnExYXVDeUZKVGVWZTY2aGlx?=
 =?utf-8?B?QWlibSt1NHU4cGVDRnJVVmdNMVQrRDVOWTFNMjhCQmpSNW1halBPakRxbjlr?=
 =?utf-8?B?UmlOazNuNGZKY1VyL0VhUzgwQU9iZ2ZORDhUM0cwSDdBcjEzeFgrcDZ6TVFI?=
 =?utf-8?B?UDJTdWVRRndjeXhRNzliWXJHYVdMdXpXdERRN3Vwc2cvTysyWmF6UEVLc3da?=
 =?utf-8?B?amlCNlk2dTZJcG96RzJkQ1JMQUUvNnZva0FPY1NGVW4vOFlnNVk0QVN6OUNK?=
 =?utf-8?B?alBYaTdpb0R3N1dKOUhia2tyM3lYMWd4TUtEWGlMVEVPK09SUjZNUmszTE5E?=
 =?utf-8?B?My96V3FrVGNuZTVqbDM0T25kU3BXeSt3M1p0ak11NVJhS1V3Slk3VXg4bFgy?=
 =?utf-8?B?dmRCK0VKUVd3enYvdWVqTDd2ZG01Z0plaUNHZDVFbDJPVDIvWUxldVlKTjhR?=
 =?utf-8?B?N2NHSjVTcnlQSDlTK01XSzJBd09IUmg2MTNIaC8vQVpmT1VjazFzdkpVVTEw?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c80e393f-62c7-4097-0480-08dac0a220fd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 09:26:19.9534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 30hSKIn+dbaBO5mAlDNE6TZFphlq3lX7V6Dayqaul9qnw98QTD8bYZ7V7T2ng0Viyee50pGXr5L78spfwxQaMFnfuhofi4uEiwpnKP+W+Ys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5556
X-OriginatorOrg: intel.com
Cc: hdegoede@redhat.com, alsa-devel@alsa-project.org,
 amadeuszx.slawinski@linux.intel.com, tiwai@suse.com
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

On 2022-11-05 12:54 AM, Mark Brown wrote:
> On Fri, Nov 04, 2022 at 09:58:46AM -0400, Pierre-Louis Bossart wrote:

>> If I follow your logic, we should also remove the workqueue used for
>> probes for HDaudio devices, on the grounds that probe errors are not
>> propagated either.

(save)

>> Any time we have deferred processing to avoid blocking the rest of the
>> system, we incur the risk of not having errors propagated. It's a
>> compromise between having a system that's usable and a system that's
>> consistent.

> The other question is what we'd constructively do about a resume failure
> that we can't defer.  It feels like we should at least retain the
> ability to defer for devices where this is an issue (older components
> tend to be cheap and packaged in easier to assemble packaging and hence
> get used with lower end applications even well after they're no longer
> competitive at the high end), and if we are going to return some errors
> in line it'd be good to understand the benefits and tradeoffs.  I do see
> that it is a lot less useful for modern devices where we don't have to
> have any delays in startup, though like I say register I/O on slower
> buses like I2C could still be a concern.
> 
> I'm not keen on moving the support out of the core since there were
> originally a bunch of devices trying to open code and it wasn't good,
> both from a duplication/complexity point of view and from the point of
> view of integrating well with userspace APIs.

I believe that framework should be supporting both, the deferred and the 
instant resume options. 'void' in front of suspend/resume in ASoC 
hinders developer's options.

(load)
The HDAudio driver is actually a good example of how to do it right - we 
did not modify driver/base/ to have ->probe() return void. It remained 
as is, instead, a developer opt-ins for a delayed probe through a 
workqueue. This way, everyone is satisfied.
Cohesiveness is not to be forgotten too - keeping behavior and 
expectations of the standard set of functionalities aligned with the 
rest of the driver/base makes it easier to hop into ASoC.

We could provide some additional flags so that the ASoC core always 
defers PM-related work for certain components if they choose to.


Regards,
Czarek
