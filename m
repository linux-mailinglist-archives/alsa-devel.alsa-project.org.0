Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10432849C87
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Feb 2024 15:02:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D4CC82B;
	Mon,  5 Feb 2024 15:01:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D4CC82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707141725;
	bh=AQ9rJJsSMiX+vo7iSm3VkhpLNuASv5tw8v6zztJtpa8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZK0budTfdRUmbNYnuIirsFlJQr8gEFYG2WR4kQvdexcbWcjBE0CcQYS4hxY3prIXy
	 tB7Twkt7B1Mo8SjeFcYItX6hMoiL+0Ei3U/JMg/pGOtmYCLpIj8frfFNzHwC/O/4dL
	 EBNbvR0eeGcexf9wVkzTXlIFM/7SoDFsh4KmSL1Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F142F805AE; Mon,  5 Feb 2024 15:01:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FAF6F8058C;
	Mon,  5 Feb 2024 15:01:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3539F801EB; Mon,  5 Feb 2024 15:01:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F2A4F800EE
	for <alsa-devel@alsa-project.org>; Mon,  5 Feb 2024 15:01:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F2A4F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=nhvuxBxD
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4155VpcZ002122;
	Mon, 5 Feb 2024 08:01:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=KkdSVvZBpNy6UICQTjzXbhDmnHH8Se+KrDnsL2G3J/E=; b=
	nhvuxBxD495qcJk3Dwfn+Er1TmmkZ7aJl4efkUIbbRZgzbGmi15fN6u6L0pQsS8m
	oizA2n3YqQi918+XB4wYEvGZbCAZERLf6z7PoPWBL6CgeUn6VnT6NmDupNW9GTvT
	1OutoakT1s0SKSbllebVm5FLZy+RPSpylL3B8goAarXiDQeLi9Yu5opBm006u0vh
	Rin8D06cqaadWvMwBHLeKHYsAlC1Ai1/JzEvNBGygzmXFKBcMTCXDg34tPFL74JS
	da4YSkg3HXId+hWhheJZBLCFkmgPuukxddu7ePknDbuGLoiTJSsKW9cZyuuPBjEM
	GZ4YM+x5ksEclSEt6EyFIg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3w1ks29ybc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 08:01:05 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 5 Feb
 2024 14:01:03 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Mon, 5 Feb 2024 14:01:03 +0000
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 8A88B820241;
	Mon,  5 Feb 2024 14:01:03 +0000 (UTC)
Message-ID: <5a2872d4-7eb3-465a-aace-c848919b1f2a@opensource.cirrus.com>
Date: Mon, 5 Feb 2024 14:01:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs35l56: fix reversed if statement in
 cs35l56_dspwait_asp1tx_put()
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <0c254c07-d1c0-4a5c-a22b-7e135cab032c@moroto.mountain>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <0c254c07-d1c0-4a5c-a22b-7e135cab032c@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5xdR__uDpewbfPRVIWR6S2KgtvLy6a5n
X-Proofpoint-ORIG-GUID: 5xdR__uDpewbfPRVIWR6S2KgtvLy6a5n
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: WLIAIX4K7YJJP7EZFTPAHH64NXNV7FRU
X-Message-ID-Hash: WLIAIX4K7YJJP7EZFTPAHH64NXNV7FRU
X-MailFrom: prvs=9765900aaf=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WLIAIX4K7YJJP7EZFTPAHH64NXNV7FRU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 05/02/2024 12:44, Dan Carpenter wrote:
> It looks like the "!" character was added accidentally.  The
> regmap_update_bits_check() function is normally going to succeed.  This
> means the rest of the function is unreachable and we don't handle the
> situation where "changed" is true correctly.
> 
> Fixes: 07f7d6e7a124 ("ASoC: cs35l56: Fix for initializing ASP1 mixer registers")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>>From static analysis and review, not tested.
> ---
>   sound/soc/codecs/cs35l56.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
> index c23e29da4cfb..ebed5ab1245b 100644
> --- a/sound/soc/codecs/cs35l56.c
> +++ b/sound/soc/codecs/cs35l56.c
> @@ -115,7 +115,7 @@ static int cs35l56_dspwait_asp1tx_put(struct snd_kcontrol *kcontrol,
>   
>   	ret = regmap_update_bits_check(cs35l56->base.regmap, addr,
>   				       CS35L56_ASP_TXn_SRC_MASK, val, &changed);
> -	if (!ret)
> +	if (ret)
>   		return ret;
>   
>   	if (changed)

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>

