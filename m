Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A79945954CF
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 10:17:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BD561635;
	Tue, 16 Aug 2022 10:16:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BD561635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660637830;
	bh=Q3bE32S3L7tVNn9bs9eEMuaCtSyU1WYih00+piuuHxo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ki24Yaf7on3L11KfLe/pp8os5s/lyWAx8HqMAVcQOOqHr01hAEHyKXA4G7YiorsLc
	 fxkrjMQ1aGmFwkoYisDIV2/ZtW+yPKN/WtTHwAcuwox9G/t8zZgcr/uCaKg4jmgT5y
	 hOogEtU67cF89yUkPK9yt7B6e8vHtqapovLo1dbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0AD6F80424;
	Tue, 16 Aug 2022 10:16:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FE1AF8032D; Tue, 16 Aug 2022 10:16:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB3A4F80082
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 10:15:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB3A4F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nJU/VFKf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660637765; x=1692173765;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q3bE32S3L7tVNn9bs9eEMuaCtSyU1WYih00+piuuHxo=;
 b=nJU/VFKfW5PdDUmR/hb1D+EYTpFfjR9Vy7skWZEIdjUQCJ9JOPMePQWn
 e6i6etNwVGwJcPkdDdiFe6QqISbMpVgO3QOYOTKB+DNcjQ/w7RF0fPzHY
 d410j8X08bH9Bnpx0WymnJJfu0Pm6tcbNa/fa68IzUkNosEs7KKv3iUgA
 Gbc2kKKd1UsPx4lg0wV5UQnnVAHE3DQkBrc1SEG6G4y1lIDMuP2kaRpDY
 bmHraCQbVeTdnO1IKxHHCwSFDUt5kA0DhIeXnhDT1aV5gRMwpBtBawaAy
 22OjZiaD0vd5rGnLAzNd5WI6FOsQRwVEFaJoLO121stYOhOuHmkyQBdNF A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="356160164"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="356160164"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 01:15:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="710052916"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 16 Aug 2022 01:15:53 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 16 Aug 2022 01:15:52 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 16 Aug 2022 01:15:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 16 Aug 2022 01:15:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 16 Aug 2022 01:15:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MdmJbnLJDe3IecqzeupTQNxGAFFvjgBfyer51pIW3kNnLP/vAHSfIP7KDkdpSj6nq5Hx3Fj7+AYMY1urzNagEsN5+zmdKX1tfRlVmS3ESdJ6s8rstduvZd3d8/Jollt64KNwYA3ZGNpufNNENcUJ8u5wpgRk1eTJHzTCr7MlQEmWnW9aJtA0upwMW44rhQvVUhvuLH3VOyWHlVPWqfQZBCAl+TPiIaMCnZ6Fxnw5WvFPFKFaTH18rnETPy3jUuYdFjQqbZEPHQIVgOjKMNCUczynqRvsfk703nvyMO35gc0Ls5ulMvQru1TdURB+LI7elNwgsOS/a27B0X0j83rpwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3U+j8DAfTqKCB+4VSTWtcIvkovw9MkQBhvuhOIUv8fM=;
 b=QuW6al4wApOoLregX6DsXQI+0S+9nCPm+nRg4Sjt5HH9hpg57g+R0HEtzvvViVDIHXkz1rFVsv0x8XUmSb+zJTu5QQA6bp36qPZzGpqQzgSlRcSzXILIU8BLCUT8ruD5vHDrgcv1J4q34DpTtrIk/mOiAOP/AoEJVl5YAqyB3pJZqL2wsddTjzMVx/AIuX01ajWszxLO5KRaL9BeE4ud4b1M5pQ3/02D3A994HRPlHfqS8zDbhm/JlP1bjELLxq2NQWwJ8DDVGXetpenwlVLIJ2Qbr18gH9hI5yuka0mTyikcGTa0VXYF1pbFtnDkUjdR7rfkAW/LPNwe0ZqvJ8ZCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BN9PR11MB5516.namprd11.prod.outlook.com (2603:10b6:408:105::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 16 Aug
 2022 08:15:50 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::75e3:4009:a5d1:c3ae]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::75e3:4009:a5d1:c3ae%5]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 08:15:50 +0000
