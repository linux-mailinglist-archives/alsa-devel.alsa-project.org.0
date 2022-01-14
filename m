Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2E048EDB1
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jan 2022 17:09:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1681F1B29;
	Fri, 14 Jan 2022 17:08:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1681F1B29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642176576;
	bh=UJwOaZVYTNNeDdo80F3NS4Ei/8SHoPzXmB8++zQz1PY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uA0J7pktE9BEvrRIWHFB3U661r2cXF2cNK9vE6L8fL5zse77nOZp5BMN4S2z6uICW
	 Vq2KKxgWXXn+yWrlQVgJHl2XxcSb66yNsnaB5VVbZb7M0ti4334/vZZTykoanNUAPb
	 q9KjWUu6AZEVVPyJf9fNqxvqa5bEmkEWz9m1rthU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71876F80310;
	Fri, 14 Jan 2022 17:08:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C006F80141; Fri, 14 Jan 2022 17:08:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27116F80141
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 17:08:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27116F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ByLHzWm2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642176501; x=1673712501;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UJwOaZVYTNNeDdo80F3NS4Ei/8SHoPzXmB8++zQz1PY=;
 b=ByLHzWm2vn8Iv+I0PK0rKqx2M4Sqy+0vxwwXiH8oi+xkx/2vb2XCBBUC
 inMt4sozHy/ddFaRTT4s8+714+kXzL/VGLm4iIGfxAiO3B+TvCiXeJeUN
 wqfd+TgrFO0Mcpe2TVFSWshAwToAdkOczCfSH5noAwxUL5rnxpbqDFizl
 8g29u5ZEfQRiy/PVeNvyWpvElA/rfjOcwNOnmaOPXe0zUhVmBOAtQr4VR
 589bfyfi1iGabpw2zP2HF1n/IZDrM3baULFwMxH0v+Ppk7JqWycSQPvGD
 XHoVP3BNgJZs7Op46tZoXP340nvL/9IdLyDRfohVmQUxopzT0Dmq3EuLj A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="244067270"
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; d="scan'208";a="244067270"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2022 08:08:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; d="scan'208";a="692256632"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga005.jf.intel.com with ESMTP; 14 Jan 2022 08:07:08 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 14 Jan 2022 08:07:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 14 Jan 2022 08:07:07 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 14 Jan 2022 08:07:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4/bBqRbBHILkt59F1nI2JptqL49ztrujmr2+z2iSXMbA6z68TRV9DjVjdy2n2J3yhRr/zKe0ZvMUj2mY7No1Yqg9amtOkk8/F4OJq9tou8oGzgxWJDK6iIOw2Rf+5c7vUITBbO+4syhecT+DhJGbxo9MbQlwiKfFFpbsV9g4HqRROYpUXQ/FWPF0to4+/ap4KyKgyVapdOhEBe06hWbiRwRDWV0E4/oUZ2X7+BA8RNsb9z+2/Wam4hpLSekKW/EHtme56vgcJHVkSFPfKSIM+xg/YH8IcdmtmBtlnzfGPnDmpLpcTvs0u/i+ApgeydLd7fCovZlWnYdHM1ORMfoGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gzTKay7CfpeBCFQ94+G/2S66w7n4C1bDmN9bAjCNsI=;
 b=Z4Z4HJ/7H4KgWZEaJSxBc0uV8uNtiqv2yg720ltCc5i+vxhHqAtmivHWtb84w2XW+jFW0wtY04eoaN2g8+P63kNenhcGAnmo/VV9a+TWuOtU44vGuW+bp+t9blSXq+/5I049LkK91XkMiPOm2M0x2V8SaXBZBUyNagyGf/SU+meymM8Ktg6L4yDLkO7l/9lOfy0GDQtXwmyWKskWxISI6H5aaV6Z8nK8cH13vvb0duuo+dfznT3lt7PlAhTex6iPpH7nEvWLrMZ+sibVniR3JPzsQSVlcqszEewM6g5WB7LA7/yH7zAl/y+q0l8KrafWkKUY2J2CiBE/n6GmZTTXhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN6PR11MB4068.namprd11.prod.outlook.com (2603:10b6:405:7c::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 16:07:05 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26%4]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 16:07:05 +0000
