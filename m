Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 805385FC704
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Oct 2022 16:09:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 717254DAE;
	Wed, 12 Oct 2022 16:08:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 717254DAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665583766;
	bh=s+xcv6ucj+6bf6GKX991kOG3BNU3bxLB4wwxSNZKleo=;
	h=Date:To:From:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vu+iynphVWmeHU1GPYuEGdhstlZRxjnpbm4xcFRTMkM+3REeT9GMt887s24p7U1UL
	 QJU6L8GZkcT1NWI7g1KanH18Ob23JYcollMechZyNWnlTmicikrXK6Qfl6CJ7wNTQR
	 9ALAE67njn06BLQsJrfhXf/nLFKkZjtpDOr9aYX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE0A0F800C0;
	Wed, 12 Oct 2022 16:08:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BC92F80132; Wed, 12 Oct 2022 16:08:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 169D3F80132
 for <alsa-devel@alsa-project.org>; Wed, 12 Oct 2022 16:08:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 169D3F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Avmt7D0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665583707; x=1697119707;
 h=message-id:date:to:cc:from:subject:
 content-transfer-encoding:mime-version;
 bh=s+xcv6ucj+6bf6GKX991kOG3BNU3bxLB4wwxSNZKleo=;
 b=Avmt7D0GepN0Pc8TIMki8GCegL/0DK6fLT8OFFodsv0/WtP7nZnicgfo
 8PP7T+/9otGCjQT5EkKxYoEtEZBLz/G1pNk7rq4xmGn5KoB5UAB8v8xSi
 QRNp7wH4CWu7eoQhRxzoFNhVdo9a1RFRHkr+e4Fs6ntGR+pxXwZvkcrIi
 eMh7ne1IbSseYYfvQRv8a0+XVamawcNxnvpEAp28Qhksjp/2tCWZhScQ6
 nLQnBFovu1u1kJE38tDFTgmHchxTcrKcNJtpLK3KSSxtwbi2VEiICl0RR
 VdK4N+LwqzL+ZbbDkjte1Ra0PYdf7l8e/yq67vxGO7WrbsXLyAMchyXNQ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="292125585"
X-IronPort-AV: E=Sophos;i="5.95,179,1661842800"; d="scan'208";a="292125585"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 07:08:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="769221275"
X-IronPort-AV: E=Sophos;i="5.95,179,1661842800"; d="scan'208";a="769221275"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 12 Oct 2022 07:08:23 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 12 Oct 2022 07:08:07 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 12 Oct 2022 07:08:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 12 Oct 2022 07:08:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 12 Oct 2022 07:08:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGNbQoikRpEBJsIKbgEtwJW9G/qQIRWGIZ0iBlkPSKOxRP2pl+PirmmMxMjzBtqNc2Y4qS/ArZ+TpqyjPKiQkASHUZBjddW6CPCB6gXGYlwWj7FzWQ/pes6rD2G0Ug4jm/mDuP607MNs607urfw2dlYxaLEA1zSNJYCKZfLGhAzLt0pqg7Vx6MLoz0QPiKeuWj4TjQIeIvbocdMCVROMbZpwQggwiU/2KFQ0RBeNN8E52ud6uRKe2kedZQs7Y1YaKSnghBn2m3+/p9VWlVW4z2NUIbEekgU7wOXgHRkdvub7aDohKO3KSEVWd/Hfjf6087iNCDhFcgTrtGgvjPim0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7ZJuvPnTYbn+ZNaFHjoE73C0l6AxCObXQ7buEDE1Lg=;
 b=SEPM666S60DiPrA1uHMLdXlLeUYivrmuQ7Fl5cT/EWPwRs69IIhLkBH/n8dliVyfWJ2ZOWIZE9QPXE7Dv5OYt7GTh4QI6T9/ppYki+QSDDNgCFICON1Bvpfi/ma4Bb3dDi1bcNKUqX3jlWMPJ2o+BcMgVO3Hjhx5xWO1Q27Q6M2O9ASYVMfy5Ozluo2AJF7eJdXbEup9nf0ECMYmEhZ26kD/KbdeGeUJrvf5SLT4pDofBh1nHgvP+wRMeCIcSmBqvYw+ProcFsqBQatceglh5dpDqEjAPG91RiTBBQt4KWfMykao52dVgxAusk5KvPr31mff6fRAL4+UPeOAK7PFug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BL1PR11MB5477.namprd11.prod.outlook.com (2603:10b6:208:31f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.19; Wed, 12 Oct
 2022 14:07:59 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::2504:e0e3:a688:52a4]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::2504:e0e3:a688:52a4%5]) with mapi id 15.20.5709.015; Wed, 12 Oct 2022
 14:07:59 +0000
