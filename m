Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5E058ECDB
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Aug 2022 15:13:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E41261636;
	Wed, 10 Aug 2022 15:12:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E41261636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660137230;
	bh=Il9qcN+2KkxzV3Zc8pS1Vb58E/26+ve1yVeV2PL8fII=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pmKpeLfyV852uXIT/nUewU/YiLvSVPnvN6TUfDeULg5apweNHRXkUnLs3LrWG0mYM
	 LITlAZlUtEWPEbpnkbre9LhYO5kkImxIxodqJsZPEYNdSfBNIbgz8la9myjaTRIxwL
	 uw5w6hRU9yz8byJGfkxIL7DilBk5E6hPV4gRhM04=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CFCEF80240;
	Wed, 10 Aug 2022 15:12:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D989F801F5; Wed, 10 Aug 2022 15:12:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D4B5F80132
 for <alsa-devel@alsa-project.org>; Wed, 10 Aug 2022 15:12:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D4B5F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="VSYEIlRt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXjaeUOabivk3sjN0tPpDtGd1ge+dfoTq0cP6X7jPoUW1rHu4b08P3rn4Yc9Oa2fmnuxNuGQCxFKa7VSC9XJZY1qRMyyhKswHTORCEX8bbxZbyij6JaRu0i5LSCOGuA3k2Oj8FRWBY+rD43//Ynyog6Re8FmM5lDQ5wX2t4DjutIVFrb+QJDj2SDBRLdi3LU7m3ks2Zxeku6O7bA5wfYnawfML0DpvPAmqvp+CT71mAW4FZpjIVkGyWHm4CY4+iJrhCVw7/AF/r1XlqnsSed33bx2sHs99V6HS9fOB0N4++WzZLMJ82F0o3flITUAZswOYkKnTz4ZXy8Of97ZzxEzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJLr8MU0WODrctxYu3LQptY57yMwvSEd9ge6Q/vwl0s=;
 b=kiud8fI298Um07Pg6ekA6pOAhx8LX6+CRXqZy3nH+rjboXZ5Q8Vq6nrDvMNOP4UFB+rwkY0UkiyiYxdeT9yrnqEoKGvytKwqq7XUX29Z5eAkfr0TGgyadhK1eLZcFgbkbAC3xWafUK2v+d6W6raoUtySo8ig9gIKgK/zXIOdfuyVvaXmFyAzh7gtALXpmHOudF2Os23/bToXd2dSv/ft4Rr5DAwLLOv0cftqE/wbH1wl08dDLBkDILUBw/tsQ0gr9+rn0TxOzqoAHLE82JHd9s07L2PrpCS8yRonI3UTS5cjPmG13DUu3ENppYJHQVMPQGOQgRdCVB8TZRqdbk/ymw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJLr8MU0WODrctxYu3LQptY57yMwvSEd9ge6Q/vwl0s=;
 b=VSYEIlRtROXbjKOFBTRju2DjTP/uzWIFDwhpD0qR49RZ+gGOoJ75nIVgrqUweIRP4Ry7og0qIs+RwOfyofOpibLkTtnK29DKbgxViTBZJ1f30Mo3s2mZd8eOO0EznUigN6kYWedQkeSm2enN4MkXO88kVqi7jBfe4exlEVZLO+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5951.namprd12.prod.outlook.com (2603:10b6:510:1da::16)
 by BN6PR1201MB2512.namprd12.prod.outlook.com (2603:10b6:404:b2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Wed, 10 Aug
 2022 13:12:32 +0000
Received: from PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::3869:b51c:42b3:afac]) by PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::3869:b51c:42b3:afac%4]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 13:12:32 +0000
Message-ID: <40f9f912-2474-959e-b0af-9f42681e6e94@amd.com>
Date: Wed, 10 Aug 2022 18:45:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] ASoC: amd: acp: Add TDM support for acp i2s stream
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220805060420.813053-1-venkataprasad.potturu@amd.com>
 <202208071454.7YeHuTDb-lkp@intel.com>
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
In-Reply-To: <202208071454.7YeHuTDb-lkp@intel.com>
X-ClientProxiedBy: PN2PR01CA0210.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::19) To PH7PR12MB5951.namprd12.prod.outlook.com
 (2603:10b6:510:1da::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 678d18f1-2dad-455e-594e-08da7ad1fbac
X-MS-TrafficTypeDiagnostic: BN6PR1201MB2512:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vgJXNIku/PFJHX6rmmXu1rBAtqj2F5BCgPN0R/fI0df8I/1jZD3KGQ83GGYlwZEqZ/d4u9ZOfDflvbX2NMJGkacwFDomQdHXkAxZPLA7kwnQvjIVTY1tGDfub3wwAsZ2H6La4ec2b+CoRbPKlVgYudRS42VCtUblhfJbZc/IuVuVgLQaxmGagOcjlSD7/X2e+C22QjrAlX8DBjR2x04zXUhhZY3wueFivbVHgMeXyBYAFKHz2W/L5c+04Htp12lyjzfflRZDBGqdgDH/dqyLBpPRMy6LIdZrNF1ub+0pxFO6q/1Lh/cGfcbvldHVKQnKfeICsxAiE/AOexIHkqBTf8RU1DT6zOiLiMfR5kAImpLYT4CpJgwYYvuReTDCXlns+4You/Mbiy08giiFzvCFTIdZvbqu5Xx9MW7fpz7mCbG7X9Nz661DiNOD4XuuS/c2qYamx+0OkA9wdbfshIyqIj6SnKmZrPX2tGSb5baO/AMTXtBiohv1Mn4kAotUuAdDelx66AEFgGDPXTdrIsblKKUxwDrZ86Hd26OEdIVGK+/CG/ogA9LKvZrTbh52RHkPrCHBeGT1qRN14l3ACyO59uK5RNTe5FFkQdbBRBPMeYdaBNJsutq20kZd89Fv7BDPF/uL+XGvdvtLzI8fNceiJ1m/7y4AkiAL+IIOzYo/H+TUYQIGCTCpK7S+m3Fugb44gR6UFg1mTBgUkw4I7KXaVR/Qrs/9Be0uH/JaAEo+incZbMKKJh1wKnrKS27WkbM85qhE+jsLL/z0RDHB0p3q4PRsZ8N/IORznCABxoxASeJW4EuANNqNdX/81kr+LhYtS3KyLykx816vGwteRwks2bIs/iRI18uYUL/1Tc9cwMto27wUqvdlMNmglQm7lZMI09nAVqtve7ZuckRPo1KfYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5951.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(4326008)(5660300002)(66476007)(66946007)(316002)(66556008)(8936002)(2906002)(8676002)(38100700002)(30864003)(36756003)(478600001)(6486002)(966005)(86362001)(45080400002)(26005)(6506007)(41300700001)(54906003)(31696002)(83380400001)(53546011)(6512007)(2616005)(33964004)(166002)(186003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elFLRzdTOW8reGJDbWVmK2lyUE1DeS9sV0pqWWxDWE5wMmRxakNTWUJ1UVNy?=
 =?utf-8?B?ZHRjMU1DdnJDSjRJbW9Kd3FBMXV1TVIrYVI5Zys0TkNRNWZRd29jSjF6R1Er?=
 =?utf-8?B?UjltalIxeU1FL04zZDZkc2VpZ3N0TTRQeUZhV1psZ1dqeEo3OVhJUWYwVHVQ?=
 =?utf-8?B?MkRxYXk3OVArYVc1OXlIVnpsQVZFdWl4OEtKeXNZdm1xMlFQMkZvNWxmTVhT?=
 =?utf-8?B?Y20raVo3MmxlbVpleElKRjNjVTZHbmxEVlpYS1dBRUcyZzRZRWZtc1d3dlRx?=
 =?utf-8?B?WVV1TS9scktnaWN2ZVc1TjhkcWNMUGlzZTNhTDlwa2ZhQzJuaVRRcENtSG9t?=
 =?utf-8?B?V1hSakpGbzFMRzQvQkNkRnM5SWFpUk9tU0N3bmw3cE1BVmF5SGo1RWN4cTZn?=
 =?utf-8?B?Uko0Qi9OVk9PUjlSbjhmYXlkUUtvNE5PcWJzeUNvS2FDL0lQRmlPekFKWDl0?=
 =?utf-8?B?UnBYKzJGVFR1eHdtNU43YWxxcWQyQjFNcmVPTGhQOVo1TEJvemZrWkhyU1J6?=
 =?utf-8?B?bU0rQWZLRkRPSjBRTkJmeWJpYk4yTG9PMzkwbENVWjlBSzhpV2Fabm5UcXQr?=
 =?utf-8?B?RkxkQXBNRnNqekdPV09YbU1EY3ZCcUVQT2J0aDdzZ3A3Smp0bW1hMHhJUk1D?=
 =?utf-8?B?eE1uR0pnZ1BPMm41Wm9iclc3Z2E2b1hXWWIwNEJxZnI0SmZib3FFZzVVcHlP?=
 =?utf-8?B?TGVkODVJZUZVQTlEakdlL2dWcDk1ZDdjU3BlVzBqUUZVbFRiRXRoSDh5b1Nx?=
 =?utf-8?B?ejZ2a1piUEp2Q1FmUUhLNzNYdDRCRndyM2xGT1NUUlZWQjFkcUNRakl4d2pW?=
 =?utf-8?B?ajlvN1ZZWjJZOVZtR1RUSG1lRVpBTGxKSFVzeEI3V3pzZW5SbUJodFJ4ay9D?=
 =?utf-8?B?ZlRJa0M4cUZ6RGtwcVQ3YTU4bkNHbUVHQzNKMWdmM2dMSUZkS2FDcGo4aTJF?=
 =?utf-8?B?WTBMc3lxNlA1VXFjbXhVLzVoYXQzSTVJQ1NwQWhnZGNoYllpRmhlb1plOG5C?=
 =?utf-8?B?WEtpSTU5ZUJIZmlPYzFndnpzYVlFMHh0QWUvR2hMUmRxcHc3ek1QNjBWZTM1?=
 =?utf-8?B?cVZZWG4zMVJXL0x2WmNrQ3RMYW16SDB3V1I3YTI5ZDBnWG53enlCR2M4aGk2?=
 =?utf-8?B?bXZaa1JYQ3FCekFFWUxleUJ4ckpJQytJaE15aDlmeHd3RnhadlJzdDJkbGpY?=
 =?utf-8?B?QUNndGU2S2VoT1VtbnEzMUJNemMyUEU1Z2ZpSit0M2FmQXZzWW9sa2tFQ1JM?=
 =?utf-8?B?OStURzduTHpWNzd6SS94TlV1eFNLNnlwZXBDWHQxbmYyYU02bUdhRUtZQmhm?=
 =?utf-8?B?OGU2aTRaNWgycVlMQ0xTMjg0UzJxb2FheS91TUErLzdhMDNYaDlpaFQvNGx6?=
 =?utf-8?B?VFUyOUpWMDkxb3Mvb3BJNVJtZDdqbWQ5eW5xVFg2UlJOYndPTFRycGVZZ2Zl?=
 =?utf-8?B?bWIrR1hKaEFSNm05TklSQ2k1M2VEbUQ0aFRhWkxSUUwxcUluZ2ZTWUlaT1F1?=
 =?utf-8?B?UllMQnB0R0JQWlF1bTh2WUovd0FtbUdoVjdOdEtvUDAwd2pnSHNUS2c4Z0R2?=
 =?utf-8?B?WUcvYk9wbnNSRFhOL1JjUkJuTjJ0emtJMEl1dmZkT2o5UEU2RnlXenJUaEtv?=
 =?utf-8?B?SjcxamU4azhudzJBbTJQRENvRGJlOU5VSisxcXZPZ0hEL0I1c29EWmw4dThk?=
 =?utf-8?B?eXZDaHFoZGxOZFdvZkNwbDk2K0VaTjZEenJmU3NibGxkZTJ4RjUvUFpkY1hn?=
 =?utf-8?B?QTMvZ2lUVi9Dalp0dThuV2Vudkd4OVNnTjM2L1loVXZmV3N3TlFMU0Y2dFlz?=
 =?utf-8?B?UVR5akNIR1FZeXE1NlZDWXdsZGN6Y2xJT3RFWlpHdnVaTDhSUk1MUjA2alBE?=
 =?utf-8?B?cHp2bWVYWEUxU2RWd1ZkTWpkeUdMTk1KNGduUStrOW5jV2E3VE1GTENIR1RK?=
 =?utf-8?B?UWRUVjgvRUUvWjZkUTlJc1BiY3BZSURIeGZveXhtN1NJdVd6NE1sSVFXUjdT?=
 =?utf-8?B?cWpSTmVqbENaMndLM1A2SzNCc2FpYkk4WjI3cUhLYkk1elVsdXQ3NTVkVm51?=
 =?utf-8?B?VDRpWFZQYkxqUjB4WGxpK3ZhU3lIQTdnZ0U2cmIzak5mSTlOQUNSdzVFeXg4?=
 =?utf-8?Q?3hgWIz7CfzMmawlSWZyW3La+d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 678d18f1-2dad-455e-594e-08da7ad1fbac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5951.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 13:12:32.3763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Cv0uReLNcseGfTBEIsOjUGOOAStzsYkqoJllPsV3yOjfPdfdSfjGczaD4qvvsJUyT5B2RJzvzAchrc+7LqQrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2512
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Sunil-kumar.Dommati@amd.com, kbuild-all@lists.01.org, ssabakar@amd.com,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar.Mukunda@amd.com, vsujithkumar.reddy@amd.com
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


On 8/7/22 12:35, kernel test robot wrote:
> Hi Venkata,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on broonie-sound/for-next]
> [also build test ERROR on linus/master next-20220805]
> [cannot apply to v5.19]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit-scm.com%2Fdocs%2Fgit-format-patch%23_base_tree_information&amp;data=05%7C01%7Cvenkataprasad.potturu%40amd.com%7C06397243ad964e430c5a08da784359bd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637954527920715155%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=OorbaHKuOoqW7DbCbwTtKSOrN3WRBFmaIO7Ua5S2Ag4%3D&amp;reserved=0]
>
> url:https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fintel-lab-lkp%2Flinux%2Fcommits%2FVenkata-Prasad-Potturu%2FASoC-amd-acp-Add-TDM-support-for-acp-i2s-stream%2F20220805-140248&amp;data=05%7C01%7Cvenkataprasad.potturu%40amd.com%7C06397243ad964e430c5a08da784359bd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637954527920715155%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=%2FcL1tCMcR1Rp21LLla2hS18EjziPLIOZC7GSPaRMkyE%3D&amp;reserved=0
> base:https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fbroonie%2Fsound.git&amp;data=05%7C01%7Cvenkataprasad.potturu%40amd.com%7C06397243ad964e430c5a08da784359bd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637954527920715155%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=SnIKf3DpfeNAJWTtvykRyEGfn7sRyiuvmK3eA5vr3qk%3D&amp;reserved=0  for-next
> config: x86_64-allmodconfig (https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20220807%2F202208071454.7YeHuTDb-lkp%40intel.com%2Fconfig&amp;data=05%7C01%7Cvenkataprasad.potturu%40amd.com%7C06397243ad964e430c5a08da784359bd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637954527920715155%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3kQqmQcSpeZBiCUjR%2FesvNOECdVFNS3olWv6IGfdy04%3D&amp;reserved=0)
> compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
> reproduce (this is a W=1 build):
>          #https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fintel-lab-lkp%2Flinux%2Fcommit%2Fc603f9570621784501d7ce7f5099be37983cb810&amp;data=05%7C01%7Cvenkataprasad.potturu%40amd.com%7C06397243ad964e430c5a08da784359bd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637954527920715155%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=QaOUzq7KDkNDmDtTbawTnpB46weD9fXj8rnZmxUC9kI%3D&amp;reserved=0
>          git remote add linux-reviewhttps://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fintel-lab-lkp%2Flinux&amp;data=05%7C01%7Cvenkataprasad.potturu%40amd.com%7C06397243ad964e430c5a08da784359bd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637954527920715155%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=gLAIdogl48m5fKI5Sz5sUuU9faIl32G%2BZTKAs183tBk%3D&amp;reserved=0
>          git fetch --no-tags linux-review Venkata-Prasad-Potturu/ASoC-amd-acp-Add-TDM-support-for-acp-i2s-stream/20220805-140248
>          git checkout c603f9570621784501d7ce7f5099be37983cb810
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/soc/
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot<lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>     sound/soc/amd/acp/acp-i2s.c: In function 'acp_i2s_set_tdm_slot':
>>> sound/soc/amd/acp/acp-i2s.c:74:29: error: 'struct acp_dev_data' has no member named 'acp_lock'
>        74 |         spin_lock_irq(&adata->acp_lock);
>           |                             ^~
>     In file included from include/linux/kernel.h:21,
>                      from arch/x86/include/asm/percpu.h:27,
>                      from arch/x86/include/asm/current.h:6,
>                      from include/linux/sched.h:12,
>                      from include/linux/ratelimit.h:6,
>                      from include/linux/dev_printk.h:16,
>                      from include/linux/device.h:15,
>                      from include/linux/platform_device.h:13,
>                      from sound/soc/amd/acp/acp-i2s.c:15:
>     sound/soc/amd/acp/acp-i2s.c:75:43: error: 'struct acp_dev_data' has no member named 'stream_list'
>        75 |         list_for_each_entry(stream, &adata->stream_list, list) {
>           |                                           ^~
>     include/linux/container_of.h:18:33: note: in definition of macro 'container_of'
>        18 |         void *__mptr = (void *)(ptr);                                   \
>           |                                 ^~~
>     include/linux/list.h:531:9: note: in expansion of macro 'list_entry'
>       531 |         list_entry((ptr)->next, type, member)
>           |         ^~~~~~~~~~
>     include/linux/list.h:674:20: note: in expansion of macro 'list_first_entry'
>       674 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
>           |                    ^~~~~~~~~~~~~~~~
>     sound/soc/amd/acp/acp-i2s.c:75:9: note: in expansion of macro 'list_for_each_entry'
>        75 |         list_for_each_entry(stream, &adata->stream_list, list) {
>           |         ^~~~~~~~~~~~~~~~~~~
>     In file included from include/linux/bits.h:22,
>                      from include/linux/ratelimit_types.h:5,
>                      from include/linux/ratelimit.h:5,
>                      from include/linux/dev_printk.h:16,
>                      from include/linux/device.h:15,
>                      from include/linux/platform_device.h:13,
>                      from sound/soc/amd/acp/acp-i2s.c:15:
>     sound/soc/amd/acp/acp-i2s.c:75:43: error: 'struct acp_dev_data' has no member named 'stream_list'
>        75 |         list_for_each_entry(stream, &adata->stream_list, list) {
>           |                                           ^~
>     include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
>        78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>           |                                                        ^~~~
>     include/linux/container_of.h:19:9: note: in expansion of macro 'static_assert'
>        19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>           |         ^~~~~~~~~~~~~
>     include/linux/container_of.h:19:23: note: in expansion of macro '__same_type'
>        19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>           |                       ^~~~~~~~~~~
>     include/linux/list.h:520:9: note: in expansion of macro 'container_of'
>       520 |         container_of(ptr, type, member)
>           |         ^~~~~~~~~~~~
>     include/linux/list.h:531:9: note: in expansion of macro 'list_entry'
>       531 |         list_entry((ptr)->next, type, member)
>           |         ^~~~~~~~~~
>     include/linux/list.h:674:20: note: in expansion of macro 'list_first_entry'
>       674 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
>           |                    ^~~~~~~~~~~~~~~~
>     sound/soc/amd/acp/acp-i2s.c:75:9: note: in expansion of macro 'list_for_each_entry'
>        75 |         list_for_each_entry(stream, &adata->stream_list, list) {
>           |         ^~~~~~~~~~~~~~~~~~~
>     include/linux/container_of.h:19:54: error: 'struct acp_stream' has no member named 'list'
>        19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>           |                                                      ^~
>     include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
>        78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>           |                                                        ^~~~
>     include/linux/container_of.h:19:9: note: in expansion of macro 'static_assert'
>        19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>           |         ^~~~~~~~~~~~~
>     include/linux/container_of.h:19:23: note: in expansion of macro '__same_type'
>        19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>           |                       ^~~~~~~~~~~
>     include/linux/list.h:520:9: note: in expansion of macro 'container_of'
>       520 |         container_of(ptr, type, member)
>           |         ^~~~~~~~~~~~
>     include/linux/list.h:531:9: note: in expansion of macro 'list_entry'
>       531 |         list_entry((ptr)->next, type, member)
>           |         ^~~~~~~~~~
>     include/linux/list.h:674:20: note: in expansion of macro 'list_first_entry'
>       674 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
>           |                    ^~~~~~~~~~~~~~~~
>     sound/soc/amd/acp/acp-i2s.c:75:9: note: in expansion of macro 'list_for_each_entry'
>        75 |         list_for_each_entry(stream, &adata->stream_list, list) {
>           |         ^~~~~~~~~~~~~~~~~~~
>     sound/soc/amd/acp/acp-i2s.c:75:43: error: 'struct acp_dev_data' has no member named 'stream_list'
>        75 |         list_for_each_entry(stream, &adata->stream_list, list) {
>           |                                           ^~
>     include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
>        78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>           |                                                        ^~~~
>     include/linux/container_of.h:19:9: note: in expansion of macro 'static_assert'
>        19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>           |         ^~~~~~~~~~~~~
>     include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
>        20 |                       __same_type(*(ptr), void),                        \
>           |                       ^~~~~~~~~~~
>     include/linux/list.h:520:9: note: in expansion of macro 'container_of'
>       520 |         container_of(ptr, type, member)
>           |         ^~~~~~~~~~~~
>     include/linux/list.h:531:9: note: in expansion of macro 'list_entry'
>       531 |         list_entry((ptr)->next, type, member)
>           |         ^~~~~~~~~~
>     include/linux/list.h:674:20: note: in expansion of macro 'list_first_entry'
This patch is dependent on below patch, we will send these two patches 
in one series.

depends on :- 
https://patchwork.kernel.org/project/alsa-devel/patch/20220804072556.601396-1-venkataprasad.potturu@amd.com/
>
>
> vim +74 sound/soc/amd/acp/acp-i2s.c
>
>      47
>      48  static int acp_i2s_set_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask, u32 rx_mask,
>      49                                  int slots, int slot_width)
>      50  {
>      51          struct device *dev = dai->component->dev;
>      52          struct acp_dev_data *adata = snd_soc_dai_get_drvdata(dai);
>      53          struct acp_stream *stream;
>      54          int slot_len;
>      55
>      56          switch (slot_width) {
>      57          case SLOT_WIDTH_8:
>      58                  slot_len = 8;
>      59                  break;
>      60          case SLOT_WIDTH_16:
>      61                  slot_len = 16;
>      62                  break;
>      63          case SLOT_WIDTH_24:
>      64                  slot_len = 24;
>      65                  break;
>      66          case SLOT_WIDTH_32:
>      67                  slot_len = 0;
>      68                  break;
>      69          default:
>      70                  dev_err(dev, "Unsupported bitdepth %d\n", slot_width);
>      71                  return -EINVAL;
>      72          }
>      73
>    > 74          spin_lock_irq(&adata->acp_lock);
>      75          list_for_each_entry(stream, &adata->stream_list, list) {
>      76                  if (tx_mask && stream->dir == SNDRV_PCM_STREAM_PLAYBACK)
>      77                          adata->tdm_tx_fmt[stream->dai_id - 1] =
>      78                                          FRM_LEN | (slots << 15) | (slot_len << 18);
>      79                  else if (rx_mask && stream->dir == SNDRV_PCM_STREAM_CAPTURE)
>      80                          adata->tdm_rx_fmt[stream->dai_id - 1] =
>      81                                          FRM_LEN | (slots << 15) | (slot_len << 18);
>      82          }
>      83          spin_unlock_irq(&adata->acp_lock);
>      84          return 0;
>      85  }
>      86
>
> --
