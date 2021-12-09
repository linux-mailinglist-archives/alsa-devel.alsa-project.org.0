Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C56BC46E614
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Dec 2021 11:00:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F79723BF;
	Thu,  9 Dec 2021 11:00:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F79723BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639044058;
	bh=TKyG+pPNbG9tkQz8kMNp/VBp1cYAKd9IACXkcc/uQmQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mJMjETLCjmTr/4gePSJJkFsU7bcH43it/VBBtljd3h2bFrZBrTq2MXKxMWv6aTtc7
	 Mx5gOJXAyj9vL5LYj/vRZe00QeFZXnMH8Rzt5zwOilJzbPO9Jyhg3QFalLwunYWEau
	 oqfAzBdp4xvhBz6JMklKEXxJeJflC2hR8Z7b9LpA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1653EF80431;
	Thu,  9 Dec 2021 11:00:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADD34F802A9; Thu,  9 Dec 2021 11:00:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,PRX_BODYSUB_1,PRX_BODY_14,
 PRX_BODY_72,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04E74F800AB
 for <alsa-devel@alsa-project.org>; Thu,  9 Dec 2021 10:59:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04E74F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fneGqqG2"; 
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="AbMPWHAG"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639044001; x=1670580001;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TKyG+pPNbG9tkQz8kMNp/VBp1cYAKd9IACXkcc/uQmQ=;
 b=fneGqqG2bdVWOItBv+xFejDNaHKKvkztlB40v8DR+V9JaUNKvf779bW6
 40DG2dgXSehBrWdnek8nxBUmUz6NnzKj63AII10lPW4uTBKwlgsWfrqrr
 WE5SdRmS0vYPLdOraVQioW0U1rh9Nr8CZyhqJDOn4RL2l2E4f/m+0LuOL
 zl5ebgy7Rymjk9H8GSULGi5pbtqOLKLpIwJTx/rWbioGlN2EevaedWbZ3
 xT+J9ROu0q4KRmKUIAcE/JVp47e1wg7ZjlMVTHfvt+uazlECaxUHWtQ8f
 L/L9gBvIR8H42QcpBTEexQNmffOlAsutq3uZXtDVzC3g1asJBz+qiRrm7 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="238006070"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="238006070"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 01:59:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="606795576"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2021 01:59:54 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 9 Dec 2021 01:59:53 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 9 Dec 2021 01:59:53 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 9 Dec 2021 01:59:53 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 9 Dec 2021 01:59:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQLCYHTqADXdbzHS06jmWnLLXsa1Fhsw0to8GWK7GfZL6swOVsjtn0GH8LWCq7CYciUfFDGkC9ZqsFjWcBhta4moaxIx6qVdvt7plSaNM+0fwZ2pJk/8D7c0Gk6EDWBz6XxP++70omRLmeCNnwUBDFebU2nkVV+sMtK7zxpTAUuIe43mVaPyWzBM4zl+hp90O3e4W54JfbkigfQuMUEz2FvHObPHRrrSO0/1pkAg+V+wPB2HltZUody+GSuUslDxPap6FRiIvfwZ7wB+uXEsEGbfRNwQ+2uO0g80gFnnCTR4a7f4AGeX2ord0x59AE5kM72WLdjC2wu2G8HDrs74dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XiNbh6TvyDbY2ZWYwCanZ/VZIkMUK8SzFYiifjzV/uc=;
 b=BMCRU0T0NF9a+JHPzzaPxrnGzvRVL6mPyQEURKDw2EseQsdnGqQgDbMoLYKtphubj52bhYRERJI8rRKPkZhY/knqf5ak8K6OMgqoYNLIFsQ2Xlu2gWxJjSDzcceRqg1ck06r9fyzFg2XFrFs5UGM/8n5vLK0YjnIHnmspfnuue3q8L6HouWbWd42KwnIR+rEv6An4/ij179pmWUNcP6fmfnW3OXGL3FcKqzo09ABbreYALtS+rXmoCqdiY1lxPsGhPZ3WE23/GKCyqFWaseVCX4wkTTDJbT6RyccIIx0rkUIJg5Y9LmGr6xwuIo9/my3gsJMvX4gBdmDhPjwrRkshA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XiNbh6TvyDbY2ZWYwCanZ/VZIkMUK8SzFYiifjzV/uc=;
 b=AbMPWHAGmDr6bQNKlp4+ZkCD7NJhLnbuJQU1yzgXadW5W9T2Yse3ekRjwwkmhUbx1O4wfQavL3pcAfw+7RW83QOtLznGrvPhpx+n70YQ53wcvmhuTqXiYQe5JtIHD3mN8Rolc9PnjWfgEXIPaA840iY6DZJsXvw4BkA9hL2U3xA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN6PR11MB1826.namprd11.prod.outlook.com (2603:10b6:404:102::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Thu, 9 Dec
 2021 09:59:52 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26%3]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 09:59:52 +0000
