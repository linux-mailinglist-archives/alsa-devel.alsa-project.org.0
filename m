Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B8B34B14F
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 22:29:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2F061663;
	Fri, 26 Mar 2021 22:28:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2F061663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616794150;
	bh=Wdp6SB7WjeTvnqNWcvGCIpHFOkWm/vTc7qgVZBPix/c=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ev09o+S91ERSSbfMwy2+1sxZm7WPnaV/+WPFHZR9u0kYNjsZKQ5gaC5+AREy5f/sl
	 BD+RbZdVmUkCtBPCmMP716atTIPKCszTkKxRuZf5LPoX3zyvRiRI2vItzEQnTov2O5
	 b0MnqzKorvn1iCeQmNw1Zu0jHdSnx4aSym7rO3Lg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8457F80103;
	Fri, 26 Mar 2021 22:27:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7901DF8016B; Fri, 26 Mar 2021 22:27:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750059.outbound.protection.outlook.com [40.107.75.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEEE9F80103
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 22:27:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEEE9F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="vba/tnEj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/HajZCU86dzk+x4/TC5ZBLOdFqDW4qRkc7YKoKOdMYbz+xmXRWZNXyGfi4nh/je4DWExA2W0QtH/5qX5JKfljN8UA/maaTSsGc+iYnTXL4BifWw94uK0f3/wRt1gEjTMttQhAfJzLuojCGniBMuS5HOXKs/aH9YTNpqswA5DlNDIsWlskove2731yVc63o72sGSvGF0tJPbOSrNyuQeFdOpD16G4KrLGvtgJoWSdcZSs1hz8+kdQVnqJA7ELK1itUDFOO9eU6rGEHQ+NMl1G9iqrrKGHNhVm46lDphqRFZ/mQ8RYAkpA5WWvM915cT6AxUXKfHBz9A87I/zY1n4TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBFTJIqreDcaRU4cijf56H0ejf95xYFscDIrcHyrL18=;
 b=meVEmlxiGOuf65m6+2YQnkbvb8KUJEe/2Jrhl1b0uV5C9DBOROcz0OrbYZXRAUA13RU0GwL9ap776d/JYciKrTHFOT+C4+QGnST7HQ53BWgL0Klh4Z+EKSOkF1YuIVt2cYybMneEfkgD4ZHFZQ5M8J9A9cfM/Iy3ie216NfRrNlVtGKI3D1L8iKqp5J5O85yq83wgDcl0YjjbRgKazCG8m+Sx3MpZmdV8CZQsyzhZlhKs0000Gqya8uuRXLRC0l/KUFdlIUAPvMi6QhYumdqbF2pP3+BJDxpPCL1Yc/xevuCmwfJdujqcgcM8yNnre0MpAo7izg5vfMFBnlQ7xrJDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBFTJIqreDcaRU4cijf56H0ejf95xYFscDIrcHyrL18=;
 b=vba/tnEjKiCcA6OU1J4c1bdoiZ08XdOQHrgWh7xYHe1EWi0+boKta3Q0QbpxHPhBl+rrfvFf4UdRDTgYbevgr/UYmJj4CmvqLPAIc6OoNZ+4wCwUEkpkDxJynWACvxN1TLUI7oWDjqUESnjdmKcDSJ2rAEOn24mOa76JOZqivb0=
Authentication-Results: yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2398.namprd12.prod.outlook.com (2603:10b6:802:26::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Fri, 26 Mar
 2021 21:27:29 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8%6]) with mapi id 15.20.3955.025; Fri, 26 Mar 2021
 21:27:29 +0000
