Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC8676FC23
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 10:41:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFA5483B;
	Fri,  4 Aug 2023 10:40:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFA5483B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691138463;
	bh=tCjNHdHeDKcloxFd+YJek3p/uNGhf1El+h+/HmCie1Y=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hqinUzMrVoYiBWIVn8XkJG5m7m2Ckl0ygI82ZqkCTO3rHFEBTdH7ccg2dRfo+KCJh
	 ZeAjFdeZorbpii2dIGO/MDFYrBBml7zCNNXVE9DpzniwTvNpGPxDq8HZJcd14Lf3j8
	 hK9RETy5DfF0LDJnAnWC2VJ36IHTGxd3Hn3ekF38=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 643BDF80553; Fri,  4 Aug 2023 10:40:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13C38F8025A;
	Fri,  4 Aug 2023 10:40:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCE04F80425; Fri,  4 Aug 2023 10:39:57 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9ACB7F801D5
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 10:39:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9ACB7F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Hh4yxmEf
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3747k7EG019147;
	Fri, 4 Aug 2023 03:39:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=aIsdQaWLuPcX+1L
	76ID77qS1BLEZPLSxlG5CmEra5QU=; b=Hh4yxmEfKAmAuw9ItkLjWTuCPiBVTD7
	BKrQMqldYAqX0Cu3ypK4vTWO4R7Q+2BZl7rKizguiyUuUR21fAbzN7aSlOu4UxY3
	fOagN915mHrK62711IuZPeGu1wCh9b8qwgwcZaic3yEyMSvuGai3OIA7VPvD64b2
	CDhjTBebTQkYPs4uTKPrDZwNvzEtdA7TVvxKJEw4dgAdK3r/XSIMf4AEkvmcgfFe
	NkWkmxGw2+svhsLRbUrxIKA0ISAQVLnLjh5/b2Jzb5YRI/zm3CFlW4jMVjklgS7+
	3uANUPjzzBolzzJqdqb6r/mtAulkkdUqX3/VodOjJXyoI4+uFQmyFKQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3s5gk1y0u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Aug 2023 03:39:51 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 4 Aug
 2023 09:39:49 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Fri, 4 Aug 2023 09:39:49 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 380FA3563;
	Fri,  4 Aug 2023 08:39:49 +0000 (UTC)
Date: Fri, 4 Aug 2023 08:39:49 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Fabio Estevam <festevam@gmail.com>
CC: <broonie@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <shengjiu.wang@gmail.com>,
        Fabio Estevam
	<festevam@denx.de>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: wlf,wm8960: Describe the power
 supplies
Message-ID: <20230804083949.GQ103419@ediswmail.ad.cirrus.com>
References: <20230803215506.142922-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230803215506.142922-1-festevam@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 8vKPaGv5q5iDLXPvKzDZlhlz9Gk3_-7V
X-Proofpoint-ORIG-GUID: 8vKPaGv5q5iDLXPvKzDZlhlz9Gk3_-7V
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: P2GNKVZECBZSAZQWJRDO5NMB2DRT6M5T
X-Message-ID-Hash: P2GNKVZECBZSAZQWJRDO5NMB2DRT6M5T
X-MailFrom: prvs=3580138b0b=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P2GNKVZECBZSAZQWJRDO5NMB2DRT6M5T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Aug 03, 2023 at 06:55:05PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> WM8960 has the following power supplies:
> 
> - AVDD
> - DBVDD
> - DCVDD
> - SPKVDD1
> - SPKVDD1
> 
> Add them to bindings to improve the hardware description.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
