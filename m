Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70960432F84
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 09:31:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08D5816AE;
	Tue, 19 Oct 2021 09:30:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08D5816AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634628662;
	bh=UsejUTuFM3ERirQ6+0SviZj9j6IV3UcQDbEtiTpkJtA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aM+oWjGt2U/96KFQmUNgkH9ULTNRzVo0O8uw6qIMUSKdsZ52JpsEMLgWtg0tGX7o2
	 VN6R23T7EfGksbQAMrlDsTlZGsVfPeRXLOkf/Ou76XfGiGW7AHWomIt0HGd8q5Tmxq
	 dUVgKlwbMVblRUDHtzWkN1hiqGUx/c9yiuPIQK+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BCCBF8026C;
	Tue, 19 Oct 2021 09:29:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1D52F80256; Tue, 19 Oct 2021 09:29:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::60b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA580F80082
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 09:28:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA580F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="5m3q/UK9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTJsK6ArFwLnMOuU0zdIIdMdLYQ2sHfJFAEl8tHHPYFkbznBsQaUKF+0ZnUnwHtvSISgQNjB75PBBlT9rjhmDQ+v7IGc7m66sdxA7X/2lQGpCrvsQz/q5PtOenOhex9aytU4YiBFsCH9Db0+Ox/rZIXY2BmZEYSK4CrbMJkMdk5fIKWViQrkRH9FKOlEuwaiNhDeGTRy3DIvG/TDgH1eO72NL/SzMLQcW+i4rxKwHMdlmet7mTZGTRm/wc2V8hJ+frXtVM4GY2s1+UiE2AiNypCVgTA3KwkfyJGY4HLz0S9nM+JqQE3HP5QQgLn08vJWRGyOHFQ8b+tGAv11BfGKIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=juuZPpg7t4/jyMl25+2/x826/R6Aog3wHiabLCDP7H8=;
 b=OpIi/Ko3FI4DBVyhtuEZ8sHdljVGSOhPmfgg5o5s1JJfGlx/2oftttUUjJG3MTItD/peVx9Rhg60+RihqyzmOJ4ER50JqRzgUCGeSIKvO2eqWhhP6EZZY68zw5baFmN9pHbkyqXApf9Iqzm6DQTNHMC1l4VInSTaYZ3DFAKklEyHG9swPo6sWJnBYfcRz6T6borj3Rv85BLiY4GdeO8wULQkp41p53oimEGcNYKG9fhTS9k3xxNi8ZO4i8q481ueOaA6DcLa5GOnoG0hvDyUYWs/eYKfRJF2DWDPL++tOQmZFV5LxuJWNyLnV2W2c0d8ize2P8KO/sp61GOH2kNhVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=juuZPpg7t4/jyMl25+2/x826/R6Aog3wHiabLCDP7H8=;
 b=5m3q/UK9piZglgtD3cwztfyZmb7E16FgbxNunlsXSwc9bmEl4hWgzeNbi72WBAL2YSohKUJpY8vkImk/93Sx8yGCaloeJ8N3m4iBeuYyWHx/fAcuRON0J2aF1fRH5dPiEm/VCiet+ptYmlkFHfXGXmCG4PmjT0DtDNrG4mY93i8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3627.namprd12.prod.outlook.com (2603:10b6:5:3e::18) by
 DM6PR12MB2732.namprd12.prod.outlook.com (2603:10b6:5:4a::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18; Tue, 19 Oct 2021 07:28:49 +0000
Received: from DM6PR12MB3627.namprd12.prod.outlook.com
 ([fe80::549b:1773:f036:9ee2]) by DM6PR12MB3627.namprd12.prod.outlook.com
 ([fe80::549b:1773:f036:9ee2%4]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 07:28:49 +0000
Message-ID: <02868f8d-fee4-bfe3-04c4-5d0517bd6c74@amd.com>
Date: Tue, 19 Oct 2021 12:58:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 1/8] ASoC: amd: Add common framework to support I2S on
 ACP SOC
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20211012071939.97002-1-AjitKumar.Pandey@amd.com>
 <20211012071939.97002-2-AjitKumar.Pandey@amd.com>
 <YW3VUMT9Rjs2+A1G@sirena.org.uk>
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
In-Reply-To: <YW3VUMT9Rjs2+A1G@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::33) To DM6PR12MB3627.namprd12.prod.outlook.com
 (2603:10b6:5:3e::18)