Subject: Re: Adding movable PCIe BARs support in snd_hda_intel
To: Takashi Iwai <tiwai@suse.de>
References: <e25017c6-e5e4-7a24-e793-14a2e70a434e@amd.com>
 <fe61113f-5b8e-53a0-23fc-65246eb08ac3@amd.com> <s5hwntyaylg.wl-tiwai@suse.de>
 <ca35a9c1-82d8-8be6-21e7-b5242a2d884c@amd.com> <s5him5hc443.wl-tiwai@suse.de>
 <30b36220-ff0f-d04c-1fca-349b3ff3a19b@amd.com> <s5h8s6dbyr1.wl-tiwai@suse.de>
 <9758cd4c-1246-a4ab-74eb-0e060248a00b@amd.com> <s5h35wlbwye.wl-tiwai@suse.de>
 <06b2dae2-a5ea-0cc8-891f-2aaff64ae260@amd.com> <s5hv99gan2r.wl-tiwai@suse.de>
 <d9bc41d7-bbad-24e3-6ad3-90e6dd8466c4@amd.com> <s5heeg4oak7.wl-tiwai@suse.de>
 <f97a59cb-869e-3e0f-305d-6d4a673f49c3@amd.com> <s5h8s6cnva3.wl-tiwai@suse.de>
 <65039cab-5561-aa9c-f270-8fa968a78f42@amd.com> <s5h5z1foh2q.wl-tiwai@suse.de>
 <cc6da2bc-268d-b9e9-a609-cb29276f24a8@amd.com> <s5hwntvkx2c.wl-tiwai@suse.de>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <7788be67-e78f-4738-0ffe-27d4717c6f58@amd.com>
Date: Fri, 26 Mar 2021 17:27:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <s5hwntvkx2c.wl-tiwai@suse.de>
Content-Type: multipart/mixed; boundary="------------0B01E64DB0B14B89306D1706"
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:3f2a:ecc8:e314:2b67]
X-ClientProxiedBy: YTXPR0101CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::18) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:3f2a:ecc8:e314:2b67]
 (2607:fea8:3edf:49b0:3f2a:ecc8:e314:2b67) by
 YTXPR0101CA0041.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30 via Frontend
 Transport; Fri, 26 Mar 2021 21:27:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e9a64f1e-e3f7-4d26-b8b9-08d8f09df541
