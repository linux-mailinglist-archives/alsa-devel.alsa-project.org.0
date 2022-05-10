Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8D3522053
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 17:57:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ECED1957;
	Tue, 10 May 2022 17:56:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ECED1957
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652198226;
	bh=DG2mFPMJt6/d2c/weI0rUrY61jIIWW0LfZ1+ToQXz8Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WCY7xm3DDZRwPlhLwbNaS/WRrODWlmeOWxuQa4KOTj8VM4oVHvClmja3Vmd9ii2GD
	 8LLsekBBu1gVuwfgF5w0w8bZuHwMSzVePyDMgGf4vzanCqLj6oz9NEhLxTo2lsa0wE
	 lL031DYMNYpaVVu/liGQDz8e0shUaEjHHj5ddTy0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11191F801F5;
	Tue, 10 May 2022 17:56:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0A25F8019D; Tue, 10 May 2022 17:56:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B32DFF8019D
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 17:56:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B32DFF8019D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Irrw5Hvs"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A5hOmD011917;
 Tue, 10 May 2022 10:56:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=01coq6eTT3NkAd1JAlLJ176jzYKNUqPt6tC/ku5+Gg4=;
 b=Irrw5HvsKteuLiWTuQ00AKnBil3Lvkdg+2DpXsJNMKKnLVCm/WxGOCAofxNn75RswMWM
 AxC4kM1Scz3Y7yo/IV4afHwXyfpvyQpBzIL5/AnCOr8+AhJpDt5DnaVrPBFRwMqIMloy
 b9N4v9TY4DKSHyULzE4NtVNZIktOgzYsu8XTxpkdl4h6gw0V1rYSspFQPQop3quEJOgN
 JVUcaYT9ODa5RPmlHtgeNs/4KPmWIIkctPsWAaaMwALM4aDtsC0QG0QwipvTbvOIw+iP
 PyVp5N/ZAfvEpKbGzQ2kE8qtHeDW4C7UaZRjYNHouVUnonVZWnzc7K7Rek32UbcEMyej cA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fwn6nvhkj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 10 May 2022 10:56:02 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 10 May
 2022 16:56:01 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Tue, 10 May 2022 16:56:01 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 38020B10;
 Tue, 10 May 2022 15:56:01 +0000 (UTC)
Date: Tue, 10 May 2022 15:56:01 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Zheyu Ma <zheyuma97@gmail.com>
Subject: Re: [PATCH 6/6] ASoC: wm8903: Fix the error handling of
 wm8903_i2c_probe()
Message-ID: <20220510155601.GE38351@ediswmail.ad.cirrus.com>
References: <20220510153251.1741210-1-zheyuma97@gmail.com>
 <20220510153251.1741210-7-zheyuma97@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220510153251.1741210-7-zheyuma97@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 4cY41mpm9RoEhmYdlHWbVW6g7Takd3_A
X-Proofpoint-GUID: 4cY41mpm9RoEhmYdlHWbVW6g7Takd3_A
X-Proofpoint-Spam-Reason: safe
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org,
 tanureal@opensource.cirrus.com, patches@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, david.rhodes@cirrus.com, rf@opensource.cirrus.com,
 broonie@kernel.org, james.schulman@cirrus.com, linux-kernel@vger.kernel.org
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

On Tue, May 10, 2022 at 11:32:51PM +0800, Zheyu Ma wrote:
> The driver should goto label 'err' when failing to request the irq.
> 
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
