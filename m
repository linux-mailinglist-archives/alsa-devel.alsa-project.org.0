Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E68349682
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 17:15:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6F30166A;
	Thu, 25 Mar 2021 17:14:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6F30166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616688930;
	bh=WTiqjGkJbejPT8ktKUJ6kfIxlDScLLDhiRfWXXmCT80=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=go9F/CvHr298DPEkSO+MyCeWG+0D0dj2W0jGB6suTY4VuWFYv64KWvwYmjvDoLVXi
	 ewf9YoB3Ijo+qMxYfPayfKa8tAnkJEp3yVvOtK32H/E6wx63WbNZlFAk8VFH+fMpXv
	 +Kuy7zhiiGbBYLTNxzMOZYfJ+CsRbL77kaozdgLw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 189A2F80268;
	Thu, 25 Mar 2021 17:14:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09363F8025F; Thu, 25 Mar 2021 17:14:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E777F80104
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 17:13:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E777F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="3d9z9w+X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrnTdVN4Bxrr3ezfuTKQ7OshM8KfNic4dx3wMZGJi4lByW2C8HAPaDk/WLXSWATNFP87LDFPm1P953htKCsaonM3LPqVsZrrNa4Iq7M28zBsuRaxZVecAHuwsgWoU5z0z29Jh9Oy/jpXBJtVi0yklLlRJknqWmMgiIxb+beMGsdV1H7hU4tXDtwl25e7w19kR73/rcpYdFSrRMKtR3Z4b6s/GCMPcHRpu++Jfm56FC5byxW/7t9eUez86P3zC28T6f0Y/xt6Z8LLptBsi15geAOD3p3Je4QLadOOGP5rWub2toC3UX044cF/O9Om8qoD7owEMT+MMFilYoyi6N5gVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFvdmwGlW6tewWa8qgpgTmWXQvuUJAK0lfw/vp9E7d0=;
 b=nzDXiF5TVPemprswSI74DrtJngJAq8UPix887mBqqayH8ShoWsGP/yvfIuzvxiJ4fuM8PIrX4zqXtiUGcVBrNk9B7b+UEqvabSiHuKc3xOIqSYZruReOeg7poCG+P/hDb46A/HBJtaI4fMwqzmjetHitBnofAY3tCl+c4eZUE8pIg+r8ndawbww7YUklJTv/Oz9SWHf04biPh7hGscpYdA7AZEbBNntetZ315XpvUIw1UUSBLeEFaipWO+2bDPNwQj9JCYngX/NdwEADn1/Wsr7qYezrwVP6hn6zuObbRzBEGHMDu6geEGt0tZKZUFpLxUhRPeYkkJQNCFjllAVEKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFvdmwGlW6tewWa8qgpgTmWXQvuUJAK0lfw/vp9E7d0=;
 b=3d9z9w+XJvADLRfvoIIBLbK9MvoR0YbCYsezHGENWCPDBsc2Sh4ZH+bskStWkCrEXA+Vq4WnOUaOy7oc7lvLrMXiNTkArs5aADoBLNlVVhBKQPKss2UUPsH8X8clAlTqH0/uPzWJEjdouv/xeVyDikrXdlZWbeP6yQfDocs8aoo=
Authentication-Results: yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4447.namprd12.prod.outlook.com (2603:10b6:806:9b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Thu, 25 Mar
 2021 16:13:43 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8%6]) with mapi id 15.20.3955.025; Thu, 25 Mar 2021
 16:13:43 +0000
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
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <cc6da2bc-268d-b9e9-a609-cb29276f24a8@amd.com>
Date: Thu, 25 Mar 2021 12:13:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <s5h5z1foh2q.wl-tiwai@suse.de>
Content-Type: multipart/mixed; boundary="------------342CB8A33A284219E7A71AB3"
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:ac47:51a5:7666:f058]
X-ClientProxiedBy: YT1PR01CA0122.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::31) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:ac47:51a5:7666:f058]
 (2607:fea8:3edf:49b0:ac47:51a5:7666:f058) by
 YT1PR01CA0122.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.24 via Frontend Transport; Thu, 25 Mar 2021 16:13:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ae627b21-ba01-45af-6514-08d8efa8f621
