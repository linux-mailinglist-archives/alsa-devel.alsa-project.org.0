Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F54D345B8B
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 11:01:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01DEE1655;
	Tue, 23 Mar 2021 11:00:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01DEE1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616493677;
	bh=/MfYYTrhClrijsKQXR5lcQL2g3JkUE0RvsAUtEyCCVE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=naStHYyvGtp2dQDdarjODOuIMx5VBIdtcozMCPV6s6vEhIXdCC9qUztcRRAYOO7oy
	 9Qnob89r5AIGWAksXvmu0BZlSjjolCNZ/aNCs+YDUb+YipDYQVyV44i71HwWWWx0h/
	 in27VehuqvDZcSC/QBUXlOwi7J509rltOZXApXPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 756B1F80268;
	Tue, 23 Mar 2021 10:59:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8665F8025F; Tue, 23 Mar 2021 10:59:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1D9AF800EE
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 10:59:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1D9AF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="QPV/0s5b"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12N9u49j032622; Tue, 23 Mar 2021 04:59:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=b6qErrcCVJKETaqJbCUYndAXMiSTFSJSDc+Bcs5NrEs=;
 b=QPV/0s5bNtqQBnZzoOzh6EffApUw7mrEzZgc1XOouRyHLwJOxxSs+odJ5gu+iCV0Si60
 O2hyrCkpv5ocH3nTijbP4c1GRktNWIQN98Zb0Qgr2KkYIXLII1Ibwy8eXymoYED6BWyt
 pRznAmc1DJQlKGKga5kQpX5HO3iSPMoz/S34iYktEQOdiwyKzDp8c92KzYKk3hrYzHLY
 xLI9yux3cA4cPE6oJW3g97890AbjC3MTrdOC5Rv0Vn6DYhKBugsYCH+7EpfT0u1uVVug
 AYdG8WvTqJ8aZFSaZa2k2v04yHNjmUoL0IzR4mJL+D360hwp/KiZa1/BB99RUkLdqr+a CQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 37def3bcqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 23 Mar 2021 04:59:31 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 23 Mar
 2021 09:59:29 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Tue, 23 Mar 2021 09:59:29 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C634711CB;
 Tue, 23 Mar 2021 09:59:29 +0000 (UTC)
Date: Tue, 23 Mar 2021 09:59:29 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: wm8960: Fix wrong bclk and lrclk with pll enabled
 for some chips
Message-ID: <20210323095929.GS106851@ediswmail.ad.cirrus.com>
References: <1616150926-22892-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1616150926-22892-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0
 mlxscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=952
 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103230072
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 gustavoars@kernel.org, kuninori.morimoto.gx@renesas.com,
 patches@opensource.cirrus.com, tiwai@suse.com, lgirdwood@gmail.com,
 peter.ujfalusi@ti.com, broonie@kernel.org, daniel.baluta@nxp.com,
 linux-kernel@vger.kernel.org
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

On Fri, Mar 19, 2021 at 06:48:46PM +0800, Shengjiu Wang wrote:
> The input MCLK is 12.288MHz, the desired output sysclk is 11.2896MHz
> and sample rate is 44100Hz, with the configuration pllprescale=2,
> postscale=sysclkdiv=1, some chip may have wrong bclk
> and lrclk output with pll enabled in master mode, but with the
> configuration pllprescale=1, postscale=2, the output clock is correct.
> 
> >From Datasheet, the PLL performs best when f2 is between
> 90MHz and 100MHz when the desired sysclk output is 11.2896MHz
> or 12.288MHz, so sysclkdiv = 2 (f2/8) is the best choice.
> 
> So search available sysclk_divs from 2 to 1 other than from 1 to 2.
> 
> Fixes: 84fdc00d519f ("ASoC: codec: wm9860: Refactor PLL out freq search")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