X-MS-TrafficTypeDiagnostic: SN1PR12MB2398:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2398A3B50924757225EFE2A6EA619@SN1PR12MB2398.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p2Kb0xXZbeHo+bHqy0nWNyAXJXm++Ph3Y2Qh7WctuZwwEa6gYywDCM0Q98/wxXhdyaORQEwcm8+bcuLulULkuZJd4Vp/74rDPZZUT1NOrC3K+4CDZt8/oMy2ghUtBTn7VYpO7g5jYmzpQ50A5ur8UWUbgFje+WJ5A8XAHuRc9PjITauBNvSPkHGtNeh0JArsTzzDZmg/7bkjKn07caLk79uM75l1g+kPkkAQ2EHtCHngDWP8tMPp1dL4GWJ6lrqcgC0jJ0HXgS5ONAU43DlnA5vFmX5JsxG5BKt+lzEo3Eei4jbKR0WTgVAeCL1a3VrZ1we6XbduzxldT8B//HLA9HQH6Ua2BL7nS3Nrim7EksUeaAU24w7H2/Cut2fgImXkWNU1/sHsUCvgo9DBBgyAheJyfHNAa5z5FfnGZCZdOO2PRY1cppBRLdZfuLGLVyJtoE9bV+Xk4s0nVLj3DmTNKxAygS+EMZe38AQvV4gxO05XdayiPgKzLY7XBS5YUs0DhJknRD/yjQSOdrCUQZ3ka3vPDnJlAptMBvt7LsStXDf6Sk0hZ3K13hH+tIFRZVkM8gpww4s83wzoS1NIkA/1oPV9ugeb5H8VzZWFT/UIvHugEMX29F+W4kkEDlibC+DymH9nCaiN0NgZ3VSS9cbhk32bk9Shb4LIUosRjal++79TJqQUzqSPEOJF6xb1BSdFv05bZuoy/e6thONU7eU8fBAsDdH2k0ojyhyO3qtpXKg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(8936002)(6486002)(31686004)(66946007)(83380400001)(478600001)(31696002)(53546011)(66556008)(33964004)(66616009)(52116002)(2616005)(66476007)(86362001)(44832011)(38100700001)(36756003)(4326008)(316002)(6916009)(2906002)(235185007)(54906003)(16526019)(8676002)(186003)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aXRrNmJwM2FRTDJhcXhHczlrVDY2ZERXNFd6M1pLN1lIOHpjZmhBY0l5dWRY?=
 =?utf-8?B?dWVUdkg1TjdvdGxlaUM5bTdwL0lFVVNCdDJkTkRBNnMxclVHaUZnZkk1L2tU?=
 =?utf-8?B?ZUQrVHN1QWw2b0p5Ui9pMXVDQ0JOWERTcXJGVHRKRGtkVUhlVjNUYm8yd2ZY?=
 =?utf-8?B?dzVNcFlBb1plUStOdzNTa1RLNk12TjBwSTRvM1V3bnVFazFnQjFWZ3RDNy9q?=
 =?utf-8?B?aTFvRGc1WHdaU0NJVndWZjlaWmlrcUhtZlFjT3ZERnZqTjdRSWJlTjF0d0Va?=
 =?utf-8?B?STZHRnc0VXRBQmx3Z3VGUWdidzBGL3NKWTVQV3Z4ZERGdXFnWFUxV2JlTkRK?=
 =?utf-8?B?Y2sxeEh2TDY1MWFZM2w5allzbi94aDR5V2VaOFI2WGV2aEEvR0t4QXg2L3p2?=
 =?utf-8?B?Z3V1dG1FTUFmaDJ0eTB1RjI4SVRSMm9QWGVPYVlKRXByaVhCdnh6dzlIY2xH?=
 =?utf-8?B?VXJ5ZnMzTFUyQmRCZGszZlg1K3RndVVTUThMMTVTeFRjeHViVXBmZ3BiUCtP?=
 =?utf-8?B?NmVuYkFDUFRZRnNXL0JwM1BaeGV2S0szZmh6ZzhreUF5VHgxWDBVWUpsbDZI?=
 =?utf-8?B?MFIxQ3BTRGVDNVVuKzJjQ1h4WS9LdVVHSVAvbCtxak5ZZE1mT2FhS1Q5ei9r?=
 =?utf-8?B?THdZNDZGczVFRXZQZjZCYjBFL0VhUVB5ZWRybDhKRkdDMk9lVVd3ZHdMNFJh?=
 =?utf-8?B?aW91OVNJdmR1Z2pBNWkwNlBNakFJUzdVdThkckxGU25VamVoZ09jaXE2dmor?=
 =?utf-8?B?cENPbHRZREk3SDFKbHIwVXU2M1ZYaTN5ZWlRZmtETUNORGZabHhRZDEyamxh?=
 =?utf-8?B?QVdxR2V5azRvUFhTM1k1UzRuT1ovRXE2Y0tYMEZ1V0tQdkdKOHRIdy8xOFdM?=
 =?utf-8?B?a2VBL0I5T2V1TURWdzFoVDRvOThBNFRvb0h1RFNTNFlnNG9Ic29pYWxhQThm?=
 =?utf-8?B?KzUyUVZVT3pYODkwK05MNXI3Ynp1NmYyaVBIdjZaL0tGYkttVTluQXIzZzJW?=
 =?utf-8?B?cHk2bjlURllxV1VjSCs1aklGRFRCUm9FbDREN1BzbHI0S3BSK1FwWnpvV1p1?=
 =?utf-8?B?c3RTYXZ3bnFZOEJTUWIzREc3ZVByay9uR1R4WWFhSEVUR1FRNlhyT1Vvekdp?=
 =?utf-8?B?Z0RsYVhoTVRuYzZuZUU3OGsvU3BZQnlGU3RMUGwyL2hvemd2UFYyTzV2TXpT?=
 =?utf-8?B?T01Sem1PSk93YUFZblRRcWJ1TkI0bk5RWjUvQXN2eW1VNllySWpzanZoRzJw?=
 =?utf-8?B?aWFCa1hLc1o2ZGJITFZPN2tNeU1BejdCNlUrenRFaTBmdXkrOURqYnlLb0Vq?=
 =?utf-8?B?cm9BWUpUWUpaMjJ0aW5zdmRPSGtva1o4YWxnUVBpK3FXemVKNTJ4S3V5djJh?=
 =?utf-8?B?OXhmMmVKVGpaRXdOSlE0YmI2cnpoTnZKZElLZjNnSU4wb1oxaWpWdE9EbVJ6?=
 =?utf-8?B?U1VSemtKUWtVYWtvcEdvdjByb0FCa0kxbjRxcGMrM1kyci81U2JoYVdZU0V5?=
 =?utf-8?B?WUtZSUtzc3VvWWZkZE0xRG1OQjhaQ1ZFOXphM21ZZkR3NWg3TXJPcHhjK0ZX?=
 =?utf-8?B?S2hHcXYrWlo5djdnQ01pQ3NRaUxKZ1g3aXg5UitScjhtUVhVcTJpdnVkaFg1?=
 =?utf-8?B?VDdxOEIwdzFsT0xEOHVkR0kvNTJnMENBSEh2Uk5HbFVBaDR2RGpsVllUdWJU?=
 =?utf-8?B?NjR0RGdHZlNMdFFxb3VUS2tseVprTjJoU003bnAwQW93eHZlNkRsZ0NNR3BK?=
 =?utf-8?B?T2JKMUw4T1hVK3FmblNZdVdLM3lzTGlHOC9GaDNGN0p3TSt5UTdGWlF5bzJj?=
 =?utf-8?B?MTRZaERXU3pKUk5aRzBUS3NYdmt5UFJLOHZnNVEreHZjL2FteUwxZUM1Q0pB?=
 =?utf-8?Q?j+dixdFsvcP9k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a64f1e-e3f7-4d26-b8b9-08d8f09df541
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 21:27:29.5327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vtwawetRoNX6YPNrxlQQc1oeDSpSKyTvOJZ79PNNGFhKh1uUrVN8c3g9V8xi6l0hhusp20w82NSccwpEZafrYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2398
Cc: "Alexander.Deucher@amd.com" <Alexander.Deucher@amd.com>,
 alsa-devel@alsa-project.org,
 Sergei Miroshnichenko <s.miroshnichenko@yadro.com>,
 "Christian.Koenig@amd.com" <Christian.Koenig@amd.com>
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

