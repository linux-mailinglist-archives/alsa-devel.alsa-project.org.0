Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB5E5483C9
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 11:56:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72E871836;
	Mon, 13 Jun 2022 11:55:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72E871836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655114161;
	bh=0c2mLPsdXqhL6NsdoSPnpQBVFqgcdU3i0yjOcUrKqX0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lx3fzeIyYuNdS0qr9eDXcg9wrMDBVx5+XHoapFE+FfAiCD2EPDet+1RWMVik/bjYP
	 TS2l2T5P2j7/JPYrj8AyiHvoQBU4uu8MTQs66KNz77SDQP191OdVjCKoEqaDrbNGxo
	 eAkW2QPjAZ5xpV8iqcGTDjNiWiLPuKDXm5UHGLAE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5ECBF80107;
	Mon, 13 Jun 2022 11:55:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B51AF804C1; Mon, 13 Jun 2022 11:55:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_26,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C392BF80107
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 11:54:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C392BF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="YSEazX0u"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25D7jncr030852;
 Mon, 13 Jun 2022 04:54:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=SAL9QBrR9Hifnxdadv6LtK1riDzGLGAzq1j5dDkQ/eE=;
 b=YSEazX0uO5GV3d6eprUPFqBpY2HPFw6tjVtpSwFjm3pPOCyD6SFrbQuT8qP8aTpkafDG
 wEMwsYZTSezO57v7oNilz7MY86TJm4g9OiORe+E7d5kLh74zbgbf6wXjUpBlmEMbG8H6
 9xgtekY2JVsWrI1WFghS9KWch1o2j/pFUmPWiGjLFQqZgwvmN/ZSCq4a8Nzev/hxGIaI
 067Wj8AJx34nIpY4KIQbEKUU5w5DkIZnl8ZWtlBRglqaIwVerccqsUrkRpF0VTgpw5/W
 8eqrcUGfEwdkdNFAaj8W5vDvtbi+DB3ikcOmlpx6B/W4dW4VZCSzcPsBWfNJkdOGtTqz hA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf31py0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 13 Jun 2022 04:54:55 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 13 Jun
 2022 10:54:53 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Mon, 13 Jun 2022 10:54:53 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2C2AD11D1;
 Mon, 13 Jun 2022 09:54:53 +0000 (UTC)
Date: Mon, 13 Jun 2022 09:54:53 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 00/56] Specify clock provider directly to CPU DAIs
Message-ID: <20220613095453.GB38351@ediswmail.ad.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <165478153064.1052094.1721875477574787769.b4-ty@kernel.org>
 <2a498819-dbbf-31c1-4145-bbd2d7179bd8@sholland.org>
 <YqMy/FkxDPKmzdrB@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YqMy/FkxDPKmzdrB@sirena.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: UiaFdV3e1tP7Nx8vGVE1XxJr6gdm5Oey
X-Proofpoint-ORIG-GUID: UiaFdV3e1tP7Nx8vGVE1XxJr6gdm5Oey
X-Proofpoint-Spam-Reason: safe
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
 srinivas.kandagatla@linaro.org, peter.ujfalusi@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 Samuel Holland <samuel@sholland.org>, pierre-louis.bossart@linux.intel.com,
 krzk@kernel.org, linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-sunxi@lists.linux.dev, linux-xtensa@linux-xtensa.org, nsaenz@kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 patches@opensource.cirrus.com, nicolas.ferre@microchip.com,
 jarkko.nikula@bitmer.com, kernel@pengutronix.de, shawnguo@kernel.org,
 daniel@zonque.org
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

On Fri, Jun 10, 2022 at 01:03:08PM +0100, Mark Brown wrote:
> On Thu, Jun 09, 2022 at 09:03:15PM -0500, Samuel Holland wrote:
> > On 6/9/22 8:32 AM, Mark Brown wrote:
> > > On Thu, 19 May 2022 16:42:22 +0100, Charles Keepax wrote:
> 
> Please delete unneeded context from mails when replying.  Doing this
> makes it much easier to find your reply in the message, helping ensure
> it won't be missed by people scrolling through the irrelevant quoted
> material.
> 
> > > [22/56] ASoC: sunxi: Update to use set_fmt_new callback
> > >         commit: 7cc3965fde74c9c725ed01de4ac35bc7d562d16a
> 
> > This patch is wrong, which I pointed out earlier[1]. It will break audio on the
> > Allwinner A33 and A64 SoCs. Charles said he would send a v2[2]. Excluding the
> > changes to sound/soc/sunxi/sun8i-codec.c from the patch would fix it.
> 
> Your mail doesn't say that this will break, it says the change is
> unexpected.  In any case, please send an incremental fix - there's no
> need to revert the entire series for this.

Apologies guys was on PTO last week, I will send an incremental
fix today to patch up the issues.

Thanks,
Charles
