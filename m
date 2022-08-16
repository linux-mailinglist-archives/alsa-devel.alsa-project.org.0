Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C24559522D
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 07:50:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A55D015C1;
	Tue, 16 Aug 2022 07:49:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A55D015C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660629027;
	bh=KCGXzZUO/cGaVKqIzf70Vtz5t+fz9YEsHEcXYwQJ/1w=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qa6tG30FAbKB5kYd6J+VYH8sW/6DbEOMHsMlWz5FRugM012ampsKgfTIO2M3ZnRGP
	 nilHtz1Fio5GPMT0T0w+t0iYkZrpV3S1U9hAJff1O3zKakyEGxbwcEUQeZZEY25yh0
	 5/3rY7FpLhLKJM3Tgt8gjkIqYI5QgU8vRWtvIdTA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C830F80118;
	Tue, 16 Aug 2022 07:49:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9825F80118; Tue, 16 Aug 2022 07:49:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E30BF80118
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 07:49:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E30BF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="I5DYTQq6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QUyw4sewwlkz8CSH1GSeP5yvy+V68hDwI2Zdku7T8mkn+dBbQWzimusnFHK8oPgE+LzKaaB8lsBFGSo7+dM7jiCKbk5UJEO+DioUCjwVjUI1mh5vE6qKMCKXtl1+3wxOn2BU5tmy89XzLa9tyxNzDDmeGopqG2RYQtrnM0kQCPGtmhmujcvmEA0PNe3cNZe5nYZph2DeJ+ye0J+PjuryP2V9jVTk3L5tfCHgraG8HoTybm4YVN5c9UT/h7QCeOaXt3TqafxJZIyhvivH6S6PwSUpH50tOFYevZcR/AiScZf+g9yNkb2xeQAX8YvZmYiP7ey6YAj+xWiyCN0tAeyPRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCGXzZUO/cGaVKqIzf70Vtz5t+fz9YEsHEcXYwQJ/1w=;
 b=B57fkWcxqjuf1bkNRbSZINi1xrdj980YzXwMQFhpagxPm9Me/QWdrZ4Lc+a1PbdGO8IKlnsdq9zSBglxHUjySHzN8eKhcPtA8splJpHitSze5e4scR3EYnVmfCXRqsHdd92DL1l6kvTaOQRpo9UokHa5QCvg19IgZc4CkmHfYze6Lv98BRjqcRoHUh6Uf/Y/EJGFQcPv8zeZu24390zht7xqgaVBCiociw8NJ/LzwV9ugWOoRTDt716pkMfHmd4nG6F/zDV1c+Af0A5GF4xxf4SXfBODpm+Ta3KmjgwQw6/xFlhHDqIyCNqnBtbHVCBaZwTKIJU2o5GkZkJ8eDc0OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCGXzZUO/cGaVKqIzf70Vtz5t+fz9YEsHEcXYwQJ/1w=;
 b=I5DYTQq6V+3OjdH1yWnwlUReOTMBvJhvmcFe03Pz222sdSN1Lxk9svH7FEVW9QhbG98N8KVeMyqWiebVypT+zceHGxgxFgrClTT3wtvzENucmcIAOw50y/3nkW96YP0tFLw8OZXDF5HUlUA06S0tcr/fs/1dzdHGxGCUGjlQYMY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3661.namprd12.prod.outlook.com (2603:10b6:208:169::31)
 by CH2PR12MB4055.namprd12.prod.outlook.com (2603:10b6:610:78::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Tue, 16 Aug
 2022 05:49:16 +0000
Received: from MN2PR12MB3661.namprd12.prod.outlook.com
 ([fe80::bc80:d6e7:d73f:d955]) by MN2PR12MB3661.namprd12.prod.outlook.com
 ([fe80::bc80:d6e7:d73f:d955%5]) with mapi id 15.20.5504.027; Tue, 16 Aug 2022
 05:49:14 +0000
Message-ID: <a8f414dd-8c54-4be9-8901-100160ccd06d@amd.com>
Date: Tue, 16 Aug 2022 11:17:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 03/13] ASoC: amd: add acp6.2 init/de-init functions
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Syed Saba kareem <Syed.SabaKareem@amd.com>
References: <20220812120731.788052-1-Syed.SabaKareem@amd.com>
 <20220812120731.788052-4-Syed.SabaKareem@amd.com>
 <YvZImUY5VUgnqNGk@sirena.org.uk>