Message-ID: <41dca7c3-2d82-ab8c-9025-547c30f67db8@intel.com>
Date: Fri, 14 Jan 2022 17:06:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.0
Subject: Re: [PATCH 1/5] ALSA: hda: cs35l41: Avoid overwriting register patch
Content-Language: en-US
To: Lucas Tanure <tanureal@opensource.cirrus.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20220113170728.1953559-1-tanureal@opensource.cirrus.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220113170728.1953559-1-tanureal@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::16) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5676451-6dab-4a7c-5cd9-08d9d777e849
X-MS-TrafficTypeDiagnostic: BN6PR11MB4068:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB4068FC42D13A304EFE1A540EE3549@BN6PR11MB4068.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:274;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qnBA5i94qsZ/VpJ9nsYxCQMP5+fSV0hexsAAn5DJsVh/TzxUlqitznyumxgbSpF68ql2P/K1/PDxwLpAh6TQ+Qs3bc9aymSpqMb69ws5bXuOj6CYVFnL4+4CsIZvfgfOoDqC6oERh513cuz19NS2iu45hKNZNVhDc6QgL+4S/8PNVqMqiuSV5YdRlOhuozgLigkYzg9ICB4vG0I2+sdCzY8+8yfiGdnQ1llSBwKV0VC9FcJ7wFsxjYCHcSFhBm84NkHmSgXJwno27Y3WhOgq5QNvdv5ny4gsEjz3TdNEeOh/iQBEUW7IyxmhRcrYT0l0AC/d+EPUbV8Z1W5Kv/qtwO6Vevc8IC3n5Zaq6jIpQbWSX55NAaEP1p4AynWzpUTp6MSWweLgkxOx1U8rz40jw0RCCTEJkIokSXM61CU3NeGXb6UXTWGvzNDdTjeOQB2D9hzHDLvCiHuGEZlS2so/ZTDSIe6p3gRtta2/Ceae+8YmzfkW5UBtX0spZmatIhw96l+zRDF67RZzunwgbPLbshwxOleVy43XTWaBPB6o5TOXw/s+fVKZ+2GDE3d93iELW++LcxRyqGNFGA+pWaRUbF2o3n2VhR4MpnVCUwPPei+GN8zyIfVgqvGHLBzwgMDSV4BmOyTDAP+IUEfwzL25PtPooGbAOkpkv/4k901RMSH4EyCbCiDBEb/gTzdCJGufZpOFmbvtkxtaFGQm6ivctKOj6mSIqMJ+SA0WSaZ4DaQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(82960400001)(6666004)(186003)(36756003)(2616005)(38100700002)(26005)(6486002)(6512007)(7416002)(6506007)(31686004)(316002)(110136005)(8676002)(5660300002)(66556008)(66946007)(8936002)(44832011)(508600001)(31696002)(86362001)(83380400001)(66476007)(2906002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTFNZ2I4WGlRV3ppaVRlOEJ1K2g5V3psK2k3QlVzUWJrMVZKbjdwdTc5YWJC?=
 =?utf-8?B?ZkpSVmxuQ2kyQnJpWWJDUlhhY1dpWHBOdkFWSkFtRS9xSzlOZG9XTkp3U2dw?=
 =?utf-8?B?SUkwSFFFQWMyWE1GS2hqZVBpajl3R1lmcUh2eER2WVR5SEVLSzE1N3ZqWnps?=
 =?utf-8?B?empEeTdkbVBsT080RStSV2RONDFPdWNvc05neWRGMlI3b1U2a1RTcFFid0tX?=
 =?utf-8?B?ZlVKWVpYdi8yR2gzalFndXQ0WEVtSXJQdk9LZnRkZmw5dmlpd01NQnRvVVVO?=
 =?utf-8?B?c2Rzb1U2OURkejRvSDFlaTVNa3BsUWE4WWlBN29yYSs4SFRrenAvUDZUZU9D?=
 =?utf-8?B?S2VWM0NnRE1GUlkrWm9rTG4wQnBWSTZTbXJXR2o3SnNsaEYyVGt2R1NoNm9D?=
 =?utf-8?B?dnZSUCtmT1orRTd6bDRGNUVZa1QyV2laN2JQa0VvK2EyRlFMQnNKaXBMaW9a?=
 =?utf-8?B?Z3NNNTVyaldickhmb0huUFBnSGwwcHJGYmhNZ0MwTWFucmdiQjJMWXhKTWE4?=
 =?utf-8?B?aUU3bzEzY3VGdHFzUE0wZWZGVG9URlJ6cEFkTTRQaXlvN3ZldjI0eWJaTzY2?=
 =?utf-8?B?Y2s1RFFzR3VaTmlYMEJHaXJIZzMzd3FMUG13UmViMmpuSW40dXptbTN6ZW5O?=
 =?utf-8?B?SVErVHd0VVJxcEtMbEZtQkdYcXN3NDh5SDl5UERpOHdKL0NJSFdrSVpQOTUz?=
 =?utf-8?B?UTFPcHpOUjUrb2VkcGdnQ2tSVFRGYmpUOS9JMU9mWXV4QUFzU3BMd2FvbUFv?=
 =?utf-8?B?SUdmMEcyTzNLTUM4eDNudnJ3c2Z2ZG5mTTlXNHV2TnZvNGhJSmhTc0pPcjc0?=
 =?utf-8?B?Nk5RNjUyUFVaWnpyYXR0N3dkR0pMbTcyaUhLOFZMajJ1WVc2NU5ob1g0dWNY?=
 =?utf-8?B?STRId0pDMGtwbHRzQ0Q3azR0NTN5U3QrQUZiVHRNSVBXamFQQVlkaDVFbU8r?=
 =?utf-8?B?N1VEUDd0T1gwTHM3aXNGMWtwdmR5SG9maE9JSWloc01LdHBFK0t0MmpIWVBY?=
 =?utf-8?B?azdFdi9TNmMxZnE5OWQrZHU1Y2pWc0RhQnUxZ2ZYNHdma0V2Wkp0UE82emE3?=
 =?utf-8?B?VnVEZkhDTHJlVlhZNzZBbXZZZkQ4ck1FN291NXlIRlJKOVdqVDY4cmNsencw?=
 =?utf-8?B?RENwMENoWjNZdktFUlJCNytYUnZLT01GcDNtbUswbUFZbkhiV0psOG5xWXN2?=
 =?utf-8?B?OTlkSG1ja2ZUbzVxT1VwOVdHWitKWU0xWUxWNXFCcWV5MHVzUHJRSENud284?=
 =?utf-8?B?MTNDUlhvTmJqSlBYNUFHdFJYTzR2amtWQmZ4eGthbEJ4Q1AyWGFxZjRUSjJT?=
 =?utf-8?B?V2dwdUdmb1ZPalVZV21EVVdaNzNBWWk1dVJNSHl4RnNDOGhIRFBIOEdKNGRi?=
 =?utf-8?B?K3BzcGU1UDk5WUczQjdBNnRwZU9SNnZ4czlUVi9jdDMzRlNrMlVjaVpkK0Jn?=
 =?utf-8?B?blZXQnpvVVN0NEhHNW0vZm9RM28rOWlnUEpMMW1yQ1ZpUFlINC9rVk4xN2Ju?=
 =?utf-8?B?QkVGOVlOakFGeUpwNFlHdE1lTE5QcWgzS3lmU0c0bTlQNHlvb3JINms3dmRz?=
 =?utf-8?B?YjE0OGxkcU9ieWU0cGxWNzBpUEpzL0d4WGg5dGV2S1VyNmQ4QW5IRzV2R2R0?=
 =?utf-8?B?WndWNk9sNjNNeDlaM29vamFVUkQ0TGVmS1huZnBOL3oyZmpMY0p4aStsQ3ZD?=
 =?utf-8?B?bHVwenZneVJIZ0ZraDlzSjhZYmplVnlCbXd6eU1qWnl6TTRDK3hKcnJzUkFV?=
 =?utf-8?B?QytvTlk2c2FOV2Y4dGl4NjJqNjk0RUtrbEhZMWkxNFpIdXhrRTYybENDK2NX?=
 =?utf-8?B?VEVNYllEZm5SV0QwUHVXVHRkekdqRU1scnU2UGkvU3Z1ZERNYzBPK0dqQUFG?=
 =?utf-8?B?QWlGTHhLSXdBb2lkZmpmMko2dVVPT2R4NVZKMlJnY1c3dG9XclpBRWR0Q3dj?=
 =?utf-8?B?bFFScW1XMmZ3bEZucS9qa1hZbjVoYjNYWWo1dnNkN0c1RXhZVUdycDhITndz?=
 =?utf-8?B?OXBEek5jSEJRWERtMnpkeEhiUUFmYWZwT3NVK2FSVEZlYmVmRlJjbEFKQmp6?=
 =?utf-8?B?eVp5bzdLV2JyVEh3QlBKN2haVVpNYWU1RXJyeFE1aHhKaHl3QkNjWkVGT3JU?=
 =?utf-8?B?WGxkQnp4NkNSenhiK1lxQ2dSdVhHaDVTckJIMzhIdjUvOE95dmp6YVlUOGNa?=
 =?utf-8?B?SFdqQjhQM0phSlJsMVFSaWtLMUVFY0NVV0NwaElSbjRyeXB2S2JPVlV0SllT?=
 =?utf-8?B?MVRQY2U5a3VZRzh3bHNPMEpLQStnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5676451-6dab-4a7c-5cd9-08d9d777e849
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 16:07:05.0176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zf/zyg3+9hIlseaMzQZZuc2CjtWPOtkuTt9uGp7os7Hyk9bSoTGCnsQzizqsVxUQoafkzMKzb+KI7N9PKBV/vGbDev9Ab4Xx6tyvoJJg8NY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4068
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org
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

On 2022-01-13 6:07 PM, Lucas Tanure wrote:
> From: Charles Keepax <ckeepax@opensource.cirrus.com>
> 
> regmap_register_patch can't be used to apply the probe sequence as a
> patch is already registers with the regmap by
> cs35l41_register_errata_patch and only a single patch can be attached to
> a single regmap. The driver doesn't currently rely on a cache sync to
> re-apply this probe sequence so simply switch it to a multi write.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>

Please correct me if I'm wrong, but this change looks like a fix for the 
previously added commit:
ALSA: hda: cs35l41: Add support for CS35L41 in HDA systems

and so it would be good to append appropriate 'Fixes' tag here.

> ---
>   sound/pci/hda/cs35l41_hda.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
> index 30b40d865863..c47c5f0b4e59 100644
> --- a/sound/pci/hda/cs35l41_hda.c
> +++ b/sound/pci/hda/cs35l41_hda.c
> @@ -480,7 +480,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
>   	acpi_hw_cfg = NULL;
>   
>   	if (cs35l41->reg_seq->probe) {
> -		ret = regmap_register_patch(cs35l41->regmap, cs35l41->reg_seq->probe,
> +		ret = regmap_multi_reg_write(cs35l41->regmap, cs35l41->reg_seq->probe,
>   					    cs35l41->reg_seq->num_probe);
>   		if (ret) {
>   			dev_err(cs35l41->dev, "Fail to apply probe reg patch: %d\n", ret);
> 
