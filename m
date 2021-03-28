Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F04334BDBC
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Mar 2021 19:40:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F92815F2;
	Sun, 28 Mar 2021 19:39:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F92815F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616953215;
	bh=D3OtpoRzKzP09apI5bO/DYDJ/fdwbHLpwcaTSiRdTRI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VM/+FYDmusXrON/8+pzjYn5jPwXRMBibKMm/EVyTmgvUAabsg9iWp4lpvNm+FPRvz
	 UJiL9cBj2DaZElRGF/LAD8A69gxe1CAuAQFg/BDkLlJeugSZzumgb67l1aZY0JwL+V
	 EpyihxFiExL/1AVeamtEATk4LnzTAQLMhtxkAOJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F078F8026B;
	Sun, 28 Mar 2021 19:38:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0B35F80240; Sun, 28 Mar 2021 19:38:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B94AF800B9
 for <alsa-devel@alsa-project.org>; Sun, 28 Mar 2021 19:38:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B94AF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="ap5rBZXx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/7iCi7DfdgVf+VlR5JAyIQPZLkq2kmaY5F3DN88cMQNqtqep7t5Y9Y9xDHWuI+PKvi83rGy5v2bvXnjOSIuJRMiGGE3PEgbcELIJkidS36mYZQkrcf88vR5c0NVcMQZ/+2aC/Qg58FWdi7sZrmQgaiLk2q7KQm783yWyUq+rFA0nP2Gb6XOKIHLkCyJ//Dwy61/pM8XZbJ9bOmVrRz8qXrAoXqzUBkP3Eq9Tq64OjI2bqE9zAqZN1UuFTkmokK02fwfrUlo6X0rVf8QkG74AeUiDTTjykZ8Ke9O8m1Z2BfkkX7l1TP2HllI3/Ll1d5NpIiSVQuz9SMjsYG3syAhdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=di42ajG2Y2bn9XDU5mWjm1z9bW78pmigCC7s9bqgaMM=;
 b=GTEAm+MKnVGoMbOo7obmz18Wy5U1glfTO/0lRUk2pzH095Cg277cSVc39Kbb2xtLkwyqvgmWwAVNRkk0mOYOBtTBmrKJanZx4sW9fkD6w0S1gQGTaKp7Jb4asuHL8Hh1KNO+vqF/Aqc5dG6S66FN5v2yH95g8B7L7/YhqwjJoy+B2mMPeLMrQvPNSgZ9Gf6E7nVu3MKaCHYBE8Pf3pxv1g/uZlvVaKPb1g0GhTRh6BZZeKBj6kwqYZTXZxfv8G2xTz0S2OjP1s3cd6vSJODxyVtcvn7mF29QgcD1FZqnnoPbCkn36wrTei/oylXaAGh6s7sLXkycAPdCxKNHSuQeTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=di42ajG2Y2bn9XDU5mWjm1z9bW78pmigCC7s9bqgaMM=;
 b=ap5rBZXxmh+eDOUeQ/QQkpknSXQY3ZmDM1IoJIiapMfSfvW8/oaodPiBIQcqHjcqX/jVW4zgiKTNFmJ39EuXCnEZTs3AMrmtxQXVByF4RCZ+9oy5Iu/sZ2p977yCdo1PjViKHpyaniLAJCsVaPDtdKdl4/SApokZQ55plBO9AC8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MW3PR12MB4361.namprd12.prod.outlook.com
 (2603:10b6:303:5a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Sun, 28 Mar
 2021 17:38:32 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::c977:4e9:66b8:a7e]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::c977:4e9:66b8:a7e%11]) with mapi id 15.20.3977.033; Sun, 28 Mar 2021
 17:38:31 +0000
Subject: Re: [PATCH 2/2] ASoC: amd: fix acpi dependency kernel warning
To: Arnd Bergmann <arnd@arndb.de>
References: <1616777074-5151-1-git-send-email-Vijendar.Mukunda@amd.com>
 <1616777074-5151-2-git-send-email-Vijendar.Mukunda@amd.com>
 <CAK8P3a0aM4GRZ62TvNpwtMY0Bw7JGJNVs55UkpdBVYeKgWhMaQ@mail.gmail.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <c4d5e624-d922-d338-ca35-72ee06cec08a@amd.com>
Date: Sun, 28 Mar 2021 23:25:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAK8P3a0aM4GRZ62TvNpwtMY0Bw7JGJNVs55UkpdBVYeKgWhMaQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: BMXPR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::25) To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.93.39] (165.204.159.242) by
 BMXPR01CA0015.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Sun, 28 Mar 2021 17:38:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 63f59c1e-49bb-4914-f30a-08d8f2104dbf
