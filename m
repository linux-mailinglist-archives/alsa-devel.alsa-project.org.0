Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BB76A2F46
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Feb 2023 12:18:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BA00F3;
	Sun, 26 Feb 2023 12:17:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BA00F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677410283;
	bh=0e9BeW6PiW45bDNG5T1m/+5YYUW9T9z4QxrZF0qD+ho=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gbOdHUl2qEkazVsra46EF0EMXlt0DO2x8RL0fp9ZHaiJOIONVwdeYNv7tGBpDr7yh
	 MbKwLjKjMdcATdZLSNxvgDXaKC9hSvI5x6BbQZGYmJM9yZmz1h3davrn2eh14mOVhq
	 0DBJd0Ra6ZgmSx1/2PqeN2P1RblZPTOXeF0+JkeQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 878EFF802BE;
	Sun, 26 Feb 2023 12:17:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81700F8049C; Sun, 26 Feb 2023 12:16:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE43BF80236
	for <alsa-devel@alsa-project.org>; Sun, 26 Feb 2023 12:16:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE43BF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=g9xJbvV6
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31QBGjuh012802;
	Sun, 26 Feb 2023 05:16:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=RgMk+o6bjLRn/uUXR1k7fSFgtfqaVQznhifuZa+DBD0=;
 b=g9xJbvV6muErLpDUu607cVrvFvyf6RB8tskQPP3uhV9piO+HHonWm7PPTbAX3zAHME/Y
 uV3P+O4GHT0eoFFUtSBM0uEuyiNFnEfwayT89NiYezLD/xY1DnU5ZmW/zo5VamOwxkpT
 LJIWhiEk7IJzoElTzV/v0PeVvv6vneT9N+gihMc6DgltP9qmlwyfWiG6Mm443v6viEKi
 j/NAd+yukfTfdOWIG/cSQWnIg9rY+4zwJE3CFuc9CcVwoy7uUrjyF3iHoqS8hLmjxzP1
 5EVBFwTc0EbbgNNAQLFgaPd0+x3x19BoYXS8QeEoDccZ77O5Ain8yPUxT8dZYYrOjzxR 5w==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3nyfmt1k6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 26 Feb 2023 05:16:45 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Sun, 26 Feb
 2023 05:16:43 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Sun, 26 Feb 2023 05:16:43 -0600
Received: from [198.61.64.48] (EDIN4L06LR3.ad.cirrus.com [198.61.64.48])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 66C6945;
	Sun, 26 Feb 2023 11:16:43 +0000 (UTC)
Message-ID: <ca8e1fe4-1c1e-ff1f-8c61-6c9228edb5ca@opensource.cirrus.com>
Date: Sun, 26 Feb 2023 11:16:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/3] ALSA: hda: cs35l41: Correct error condition
 handling
Content-Language: en-US
To: Stefan Binding <sbinding@opensource.cirrus.com>,
        Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20230213145008.1215849-1-sbinding@opensource.cirrus.com>
 <20230213145008.1215849-2-sbinding@opensource.cirrus.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20230213145008.1215849-2-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oioqMFNo11PP4f9fTGxCD_zOjzAs-spF
X-Proofpoint-GUID: oioqMFNo11PP4f9fTGxCD_zOjzAs-spF
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: BK7QLXKVJOUNUNM7J4XD2KJDBLXEP7CH
X-Message-ID-Hash: BK7QLXKVJOUNUNM7J4XD2KJDBLXEP7CH
X-MailFrom: prvs=742195d252=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com,
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
 Martin Wolf <info@martinwolf.pub>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BK7QLXKVJOUNUNM7J4XD2KJDBLXEP7CH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 13/2/23 14:50, Stefan Binding wrote:
> From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
> 
> Function cs_dsp_coeff_write_ctrl() can return 3 possible values:
> 0 - no change, 1 - value has changed and -1 - error, so positive value
> is not an error.
> Fixes: 7406bdbc4fb8 ("ASoC: wm_adsp: Return whether changed when writing controls")
> 
> Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
>   sound/pci/hda/hda_cs_dsp_ctl.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/pci/hda/hda_cs_dsp_ctl.c b/sound/pci/hda/hda_cs_dsp_ctl.c
> index 5433f6227ac9..463ca06036bf 100644
> --- a/sound/pci/hda/hda_cs_dsp_ctl.c
> +++ b/sound/pci/hda/hda_cs_dsp_ctl.c
> @@ -218,10 +218,10 @@ int hda_cs_dsp_write_ctl(struct cs_dsp *dsp, const char *name, int type,
>   	cs_ctl = cs_dsp_get_ctl(dsp, name, type, alg);
>   	ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, buf, len);
>   	mutex_unlock(&dsp->pwr_lock);
> -	if (ret)
> +	if (ret < 0)
>   		return ret;
>   
> -	if (cs_ctl->flags & WMFW_CTL_FLAG_SYS)
> +	if (ret == 0 || (cs_ctl->flags & WMFW_CTL_FLAG_SYS))
>   		return 0;
>   
>   	ctl = cs_ctl->priv;

Hi Takashi

Could you queue this patch as a bugfix for 6.2 please?
The cs_dsp patch to return 1 for changed has gone into 6.2
but we missed that this hda_cs_dsp code would break.
