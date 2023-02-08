Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8E068F615
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 18:51:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F79A826;
	Wed,  8 Feb 2023 18:50:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F79A826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675878698;
	bh=A8G9mQpRxeBhOzYtT9t8gzl8GODjy0vg4pbQRrFPfbA=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GoFxTb39E6WbA8uEe2gBI6UY3E0SK59+8al7ClrrvRuagiBPjmRxeLtrQyaKR7Kt6
	 pXD79HSa9U+ctKRn49k//MIpPahc/U9f8fGtKQuAB4gVnhLyuyLYci12QW/nig4K1W
	 vb0afOTsUsgpXnEloYBCGrFfaVPED5R4ekffzuRc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A0C0F8010B;
	Wed,  8 Feb 2023 18:50:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D135F8012B; Wed,  8 Feb 2023 18:50:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9426F8001E
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 18:50:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9426F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=QURa8kSG
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3187gtOL029362;
	Wed, 8 Feb 2023 11:50:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=ZFBvg5SCArEASMw7/Am1oR6os3aE99DgiOlHemuaHZU=;
 b=QURa8kSGk8TMKJjhrKWJrDgWABRTSM05926YJWoojwG1y/Knz/ZqdPBksvlQG1xFCJx6
 EKHTfDDykNrlAfcn10XhBKec2vg7A7uoFGlLfg6RHxTy1cqs/1Q361eLTpverxPxRCmv
 lUCW3g0iRd9hCQ7rjYIWPOs8Cv0uoh02lCvwANqN1z+hUIybg9laxXfMyJ5LpHkESsEk
 8wz0Y4ZDvq6609mu1zzVcgMJfy+5hk81OVqRKboIZ/PHk97kywGo17A97a5yphUR3HlU
 GI+umlduikRoUQNd/vjJPrMGGEa8T2MsdJ/ZVneC0odvEpmfipbZ8v/UXfvEQVjnRfZx eQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3nhmnuxf7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 11:50:36 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Wed, 8 Feb
 2023 11:50:34 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.21 via Frontend Transport; Wed, 8 Feb 2023 11:50:34 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C308811A8;
	Wed,  8 Feb 2023 17:50:34 +0000 (UTC)
Date: Wed, 8 Feb 2023 17:50:34 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lucas Tanure <lucas.tanure@collabora.com>
Subject: Re: [PATCH v3 3/4] ALSA: cs35l41: Add shared boost feature
Message-ID: <20230208175034.GA12852@ediswmail.ad.cirrus.com>
References: <20230208141839.1097377-1-lucas.tanure@collabora.com>
 <20230208141839.1097377-4-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230208141839.1097377-4-lucas.tanure@collabora.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: XpcdgWZ82SP8x475osZVgzrdr2kj6XF2
X-Proofpoint-ORIG-GUID: XpcdgWZ82SP8x475osZVgzrdr2kj6XF2
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: RBO5QXS2TNPQDS4TOCMWLKKM2354E2DD
X-Message-ID-Hash: RBO5QXS2TNPQDS4TOCMWLKKM2354E2DD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RBO5QXS2TNPQDS4TOCMWLKKM2354E2DD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Feb 08, 2023 at 02:18:38PM +0000, Lucas Tanure wrote:
> Shared boost allows two amplifiers to share a single boost circuit by
> communicating on the MDSYNC bus.
> The passive amplifier does not control the boost and receives data from
> the active amplifier.
> 
> Shared Boost is not supported in HDA Systems.
> Based on David Rhodes shared boost patches.
> 
> Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>
> ---
> +		ret = wait_for_completion_timeout(pll_lock, msecs_to_jiffies(1000));
> +		if (ret == 0) {
> +			ret = -ETIMEDOUT;
> +		} else {
> +			regmap_read(regmap, CS35L41_PWR_CTRL3, &pwr_ctrl3);
> +			pwr_ctrl3 |= CS35L41_SYNC_EN_MASK;
> +			struct reg_sequence cs35l41_mdsync_up_seq[] = {
> +				{CS35L41_PWR_CTRL3,	pwr_ctrl3},
> +				{CS35L41_PWR_CTRL1,	0x00000000, 3000},
> +				{CS35L41_PWR_CTRL1,	0x00000001, 3000},
> +			};

I think this looks good as long as turning the DRE off wasn't an
important part of the sequence and was just accidentally
happening. Probably on David to confirm that one.

Although should really move the variable definition to the top of
the code block and put a blank line after it, to pass checkpatch.

Thanks,
Charles

> +			ret = regmap_multi_reg_write(cs35l45->regmap, cs35l41_mdsync_up_seq,
> +						     ARRAY_SIZE(cs35l41_mdsync_up_seq));