Message-ID: <d569e8bd-a22b-bfc2-f799-ad63ea38c455@intel.com>
Date: Thu, 9 Dec 2021 10:59:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.0
Subject: Re: [RFC 00/37] ASoC: Intel: AVS - Audio DSP for cAVS
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
 <59681534-aeee-003b-0fea-af17503bb813@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <59681534-aeee-003b-0fea-af17503bb813@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0040.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::28) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
Received: from [192.168.0.164] (89.64.109.162) by
 LO2P265CA0040.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:61::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.21 via Frontend Transport; Thu, 9 Dec 2021 09:59:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05805a9c-0663-4595-953c-08d9bafaa4af
X-MS-TrafficTypeDiagnostic: BN6PR11MB1826:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB1826ECB2ACAD9AD665F1A38FE3709@BN6PR11MB1826.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hJKXORtLeh6hdnMwOWxs8aiOKLS4bb9QcOU5C8oe4OwCNM5vLQV2W4wITGIcbEjrnzb9/gKAW2ePQlevDYCoTf7lYMuumSDin9L/cH1Y/f4GERqKyAMnnBTHT8vtCEQSjKTHz/46RFOqxw4dYovArGamww4NqxfSiu147/wjCm5l57NYtBXtuIFnqkpoVEqwk4S5RzFlFekIuIO2nFi8dbg+1ul49au2F+9uB5pLYLNB+Bo53pbqGGjQk/oLRoVdxNCY1leNT57JWk7xvgNK1Y+GYdGnBexVtvXcXB7WA/HShYxoZmzlIygqJXYazAARPB/u9k/ZFhlHC4u5u2Xx1gEiP6XgLjP5+Utr/arfIn8/rz9gTy8l8USpuBrVgvOkxFg1XswyV/jR5WIWtgwLfZNJB+t95/mE9MOYwYqQp3QXq895WlXdjNO+QE/fA+Rywa6WTu07TlNawqur7GklTRthBKHlhneRFQV3aKr3QTTnu+xi6YEUfZZhGOcu3aEMCuX9ifeWwN5DEdGGBJc1WBryjDeejrbikLNav1b65d+Nu3d+60787FcJ/aC+Olubth8bOJwnOOhNXsM8E2d2A8gcEsIUVf6yKJ+mFpMJYMpsEr8DiTB5w9TCM07wqJiFU7+S8NuaW8TX07yf/swXjEzzwGFKuwBnhid3CZ7mp9h+Xpwl1BT9slcigwLXL0vonPG1GeoDKPa+XxyOuV+MHSjt1gARZkfhdwQGtO+IArw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(82960400001)(2616005)(6666004)(6486002)(8936002)(44832011)(86362001)(53546011)(2906002)(7416002)(31696002)(66946007)(66476007)(16576012)(36756003)(66556008)(31686004)(316002)(38100700002)(5660300002)(4326008)(186003)(26005)(956004)(508600001)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDFWSTI2Q2Y0S2FFMVBOeFQwZ0tOaUVPT3ltOEtMZWxTSXZOK1RlMHN0U3Bh?=
 =?utf-8?B?NUJDbVhSTlhLeEl2LzM2UTBYdHRFYjBmRllCMGZ4YWxNcktNYXRmd0xiWGcv?=
 =?utf-8?B?bFNMak04MjhCSHJXUU1KRGg2VWdUdVB3N2t3SnRvTlhiTmphR002QWtJYlIr?=
 =?utf-8?B?NXFNNzcvTVRrb2JzRE1EbCtRRC8xd1JoSm9uVWI3ZEZQYzZjaWRrcXA3eEIr?=
 =?utf-8?B?aDBaVGhDUG9SVjRKd1FJbHloVjhrdFgzaUg0Yld5Y1dEMHdqWEF6TkZDZisw?=
 =?utf-8?B?ZnpnbENMb3JHSnllRmhjT3lQajkwbS9FQUhrQU0vQTV2K1V1OG56WE5mcldQ?=
 =?utf-8?B?TW1DcUZ3S2dmaEY1elBKRDBQK2pWWGNwOCtSMlBrZStaNGhYRklWUUZ4SlIz?=
 =?utf-8?B?SkE5QlJIOU5JYjlzaXp1ck1tajFCZ2p3OTdCdXZ5cWJkVWpScmZnYXM1akJl?=
 =?utf-8?B?NTE1cGtpVmtFUnJiTTdLWXRZMHMrZWVOWE9DRWZyUkxiaUd4Z1Q2d09zSnQv?=
 =?utf-8?B?YWt1S0kvSEhlNUVXK0xDQWZzZzE2aC9MZWdMemJROEo0K01uZ0ZHajRISm9y?=
 =?utf-8?B?bDJIdE9RKys3bURZTlhqNFVpeFRYMUZTTGcxSWVyRVNjaWxKZTdLQlpCRHJG?=
 =?utf-8?B?UnIyL1ZMSGdXMHpFY3pDdFFCb25QUUJxRGQxSTMyd3YvNGF0ZTI1clRQdEly?=
 =?utf-8?B?dGlEY3hBb1dIc2hXRG44djJvcEM5blEwUXlwWk1rUktMK0d3OSt1ZjExZFV6?=
 =?utf-8?B?S1g3UUhWYmZlemZvZkxNRnFHZ2s0WXF4RzBXeGdHOFVZcnBrY25LdVN2VzR2?=
 =?utf-8?B?eXRGM1hCWk1rK3c4ZS8xNFo0VE9MN3JZS2l4bFNOdVVuaVNRRHVZYW8zQmts?=
 =?utf-8?B?dlhFNUlNazdwREsvZE9ZbnBoQWV3RUJZaGxDT05vaHJSREZtaUloOS91MDkv?=
 =?utf-8?B?L1VDU0RqbWdaYWU0OU9kcFY1c05HdG5KbVlTT0twRmkrb1hXS1IveDB0Qk1U?=
 =?utf-8?B?bExOa3N1eVJlRWNOZHpueXQxUE5xVndMaGZMdTVmK0dobVNLV2hTUVdoYTZP?=
 =?utf-8?B?bGsycFlVcjVENDlQSzhUUkxXTTJkeDJEVDF4N3ZlWGk4Q1VFK0YrQWtmUGZr?=
 =?utf-8?B?aGVvb1FlQmU0b1R1TW9yanU2aUdPKzRSdk5WckVFcTJ0d3FkQnErQm5tSFRx?=
 =?utf-8?B?ZUxOdFdUejBvdmRndEY4UDlvTDRMV1kvSXVSbXRXaG5USTRCb2MveUQ5OUtw?=
 =?utf-8?B?VjZmQkJNT0IyMWp2ZWU5YlQ3QklVVVJ0MUFuV3VQaXQ0aGVuWFlwSG5FSFpZ?=
 =?utf-8?B?ZUQ5b1ErNmFqbWdIbUV5TFdZaHJBSy9GMjBKQ3NQYXFmRW5kWjNGOGJNNGFF?=
 =?utf-8?B?WEMzV3NXNHFlYWpCc251NEQ5OE5xcmMxZ05jVXFhMXJNODZFM05lcjdrRXJn?=
 =?utf-8?B?aTFMUmxzOVYvNmxnK3dZcGg0UXlOTmtSZHdDeTdhamQwRzJWelBKck5RWDFn?=
 =?utf-8?B?TEVrRUlXcVZxcEJBYk1SVHJkdmE4TUVLVEd4QkZTenAveTF3OGNoYnFtTmFV?=
 =?utf-8?B?dVNLNGo4YzFmcnJsYzdoM1FrL1lrV1dpa3ZzU3NFOC9wUHBhYlpYUHQwTHdl?=
 =?utf-8?B?azNmamo3S1Qvbm9JNkFJd2ZHalUwVjZLdm9JbThsNWZyQjJ4UzN0VE14OTZF?=
 =?utf-8?B?WnNiby9yZmdvZXowODMrSnN6ZzhHYXJhbUdaM0EweDRudXh5Z1NYNGUrNEN5?=
 =?utf-8?B?cEF2eFk3b2lPc29ibkgycXpmMGdkQTRrTEhOUmdtTVE5d2NFMXh4a1lLRDZQ?=
 =?utf-8?B?VnoyTW50UTFjY3JpMXhicFl2NFhxbEFkMTl2UU10bEpOcDNDa2Z5Z21zZlBI?=
 =?utf-8?B?TmZ4aTIxVWZiWmNtMHQwbEdaVDZROVVQRmNRSXJtVDdVaFdXOXg0T1d6M1Jy?=
 =?utf-8?B?Tm4vY1BVb0FNdHdqem1tYlluVnFNc0RXekFPRTZOZzV1N2VHWG8vSThMNUZ1?=
 =?utf-8?B?MTdxRHFTWjgrTWRiaEtZSGxNR3QwSVpScU1CbHJSWnhhOGV1azI4d3Jxd3cv?=
 =?utf-8?B?WlpnN21IbHk3cDhFblZRb1gxOU54bDFFeSsydWhwYXlEWVVxRmtLTDRHalVu?=
 =?utf-8?B?bUlaT2RHS3B0bitNdEhRN2lVdmc3QWFvWmFoaGRrNUlOMURtSENYbGJFU3Q0?=
 =?utf-8?B?blBTeVJLUEt5eDJZTzRQTDRCV3B5OW9hUEFkL3M5SWtaNXhiQVl4anliZDIr?=
 =?utf-8?B?aDFUbkZ0Q1N1MHhobmdsNnVlY2tBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05805a9c-0663-4595-953c-08d9bafaa4af
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 09:59:51.9565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XivaBS+k6leDg8G0R6EImvB8F1gZlw2NfL/TcP7nI5/FLCDB/X5JTX9G9gaGQaEwjvuR20VlYn9TswMRloJJWnI/9ivVZzMcdHiCtt1hC4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1826
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com,
 yung-chuan.liao@linux.intel.com, rad@semihalf.com, tiwai@suse.com,
 hdegoede@redhat.com, broonie@kernel.org, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 peter.ujfalusi@linux.intel.com, lma@semihalf.com
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

