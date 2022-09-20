Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5F05BED37
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 20:57:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F41220B;
	Tue, 20 Sep 2022 20:56:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F41220B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663700264;
	bh=4mf05Jkzj/OgDV0wP9KjGv57KEYZ/2oSCBOc3B5gGXE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AP1WICB0oFpOa9DCvFI2b+D1rePt1vQ5Q+Jr7OzpHUlO1uCnp+cQ3trxxHz0n7YVN
	 GAMe4/7vRfMyxeDCl9aHkqjUoXTozZ1HIKAdoKBUpVJ3kdTIEGY5+Lzu9YBWJJdgZo
	 sEuMIzddCxdWvHL8QdHkr7v7x8/ZwW1Azve7eY8I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D427AF80171;
	Tue, 20 Sep 2022 20:56:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D17DEF80155; Tue, 20 Sep 2022 20:56:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2085.outbound.protection.outlook.com [40.107.96.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A1F4F800F2
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 20:56:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A1F4F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="JNgsPKA8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8Lt5qOBtXT4xB+mQ0oEZbhZkNArD9FT0Ou7zf0fyHMxbFpu7htuP6AHP5Novo+N92nN6xPdSvXiI3ds00qiLLYr4VveclWrRxke22QY03BoRI1VUki75wHzWZsTw2ZpzjZzne6CBlPniPVxTi1rbX6w4o44UkMVE2Ngd+MxNOe966GaA7VSzlnMo7+ANXtJk5J3mhrWoD60xtpF5KM6u0adHiMpsl0qZ3alEwKBVDRvfrNkD16pei0WmC8VrVZBc5HYMnbZe5t6EwpEwL0QUxGsd7DQrWIyMcd/R3oZSX339iFlnf/3SpxhnyVN8CZnIh5wjgMuTPnHz2KiH6LhBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAe5A4yLWHYx1kIu5nLhOFfcchqjpaP/u9RvqAvdWjk=;
 b=a21DwdK2911Jm8m6Garte2vZZUR0eWgD8aoajXsyCMEjBhkRGVgHw1IpU6ae6z1YKhRNkSBvYOn5HvNN1sKKT47TVOLB7dPLBP6TdjvqahlR5TVCGxpo0g4QvcqE8toyawgwhg4pUolXS8OUs3+RuMkUtUIQaZBrNYQdMv0R+NtveTTpJZItOp61v2+vDfRJXZQOwTu2zFz93O2lk0xXO1ig9nI4eUr9+U/SX0iJaaboUlhnS4KX7eSfi5ypC+DmPAvsXy2KWqUqIk7+Rtz6wQT2d1IOVTqi0gK+t6dW96nkVSuXppqxNtoYG5Y/ZLzfFVQgdPMzlt6j5m9Dt6TNFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAe5A4yLWHYx1kIu5nLhOFfcchqjpaP/u9RvqAvdWjk=;
 b=JNgsPKA8V3WWtegHnwt05KBz2JU8SUQbMq01Z/vfHkUs9aTgG3tQJ0yQpmAzWE2JVpndK19dNAQAplHzcGs4DJoV2DxvOEIOLBVL+XyDVfjH+9Cer2heCWhin0Gp/TGdLOhdF4D79waWDe6IfRjka/MV/ePGTVVNscCgSq6z/2c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB7524.namprd12.prod.outlook.com (2603:10b6:610:146::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 18:56:37 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::76ec:6acf:dd4d:76a3]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::76ec:6acf:dd4d:76a3%7]) with mapi id 15.20.5632.017; Tue, 20 Sep 2022
 18:56:37 +0000
Message-ID: <557738ee-9e22-6c04-c098-0ca965e67aed@amd.com>
Date: Tue, 20 Sep 2022 13:56:34 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] ASoC: amd: yc: Add Lenovo Yoga Slim 7 Pro X to quirks
 table
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220920171320.7776-1-mario.limonciello@amd.com>
 <YyoBjHftjG/ACAuJ@sirena.org.uk>
 <f4fea2ca-00ae-ba85-b666-9fa267961add@amd.com>
 <YyoLYe9uGNnfl1iA@sirena.org.uk>
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <YyoLYe9uGNnfl1iA@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR18CA0032.namprd18.prod.outlook.com
 (2603:10b6:610:55::12) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB7524:EE_
