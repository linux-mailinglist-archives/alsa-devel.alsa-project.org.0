Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EE2758131
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 17:43:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F8B91E9;
	Tue, 18 Jul 2023 17:42:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F8B91E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689694991;
	bh=rHTLmvSmww5+62E5Hnuh5+8JDBPCOagieoHn9g16u/o=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m9LmY4AW1WwdZXBJ37p1T9XT0d/MolztiWN5cmQv/gb97tRxbPpChz4dWpO8UVpig
	 T1/yUmG9i3rR90JsUlxyEtHyF2n8mbJL8azTzHSrG0obEdlqEq54u9DyF2WDjJwGWV
	 1XIF1lX7YD0UqxolFpCtNs9IXy0EOfma4Vkf7I6U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94A85F80153; Tue, 18 Jul 2023 17:42:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC0FCF8027B;
	Tue, 18 Jul 2023 17:42:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29F08F8032D; Tue, 18 Jul 2023 17:42:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D059F8007E
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 17:42:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D059F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=FBpjJsgD
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36I7rQwY013833;
	Tue, 18 Jul 2023 10:42:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=MSvzRAFOJ4AYGEX
	dZyueqxYtwFswn6tCeR4OGrX8bg8=; b=FBpjJsgDvcHQCHyy+0BtuiVFWYAYAMO
	00MESlVkxiBF967WvRYYhlK1/5typpz0fa6C++JSq+Ck8QjE3B53xnGsS/pv12RK
	4ovKe6WOpUqjpLGwQ5R/2mxivTofgN4TtBtj2ZpmdXwg8hjnyp9Ea+1f36q4lkOK
	rAH3eWXiavtg8ZpZOHImBt7DQDxiRlLite5S0glPTnuYJ/bdhh1maEuDv8b5uszE
	/C7qOCGHqBejibP8di1k0RQedEN0oAYk2DQ6R2XnSpSmuh1zKVpmQjyNNuRBtsFX
	Zw8SNXOeuSUOhPZljtDc6AcctsSAYOva4lmdDuxjTofdoVTQ5TPApMg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3rus6gumam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 10:42:02 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 18 Jul
 2023 16:42:00 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Tue, 18 Jul 2023 16:42:00 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C0B5E3563;
	Tue, 18 Jul 2023 15:42:00 +0000 (UTC)
Date: Tue, 18 Jul 2023 15:42:00 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 08/11] mfd: wm5110: Update to use maple tree register
 cache
Message-ID: <20230718154200.GG103419@ediswmail.ad.cirrus.com>
References: <20230713-mfd-cirrus-maple-v1-0-16dacae402a8@kernel.org>
 <20230713-mfd-cirrus-maple-v1-8-16dacae402a8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230713-mfd-cirrus-maple-v1-8-16dacae402a8@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: RCxF2_bUe9ZMoxy4XvdZIdYDMermGsfS
X-Proofpoint-GUID: RCxF2_bUe9ZMoxy4XvdZIdYDMermGsfS
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: X6OVOKEKHNV6U5R5HTP3BX67EFUJ7GD2
X-Message-ID-Hash: X6OVOKEKHNV6U5R5HTP3BX67EFUJ7GD2
X-MailFrom: prvs=2563600699=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X6OVOKEKHNV6U5R5HTP3BX67EFUJ7GD2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 13, 2023 at 01:49:26AM +0100, Mark Brown wrote:
> The maple tree register cache is based on a much more modern data structure
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache. In
> v6.5 it has also acquired the ability to generate multi-register writes in
> sync operations, bringing performance up to parity with the rbtree cache
> there.
> 
> Update the wm5110 driver to use the more modern data structure.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/mfd/wm5110-tables.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/wm5110-tables.c b/drivers/mfd/wm5110-tables.c
> index 65b9b1d6daec..eba324875afd 100644
> --- a/drivers/mfd/wm5110-tables.c
> +++ b/drivers/mfd/wm5110-tables.c
> @@ -3218,7 +3218,7 @@ const struct regmap_config wm5110_i2c_regmap = {
>  	.readable_reg = wm5110_readable_register,
>  	.volatile_reg = wm5110_volatile_register,
>  
> -	.cache_type = REGCACHE_RBTREE,
> +	.cache_type = REGCACHE_MAPLE,
>  	.reg_defaults = wm5110_reg_default,
>  	.num_reg_defaults = ARRAY_SIZE(wm5110_reg_default),
>  };
> 
> -- 
> 2.39.2
> 

This one appears to cause me some issues, seems to get the IRQs
into a weird state when doing compressed stream stuff. The
issue seems to also require commit bfa0b38c1483 ("regmap:
maple: Implement block sync for the maple tree cache") to be
present. So it definitely seems to relate to the cache sync,
but not sure if it is something todo with the device itself,
or the maple tree stuff yet.

Thanks,
Charles
