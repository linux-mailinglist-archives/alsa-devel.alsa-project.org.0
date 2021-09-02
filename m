Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A393FEECB
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Sep 2021 15:37:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D40D616DF;
	Thu,  2 Sep 2021 15:36:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D40D616DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630589834;
	bh=88VOhcgiF1AUALhnSvymAfD1l9V4iZOuCVT+/IP7uno=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lRqi4Muq0/FVcgwtC4FwfhSEmDfP5uSkS0nP7c8+G7c9O57f2dChDt0o/sOqjPvMy
	 AqJmIQA+dQyBBLSbZVT2wx181FbmTD9mOQJLGsrLRKzfTlIkv0KS0BwzB7re3k+N4M
	 n/phHOBkJJnf8FBtkHJg92cjij9UcW+a7IqWfXMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5863EF8025B;
	Thu,  2 Sep 2021 15:35:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BE70F80269; Thu,  2 Sep 2021 15:35:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F3C6F80125
 for <alsa-devel@alsa-project.org>; Thu,  2 Sep 2021 15:35:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F3C6F80125
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="199341880"
X-IronPort-AV: E=Sophos;i="5.84,372,1620716400"; d="scan'208";a="199341880"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 06:35:43 -0700
X-IronPort-AV: E=Sophos;i="5.84,372,1620716400"; d="scan'208";a="467424866"
Received: from leeyapha-desk2.amr.corp.intel.com (HELO [10.251.212.83])
 ([10.251.212.83])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 06:35:39 -0700
Subject: Re: [PATCH 1/2] ASoC: SOF: imx: Add code to manage DSP related clocks
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, devicetree@vger.kernel.org
References: <20210902123216.787025-1-daniel.baluta@oss.nxp.com>
 <20210902123216.787025-2-daniel.baluta@oss.nxp.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Message-ID: <896baddd-5bd7-8f85-91c3-0a4498694d77@linux.intel.com>
Date: Thu, 2 Sep 2021 16:35:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902123216.787025-2-daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, festevam@gmail.com,
 kai.vehmanen@linux.intel.com, Daniel Baluta <daniel.baluta@nxp.com>,
 ranjani.sridharan@linux.intel.com, linux-kernel@vger.kernel.org,
 linux-imx@nxp.com, kernel@pengutronix.de, s-anna@ti.com, shawnguo@kernel.org
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

Hi Daniel,

On 02/09/2021 15:32, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> There are two types of clocks:
> 	* DSP IP clocks
> 	* DAI clocks
> 
> This clocks are necessary in order to power up DSP and DAIs.
> 
> We choose to enable DAI clocks here because of the way i.MX8/i.MX8X
> design handles resources (including clocks).
> 
> All clocks are managed by a separate core (named SCU) which communicates
> with Linux managed ARM core via a well known API.
> 
> We parse and enable the clocks in probe function and disable them in
> remove function.
> 
> Future patches will introduce Power Management support so that we
> disable clocks while DSP is not used or system enters power save.

Unfortunately this patch does not apply to next.

I might be a bit too cautius, but I would also add "&& COMMON_CLK" for 
the COMPILE_TEST in Kconfig or select it from where it is appropriate?

> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>   sound/soc/sof/imx/imx-common.c | 77 ++++++++++++++++++++++++++++++++++
>   sound/soc/sof/imx/imx-common.h | 16 +++++++
>   sound/soc/sof/imx/imx8.c       | 32 ++++++++++++++
>   sound/soc/sof/imx/imx8m.c      | 33 +++++++++++++++
>   4 files changed, 158 insertions(+)
> 
> diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
> index 30624fafc632..482c25ab15ce 100644
> --- a/sound/soc/sof/imx/imx8m.c
> +++ b/sound/soc/sof/imx/imx8m.c
> @@ -23,6 +23,20 @@
>   #define MBOX_OFFSET	0x800000
>   #define MBOX_SIZE	0x1000
>   
> +#define IMX8M_DSP_CLK_NUM	3
> +static const char *imx8m_dsp_clks_names[IMX8M_DSP_CLK_NUM] = {

static const char *imx8m_dsp_clks_names[]

+ ARRAY_SIZE(imx8m_dsp_clks_names) instead IMX8M_DSP_CLK_NUM ?


-- 
Péter
