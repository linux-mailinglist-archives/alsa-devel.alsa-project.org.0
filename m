Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BDF340724
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 14:49:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF9601697;
	Thu, 18 Mar 2021 14:48:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF9601697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616075346;
	bh=NWvvSPSsuMahDkapVh4Lm0e8nIvvbXUHVTQN8HtDNMA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hevAxO/SlAPly4n9FrjZPyTsYX8KA/Mcy2gFcaK8EJRJqKkGKeqDhAzqX7o03kiFr
	 bfEcbOamk6fI5/PWImuZ8BbY/T07TVmtdgIzJPjnxEUSoJBpplpgv0lt3pzvUV2a5S
	 6cyDWAjaLDpgngFUHFkM/djqhz4PRwh1frM7qpIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 206DDF80171;
	Thu, 18 Mar 2021 14:47:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28176F80165; Thu, 18 Mar 2021 14:47:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D435F80124
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 14:47:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D435F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="eahnymnQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5bw9BrE6vWGp/r3e+A8yrHXbZ8QF7QuElKJZCIv2Vbmj8y12ybMIKsZyueyeIiAZoJJLIVXFI7y1/dFNCW7lcHpx5OgrwVOXbpX+kmcWC9DEhve0YTXtD6oxPHfJhK8jt87Xv6VuJIMJ25lNiKMKZSIZRuPxNPhtj7QYwE4S3/EhVBWSv8jsv1/OncC1OSEhKicdpBY1vpDMwFSMm0TZ4rHeowNJCuFoCwBWxmRzCBwa4+x48poU231nd/Pc323qmq4x63UCzFshiumEWD7sS2N6BU78J1emEbjreKVmVRpZl9sd4uOIBsOla++frGULWiWjHr83qbhl72E/XavLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2Hpi+IeN/FYkeoK+HoqHtYfR04bdrodVNsfEy076Zw=;
 b=l4TWx52U0RTq3ywZyBNV2BJmTI4V4EgoJJpGg0Myz68/5gmP7eUd6CUWNo8Fz6rJkA5G09Z+6808MTDmTsqtOrd/JvF1/7NKJcE4JBsSdT7EklyO6yBn4bTOEAemDLh7LTD1sy/YX7xjxYPj+7fZzZGV3zPywZiq+7J409Z2m0YRkhBlTH+ao70ZUQyVgNn7eWZ7pzcssQ+G9C/YGFe4yxeWrIcDxN+Mz19Tt1Te0JPwwqgN+fegvZ2smTRbunUZQHTWZjkvMoKq49DSR74iMZfXMIq3O+ZFhrx7lHN6j+l1h5LWNwk6yKhXs4fsveuq4dFMcClKgOds3mbV5dN8Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2Hpi+IeN/FYkeoK+HoqHtYfR04bdrodVNsfEy076Zw=;
 b=eahnymnQjnMiUsQVrRVs9xrUAznUHYsVNWCnJwu59NAqf3wGtSzXDHQwW6y6OIkEpyw+YVbe7dCATE9Z3Fp7x7cs66+kj0jvxZsBswSV6wfhPd6N3IfzNouboHATi3CyI9v9nDaSAbitD3O86hcf9szRzGOBAaUIsXhqQndflUA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MWHPR1201MB0271.namprd12.prod.outlook.com
 (2603:10b6:301:57::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 13:47:08 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::c977:4e9:66b8:a7e]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::c977:4e9:66b8:a7e%11]) with mapi id 15.20.3933.032; Thu, 18 Mar 2021
 13:47:07 +0000
Subject: Re: [PATCH v4 1/2] ASoC: amd: Add support for RT5682 codec in machine
 driver
To: Mark Brown <broonie@kernel.org>
References: <1616013238-12254-1-git-send-email-Vijendar.Mukunda@amd.com>
 <20210318130020.GD5469@sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <d9568571-6b67-5fea-4eb9-165039a3d7e8@amd.com>
