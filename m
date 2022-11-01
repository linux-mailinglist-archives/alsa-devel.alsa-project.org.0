Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A23614703
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Nov 2022 10:42:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E27D1678;
	Tue,  1 Nov 2022 10:41:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E27D1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667295744;
	bh=MsQ9p9PDTUGivv2b2Ls1xse3Vu/QXdJZNAYtNAjzrts=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WA6kOmY89B0q5NBKehgmIMMUGJ4Io1RH76H4NK5Eyh75F3Y48+VApeZQRmXOFQUKN
	 fqPGkaiH5ErdWYZWbayYrY278tlC1HbofWq7+o/KmNZdLfOOhuK/i1bsPD1N4zTY27
	 SCOnnJGWCJ0gag/S4hOCwVyoynKTATHardA3OHho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8A6FF804AB;
	Tue,  1 Nov 2022 10:41:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E82D8F80423; Tue,  1 Nov 2022 10:41:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C76AF800F3
 for <alsa-devel@alsa-project.org>; Tue,  1 Nov 2022 10:41:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C76AF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="IxgOTzOX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcsXSwYkL0+fJuybp32jrKj/JNU2pekfkUPps4f++NnHxFRGLorsL8sWp86Eqoxymjing2CuieWBNSh/4TZJkq6yRQpZiMxoiCo08qdSK+FIE3aJlnUO14b72Ok7kyldPZaPKBigbgo3SGNRAGw65138nKfDC4n/UgEx8oqq3og6NsorUiFx28yNNuu+CjxzpQ0eC7Xfkf3y4e1/zacnVDek0FOw3lEFtKd/Z0WQ+SmXhN1cFkcHHiJFMqO8fZ5NFX5BfvzpiNX4VpBRqv4FL1uRlMgI4ABsgj2JlF+ta3p4oiZ+qeHaJTskEf7NhCGlzvgsoi5VqM4zDcrxGhvTuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYdFxnOV9nsR5QfFZOp7fVPP6vedcz0sHR+J91t3p2k=;
 b=IZVlI9YvK/FGcfr99IDNpyXpSIyPeNqNd+DDYhk023ANkBB2s7UKjKKEs+hXo2ltzL9ZVlL/HxHES8MkVNsr7zR3Hz9ymwD0/DTPcGeTNgZ37XHs4DF5pWw3VyIUmRMTOwimL8hwEXY1YX2ZK16pDtDZbgyxr2ujqu1Hg8zRp2Pr+KDRCOxr6yrlKiMGGft/OzHYSZNXHAweHF4CCxCnYkf1ajC15gOuXjWUOqDHWiKm5cEtBxv8N24CDZrxEks75jnYhPFR7IPDqADXxwUPDBZxPR0ikAwjihHmvGRpHEH5tBtcUko4RTl76L7BTWmqHme+tke2vynjAb/Acwc9RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYdFxnOV9nsR5QfFZOp7fVPP6vedcz0sHR+J91t3p2k=;
 b=IxgOTzOX1KydKrU2POr1m/J3nMCCRNZK62yjvz9DcbfqE4hUHhIt5BVVlXGPTTplLHIqvEqxqJlBiB2CBw98a71ysmtFkZTRdWWU7iv4tMvmaYogCkNFK/Pw2rdxxSxASoNfrWk/36A0cRqh0YYgKJG7WzKHKGbMEhYO+TVFigQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5951.namprd12.prod.outlook.com (2603:10b6:510:1da::16)
 by DM6PR12MB4481.namprd12.prod.outlook.com (2603:10b6:5:2af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Tue, 1 Nov
 2022 09:41:17 +0000
Received: from PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::8e3d:119c:e824:2fcc]) by PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::8e3d:119c:e824:2fcc%9]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 09:41:17 +0000
Message-ID: <b384e012-31c5-8412-8b05-cd026c5d6a0f@amd.com>
Date: Tue, 1 Nov 2022 15:15:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] CHROMIUM: ASoC: amd: acp: Add tdm support for codecs in
 machine driver
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.corp-partner.google.com>
References: <20221028103443.30375-1-venkataprasad.potturu@amd.corp-partner.google.com>
 <Y1u1vj0K3m33wCTd@sirena.org.uk>
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
In-Reply-To: <Y1u1vj0K3m33wCTd@sirena.org.uk>
X-ClientProxiedBy: PN3PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::8) To PH7PR12MB5951.namprd12.prod.outlook.com
 (2603:10b6:510:1da::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5951:EE_|DM6PR12MB4481:EE_
X-MS-Office365-Filtering-Correlation-Id: 858779f7-9f08-40df-3e9e-08dabbed390a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DvJRu1qayVBBklRxMXcMJnHsxX0xEjSpJkiOg1qlFppEsYZEVREZbAUFPTzQW8lZGSSMIikjs7YJXeuHAn02FW5ZAiSG7CngRhkZ+RWubNkQAVfhdWeM/qwNtDZgAKqB3Na/OBLD82cFR2NNq24D4u5IOoBu6glqXx9DMSkK36Kx4ucZOtqjfe5zoSxXkoyvfbTywCYU6UgnnmjX7iJnk3NN7Crt0TRuvTC+n45+CWlXTWqQyJdp7xGycMm9aTvPoT5EaV16ekFgkjyCXjFHiXvaYX+fdNtn2QokUV1Pjglv2F/IeiInwUUhEVbzCCb51DFqhQXUxTxCyxPLO88/SgQwbV204o7oGnSq2vJBYP0sr3fgPB/fMPFmqFdc+iakFZeF7bgF2vN1UryL2n+yAnqVpjwJ3f7626zrT92k/wfkmpf5LQfjzQj1cIP2tRvkZz7lSw5mDZvPlUtM5Y6zLssoGfzZTkz7GEcekD7LhCVUzzs44Jk/iJj0wYtECZcSL3traVMuEbmqwt9D4zg/Czr4//DlB0AZXl5I/Qs7nQWV1kcLJvvOx7SGhxQUKR0+MykR/46thJA/Vyb+xFQGcI132bW5/tlqWvWuZ9e2ygjaaW1uLy1d5V239QOzmzz/DxOn0e3af1rDrjR5xRjcn/XT3cUcz6f3YElqSL0pROc+WxWJ64N4dfiZCxF6ybZ6KQj0x3GmQisLpYMFlZhlQG+NaK3m1M3hEPhCP+xXYFdTogNOgPFjRgXXxlJuFS8ZA2QEOaDVJzyFCBs4zC9Pedc5T7jPfNG5w+UrGhE7QH8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5951.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(451199015)(86362001)(478600001)(26005)(6486002)(6512007)(2616005)(36756003)(54906003)(8676002)(186003)(110136005)(316002)(31696002)(4326008)(38100700002)(66556008)(66946007)(66476007)(33964004)(53546011)(6506007)(31686004)(8936002)(41300700001)(5660300002)(6666004)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTlFbFg5SnZodCtpbFNaek9NNnpGZDFJb2lENkp6eFNRRnJ1Nlo4dHpXNCtD?=
 =?utf-8?B?S0dLWC8zc21LU1ErMW53dG91bUNZM2kwSi9zblM5SWNtOHF5WDdldXZBZW1M?=
 =?utf-8?B?SDY0bWRpV1ZraWhpWmN0d3piamlCNmZBcHdacEU2NVU2QjlVTlk4dEk0N0Na?=
 =?utf-8?B?OVJLb2ZaSUc2SWlRVjZOSndQeTVZcklZeE5jMmlUNjNOT2puUk1wc2ZaUWpx?=
 =?utf-8?B?aTVWeWhlbWNzSHY3dnJVM2ZmVVVOemo2alJvNEcwd3dFcWo0UlYzYWVscEpM?=
 =?utf-8?B?c0F3dk90VFRBUGRDNERJZGdseTJ1VEtiSUxNOENaSkZnbXAvYm1MMnhXNk91?=
 =?utf-8?B?dlJTbW44RFBrTHNRNENkenNxY21UU2paN0FTblNrQVZpcjYxUmxybElWOVRq?=
 =?utf-8?B?Y2doeTRIZHpxc2ttbmFTaTRyWlJESklmRTkrd1IyTk9iVjNOYTB4L0tlY0ZG?=
 =?utf-8?B?ZWVEb0FMc2ZhQlhlcnc4czBmODlZaGJ1bm52ZmlUUEhoSE81NG83dEFtemhr?=
 =?utf-8?B?Z0x4Smh0YVF1czRoTitlWklYSWZCWUhoSnlXMlJqaDFlYlY0a0IxVGhrczVR?=
 =?utf-8?B?dm11d2wwbzRqNXNGczFQOHZlWE0wbVAzTmptQ0YzSGcwR25OenBWU1M1c1BG?=
 =?utf-8?B?SnBJakZqZnVPTUtLNjNSaHFJeVBtdloxN2ZNNjc5OTY1TGFtWlNobXBWMHE4?=
 =?utf-8?B?NVBJOGwzdVB3d3RGZVc0V0gxWWJielVMTWRWTU9MOUd4WnZXRTJpdXMreUZj?=
 =?utf-8?B?Q2xMZmppQVFUV0ZiTmxtVHdObjhjTXJCc1pveElVYVo4U2JXQ3g4NGc2R1N3?=
 =?utf-8?B?aG5IUVQwWTZ2V1lhRTRwMndiWG12ejh5NEhYTUF1K2s3Q0QrZ1ZXWVVqak9X?=
 =?utf-8?B?Yjl4QXRWaHFnM0cvb3dVS3lsUytIdEpKWmpPN3FXTDhuRSszVGdueWE3dXlU?=
 =?utf-8?B?dllNVXVPZ2lZMkRNd280eTlMQUdENHNrdmowVmNKNzlZU05PKzhmc2pIUjRZ?=
 =?utf-8?B?cVpKSXFLanZDWnpMZTJhS1BqS25PYkxCNlA4aS9HUk9VaE1lZnVrb2Y1dXpM?=
 =?utf-8?B?RU15bU1iM01HekVXcHhaTVBqL3RNZHRjeVc0eFFmdXM3NjBBd1YvcGwzakNR?=
 =?utf-8?B?SW04czA3bC82TzE1cUxsVzMwTU1DN2xxczZZZWs0QWE2TmswSUN3NFJGZ255?=
 =?utf-8?B?aTFqL01HU3NpWEQ2Z1hUNjdKbG12dmhMa2Q3TkZ3RndOTTZ4YjJCQmxvR1lu?=
 =?utf-8?B?bWVVbXpURmpxYVg1T2k5S3laTUExcXZPTXNkNTJYNlF3RlpuaThIRDZRVmNE?=
 =?utf-8?B?dWFjRHdOeGwvN3RYV2gyallHcFJmM1ltNmI0RElNRFl3bWhtZVdxM2dYdy9S?=
 =?utf-8?B?MEEyNndFYlgxbHNnQk5la3lseUxNa1BzMFZWN0J1MllOUDM0bFZLZEpjay9v?=
 =?utf-8?B?cWYyc3I4OVFHL2NJUFZwZVpMVmczOGtncUhqR0E1WDkybXFKRG5UUCtDbmlS?=
 =?utf-8?B?NzdsWHdsb2NuOUxraEFCOUtUcGg2R2sydXBoRkc0TlE5eW9kRGlHUnJzNlp6?=
 =?utf-8?B?MnMwNldCR3dpUVNsRHZNcDFVRGl0M1dNUW9Ld2pxVG9Qc1dzbENPRlFOblhB?=
 =?utf-8?B?Zy9kWi9raUVIMkJFZ0NjbzhtRUU1Zk5OOGxTOXk0T0VNOXpablY0dXFVcEFs?=
 =?utf-8?B?WE5uMWJyMmxlZzRIRDBLNms4QnRDU2pEalVqdXZtS2RJbFdFRmk2TjRnNWl4?=
 =?utf-8?B?VzdLMHFrSEx2MGpjdWRZaWloTWZuL3dlQ293VitYNDYyNjg2alZDQ3pUMHdF?=
 =?utf-8?B?Q0dYbzBnTElGdTNJWldyZFRtbXZvcnRCV0ZsYnpzbE9Fc0F0NzRMd21jclpl?=
 =?utf-8?B?WG1BNmYwWHRSTE1tazRiTS9XNy9tMU9Ja0diblBZVzVlbTFwV1V4aXpKUEZE?=
 =?utf-8?B?d25UbVlxR0JGWHdER2FXaGJuZVk1bGdpM0UzTU1LYm5tMmE1R3hROHo2N2Vz?=
 =?utf-8?B?S3NJcmNNNXpUQjVWdW4wT2VIeEVTZWlVZWVsNTZhbkxKc0l3Y0ZYenV6S2Jr?=
 =?utf-8?B?eWllL2NKbmNWdExDdTcxdHpKVjUwdVErWkZVYmFIS3BtK2N4aENSYXZaY1M0?=
 =?utf-8?Q?4u//CLGOCtpLpZJVDOy/M6q18?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 858779f7-9f08-40df-3e9e-08dabbed390a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5951.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 09:41:16.8255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+soqZNrqiBGOIp7/6ck/tJ9kY7sgJO84HdtL+OxufB7OPKRBrNzWFCDNs27MTaBvSvAf7CrofGe2ZN+LGnP7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4481
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Vijendar.Mukunda@amd.com,
 vsujithkumar.reddy@amd.com, open list <linux-kernel@vger.kernel.org>
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

Thanks for your time.

On 10/28/22 16:28, Mark Brown wrote:
>> +static int tdm_mode = 0;
>> +module_param_named(tdm_mode, tdm_mode, int, 0444);
>> +MODULE_PARM_DESC(tdm_mode, "Set 1 for tdm mode, set 0 for i2s mode");
> Why is this a module parameter - how would a user decide to set this?
> Is it something that someone might want to change at runtime?

While inserting this module we need to pass tdm_mode variable as 0 or 1 
like below.

sudo insmod /lib/modules/$(uname 
-r)/kernel/sound/soc/amd/acp/snd-acp-mach.ko *tdm_mode=1*

>
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Sorry for the mistake, we will not repeat this.

Thanks.
