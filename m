Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E67717AA9
	for <lists+alsa-devel@lfdr.de>; Wed, 31 May 2023 10:51:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90B8920C;
	Wed, 31 May 2023 10:50:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90B8920C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685523084;
	bh=FBM/w24aEDY05vkXEDbc6mFuQ0INMBUCCY8gcl0B7wg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qYhQkKTjAt+ScRuv55KEcXe6lsu09pSnDnjm5duvrc+dqxnTFmljTL8g92k8GZCGH
	 B86a5sEugZK3Hwfz0XIez2KTw9flaSkViHlLtLYFWv6fNyiPFIJs7IHbFRoRlrVOfS
	 txbrSl0kuxEznMvBGm+2uOQ/HdonUachiUAWBEG8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0867EF8053D; Wed, 31 May 2023 10:50:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3ED1F80149;
	Wed, 31 May 2023 10:50:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E332F8042F; Wed, 31 May 2023 10:50:30 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C63F5F800DF
	for <alsa-devel@alsa-project.org>; Wed, 31 May 2023 10:50:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C63F5F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=grrrAXSd
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34V5CpMU031404;
	Wed, 31 May 2023 03:50:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=aTCRz7r1hZ9HCbXbe8YpYrEWZ+l87uW7+6z/lJ/pl2s=;
 b=grrrAXSdDNAH2agLUJUfuL5gfFXfOLew2e6BcsH1dK7bDcy6uVebAFAkc1U06N9xN1IG
 yGawyPxrxT+mVHY0JLWl1rX6ZmBUYh3aRt5JgrU/4nr5Rr/i5R80k1SojJjCt2D0MJ0+
 lJMVRjPzU8KwpZsQ1uKXh7lmBYHDjXJRq584B/i+TmIyO6Cg00fn3kks6I+yFdeNFSeU
 Aq3dHv86mzwsF4KCXMcUMuNpS6SvXkYuepT5J/3XyQ1TB8ZfjcwYmHU0PEhgkp3VikKT
 o2fNel1fIh2K8QYpzEMA9soyugLDEgd7bOrttteFlDhAdKO+Tr2aF8uaK5vMHxqkm/AD oA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3que9mvg7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 May 2023 03:50:25 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Wed, 31 May
 2023 09:50:23 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 31 May 2023 09:50:23 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C8BFA11C6;
	Wed, 31 May 2023 08:50:23 +0000 (UTC)
Date: Wed, 31 May 2023 08:50:23 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <lee@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <linus.walleij@linaro.org>,
        <vkoul@kernel.org>
CC: <robh+dt@kernel.org>, <conor+dt@kernel.org>, <lgirdwood@gmail.com>,
        <yung-chuan.liao@linux.intel.com>, <sanyog.r.kale@intel.com>,
        <pierre-louis.bossart@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <devicetree@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: sound: cirrus,cs42l43: Add initial
 DT binding
Message-ID: <20230531085023.GH68926@ediswmail.ad.cirrus.com>
References: <20230530122112.1314458-1-ckeepax@opensource.cirrus.com>
 <20230530122112.1314458-3-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230530122112.1314458-3-ckeepax@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: IwEdBZpt7lnnkG1kErsM3_AW2-E5PGgl
X-Proofpoint-ORIG-GUID: IwEdBZpt7lnnkG1kErsM3_AW2-E5PGgl
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: EXZQYVELRWXZJ7N47P6MI3PZHPMN6UQ5
X-Message-ID-Hash: EXZQYVELRWXZJ7N47P6MI3PZHPMN6UQ5
X-MailFrom: prvs=151547ecba=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EXZQYVELRWXZJ7N47P6MI3PZHPMN6UQ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, May 30, 2023 at 01:21:08PM +0100, Charles Keepax wrote:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7e0b87d5aa2e5..0db9f37eec258 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4926,6 +4926,7 @@ M:	Richard Fitzgerald <rf@opensource.cirrus.com>
>  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
>  L:	patches@opensource.cirrus.com
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/mfd/cirrus,cs*

Just spotted this should be dropped for v3 as well, sorry.

Thanks,
Charles