Date: Thu, 18 Mar 2021 19:34:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210318130020.GD5469@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: PN1PR0101CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:d::23) To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.93.39] (165.204.159.242) by
 PN1PR0101CA0061.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Thu, 18 Mar 2021 13:47:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bde61cc3-5cfd-4d6a-855f-08d8ea145254
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0271:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB027182E3FD77D8A4AF66DEF197699@MWHPR1201MB0271.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +rIirW7LdE7cGVLt/+uyqo3mCuQM+ozw0J0z452mPPSyGK57YnFAKtKJ4FeWCr6rAxwdgHhS4prjcsfuAKmljRXUqe8M5Un7bsO/jBiK1QMS4jT8j/qcTGp02gViah4JrpuoTR8pt/IrLpYxRID+MYx9qHMnwO5hQV7GPCotA0/QO1bQUukwU8VnbglXjhUxcH5bLv9b76JXsjeDEQ1aZR1b0XG8pfLidROPE+jiMPIA1/cjcAcmmK8Iz8ijEvUzPVz+reWihK0xyoj9Lmn/5cZOR1eEU4L8ugqEi8fRZuPKCSfnlQ91KgEA/fqdKuUCyaBl0ro/3OP3N4fzCrsfTr57lrQ36OiaVUQu+6QKLc6rpY1V6QICu2k+PyIwj2fKC0uJetRbiDxibeiBFRLsJakBHqsDoM4IJaZl8pMCXCs8Rq4uoqJ34y64xKciCih/RRj8CSzy/SON36Mrc66RGwQBoa0/qMkj2PvuGyUAB1SvcGOdh8gBKhRHPIKMcfZKcTsQhDNTktlvvZqY7oB3VUJoVqKBrSMSriarJ2YQezqoBZ0LWZmdDIs8GhoHlU0isoseYkL+pWPt8TSleulvigxd5rjXtojVpRseaeVOreIpS6VieuVsdDBnphxjSAx2jhCwfY7NkLlYTDjJE4I6fecfbyVH2NL5C40c2fouHNeE7yj6wRjiYDzIG3IZakzr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(31696002)(186003)(26005)(8676002)(53546011)(956004)(83380400001)(16526019)(66946007)(86362001)(66476007)(66556008)(2616005)(6916009)(5660300002)(6486002)(4326008)(478600001)(38100700001)(2906002)(31686004)(36756003)(7416002)(54906003)(16576012)(8936002)(316002)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?zBer6MUekFUNZJqbETxaPoP4WgnIVAMjsdjt4359LKFFqnOL4uSp685N?=
 =?Windows-1252?Q?CPQ3EkyYgajsF0s+e17jyK9FeoFQHf/TDqXfGoj0HpI6DeEu/Eqii81U?=
 =?Windows-1252?Q?/CU/SOsM3hmwQT/TAdpKZz/zww4quIX9kyGOpE6/Nr8IKXIp6rbmb/Uo?=
 =?Windows-1252?Q?ud+bl1nknw/WNx3JePlDoZ2W5VWGbwjBez8ADHI+Qp7fxG42Gk/6Yoak?=
 =?Windows-1252?Q?t0DDNub76JtIod3l7bKFWUdKE9hTquwXjpmXBUKzlYlKiwBnucm9OBo9?=
 =?Windows-1252?Q?+KtGhgYYu5ay+CjuzqR+9FTrmly/Xpa8F+C7G39urye3wtF6xft+/r28?=
 =?Windows-1252?Q?3lklOY0eegkMwMwae9m2C+2DpxtsVBrxs4YYWA5LDzpVEBNdIEw5XryL?=
 =?Windows-1252?Q?X4Q7uH+DUxjnMvXeMkXeORlJmAliriuSR2VBSROgtgYzKWXhCzkafFTk?=
 =?Windows-1252?Q?C2CFaniq/pDyZhdxr104cfPfHLAOc1zf5RprZGrQBHYu7mS0JUhsW1du?=
 =?Windows-1252?Q?vbXlZ6W9ElQtv6xWFDFvm0KzwdAIH62HaJ5KSU+OKXIXBBbDsWYNHa8v?=
 =?Windows-1252?Q?DL7Ydfr0LrILvOXh5FFk48k9spmio5zn1FDdtbtbfFVMHicqJW+Cx3oz?=
 =?Windows-1252?Q?1ZtgagO0aYS1RNgehq9XI3dbnd+HOE196ARmZQGWNmqpN+IoAGS8H5Dd?=
 =?Windows-1252?Q?wvqFnqJ4l+++yDLp+57qlQR4IyVx6I44eYb+Zo+HOlMR0+0vDeIqAvHI?=
 =?Windows-1252?Q?iqohOaB5pX0ANYwDIducRsKozTDiGvGf6wt43oYetXr0En1uRwDopH7Q?=
 =?Windows-1252?Q?ae4lusjWCT0XAMFtFXng5PrfP4kjt3tOKAodmwXXyIQLRojO/cV/GiZE?=
 =?Windows-1252?Q?Vje4kApRx83+SvL8gjGiBw41l0p864Hmv3VcHp5lI7jyZ20pUsyoK30u?=
 =?Windows-1252?Q?QT7WWuQZO2zCrACBA3FgzgMnCqre+i/G/QPMC8fEAhfUz9Rb7b3pbur8?=
 =?Windows-1252?Q?LiODrZ+q/mTIPKKra5yxbwMNzIDNAsdtYwMsvbi+6AGBEX4G8Ui6Lz49?=
 =?Windows-1252?Q?ihlLygDDkzH+ubJCAK6rdhLXHG7b6gPZMYbTeRgR0L7uBOuGVJu6MldK?=
 =?Windows-1252?Q?ODxz/UGlQMCY3ZHOrtsg6Z29zVUHFDDiTCOwVaUEG4mja2P5uypH9B/V?=
 =?Windows-1252?Q?HaQ9R14DrlkVAhZDrzOKjyf953TVBFqPhcyRz6XzVvGXMRQoY4z6oqky?=
 =?Windows-1252?Q?PLnXyIvjESLFvzXhr3uFLmOaWN51o+8K83ugNNlykjhZoXRBrMOY+ZpT?=
 =?Windows-1252?Q?6f1z+YH71dsqw56tCZgWYxecof1OVeJNjgDWerhlN0+HPTrD5ArdF6KG?=
 =?Windows-1252?Q?SL/pKDyOtvAw78JsnSCr7LlNh1xh0LpmXyMqMo30Rc4Qd/UedB2XPinO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bde61cc3-5cfd-4d6a-855f-08d8ea145254
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 13:47:07.7410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDBG11sEnXy6nvoAhwDJ1drmd81afRLTXJcB3akAFCH2y0ZaUZuAJePhOHX6eenGnJhpCa9bgnv8QQen6U85jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0271
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Chuhong Yuan <hslester96@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Alexander.Deucher@amd.com, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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



