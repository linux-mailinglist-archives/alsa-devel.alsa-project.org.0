Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC8E5717CE
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 12:59:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EE33163E;
	Tue, 12 Jul 2022 12:58:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EE33163E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657623578;
	bh=KTLU1RTIG9itgXflQCVS7BVLumD425gO9aFz6+Li+0I=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DSy8+/GckPfwgnnaLN8Ku5JV8D0Pyv7o612zOklAcjGciYk8F+ckKfwyaJEijlHTS
	 HPDn1Aogt+8INbGuCyfI6tBua1cWXuKzSjle5HEQTgFSWOmwg0bN6UI2u6OZSoWUM7
	 IO6miXECodqXmjaGqRQjWRjTS+jCnuLZYGRD0n8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7493F800E8;
	Tue, 12 Jul 2022 12:58:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 055DEF80246; Tue, 12 Jul 2022 12:58:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F56DF8012B
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 12:58:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F56DF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="curQawrm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657623514; x=1689159514;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KTLU1RTIG9itgXflQCVS7BVLumD425gO9aFz6+Li+0I=;
 b=curQawrmi1tmtVIcb7fYr70f6P4r6oV0uWfkjrJD6mIQMtZthxQkHgUE
 dSZX+ZqTfchP+Z5ATGBnErWDmsr+V/v5u3czBEOnHT8rxIxbNQmRolYh+
 B9MMkTE/mB5zNRDrwRuXPZAYbD+e0pXQ6l4xX4c8SC2WU4JgSoyw4RMas
 QiFBJD0OBuN+UqE4AJDO+EW5KkYzM1h/s6etGmPFQDtcN7ADkO/hLNPLm
 seJC21KzkVQb+Be6zRx+j41x5GMhTEEa5IHS488V/naGWIHGPffOf89+M
 N3A3fdmPeCOOncHijNKSraiebphqUoCmYpwtqolhKPI7kG19iiEwKRdDA w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="346584444"
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="346584444"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 03:58:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="545385045"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga003.jf.intel.com with ESMTP; 12 Jul 2022 03:58:18 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Jul 2022 03:58:18 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 12 Jul 2022 03:58:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 12 Jul 2022 03:58:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrMGW8Y9TdEm5otvnnBxSpxSU/ZIAnihg6huv4v2PRi5ggbfZDJ9YvT+zF2eHT0TF5G6SvesR1xBymjIIezKEIjt8zoYP/nfHE9CdnsPD2c9bJ5jnbh5HbUjAlLsdJxPzH97vb2N6ycf5jqsKREE7kFFR7iQhkR8vcBjse2qDyNZu/hvWT8ROxH0xn+rRffUWq5wBbauxJj+jT7Mjc2wGD9YNu3nJzglseJbrEpl5zil/oExnwE9P6ejnCSj/vF9/Igw5kwFw6WqgYxhB90o0mHjQDYa6LvNFZRZZNOXk3YLKNLoVUKVKQYvRKKXCd2PzGr9N7v8WOQvLoXU8+8eIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuFgHiaf/fnMbZWx/NKemQFtnUiIeUBkWtp94Q6mzfA=;
 b=WmJ7KKrvKqCtAd5frD95ydVDk4uvXQeDQnkB2cchlOXcCfo5/5HnZ89zN6z8jRHyqhQ7BVFXdptzKZYZLDdwI/GC3ltGpLDqqFdKFlsQ/UtIomPxCmMLVDrsxkoZgSyXpu/i6D5pDuOLn4JgMdDlnPr+yT3L8zqOjFRDiQDbUjMBYpaW+CRujO/YrMr3RnNEI4NGEaoW49ADEcDSQneImbAs6WEDl2o2bkr6TCoSnCLBEd/gXaLLVNyvulurIi2zez/ilic/bJTux9wf3WBFZA2kTWdxJpxhVF/UEFvJqMbSiwYuGkxHhyBrEBe1b60K1h6RLQU4takd6XpLb8Yelg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DM6PR11MB4154.namprd11.prod.outlook.com (2603:10b6:5:191::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.23; Tue, 12 Jul 2022 10:58:16 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8b5:ae20:1c12:421b]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8b5:ae20:1c12:421b%7]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 10:58:16 +0000