--------------0B01E64DB0B14B89306D1706
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Attached.

Andrey

On 2021-03-25 12:38 p.m., Takashi Iwai wrote:
> On Thu, 25 Mar 2021 17:13:41 +0100,
> Andrey Grodzovsky wrote:
>>
>>
>>
>> On 2021-03-25 2:58 a.m., Takashi Iwai wrote:
>>> On Wed, 24 Mar 2021 22:43:24 +0100,
>>> Andrey Grodzovsky wrote:
>>>>
>>>> Few comments -
>>>>
>>>> 1) Why we don't use snd_power_wait_and_ref in patch 3 in the common
>>>> handler ?
>>>> Don't we want the PCI rescan sequence to 'wait for' any in flight
>>>> taks that might be accessing registers and not only read/write/tlv
>>>> accesses ?
>>>
>>> Right, we don't need to block all ioctls, but only the ones that may
>>> access the hardware.  So basically the patches 3-5 can be dropped if
>>> we take the patch 6.  The current patch was written on top of the
>>> previous series, that's why it has both.
>>>
>>>> 2) Possible deadlock -
>>>> In azx_rescan_prepare - you put the card into SNDRV_CTL_POWER_D3hot
>>>> first and then 'wait for' all in flight tasks with the refcount.
>>>> The in flight tasks on the other hand, using snd_power_wait_and_ref,
>>>> may have already bumped up the refcount and now 'wait for' the card
>>>> to go into SNDRV_CTL_POWER_D0 which can't happen since PCI rescan
>>>> waits for the refocunt to drop to 0 before proceeding.
>>>>
>>>> Instead of snd_power_wait_and_ref can't we just call snd_power_ref
>>>> in common IOCTL before checking for power_state != SNDRV_CTL_POWER_D0 ?
>>>> Or is it because you don't want to fail IOCTLs ?
>>>
>>> No, this is the intended behavior and should work as-is because
>>> snd_power_wait_and_ref() drops the refcount in the loop before
>>> sleeping.  The inc before the state check is a must for covering the
>>> possible race, and ditto for changing the power_state to D3hot before
>>> syncing.
>>
>> Ohh, missed the refcount dec in the wait loop... My bad.
>>
>> On boot the latest patch-set was throwing refcount warnings since
>> u are not supposed to inc from zerro count and so I fixed
>> with the attached patch. That way seems to work fine.
> 
> Ah, I completely forgot about the oddness of refcount_t.
> Then I guess it's simpler to replace with atomic_*() instead.
> 
> 
> thanks,
> 
> Takashi
> 

--------------0B01E64DB0B14B89306D1706
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-ALSA-Fix-refcount-splat.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-ALSA-Fix-refcount-splat.patch"