Message-ID: <e8e9eb65-3095-ac5a-ce96-55eaa34ef895@intel.com>
Date: Tue, 16 Aug 2022 10:15:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Subject: Re: [PATCH v2 0/6] ALSA: hda: Unify codec construction
Content-Language: en-US
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>, <tiwai@suse.com>
References: <20220815174227.3071323-1-cezary.rojewski@intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220815174227.3071323-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::20) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3a3d0a5-e547-4f11-ac94-08da7f5f87e8
X-MS-TrafficTypeDiagnostic: BN9PR11MB5516:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PlrVsDQOpXxj3NSiRqwtCTRo6kXqy0htDrx88JivVXj5GXI3eGcF9zXGDTik0SMWQpQohnsSuuxDGVRdnzJqdS72X7QEgjvvpHP+I4zWy61tkqDGBKBhBUdV5lBZTRu27XbRtb8pnpQUk6CYQLVLY+FzqAzGKH4sJQSlwKA9sDTSBnehPtBB9mB9Q4J6RgapwmpAc1ir8a1r8NDEyt9nKE3ct7k6BiUEfaEMFoYvbvoPqecaD4vr8phXztpXhtumcwvD7Ni+IhsMlfT9oeSIXsslUjKvdOZKZPZaYHEiGDgHsAo7NShO3+dZ24CnFW5SMClKuyzEI6QKBY1wjrY+e6EnBNdw9HezkA2t9qxM0P9IutdU1wA+ETj6FDuqVDkpgfHlsWoe18G8hclj6AWFo8Y3OqzThNxQN30IPyiWBi6XYoZS2wyxpqtAzIeoyErTLJhN4sV2hqZ8qq29lqKDQ/ITNbdvGjsAfLlcR77/2L7I1hs1QD2EAAgnVDtrQ6pBfycEiMMBn/gf7Whfa9vYUtG2dN/5AtIvvkwSEcYEngf7+SzQ65KghhekcbVSv0GRyingGitrNHuZIrcbdw4q0xbramv/iR9UAelkBhNtPDigL/fog6kzkMDs7PHXAGbQ3Azp38A5jbICumXgLWBRdP6F/Qdrkz83I2dMpcG8R3QnX0Hra+QeNX4nClNQazl6cvmqm1UeFmZtIK+hJwAaYCiE3yVtV1T4gizKJxAHMzE0K6bidLaGuH+gf0e+3zR5EV1enCi1F8HVHgvNhRan8wPcjUrujBkDVPuNJYjZUO0dk+zj7tTbeH27mA7Wd729Zh2AsnnXizVLPJ42Hs1JmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(136003)(346002)(366004)(376002)(39860400002)(6512007)(478600001)(31696002)(8936002)(186003)(6486002)(86362001)(82960400001)(6666004)(2616005)(26005)(53546011)(41300700001)(66946007)(66556008)(66476007)(316002)(8676002)(4326008)(6506007)(36756003)(31686004)(83380400001)(2906002)(44832011)(38100700002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVpxbktBR0tuNE51OEZvL0pFZ2R5K25QWGNtWmdRWUQrdmxtcEx6U2JTTUFM?=
 =?utf-8?B?OHd6N2drdm1MV09EL2VRalRZTFVYTUxOakdOcTV5cnJuN2VqbHpQSmZ0YzFk?=
 =?utf-8?B?TTN3RklBMW9lREdPczJac29UWXpKMmVzRHYvM2pzZk56SnB0enY1bVZKUU9T?=
 =?utf-8?B?b3ZJMEhQU0NzUGl5MnBDd1VDcFFHeXNQSVBPdlN6RngvcnVpOGFpTTJNYnpD?=
 =?utf-8?B?azhPOW9ZUkloMDdBZTJCWk05WjdNY0dTSi9jTGNEbDQwaGVzWGc0OFc1cGJN?=
 =?utf-8?B?NEI3REwvL3REU0Y0VHFGRDNTY0M0QXpIMXBwbjhPQ2hsWVNhaWNqc29nT3hN?=
 =?utf-8?B?Z0pVNDA0NGRSNk1LRFd3MnVyRytSMzAwck9WVStsQ3VwdkwvOFkvakd2emFr?=
 =?utf-8?B?L1o5emxmQ3JhVnJlYWFHM1RjVE9uR0ZRZ053UThlbzh1eUtaZ1pYRnpFa3BX?=
 =?utf-8?B?dTJaNHJzeDFPelZrTHlnWFY2cmh2SFNYalp4ajc4Q2krZlRNbis4MXpWeGdJ?=
 =?utf-8?B?dE95UHdkbGVTUGxRMXRYcDFxZExpUW51UzZubFpLeWp6dytzdGZEQ25zUENL?=
 =?utf-8?B?aUtHZnBNZGFzeXM4NmE1cEN2TURHRitOSXpoVkYvZEpQUkY2QkMyenp3a2Jn?=
 =?utf-8?B?SEJtZ2tGd0wzNzNqT1ZjTjZxbWZIRVV3Q2M2eUdJd1hPZVdCWm91VEtzb0hv?=
 =?utf-8?B?ZzRJUlpUTDBqRjlQTDVGK1pPbHIyMWl2OXJrdjVTMzlBUGhNL25ubUVwaHJm?=
 =?utf-8?B?dFo2Y0wvK3VKRkQ5VHBIM1YzazZTTnpBTkJZVjhmVnd5amhJWDV6ekE2MThP?=
 =?utf-8?B?Uk56am1seDJzc0hpOGFXOXB4dFNwMUI4c2ZQelMrN2NvL3cwNFpoRkRqd3Bo?=
 =?utf-8?B?cDhkaFcvdzZDUUUxTEU3Z3hTc1hCYkdrZk9EQ1hEeG4wWmhDcmZGc1pzM2Zk?=
 =?utf-8?B?MHpVNXJzWmdHUGJ6Yy9kK3R1OVE2OGlTSUNYQm9jQ2NuaGU3Sm0zNnhVSXVB?=
 =?utf-8?B?SnhwOE1rdVJOS0xadUY0WWhhdVJUR1BwOGMvYmF1endEV3NrQlFoWjhZNEtZ?=
 =?utf-8?B?VmI3a1dBR0ZPeC9lNjc3b1JGcXpFejNsNFVpcnRTdXJBeWgzQlEwbkI0NXQ3?=
 =?utf-8?B?dTZHMW8yOU9BYTIxdVZtK1AwYktSa2ZXZlZ3d0tmZXZTbVVhSllZYis4U3NO?=
 =?utf-8?B?YlRMdzU5ZnBoZjhnVHk1OWNyZlFIdkREZnZTenJrTTlQYjJtQzU0ZEcwSUQ0?=
 =?utf-8?B?K3FRZFBHQzV0dnVtSHVLMzNMN0ozTXh1V2JCM3U0OWZvYzhuaytLRDVSNEJO?=
 =?utf-8?B?bG1TWlI1eWI0RmZrMW5nMkNNdHNxVmp6VDQ5MmZ4eG53dFhMd1hTMGxHSDZn?=
 =?utf-8?B?QmZZMENEYTVkWWI3SVNmWTdPKzNUYUZ3bXRUSFczY0RNVUhEVXdrVkhPUVRN?=
 =?utf-8?B?STc1MERpaldjZFNnbGtGZHk4ZEFBL0ZVTUYyYUZxcWFCWXBiMG0zRFlVK3Zi?=
 =?utf-8?B?WGI1V3QvNUVmcWhRaCs0cE1lZzZxUW9GcTBFTXIzUTc4MTdzbmVkaGE1MDNp?=
 =?utf-8?B?bFZONGtEbm04VHU5VWlaSkxmUUx2c0M3S1JQVEpTUERvM0VTazkyVjhiN2tH?=
 =?utf-8?B?Mk03TlB2RklDcklORUltWS9hTUpVK3ltdC9mVXZXZU1iSnlIOHBpdjMrRjRI?=
 =?utf-8?B?UWNIcGI3blpPSVhsVzR2aWsvajRZZFJPcWtJVkw3NldRNkRiRnltTmxFK1dC?=
 =?utf-8?B?RW0xQzJLcnVzRlN1WW5kZjBLMUlsYTNTKzdVelMrRXpZeTRzSWFSUkdzclY2?=
 =?utf-8?B?VVF3c1g0dW85YzkwbzFUYWIxb1ZJaWd3MHNRUGxYcnQycUVNcGR4RzRxaVFM?=
 =?utf-8?B?c3FJV3BudVhITGZGK1RSdGR6WkozbFVaVWxqMlpsYURmNlFzL3hlbVFTSGlS?=
 =?utf-8?B?UEp5cWNCVm1yeGVDTHNWRDlmUFhURmVIZ0s2RzhqcHBzbGNKcHRvSFJnOFZw?=
 =?utf-8?B?TWNJU1VpK0lRby9BMEp2S3gySWhZQ3ozcTFjd1piWGF4L1VGd0lHd2hZME5Y?=
 =?utf-8?B?K0dicjhrWU0vVWVycmsxNzdySTZIaFdxUWFkMjBPd21CR1FHL1NjRGZab1pO?=
 =?utf-8?B?QnBxZFdSczZtYSsvbWZCcFlhNFU1Ykk2NkxpMXRrcjBGMGlHODYzc3VxTlcw?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a3d0a5-e547-4f11-ac94-08da7f5f87e8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 08:15:50.7326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0HWKisWyZlLRo6WYHfUUSXfDSDaOiv3S8i9Yj0sv/dr9H80mttDO2eACVHwo7dxAG6kzT0nh16+Pw0fB850lcUnyDa3gTHfg/TXSplKWrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5516
X-OriginatorOrg: intel.com
Cc: hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com
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

On 2022-08-15 7:42 PM, Cezary Rojewski wrote:
> A follow up to the recent HDAudio fixes series [1]. Given the recently
> reported regression [2], before the page fault occurring on codec
> shutdown can be fixed, codec construction procedure needs to be updated
> for skylake and sof-intel drivers. Drivers: pci-hda and avs need no
> changes - already making use of snd_hda_codec_device_init().

...

> Cezary Rojewski (6):
>    ASoC: Intel: Skylake: Introduce HDA codec init and exit routines
>    ASoC: SOF: Intel: Introduce HDA codec init and exit routines
>    ASoC: Intel: Drop hdac_ext usage for codec device creation
>    ALSA: hda: Always free codec on the device release
>    ALSA: hda: Remove codec init and exit routines
>    ALSA: hda: Fix page fault in snd_hda_codec_shutdown()


I've received a message yesterday that patches: 1/6, 3/6 and 6/6 were 
not delivered to recipient: alsa-devel@alsa-projet.org. None else is 
listed there. lore.kernel.org also shows only four letters (3 + 
cover-letter) rather than seven. Given Mark's Ack on patch 3/6 it makes 
me believe that indeed just the alsa-devel did not received some of the 
messages.

What should I do in such situation? Is the server admin about to 
"recover them from the void" or should I resend the entire series as: 
"[RESEND PATCH v2]" as see how it goes this time?


Regards,
Czarek