Message-ID: <73e6425f-8e51-e26f-ad83-ccc5df517a43@intel.com>
Date: Wed, 12 Oct 2022 16:07:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.1
Content-Language: en-US
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Takashi Iwai
 <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Question regarding delayed trigger in dpcm_set_fe_update_state()
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::20) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|BL1PR11MB5477:EE_
X-MS-Office365-Filtering-Correlation-Id: 71866bae-c10e-4e5f-6573-08daac5b2afc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Me15QPkgmTCtLOL18Zp007HOBniHHLXEHyg/56Dge+nEnHS+to8MS/SuJMN75PCH+MridgRtQl4bIionmYmaDKYv9pV7S/0TAdQ6px8vwx3zI3aWfu1UbzWrVw2LDB66r6oJPazY/NRrSmXhy3De+URUS7vyxJWNGl4bWGcsxb+4WHVxApN2mRoFssKSQawkj8WZmlQ0WHL4VQfNFt1I+8wFWRsEbO+JqJm+Da/bBABN38Ob2rqWkL60sAwaTW2hYgeWTiAh6hdALVlwBSeAa6+EFHTG84I5XYwgyvmYSC4rPaiwxs0W4078hVkP0gTjoKqd7rex1+efC/jN5CM1/FlVXYeI5jJT/qvgRUmtqILHwF2yUkChRXPEv3j6HSu/isnxSlhCDocf6dy7OVOY2A3leLbq1ZdCdNWmpUjFtc+sDcsscrrUuqYnsar02864X3GexJma05gRcxBwZHwgchXTq03/FLIuuHrW7bkf7B5nROSjVzyxuVDMErFt0Hce7V/hysRbO0i8z9YlSUFLuqjUv9peJNybQ3KEmLB4W7c7H6mkQ42CVhR1EYnSf49uDl9r81gPOmjIyjJ3T7aKzkS1y41km5VFWpW/m2pTN+zCnMQNXYcAtUXR9n918NWYAOKmAq2BvOlvo/gFAfYzwsFmmZcI/t8Y4wh+AaGUX5soj1S95keCc9ayVNHSJj54ZIkg1X6mFHnEZkS8dTOxpnRQmoooQq+wQLH7phYYFfY8n7INWpLQg00b2RJI3Kb1M/JXUrLhBFQKLWkl2z7RWPpFkTnyUFQpd4rQ+2ILQHJC7SLVCMRSnCzJOP7zdUXNZw6/8QnnlMF+xxB7OsU5Lw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199015)(8936002)(38100700002)(36756003)(82960400001)(86362001)(478600001)(316002)(110136005)(31696002)(54906003)(966005)(6486002)(8676002)(44832011)(5660300002)(66556008)(2906002)(41300700001)(4326008)(66476007)(66946007)(2616005)(186003)(6506007)(83380400001)(7416002)(31686004)(6666004)(6512007)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzFlcWVxQVFOUVh4bkdMUG5KSWlBR2h5cHA1OFl5Q2ZwVnBrUlZCbDBjNTI1?=
 =?utf-8?B?NEM4R0RzZllKTnUzYjQyMVdzdGdYYTgxYkZlbW92eERxT0R3bUpOQWNsb291?=
 =?utf-8?B?ZXBxRXNYVnhjWnJSY3NTOEdaMFNhWlZWSDY3UXJoNXNYYXl3dWJoLzVLZFFR?=
 =?utf-8?B?TEp5SzY2RWRTY1V0aG1BYXpmR3l0d0VjaEU1UFh3Z083WSs2cklPazc4QXk2?=
 =?utf-8?B?RjltUzI5eHRxZkJhNHR1MXdKdHhrd3gxK1BmWGFvUU8yM1hSdVBna2pndTZ5?=
 =?utf-8?B?RkNQMExwTnRxN2pmRWVxZWdBN0F1RFlSMWRJaVNmTU1oOHdjaXZWT3VCTzUx?=
 =?utf-8?B?WVlwbnRFTzVQMGtiMzJibFFrMUNHQThWVTduU0JPNnQvdkRnQmVRT0FPdGNU?=
 =?utf-8?B?Z0RnMEwwdW9DS1k5bURMYzcyU3dLOG15MXBVL0ttdU84S2kvQ2NqY0FqU0I5?=
 =?utf-8?B?Rk5jY21WNjJXUGZ3c1crMzlheHFrMFNNNWZOY2FrRUF3dnRnVFBUUEdIanly?=
 =?utf-8?B?aWtYbkpvRmJON09VamtmVk91WkxieGhjb2tGbUc5S2VLdG40UHJQK3lEV2xt?=
 =?utf-8?B?Q2JnM0kvbWVTVVArb3dha1BveGgxanJGazdmalB3M2JuUzJWcW9XTUY3aThn?=
 =?utf-8?B?RHM3NVFpZnVrUkJDT2tMOTJETm9sUkc5M0V4YXZXR2ZXNmtJM0U1c0tpUjVJ?=
 =?utf-8?B?MlhBVW1sY3lZUSs0ZDA5bVpKbVdpNm1KUGMzbDV2NnBkSUlGb2syWEFaVy85?=
 =?utf-8?B?Mi9qWlA3MDBCaVhLbHI1b2E0UXEvS3JHQ1h0YXRKSm00TUFrazJObTNSMngr?=
 =?utf-8?B?VDJ0UjdnSUt6TFV4dWowLzVYakRJZmphNC9EQlBSU2MwekpsOHQweDhIVjZn?=
 =?utf-8?B?ejJvL1pwZkl4cmhKVWdDRzZGVEIxY2FnV2YwQkpkcFBPblR4bmJ1a0h0Uloy?=
 =?utf-8?B?dSs3aVQ1Zm9YcGNYcll5aHhYTGwwQlkvTTE0RXczN3RhU3NDN01TbFB2VmdY?=
 =?utf-8?B?dFc3Y0JHdmdCTnpPRUsycGZyRkxtZTZ0U042UklCamlnQklvdDlFc05YVWN2?=
 =?utf-8?B?Z1h2Tkd0UVNxOVJzRWlId1R6U0lOSkhkQVp6clVESld3VVdCaDhVSjFxd3Ix?=
 =?utf-8?B?Mkg5MG9nTTNZNEVsZ3NIRDNtU0E2SjNiWTNKNS9HTml6RVFhZXEzYmkwUGUx?=
 =?utf-8?B?UFJYaGFoWTk5R0pSL0lxSUpKeHY1d2lSYzArRWFTMXdZWnI5Y1ZFWVhPR1NE?=
 =?utf-8?B?NXFab0tZMmVlbzQrZ1c1SGhwdnV3ck9aSGxFclNjcjdVek9QY3Q1UTNsbEp6?=
 =?utf-8?B?UFZCTlVIanpMYUR1UXpvN0I3c3FMZXVreWZIRk04aHlDaE43U3VTenAyZ2hE?=
 =?utf-8?B?ZFB3NnpRRmFmbGEwTWpHT3BaVk5keEJMM1djbTlaOGVOd0JqT2lIbVVaK2Nr?=
 =?utf-8?B?QzdhVUYrZFVueXp0N2RRdnViaGtHN29XRGFmd3lEZTFaT0VLRGxHQ3Y3aTAv?=
 =?utf-8?B?WWxhQ3cxOXpVSXdQa2Z5MDlpVnNaaHpUNXVjaGloeEEvM2RJRTNoaGxlc0lX?=
 =?utf-8?B?OVdyYkhneDBWMWRSZXd4MktPZlZXaDNndStHbGd4UXNQL3ZrWFN4d0piTk55?=
 =?utf-8?B?MXNYbzhiVWZYRVV0d0JnejhrOVlIN2cwblhyMzF3MU1ZNlp0Z2Z2ckEySVhh?=
 =?utf-8?B?U0lTbkdaL01KbDFhYXlhN0EyTUhUQmJPR2w0ZEl6cHNhWng1MnZPMEEzTTcz?=
 =?utf-8?B?UFN6WlNwc2FCcjhPSXdtem1nNmZnbC83NUFFcEozRWxlTGd0YjliKzBESzhm?=
 =?utf-8?B?ekVxM0tDOFlTNnNKWmE2aGE1ME9qTjNaNVgyS0tqd3NQRm90akRucUQrRndP?=
 =?utf-8?B?b0gwMUJaMUhzdXM4QTA4WGY5OUZ0dEpIZjkvTFBrL3UraTRJNmVPbCtnTTNH?=
 =?utf-8?B?cVY5VFdWQlV3VUhjd1prTUtMZ2s1TE9lT0RuMmxWcHhiRlFsTlVZMENJTUQv?=
 =?utf-8?B?aVVpb3BEMXQ5SFk0U2FDRExYYlBMS1lsZjl1SWR6Sm1OOU9KSTFNTk5NemdI?=
 =?utf-8?B?UllKSzlXQjNGQ3NRWDQ1ZmpEVmNHSUVLcUIvZmFaRDd1aDFFZnBVN1lUVHJK?=
 =?utf-8?B?bVFjZjlkS3lJS1ZuWjlhdTZpaEhuaVRSN0l6dWFLUjhjU2ZvK1VWTHd6RmVh?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71866bae-c10e-4e5f-6573-08daac5b2afc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 14:07:59.1719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y1jVxPzgs3tRYV6FA/rdBvIzRK+yLizVpJ9rHPQk1WIV4GOMHBmHR20m+b24ea6d7tGbGT3iJw+qE6iRDiN4ixSt08ofa3i+aNqhGCphe/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5477
