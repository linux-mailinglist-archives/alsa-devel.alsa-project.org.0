Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F973BC343
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jul 2021 21:55:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51BF516F1;
	Mon,  5 Jul 2021 21:54:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51BF516F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625514902;
	bh=mKCpG6+/E16uSFMIk0GGgk9oYtnqzGEJUgSHj6Hzvc4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KuAGJgl94crbD86iOIwF+eTuCBj5kZDUi10q9v6sPfNvIk8exTrRY6whLEMKpVOcc
	 soplQghjif4wykMWVobFwJgCfuhIkBsqSdqIqqVOPyDPPAQrHt94omLiABaYXRhcoE
	 pBRA+a+aRKQtZnixKGuGpVv29iplJGk8Q6G4AMGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2217F8025C;
	Mon,  5 Jul 2021 21:53:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27891F80224; Mon,  5 Jul 2021 21:53:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,PRX_BODY_76,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A628CF8014E
 for <alsa-devel@alsa-project.org>; Mon,  5 Jul 2021 21:53:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A628CF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="XfAEvdBs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtZS5AEMfKgAIYzgWlRWpRa5lEQFh3hl+NPMuUefF/hQ0ga4tZUVHE7lNdrt5IckaCJZSGeAsdWHA9UW8MbX/meYxbWZgDE9QyX3fa4QOBxNRSBF8NFO8jruLMOLK1oFNB7uWlxLNk4J67eJYlA6uqxVuBtYNBPUttqhPi5d5gnkiAqCtZaDRk52Nfarp+t3ebKC+t3aoOwA0YJirPvwN6phasSkq8yQLgd6FFk10Xuh343W4z70XK79wjJLQMGmnJBTf/KYXwck/NLbDuJltelnSF/gJ0Lkl/OmqLX0vlXh9DAbhpdX5xUzy9TJusngzVHSZS1o8agfkjqQLZNsgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKduQjJcdUdFpE7I9fTBsmmZbT+xvuRyEbxbulpGycI=;
 b=LYMdi4KfxHYHbX3i6iRPxPYZWM3YqkOrL0QD/zb7JqgiVLYBwmua66um0N1bSg//CEi9Udc7dGCJWBL42wAlTj2R1vUzwnTlLPqUE6f3PC4PeXhPe54/9RWWpj1b3M7LhbiLu0Nyk1BcTowB1j3rkYYXIskrwBF9lDYAlrZdptCfHiOhw2uZkAQBHNn4hCMDFN01Kn7U/+ATF60iQoyVFqv2CjeJ0lfeTr0GIf1IOH+SQPU3UE21T9mmnCu2/dVfP7p3KbLc08nxYASw2Yzi+19gR4P23mzgFkcG1Sqn6QzmpmYtOluHpBldP5U932GotNFA3PfpFnkbpe+OdWL2JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKduQjJcdUdFpE7I9fTBsmmZbT+xvuRyEbxbulpGycI=;
 b=XfAEvdBsCjZ+AoQ0+qKeS0hVnF7B4m6dMljzfKZtpdrbQ/WzpmguBw62m/RI9ipwDv/j03AOEt6PUKtBgsuqAYddhmxoHzwNLvc82v6i4BUveyPZYLwQR++/Ly2b0VEY86su8OzebrEiXzetSnzDDCj31iav5Qc3pqBGoVYos2Y=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MWHPR12MB1471.namprd12.prod.outlook.com
 (2603:10b6:301:e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.32; Mon, 5 Jul
 2021 19:53:23 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439%11]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 19:53:23 +0000
Subject: Re: [PATCH] ASoC: add dai_reoder flag to reverse the stop sequence
To: Mark Brown <broonie@kernel.org>
References: <20210705155830.24693-1-vijendar.mukunda@amd.com>
 <20210705174241.GF4574@sirena.org.uk>
 <7f1ad1b3-b509-24cf-00d8-f82766aae0d6@amd.com>
 <20210705192952.GI4574@sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <48b0a8e6-ca29-3f77-2689-ad7515f8743b@amd.com>
