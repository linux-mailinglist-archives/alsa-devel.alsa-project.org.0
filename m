Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 810473BF935
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 13:41:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3D44167B;
	Thu,  8 Jul 2021 13:40:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3D44167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625744461;
	bh=eJyPJoV/aij52jXhnG/FbF17lq2Gt7ZtfaxGeSFDHZQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zy45uteVIr+wzJuowfuogZRiF3TFpzxxu7rTOxL8wjJtmq+gMmyAZyvQh8SXqvNue
	 9mVvNV/gAGoKrR0R5mRr2pTcW8/Gbof667l4Z+7C7PjERL6e9ZLQreUZ+ksvwnQu3c
	 juWU/N0PxuRU6c4BrzglRPI0o4AXVbDbT6YGr8Dw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87D66F80246;
	Thu,  8 Jul 2021 13:40:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3522FF802BE; Thu,  8 Jul 2021 13:40:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7325F80246
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 13:40:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7325F80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="MP4Rk446"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAQO9MX1tq9hmUUd34gMyC62pxwfjCe7hIiNcPtSfKUigmrHUnRiBPpidV1eXLAuY712bl/YPQnVN3weiDqECZp5TyI7aR/g2TXZzNi6M+W8YfCqqBV28EDnup4VDtTP547xSdOdEV2HabdMwcENdbdBi5E5Zb/cqyxw5Rw5tFmMfELKPMGPR4QErJq7GUIrXLcXYtk83ZOtmP9/zFdEKIfyuxZtU3efW0dSIgjbKDghMcymPzNhroK1ZBexOAjUMQ+gFVi5Yphyes7/cRGBs3ZBKhkkKlgOFbWkn+yxHQj4UbSEc5Rm0Px3+h6OOZD8J+qS+LOa8NLEnZCNZGssTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oF93lj8d/CKRFJCa7P53Ywm8l3dqkeVeKNOoM+OOb4=;
 b=JFeD5EFGYK5OfS6k+fa2Y+j7ubZ1CjAzo0ip+SfczSrJp+ULmeXhzd/hXVn2a8XMAtOqiHVdvPuhwWhbG/W9V+LAAICeKBmljDpTnDp8g29//looNNrbXId6zUcr+/AoU/TwNVDBzyauxam6cWN3VG8MuH+jIOcWB2vdI6/TFIzVKHvG7Q2ngZJUWvPXjFFBFNfbWxfxjDQ0T8D8XFhoPpJHmMHiEQkUeHBODmhjurc7Ocn7b8ZXj6VWVaadvbYv8BAab6M4AHNLmw/ZNmbzTCHkwCh+8mtz2y6HylfDis43kFNTLcVSvlehPJIQVCA9BnXOLhdnZTnkILAdjWO73w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oF93lj8d/CKRFJCa7P53Ywm8l3dqkeVeKNOoM+OOb4=;
 b=MP4Rk446kcpeFNQJWv784KYO2xNSzKI7vx+Ib75Pl38FUTE/pEeyGeIybu5dddSmmkKfEAqEkBB8IZABy2EcrrrN7HLIF/vDkWbRAwBHPFB3FMH1lNWsCpXg2x+xwqJWDsYuOqsTawE1iehNrw5m28QNKWExDehjbp5L9vHIuG4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MW2PR12MB2379.namprd12.prod.outlook.com
 (2603:10b6:907:9::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Thu, 8 Jul
 2021 11:39:58 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439%11]) with mapi id 15.20.4308.021; Thu, 8 Jul 2021
 11:39:58 +0000
Subject: Re: [PATCH 05/12] ASoC: amd: add ACP5x PCM platform driver
To: Mark Brown <broonie@kernel.org>
References: <20210707055623.27371-1-vijendar.mukunda@amd.com>
 <20210707055623.27371-6-vijendar.mukunda@amd.com>
 <20210707162420.GG4394@sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <5abfd669-6a54-98c9-519c-ff7b5a195ebe@amd.com>
Date: Thu, 8 Jul 2021 17:27:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210707162420.GG4394@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::19)
 To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.93.39] (165.204.159.242) by
 SGXP274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Thu, 8 Jul 2021 11:39:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb367196-a9d3-4a19-d839-08d942051d4c
