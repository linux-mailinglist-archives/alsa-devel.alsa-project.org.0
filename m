Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A58F533EDC
	for <lists+alsa-devel@lfdr.de>; Wed, 25 May 2022 16:10:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98D4416FC;
	Wed, 25 May 2022 16:10:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98D4416FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653487856;
	bh=iqFVv4Tm2thw92Ne73pdKx2kiRpvaQNsrBuC2btBPlE=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lkFTdqEH4nTyfsiDdRDBjTxhZXVhYxsEdatIO0vU9wgTMzVy5EQUDp7VJ8IQEE2CC
	 +J8TefokQlaevaGUCQo7TJb729C6/kKfpmW8ymBCvOIQvFAlTf6Ohl/9hACrIIR4N3
	 Gt/NKgqgWDjL+YE4NgogQ8YC8ANdOh1EjBlrgdMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE1B5F80524;
	Wed, 25 May 2022 16:08:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BEBEF80238; Sun, 22 May 2022 20:55:32 +0200 (CEST)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2070e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::70e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DAB2F800CB
 for <alsa-devel@alsa-project.org>; Sun, 22 May 2022 20:55:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DAB2F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=WallaWallaUniversity.onmicrosoft.com
 header.i=@WallaWallaUniversity.onmicrosoft.com header.b="Wf7FcZ4t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aI+z4XJsEMalh3qA3ATt2QT5pXCytqfO2jQdyuZTZXBzqAvuIWggAAiL5dv116G77iKg7B2TrpQ0oWAUdo4ceLkXdd3Nozk5qChIQcRtgCN3kaOUT2liLoFfpCAnbCOGV9HAqfkJEA9ID6txHTQqteWxlMgZ0s09itwYa+0i2XlIrrItoAf6oF/xNUCz+/cFF44iomdhvxZfN9SRldhf0phrzzo/NgHa/oqY/XknNI7KkTT/X2tQR9yAraXAs7IP31cpa2QlWza0ZkDMnYa2WONX7GFxYMQvEq/fUaHtEhLtAz0PAbaEjfGWePnpeITlkFlYAq6skOO9mK29gJI/cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xo+aVQ0Fv4MdK2FoNEbCEqq/VSwojB53g13o8ffscGs=;
 b=dSRXAo6cj8PgHNDXZfGbGKe26RL8u+eqw/tV7gqwh8t7TOJHPd91KqFActfvCQjOCvJ6gpTJ0/7Tuw6d1vPsw1BSpZiEL0NmAbtWTB/rfHnaPTRwSjnvW2q5Et+7GXahKzZW3I/QcUpMZXPLQufAuYrcfv/QslHQvXEEWWz6M1wuz1iRF1i2+XEaBRexBB8gtXVzBUESEuJAm1jSAVRmGMxHRjynen+yAtZt8VjLz/aMECVzhlJXcConHCejB/Yur/rCUlr7TS2wLhBktgPFDbGkNka23U62YAEmlESacnqurMcaWqIEHIS2tqoqMEDOdDQTeEHKXrqmCPue7zdGZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wallawalla.edu; dmarc=pass action=none
 header.from=wallawalla.edu; dkim=pass header.d=wallawalla.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=WallaWallaUniversity.onmicrosoft.com;
 s=selector2-WallaWallaUniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xo+aVQ0Fv4MdK2FoNEbCEqq/VSwojB53g13o8ffscGs=;
 b=Wf7FcZ4tquaOsx9YR9I2cn/5au67JM0XJykP2/Kg7WGBqyqXd0Pr8ebG/sK0rEBc4AAbE5GVP+8iIgU7eGRKnMMLdW9lk5ifCdUq2yVx0bRCIqLnxMuaC/ouIG6yDmOkILd35qou78cU3Ilj/J1oqgU3JzFfpLwX7ZYWDXadH0s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wallawalla.edu;