On 2021-12-08 5:27 PM, Pierre-Louis Bossart wrote:
> Just to be clear, my name being listed in the Intel internal reviewers
> shall not be construed as an endorsement of this patch set. Parts of my
> feedback was taken into account, but I still have quite a bit of
> heartburn with 4 high-level design topics:
> 
> a) The change list mentions sysfs being dropped, Patch 19/37 says otherwise.

Not true. Functional code has been removed entirely, it's clear that a 
programmer missed cutting the Documentation-part. For the remainder of 
this patchset review, this topic shall be discarded and as we all agreed 
internally, moved to the separate subject. Email starting sysfs 
discussion should be sent within next few days. Please don't cloud the 
avs-driver-core discussion with subjects that are not part of it, thank you.

> b) the concept of 'path' is totally specific to this driver and will not
> be used by any other Intel solution. The notion of having more
> flexibility in dynamic reconfiguration of a pipeline, e.g. to avoid
> instantiating an unnecessary sample-rate conversion, is on paper a good
> one and is used in Windows solutions, but in practice all the existing
> end-to-end integrations in Linux/Chrome do require fairly static
> configurations with fixed sample rates. In other words, it's debatable
> whether any end-user will see any benefits in terms of
> experience/power/performance, and the added complexity is handled with a
> custom solution instead of improvements to DAPM/DPCM - which as we found
> out does need significant love to support multiple streams being
> mixed/demuxed. At the ALSA/ASoC level, I believe we have more important
> priorities such as the notion of 'DAPM domain', constraint propagation
> and hardening for complex use-cases, and improvements to the pipeline
> handling shall be done at the framework level, not the platform-specific
> driver level.

