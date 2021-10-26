Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B355743AC46
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 08:25:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4923416E2;
	Tue, 26 Oct 2021 08:24:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4923416E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635229511;
	bh=FrE4JHQNPfeIkFNqKEaSjj2CSSz6ik1WLGHUQYDnU4o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vg8WcwMf1xNUIN84kQn6LTu3pr3V+YDLL5yR0GHcJSbCkjPBdsrFAUpXRDfGqJNDk
	 F2NT7GDdlMvDUsG1PmabAiEhFl/Z5cLKpbgZ2dWEnHsbC4+9oHhg4MHcrZzTKWqGjK
	 DoHC+Uha523ijbE8tThP5RerFMc36+IjX0OZ+TsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D27D4F802E7;
	Tue, 26 Oct 2021 08:23:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F11E1F802C8; Tue, 26 Oct 2021 08:23:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::617])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0DDAF8014D
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 08:23:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0DDAF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="JVVRLvqK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFn1v5NiTbhY5vSisiiBjMuPYu25kHX2G7EXuIUP3EgDuoEzasyvVXpgF0gc3+jve73mVMqYDKDvxWajFhzY9NMaP3SXxrwxpfdmZx7ATt4MKOEWx3AJBmXakfsl8I19lEo++M4l4dqEHQjvjRX3xbDvA6+ZOD/TCHl2e7fGNXBbWfeA2UWLc1Jg5V4St5Ckv8/T0JmeXNagsUKltQJNjpizIdSQiQWyVGvB42W7FGGJ5jg+lqH5d3/aUro9k6wb/Vxsn++fdzVPSNybq4oTpo29rPdPQvEeDrjkrlaj7NZq9rDA44p6FELrNBl0BTgR8aQjcIi6th8tQJtxtpFeqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSKBOQ2ZQnih3tCt7D9ziiP5YfOwT9CPJAmq4mgzZzc=;
 b=l1SozSX+kNi3IFensuI26X1qq09TsPG7fidP4t65UQbAsl0Itr1uSiZT7SOcn5tq7NOHhz6iDABOOsUbJjIwWPwA0gk4iTApp/QMqOHIwiac/XvZFHyjovTvZGIqiuPdGLpdcTCgdYDkUzl/PeNqamQEoxYh6T7PtjYCJ360PlFNmzZ0mXwqtf/XmOjaGdn4bUCYlsKLM2ALkQ3OREz2YxuHos6z/ldEwxP6harA/F34EPpipx/sbet4lvqdqA9WQOxl6iIoXLFI6y0OaZlh7jolJOTXS5ZuQpZON1nvnrnI7d0lSroQMhVdGgF6zRAz+SpkctwYsTanfGjcj7+ssQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSKBOQ2ZQnih3tCt7D9ziiP5YfOwT9CPJAmq4mgzZzc=;
 b=JVVRLvqKsbp6I31YFqh0Joyd1gaugQz9cvIk84t7kjfwuUyRHF82qAda6iPjpOlcR0dhY0jVVJ2QyV+FfVb1OHFVF1mzriwa/jVtxFposg8vskeaR1ZXbKjoaz9yzurZJeLFTlxA1cf+5xQzQgPYjJ45gNYWrikQyzvR4YJlmcbkfrr2qoMSM1ohshEnDNh/1tCO0zk9ieSjuWxnlKUJNi4Vo8EtRsW4V9t2rHxmsPrs/StaDFLrwz38IRztpK2Apa4qizWDnEOW/dtjWOg55YKAdqGooG1HLetaG9cbzHC7WmtCG/NlGF1E6UdT7GW452UDnt/yadaFIog+2a3MUQ==
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=nvidia.com; 
Received: from BN9PR12MB5324.namprd12.prod.outlook.com (2603:10b6:408:105::15)
 by BN9PR12MB5368.namprd12.prod.outlook.com (2603:10b6:408:105::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 06:23:42 +0000
Received: from BN9PR12MB5324.namprd12.prod.outlook.com
 ([fe80::bd5d:72c9:f3ea:f171]) by BN9PR12MB5324.namprd12.prod.outlook.com
 ([fe80::bd5d:72c9:f3ea:f171%7]) with mapi id 15.20.4628.020; Tue, 26 Oct 2021
 06:23:42 +0000
Subject: Re: [PATCH] ASoC: tegra: Add master volume/mute control support
To: Jaroslav Kysela <perex@perex.cz>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com
References: <1635159976-17355-1-git-send-email-spujar@nvidia.com>
 <79541c76-2c2b-fd4b-60c8-67ee6b8ea3fa@perex.cz>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <8cb777f9-b73b-136c-f560-de4c31af931e@nvidia.com>
Date: Tue, 26 Oct 2021 11:53:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <79541c76-2c2b-fd4b-60c8-67ee6b8ea3fa@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: MAXPR0101CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::15) To BN9PR12MB5324.namprd12.prod.outlook.com
 (2603:10b6:408:105::15)
