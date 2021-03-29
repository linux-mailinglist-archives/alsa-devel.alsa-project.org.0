Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E06AE34D2B6
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Mar 2021 16:49:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A4B7165D;
	Mon, 29 Mar 2021 16:48:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A4B7165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617029341;
	bh=WNym4GXuXMHxV/hgc7h+DOfvzDYsL5ld7mSbigVP0hM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S2mUKZZViOB4+ZEyIIdpohOzOw1w8dbxpv4B2Kqwe46Tw9jmjediPK+R4+02HsD9E
	 WXXQNrmpBbiU1QdkKnr9Sfy9wSXjUFFHNgYjli4vhSjaGJGk/FDi1lvePHqvQ5Mwg5
	 tBdIx7RDigtQyQs9RAyoiU2r+Li6TRtWzfR92joU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE39EF800B9;
	Mon, 29 Mar 2021 16:47:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69963F8015A; Mon, 29 Mar 2021 16:47:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2083.outbound.protection.outlook.com [40.107.101.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 821F9F80141
 for <alsa-devel@alsa-project.org>; Mon, 29 Mar 2021 16:47:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 821F9F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="u5wyGywm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZnvXHoRFJl6Li2V0gnWHR7LdFxnV/OtAaIKay8KO9jbcY0iPMOqRYbR6eyQ0Bp8QX0YWSzg2Y/kpEDVDLLLlevq191D+4yKgr1FlDS+KFQ6Y3sKySPVPD4GhnoBzgOSCOFeCA6lfkgsJQDTx68ge3XShjtWPbxzY7ndcc6sDjkJ0j5XrK3teYPRdRKm9tgZFjyeY6YXO+7u5G//1+wul0QmlxaRkATzQLjMt5Gi6zkDQ5N6WJiPwv2X3ZBEEjRb4Gqa9i9g51d/ajcuT1ZUnMTOO1XHIllWpgtt4uPWXi6g84EWydpCVkTxm9T8pdD6MYyBSqjhN08tKaD0/1p/MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxyDNEty4pFO7f+5MjCoUnN6G95eBlS4n3UWYjBz2uo=;
 b=Sep/3XzLS3s+3rElJO0XbDRiNKgV39Ks3/DSbqKz5u90+HqsKH4emw1gFBhR1hzGeA4PaDE3O7RBLNzI9SqQcdaIiNKqrMmgp4AMarQGkh9lSXUZndRAck6mfxKhYirsH4kFeFjYeEFA1p7k50Yeb2SiRDZqdSiUJBo5cteZ2ZkpE6GYfxdfVRLSlRfzSZFOOdAafCE46ii0bL8P0nIa8iADV1IWK5Ysjwnw5tdTtSTw8pHlKkOuuhe/YYHQLd3XkTaFHP7vCNlS46rjSt8wsbR8wPADqB6xe3erWSZgWWuiJBSGYKVKrJxLl3gqBKoCmJnQT495RJ+xJ9kC9uAEOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxyDNEty4pFO7f+5MjCoUnN6G95eBlS4n3UWYjBz2uo=;
 b=u5wyGywmPV46ASj0eGlFVRrXrg4apHcJRrLf8YMRNb9H+j5RUVu9xJFUtRg6AGRKeg4dkuT4E69W/xRDSUjh8furzCIQARUXBfcsgC1JZgzFZXcrRTeVuFPeIsOCpF5AkVPakWvBM7aikN6K4Mge0bCN9uHKb852ktIaXVyIMmg=
Authentication-Results: yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2573.namprd12.prod.outlook.com (2603:10b6:802:2b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Mon, 29 Mar
 2021 14:47:07 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8%6]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 14:47:07 +0000
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
 <7788be67-e78f-4738-0ffe-27d4717c6f58@amd.com> <s5htuoxj9ig.wl-tiwai@suse.de>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <b479fa68-186f-249d-3e32-bfa9c83422d5@amd.com>
Date: Mon, 29 Mar 2021 10:47:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <s5htuoxj9ig.wl-tiwai@suse.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2607:fea8:3edf:49b0:bf15:ec51:a1c2:5ab6]
X-ClientProxiedBy: YT1PR01CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::20)
 To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:bf15:ec51:a1c2:5ab6]
 (2607:fea8:3edf:49b0:bf15:ec51:a1c2:5ab6) by
 YT1PR01CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.31 via Frontend Transport; Mon, 29 Mar 2021 14:47:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5e450d49-5665-4170-b6c2-08d8f2c1869d
