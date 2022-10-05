Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CDD5F565F
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Oct 2022 16:27:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 195FE1697;
	Wed,  5 Oct 2022 16:26:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 195FE1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664980053;
	bh=fupf+LsHX7SXvVHBaSukLAtXuQHHXtv5SbDYI4bybCM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HSoiXu3sKbdEhZXZ3UdeasDw+r37bVYNXfC86LalKAaGGcrGi3qPgEBeKK70XGivp
	 COF+lghui5chv7mf3g8sagKWyIM4HrnMouk1biUDVfFTyhedRn56N9ERKjW2KIqovP
	 dZiGYKZvof6m0+PTjSqFRy2t3JdP/0tFM9SeqNwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73B2CF800BF;
	Wed,  5 Oct 2022 16:26:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F8DDF801F7; Wed,  5 Oct 2022 16:26:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1E58F800F8
 for <alsa-devel@alsa-project.org>; Wed,  5 Oct 2022 16:26:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1E58F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="HkdElRH3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOMq8xbq6uyE/aEMlsqPKNF3/FJYPW9ZZrFwnjFMF7NNch/Hq1hqJyYpqLH086UU15tVyWF//96V4Hig8Cgg8I0nUAKUm3v7Tl0UzEnlxPHTzQCuf39fJGRJA/O/ZaAO+xR2Uu0s1evTgozSY4IslcLwvRYN4AXrmgqAfIazxqzC7m+nngFT5bygfkYA6lTM7IO2hVK7WSB/JNMydqks9/llMZT3zmxqLkpo/rqQX+z2mWN6uwOLBCwX9kY3qqtegA8fM1wbXgYY5cBGI6s2dcylOqu7OGHfmDUVwjIhcHwpbD/K1qXqAf5y9EJKTpPlLMataxMtad39dsb52C6Lxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHN3gdrQG86GKSCaPwO8G/MsmOowRdwtfkfnoHy6Ijo=;
 b=PvgYV53QapAmqSWk2sMagld00E32klgS5DGrLB5NFztn3NDiGeXd0bd0NqzoSuqglMp7pl2xA0zkVcnEEJCZ0TM7N0ksQhZySZkMqLgY6+/7+7HXGa6L/l/PIuYFS0SDojL1rscrbfvAIlr+YqMjatsaztjpwNY53JFjGH+CTRZXLeeV3et6Ez2RYn0yHQrRYIlsOArIw3sx44qBa1FVdtlt7bI1Eb0ryHtYCjAXryjXogZm9532xIrYtzuzR++jcS6nNh/wmrGQqtpD2qEz4h/hy607uKD5mGpdgY6VyaxwkilC6GK6zSnluEXtNJVlLCM2lfTxe1hVn1Ge86EaHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHN3gdrQG86GKSCaPwO8G/MsmOowRdwtfkfnoHy6Ijo=;
 b=HkdElRH3HG5njaq3RKbOkx1i9njJPwUIUxYFaJJO0ei+jsdd/WdFLbm85nvntMWrFh6DEZ6wNSeX6BCk8WFaCqgZbxKUjTnxOAUvpI+8wQMtjPXQ6OCf2f+FhE2Bqw7I7DPAl/fnQ/T9TMT50coJv5vDkW8j1TGKwv9WuX3VsUdorloTdBUjtnWyaDGPffh/eTqEkzkFPS/Yyu+kCGX7nXVHlGsBMX+hXUMDRuukIsM+6wjsb7KIxXuhoFut2+hrfXD5W24KKkUHbieq6Pd7R8nPWhoJ4C/zq4tcD8frPCBbws/ZnojQ6um9yjRJ5lOWgKqOMp7v84J7vFQTQD8cPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Wed, 5 Oct
 2022 14:26:28 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::b07f:53b1:426e:a29d]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::b07f:53b1:426e:a29d%5]) with mapi id 15.20.5676.033; Wed, 5 Oct 2022
 14:26:28 +0000