X-MS-TrafficTypeDiagnostic: MW3PR12MB4361:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB436127799E1E8DCE50BABC8A977F9@MW3PR12MB4361.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:356;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kj17/elPzMvug6yWtgvvIxodRft+J1AWMkp2YsQKEILVjtegrMNUMl5v8DZ2+lBpGIhTX5q84nx9iUcJBc4VtVKpVxSPY42QcNwiXU4utTXgf5gk+K7I/7eNxflTdIeWuZu9rRHH3GWgPAYAQYctQdFnxBfqYghCIhfAmi90x3fcglojAywkMFoZ85VOZWH4sToSOo/NzHp3s+jKXjzi5FgWJIdXjPXP4k6KBQcg3Fm9DWFYMVBFRGvQmELYhHfM55Z1sBF5RGBiY9hL/QzI4zv42/i6WJlLbjfMMvd244zfhnC+wGbyePIBPtX0M5R3MqcEUOsTUkITpEdLj3Mt7PL4+/dAxm52/X9HaB4LPZADMuZDiTQo7FPty2GSNcSdow0ogQgByI6b6ue7nWZHLKvoT97TiQdbyN2/kJEc2Avu6sPwBW3T9w1swcMH9RdOOzqjK2cjE9AMPnq8d/972MKzxfYKpS6CFzxa+yBRn6nsTy8ON9qiQrTjPiS9uUVleWSkKkZapUOi7TAsB906Z6gQNtOefLGz6xP1vIq1p9tqBg+xN0Q54ehKLzzu6uewC1xkE3HxTfpRHtogDSIiTmg5tFVaK7uiDit8XC3OASbmz/Qcr/XqEy0E6h5x3RIi4eOiUJ51em/EZcnEHNVdxeeo9A/GmC8Kw7/6sRjuDBk8qrWcU0FAVjLL2RlLSKBshVjsFYJwpqQlvtEEbPKhWLPM/tCN015xW8B1K/s/TAo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(4326008)(8676002)(2906002)(956004)(36756003)(2616005)(316002)(52116002)(186003)(16526019)(86362001)(5660300002)(4744005)(31696002)(26005)(6916009)(31686004)(66946007)(66476007)(66556008)(38100700001)(16576012)(6666004)(83380400001)(478600001)(6486002)(8936002)(53546011)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YU0ydVh6MjZkUlhmUUR0Ukg0YU9TbGNMcmM2STB3NjBwY0xON0h2MzJWM2Vu?=
 =?utf-8?B?bmYwa0dpaWxjWXdkMHdWOHNGbE1pblJoeFJ5K0thOExsR3NFbWpxanRtT0d6?=
 =?utf-8?B?ZXVIdDJkR3dpd1p2NENMbW13aDdDYVJ2ejV0eU8rUUIrOHQyNGJCRllRNURP?=
 =?utf-8?B?eTh1cXFRWjFNQVc1N2dKMWc1M2loWDhNbVRta1VVeXRYYm1ZVkYwUXZ1R1Rm?=
 =?utf-8?B?Mzc1Q3Joa3F4aG5GUmlNRUQrM1RESEZsOFp4eEc0eDRvS3RTWStEK1ljNFR5?=
 =?utf-8?B?VzZld3lIUEhFVXlTazBESGRJWTEvT3QxaURiQ0pJY0hLdy9HVWFxc2VzK0dj?=
 =?utf-8?B?L0h0aUVLM1pDTHE1QVd6Z1lXWGF3b2gxNkJ5Q3BGWGE4VGhKTlJySk9qdTlM?=
 =?utf-8?B?cHg3Mm0wcVlaNEN5S21TQzJPTTlKZnZFYVhOTWtpbTJxR21Vc0FVdlpZQjFX?=
 =?utf-8?B?ckd4bExvamtYNllRNkJtVFY0SVVBaTJUcjFHb09WTHAzN0pFNWdocld0WUlL?=
 =?utf-8?B?UTF4T0I1TkhDb20xTFlzcTZweEp3cVg5NEF2VzFrcGREM25RMnVKc3ErUko3?=
 =?utf-8?B?bVZTWXJlbHhEc1pBSVRMWDB3Y08zeUFnRjIyUGVUVWdzcE1xMGU1bzBndm0y?=
 =?utf-8?B?aDd4Q2grUlozOG04MFlpd0g1NW5YUzdHbEY3VTRvQjVZc21yY25rNmRQL3Va?=
 =?utf-8?B?NXlmTjdGUHN3MnBiWXZ5RGxRSUxPY1NwdlFnL0ozdjYxejFoMFVsYmMwN2Zs?=
 =?utf-8?B?WTB0Mjl3Vys1QkFrcE8rcEQyckI0c05LOXNFZ2ZVaGpLUmE2aXFVMFFOUUNR?=
 =?utf-8?B?Uktrc3lnVmtSaFdWNjNuM3M0cVNrbHhOVXQrQVl5cHhCMmw5R1NwbnBpWUJR?=
 =?utf-8?B?YXJIcGg1d3Q4NjIyRkJKOWpnSkpBODNnblZmc0NEeXRCNitDZGtKN1VaM1VC?=
 =?utf-8?B?TWJoNjE4OFMvYzNwMEpWalJkREM4ekNqbXJTMHVTdGdVWllLdmlCV21ZbHhX?=
 =?utf-8?B?RUYvc1RVWmJyVXU4aDQyYnBiWHVvWDZSMFljelFUemp0Y01vNmY5M3plTXdu?=
 =?utf-8?B?bVJlZkxaai83WDhKaFNNQ3Q1aGZJemZocHNYRkY1WklZL252M2t1SFNmQ2FO?=
 =?utf-8?B?NXdSSjJIaTNzeEVNcVNTbklvcDdJaWtTRHc1RWV4OUZ5UGRBYWdwejZGQUFF?=
 =?utf-8?B?TXNHWFV2OGRWTUxMZ1YvQVhLWVVDZytOajRVKzJLNjNxMzdGalM1UVNaOFFq?=
 =?utf-8?B?dkVlVUcrYmRQRE1DdDNIQytMUzBTdWFlWFI5U1BSWjZzdFEwYmh3Wit4VmZa?=
 =?utf-8?B?dHJ1SkFncVJKTkZyREEvMjJmQUpQbGJoYndLeFVFK1FQbGpqNEM4ajVsNEVK?=
 =?utf-8?B?V1hoYkhPcmxPbEpWRC9kVXI3enRaVE5IMkx3U240REhHOGdMWVk3aml1Yk9D?=
 =?utf-8?B?SjVDbmNYUmIvbGJDTzZYS2kxb2hNSjBSK1Z1K3hpUGpGSUprUjJ1TVpmZmN3?=
 =?utf-8?B?Q2hCVXJzNklZZFkzc1BYVG11dllMTE1iSS80Q1JmUDJ1c3J5Z0prM2RZSWNl?=
 =?utf-8?B?WFdHdG9Ja0V0a0d6Y3R6TnhHZ1FPOGZ5aGVqeHNmdXhrZkVOdTYxSC90Wmdn?=
 =?utf-8?B?ZXkzZXhSWlhaUlloQ29MUkpQMFVSSElPd0FqNm1FaTVTZnBGM1kvQmluMnNa?=
 =?utf-8?B?dzhCMG1FWFh3bkNuZUM5LzF6NXc4Mk5LY3p4RGpHdUVTQlRidGpYQWtrM21R?=
 =?utf-8?Q?isOO+PddVs4z3GGTw5OjX87pLIovzrzQpKldnDx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f59c1e-49bb-4914-f30a-08d8f2104dbf
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2021 17:38:31.6266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CuEMau5jJxlBdsLUC1oJV/bDrm9WVq072/rdbFNFjL3awqlDC711VeRgit2nUveYThgLkUB2YrAZGzi6biCKDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4361
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, Alex Deucher <Alexander.Deucher@amd.com>
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



On 3/26/21 10:14 PM, Arnd Bergmann wrote:
> On Fri, Mar 26, 2021 at 5:44 PM Vijendar Mukunda
> <Vijendar.Mukunda@amd.com> wrote:
>>
>> Fix ACPI dependency kernel warning produced by powerpc
>> allyesconfig.
>>
>> sound/soc/amd/acp-da7219-max98357a.c:684:28: warning:
>> 'cz_rt5682_card' defined but not used [-Wunused-variable]
>>
>> sound/soc/amd/acp-da7219-max98357a.c:671:28: warning: 'cz_card'
>> defined but not used [-Wunused-variable]
> 
> I would suggest simply dropping the unnecessary #ifdef and
> ACPI_PTR() guard.
> 
> It might be helpful to hide the Kconfig submenu under
> 'depends on X86 || COMPILE_TEST'.
> 
>         Arnd
> 

Will drop the unnecessary safegaurd and will upload the new version.