For all the readers, the following problem that has been identified as 
one preventing the direct re-use of DAPM:

Depending on audio format, path may take different form i.e. number of 
modules and pipelines may change within given path. DAPM widgets could 
help cover such situation if form changes for different PCMs. Here, 
however, change of form is done on the same PCM. To cover this with 
DAPM, a number of kcontrols would have to be engaged (and that number 
would scale with each format supported) - path template-path variant 
relation allows to do so without any userspace involved.

Several discussions have been held internally regarding this subject and 
the TLDR is: 'correctness' vs 'less effort'. skylake-driver and its 
friends such as haswell-driver failed eventually due to being 
implemented against the firmware-spec and other recommendations. It's 
preferable to adhere to specs and follow the recommendations. 'it's 
debatable' - that's exactly why we have had several discussions 
regarding this, and there are pros and cons to each option.
Also, this does not prevent DAPM/DPCM from being updated in the future 
if we find something driver-specific to be rather easy portable to the 
framework. Otherwise that's a separate subject - large framework changes 
should not be discussed in driver-specific threads.

> c) I do not get how interfaces can be split to define different cards,
> specifically in use cases where different types of interfaces are used
> concurrently - think echo cancellation with the reference coming from a
> I2S link and microphone data from a PDM link. This would result in
> independent cards being joined at the hip, with no ability to propagate
> DAPM events. Cezary assures me this was tested but I still don't get how
> this might work. For the SOF work, we did plan to spin-off HDMI to a
> different card with the 'SOF client', but stopped short of an
> interface-based split.