Message-ID: <d2772c7b-bea9-e3bd-3b6b-c657566649d8@nvidia.com>
Date: Wed, 5 Oct 2022 15:26:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/4] ALSA: hda: Rework snd_hdac_stream_reset() to use
 macros
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220818141517.109280-1-amadeuszx.slawinski@linux.intel.com>
 <20220818141517.109280-3-amadeuszx.slawinski@linux.intel.com>
 <657d2418-0c3e-296f-8f4a-dc10ced2dffe@nvidia.com>
 <87a66av4gk.wl-tiwai@suse.de>
 <9677f39a-5297-bb1c-d4e3-62484ec1cf25@nvidia.com>
 <87lepugy85.wl-tiwai@suse.de>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <87lepugy85.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0673.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::8) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|PH7PR12MB5974:EE_
X-MS-Office365-Filtering-Correlation-Id: 0479a84c-4aaf-4130-0eb9-08daa6dd9753
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W8MggWypJ5Ln7V72kTN7e/t6e+aVYUqIwvdNqJRMw/Te/xZF9WS2wugyeId/NMZ1qaDdb3O2HMT2rJidITZRLyw27o7cqOfdQ/OjwmhZKV54OIc176onNQYYo2ts/U57k58gikJfqU9SCMQpGyKhCbi8bSTVo+DAlU3SaXkrlcD4vWkmrIkUyRwy6q0OAe1yJfxFcS48xvc30buVp4/7VGb9TS5XZuEI9Lyls62kd98JM48L2+yBuK4tZ6/RdXbY5xELg+TD6txeIZkRNVpkTCyc2Jk41vO1JmZ/txuUvdeA7rzQW44RypZWucVMFe9iZHqSVdyEhw0haLdHXcyl7PXyC6e8mBe2P8JAfUWVfXuyVgf4BAIsbVRMKcOV13HzdUTs+pjBNl8ja+CIYX5p2pEOSX1Vdnf7Xv0DejVvJ6TACOGKOu5FyWF5Js3XCseyt8VAwIhraHz7/ai02neROWTbf2KMa91M7/6zyIHQGZ1mm8RX67pQBPUs9yJes59mdLM8n5ni8i9KMaj4D0nZfZp7z6jdfQVdd22aPT4QFDlVOD66oFLQC2DS7nDRi/XYmSKnBN77AI1Bz7jwzcCu+knXWGcApAm6BOnRvPEYdM82Gky2K53mQC6iEmvGCwWC8+aV5ubTFvcbBIqfoFY+k1iefy4P90ahnSd9NfxFzhoVWyIp6EmrCZU974eFrDujPZ9jzn+5T2+6QgF8i41ZmLeXpT+kx16Q9zslJ7hBkZ3KFcM3DclAuJ3hY+lIMHditp0Xpp6liA9GIhpHMqiA5LOQMYsxfeHJ0gNJh9Z9hgA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(136003)(376002)(366004)(396003)(451199015)(36756003)(31686004)(31696002)(2906002)(5660300002)(186003)(83380400001)(2616005)(38100700002)(107886003)(6666004)(6512007)(6506007)(6486002)(478600001)(53546011)(86362001)(54906003)(6916009)(66946007)(66556008)(66476007)(8676002)(4326008)(316002)(41300700001)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlRrbnZrTzRtc3RBbExka0hjZjZZdjFKb09WTzFIR1RYQmlhY0lZVURrK1Yr?=
 =?utf-8?B?OEEvSWRzVFpLeTAxaml5RlZuUUNOdmI0ZENrZ0tmcWVsQTk3czZNMFA5Nnh3?=
 =?utf-8?B?TkhpM3pxUXZGRGFEVllMNlBlakJMem1VL0lHWFpVYzlnSkR1TStHR0M5Mk5a?=
 =?utf-8?B?UEVaUUdJdjZ6R3JaQ0hoTDhWeTBWTDNkdG93UTlMSFF5V01vQlVmQm5nMXVm?=
 =?utf-8?B?M0xXVm8xYkNzRlViYUozTlZCV2czUUpwQ0kzVlk3N3NNaTE1Qk5xYUUzOUJT?=
 =?utf-8?B?ay93TVo3UkgxMzlsSUtjNkY3VnpkUW03K3ROUzl4UlNENzk2WVFjVXlhUWFK?=
 =?utf-8?B?WDZZT0g0S09ZT3NtOGtkbFcvN1U2RDkzWEVkUjFrTS9UMXVQK1YyWG1mcUJr?=
 =?utf-8?B?WUtmR0xiOENRcUhkdC8rdkdFMnM3NXlQcStjbi83aHdrd0NqUkNkdzMvOXpl?=
 =?utf-8?B?MkhXbW96SGVMTkhYdCtobWp6QzFQTlVJU0RZNlRkdnJDaXp3dTFWdzNpV1U3?=
 =?utf-8?B?c0taaXhxaDAzMkRnUkZueVVudXZrVldTWTRVampGOUN4eGdGU2o1N01xRW41?=
 =?utf-8?B?VDBRUmc3N01jMjUvSk5Zakt3bVZQdURJaHFmTWV2bmFVVW41NTZCVS9JcVRQ?=
 =?utf-8?B?RldWcUI0RFQ5dGZqaW52aHVFY2NsdTJETVJxOGc3cEQrQ0hYWEpBbHc0cksx?=
 =?utf-8?B?MFNic2pIWFpEeFBoVktwczU0WUZOVzdSUE5SVGtCZmJhcER0YXFUUU1BNGJy?=
 =?utf-8?B?VjlvMStrSTJqbEh3dlVLa2ttOFhhOXNLakMrZExUUlpyaDJ1V3o5Zm8rOUQ4?=
 =?utf-8?B?ZTBEQUJ6ajhwMWhQRldERkpsdHh1M0s1Tm5CdDdOTThrMC9pMUZSVnBYNU96?=
 =?utf-8?B?WjVQemRucGZubE1Zc0kyaE1PUkVNSDMrdG1KT2pvYk84bDBlYitwOHMxS2RY?=
 =?utf-8?B?c0oxOVBBY2V2M1ByS3NXUGVYV3RwK0xKUml5bmR3WGVROGU3MnluVytZQTdH?=
 =?utf-8?B?R1VoZ3R0WWJvY3JlOUcvZVhHd0Y2ZFZoZGxoMlZzeDNKUlFtN2xwR1hCK0Ni?=
 =?utf-8?B?LzRmYzRna3ZYTWY4TGpJTHJQbDQ5TGgyKzZ6cGx5NW1wOU56bktYRCsxVStr?=
 =?utf-8?B?cnluSkYvSGl1SzZWQ0JXNWoyOUdLMWlmdGFqb3lOMnJhZnlHL3kwb0U0REwv?=
 =?utf-8?B?MmU3WVhJYTNwMTk1NGM3aGg4dU9kU2NOME5HZ1NnMDUyK1NlM0xYOUF2cFhC?=
 =?utf-8?B?bkk5MjlMV3VLbFY2dFBWQUo5VGpIWGRwMjV5N3VWM3Y4SGZmcDc0azNDS3lr?=
 =?utf-8?B?NzV0WURndk1tSXpPbEFDZjZmNDlrZzJBbnlGVlFpQklGQVYzVXNER1hoMTFu?=
 =?utf-8?B?OThxZHZvUzNkd2lXd3dHV21LZWhDVUFNeWtUUUgreU85QTJSN2FhS2gzNUIx?=
 =?utf-8?B?UExsWGdyQ3NvYUF6aFROem9XaVJ0dWZEeGRzQ0F1Y043WkJQcWVtczVJR3F1?=
 =?utf-8?B?cktZNnl3QjJjdGxhSlNrWkEzclpqaVREVFdMOXFCUWFEaE9jTU1zZnJlMnNs?=
 =?utf-8?B?TVJ1VmJxbENCM0NBSW5mL0VTaTYxN2ZpWDB5ZDhuZldKQjNKVnZzY2FRTFhm?=
 =?utf-8?B?SDFjZVhVeFRJTzdqSzEyTmtOaUVaWnlSTXBPVlgra2RTUjhjTSt3ZWx4anVi?=
 =?utf-8?B?eFRsUnlzR0VxL1M5UGZ4OE9rMmJSQ1k0U09xWlRnbGNXN2xUT2M5TmV6aFRC?=
 =?utf-8?B?c3Y5UmJnc1Z2WEJVZ3NFQzV4VlhNT3VxMmJFT092U2toMkdPTjVEdUNkSnhK?=
 =?utf-8?B?Z2Jmc05PazlCWmw0bnBSOUFaQ1o4ckVzSGlrYXJsYTRTMW1jRDlFS25pYVo4?=
 =?utf-8?B?VHp4RFVEaEZTNDhSWXVZMlpLeG5NekxUTHF3TkR6TGtQd1FjREhjMWtzU2pk?=
 =?utf-8?B?Y3g1M0RWLzhuR0FHQUV0OTd6aHhleEYveENwaHFIU2RwZnhzL2lVajZBYytD?=
 =?utf-8?B?ckQxNkU3bWpnR3FST3FjTFpPSWJLU3JNdWt2cHhTQVM1b2l1RGM4Rndmc2Q5?=
 =?utf-8?B?Qzg0cHJ0T0Ztc0FUcW1RU2VscHFCdmVlNFl2ZEtmejdJU3hrTVFScnFZWW1u?=
 =?utf-8?B?V1Bhb2ZkLy80M2hnU2xVbktucVhOT2NseE9zdC9tZHZJa0ZkUklOeURPNWk1?=
 =?utf-8?B?cXdEZ29NN3JWRUtTTjRhQTZUcXJTWVBiWGtvNzFWVXEzcUhRdGx5UURpYmZ5?=
 =?utf-8?B?RGUvWWowTG1zakxPNHk0UlQ2OGxBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0479a84c-4aaf-4130-0eb9-08daa6dd9753
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 14:26:28.5788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tcyR4DG7/NFGKT+W01apfDtDkoDQEp9IxoqVtxT8V9D651a7raeD+G2ivBdJCvfY2RT9yxBpWY0+KDQy5x+GgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5974
Cc: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Mohan Kumar D <mkumard@nvidia.com>
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