Message-ID: <ea75b058-5716-f07a-c37e-ab9b9c945f60@intel.com>
Date: Tue, 12 Jul 2022 12:58:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 1/9] ALSA: hda: Do not unset preset when cleaning up codec
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220706120230.427296-1-cezary.rojewski@intel.com>
 <20220706120230.427296-2-cezary.rojewski@intel.com>
 <878rp2i6sj.wl-tiwai@suse.de>
 <2966b410-f00d-9b33-fcfa-30d484455579@intel.com>
 <877d4jsppp.wl-tiwai@suse.de>
 <8bdd56fc-de6b-381e-24f5-5d2c28e337f7@intel.com>
 <874jzmr4lg.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <874jzmr4lg.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0749.eurprd06.prod.outlook.com
 (2603:10a6:20b:487::35) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10a6cad6-3566-4cc7-b074-08da63f56c40
X-MS-TrafficTypeDiagnostic: DM6PR11MB4154:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K+2uTnThek9/J9GNduet0r8IaCeg3QdWo8/GKD+xlYiu2ShJN+rhiel2weKrZroTx5PwjLEqdeRiAH+9ULKu81FsqONNXZWUmEIqtOd/OHDkzuTYh7/DO8+JVHdC0NYhtbduMSopuHG8X4JiFVjSNqUbZCltYa8Up4YHkys2ZXpVp6S+ZatxN7O2eCO3C4ihiPRY2qgPeSu+QstRrbA+6SPeRXy3AQkUJLtO/RgYLuoEr+A6lrFQgjB/7H7FYbyEDsrbL6h/fqgi4JmBymAuCV2lX4O+e4ulhintZVI+4GM9BJ6i+q0KauZqlkWb3GJjfS0uKohhy5gTjLuY2HTsGmB2wYIYuhY4R8a55DzSanyco6FI9mfNtPmyC/+mkQIRIifIU+TMbLjzE0I68mEpP5Sw4PRiCkYRRSYpRAyfeoDRccxkqIhr5asswLg5mhJNsqD8ahFLvuY8fl1klWylNFx+vMF5XuPZkztrIjKUXi66D41zYI1CYCh7DX9N44xuVu7IwfHmx2nquHqwRW0u+VQVPicuY2IrCZwiVwwEFP2YWtgt5tXCAx5liF4jtFUXPITeZa8Rf9vCbga1b82mUz/LybqM65Y9Nliyg6jlXdSqD76YutwiEGOD5q4L7bWqWWT2kgTsMNoe286T5Z+5luhqsk+gXAJpzLexg8W2Na+uq6ADiLuRlM3DoVsnCJ9P15gLKDJsdsmSVbk7VxsYbtl0QMYaxgD0AveXkY/IaapasBKL6IVhOcEAUws7S0dWEwUzOEiGRvhEZFphbseZVDzqXYt+/9m8ZEdLPZn30gycFp77r2LWTnEssan0LQGFegUPllXACPemDd/ow4f5hg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(346002)(366004)(396003)(136003)(376002)(83380400001)(4326008)(8676002)(66556008)(38100700002)(186003)(66476007)(2616005)(66946007)(31696002)(8936002)(86362001)(82960400001)(6506007)(44832011)(2906002)(316002)(5660300002)(53546011)(6916009)(6486002)(41300700001)(6512007)(6666004)(26005)(36756003)(31686004)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkU2V0FITXdUb2thT3pzdm9wbEtrNzBIY3FFZzhXSXJEakVsT1JhMTNGQ3g2?=
 =?utf-8?B?UUg1RjJMc0Q3K0pLUjJvRmU5b0tlMEhFSnM0Rk1EdG1aZjZiM0lTeStodkpo?=
 =?utf-8?B?SkQrckZlWUNpTHJrR04rQzdXTEx6UzdEL2p3Ulp4bjQrTmQzQW9PR212U2dR?=
 =?utf-8?B?WFdSKy8yU3R1dkRQejFrOU5iZFJRYzA5eWNJalFtek04SE5oSWttdzIwUTRR?=
 =?utf-8?B?RVJ3RkltQWYrZlBGb3E4WmxwQlpsOWVIWFNvcVJIWEtObkl5Wkh6QkZxbmJL?=
 =?utf-8?B?Z0gzcG51RWxyWmRvcjhBSUdmWGU1QmdWUm5DY2dVY1dlbnN3aUxOb1R3SE52?=
 =?utf-8?B?ZFZiL0wvdU4yRkJLWTNuNkpNNXVxSENFYmV1RFdiMlJDcGpDTEppTGlQMFZ6?=
 =?utf-8?B?VWJmVEJJZ3VzLzZsY29qODRoTUc4YXk0UGRDeFZoVExjTDZLMlo4eXhjeDFH?=
 =?utf-8?B?N0EvbDJhTkMvcFhHZitwaXd6Y3lSeHZ1L0ozdWxOeWJ6YzdIamJkaHlUYVN4?=
 =?utf-8?B?Z08vcmdHOUNlUmkwZndGN3FMV2xDQVZ1dHBrSXk2SThneXZiTGtUTUppdTU5?=
 =?utf-8?B?NkhKcmJtWFo2NWs1TVlCU3pYOCtvbFVCb1M5WHhRZE1NU1Q0VG4zWHMvTURN?=
 =?utf-8?B?V09DanJnNDUxMGdkVHU2YUVFb2l6VkFWRU9xeVFjUzVUSVFBbXF0Qlh0NDVI?=
 =?utf-8?B?UldFSGtIZDN5S0lKOVpuWkZLYjExaEI0Zm9DUDFIejlpYlo5VXMrVU5rZ1M2?=
 =?utf-8?B?QlBBMlpreDhOUTdrNWFyeUU4WVY3Zk13b0FYRitqVWJWUmpEUTlzejlSSEcr?=
 =?utf-8?B?ZFpxMkVFb016K0ViSVhwUmlSeG9CZHVQcFZCbkFPcFVIUGNNaFdxWWpYQ2xp?=
 =?utf-8?B?QlJTR2JlUGZmMHZmUVdHYWZpakRNWlpFeE1jcEl3Y1BUWnB6ZWI4Wmt4LzNU?=
 =?utf-8?B?dWljaVJIU2t4QkUzT2VaWTZXTi81NU83SlU0eUNLN1MrNEtjSkxqQVJUbTkx?=
 =?utf-8?B?OFRuV0YySHlPZDVUMHIwOUttMXR6elJCbFBieW1ycUFSalk5aW5GTjMxYXN5?=
 =?utf-8?B?MFJoSmJiU1p6UG03WFZFWFNYVmtyRk9CODYzeEkxbEZpekFPR1RBOW5SR2M2?=
 =?utf-8?B?WFBmdGZ4d0k3NWZUZDRucFJleW0zZnFwWDkrQXppK1BSekxJZFhPNi8rdGZP?=
 =?utf-8?B?NTlSTlZDOEFPNlNXZlZCb3hxUmNMYnFIOHVYNTIyL0NFRVpudklMWGk1Nldi?=
 =?utf-8?B?eFdoQ2lPV0ZRK1N6dlV4WUMrdkNuZW9QZEQydFNPTkZwWVAyNFN0ZGo4QW5V?=
 =?utf-8?B?YnZ5T1JvL2J2dk1NTm5OK0wrNm9KZk14UVFoZlY5S3M5QzVqeDBkczFNZUFZ?=
 =?utf-8?B?akZBT2QvODZtUXc5OUR5WVJ0V0tzZFdYekcvQzFYcTJnWmtQRVpiQXRSTWQv?=
 =?utf-8?B?ZGFmeDNGSW5abFFmUDkrcDNrOGl0M1hBUzlTcm03ZVpnbkI0OFRJdWE3dWNl?=
 =?utf-8?B?MDZiSlkrN25IN0VHSzBqdThsRm9EL09pTWJwUE9IK3Y4TWlhTTJ0aFJzUWtq?=
 =?utf-8?B?ODA1bWpIenhqZTBNM2JWSEQ3VkRudVI4eHdDSFFoZW9zQXpNWGkwbHgrRmVw?=
 =?utf-8?B?UnovWUJSSUgrSkR2S2t6NXE5VStYOVM5OUtLWFlwOFgvbUhZem5RbHkwcnNj?=
 =?utf-8?B?MEtlOHdZUHJ0TjNBY1RDWVk5QXJYRVFDZWFYZXdZMWZhWVlndjhxakd6NDJa?=
 =?utf-8?B?NFp0Si9jdytwQ3RnU0NRWU85RUU5ZmNQV2t0Z1dEeERES2tLSDZ0eVVsZWRK?=
 =?utf-8?B?NXppbFVpSmpSV2JwSUdPTTRJV3NManBYR3NxREQxTDROS2tDK0tkU1lKQ2FZ?=
 =?utf-8?B?cGF4aWc5V1N4NEQwbFlEeWFVV2dqQTF5c0twZEJlUEFleXZtMzNqaWRRQVMz?=
 =?utf-8?B?RUcvVkY5dm5EZ2dHTktEUE5URjRjVU9KeXdlTEx4eGM0cllGeDZzRzgxUzRW?=
 =?utf-8?B?Yy9OdmpYR2JGY25CcUVEWFpjVHpPNThINXJXaTZHaThrMVVrb3d2U3o1aFRt?=
 =?utf-8?B?WUpTOEV4YjBobXVqd1pxOC9EZUgycXZPYWQxTVR4VFJXQTArd2ovRC9lcW5a?=
 =?utf-8?B?OWEvS09vVndZeGhpQ0wxRXdwaGVIYkNTdHVkZ3k0QkdDQkF1aHZaeU5YYWM0?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a6cad6-3566-4cc7-b074-08da63f56c40
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 10:58:16.2849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FxbwM53WJ3CcZqy7W5OH1ZAna6H6r4KqfGR7sPLdrhPhrWEqMhTVr+dzKeIoD7vlsMlaZ3/qpTaUcI6zCAJOcq8+960ZHH2nYzbAe33sWok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4154
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com
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