MIME-Version: 1.0
Received: from [172.31.154.86] (165.204.158.249) by
 PN2PR01CA0028.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:25::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 07:28:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6eb7eae6-c75b-4285-fe11-08d992d217ff
X-MS-TrafficTypeDiagnostic: DM6PR12MB2732:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB27321638A919062A8EB3236382BD9@DM6PR12MB2732.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oQQJSZDSK9DPyxgOrNw79407Z/QQR/FSSipwWNlqXuc8UU7RGWkrVYSsRC/GjjdbXTvXh1PY6gtSQUMd2ap6knFL1ZM5v9YxoP7XVz9vhkMT/vxD0ibS/TtzC6EJLs1VV6mfu0Q1HdjiKqlzeORJzhhrzfSgCV2ZnXQC1LuNtrmlP6qgIpAxdWUv6DZjox+ee2FyeGeDUI8fpNnGfks1E8nzxHESOC1OqHEEr6gi41r6ep6VLZEUdx3RSKIDqQKxORR35HqXdfzIps3oLjkgml3dvDmBSfCuMl8U/xBDOTgUFMZ1L1yvHaa15paJJpKfcPz5o9ygQQ2+EcrqO+UwtZfcg3u6SOjj95uahZaRSRvYZqC0NlNsijcu9R3nWEhdJVz8xu3xfMiY7DgG6wtoz9TPALZqu4yYSMIW6pOdQ/kMCSrqlXTjDZIdAapphH2qetH+l0dWojR52L6Jw0YtN7HObJJkfBiLQGMI3SFwWRgWWqxm0ufD/MpwPt1XqscHy22E2Roo80YwKLFrMFyn2BUQ0tY4ZAD9DB73wjPnVHfDUul1IC5FCoAhfeVb4vYG4TkoSEwmn59UFdFYNlRfEfE/laPVmnr3c0Zq0OsyDhYhwJFwb1KjCUw2pkzY6MpifDuavmKT9HlZib+YSEAY93WdzstX8v2gJ7KtN0emTMd69DGN9slJPjnVxtfOt2bSUz9fAzHMXpyWWAtTGGPdUs1LyQIZULy2/+eHMWoavj1mBcDr2yXRNXaFL9xCQ3J3B+1IHNMtcZigzXFW3N76LTd0dbl4MEpZMbKrWRdINOogrW0d/ad9AuFoX1tiMIPk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3627.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(31696002)(53546011)(31686004)(66476007)(966005)(66946007)(66556008)(8676002)(6486002)(508600001)(26005)(956004)(558084003)(186003)(2616005)(4326008)(2906002)(8936002)(16576012)(54906003)(316002)(6666004)(38100700002)(6916009)(5660300002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bCtRSFk2eU8wcnM4TjBYeWJMSnlKM3NLY2t2cG0zOGJjTGExSWZSSVJma1Fm?=
 =?utf-8?B?RGljc2M4UVhxVFU1TE1vb2VkYm9Ib09IQ2RENDVpNG05UERBeUtxL1Q0OWhi?=
 =?utf-8?B?dnFSRGdzSkJISUEveGpNM2dINFE4N2pHZCtJR0J1N2tZUStFL01DRW9ycjZ2?=
 =?utf-8?B?dGlGRzd4NEhRWjdiOFF0QkRiOHI0NmJ3V0hBbVc3d0dBTjF1QXFQZXp3aVNO?=
 =?utf-8?B?VUV4ODdrcXdHekY1aG1sQ3hqbHJXd083RDV3RGkzZ3hZMG5FN0V2S0Y4L0d6?=
 =?utf-8?B?Zk9LUkd6aTJtTVZVUlZsU2JxLzN1TjhNblc5Vmd2Y3lING9GMHdNZldpRXdO?=
 =?utf-8?B?aXVGd1VnU3pOamg1TnJmaHBmOXBzcVNld0xCV0ZVZ2Q3MnluSEh2aU1FVmJn?=
 =?utf-8?B?Qm0zVmVEMjR4UWpRTjg4NWh1eDRyU0dPcWI3ZXA3SEVzNmo1bXJMNXlkSVR1?=
 =?utf-8?B?QTFDVkUrYjIwK09jRzB5d1g3YTFmVGVTTGdHNElJankrdUVuQmZpL2dQV01O?=
 =?utf-8?B?dHlySWI3MEM0eFJVd3ZIcUcyczFvT3FPeXJ3TnBpQ1JWRngwUzZYUXhFMGlH?=
 =?utf-8?B?RzdLSHhIUVNTMHpGSFFxQVdwSVJBK3dNOGwwcXkyZUtrdFlOdzRJaHVVRVJP?=
 =?utf-8?B?dlJmb3BtdndmWXpuRm1kalZJUWpCays5SCtqNkx1VXhuNnhKcXl2K3VRT01F?=
 =?utf-8?B?eEhldUVrS25zaEFVTXhTeVZpSU5WaE5YSDRiWk9kQkZFQ25YWE5mQjF5M0tj?=
 =?utf-8?B?N3FlMmlWdGFOeFNyWXZVWk5CL0IvdTVkeDZoUWlRRDgwSmJuUGpoazAwM2xn?=
 =?utf-8?B?cUtPNjRCajkwSGY4ZFp1MFp1eDJrUUtoTERsSGFMZm1teStEUk9oNmljVTRk?=
 =?utf-8?B?bVBpUUwvaUZ1WnMvUWNsQ0lnNmNteDdMalZQalRROE40SHFXUytTVkdlVTl5?=
 =?utf-8?B?b211QVRyYUFpUWcvVDVSVUVIVTJCU3c0Zk9PbWxraTRTdzFZTGhKRzJ5MFZm?=
 =?utf-8?B?VHdld21sR1prZmZ3R3dwZTNEMXhrRmE2QzRkSXdob3kyU1poYXp5Mk5IOGxY?=
 =?utf-8?B?b2lUNzlYUm05VnIxME9GK2tkdXNPajZRdGlycUwvcWFUNGVEUEVLUmNFQmp4?=
 =?utf-8?B?cEx3MnNzNU5ZNG5FZktBdXBrdGpDNGJqbWQvTDlmQWpKY1hocUxCd01WUWRr?=
 =?utf-8?B?VlVLSU5Zcm9KK21iVmUwUFZ1QytKcE45MklXL3REM0tSWno5ZUF3dW5TekVE?=
 =?utf-8?B?L0UvSXh1UGI4ZVlGejBaUURoeEZRQmNTMW1BNEFncTRQR2pzNkVCQUNxS0RC?=
 =?utf-8?B?bTg0WVlveW44dnp0N3VxejRFeHNUYVBUazg4WGNkNjVxaW96aXJlK2FFSEIv?=
 =?utf-8?B?aDg3VGNZOGZuT0t3bXgrTVVjWVZSQWMxZ1M2VDBSdjJNNXlQNURwVmJFbUk5?=
 =?utf-8?B?b1ZUSmVRSVlUQTBYT1U2WHVKYzUvcVAzanNjTG5PVWxPTmR1ZXJ0Ry9GQWEv?=
 =?utf-8?B?cTRRM1FpUG5BRzNsbjNrdnJ0MU54ZHRHdVRyWVBTNkNjeEEraXA2aVRmaTVq?=
 =?utf-8?B?cDhpNEhLQnYvdDloSWZMeHBGdnZ0NFdMQzhsaFJJL25ObUVBeWZ2VXZlaS85?=
 =?utf-8?B?Z0R0SjBsR0w5NllmRGRQTDNuY2tSRmpQU0tzNVI2TkloVUdsOHNzdHJqbEZh?=
 =?utf-8?B?em9LdEticHluVnczR1Q4OXhpR0p2UDdPUHFGQjI3bnZ4TnIrYUhPOWhDc2F6?=
 =?utf-8?Q?B2y3ltmCD1PloqB12aMTV50mV2R2hn0N3NA8F7h?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb7eae6-c75b-4285-fe11-08d992d217ff
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3627.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 07:28:49.7093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qv02dTAMx1eJwT5dwf/33UKd6z3/M/eXHims9Ia0jXjuhlaOHv4Eui5exMS5yT5bCUv2kY3sUBgZKuqQisWo2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2732
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar.Mukunda@amd.com, Alexander.Deucher@amd.com
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

I've rebased on top of current code and submitted new patch chain after 
resolving conflicts. Please try applying now

https://patchwork.kernel.org/project/alsa-devel/list/?series=566025.

Thanks & Regards
Ajit

On 10/19/2021 1:43 AM, Mark Brown wrote:
> [CAUTION: External Email]
> 