On 05/10/2022 15:07, Takashi Iwai wrote:
> On Wed, 05 Oct 2022 15:52:01 +0200,
> Jon Hunter wrote:
>>
>>
>> On 05/10/2022 13:29, Takashi Iwai wrote:
>>
>> ...
>>
>>>> HDA playback is failing on -next for various Tegra boards. Bisect is
>>>> point to this commit and reverting it fixes the problem. I was a bit
>>>> puzzled why this change is causing a problem, but looking closer there
>>>> is a difference between the previous code that was calling
>>>> snd_hdac_stream_readb() and the new code that is calling
>>>> snd_hdac_stream_readb_poll(). The function snd_hdac_stream_readb()
>>>> calls snd_hdac_aligned_mmio() is see if the device has an aligned MMIO
>>>> which Tegra does and then would call snd_hdac_aligned_read(). However,
>>>> now the code always call readb() and this is breaking Tegra.
>>>>
>>>> So it is either necessary to update snd_hdac_stream_readb_poll() to
>>>> handle this or revert this change.
>>>
>>> Does the patch below work?
>>>
>>>
>>> thanks,
>>>
>>> Takashi
>>>
>>> -- 8< --
>>> --- a/include/sound/hdaudio.h
>>> +++ b/include/sound/hdaudio.h
>>> @@ -592,8 +592,8 @@ int snd_hdac_get_stream_stripe_ctl(struct hdac_bus *bus,
>>>    #define snd_hdac_stream_readb(dev, reg) \
>>>    	snd_hdac_reg_readb((dev)->bus, (dev)->sd_addr + AZX_REG_ ## reg)
>>>    #define snd_hdac_stream_readb_poll(dev, reg, val, cond, delay_us, timeout_us) \
>>> -	readb_poll_timeout((dev)->sd_addr + AZX_REG_ ## reg, val, cond, \
>>> -			   delay_us, timeout_us)
>>> +	read_poll_timeout(snd_hdac_reg_readb, val, cond, delay_us, timeout_us,\
>>> +			  false, (dev)->bus, (dev)->sd_addr + AZX_REG_ ## reg)
>>>    #define snd_hdac_stream_readl_poll(dev, reg, val, cond, delay_us, timeout_us) \
>>>    	readl_poll_timeout((dev)->sd_addr + AZX_REG_ ## reg, val, cond, \
>>>    			   delay_us, timeout_us)
>>
>>
>> Amazingly it does not work. I would have thought that would, but it
>> does not. I am a bit puzzled by that?
> 
> Interesting, it must be a subtle difference.
> What about passing true?  It seems that the original code has the
> udelay(3) before the loop.


I wondered the same and tried that, but still not working.

Jon

-- 
nvpublic