X-MS-TrafficTypeDiagnostic: SA0PR12MB4447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4447C8F05E2C7B395B634A06EA629@SA0PR12MB4447.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2E5nBB3gUfqF0MpmQ/m9mNbeDy7NnvLfxAnalj3T7twMUOSYJlrVLsOMb2hnP+FHQzmU96L9gwQgMMaO1W7rSgiCS4bG0JwqS7aGNbx6sRwC+5fuS5wMiPmcrPgkailpm7Hz8iOKlyhxgL5W7ohPCPSChYY1xXqcw1YvgWum3Cqq1RPQnQetX09AzBP7458Ra1Nb9TqwqlDFCk90BX7yHALj2lK1UmHGnU04RXRrHxwtKaMfxeu6LheY4zf91W1U6ibtC98uGeEyIDzHwkCgIq3UyAyGEvrB/mOZzGGmPLyJUI20LdbPNgnMu50o+xB/8iS4//zgDLR7UyJef0+5cwdx/hVQxpyJEjtbiZOocfwm1Bdj4uBoduuUbJ5o9/l3d4ZnSlZe21HLDizXxftzxeERRTf3Cmd0G1fwhBhj+M9R16K8+OLNAcmv4u9PUkGoQeJlykTN0GCCMJnd/0QL7hkZ0xRUYUOkJujQvNIeuGwzouTy9M/9rk35Zr4iafpmmP8KCtHVnvryjCFx8MKYc99Hjx0Oc+9qHHMHK6OVz/BSVhETT5Go4HiCT1P4vWHCJVZ/xWG0j3B6c3mzXyjf6IrnrFfzIvGHS35Qm10jZApBDqelNgthO49TrApqeuHiwABz3LIEwJcG89BQgt/yu1ckIK0/ucFlcGI5lVJnxrhgiuRuPKyoRTEBUq8JQxawaeiVmRVptYS2sk2Qafz/BHiTECc5F4vQcIxhdJmEG3I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(36756003)(31686004)(4326008)(54906003)(316002)(83380400001)(8676002)(478600001)(235185007)(5660300002)(8936002)(66616009)(6916009)(86362001)(66556008)(53546011)(33964004)(52116002)(2906002)(16526019)(38100700001)(6486002)(31696002)(66476007)(44832011)(186003)(66946007)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y0ErZ2FLOEhzczZZNllzWFJZc2JWNzJNYU5xQUV0dUxBSnlZUEhhTWNMcC9K?=
 =?utf-8?B?blhHT010L1RQODJUUTk3YVREVEhCM0djWWZmVHJOTW00bTFxaFJjRG1od3NU?=
 =?utf-8?B?QTJvd01CaENiUHZEejBDZ043U1dSRno1L2RMTnJsZUlpOURNdU9YWDhzaW9S?=
 =?utf-8?B?MlRzNGVpVjFldUZPc3NvQ0luTE10RkVLQ0Y2N0tkdlptdjArNEJCNGVNUnlP?=
 =?utf-8?B?WWQ0TkR6UkdpL284SXFLYnVxbHcrU2dLL2FtdURrMWliNjRZUkZsenVvaVdM?=
 =?utf-8?B?dlJQM1o4NDZ2QWtQTE8yWkEwMitVVEpaeWc2OFpMUXlsbDVabFJIU3Y5RWNO?=
 =?utf-8?B?TzRFV0VqNjMxeTVFY0NHblVDazNzalo0MTlxM3VNRWJ3MnR3L1doMnk5Y24z?=
 =?utf-8?B?TS9wM1h1UmxwUjVrT0xvVmM0QzdSc2Z0NkZmUjUvZUdYMlU5bThYYnNQOGVt?=
 =?utf-8?B?c0dub2thUEdWYk96UE9uckF6T3U3M2E2MXczTWwyTkxoSzVPQk9tNElocDJa?=
 =?utf-8?B?bE9EU2RydmEyeWZ1OGZ4VTBSNEp5eFN0TkwvTEtwRXUvcmNmRUowSVRyQzg4?=
 =?utf-8?B?anQ3OG9xV0NtekRybFdwd3lEbGVvN0dmLzlJeFI1Z2dzV1oyRXVhR1VkV1JQ?=
 =?utf-8?B?TUExTzRQSk01YWU1dVBVNW5UMENaQWxkMWJiaFdQZGwwM1Q5K0xJVUZhOW5q?=
 =?utf-8?B?ek1Fd3VnZ2FJVTlJNUhhNlVCS3p4NFJVK3l6d3hJRkZjZ055VGNwbnhBQ3Na?=
 =?utf-8?B?Nkp1bTJyRlEwWWVoekI0aWIrbCtiNU5hZXZwbFV0OEE4UkdIOFdJR3cxa0RH?=
 =?utf-8?B?TkdONzFkbTBxa3liMG81QzBTYzVxL3JJSlNhRHRFemI1eUdEU1ozY1lrWGpK?=
 =?utf-8?B?OUZBVTRiN2ZiZUt2WVlRc1ZJc3ZyYzVnYXFFTEhaMnpXRXJzZjh3Wlo2UmtQ?=
 =?utf-8?B?ejlYMlIvL3Q2SmFER3ZDc3hrYUhPa2hmSzV2djJGSFVKWE9IbDlnSTJGWHBW?=
 =?utf-8?B?WUpRcWhRWEZSSXhYa1N6UGtpejZYaDhyNm81VytUUm5MVmo3V1RVTWhHcnpy?=
 =?utf-8?B?d1hBL2t0VmMrRVVadDdteEdERDN5RUtYRFFUNHk0NGdNeEJBSlgvRGphVklS?=
 =?utf-8?B?SWJrQ3RhcFE5WVpLRGNKOERqTlBTQUZQcnQxMCtqWXRNWFVSTEh1QWVhVWpk?=
 =?utf-8?B?WnBBU0hObDdya25ZQy9MNG5yMGUrWUpwSWx0L0pLT2JkMGM5algzQUI2VWVz?=
 =?utf-8?B?akRISCtrZUY3bU51SmMzSVgxWUR6Tk1RL3ExVWVORU9pYUhjRHhzUEpzUWk1?=
 =?utf-8?B?RHByOWF1VFliRXAvZFpZTU1BRnFxeXczK3NYeEQ5U2x3RFpCWWd3dlNQcjlC?=
 =?utf-8?B?TmJta0FqRlAyVDFZTXlwdWZxZ0hBNGhlUlp5d1pjM04rbWV1ZjhMOTl5Zkl3?=
 =?utf-8?B?SnhIdjBKdVNQbDJHc1pSMDlVenhzbXNLM1FvcHNxSEM5UHdIOS9LaXg3c1Uy?=
 =?utf-8?B?cGI2UTVSUGdpQllBTFlaUGNTNVA5WGlCUnpOcjVJZ2pFazJWUFlSekVXVnZv?=
 =?utf-8?B?cjNKKy9ENXU4SktNYmlGa1Q0anFseUdsMDl5L2tWdE10TXJ5RER2YlRIQmcv?=
 =?utf-8?B?Rjh6d0JPdFRyT01tOEU2dXNEbm5WcGkwVlBYajlSWHVWK3dPOGIrUFJ6M1cr?=
 =?utf-8?B?dWhsWkRUOWtyR1ZMNmNpenBJNlRBZkpSb3M3aHpIWHFLTDJtak91QmpDTGpZ?=
 =?utf-8?B?QU5FWm9VMG9ZRnJCU2VNOW5YbEJic28rcGl2bEFpZ3hFY29yTmpjaS9VZC9S?=
 =?utf-8?B?S2dSZDM1ZGRzZXJSOENHT0JnWW9TbFA3K25YWFlDSnNVVHV5ZVJyQ1NYbmVY?=
 =?utf-8?Q?sjYTyJq/klx6i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae627b21-ba01-45af-6514-08d8efa8f621
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 16:13:43.7881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B9Nfh99d50ZNmD1txY4D9qX4IjPQ3Q3pbbOYr92k0rQaqwQojD4UYMwaV9jbcMw5QzZkJBWiQFzdH9csFur3UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4447
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