On 18/03/21 6:30 pm, Mark Brown wrote:
> On Thu, Mar 18, 2021 at 02:03:46AM +0530, Vijendar Mukunda wrote:
>> +++ b/sound/soc/amd/acp-da7219-max98357a.c
>> @@ -1,27 +1,8 @@
>> -/*
>> - * Machine driver for AMD ACP Audio engine using DA7219 & MAX98357 codec
>> - *
>> - * Copyright 2017 Advanced Micro Devices, Inc.
> 
> The conversion to SPDX really feels like it should at least be called
> out in the changelog, and probably a separate change.
> 
will upload SPDX changes as a separate patch.
>> +	/*
>> +	 * Set wclk to 48000 because the rate constraint of this driver is
>> +	 * 48000. ADAU7002 spec: "The ADAU7002 requires a BCLK rate that is
>> +	 * minimum of 64x the LRCLK sample rate." RT5682 is the only clk
>> +	 * source so for all codecs we have to limit bclk to 64X lrclk.
>> +	 */
>> +	clk_set_rate(rt5682_dai_wclk, 48000);
>> +	clk_set_rate(rt5682_dai_bclk, 48000 * 64);
> 
> The driver should really check the return value of clk_set_rate(), it
> can fail.
> 
We will add checks for return value of clk_set_rate() and will upload 
new version