X-MS-TrafficTypeDiagnostic: SN1PR12MB2573:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB257332FB7685A9E0AEEF6CA7EA7E9@SN1PR12MB2573.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: neMj8oN3rYB9KFAkzLHbGncHeoEIFRK89l6qv/lBF5dwDpodx+OWq+tkTdjaBu3xHxwKNYS/Mklry0ld6/KWfQJ7Yhd3s0UMv8THdNxEdfPWi7ptBThzsH9mACrQkApwu4uJnoQlbg4h/g/jkhM8a7l+/Ii7jedleaoT8ITh4jm9Go+45lul07olzf6ssrNlM4B3tNp6a27TwnzSV63vmVcqyv9s43OabuaYbp1LkwUsb+NCEd34TNd5Co8vtDGYq3YaqmZfHFaJEeDfuNGxIsq0Jtv76HBihGgYtEFBIWbG5rnwW7oNAgVQbb3Qb7C/Zc43HWEuhiHXHEnmBy2Yy+rJU7R98tCoOUn2uc0ievc7FbhTlq06NPTIigrDL3DWgdwr4BsBY/WFA1hbm4skTixS24RkwXkJUTI2BxVkWAGQsbDwHOrjHb6XAWQQP0SEGzOjDE4x/bOVvcIkhx0FEO5SUr7hgXqIkQTVqjvaq9LJz9kGsPep1E/aQ9Eom3C4qsRY+VYKGnYJlwp/zhsUcVB5x+s1oVhYVLtULNg3toB/H13By/Sx8jpBn6jsNdIYpt4tJZsoh6qvhIeR9Y/9VuwgGUgBFan4rj8//E2l+gs5UpXo9sMX8q1Hs0Gq4tLeb5Wzf7BttLBiI23Zw+/JVyLBmF0nz2m+GP8UeOFj15ULbrRIwPyeFouO3+J8+1+nPC0W9yPvoGF8Ds4Zy5L1i1EahJvzX1RCLlxA9SJ0/Ng=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(38100700001)(53546011)(8936002)(6916009)(44832011)(16526019)(2906002)(66556008)(52116002)(31696002)(316002)(31686004)(6486002)(478600001)(54906003)(83380400001)(4326008)(36756003)(66476007)(66946007)(86362001)(8676002)(186003)(2616005)(5660300002)(4744005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?+gBoyzxiYIJNBw/OPFbK2bdGxJLpm5zj8YW64P0jK9Y371mCaQ8L+yod?=
 =?Windows-1252?Q?aLAbGBCodXtm1YlUZ2YUSr+gHlF8v+6MyOCIj9Pct6OIozHyVc4XgRfj?=
 =?Windows-1252?Q?kgq4JWnEdF940hgsgKpfO7Zz1rSVMVO0RggnhkTmv4xnaR/wJu36ETzc?=
 =?Windows-1252?Q?Y7cS2xSaKI7qiV1PIwCZ75xus7vyPeI6JiHu6LAoqoVjZnHeCPAK2Xmd?=
 =?Windows-1252?Q?j5nVpErEJiDTkE3taQnYAsDXZTCePwx9SXKUxrs43ncBIF4PHuGnjGTE?=
 =?Windows-1252?Q?gInynsuhL6MxhwPQ4Z0oddyCSJhepWbbQFTRWom1/J9+JAXcCnYP0InC?=
 =?Windows-1252?Q?OQhubvBXT5bocDtbiEfMzynDIcw4uaGO7Sbuu1bVguZsb+HRrNB9OSDW?=
 =?Windows-1252?Q?lrA8D9K4aN5kcClvN1F8YM96qWSTPdW/2XRT1wC6M/bMcwTpoAgjLyDM?=
 =?Windows-1252?Q?KuPX/NxynkSmX4howF1GzIKk8YAdZt2pIx7MCZyz94xm2Xhr6didQSEA?=
 =?Windows-1252?Q?qkeW9rb17dkozo84nYM9AaezhkzB+TCE0FaIDdhZ0+WgTYXMtMmXLtzu?=
 =?Windows-1252?Q?kIDz3ML7HY5aqR++MKt4Wxhlr4kmVH1H2G4xjr0zYs5OYuWbDOn1z3wR?=
 =?Windows-1252?Q?bA9l7gqC/ART/bkU6gO+VVC3g2bq59dcBzUw3KjAPy23fKgVcJNYTaVR?=
 =?Windows-1252?Q?w00AuNjP9rW8RcgoYYLlNRXr2wDjH7A0KUKU1O+fxqV35qCjCTZDu4Fs?=
 =?Windows-1252?Q?x/+aNr9aq2tpf9/3MUUUHtUAnt57T1AriGZiZacNuWqvUMdlugaTv7Pf?=
 =?Windows-1252?Q?Z13mt2bCPRTpZsBmALi8icsqBpeb0NOWaVl9BJVAOqufxbetuj0SV2ty?=
 =?Windows-1252?Q?rVztWeH7YSnywVTqR0qet1Or5tdOaIdlEEgYsybWXGdbMHGCKMGhxceK?=
 =?Windows-1252?Q?qjI5Rq4vURE+IsY0xk0/jGyKV7JGvD18KbZtCv/CENL3ko1wU67Mfb+l?=
 =?Windows-1252?Q?+0hFt76bU5Z+PBxaMQnjz4ewFKznaPQ9HPbtxAGii/4A/CPBuqCRDIb5?=
 =?Windows-1252?Q?i7T31ReC7LkO/nCXcLNyigpph2uV3CfHjPN+PjxvynPGFiSngSJMIkn0?=
 =?Windows-1252?Q?ZVbKvRNH6eJfSZ+yVh5+0VCbngbaGjgnNdEu/vsBW+qwwrK7pIqUf27C?=
 =?Windows-1252?Q?3Tld3pcmOis/02qCHqYzhizDPxrdJwTLQCdsBHSR3PcmDTJBpU+Qb6ob?=
 =?Windows-1252?Q?VEcgB9MaMNfqHYPgJJ/NxMm2rLlKfSMAT6qhIgqN3dptyp5AvK8GTC89?=
 =?Windows-1252?Q?vUWQvh9K11WX9FnrQSGaedtGzMAMGWD62CfM9CR5KQOhTyX/GWRrfvs/?=
 =?Windows-1252?Q?bvzPFQdTwZP3DYTcZXUVRWO2uEOtocAcoICu0BlQ+23xTHHAOOgu9TGy?=
 =?Windows-1252?Q?jVcgLVmUE27dlSLlq6DneaNmeIVxJ413WmqcQ9LGpN5qIwpougv0vSsX?=
 =?Windows-1252?Q?WINTBUXp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e450d49-5665-4170-b6c2-08d8f2c1869d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 14:47:07.6006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S3MO5/W4z+h39Rdab3lL0vRnmq4gfdo/D16xoAMGAXRyspXO6QR71cSm7FWOq+abcXjJ7P8pVygRUFJQ9y7znw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2573
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

Tested and Looks good.

Thanks a lot for ur help! I will be moving now to work
on USB driver as this is another on CARD controller
we need to take care of.

Andrey

On 2021-03-27 4:17 a.m., Takashi Iwai wrote:
> On Fri, 26 Mar 2021 22:27:26 +0100,
> Andrey Grodzovsky wrote:
>>
>> Attached.
> 
> Thanks.  I found that there are a few other places that may enter the
> hardware access and might need the power_state blocking similarly.
> 
> The patch set below is a refreshed one including those.
> 
> 
> Takashi
> 