MIME-Version: 1.0
Received: from [10.25.98.39] (202.164.25.5) by
 MAXPR0101CA0053.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Tue, 26 Oct 2021 06:23:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 639fcfb4-1a29-4b46-5736-08d9984927d4
X-MS-TrafficTypeDiagnostic: BN9PR12MB5368:
X-Microsoft-Antispam-PRVS: <BN9PR12MB5368A15B7C76944BC23CBA08A7849@BN9PR12MB5368.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Z/K1rNK/SDHwpbTk/RbsLj9LCTyrP+YuT/YNWZ55h99arQ/fBdahOTmDxD/NadfrkAgJvWYMYYM9F82r1uHKwpnoY6FI9uvIPWKlk5qDIqV97GI2TDCD6r57G17F1dNbyUqsX1cXOW8sMyZRZgK7lZSjWcYeEuL6GLSAW93HEMPzyYzcwnBaYKuN1Qd7r47eu/k2ySujdob1EKjXvP1gXidAMnvea0SP5Y/Kqwb6eGxNVejcjnlEz7OmLWVrD0PqaKZHFibjUw3x8cTS6AcfHZxOuCXHskrI0yHareI8OVdB4HlB+hpfGNDpjrFfH+jiZORmp4UCtu7QoIYw+6neXWoyBdXXhfeEcBiC7j4i5CA689gIBbAReF/wxCGUQKTAQ5w3sJ3Jmi9ZxL1tDRN+SlFjw5gK33vBwWwG3xaZWkHMn2xPJXuECZ3SV+PBCcxQI0eMPy27qpAKCmK3eEUFJXM2gQGpVzrQoOqqph0O144wP+nujel0W6ncGCStZeZ/M4a0/O/rNiksYv+h3MnOaQw+mlFQDb7lcy2KtCDiUHyvoVM3PiPGBknkDXOONJSRGV88IupNusbXTOA9iyBhW+qv0Qyl5E4fTPrtPD3yvPJdrXOyRb9ormAEN8IExeljnUvuwSWohaZBrrBsqLidnHBoZDg8LpC96pcbEJGDd72dRCbg0rjYxK/9TPDd8eaW8q7R9asBnteNzRZF64apDii0C3Do4tk893CNAoGCIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5324.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(66556008)(36756003)(508600001)(8936002)(83380400001)(4744005)(66946007)(186003)(86362001)(31696002)(2906002)(26005)(2616005)(16576012)(4326008)(38100700002)(956004)(8676002)(5660300002)(316002)(31686004)(6486002)(53546011)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SERlZHJnMHB5NkxndmZLY2l3SU9tM0xZeFljZG00Y3VHdjQ0VHhUZjBEOWQy?=
 =?utf-8?B?cSthZFhYZXdQMk1uaTkwbzJoRXkyeTJrVklUL1RyclhhK0ZlZ1M4VXVOVmpX?=
 =?utf-8?B?M0dqQWxxM1FTWU8vcjU0OWc0UDVmME43MExYeG5KdWNUTzZ4SUxNYW1YQXVy?=
 =?utf-8?B?d05Pa05DM3lhcXJKa1Y0WnFqWHhiUGlBeEwwdHZMazZTUld0V0FpNzc3OUI3?=
 =?utf-8?B?VENtZXVRM1g2ZnJvSUdjTlk4L0RzTjFGaG1hSzNHSHd2Y1p4M2pVRHRlUHBC?=
 =?utf-8?B?NW9IRmtnTXNjNGhLZ1Z6ZUFUR3MxMzhIc2hMMFo0U1ZmYmpVSVo4ZktaUUJK?=
 =?utf-8?B?cTJQY2RaNW9Fazl6dmtUNDdYZXdnL2JSUjNjWThwNVJQdkhqN3RnT2lNZ0Zs?=
 =?utf-8?B?cnIxUkF1blNYMU9SUzV6enB6MmY3VDdaQlJBSnVHam9pdnJxQmp1NWJXL0pS?=
 =?utf-8?B?c2JJZkIrV0NPc29BN0lsYzNOZlJVS0YyT0VDRnNUZFkyUzhzWk5YckI5VFVk?=
 =?utf-8?B?UUViVVNZajdxMzhJZzRZVEJocVBWN0VEMk5UOWtKSDdSdHp3amcwTHZCWUhl?=
 =?utf-8?B?WGRjSFM2Mk93RlBhaTdPQ0FxeFlUM2EzWkNFcTM2dmVVV08zcUgzRi85RHpy?=
 =?utf-8?B?OC9XckhmaWcyQTZtMlFMTnpDeEVTSFhJaXpRSjl0aEN2M2owTEJlWWJjZGNC?=
 =?utf-8?B?WmM1cVhFVHNkTEI2SnNHd0RpR2xPYVdHOGk1SlVaTmxxV21qaWpsZjNnbTVE?=
 =?utf-8?B?aWJTWElldFNBcVMyd083b04yYW44RWIxMnlLU3RVcDhob2dvaG1ZWDVsNGVa?=
 =?utf-8?B?cHN0eDZaRmdJM1NnVldsbmgzRzhTMU1kRUcrd1daNXB3WjhHMlFyTmdEWGhB?=
 =?utf-8?B?WUpqYXE0ejZIT242dEFjZy8zTWJFZklrQUJuelZZL2FNRVgwaHVmUVhGZXRJ?=
 =?utf-8?B?THNwMWFaSEE4ZHZXR0pZcjFtNDhZTWpXVEVLV05oRXowcGxtYUx4L21XUkhk?=
 =?utf-8?B?a1dIYkRKVkppR3QxTVlBRUdtdDNNZzcyWldEdncwUnFicVNZWWh3MmdzcHBy?=
 =?utf-8?B?SjdyeG04OTlUcmd0Y09FcWpOTlFNMHl5VHMrUzhkWW5MVHdTOXlXSFZ6K2Ry?=
 =?utf-8?B?MlN5UkV1TXYzM2pkYjM0amlCSVIvRGFhdDJ4UWNXSXJSQ0ozbWdSQjBKbE9M?=
 =?utf-8?B?djAwSVY0K1h1c1hBekNDUkNYR2dHc1Njd2hWWUhNTmVCNzlKbUVoN095d1Fh?=
 =?utf-8?B?cXArYWI0bFdMMklaODdMV1haN093VHNUK3dtOFcrR0M4ZGhITEkwZEpNZHJP?=
 =?utf-8?B?QXpndzMzU2xMTVowZTZPemQ5bXRveW85ekgxRFJxampPR285TnhDNTZxeWow?=
 =?utf-8?B?T0JRSDh4NG85UmUrWlU3cytEZW5jRlVhb0l1MUEyYmMwcE5qN1lFK1gxR1lx?=
 =?utf-8?B?OG9BRmNRd0srd01ZM2trRU1GNTRzTDFHaUF0bFpRMnkvaUlFU2U3VGRHUXNT?=
 =?utf-8?B?bGxJSFMwaW9jVkRNZVY5ZGlSRnUrUVZOamtUVDcxZjVwNWRPS1JUcFBxbW9j?=
 =?utf-8?B?MGlrdmY3SExtWnA0MnZBY2hKNU9Gbm5DbGNRcitwaW1vcmkzM05LOXE5MHRG?=
 =?utf-8?B?b3JoR2JTLzZuajR3Z0lVWTJYV1RLNGNYd0ZpUWZtblhEVnZoRjRMN0FlYTlY?=
 =?utf-8?B?ZTJZcVd1SWEwQzRvRHZKRXJMUEc4aEdjUTR1dzlzMUpZK0I2eUNCN2kvVnhW?=
 =?utf-8?B?NGNSM29NWEpBaEtFTnA4ZUxwK21xNmFKS3dRZVlvZjF3cWNsemJ6cXFBTGto?=
 =?utf-8?B?TytERHBWME1UTElaVGpEU0w2VzZ3Zk0wRzRYTDZoejhHalliMUNkYjREV3hm?=
 =?utf-8?B?cmM2dnBpWG1vemMvN20rNVp3Yi9MdWlSS3NTTGNVM0xSTFA1TXlCU3ZqUTB3?=
 =?utf-8?B?bStCN3h2MDJnb0cvdS9kYkxaQzhicHJhU2FoaXFTNUFEcGJ1Z2lTNFhpK0RP?=
 =?utf-8?B?OFo1dnRoWmtIc1RNdWlXL255RjFBM3JiamE3ckRBM3QwU20xT1JSalNwczky?=
 =?utf-8?B?dnVSbFlDMzB0RTdWTDFUY1F3NkNTdzR6MVM2RExZUDhJczZpRUVVaFMyNXNt?=
 =?utf-8?B?TkhuTk5FMkhCVlZrZVpTNzB3aXRaNTZRUlBMUmIySXpHTlJRK01iaFRINnBo?=
 =?utf-8?Q?RC9hvnrAf+cxo6hF0zg0OFE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 639fcfb4-1a29-4b46-5736-08d9984927d4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5324.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 06:23:41.9182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ghp/4GudO3G25Enw1gLZr7U4dIor+VBtQzIOj7dl0UnZ8km/amQk1L7sNqUxXdHBDwilkBPK3JpQoGa0SzFTfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5368
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 thierry.reding@gmail.com, linux-kernel@vger.kernel.org, jonathanh@nvidia.com
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



On 10/25/2021 6:28 PM, Jaroslav Kysela wrote:
> On 25. 10. 21 13:06, Sameer Pujar wrote:
>
>> @@ -150,11 +186,22 @@ static int tegra210_mvc_put_mute(struct 
>> snd_kcontrol *kcontrol,
>
> ...
>>
>>       return 1;
>
> It's a bit unrelated comment to this change, but it may be worth to 
> verify all
> kcontrol put callbacks in the tegra code. Ensure that value 1 is 
> returned only
> when something was really changed in hardware.
>
> The tegra210_i2s_put_control() has opposite problem for example - returns
> always 0 which means that the change notifications are not send to 
> subscribed
> applications.
>

Thanks Jaroslav for review. I will keep a note to review put() calls in 
Tegra drivers and send fixes accordingly.