X-MS-Office365-Filtering-Correlation-Id: ccea4ac3-05a3-4067-c9dd-08da9b39d827
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wQDfEOr5sj0u6ccSRss6TN8JckDRkcDs3EqpFt7dui+b7tH+MXK1hNDmyErpFcffX/mxxWqnwX1O/4hxfAquPJxHthiaqyGf952zVD/DGjSOIDKzd81KRzeBNvPSy9SYA8o2F2o1oySJbuZvphPwzMLB012uJunadDXLP71riGreIGi4LRPqHSYzHa1cpsQve/oaQdivjn7hxgp0/vj7cnFhP0IAd395HgrMyz6LEFJCc0ShibvcIR9CKV5iYa/OLPsQovc9RbUXW1JuCn2VFB62YVNenaPuNJ1OxED/0OCorZtckcXoYCYxML0RO94AhQylaborA1mynPsGcNMmMLAhfR9fWoZvQLkoz0j3C7KnHgeYKjIH3TrtU6QEHc6Dm+oEJOGogwzcpUymKqip+Qtklu2h0ZMSsonqHfcYeeusngVE55e99gkWmJozwVuScMOZAsX3lDL4go1IbyRrWAzal5ZhR2P5T1++R9iDkV3sf8auexv8a0pXZWnTDN9SoT5BZu58ZYD5yv45iqKEPXJnu4yDi0Pj9hfr/wqyqU+n0nlsm9A8Kb2YsxLn1x5TLX0kF2cKTqqnuQBUSJHNicMBNnlHo2FjhmUgkCFBaR51FJb6av/J2ut1TUUbR6EwehT7b+innAF8goQx3Fl0586x+48yiHAmxPG1R7PahcoOamvT4CCsFkHa6LRhehL0CQHn/8NZU9kU588cRImPPuP7qw+CIrAzcO7WwaomunBIPoNuVNpqSAE4os3hlx5KOJWOn9tZT8eWUL051M8VgrYc7VngAHwsg4HuRXuHyqjdW8HQcTJrk+HaDvHITFBgSKwqEm4VkVUfGOMmWgsNtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(451199015)(316002)(6916009)(66574015)(54906003)(86362001)(83380400001)(6486002)(966005)(31696002)(53546011)(6506007)(41300700001)(38100700002)(6666004)(2616005)(6512007)(186003)(36756003)(26005)(478600001)(4744005)(31686004)(2906002)(5660300002)(66556008)(8676002)(66946007)(66476007)(8936002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHVhb0plMmd3VHl3L25jSVJCVjJIT1E5T0d4T1R0Ym1wZW4zNHYwaHgyZHZC?=
 =?utf-8?B?UXZoRisrU3lyVnlGY2hKbm5EaW5HenJ2V1I0d1NsWjhyRDM1azVZcmpiT0ZQ?=
 =?utf-8?B?OEVNYWx3MEdBeHVrQWVGN2FvOGVZbk5lWXUvd0dVMjQrRmZka0prRElHTGs1?=
 =?utf-8?B?YU1YS2VnM2kzWTRSa3dTL3NhSHNlRk5seEkzU254V3NOYnBjVTBjR21vQU9R?=
 =?utf-8?B?REVyaUpTRjlVWU96eDJ0cnBQclNzM3QzQnc0OHFYV2J1NHpvUUx2WHpXNzRI?=
 =?utf-8?B?dVRjQ0FSbWlhMUI1UnkvTnBrZTFoWjFVMDRoNGdpM3VYN0RXQm5WKzAxeWNC?=
 =?utf-8?B?RUYrQnhabTZhajNCV0l1cFZuOCtJSWRKb0xibDVGeU4xQlQ1TTF3WGJybTlx?=
 =?utf-8?B?b1cvbEt2L1VFZlcxWWd4Ky9wems1WEtqR3Y1Z0lZWlFMdzMrcG1jOS83bnh4?=
 =?utf-8?B?RDVNbFlzNkpMd2pkNnhtRjVZM3I1UzJjQU9IckxHRnJpbWovdGlEanFKdzA4?=
 =?utf-8?B?Yll5am00aWFuWkJ0THJjc0VZU3RDR1lxUmN2ektWTWdMZld2dkN6aEdrTjZo?=
 =?utf-8?B?dmVQbG9FL2RYUjNTdEQyK3AwYmFRWHZjRHBDZWNyNlN5YzhORVFsUHNoRm8r?=
 =?utf-8?B?MDhrcjh5KzM5UVVVZFc1Rk00RnB3RDBwQU4zNFZadDdQNDRSd0RiNDh6N2hN?=
 =?utf-8?B?NW45am92aXB4T3ZPbXFlOEh0eVNad3RGQmlZeHJqNFd3TituRSsvZ3BJVmIz?=
 =?utf-8?B?WS9zVWJ2ZUc4TDV1QW9lMnVJdjJrMmhIQU5SOGpoRE9qNWF6ZUxTZTdlaXlk?=
 =?utf-8?B?b01HTlk3TEptSkFSWlZCT2Z2dnZtZURmOWkrTGtKekpNY2VJbjFPNGRTTytF?=
 =?utf-8?B?RVVnVzZ3TFowMG1rWEVEanVPYko5ZU1USEdnWDNvQ2xtZFZndWttMk01SGZL?=
 =?utf-8?B?eFpoc29QZmFBaEZod1pwL0RRUkphMEFRdjNXenc5b1FRaEhGWkZJdFdPMzRm?=
 =?utf-8?B?SzhwQ0xXZm5GRko0MXJ2dW94N2pIWE9QV0dCbHJjdGQ2R0k3T1FCV2hlcjA2?=
 =?utf-8?B?WHNVdkJBVzNJVDhGeDRaWkhSRExRSFNkcGNybEVieEVzbWo0aGNsK0h5Zm1Y?=
 =?utf-8?B?UUI5MGVIQ054cGZid05RaDFFZ0pienpkaVNqOUlBejBld3JIUFIwRjlzWG8x?=
 =?utf-8?B?UC9FbXUzUEtZZit5SG5hVVU2L1Jna1RkYi9nSXZ0TUNVblRWTEFjeFZCK2pT?=
 =?utf-8?B?bEtHVGRGdzNZeFZjUnZFVEJuVEFrL2dvaGg0UzhtbkdNVXJyMUt1RHBTdTFD?=
 =?utf-8?B?TTIweWcxcWZoRUlqMGlMd3dnYTV0MHE0ZllwNXV4WnVHamE0b25qTjV0VVdo?=
 =?utf-8?B?bEV0MDJpQVFsOXl0dHhGYXppWkMxWmd1bjNMR1dVUk9zVG5nWmswTURzUWdT?=
 =?utf-8?B?UjJ2TlMvbnE4Q1lZRDZYZU1uWDVCb0FMNmhUYW5WcDhBaXg0SnQxd2FYOHo1?=
 =?utf-8?B?SVdQbnU1NlkrQXNvRm1zTWJpeGlqWHdySjBGSVNZdU1TZTZnZThTelcvNy9i?=
 =?utf-8?B?Y1c4V3JsZU9udWYrM0d5MmthWnhPejluUllWUHMxOUpiK1BnOUVJNmVDbVFm?=
 =?utf-8?B?RmlMSUFGbTZiTFg0UGF1TzZQMzdoYXdoYUY5R083VjZmQ3lwaVhybGJ1VUN5?=
 =?utf-8?B?YU5ZLzh0anp0dkZHVEJ6dWQ4Ny8xU3liSHc3TjRhcE1tRk5BMDlIM05qTmw4?=
 =?utf-8?B?K0NzbzVLRU5WWDhTYTdiWEQxblZMRW5mRFlsTUZDOXphbGlObk9wV2dqaFVl?=
 =?utf-8?B?QVdwd2o1RmRMcFdJcDJXclFJSjUrdDhwSzNLWVBNcnpmQXNBTWcydWkvU0VR?=
 =?utf-8?B?c2N6UXhzQ0FJbHJGYUtZV2tZNlIwMGl1U05jcDBCaHJ3RU5EbHVlN2hEakRE?=
 =?utf-8?B?RFNybnBXTk1USTJmdS9Mb1JUNjlZSHhjbWQ3V1JKMkRUQU03bXFrMndoL2s5?=
 =?utf-8?B?ZXNYWEFFano0UzdDQUpoT04rNTlKVld2RFpXdGpiL0QyT2s4S0tMaUdueXd5?=
 =?utf-8?B?SDlsSzZaMlg1VHBDeDlBM3Ruc25EREN4NmVrc0hkOXFJRGtva2JnK0pSc0hX?=
 =?utf-8?Q?Bykh+nAfPmb81+zntQy4/7r+2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccea4ac3-05a3-4067-c9dd-08da9b39d827
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 18:56:36.9679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: moOxBafEjeUqHR8KXZUlhopF/Vj+k8Z2rqHx3ilb/XWMQ3aUJh5X9hVM55gN3Ucdzam+mgeKMee4acAkUhKbYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7524
Cc: Travis Glenn Hansen <travisghansen@yahoo.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 Sebastian S <iam@decentr.al>, Xiaoyan Li <lxy.lixiaoyan@gmail.com>
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

On 9/20/2022 13:50, Mark Brown wrote:
> On Tue, Sep 20, 2022 at 01:09:45PM -0500, Limonciello, Mario wrote:
> 
>> As I mentioned below the cutline it's on top of the other commit on the list
>> touching the same code:
> 
>> https://lore.kernel.org/alsa-devel/20220917070847.14346-1-lxy.lixiaoyan@gmail.com/
> 
> That looks like it's some patch which wasn't even sent to me...
> 
> Please include human readable descriptions of things like commits and
> issues being discussed in e-mail in your mails, this makes them much
> easier for humans to read especially when they have no internet access.
> I do frequently catch up on my mail on flights or while otherwise
> travelling so this is even more pressing for me than just being about
> making things a bit easier to read.


I guess the author forgot to include you in To or CC.  Would you like me 
to just re-send the combination of both of them as a v2 (including the 
first on on behalf of Xiaoyan Li)?
