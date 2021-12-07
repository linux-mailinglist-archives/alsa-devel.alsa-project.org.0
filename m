Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8356A46B667
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 09:49:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F0662199;
	Tue,  7 Dec 2021 09:48:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F0662199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638866964;
	bh=BqPpv1TQJaJKKOwlrdnLF7mo6JIjSKSYV+MLWpn2hPg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZN2ZhcoGCN3dDdo82h5IHRiwAuXXnstDTXbYLd5EJeN/zN3GxgAlz49bxGWdwxsqH
	 +gKfvjXSbPcq6cfYVhj9vzUMmVair9gPcRW4Ws4eegnyLZCCVgor0n/ZMeaDHH4hEz
	 3MIq0Xl7hl3KgHuu6hdN35n4I8v7Ek+2Ju2kOwnw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15CA1F804CF;
	Tue,  7 Dec 2021 09:48:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4FB4F8028D; Tue,  7 Dec 2021 09:47:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::608])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E893F8028D
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 09:47:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E893F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="EFsb7Ia+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdSez+7bGPyI2xSqBdXdiHle3L4pigbpNgchuv0tnto3NXt+jTc1JEv4y50LtjZfARjnW1TetZewUhCIKhEseQ/zyvjoScbSuUTaAfXrEl+XyGNM89WFXZmEo6MlKq3fGzG2LzRza9mmwPsP/umpAH7BcHjJOlSTGsBIbDquU15XtavPnbpQKIRW+OoSdgDonsYxB3zmskbpsWhfacsg8Uwt3bcpMt4bigedM/Phd7ysuPPgjSGk+AaI3+qAOpNGGauVrAxP4eUQFlH711e+SDxcEbwUef5HxZMPqfQs5GNUKoUNPM2SnRrw0/35lbTbWVsovB/KtpsEfTK/y81i/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P00iQRUI/ImLRSnz8qY4hGPHaZJplK7ICfEnoy/xIOs=;
 b=ZRVontVH4uQvIypwM/ySghSNEdcThqwgwe/yLqwyj+8G5HBWVL5Z2viXquGCQo9ovTfeDNtTG+lNoScO7nah02OCSmYmPO9pacZln7sQyBz2hrdVx3NeRqkHC+cum5pSnU1m4Q0xL6fs868tCNIlg65dFasQKuVvHmQKMYSf6+AAIvCWpId0LLVtXAnfJBvF084/4GsPLYJFqNISuoEG8jf2qfFXLBRHZdYDbiu5/Su1PORnfd+rxMYcf8R2pupUbzc2xmdfQcDhCe2xRyOCCUnSwVfih5BiugTUWETS6TE8kvNf1/3gd/7i/t7Xmyc0FMPUFBCv7b+OMfQLwiyg6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P00iQRUI/ImLRSnz8qY4hGPHaZJplK7ICfEnoy/xIOs=;
 b=EFsb7Ia+ivtYyJsAPn1/nD36Lh6LLDxniCG2DhOf0q9rRTwe/oaEw5L7BHO5VfMhAK9O0+dHvgw/vRvOqs36UMzlTnD6FcHO41TsDAMuQyeOo57IF4+k5oQM+I51zTeCKKYe1Rj8MQoZniBDY7YVIluFriPdXAT3vNEvVOL2yiClimxmLdV+URC0ZdWy14HwovSy16ot78tP2dHZkLntA0xZGtcIb1IiiJtESoaOfFbeklrMU7mwMeR0bS5hF3aaySOAGi7vMiNUXr6/Y+KKZNNqjB056X120jH1uBBIVf1WJc2UkWHIaYF6YTyzuIYXLmXJk3wcSncRhfD7a3UgRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY4PR12MB1576.namprd12.prod.outlook.com (2603:10b6:910:10::9)
 by CY4PR1201MB2551.namprd12.prod.outlook.com (2603:10b6:903:d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.19; Tue, 7 Dec
 2021 08:47:45 +0000
Received: from CY4PR12MB1576.namprd12.prod.outlook.com
 ([fe80::24b0:46e7:d3c0:a77b]) by CY4PR12MB1576.namprd12.prod.outlook.com
 ([fe80::24b0:46e7:d3c0:a77b%7]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 08:47:45 +0000
Subject: Re: [PATCH 0/3] Fix Tegra194 HDA regression
To: Thierry Reding <thierry.reding@gmail.com>, Takashi Iwai <tiwai@suse.de>
References: <1638858770-22594-1-git-send-email-spujar@nvidia.com>
 <s5hy24won6h.wl-tiwai@suse.de> <Ya8Zk/9n7nAtjvSe@orome.fritz.box>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <52a3f7d9-3d72-f4e3-2843-e69ad7c92e7b@nvidia.com>
Date: Tue, 7 Dec 2021 14:17:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <Ya8Zk/9n7nAtjvSe@orome.fritz.box>
Content-Language: en-GB
X-ClientProxiedBy: PN1PR0101CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:e::16) To CY4PR12MB1576.namprd12.prod.outlook.com
 (2603:10b6:910:10::9)
MIME-Version: 1.0
Received: from [10.25.102.117] (202.164.25.5) by
 PN1PR0101CA0006.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Tue, 7 Dec 2021 08:47:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07de7b75-3c82-4cbe-41b5-08d9b95e3ce4
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2551:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB2551B4CD996FA58F2FE0C5ABA76E9@CY4PR1201MB2551.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H33W4sIn7eAynkBbnJuBWYNmK1Ku+oERh0KddA9CTOD6dQDb5YSTlvdGBC2Cxj2dz8omCFtUIddnCb5gchSYNXONnCPonSPAFR58LrahI6dXIwUaIsv366/t3XtUsqPgszZK3VilaVf0iDB7k0F5wGlce1LzNV5gbCnnEZbnHdOeD59rOjVgH5tFqmXqGWRHMbpBpJZnGdHn43YLVNoYWfMMEfbXVovfWfzaeOZugNxBaa+Jn7EEcH4JVGTNfndxB/IIQSJDE3FzpQT9ty/sF/L9QR6AskTD45wqfH5r21SxR8vI8a8qjePcIqzFfXEmss+JQ3Gnq3PTQDv68OFtkWhzyca0/SOGsqH8idt1FAHGWAYtfb+emruNzSDZONYlJD/jvXptYCdvK0bq9b4riC7FLQy4pVqQ4DuQfxykPtbZ3r7QPAzUp+teaghHQx9jQa/EBK/cLtbawIUIKdvtPc8zCbQ8DiNk2W1lgmDRKP3S2/QYAFRhbR69zPabdqf2CCt/uqJaKEeFNZNVhh76xcQzIgkudTNPzxIw7OjFyS7Qe87x+eP6OvWZI7JXBrMWbAVY5dSkr664nSEwBetayHe/gTUvzz38XFl6097TQ14EcviuxZz2VaTggNVf1lWh/RQAKjXemT/c/qexfPdb6VvvCl+1BSn8ZeYUWJew1mYmuLuQPasXOYbfpE4plafStm2/MI1xQeGwGK2u+YEDD1vFAI9OjSUOiwBFBp+7ty5g7+dRBPYLTNl9JD/FCeI4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1576.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(186003)(6486002)(66556008)(16576012)(31686004)(66476007)(110136005)(86362001)(83380400001)(6666004)(316002)(508600001)(2906002)(26005)(7416002)(53546011)(5660300002)(38100700002)(956004)(2616005)(31696002)(8676002)(4326008)(8936002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?h5QTG2EV7yFdwa1E0Gi/nKIvNOc1O6FrJSNNbI7+qc9bMlV3Z3F9BEgz?=
 =?Windows-1252?Q?sTKq0HYoCO7udd4hDG7wgCRjfLPjaOok/KwTlM9uZJL02rMYxzshFjM3?=
 =?Windows-1252?Q?uOv0eS6tKB/mZVbkMNnmab6fOHu8UanZAn106zcFfPN2gFjHbZoiAj8Z?=
 =?Windows-1252?Q?7Cg9wDQ0VsaR/xJRbWqwkr3G0E3KbCEUTcFZ/VrSV4dclJo84H2A1JkG?=
 =?Windows-1252?Q?gB01NmqHEum4CK/iTSN+zBDSoGAwCuY+GjfQ4eQhSyj2teWNj00WbEwq?=
 =?Windows-1252?Q?hEwlP8M4q0xrZfurItNFISiSdvwMKwqQlDjAbvUz+rEqLgC6q15Z7TxS?=
 =?Windows-1252?Q?q/ffOdaF9G4XuN+uqgQ45fTbbreq6p1hblkJ+IKBfTr2GG2Mg9Sz0k9H?=
 =?Windows-1252?Q?lu0527R0Jem5LMxosbxJdtkEuxOwLnaTVVIE0hX8JsZgBP0da9PecTWI?=
 =?Windows-1252?Q?JjSAA8p88iHLe08SDSX8FqNWLt8LkCXGoPlLsSGx8ItcqdU4ZBIiU2E9?=
 =?Windows-1252?Q?ZFfIk8Ocz6ViFHSwRrv2ldu4iUCwm8MuQvJnJes4IEIz77I95qFSz6tM?=
 =?Windows-1252?Q?eIk1I2sTzzd2CUqGQ/OcB1zo1xzUglgrMKiegOovE9oQCWwOQWjuYwzK?=
 =?Windows-1252?Q?vHQuBus0uzb3kI5IEMicJ9OFJBP1mNnV5mkVXcAlOyUcrsllxVSuMDOf?=
 =?Windows-1252?Q?z7cn7+wzAm9buVR3o5nC1+LvFJSH/pPF7+hKzVFj+MJ2E3ULyelaxo6a?=
 =?Windows-1252?Q?rKxkD2z8G+G9NI26jlcpsMhXLk89TRqHWBpybjJanYOgJ2JxYCqbGIc0?=
 =?Windows-1252?Q?h6MPw1e9HRLiQ4GgK/kdw3166gzxi0RO0H6Oyf/+yhav4psL5mNPoiPE?=
 =?Windows-1252?Q?rztLLv/5S2hUO73j1T92vSW2ccpQ4/iEPyR7yFBCkeg1BnFsCTHYSwpL?=
 =?Windows-1252?Q?NdDGvcSUj5Vxn4mctL0+XvDIN0x1CW9ayygxX4vP3NAnIf3/2M7f7BhQ?=
 =?Windows-1252?Q?b2s0pHiY8uOZyv25wRkJYE+/RoUvhI1+YrWoh5S23hBW1feWwukhSa/E?=
 =?Windows-1252?Q?pJpF9V+MPJ9dJNbP2ka36gEj3O8LShiIWyBZXWDB5vrMHdgXVZ7iqELi?=
 =?Windows-1252?Q?AlQcBNtsnor58VZdvf2jzKcLfaLoRIjZOgW0rcblnW5IgTaQxDjKUmdJ?=
 =?Windows-1252?Q?2PZCEvflmECgwfqxiFNGPS2p2EOjlSPj4n2yuPSEtC5rzONFwRbm8eiU?=
 =?Windows-1252?Q?Qdt6xLl8DFjG0rYOGvqGhMpCYL5aWd8ZCZqTh+iBCcZ5/cGKdTqdYv++?=
 =?Windows-1252?Q?DIqpgwOJdi16lYjTi3smlbRnygVpMQeiCwHw1FKzVC5l9gWoEYpAEEtM?=
 =?Windows-1252?Q?mGAj7jhasV6Yn/JkUSsLM/fisQwSyAyhixDniYFLzj5x+kCF50Qbwfkd?=
 =?Windows-1252?Q?5785q5jCbLlxLD2Tdk+CWu5NbaKtY+3uwox7L0b6eqx+1uHedfWWwhT9?=
 =?Windows-1252?Q?n/WiuHwU1J5M0M6dn/BLxJvWdlsdi0/zG+g7VaQrY4ap5pqM9a+Rf1Hj?=
 =?Windows-1252?Q?DTLscbgHqw+SeJBkgN9B7zx0xcM1KHtnIcXvB+QTcD1frSgUfgKuaff9?=
 =?Windows-1252?Q?mB/HKLPzOAykkUztBjV3cWMSKP9qDodQbushMy0E0ZjuoW7kTX1W8iG9?=
 =?Windows-1252?Q?am9SApkzfjRN2Sp4f17oS3wHSCyk3gOKrctyl8ob6bcZfsybKhiSgSlW?=
 =?Windows-1252?Q?qoH3g5SEWeS5yo8Ko+s=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07de7b75-3c82-4cbe-41b5-08d9b95e3ce4
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1576.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 08:47:45.4499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bhxb1f/HaaNIoMx31Fetf8lujOR2EEUOUoP2EnKK19rGn7Iqjys9+5wsr5vAaBf/sf/YrncT81ZVpuAXJQab7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2551
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, broonie@kernel.org, linux-tegra@vger.kernel.org,
 digetx@gmail.com, jonathanh@nvidia.com
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



On 12/7/2021 1:51 PM, Thierry Reding wrote:
> On Tue, Dec 07, 2021 at 09:04:54AM +0100, Takashi Iwai wrote:
>> On Tue, 07 Dec 2021 07:32:47 +0100,
>> Sameer Pujar wrote:
>>> HDA probe failure is observed on Tegra194 based platforms and this
>>> happens due to a reset failure. The series fixes this problem by
>>> avoiding explicit resets on BPMP based devices.
>>>
>>> Sameer Pujar (3):
>>>    ALSA: hda/tegra: Skip reset on BPMP devices
>>>    dt-bindings: sound: tegra: Update HDA resets
>>>    arm64: tegra: Remove non existent Tegra194 reset
>> The change in HDA drier looks fine, and the question how to take those
>> patches.  If other people can give acks, I can take those to sound.git
>> tree destined for 5.16.
>>
>> Or, if anyone else prefers taking those, feel free to do: for the
>> first patch,
>>
>> Reviewed-by: Takashi Iwai<tiwai@suse.de>
> My understanding is that patches 1-2 are mostly independent of patch 3,
> with the latter being mostly a complementary cleanup. Patch 1 will
> effectively ignore the non-existent reset on Tegra194 anyway. Patch 1
> (and potentially 2) could go into v5.16 to fix the regression via
> sound.git, but the cleanup in patch 3 isn't time-critical, so I could
> just queue that up for v5.17 via the Tegra tree.
>
> Sameer, any objections to that? Did I miss anything?

Yes, Patch 1 is critical to fix the regression. Remaining patches are 
for cleanup. So above plan sounds good to me.