On 2022-07-12 12:46 PM, Takashi Iwai wrote:
> On Tue, 12 Jul 2022 11:42:56 +0200,
> Cezary Rojewski wrote:

...

>> snd_hda_codec_cleanup_for_unbind() is called in more places than just
>> HDAudio codec driver's probe() and remove(). It's also called whenever
>> HDAudio codec soc-component is being removed. Relevant part of the
>> stack showing when does the cleanup function get called during rmmod:
>>
>> [  220.549349]  snd_hda_codec_cleanup_for_unbind+0x25/0x451 [snd_hda_codec]
>> [  220.549536]  ? dump_stack_lvl+0x45/0x49
>> [  220.549568]  hda_codec_remove.cold+0x14/0x138 [snd_soc_hda_codec]
>> [  220.549609]  snd_soc_component_remove+0x34/0x40 [snd_soc_core]
>> [  220.549942]  soc_remove_component+0x113/0x120 [snd_soc_core]
>> [  220.550249]  soc_cleanup_card_resources+0x1a7/0x4a0 [snd_soc_core]
>> [  220.550561]  snd_soc_unbind_card+0x9e/0x190 [snd_soc_core]
>> [  220.550885]  snd_soc_unregister_card+0x28/0x80 [snd_soc_core]
>> [  220.551193]  devm_card_release+0x1d/0x20 [snd_soc_core]
>> [  220.551527]  release_nodes+0x73/0x170
>> [  220.551549]  ? preempt_count_sub+0x18/0xc0
>> [  220.551576]  devres_release_all+0x10a/0x150
>> [  220.551600]  ? devres_remove_group+0x260/0x260
>> [  220.551630]  device_unbind_cleanup+0x14/0xd0
>> [  220.551656]  device_release_driver_internal+0x146/0x1d0
>> [  220.551688]  driver_detach+0x81/0xf0
>> [  220.551716]  bus_remove_driver+0xae/0x170
>> [  220.551743]  driver_unregister+0x4d/0x70
>> [  220.551770]  platform_driver_unregister+0x12/0x20
>> [  220.551799]  avs_hdaudio_driver_exit+0x10/0x12 [snd_soc_avs_hdaudio]
> 
> So, IMO,  you're scratching a wrong surface.  The problem is rather
> that snd_hda_codec_cleanup_for_unbind() is called even if it's not for
> unbinding the codec.


This is how ASoC HDAudio codec component was behaving for years, see 
sound/soc/codecs/hdac_hda.c. If the intention is _not_ do call 
snd_hda_codec_cleanup_for_unbind() then the teardown procedure will 
probably need a little update. Actually.. I'm afraid the init one would 
need an update to. Given how the implementation of HDAudio codec 
component's probe() and remove() looks like, there is no dropping the 
cleanup function without changing the upward path accordingly.

Well, to be honest the init/free procedures of HDAudio codec are a 
little hairy, perhaps it's time to address this.


Regards,
Czarek
