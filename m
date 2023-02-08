Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C90268EC66
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 11:10:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFFCBA4A;
	Wed,  8 Feb 2023 11:09:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFFCBA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675851031;
	bh=9Hl8UGGuEJZhLqGmPk2KRUBdM11TG0C0HHCJW2rVneU=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cuvmBUpOk0ktnRy/VPupeAkhcURPe1pMR4VN+g8u2bQuxRu1i2P0jvMimOgepm86o
	 sxgF8BUo3PR9P2KyNWMK3o7AQ0ntbrGT3XvCYwIX8SfnUtve6BmpAUzXlhTtDAJwOO
	 0PjARsCu/CZOz704nbriVVGjEBPjLyxO5B7ED9cc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95618F800AF;
	Wed,  8 Feb 2023 11:09:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1ECDF8012B; Wed,  8 Feb 2023 11:09:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E175BF80095
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 11:09:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E175BF80095
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=mOUuu8Hj
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3187LPI7011275;
	Wed, 8 Feb 2023 04:09:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=YjlP7CxcFGqTbmdNeDv7aSY9o6RNVPpadtjJ59E+x+A=;
 b=mOUuu8Hj9IAR+LNmLdlHT5O9yunCPYWayLCZPU+AXC62DZgwbcoV1Di9jMhVox70WNne
 Lz6qULdlbeGm/lB3BLmgZ4Hd7zj8UObeY4W607r8S6LJIt8uIr1GYZgc8J5zoBA9amE9
 Ll6/7tBUreBRmf6K3lUM+DYfvxL6ANUS71DuTZRCjYIdddbtBv+/uv+ud41bDJNbDsj2
 ON7XG4r12VePpkSd67KtAQgUCICGXs0B6+lhV4fIu1DG1zWbrUwlu41zdl1Ug6pzefIu
 sBSRegDd4TtJuvz/M9Mj+6dDN4qUFuRlesQE4Jod5Nqbi9P2aIobjldRAy/1WjJof4mR tg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3nhnn7wsxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 04:09:30 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Wed, 8 Feb
 2023 04:09:28 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via Frontend
 Transport; Wed, 8 Feb 2023 04:09:28 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EB3A211C7;
	Wed,  8 Feb 2023 10:09:27 +0000 (UTC)
Date: Wed, 8 Feb 2023 10:09:27 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lucas Tanure <lucas.tanure@collabora.com>
Subject: Re: [PATCH v2 3/5] ALSA: cs35l41: Add shared boost feature
Message-ID: <20230208100927.GF36097@ediswmail.ad.cirrus.com>
References: <20230207162526.1024286-1-lucas.tanure@collabora.com>
 <20230207162526.1024286-4-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230207162526.1024286-4-lucas.tanure@collabora.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: jwiGlv1wx0IC9PFOxp8CzH1odc8hpYji
X-Proofpoint-ORIG-GUID: jwiGlv1wx0IC9PFOxp8CzH1odc8hpYji
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 2FEN6OOQKI55IUUU6VY2ZYDJUMZCZRY2
X-Message-ID-Hash: 2FEN6OOQKI55IUUU6VY2ZYDJUMZCZRY2
X-MailFrom: prvs=74039f8db2=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: David Rhodes <david.rhodes@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2FEN6OOQKI55IUUU6VY2ZYDJUMZCZRY2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 07, 2023 at 04:25:24PM +0000, Lucas Tanure wrote:
> Shared boost allows two amplifiers to share a single boost
> circuit by communicating on the MDSYNC bus.
> The passive amplifier does not control the boost and receives
> data from the active amplifier.
> 
> Shared Boost is not supported in HDA Systems.
> Based on David Rhodes shared boost patches.
> 
> Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>
> ---
> -int cs35l41_global_enable(struct regmap *regmap, enum cs35l41_boost_type b_type, int enable)
> +int cs35l41_global_enable(struct regmap *regmap, enum cs35l41_boost_type b_type, int enable,
> +			  struct completion *pll_lock)
>  {
>  	int ret;
> +	unsigned int gpio1;
>  
>  	switch (b_type) {
> +	case CS35L41_SHD_BOOST_ACTV:
> +	case CS35L41_SHD_BOOST_PASS:
> +		regmap_update_bits(regmap, CS35L41_PWR_CTRL3, CS35L41_SYNC_EN_MASK, 0);
> +
> +		gpio1 = enable ? CS35L41_GPIO1_MDSYNC : CS35L41_GPIO1_HIZ;
> +		regmap_update_bits(regmap, CS35L41_GPIO_PAD_CONTROL, CS35L41_GPIO1_CTRL_MASK,
> +				   gpio1 << CS35L41_GPIO1_CTRL_SHIFT);
> +
> +		ret = regmap_update_bits(regmap, CS35L41_PWR_CTRL1, CS35L41_GLOBAL_EN_MASK,
> +					 enable << CS35L41_GLOBAL_EN_SHIFT);
> +		usleep_range(3000, 3100);
> +		if (!enable)
> +			break;
> +
> +		if (!pll_lock)
> +			return -EINVAL;
> +
> +		ret = wait_for_completion_timeout(pll_lock, msecs_to_jiffies(1000));
> +		if (ret == 0) {
> +			ret = -ETIMEDOUT;
> +		} else {
> +			regmap_update_bits(regmap, CS35L41_PWR_CTRL3, CS35L41_SYNC_EN_MASK, 0);
> +			regmap_update_bits(regmap, CS35L41_PWR_CTRL1, CS35L41_GLOBAL_EN_MASK,
> +								 0 << CS35L41_GLOBAL_EN_SHIFT);
> +			usleep_range(3000, 3100);
> +			regmap_update_bits(regmap, CS35L41_PWR_CTRL1, CS35L41_GLOBAL_EN_MASK,
> +								 1 << CS35L41_GLOBAL_EN_SHIFT);
> +			usleep_range(3000, 3100);
> +		}

This approach also makes me nervous, I was somewhat imagining the
usage of regmap_multi_reg_write for this sequence was because it
was very important that no other register writes could interleave
in between these writes. But I don't know, so it could also have
just been a random design choice. So we probably need David to
confirm if that was the reason for the original code here.

Thanks,
Charles
