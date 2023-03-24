Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 984D06C7CA0
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 11:31:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9D4AEA4;
	Fri, 24 Mar 2023 11:30:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9D4AEA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679653861;
	bh=KOt4sROOwywdA2ovHKDwu1hAgbSfagN5Hf846U6L1ow=;
	h=Date:Subject:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=vCUrRhuwgt5TQR7+XZlfvHna75mYtu+AcElUZQ33Y4+qZkIE8kTq8AZUXToUUFpQt
	 owTLBTvNq1W6lFRHGXcmcNYFFHw93v2zJG4azdcNE42GlLBZ1WkmExyQ7yXslrKBnW
	 7aAFn2otDfldrJo4VO7VX5n7q5sqwTZcp2X7yX1k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDE2DF802E8;
	Fri, 24 Mar 2023 11:30:03 +0100 (CET)
Date: Fri, 24 Mar 2023 10:29:15 +0000
Subject: Re: [PATCH] ASoC: cs35l56: Fix an unsigned comparison which can never
 be negative
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, <broonie@kernel.org>
References: <20230324022303.121485-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230324022303.121485-1-jiapeng.chong@linux.alibaba.com>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IDD45HLLOQUCCOXPOREUSG2CCGKXROSC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167965379262.26.7264259412177120137@mailman-core.alsa-project.org>
From: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98E09F80093; Fri, 24 Mar 2023 11:29:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CBF77F80093
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 11:29:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBF77F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=M3mE0KyM
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32O4jujo024321;
	Fri, 24 Mar 2023 05:29:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=H3Al6fxftb4sYSq8AeR6Z82rHyYTeUIs6TxuWGnCgFc=;
 b=M3mE0KyMQ/lsqGR0YBSbUf8ZbXwxCaYCljMErDy720aMJUtOXprdfYYcPOE4O/i8J/t2
 J6TW8AHVGLJ42a4bcXOha9xIaIcDvgJjC/vEDxuAR3ftHCGW5n/vePpOA2Y8UoB1GiM0
 foIvASGLFpCfK4FP+mlqc6B0k4Is3Ka8fo1glfAgtcBtpqekiUiNIPD3J4P3Shw2jBrV
 3AW4K5A4cD2SsXd8gRkUREtyV/az6FFGrUMKP/yizScwVZel3Ip2e4c0It4UD4KgTZcs
 pHJpRbs2mA2oXUAteTIkf45mKWvnT9Zv9KzffhoNl0Yre9KviStCgx+HoUvbeDmcmQkF IA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3pgy7drtsq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Mar 2023 05:29:17 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Fri, 24 Mar
 2023 05:29:16 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 24 Mar 2023 05:29:16 -0500
Received: from [198.90.251.127] (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1381CB06;
	Fri, 24 Mar 2023 10:29:16 +0000 (UTC)
Message-ID: <ceac5217-2fae-7d56-341f-6527ef3f538e@opensource.cirrus.com>
Date: Fri, 24 Mar 2023 10:29:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ASoC: cs35l56: Fix an unsigned comparison which can never
 be negative
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, <broonie@kernel.org>
References: <20230324022303.121485-1-jiapeng.chong@linux.alibaba.com>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20230324022303.121485-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -kcnwc-THJq-5LmDGdDARbCNF7iboNym
X-Proofpoint-GUID: -kcnwc-THJq-5LmDGdDARbCNF7iboNym
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: IDD45HLLOQUCCOXPOREUSG2CCGKXROSC
X-Message-ID-Hash: IDD45HLLOQUCCOXPOREUSG2CCGKXROSC
X-MailFrom: prvs=8447a757ae=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IDD45HLLOQUCCOXPOREUSG2CCGKXROSC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 24/03/2023 02:23, Jiapeng Chong wrote:
> The variable 'rv' is defined as unsigned type, so the following if
> statement is invalid, we can modify the type of rv to int.
> if (rv < 0) {
> 	dev_err(cs35l56->dev, "irq: failed to get pm_runtime:
> 		%d\n", rv);
> 	goto err_unlock;
> }
> 
> ./sound/soc/codecs/cs35l56.c:333:5-7: WARNING: Unsigned expression compared with zero: rv < 0.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4599
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>   sound/soc/codecs/cs35l56.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
> index 90fc79b5666d..d97b465f0d3c 100644
> --- a/sound/soc/codecs/cs35l56.c
> +++ b/sound/soc/codecs/cs35l56.c
> @@ -321,7 +321,9 @@ irqreturn_t cs35l56_irq(int irq, void *data)
>   	struct cs35l56_private *cs35l56 = data;
>   	unsigned int status1 = 0, status8 = 0, status20 = 0;
>   	unsigned int mask1, mask8, mask20;
> -	unsigned int rv, val;
> +	unsigned int val;
> +	int rv;
> +
>   	irqreturn_t ret = IRQ_NONE;
>   
>   	if (!cs35l56->init_done)

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