avs-driver validation hosts a wide range tests and CI farm, just like it 
was the case for catpt-driver. The cross-topology bindings work just 
fine. Again, "don't understand" is not a technical argument.

> c1) I don't really buy the notion of trying to keep going if one card
> fails to probe. "Fail big and fail early" is much easier to support, and
> in the case of interactions between interfaces you do need all cards to
> be functional anyways.

Not true. In most cases sound devices are separate beings, and there is 
no reason to tie all of them together. There are user-experience 
benefits for separating them - HDMI failing to probe does not prevent 
your I2S speaker from being functional.

> c2) What this split also requires is the addition of ~13 odd new machine
> drivers, along with new topologies and new UCM files. This seems like a
> bridge too far to me, I don't see how end-users might transition to this
> new driver before the end of the support period where the community
> typically takes over legacy devices. In the mean time, the Skylake
> driver support will be required (5.15 is broken btw).

'lower effort job' is not a good argument. We should provide the right, 
the correct solution to the users, especially given the history behind 
sound/soc/intel/. catpt-driver and other changes were the steps in the 
right direction, this is yet another one. Once avs-driver is fully 
upstreamed, skylake-driver and its boards will be eventually removed - 
with avs-related boards replacing them.

upstream support 'window' differs Intel-Client-relation one. The exact 
same motivation driven catpt - regardless of the fact that support 
window was about to close. Saying "times out, I'm out" to the community 
is not the right thing to do when the users and the problems are still 
there.

> d) Ranjani, Peter, Bard, Rander and I are progressing to provide support
> for the 'cAVS' IPC, aka IPC v4 in the SOF driver, with a repartitioning
> to support multiple IPCs, and already have working prototypes with basic
> functionality from Skylake, KabyLake, ApolloLake to newer platforms. The
> patches will be submitted for the next kernel cycle after the Winter
> break, and clearly with this patchset there is no plan for any reuse.

That's something new..
avs-driver is a complete product, which is founded on the 
skylake-driver-refacting patches with some shared here, on alsa-devel in 
2019. 'complete product' is the opposite to 'basic functionaity' and 
given the current SOF-framework architecture, it does not align with 
cAVS firmware interface recommendations. I fear that's going into the 
exact same trap skylake-driver got into years ago.

> I've personally spent two weeks of my life reviewing this code, shared
> internally only on October 28, and trying to align. Obviously I wasn't
> successful and probably wasted my time...

That's almost six weeks on the list. Also, many experienced audio 
developers helped shape the solution long before than that. About 
wasting time - sorry to hear, but dozen or so other reviewers from audio 
and other groups do not feel that way. Most of your comments have been 
applied, same as for other comments. The remaining points of yours are 
left at "I don't understand" point. Such reasoning cannot lead to 
solution being implemented in the incorrect manner or against the 
recommendations.

> I completely disagree with Cezary and his management's decision to float
> 37 patches upstream as RFC, with more coming. This goes against
> everything we've tried to do in the last 3 years to improve Intel's
> standing. I don't think it's right to ask for feedback from the
> maintainers and community when internally we were unable to make
> progress. What can I say other than 'this is really sad'.

The management that owns SKL/KBL support and the vast majority of audio 
developers disagrees with your opinion. All this work is to provide the 
best for the community and some fresh view on subjects that have been 
left unattanded for too long. Last three years was a battle to repair 
all the mistakes introduced in sound/soc/intel for the community and the 
clients alike. IPG and the surrounding support teams received an 
excellent opinion and reviews addressing all the problems.

> The work in the SOF driver will continue regardless of what happens with
> this patchset, which I am not going to comment further on.
> 
> Cezary, I tried to help, didn't work, you're on your own now.

It's not "Cezary", it's Intel and IPG. Vast majority of developers is in 
favor of the decision made. The management is too. People found in 
SOF-framework team also commented and saw real, technical reasons behind 
this solution.

> Best of luck.

It's not about luck. It's about professionalism and bringing the best to 
the community.


Regards,
Czarek