X-OriginatorOrg: intel.com
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

Hello,

Writing with question regarding dpcm_set_fe_update_state() function 
which is part of sound/soc/soc-pcm.c file and has been introduced with 
commit "ASoC: dpcm: Fix race between FE/BE updates and trigger" [1].

The part that concerns me is the invocation of dpcm_fe_dai_do_trigger() 
regardless of the actual state given DPCM is in (actual state, not the 
DPCM_UPDATE_XX). The conditional invocation of said _trigger() and 
addition of .trigger_pending field are here to address a race where PCM 
state is being modified from multiple locations simultaneously, at least 
judging by the commit's description.

Note that the dpcm_set_fe_update_state() is called from all the dai-ops 
i.e.: startup, shutdown, hw_params, prepare and hw_free.
Now, given that knowledge, we could end up in scenario where 
dpcm_fe_dai_do_trigger() is invoked as a part of dpcm_fe_dai_hw_free(). 
dpcm_set_fe_update_state() is called there twice, once with 
DPCM_UPDATE_FE and once with DPCM_UPDATE_NO. The second case is the more 
interesting one since it's called **after** ->hw_free() callback is 
invoked for all the DAIs.

dpcm_fe_dai_hw_free()
	dpcm_set_fe_update_state(DPCM_UPDATE_FE) // fine
	(...)
	dpcm_be_dai_hw_free()	// data allocated in hw_params
				// is freed here
	(...)
	dpcm_set_fe_update_state(DPCM_UPDATE_NO) // not fine


The last is *not fine* if the .trigger_pending is not a zero, and can 
lead to panic as code used during ->trigger() is often manipulating data 
allocated during ->hw_params() but that data has just been freed with 
->hw_free().

Is what I'm looking at a bug? Or, perhaps there's something I'm missing 
in the picture. From my study, it seems that only dpcm_fe_dai_prepare() 
is a safe place for calling dpcm_fe_dai_do_trigger() - once 
.trigger_pending is taken into account. Any input is much appreciated.


[1]: 
https://lore.kernel.org/all/1415116348-11792-1-git-send-email-tiwai@suse.de/T/


Regards,
Czarek