Received: from MW4PR07MB8681.namprd07.prod.outlook.com (2603:10b6:303:106::13)
 by DM6PR07MB5228.namprd07.prod.outlook.com (2603:10b6:5:1e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Sun, 22 May
 2022 18:55:21 +0000
Received: from MW4PR07MB8681.namprd07.prod.outlook.com
 ([fe80::583e:91d7:6aee:6485]) by MW4PR07MB8681.namprd07.prod.outlook.com
 ([fe80::583e:91d7:6aee:6485%9]) with mapi id 15.20.5273.022; Sun, 22 May 2022
 18:55:21 +0000
Message-ID: <69d458d9-b7cf-4a46-ea97-5b1969c820ac@wallawalla.edu>
Date: Sun, 22 May 2022 11:55:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
To: alsa-devel@alsa-project.org
Content-Language: en-US
From: Rob Frohne <rob.frohne@wallawalla.edu>
Subject: Is it possible to set the CM6533 so it has 96 kHz sample rate on
 capture and 48 kHz for playback using ALSA?
Organization: Walla Walla University
X-ClientProxiedBy: MW4PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:303:dc::29) To MW4PR07MB8681.namprd07.prod.outlook.com
 (2603:10b6:303:106::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0303b71a-59d6-4fca-3180-08da3c249ead
X-MS-TrafficTypeDiagnostic: DM6PR07MB5228:EE_
X-Microsoft-Antispam-PRVS: <DM6PR07MB52288530E3CE7D797C178F79E9D59@DM6PR07MB5228.namprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6EVI9y3fMEVFIhO1lPJy2x6b22jHeTVSaXcHityjZiqx37kx3REKbCNpnwLvgrdW/kzRrNrprU9sWXnvtA2ea2wsQJLFlTaiApcI6nbpBXpbmseh6zwWUk1U0y7fGxDVdLWSg4ltngJBTmxBKWcfq4Iy3mQdX5DqrTUvoVG9FU7KT0hOquAuzV3yNUDcZrqec2n0OwSVbHu4h3/qhRPEB4ROqS/P5THWSSH9C+2YuFgc9CKYyo+aAPfJepb+hrfBuEcokPn75Unq8psTg9+kNucpHjo/irotrHKTKIWk4FO3Y6lXa0uZ/BEJH0SRP4Gq8QUp9HCEFZds4rSCeSDeaCgpGbh+3ehX3kkbF3EzQ3FIWnSsFHtcNyMvxegndNLEm/5AaZFG3fPcYJlLObfJQj0XuZwSC7B0ZhveTcaV4lAvnWy6uu7f7wDe4Ilc3LjtkGyk97yMu0BQWzrhzv/V+xVKVcDgyLdxC4nw9OGdO7UxV9XOopVZCKC3qs2krDwpeiQQ55HbYV5aUamuc1qayNENGHvB4xjmZLepqOVtvkoi6tGGurSGeI4mCDng4eYKufQeRd+rpUcj1VdpUHAej9EEt9GLLVW9Wd5B2K5H+/Jt6jKqX4+9blV/vUxa4agLHiKXwgQb7OBkbfVAwl9IHE9tDZL0blliEPkVgijMk95E3Q59OiRWanb9/QP4BJQaIDCib1ulObRlgaHOyRePuQenWM7NcWUW2IptfyV7fLreLIQnkkyOeURJnbNH5pjyvVFiQAJKwckbJiracYWHzzhhS4K+YBFztfK3JM8CpMm1GPXJ44FIwpRSqeWtda8k
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR07MB8681.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(36916002)(52116002)(6666004)(2616005)(40140700001)(6512007)(26005)(6486002)(186003)(38350700002)(38100700002)(33964004)(6506007)(508600001)(166002)(21480400003)(2906002)(21615005)(31696002)(75432002)(36756003)(31686004)(86362001)(8676002)(316002)(66476007)(66556008)(66946007)(6916009)(44832011)(786003)(5660300002)(28085005)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0RQbkhFdkM4VyszbnVCQ0F0b2dyZDRXdi9EZHZBY0U2eUFIYkxManByaUxJ?=
 =?utf-8?B?UmlnQW9GT1VjRG1pZU55RmhCNy9NT1lvSm50VVczamRla3NwWURCUUUyVjdM?=
 =?utf-8?B?U3FybmxRUzhCYmJGN0tOcm14NjFzN3A5enRISTJkd0pRTXFYaVIzUUZjZ1hp?=
 =?utf-8?B?OWU3SnNUV3FXU2lSZTJORTdsaVVVcFA3Ny9XMXgvQnFLdEZESFZEY3g1ZkIv?=
 =?utf-8?B?alg4QVNIRGZya290ZXB2aWRtQ3RjTnUvRGlLMElvNkJZUzVzTkNBL1F0ZmNB?=
 =?utf-8?B?VU43dkVuOTBiRDAwellkYUxTSXk5L0dvTGgwS1FDNkkyTmlOSEZOalJmNWVi?=
 =?utf-8?B?Zy9tcHhrdUgwdWZWNDFmd0FoT2VWUGJVSzcxQ0FETDV2Tll3OVMxdWtyMW5a?=
 =?utf-8?B?OXBhUDFEZlB0NXFVdUFSR2d0Z2swd1dhKzZodzFWV3RyTjZnT2Vyc1pwZlZj?=
 =?utf-8?B?VFMrNXYxZkIwRFlYY3ppMXdzRThOdWhlVjlublNZTEFGamRmN0tJV2FJay9E?=
 =?utf-8?B?VkNLM2pIWUVmWlM1WTVqdTg4dmZCQTEwYlhlSU1nWmw1M1E1RjF4emF0Sjg1?=
 =?utf-8?B?SlViYVJxemliSmQvNFJMeE5ldU5EREhvSk5lWmRHZFpEbTBocW5ySTZhSURY?=
 =?utf-8?B?TEl4bzdnYUROTFJNazVHcEJLMWpSdUQrTHR5bkNXcmFEOUdLenlzaDlwZmdo?=
 =?utf-8?B?YmI5NXZSY0w2ZTUrZWZqT0tjRXZ2L3dSTENwaWQyZ1ZFRU9iNnR6aEhNSjF4?=
 =?utf-8?B?OXlVOWhaL29hWDRYTExURXNOZk5QcjgyT1B4clF3NUlmdFRPSEFIU3pCY0VZ?=
 =?utf-8?B?SlVpT3ZjNU9CWXlzOENZbm5aMzE0UVZmbHdlRjZxRFBNNXZTa0xGMyswT0t0?=
 =?utf-8?B?Z3l5ZHBQS2pKNUFaenlSTEI4M29PZW4ySW1xdndIMVMvSk5laU9nb1ZGaU5v?=
 =?utf-8?B?anlNeWxvZ1oxYmlHOURFdXdvbXFHYmpCditRdUM4Q0RGc0REdW5JNFVqVXhu?=
 =?utf-8?B?ZmlLckMxZUw3Y1M4MGZkdTRLbFRPWlN2emRKMUdCdUtUZ256ajVWYUdmVFlY?=
 =?utf-8?B?bnhUVitTK2VYNkVrN0wveHYwb05WUHh0a2w1Uy9PMEcxUmNFVDZYTDd6bVJs?=
 =?utf-8?B?d2pRVURTUkk3OHdDZ2MrNVQ1ejhNOEt6S0kzU1pvamxCZ050aWxVNWJ0eVJU?=
 =?utf-8?B?cFEyWUF4bDJFSVdGMm9MczMxUmppMGpmekFOdlgxMFR3VjVEMnVSdkZHUTRl?=
 =?utf-8?B?TjZFRktHbTNReWFubzdhVWdqYXEzSzFjVjdLL3Uyd2FhOWxTKzBkQy9RRVNt?=
 =?utf-8?B?WVA2aFJ1YXF6a1pMRmpSUFlGRVNGSCtoMHptdTl0dm1FUjJaVzlrVEZNZDZF?=
 =?utf-8?B?UUZQQlNsY09LTHB2NEpsRVdMVFBqZFU4R1p0ZG9TRFVqQkxTL2tjdVNVdnZO?=
 =?utf-8?B?MmpZTUgzV2hUSyt4NTVQSTVJb0hGM2JvNkV6TUpQMlh0KzFab2JsaHFqaS81?=
 =?utf-8?B?dWdWZXpmN0ZFTDJTcGdvbjhQSlhHQXBWdVRzRERNQlJyRDU2OUtya2ZhbExV?=
 =?utf-8?B?dm05SXdOS1pCdm1ZRVFOVjR4VUJJVk9FdEhaZUtJakFDdTRSWS9DTzB3RkRq?=
 =?utf-8?B?VGZkM0JtVHphbTZQWEo5a2FKajhWUFpCWmdabzJIR3A5OFpPZXVTNWNTcGRQ?=
 =?utf-8?B?VXloVkdyYzZ1aXRiSmQwQy9wb0pVNWdBd01hK1A0dWVwNU9Seit6VmJSVmJT?=
 =?utf-8?B?Q2FzL0lKUUVMdTRVSlMvSFFCV0VBc0dSUUZxT2JVUVd3elU4UGlVQzQvYkJi?=
 =?utf-8?B?WHpzd3VDeFdkcUIvYXQyY2JaZTFSUS8rOG1MUWFvM2YyZXZJdE9PcEhBSVlw?=
 =?utf-8?B?ZmhtazdxbWFTbDhiR3IzVU1GaldIcC9COHdHcVBvY0wyeFpnMms1Mlc5MUlr?=
 =?utf-8?B?R050aWdqK0YxaldSd3laVFpxbmFEdXh4THlXWEw4K2NHYjNOaG1GSGJUSFFi?=
 =?utf-8?B?RE1ubzl4Um9PMUtDQ0phSUZZS1AxYTNsbjFPUWxyUk5JdnVnekJZSHF5NENv?=
 =?utf-8?B?bUlqR2VNYStwUG4vZTY2RHRyZmtheUsvbGhCOFd4NGt1bzl6U1oyR3ZtYmRZ?=
 =?utf-8?B?Tm56cW5aWWFEVFRGb1VMano5TXludmVxWGIva2prMG01dGtnOGpPNzZWNVdi?=
 =?utf-8?B?ZmpNMnh4Q0pqQWgzOHdlMXc1ampxL2hvbzFnanhGVkRQb2FQblBGSmY5U1Bm?=
 =?utf-8?B?WXliYkU5c1lQRjlYaFpHVkhjekNVNDRENzFkQ1NnWDJjdnRiMXYxaDVyekxL?=
 =?utf-8?B?Wk1hZWxnUDlNWUEyRmdCaFVXWjBJL2Z3YkRnTm13MWxYcmhOUVpINW5YSHk5?=
 =?utf-8?Q?QFA3svLsNqiLKPFc=3D?=
X-OriginatorOrg: wallawalla.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 0303b71a-59d6-4fca-3180-08da3c249ead
X-MS-Exchange-CrossTenant-AuthSource: MW4PR07MB8681.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2022 18:55:21.2187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d958f048-e431-4277-9c8d-ebfb75e7aa64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A30UAsgULoeBQd7jx8zDcaxUYZzunNLr+2Xs09kBdlTX09OZyuAEsYUGAP4DH94ScJmIr3urhxamO/CevvW0FnmeDv0lgjTpznFhmC2lFyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB5228
X-Mailman-Approved-At: Wed, 25 May 2022 16:08:39 +0200
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hi All,

I found this thread 
<https://www.alsa-project.org/pipermail/alsa-devel/2017-November/127289.html> 
on the list that explains why I cannot get 96 kHz sampling with the 
C-media CM6533.  Reading the datasheet 
<cid:part1.yl7hLKYg.W0fZhG6J@wallawalla.edu> it is tempting to think the 
mode I need for my class QSD SDR receiver project, (96 kHz sample rate 
on capture and 48 kHz for playback could be selected perhaps by ALSA in 
the HID interface). Is this possible to do with ALSA somehow?

The sound cards I purchased for my class on Amazon from Syba, used to 
use Via VT1620a codecs, but now have been redesigned to use the C-media 
CM6533, and these have the limitation that will not allow 96 kHz 
sampling on both capture and playback.  I need to change the present 
setting (96 kHz playback, 48 kHz capture) to the opposite.  Page 7 of 
the datasheet has a note about this.

Thanks,

Rob

-- 
Rob Frohne, PhD, PE
Professor
EF Cross School of Engineering
Walla Walla University
100 SW 4th Street
College Place, WA 99324
(509) 527-2075