--------------342CB8A33A284219E7A71AB3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2021-03-25 2:58 a.m., Takashi Iwai wrote:
> On Wed, 24 Mar 2021 22:43:24 +0100,
> Andrey Grodzovsky wrote:
>>
>> Few comments -
>>
>> 1) Why we don't use snd_power_wait_and_ref in patch 3 in the common
>> handler ?
>> Don't we want the PCI rescan sequence to 'wait for' any in flight
>> taks that might be accessing registers and not only read/write/tlv
>> accesses ?
> 
> Right, we don't need to block all ioctls, but only the ones that may
> access the hardware.  So basically the patches 3-5 can be dropped if
> we take the patch 6.  The current patch was written on top of the
> previous series, that's why it has both.
> 
>> 2) Possible deadlock -
>> In azx_rescan_prepare - you put the card into SNDRV_CTL_POWER_D3hot
>> first and then 'wait for' all in flight tasks with the refcount.
>> The in flight tasks on the other hand, using snd_power_wait_and_ref,
>> may have already bumped up the refcount and now 'wait for' the card
>> to go into SNDRV_CTL_POWER_D0 which can't happen since PCI rescan
>> waits for the refocunt to drop to 0 before proceeding.
>>
>> Instead of snd_power_wait_and_ref can't we just call snd_power_ref
>> in common IOCTL before checking for power_state != SNDRV_CTL_POWER_D0 ?
>> Or is it because you don't want to fail IOCTLs ?
> 
> No, this is the intended behavior and should work as-is because
> snd_power_wait_and_ref() drops the refcount in the loop before
> sleeping.  The inc before the state check is a must for covering the
> possible race, and ditto for changing the power_state to D3hot before
> syncing.