From 0347ad666d2f0a20d1074a64dc5a1f6d9cec44b2 Mon Sep 17 00:00:00 2001
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Date: Thu, 25 Mar 2021 12:07:38 -0400
Subject: ALSA: Fix refcount splat

Righ on boot bellow WARN observed

Fix by setting refcount to 1 and also
drop the optimization in snd_power_unref
since I can't rely on atomic refcount_sub_and_test
anymore.

v2: Switch to atomic type instead of refcount

[   41.710577 <    0.000078>] ------------[ cut here ]------------
[   41.710580 <    0.000003>] refcount_t: addition on 0; use-after-free.
[   41.710603 <    0.000023>] WARNING: CPU: 10 PID: 2781 at lib/refcount.c:25 refcount_warn_saturate+0x86/0x110
[   41.710614 <    0.000011>] Modules linked in: snd_hda_codec_hdmi(OE) snd_hda_intel(OE) snd_intel_dspcfg(OE) snd_hda_codec(OE) snd_hda_core(OE) snd_pcm(OE) snd_seq_midi(OE) snd_seq_midi_event(OE) snd_rawmidi(OE) snd_seq(OE) snd_seq_device(OE) snd_timer(OE) snd(OE) input_leds led_class joydev kvm k10temp drm(OE) drm_panel_orientation_quirks(OE) igb i2c_algo_bit pinctrl_amd
[   41.710679 <    0.000065>] CPU: 10 PID: 2781 Comm: alsactl Tainted: G           OE     5.11.0-rc3-pci-bars+ #7
[   41.710685 <    0.000006>] Hardware name: System manufacturer System Product Name/PRIME X470-PRO, BIOS 4406 02/28/2019
[   41.710689 <    0.000004>] RIP: 0010:refcount_warn_saturate+0x86/0x110
[   41.710696 <    0.000007>] Code: dc dd 27 02 01 e8 22 92 9f 00 0f 0b eb d9 80 3d cb dd 27 02 00 75 d0 48 c7 c7 40 f0 d9 83 c6 05 bb dd 27 02 01 e8 02 92 9f 00 <0f> 0b eb b9 80 3d ad dd 27 02 00 75 b0 48 c7 c7 a0 ef d9 83 c6 05
[   41.710701 <    0.000005>] RSP: 0018:ffff888259bcfb98 EFLAGS: 00010286
[   41.710707 <    0.000006>] RAX: 0000000000000000 RBX: 0000000000000002 RCX: 0000000000000000
[   41.710711 <    0.000004>] RDX: 0000000000000027 RSI: 0000000000000004 RDI: ffffed104b379f65
[   41.710715 <    0.000004>] RBP: ffff88816a60ef40 R08: ffffffff822b270e R09: ffffed10df33e014
[   41.710719 <    0.000004>] R10: ffff8886f99f009b R11: ffffed10df33e013 R12: 0000000000000001
[   41.710723 <    0.000004>] R13: 1ffff1104b379f79 R14: ffff88816a60ef40 R15: 0000000000000000
[   41.710728 <    0.000005>] FS:  00007f0e1817e440(0000) GS:ffff8886f9800000(0000) knlGS:0000000000000000
[   41.710732 <    0.000004>] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   41.710736 <    0.000004>] CR2: 00007f0e185f7000 CR3: 00000001532fa000 CR4: 00000000003506e0
[   41.710740 <    0.000004>] Call Trace:
[   41.710744 <    0.000004>]  snd_power_wait_and_ref+0x315/0x320 [snd]
[   41.710768 <    0.000024>]  ? snd_card_new+0x5e0/0x5e0 [snd]
[   41.710790 <    0.000022>]  ? lock_acquire+0xee/0x570
[   41.710797 <    0.000007>]  ? lock_acquire+0xee/0x570
[   41.710804 <    0.000007>]  ? lock_acquired+0xb4/0x5a0
[   41.710810 <    0.000006>]  ? snd_ctl_ioctl+0x240/0xb60 [snd]
[   41.710832 <    0.000022>]  ? snd_ctl_find_id+0x161/0x180 [snd]
[   41.710855 <    0.000023>]  snd_ctl_elem_write+0x1c4/0x350 [snd]
[   41.710878 <    0.000023>]  ? copy_ctl_value_from_user+0x2f0/0x2f0 [snd]
[   41.710901 <    0.000023>]  ? down_write+0x16c/0x2e0
[   41.710907 <    0.000006>]  ? snd_ctl_ioctl+0x240/0xb60 [snd]
[   41.710929 <    0.000022>]  ? rwsem_down_read_slowpath+0x5f0/0x5f0
[   41.710935 <    0.000006>]  ? _copy_from_user+0xa0/0xf0
[   41.710942 <    0.000007>]  snd_ctl_ioctl+0x24e/0xb60 [snd]
[   41.710965 <    0.000023>]  ? snd_ctl_elem_add_user+0x150/0x150 [snd]
[   41.710988 <    0.000023>]  ? selinux_capable+0x20/0x20
[   41.710995 <    0.000007>]  ? kmem_cache_free+0x145/0x390
[   41.711001 <    0.000006>]  ? lockdep_hardirqs_on_prepare+0xe/0x210
[   41.711007 <    0.000006>]  ? blkcg_maybe_throttle_current+0x7f/0x7f0
[   41.711014 <    0.000007>]  ? call_rcu+0x20b/0x3a0
[   41.711024 <    0.000010>]  __x64_sys_ioctl+0xe0/0x120
[   41.711029 <    0.000005>]  ? syscall_trace_enter.isra.0+0xc9/0x270
[   41.711036 <    0.000007>]  do_syscall_64+0x33/0x80
[   41.711042 <    0.000006>]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   41.711048 <    0.000006>] RIP: 0033:0x7f0e183eb50b

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 include/sound/core.h      | 6 +++---
 sound/core/init.c         | 3 ++-
 sound/pci/hda/hda_intel.c | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index 0b220bfe001b..8ac6647bc39a 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -126,7 +126,7 @@ struct snd_card {
 #ifdef CONFIG_PM
 	unsigned int power_state;	/* power state */
 	wait_queue_head_t power_sleep;
-	refcount_t power_ref;
+	atomic_t power_ref;
 	wait_queue_head_t power_ref_sleep;
 #endif
 
@@ -152,12 +152,12 @@ static inline void snd_power_change_state(struct snd_card *card, unsigned int st
 
 static inline void snd_power_ref(struct snd_card *card)
 {
-	refcount_inc(&card->power_ref);
+	atomic_inc(&card->power_ref);
 }
 
 static inline void snd_power_unref(struct snd_card *card)
 {
-	if (refcount_dec_and_test(&card->power_ref))
+	if (atomic_dec_and_test(&card->power_ref))
 		wake_up(&card->power_ref_sleep);
 }
 
diff --git a/sound/core/init.c b/sound/core/init.c
index cb0ad0883329..d26f904e9d45 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -215,8 +215,8 @@ int snd_card_new(struct device *parent, int idx, const char *xid,
 	mutex_init(&card->memory_mutex);
 #ifdef CONFIG_PM
 	init_waitqueue_head(&card->power_sleep);
-	refcount_set(&card->power_ref, 0);
 	init_waitqueue_head(&card->power_ref_sleep);
+	atomic_set(&card->power_ref, 0);
 #endif
 	init_waitqueue_head(&card->remove_sleep);
 	card->sync_irq = -1;
@@ -1007,6 +1007,7 @@ int snd_power_wait_and_ref(struct snd_card *card, bool ref)
 	/* fastpath */
 	if (ref)
 		snd_power_ref(card);
+
 	if (snd_power_get_state(card) == SNDRV_CTL_POWER_D0)
 		return 0;
 	init_waitqueue_entry(&wait, current);
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index b6d118c2b75b..11138b47fc73 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2457,7 +2457,7 @@ static void azx_rescan_prepare(struct pci_dev *pdev)
 		azx_prepare(&pdev->dev);
 		azx_suspend_streams(chip);
 		wait_event(card->power_ref_sleep,
-			   !refcount_read(&card->power_ref));
+			   !atomic_read(&card->power_ref));
 		list_for_each_codec(codec, &chip->bus) {
 			pm_runtime_suspend(hda_codec_dev(codec));
 			pm_runtime_disable(hda_codec_dev(codec));
-- 
2.25.1


--------------0B01E64DB0B14B89306D1706--
