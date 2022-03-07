Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E15E94D04DA
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 18:03:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77CE91732;
	Mon,  7 Mar 2022 18:02:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77CE91732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646672616;
	bh=hulr+yAKBZytP5m4kDUyrzif4imAEmk6Bi2ct1ZUr3E=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NlOXZj9NdQvxgLu2vJdqFjIyI4yJNwKnuUaAKc6N31Sjopijz83SRJxmkqmqqm6Ym
	 uNsC9h77Grh69s5otYDYmv1Qbv0xC7nbwvr/5j6d61nV39Ul2LCMDsy3/B//u19HUp
	 9b3fQHYsI2N0ttDTjAR5P51/LQe21G1dcwqwi8S4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE2AEF800E9;
	Mon,  7 Mar 2022 18:02:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 008F2F800E9; Mon,  7 Mar 2022 18:02:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF21CF800E9
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 18:02:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF21CF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LYir4wEi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646672546; x=1678208546;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hulr+yAKBZytP5m4kDUyrzif4imAEmk6Bi2ct1ZUr3E=;
 b=LYir4wEi5donK2gg+UGlIULHdoJnDI733zmfGOjZDNlvTCaizxV3gWo8
 KkX45YVx9CaOhvJDjH815IhsRUOyUP3fo1IkQmHlANOy0CpfxE9sVteK4
 I0mykd6/ua3SG7qKvVDbttbseIGjMjV5tx0BLxDsqi/5uIRUOgciukL5S
 EySUKR+t5lWlKutlYAbXYzqZUEQWxrfVdksvFZJmY33bNAKaTC+YxiZhc
 8zooxftUVTx4Q6u4d6FkdrA1sp8/OJlg/Ulg38AbJWnXFPuMi2iLQ5uG3
 pUq57eyzeEmt90i0RNvjJukENIopYhxi6192c5dMgXF+oJRwue7ARqN8Q A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254174797"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="254174797"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 09:02:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="553236934"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga008.jf.intel.com with ESMTP; 07 Mar 2022 09:02:21 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Mar 2022 09:02:21 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Mar 2022 09:02:20 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 7 Mar 2022 09:02:20 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 7 Mar 2022 09:02:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9+Rtq/P5AdoF50h3cc4We1XnYYjq0hC6aQDi+D9yMETcaWQqFnWjfa+A/QF1cXby3HlBRq6Yq4e69ddHVMuDRXlB1ZjdCIe7Nxwsroj7//vYGMsULaya5/hKZPubD+ia+tc2vXwdyk7BZxRiv1JZ4oqGBGozhsIVcQjVRp0OT5XC+bWTqnS9yqyBHvryt5fX4D+VX3Xi1yPXuAxJg4oO2phWl7AmvmbFBwkCN64SFt4bnzO+PSStm/kP01PyV35oZInn+tUnPR8mkht+jiD1BAnH7rrppS39SkTx4+aB70hCXPw4qAH1MHGHsie5C6w1NUEVP1tA85xRRy7Wd/0rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSwZVLY8f4cX8VimWBL8FZNG5xuBDrdx1/pN4at8EUI=;
 b=c4I+toKY+oxaIBnMFvlFEHDcGklYShFgiwyI7bNXMNbpOS8MJZnOKLj8W1LzktpTmJaWId96Qam/2z6NKJowIH+mHmkdubZnV/f8x8iCJbOClaE+w4oSzldYJp9o1SpANzDXib3fCvCtxuS+SzQnPYslvPtU0yu8b3+T00e+AHMs7AfRi8Iath56s95e1Pwjg22lo8S0nTwTONHIh0t8alpmO92Uvy3aEYR3QLwL4D85jM++wrslgGdSlvvQeUAM184AqTeeUjrlv/6VfQ/qd8mx/9iT+VIhXkh2ZTJb/UOvpxhmT41ot+T2rcFBWk+M5B8mUsaKYu6EiN3XnuUjCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by SJ0PR11MB5790.namprd11.prod.outlook.com
 (2603:10b6:a03:422::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Mon, 7 Mar
 2022 17:02:18 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 17:02:18 +0000
Message-ID: <e26c1dff-1797-b18b-81fc-5a741006d399@intel.com>
Date: Mon, 7 Mar 2022 18:02:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH v3 10/17] ASoC: Intel: avs: Add basefw runtime-parameter
 requests
