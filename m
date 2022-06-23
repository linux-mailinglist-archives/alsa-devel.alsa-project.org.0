Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7B4557866
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 13:06:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF70E1EEC;
	Thu, 23 Jun 2022 13:05:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF70E1EEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655982407;
	bh=8pa+MX3RGN13N9s/gNCcAo3UfoGBllPRPz9zjQvwXvM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F6kGctqCWWHgAobXzhHNgo6Z/V8K2iSKLHAv40zzjsVItc+lnIMPllbdDrmG/15of
	 XiNOHEbv1bYNzv4H+wfKDksItTmwuHeMWpHzPtKzSOhLlhClwnk/OEdSWV16Ie02Zm
	 jpS29z4gcIIWrYQz9TVEBhY/XyYgJBLofLBVUk4w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F487F80542;
	Thu, 23 Jun 2022 13:04:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8167F804C1; Thu, 23 Jun 2022 11:39:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37A04F800CB
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 11:39:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37A04F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="nIE3n9kD"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25N7fLsF004327;
 Thu, 23 Jun 2022 04:39:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=i32Dkqu6yqHdJkz3oPGSblt6FxDAn2yx5mHso4uT6jY=;
 b=nIE3n9kDrMoH4e/LAawz+RzUC2VoQWASFOauN4tM5A1H8JMc8tTXY2cVBGOwMqIrQM6K
 STuS8s6JFijovnai1W2MNLfVUjobxH6CViDtDBBPJUDXBmHrZJCFNVYS9HIj6iGziz+r
 VnKUwYrgOKvFYjTYgJ7g8SHsa+TlwYy2/uQ+7BQ2M5FiknT1aLaBacYmzVf4gZibj1KF
 +x6MXDk3uwUf66jBJA5uO/c3MJHdGz1TvkpWGO+3eq+mJ5MeXOg5XvUPhCzW0RdI3EaW
 UeEhW8dhlBiL29hjgLxwPY+qxBlb9eORf5BQNruocf4tI6GNJ6GP/Mzs9siqoEV7xXtG sA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gsb4p6jm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jun 2022 04:39:52 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 10:39:51 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 23 Jun 2022 10:39:51 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1797D11D1;
 Thu, 23 Jun 2022 09:39:51 +0000 (UTC)
Date: Thu, 23 Jun 2022 09:39:51 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 27/96] ASoC: au1x: Migrate to new style legacy DAI naming
 flag
Message-ID: <20220623093951.GG38351@ediswmail.ad.cirrus.com>
References: <20220616143429.1324494-28-ckeepax@opensource.cirrus.com>
 <202206230910.wUXKFP3z-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202206230910.wUXKFP3z-lkp@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: ngGGSOCW3HD7Nqksfbnzki1Fx-Dv9wmS
X-Proofpoint-ORIG-GUID: ngGGSOCW3HD7Nqksfbnzki1Fx-Dv9wmS
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Thu, 23 Jun 2022 13:04:20 +0200
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, airlied@linux.ie,
 alsa-devel@alsa-project.org, nicolas.ferre@microchip.com,
 srinivas.kandagatla@linaro.org, peter.ujfalusi@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org, kernel@pengutronix.de,
 mripard@kernel.org, broonie@kernel.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 kbuild-all@lists.01.org, lgirdwood@gmail.com, vkoul@kernel.org,
 jarkko.nikula@bitmer.com, daniel@ffwll.ch, shawnguo@kernel.org,
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

On Thu, Jun 23, 2022 at 09:59:06AM +0800, kernel test robot wrote:
> Hi Charles,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on broonie-sound/for-next]
> >> sound/soc/au1x/ac97c.c:227:10: error: 'const struct snd_soc_component_driver' has no member named 'legacy_dai_name'; did you mean 'legacy_dai_naming'?
>      227 |         .legacy_dai_name        = 1,
>          |          ^~~~~~~~~~~~~~~
>          |          legacy_dai_naming

Hmm... apologies for this not sure how that snuck through my
build testing, must have somehow missed this one.

Mark do you want me to send a v2 for the whole series? Or given
the size would it be better to just resend this patch?

Thanks,
Charles