Ohh, missed the refcount dec in the wait loop... My bad.

On boot the latest patch-set was throwing refcount warnings since
u are not supposed to inc from zerro count and so I fixed
with the attached patch. That way seems to work fine.

Andrey

> 
> 
> Takashi
> 

--------------342CB8A33A284219E7A71AB3
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-FIX-refcount-splat.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-FIX-refcount-splat.patch"

From 96c05549bb01697b97204dfd51f8f917ab11a178 Mon Sep 17 00:00:00 2001
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Date: Thu, 25 Mar 2021 12:07:38 -0400
Subject: FIX refcount splat

Righ on boot bellow WARN observed

Fix by setting refcount to 1 and also
drop the optimization in snd_power_unref
since I can't rely on atomic refcount_sub_and_test
anymore.

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
 include/sound/core.h      | 4 ++--
 sound/core/init.c         | 3 ++-
 sound/pci/hda/hda_intel.c | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index 0b220bfe001b..d5d5053e743e 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -157,8 +157,8 @@ static inline void snd_power_ref(struct snd_card *card)
 
 static inline void snd_power_unref(struct snd_card *card)
 {
-	if (refcount_dec_and_test(&card->power_ref))
-		wake_up(&card->power_ref_sleep);
+	refcount_dec(&card->power_ref);
+	wake_up(&card->power_ref_sleep);
 }
 
 /* init.c */
diff --git a/sound/core/init.c b/sound/core/init.c
index cb0ad0883329..31cd6830557d 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -215,8 +215,8 @@ int snd_card_new(struct device *parent, int idx, const char *xid,
 	mutex_init(&card->memory_mutex);
 #ifdef CONFIG_PM
 	init_waitqueue_head(&card->power_sleep);
-	refcount_set(&card->power_ref, 0);
 	init_waitqueue_head(&card->power_ref_sleep);
+	refcount_set(&card->power_ref, 1);
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
index b6d118c2b75b..10189d90416a 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2457,7 +2457,7 @@ static void azx_rescan_prepare(struct pci_dev *pdev)
 		azx_prepare(&pdev->dev);
 		azx_suspend_streams(chip);
 		wait_event(card->power_ref_sleep,
-			   !refcount_read(&card->power_ref));
+			   refcount_read(&card->power_ref) == 1);
 		list_for_each_codec(codec, &chip->bus) {
 			pm_runtime_suspend(hda_codec_dev(codec));
 			pm_runtime_disable(hda_codec_dev(codec));
-- 
2.25.1


--------------342CB8A33A284219E7A71AB3--