X-MS-TrafficTypeDiagnostic: MW2PR12MB2379:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB2379F7A830AF112B08D6957B97199@MW2PR12MB2379.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ju34W9QtQYK42GVSvJHdMR8skgZY+umEnLvYQXeVwO+wB9XTgkcCbwUXdAUkQEP7nMD8H+jOBWBFotRjUmCF3znVPHfgjv1syAeJUyAoyV1D2FSm3/QIl1wW6w1WbZ9YmXfcIb+05zBFjtOf2WPnswvBUk72YrjqlCl6HbBCoiMu5qCivTcxnl6Ctq9l0M2v3ajDURAMF7XTnTniyr7qo0fz21y3wxW7qXxOVowPDnOdKQdDc/HwUIipkhieHop3J/A8o0UIw9iZhxi97G9kkntjMhOzcfb/hjyRw4efOlOYyjUsrI17HjTZ/DHDNnVxlIQjEGIegEpMvqY9lPtufUhissXo/gFPoLZs1YHa6TvZRr1wOI/guOnSvHxIs1qKz74WiyJLE8CfUr2QFcI5+aKjabzBDU6hVPaoynKMezxMtozYl4jocNK43GdkefHAZzO9mrie0UmqiwPNldIATX0VpTr4c9CglKhK7fmzgIOjFkxvB3eYyztg38hrrkgXCpXq0OKcyw5RNegZ2d14iqP+r3yMtLgxk9sb+W8rFB8Ce2AJyY0NA5OGB5qHByQ6UgB46UmtVDyq0wPO8Scdi9x/FTI/LdJG802rxmPBE7+nYwaiEHNixeG4lNXtOFuoxDASBsNlg3lBMtsvXzVLx5gUGJSOOZXQYdZV+LUszjn5J5SU5wcZRwZ6NN6afp8ALNrm5KpaUqS6BwBqAv+/3sEhmMKDB153mwfwYiHBwsbZzvsW8J+f8CEwZ/NgMZWw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(39860400002)(346002)(558084003)(26005)(6916009)(2906002)(8676002)(31696002)(956004)(2616005)(6486002)(4326008)(6666004)(5660300002)(186003)(478600001)(53546011)(8936002)(16576012)(66556008)(66946007)(31686004)(66476007)(86362001)(38100700002)(316002)(36756003)(54906003)(32563001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?/rMs+uqyLpwGMTh2J/F0Tlqg6Qc3Wb2uIOxW0zDu5iINhMS82kfyfyBL?=
 =?Windows-1252?Q?37T5MnV3ggY2jTi/cPyICPonYd1qJAPcFO4QI4YjJtSYeJE913sY/YhO?=
 =?Windows-1252?Q?YkjWYyZ8vpxyhgdtjf9Gl/iO7oC9xW2XDBjSmsbhEglRH+JiSL00ZSbI?=
 =?Windows-1252?Q?aIgJjLtu2GR6mfv1JLHuUBD/d/iraQSzN1ew/smVjCs1N/uEMtzmITSu?=
 =?Windows-1252?Q?JJZkjXCEQEH621XzihI1BtQTWXKgVCEsRyXqbyeh6np69Wz2UV5DsCA1?=
 =?Windows-1252?Q?2C8nCS7MUP0apoEFIzzxUIt160kLlGw/bpW+mvbTi5Pllo37NBc3MeX2?=
 =?Windows-1252?Q?cL9VjMxSDeb863g4wE+CRWhlb5jwzD1hkxVvaLFWsomvT+IbbI/KL7jr?=
 =?Windows-1252?Q?a/LZqPVCuAmN5w6s3Vkv8tKCw160FKthQBJAyMDF5ZLWI1qz2RvfrOPN?=
 =?Windows-1252?Q?wbOd0YC8MqR9QXqFHY13kpuqcGHXaweb/OS7VIRvp4jnuMuvIU7UHBgT?=
 =?Windows-1252?Q?mbye3qJTEM2mnCYjx1W87MTtXSCHaRG6/PIWfhgPVhsPy4wNJDFHr3Y6?=
 =?Windows-1252?Q?QDO6KU8TF62bLwhjdsCEMbwfmWfQYhceTAxpFW4zRFiLRZ/ImeFBj+vV?=
 =?Windows-1252?Q?FcoLJDjKq5FCHwyj9Yeb5gYAxrBuC0xFE+ipw0jSCs5BsCZqoY6D2m94?=
 =?Windows-1252?Q?AS8CWAjyemDPUJHMHhvjl5AzMgFVlN2mrIDb2ZgGOQmVn4toAxOV5Erc?=
 =?Windows-1252?Q?VWIjU36IvBoP4zeABUfRoF/bVh86DhU46gqrvf/ANdsmfetTpUlhfV2N?=
 =?Windows-1252?Q?zugVVFRdnY6GD6RoL0Jm0C5UHDIyxl8L1CwK32KWu96GZ2OEe476+TM8?=
 =?Windows-1252?Q?3+GF1mcOkIoNKI9Z0p6FYBRh8M4/XX9zqm7SjomulnFXDzd1atjCiITq?=
 =?Windows-1252?Q?HvztxPUxCXTBgZdJdJ2AfJq8ZeK8FdN7qks8LG+RYOIpncUTVMs4tZvc?=
 =?Windows-1252?Q?IV7PQj8dhGXHd40pw5mCftzTfFGO7dcbN7txsszbHM94tBtkHpfJWjTe?=
 =?Windows-1252?Q?N8bnUn9h6ZW58iH/7eQJ4zYKcXKc06icbmgOwbUJX5DR165xwpfDPH3O?=
 =?Windows-1252?Q?eS+CP3Wp9Pl81J97NsLlQPbxs1Ic8OMP1fXIqfR/EpgAbsNdGPeuT9SP?=
 =?Windows-1252?Q?U/E+lLfkTHYOzgwcxQjJVfP3jqHg1/YOPY/zpjOSilRJd/NSpZvVOZ0J?=
 =?Windows-1252?Q?eGafDI7fTngOYkRFrY3c2VjrEqFnjB/suAVavWDEjwlHfNQK1TTWpm2b?=
 =?Windows-1252?Q?ZnHZDQggt/3Ct5cCEA7xV6uzqfZKHc/Flg3rNrLHweB/cIrr0SXMCzhk?=
 =?Windows-1252?Q?ImUKQv2GiORYltBM4Sn/JQvVqzvQ02UtBnv/genZI8uCooe+98V9oMAz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb367196-a9d3-4a19-d839-08d942051d4c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 11:39:58.6629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QRdDOpMokCpSzW6JQ9oV6DIeVv8EX92JxG77wEvtuGddY/V5vss5MCACoDuOw1Gp3jPBZPgPGzG5LQg+AdQ8iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2379
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Alexander.Deucher@amd.com
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

On 7/7/21 9:54 PM, Mark Brown wrote:
> On Wed, Jul 07, 2021 at 11:26:16AM +0530, Vijendar Mukunda wrote:
> 
>> +static int acp5x_audio_remove(struct platform_device *pdev)
>> +{
>> +	return 0;
>> +}
> 
> Just drop this since it's empty.
> 
Will drop the code and post the new version.