From: Syed Saba Kareem <ssabakar@amd.com>
In-Reply-To: <YvZImUY5VUgnqNGk@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::17) To MN2PR12MB3661.namprd12.prod.outlook.com
 (2603:10b6:208:169::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ab5659f-e9ec-4038-cfdd-08da7f4b0c7d
X-MS-TrafficTypeDiagnostic: CH2PR12MB4055:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d8KnbFcA8MJ38PU2YZvtGFjIRWrpKaRXtkNfSlfiIQqexE56eKYTdyUgsO/x9i8uSLmeuREXe9/QmhgWfGevxZyFXDBMuF3JiCVj6fX7dmRs63HqEnC+mBfjSLnhcqc5SzEIXLXgWPyhw/XBFN//J4luCOVLoyw4Wj+Tt/lhpySVWVEaq1uzcA4uvn5vln9g6vXsOpYtvTJver6mLg1vK/sLmaCzzBnQ2+cLqCCGFVr0YHSKcCtjKb6rS3T0JqvKbpf1GBn5rMkI/TlLUXgq3OAg9nerBOqNdBF25xI01PtfesWFtYpTnvnZMt2bcMSk/0cVQ3ch0zbKNEGcAWSRaFBWXQ4HeJctOJY394VfTBx5SoAvss+7iVpt+m2d0Ki4Kw4qddyNb+mWwV1J4tfsuju0MTg17OB/JAQftA9ETuXLYZNZ2JWaOaqQIWts6kRlVLM+MjwL+Et1Z+d0ylkzDD2TedZxwvSXAkAbYB5DE+78hiC4lKXjdXRHbUUIn6cGewHffUbcBDqec9ZyJP1HO+M6sjQLgfxowPhTbADcXoZyoPOOBuJXFORy/+miC9NFp4+bh0qiDDw2RF18sl14b2WmitW3fCKuYgG3b4q5RfBMYEJ5EZ7xlZ4ee6jq1FTNobABRi5SGWQArpXpRi4Dlc88tN9rnqR+pSkiCKB/PTPXh5U54EmWccx02Y7rvS1vx8GA9yRpczoBC6Szuk33I7IKgmjcL5KlKFqvfq76KygFltaOnBNXE+aNjKLPKj7Fg7XlNmKj7oILBDubtuhiwh+i1CvZYEdZk5g5qdmX9ONrEg/pWtlenAso2qcN3V8jHk9v+YnkUre8hfBxr+emmw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3661.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(31686004)(8936002)(186003)(2616005)(36756003)(26005)(6506007)(6512007)(53546011)(38100700002)(316002)(54906003)(558084003)(110136005)(66946007)(66476007)(2906002)(31696002)(8676002)(4326008)(41300700001)(66556008)(6636002)(6486002)(5660300002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SS81S0R6dzJmWHVNYnVnU3N3YUp1SU5jMXZjdlBWSWlTeXhCMTRSMXRKeStH?=
 =?utf-8?B?L3V5cnh5M2xBKzl6dnllb0lBRHYyTDNSTEdxL2RvY1VVZmR0aGdrek9sWnhz?=
 =?utf-8?B?cjYrSlVLRjNGMXJrUzZEWGxEbk90Q3FuTEs3MnN0dXBoRnpTRTVHSTNDNmlw?=
 =?utf-8?B?YjVkQmxSVm15WDFDaFA2TjhVN3E0alJCL2xLZmZ2TEVibEVYVkVHYW9PcEN3?=
 =?utf-8?B?WTFGRS9hNVV2cTk4UElOYlhrSS9ZMFZqNFB0K2p1ZlJnN1ZldkpuMUxOSkc0?=
 =?utf-8?B?UEJ0UVpGaVB2dEVDNzB4NFA1ZitUN2hPS095MjVLU3lNZ0FHNHp5RkkwRjJz?=
 =?utf-8?B?YnZGRy9uZ2cxTCtYcHhiaHRlekNxY05mTjhsS1RhYjVKOXlnam95dGw0eHBo?=
 =?utf-8?B?WEpxbVZGclNEOUhEQzd1VFc5d2pLaFVaUFBVeE5ZdFp4VkFMemI5U3JidVV4?=
 =?utf-8?B?Wk1KUkM3amxtbm1FVFlseW4yeGFjVzJXLzZxdmVseS9EVEl5bVdRZFQvMExl?=
 =?utf-8?B?c0txbzNUME1jeVViVmV4YkFuQmVCS25kdDhxY0tSUDJkazJNZWdUcG8zVi9B?=
 =?utf-8?B?dS9wVlJWd3hrbVlBdG5RR0NPOStkVjIrSi9XcmM2Z1M5QVdVWUFFeldMUUZq?=
 =?utf-8?B?VFVDeGMzQjNTRVNaMWNRTmtITEFza2ZqcENvSzBPcGhRMHFWbCs5ZnUxaDFs?=
 =?utf-8?B?a3pRNW9NR1hWS2FXMGFCVGRicjhoVi9WR0JibDgyc3ZtajNScnFKa0Z6c1Fx?=
 =?utf-8?B?UUorOERDYnA4S0JyZkdnbkZSY29VTEZqcEcrQllZWTVqTUxCNG0yLzNLdkRo?=
 =?utf-8?B?S0ludE1oVkFqdUdTNEc4eHE0bmpUbFZuRjhjbE9hWnFrUm1uSHhERVY4cmVM?=
 =?utf-8?B?VFNvUzFZZVEzTUk3TFFPQkdOVThEUzRUWFg1Y0hVZU1WYVl6UFh6ZFBXQ3Nl?=
 =?utf-8?B?cmI1Z3lVUllGaWh5eEtndTBXTitzSlFxd0dzNkVvKzlNWjhnbmh1Nm5tbnRE?=
 =?utf-8?B?WVVqR3ZDZUpsMldkQXFwemEvNmE3VUhNOWRDUW9FWWhtZVErUVkzSlp4emJI?=
 =?utf-8?B?L0VVdHJ4TS9ITFRlYk5EendUd2plaVZXMHlXQ1VZcXpKQ08wMWVpRW1kamR1?=
 =?utf-8?B?ZGI5RUxvSHd3Y081MmRSa2ZlT09kZ2t1NzNsSi9LWWFENXhNM2xOV3d4VjVx?=
 =?utf-8?B?cWl0Rll1QWFFaTg5RDB5T25ZTWtOSXJqRGllRGZEQTBvcTNXMUZWWlBXcE56?=
 =?utf-8?B?Mm92d2tPRElPY0s5bEVRWk9EeGdxa0dGSzJGL1VWL3Baa0pZZVBWYzlZZFVW?=
 =?utf-8?B?NnlmQUJXaDJhQjN0RXF6UjNmcjQ5SjZWMDh4UmJrU2h2djVyS0d4b25DcVB6?=
 =?utf-8?B?OXJER283V2VCbGNONmYzMGUrWll3YUpBOTAwZUhtT09hbDl0OW1kRE1iVkxl?=
 =?utf-8?B?UnpEL1RTWE1SMzlmRXhkUE1aTXJFWFVkUW9LNzFYa2Q4eWExdUVObFFQdTZN?=
 =?utf-8?B?NGExa1RjVDhHYmpzVXFrK0g4OUJiSm1DTUduVDN2emdKMnpZcmZReGRsRDdH?=
 =?utf-8?B?VkVwOHhwSm5wblYxMkxkOEh0RmZGOXZlUVM3cnh1ZTM3TVFGeUZYUDNPMHRE?=
 =?utf-8?B?SXB5NjF3azlUaHR6Y2sydkRvQWc2SXpEenA4ZDY0SVQxVkJrZmZTTE1mbElh?=
 =?utf-8?B?ZEk1OFVTcHRaWmhDOHA3bTV0NFFLNHZFeTViRW02YUh6cTlRTWlOMnl4RUxM?=
 =?utf-8?B?cVRONGowTkwrOXpPRFpPS1FxdVdDV2Iva0h1Q2FrSllCS2ZnNU50YmhlVHVp?=
 =?utf-8?B?QUtrUU5UdWxOeFBnRGFlU3lEcUFIYUpCSXlMM1RORFZVUjRBSS8rUEQ0WUVM?=
 =?utf-8?B?Nks5ejc5b1ZJeHFHaDVyS2xXVks4cGh3Yi95QkdKZUpUU1cvd216MTVRN21z?=
 =?utf-8?B?NVZDS0tNZXhqY0ZPU1dQU0gzeERhNmFXcUI0TFg3TU9QYUZEbytqWVBFMzU3?=
 =?utf-8?B?Y21PS05ZYzB4SFJLT3JKT3pjR3ZZc0FtRW9iZnBDS0dFdXVNcElaekNYZ05n?=
 =?utf-8?B?ZHRhOXFzQnhsZHAzKzdnOXhIWGJkWU80UHRRTjB5WVd4c2FxOE9Fa0NmUlJ4?=
 =?utf-8?Q?VPJrhO+qjdQ5PTrcHiWbIqMGZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab5659f-e9ec-4038-cfdd-08da7f4b0c7d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3661.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 05:49:14.0817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HlK1rqY8Cyz46O16PowLHelIi2pKomW9c20MjIzIuWFi0dxSmyXUWarNetxxy8XrZxsGOnalAIIMy2EzW1kh0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4055
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 mario.limonciello@amd.com, Vijendar.Mukunda@amd.com
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

Will fix it  and Will resend the patch series.

On 8/12/22 18:03, Mark Brown wrote:
> [CAUTION: External Email]
