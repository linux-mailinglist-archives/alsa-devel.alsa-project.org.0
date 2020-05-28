Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F25D91E55C7
	for <lists+alsa-devel@lfdr.de>; Thu, 28 May 2020 07:15:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49CB81805;
	Thu, 28 May 2020 07:14:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49CB81805
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590642934;
	bh=nZVJkFW5Ml6Hhb1K1hm5yvqy31XPWcgVN/Cb+0m4HQg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u21DhdJSTujutX/t7y8FnFPlYyjW+l2O1afVof6XwrUzCifEOsD76FMILGUMk8obz
	 EUJUidzgOYyl7KLGsNcVIAy5RWN8ba7NXO4gSwUZ1AQ6IXgISw8RD1OevqCVX3egLG
	 fnEpn2JnShWhg1vlp/ZuP6tUYSlLuxK2e0Jn/Ahc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6929CF8015C;
	Thu, 28 May 2020 07:13:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACF7CF80150; Thu, 28 May 2020 07:13:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750079.outbound.protection.outlook.com [40.107.75.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00653F800FF
 for <alsa-devel@alsa-project.org>; Thu, 28 May 2020 07:13:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00653F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="Uy8iAaoU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ra0aqFewEH2yloT3xbq6tzuwtEgqIV38D+FBJVg2zgpIs99BriSaygjTonQU0JbmTCpzoBwudT2frhwMFrlmWvdWzFiCKUZLLWCZMEsAzw+d/SJc0u0/rBJKJGLylGdrXOkrTe89/ELUi3ihRPtnEEi67sz9rtNeNmQepFCoJSUzGTEKXQcGbREoB/UdB4/aPu+vgkK33WtdEmOz9SmY31/ehNdBq/jbwFNSA8RWYm+M2xVY5Kr8WxrPPkjQ5Cg+JgcoiegvYZSXDspjNKd6fTq3ljG7fcjquFGvKk+byHJWAv/dpAMMP5L3WGu1Am7QPzVQF6G6LsGMP56+LT2nlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyZyvLGxmUexrAGRZG+pWuMycvgxrij/r9Y946voejw=;
 b=TT/2jPGzcMcfyMnJDe+nLNmKOGrCCOjxdaK5OefQx3pJlsUYYIYWcBJX3Vp8KIBUl0VNSzUnhT56ynGza0ZjO84pnenW4GvldRcPYck/nApf9PISmk2RhkKMSXZMakIQ3Cc3hInTBm2b9ODaEsDtZRDuYSScUbwj0eT4D9V4/aCtwjSQcJzRU8r8UvoR6dTbMjQOjW79uO+rooBSPZgbXF3dz1hEm7Kk/gU7SQkwcYK7F2cvhaMcnB2aSdFi9LU1TDN0Oy2VZMIaR+g3ocdcZmaavh1DricJzJFHifBA/eMTfMFUHnbkicfjcx6VYsSfuqNG0jdUqrOtv/IjwO4ucg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyZyvLGxmUexrAGRZG+pWuMycvgxrij/r9Y946voejw=;
 b=Uy8iAaoUD0PT1g7j+U9HrC+95A2wtYe0QEp7ITjuLOvjyaRFUtnFAIJhtx9WNoet+pF00VuI7oeylk2Bl2gdUQCsg5VvrryKjaO6biWPCVGrBFYXQ25NQdDeAk4gqRTzaMomCvis9HbGYDoDsMmWZKVHdXi2xzegrt9B0huT0fo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1855.namprd12.prod.outlook.com (2603:10b6:300:10e::23)
 by MWHPR12MB1838.namprd12.prod.outlook.com (2603:10b6:300:106::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Thu, 28 May
 2020 05:13:38 +0000
Received: from MWHPR12MB1855.namprd12.prod.outlook.com
 ([fe80::25ab:aac8:ecf3:59a0]) by MWHPR12MB1855.namprd12.prod.outlook.com
 ([fe80::25ab:aac8:ecf3:59a0%5]) with mapi id 15.20.3045.018; Thu, 28 May 2020
 05:13:38 +0000
Subject: Re: [PATCH] ASoC: AMD: Use mixer control to switch between DMICs
To: Mark Brown <broonie@kernel.org>, Akshu Agrawal <akshu.agrawal@amd.com>
References: <20200527014023.2781-1-akshu.agrawal@amd.com>
 <20200527112758.GE5308@sirena.org.uk>
From: "Agrawal, Akshu" <aagrawal2@amd.com>
Message-ID: <f0087d94-c81d-3dc0-9b6d-473795a89918@amd.com>
Date: Thu, 28 May 2020 10:43:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200527112758.GE5308@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MAXPR0101CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::18) To MWHPR12MB1855.namprd12.prod.outlook.com
 (2603:10b6:300:10e::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.107] (122.171.58.15) by
 MAXPR0101CA0032.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Thu, 28 May 2020 05:13:35 +0000
X-Originating-IP: [122.171.58.15]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 029d2749-bc0b-4013-5291-08d802c5e0d7
X-MS-TrafficTypeDiagnostic: MWHPR12MB1838:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB18381FF98A36C515A297B39EF88E0@MWHPR12MB1838.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-Forefront-PRVS: 0417A3FFD2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a7et0J+8cDeLjk+XOpcmK1TyljnkmfoT+/NoWWnKp/dJImX+0q8xAUjsHMpKzGoXeLvDk25HR1z4cXmW2zV+RR3FA0kzppGynPAxm8zk5LdnJ15s/r/MloEl/vg88cWCdHpYxvvTVARrcxtHzoGolPRXynAOlVIUFn4HaWoqi9q4pPSnD9zlVjRnC41qjhMM+kZKX4TM/xIE1krzwm6rFcLcqH1pf1Pb1WPrmmXm6xU/u5omHIJHXYba/wm/eVg+lO/r8HNiuoiQVK/NWHbgcZRa65chKbznG6xE2xLKeSc++qXy120XzXJmyOFobSbcFKCEgp20CGP3KFMHpqJElaGU+krUSidIwEUR2GYSYGgPlx3ZKn8fZyPIYsN2qvV/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1855.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(4744005)(2616005)(66556008)(2906002)(956004)(31696002)(53546011)(4326008)(8936002)(66476007)(54906003)(478600001)(110136005)(6636002)(31686004)(16526019)(16576012)(186003)(36756003)(26005)(5660300002)(8676002)(6666004)(316002)(52116002)(66946007)(6486002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: GkFMvTLT7VbgjDG+/mByRCvCreSusPytJZyuyJwVfMP4aFL3UBDlmCJVEOQJSGQJkGqJWmhOn+riRhGGoOjjVO0eA3zYwF0wZ87PCS82Bl5cYfpSPo1282KtpvlfIJiozbncEUICYWw3X4vO8a4hft32Re7LEZoOCo0IDST4yOa+ZgDj0EHvylSDD5/iDC+zsZmMd0Ivfvk6yTcRd6uzHwuB7mY/uMep66Jj2YOMiQIPjygt9o3lqlxmhnqSn4xYh7gMVQ3osurNO2u3qISJM2R+//X46HljH2ml//OHYd27wAnzdzGSAlHevUyJMYaWfdgcmhOicu5dJhsEiyh5eP9JpfZ5SRTe7R624uZpTIIPx1yJQTUc7OA4pzI13che6K/bmOtZsQoPseDyIXnhZhD0srgD3pOgsWfSIB7ny5Yh1PKNOSjZ/lPW4cMVxElEm27P68v4AeB0aZhm80NL6vaBgCQMMMb8KcuHPRy7chk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 029d2749-bc0b-4013-5291-08d802c5e0d7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2020 05:13:38.2463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9BvGvO2wgu9jJSenPHRC8x8hFLt1xswi8DGNGIq+kceuf29Upfv1pFYIcDHm/y6DLLBJf6UiyWtG07N/VTMyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1838
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 yuhsuan@chromium.org
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


On 5/27/2020 4:57 PM, Mark Brown wrote:
> On Wed, May 27, 2020 at 07:10:16AM +0530, Akshu Agrawal wrote:
>
>> +	SOC_SINGLE_BOOL_EXT("Front Mic", 0, front_mic_get, front_mic_set),
> This should probably be a mux with two labelled options, or if it's a
> boolean control it should end in Switch.  A mux definitely seems like a
> better option though.

Actually it's a dmic switch, so will change it to boolean control named 
"DMIC switch". Front or rear mic might change with variants.

Thanks,

Akshu