Date: Tue, 6 Jul 2021 01:40:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210705192952.GI4574@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: SGXP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::21)
 To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.93.39] (165.204.159.242) by
 SGXP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 19:53:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79144543-2b14-4914-e43c-08d93fee8bd7
X-MS-TrafficTypeDiagnostic: MWHPR12MB1471:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB14719C61D5C61AF7F14EE14C971C9@MWHPR12MB1471.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z+6N6NffwmYj/DMdl6WCDehi8UQN0ESySDrd7Ob/oqcUjGI7YVLvwCTmLBRNfNkcXCufIpAxQbO4L1lQlIJQbgrSP1xOb8F7ZkGyOFfeZ/ih6XU1IhEU0wBe7xjXTOumqn45depHbm5CtbIiO26x04WpmZpFqNEzzc/oOIAntxO/07A0Fof34pWsmZTLZIaQQo1SY6JNBmDEbB/nRLSs7LPPLLl4Yn+NlTFanyPyrEsLKIl215SGQ/yr4Zs2S4Dv0NXMKd6tkNhsgNB5J6H/laEXOiW6N/XWVwy2b2A6O++WqVNqFKEPQJckznRXXP4034C1ONvDJKCVHx4MinDNXAu1xYo2jF1oLx4/szfoeioNsdcX811RoyIuMpbmmluAzZI00L/XR3Guhkfzm+NhRPtN0Gx+3jneOMYkmQu0HO6F3Ut/CN8kLaGo0wZVyFx1kjFEvTtk4vlDVDMJn8kRvZdbtfNOoYYJSK+KFUqzHuDPZ3PehkKbbdVqpDeMz8BEEav/78fm0SGLTCo64H6zRqRYfc0j3ucGpwaaA3pJ7k+1BfZSHbnNdriplaRDbMnHCHFHtxn8wd1vYEe6GFy1iyrGgalzg3i4xx1bPPWldI1CeuUJZ4isG/JUr0NHC2NpgTuPRWhmylbRe+3GsspM3KzFnXHDAtwvhJ6OdEJT7dAXu+Q6dF3TzPufICJLPiZHptlVGCEgXtYasKt5tzfNgHbwBUj9a4CbktEyi4vNiY8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(16576012)(66556008)(31696002)(54906003)(316002)(2906002)(66476007)(66946007)(478600001)(6486002)(53546011)(83380400001)(7416002)(4326008)(16526019)(956004)(6666004)(8676002)(186003)(26005)(6916009)(38100700002)(5660300002)(86362001)(36756003)(2616005)(31686004)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?f5TPbkmTBJ9AQL+CAxDMJSyHpaBjxVr12GlgoGo7+7P/cYGuoNfsHagq?=
 =?Windows-1252?Q?vXNxC8iKC00MOkILLM5DL5PaPtLj8bKh18CybJHsol1FFuR3BKZ4slVw?=
 =?Windows-1252?Q?VGTJgcDnPHFILoiD7K7fJpYXIf99y/81q/V5ZR668yf6eqE831wPnaKO?=
 =?Windows-1252?Q?wsGTTQPNp1n2gK/UB9ekxU8eojpZgUAGDfi3WwrtQ9A0hv2xiI3TV3xd?=
 =?Windows-1252?Q?elYsuPZZECT7FpBlTwJKU695L8PhkWdVrsAsHhWzUO2mQ/Xz7Y2DBPhn?=
 =?Windows-1252?Q?skmIWbyQS0PpIZ6RYIQYhMlssrHW3yv+2dsDIRIaFLdbc8h2WOs+/hqo?=
 =?Windows-1252?Q?eJ0DA7ydRFMupEFxEqch6vpFKYaR3GPHcs5Ni49QGtj8OZLXZouUQk9Z?=
 =?Windows-1252?Q?psBqdLrLvdJKhyomB+FQs7wAaajRJ4kGJXYvMq6Xdwl0jELnizJhQmhE?=
 =?Windows-1252?Q?XMA2vvKQsGZ+lRTAK11s/X3hCMCJyXoGkU2mjta5C9817izQPPqCINiS?=
 =?Windows-1252?Q?Bq31pkY/jYBGjxHM56CTm//cWN4XK6DYA3FmA3qQCVm4ymlZK60D6clH?=
 =?Windows-1252?Q?mdUgTLRnGHtq93+SJKIverwLZjNEywEO8siyNwl/og+RzNAveSCWeUCY?=
 =?Windows-1252?Q?UCgJgqMtIpQd7a9ePK+kaKf+ePTDLhTCXb9JG9sdDwdrPoVD4OhcpVYh?=
 =?Windows-1252?Q?2NwSurUO56oDtBnP5cFWVVKy6w/cwLvM+3V+UtVIXcvBYPU3E09Adb4y?=
 =?Windows-1252?Q?MZHMbqznDD8yACq1X0urivTNAf4Ss7jbv1XLvoXJuNGY+61+oL/CWlET?=
 =?Windows-1252?Q?2nTpd1KucTPbRb0Mk1eQMmiCx1N8y5Gpt9ANTGsDFYdFSCyG+Z4DULik?=
 =?Windows-1252?Q?knLTpFaS3diUdPWCYugFzaLr8j9YDD3ysq3mQ5zGV0ebrQOpSbqrwrcG?=
 =?Windows-1252?Q?++cDl4EX3dXWCZmg0e+DBxxVfWZFsfn9ayTPMtniOg5I5+4Hv/LtonML?=
 =?Windows-1252?Q?dX08dDHj9648fPJlLzeq4k9WFrCklm9gHVDZ/vglitjg7m9/zCIh812V?=
 =?Windows-1252?Q?zyNExGQSmDR9DCYK52WpFaXK3mKlPVyg56W/+zBLedbQFUINve8lRwxI?=
 =?Windows-1252?Q?7zrqJ+d3rhtECx0KjeNthOTPVcZTk/j1+D/pu8YcbTzUx3wxCMm/TpjK?=
 =?Windows-1252?Q?H04dBvfCjSAi4Ua93rzQs4rm4YwEEUtbwjSyr9TpVEk5nEOmpHNChS81?=
 =?Windows-1252?Q?cLVeesyFGXQYXTT8VnCIX1numzokICgNqJNvz1KVeFTTymmjX3Y3m+YT?=
 =?Windows-1252?Q?ANo3IACNCiDd3+c/Aub1PjZgt503Dz8vXdK0sYeNoyH9u24uMUeesgpY?=
 =?Windows-1252?Q?kDyGVPa0V8K8jZOU1/zwhwZiiX8LiohQZ2tiHGHOqKRdWSw2V26nPQSX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79144543-2b14-4914-e43c-08d93fee8bd7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 19:53:23.3897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EozLjmMmDXXWiMe/zcGLLDiMS3m3WM0HnoR+bhoVwXmDybGQ6XTytcCGOjE9YNOke/qFtkI2CosJXvOCXDZ1JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1471
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com, amistry@google.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Chuhong Yuan <hslester96@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, peter.ujfalusi@ti.com,
 Alexander.Deucher@amd.com, nartemiev@google.com
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

On 7/6/21 12:59 AM, Mark Brown wrote:
> On Tue, Jul 06, 2021 at 12:30:10AM +0530, Mukunda,Vijendar wrote:
> 
>> As per our understanding by going with card wide option is easier rather
>> than checking dai link name for re-ordering the stop sequence for
>> specific platforms.
>> We will rename the flag as "stop_dma_fist" and will post the new version.
> 
> Why would we need to check the name for the link?  Presumably all
> affected AMD cards would just unconditionally set the flag, and other
> systems could do what they like?
> 

This issue is only observed with older ACP2.x AMD platforms.
To make AMD specific platform change(which uses ACP 2.x IP), As per our
understanding we should only update the flag in ACP DMA driver by adding
flag in snd_pcm_substream structure rather than adding flag in card
structure.
Please suggest us, if there is any better place holder to add
"stop_dma_first" flag.

Due to some problem with mail client, i have received mail response
late. I have posted v2 version already.

Based on your suggestion, We will make the changes and post the new version.