Content-Language: en-US
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-11-cezary.rojewski@intel.com>
 <2bc36351e4c14bd4b3d55f26eec2cda1b77e7728.camel@linux.intel.com>
 <b6cfd47b-1ff7-a012-f663-b7bb649be2a5@intel.com>
 <75e4e6e483a90057831fa8b9ab3ece6ef5cc2f12.camel@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <75e4e6e483a90057831fa8b9ab3ece6ef5cc2f12.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::17) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: feb64b68-091d-4301-4485-08da005c3c8f
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5790:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR11MB5790546C81C3CC2A28E0D31BE3089@SJ0PR11MB5790.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c+g1QIsIa3MQ5k4XMkyQKWfs2MV9Ec9GImUXLLxN4+WS/zpkIhD+tVhASm4Rq+T8cZz5dkH1Oj3OSJ2fSqH4T73s1U1lpKfHjSb2a4IMmI3Y8SQmPG9D2RqwJUbUFEgFReBOHkPPhLrDD01odzAbZGc9p2cazF6L5roXaXRyxFsRvSnQ9xCYQsCnFtezpECduhOoVhkjWpiYYgiUdZ3xCC7EkV6o5+VGDHNpFcVsaqwLV9GVYKZubrgqF53k2KBOJChOqjekgQdlYEAiMNJb/V3lLOwQfcjL7fC+TBsz3cgdgg0bBlvN9q3Oo1LZTAiMOm8LIG79CBrHG9bCZPRr5iWVgQctaga5UN1pGrUng8L4ctkQYnS7795tA5nW+RuPbxDzk/dC13xtVvxbYiWbste263BfD0w3MSaGrFPLElvarq35inl2nuIM/2MrNtHEPg4q3/NBBHEneKStXHNVNfzIEMTnzT9n/5d9vWHEc41WkRgpWUX3odvmvkTE4cVth19ringj4zOyqckQyfg+AFzxIy47mG+xRtuPwIIxANjqHh4AQizQQqoZnp4XnL8NmA+JPXulCnUNBIdWarP8HOI7SGiorTfBmvYzJzYTGUINwGFgQRtgCIO8kxvfz3SVSk1PfDF1YnbyLbGgGWKSx6YuK68tONgSsVCjdD0b9aPODMEtr1E5R9S1ruUztWGyu5FgYMkVRDiQs34C85uQU0fgiK/OSx/kNQE5XfRVCi4No1/wNHeQsH1YTyhLnHkp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(7416002)(53546011)(4326008)(6506007)(31696002)(86362001)(8676002)(8936002)(66946007)(66556008)(66476007)(508600001)(2616005)(6486002)(44832011)(82960400001)(6512007)(31686004)(316002)(36756003)(38100700002)(186003)(5660300002)(26005)(2906002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2wzN1hkcVhuM2hQMmc1N1k0ajVZT0E5alR4bVE5NzJQMnhrU3dkeDd0Ym91?=
 =?utf-8?B?aDJxMDloM09vNWdOdnFUMTZCcUs2cUc0cW8wU2F4RFh0YXY2VzNMRE4yTEw5?=
 =?utf-8?B?N1Vibjlad3pCQVdLRkJRSHhnazZQMVJISndmbzFVcTB3c1V4Y3NwakkxWHJV?=
 =?utf-8?B?M0pPem9vbzdzRGJ3WW5uSjVPTU9seTA5enE4Z2Nic3dHSlpsdjZ3b0Y0L2lB?=
 =?utf-8?B?empJV1N6RHE3QXlwd0NMSXJjK1NKQnZLN3Vza3FxRXRMeVllVUNySUZGR0tw?=
 =?utf-8?B?Q2hHODRsblNKNGJPelRDdTJnRXl1cHJ6ek5LNUpML1BPS0pYZmdGc1kwMVJK?=
 =?utf-8?B?MWZkU0dYb1NiYnNrdWpQZmtiYVJwcjE3dk0waFErVTlOak1aUUZ6V2VVQ1NL?=
 =?utf-8?B?WlhBNlg1WTFrTmVIc1NxM0p3d2pXQmNRNWFwblF4M2dpdVMzbzAveDBJcWpE?=
 =?utf-8?B?U3ZWcnd1VUFtMG9CcFA1QmYxSWhmck9lM3NCdGpTQllOYUMvd0ZwK0FVbm9S?=
 =?utf-8?B?Vzl3TWNDeFZKaHY2V1Z1Qm82dXpIeWZWWHcrOTk3ckJIU0RmN2laVXNPWm1k?=
 =?utf-8?B?c1F5dzRaT1NBV0YvZWhqTVJCaVV2TUZlYmtlTnlRWXZRV29yWlAreDAvSmpx?=
 =?utf-8?B?Wi9jU09Wa003NUp5dFp2TExOMXoxazkyNGJIZUtNTUhpblVKMHZja0lXekZm?=
 =?utf-8?B?b2g5YU02bzk4WnFER2NXeFNINFErNXNSWkV3d0dObHNsYkdMeHRmTjlWL2Np?=
 =?utf-8?B?V3Z5K2VtVGl6TTFCeXg2OHJneEJ5YklZNWdOeXB0STIyOHVQcEZ4cDY3VnRJ?=
 =?utf-8?B?bVZRN3l5cW5hN3dtdkFaN04rZGlvcTJ6Z29vRWM5WGxkaHE3bDhiZ2FvUGdi?=
 =?utf-8?B?eWFJamtxRGlTS0c0S1lZWG93LzdSVDJyQzBUdTZyRmlUbHdvTmw5MUd5SVZi?=
 =?utf-8?B?ellxRlBQZTU2Z1JzWEhHS1VFMUliMzlFWnNGZEc2eVNsMm03dHpaanBoaDhO?=
 =?utf-8?B?ZFY5Mm9QRnZkYU51bTlVeE9FSW5lbm5ET2xxWDdvd2lad1pZZzdMMWwxOGhr?=
 =?utf-8?B?Rng4NWFIUURESXR4Z21rWjdqL2Z4RytXeXJiUDhDZlQ4VFQ1V3VDSjRjSDdZ?=
 =?utf-8?B?Mlg2ZE1KL2V4Z1BmcFAxZHk5WSs1d1NKYzM0aDIxdTVDTnQwa0VUUFhaMnFC?=
 =?utf-8?B?SUoycXpEMGFtd1RXSlo3R0hzeGF2V3lHdlgzWkxkQVRLWFJPOG44STBYaWxt?=
 =?utf-8?B?YUw3RGNvWmd2SnhzWC9GdHFDUUF2K2U1aE8vbndrNlQ3UHFRVXJLV0tiWUxN?=
 =?utf-8?B?cDkzSG1qd056Z0J4Qll2ZEh5a3NjVlJnQTV6SmhJMXNEb2N0MEZlc1o2V2pG?=
 =?utf-8?B?MGJBL0JxTTRGUXFVU1hQbDJ4NmE1TUZ6aW9YQ05sS0xHaVdlaytNQzlybjFl?=
 =?utf-8?B?K3BMdDVCcWhZWnQyTWdFcHJXMDVzTXpyWmNBdlp3bDQ1Q2p1QW1sNHZaOGdz?=
 =?utf-8?B?MWQwZlozNGc3NjNXanRIRVlMWUpzYkkyR0dZS3ZZWndpSEpValMxMkxDL0xL?=
 =?utf-8?B?eVcwR083c1VpRnVFSWxmcy9LaDJUbXlLOGYweWQ4ZzB2QTJxRXF2ZFphNE5V?=
 =?utf-8?B?TVh1TXk1MWNjeUZmY3o2c3oraFRMNS8vS044ZEsrWlRqVWNqSFNWTU9tV01W?=
 =?utf-8?B?cUdWbFZVaWtpd1k2bXhmbW5jMER4SCtEMDh2YnNMSUdQNWhzUndQenJSNGJJ?=
 =?utf-8?B?M3BhZTlBUm80cVhjblFOMkNOejQ1TDhWbzNack1EekJlUXhzL0FkYW1tNzFu?=
 =?utf-8?B?UklJUkxWL0RyQmlNTE5OcEt6WmQ3dDU3cUp0RG9KZ1NiMUNCKzExYWlSZzVt?=
 =?utf-8?B?eFJIbTQwTVcvOGQ5WG9XWU96WERtZXZxa1B2SG5QNWF4NGEwMlI3QUNCUHZy?=
 =?utf-8?B?azFtUUs1NlcyN25vWDE2dXZ0Uld4VXU3SC82OTlOMDlOTGVKbmVRTVQyMjY4?=
 =?utf-8?B?bHUxSzdzK3JDOTdmWnk3aFZtcTJ1ZXRjSms2SmV1U2d2bTNDc2VlM2NPQjRa?=
 =?utf-8?B?NmptRzc2STVnYTJTK3FQV2pHVFQvRlZlU3YrRG1IZnpmQXpzM2x1MDU2enFE?=
 =?utf-8?B?eUxqSXluYTBiRWU1dEdYTE5MWk93cFI4SmU3VzRtRkIySGNuSGxyd0puN2Nx?=
 =?utf-8?B?WFVOOG1FeTRnTEZDelR4WnNYMWtyc3NSbGdxU3BVZkljeHRwdmlIRHNNNGRT?=
 =?utf-8?Q?kGauXOCPYEMjJRkbcc/6kH/aBhuPfwBqvj7l3smoGU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: feb64b68-091d-4301-4485-08da005c3c8f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 17:02:18.2484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0IH94ji0Q89CGLU7dgqlNuhZdP2Cktb9HSal1vo6Z/8kqnUORxuNDdzs4HdFrTX2VqkzHPzLNdhmkKOblIjVUz8Jk7AzBFoEcqNDnV1pXPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5790
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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

On 2022-03-07 5:41 PM, Ranjani Sridharan wrote:
>>>> +	kfree(payload);
>>> I think it would be easier to understand this kfree if payload was
>>> also
>>> allocated in this function in stead of inside the
>>> get_large_config().
>>
>> That's a good thinking. There was an internal conversation regarding
>> this back in time when we have been implementing getters for the
>> first
>> time. There are no clear victors, there are drawbacks - as you do
>> not
>> know the size upfront, caller has to guess and then reallocate the
>> buffer accordingly to retrieved payload size from the firmware. So,
>> even
>> if you allocate buffer here, chances are, it's not the same buffer
>> when
>> the avs_ipc_get_large_config() returns to the caller.
>>
>> We have decided to reduce the code size by letting the single,
>> common
>> handler do the allocation and leave the other responsibilities to
>> the
>> caller.
> 
> What could make it simpler is if you allocate MAX IPC size for payload
> in this function and then copy the right size in the
> avs_ipc_get_large_config(). payload_size tells you that information
> anyway right?


As stated, there is no clear winner here - you had to repeat such code 
for every getter.

Since we are getting payload_size already, retrieving payload itself is 
just fine.


Regards,
Czarek
