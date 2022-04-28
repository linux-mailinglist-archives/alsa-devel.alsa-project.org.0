Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B60C512F57
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 11:12:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 384101635;
	Thu, 28 Apr 2022 11:11:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 384101635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651137150;
	bh=+76qHTeVipx5kWEE7Sa78ED9d/BQ7mSCG65C6VvDDf4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hQgTiwb9mRx6TeB8S09PMwyPa+N72lTUdNvXxPSCx6ppeLLaP1ym3+pBnhtO/YsoJ
	 xeiPbFFP7aD4vEGTnMzs8moc4y4fPoVzT0XTb6QNuMyGdDgt/p9CBuGmJScR9PVJ5m
	 2nFQapStddahrkWWRh34f3pRCUwdP25CnBWAr0z4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0295F804B0;
	Thu, 28 Apr 2022 11:11:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B72CF80311; Thu, 28 Apr 2022 11:11:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD2E6F800F2
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 11:11:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD2E6F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="JTGGqEZD"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23S85KKX014079;
 Thu, 28 Apr 2022 04:11:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=GNIWocH5RL4/4+L/+i4OpILLi3MARmooLeD42GzbnLg=;
 b=JTGGqEZDbnFgB/FHIpQfUNpqxsAXSlUMjlGwYZl7PMQGj+Xikf290Xx1il2Mw8r6Gd88
 c0F8FFfDPSBBO3CyZWjWCvjezZXJH7j4q1OW0JDwT3sQrp+icOi6sT0m/p7eo5NL8QIU
 6hsYYDy9tS/WiYF1Neb7SnDJ64d6/mu+th1hAmiBIGj20uOdtt8JPSOMynMvEirqe6Qu
 kQ+z5+jXsAFqZMZhUUV+FSK9fepkfwgy3/ITWa/AAxTumG3/RGsjDLFPDywFDryRYp8c
 D5Q2hYXHvyfM9a3qu2oGem5DTiYIOYa5FE7BHoiYmZrNlrHvKhUpu9Mj61wwQK4owQdz KA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fprt61w3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 28 Apr 2022 04:11:22 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 28 Apr
 2022 10:11:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 28 Apr 2022 10:11:20 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6DA47B10;
 Thu, 28 Apr 2022 09:11:19 +0000 (UTC)
Date: Thu, 28 Apr 2022 09:11:19 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Subject: Re: [PATCH 19/26] ALSA: cs35l41: Do not print error when waking from
 hibernation
Message-ID: <20220428091119.GO38351@ediswmail.ad.cirrus.com>
References: <20220427150720.9194-1-vitalyr@opensource.cirrus.com>
 <20220427150720.9194-20-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220427150720.9194-20-vitalyr@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: _59qDnNUtRHXae41tWGQ6wwiCZZzJ5Jy
X-Proofpoint-ORIG-GUID: _59qDnNUtRHXae41tWGQ6wwiCZZzJ5Jy
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>
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

On Wed, Apr 27, 2022 at 04:07:13PM +0100, Vitaly Rodionov wrote:
> From: Stefan Binding <sbinding@opensource.cirrus.com>
> 
> When waking from hibernation, it is possible for the function
> which sends the wake command to fail initially, but after a
> retry it will succeed. There is no need to print an error if
> the initial attempts fail.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
> ---

Commit message should be ASoC: not ALSA:, but otherwise looks
good.

Thanks,
Charles
