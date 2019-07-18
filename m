Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5816D47A
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2019 21:13:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45886168D;
	Thu, 18 Jul 2019 21:12:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45886168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563477189;
	bh=lseYdklqHfH+9+4uewsReTR+Z5SBY/ckgtGYhwD+tJA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tMVGuZmPFSwNw57f8YRzLH/i/sGKya8Zw+hkeu4UD36p3k9oalyTSpCyyQ7uqdZSa
	 FwIn0WI7anjAkma6X/iR+OugTt4/PbiOuVzDM3U7suDr70T7//Zk3CtD/KCrEUnzaj
	 Bt1To+A/bBX77nurNdm3R7UeBkhbXBOWHNNV0ZYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 745CCF80362;
	Thu, 18 Jul 2019 21:11:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0CECF80362; Thu, 18 Jul 2019 21:11:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71BBBF8015B
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 21:11:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71BBBF8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 12:11:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,279,1559545200"; d="scan'208";a="195717804"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.251.81.172])
 ([10.251.81.172])
 by fmsmga002.fm.intel.com with ESMTP; 18 Jul 2019 12:11:14 -0700
To: Lucas Stach <l.stach@pengutronix.de>
References: <20190717105635.18514-1-l.stach@pengutronix.de>
 <20190717105635.18514-4-l.stach@pengutronix.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <9ebe242b-ceac-6064-5b8b-698068fa11f0@intel.com>
Date: Thu, 18 Jul 2019 21:11:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190717105635.18514-4-l.stach@pengutronix.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Angus Ainslie <angus@akkea.ca>,
 Liam Girdwood <lgirdwood@gmail.com>, patchwork-lst@pengutronix.de,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: fsl_sai: add i.MX8M support
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2019-07-17 12:56, Lucas Stach wrote:
>   static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
>   	.use_imx_pcm = false,
> +	.has_version_registers = false,
>   	.fifo_depth = 32,
>   };
>   
>   static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
>   	.use_imx_pcm = true,
> +	.has_version_registers = false,
>   	.fifo_depth = 32,
>   };
>   
> +static const struct fsl_sai_soc_data fsl_sai_imx8m_data = {
> +	.use_imx_pcm = true,
> +	.has_version_registers = true,
> +	.fifo_depth = 128,
> +};
> +
>   static const struct of_device_id fsl_sai_ids[] = {
>   	{ .compatible = "fsl,vf610-sai", .data = &fsl_sai_vf610_data },
>   	{ .compatible = "fsl,imx6sx-sai", .data = &fsl_sai_imx6sx_data },
>   	{ .compatible = "fsl,imx6ul-sai", .data = &fsl_sai_imx6sx_data },
> +	{ .compatible = "fsl,imx8mq-sai", .data = &fsl_sai_imx8m_data },
>   	{ /* sentinel */ }
>   };

These datas are populating quite rapidly. If you're planning for adding 
more (and/ or appending additional fields), declaring helper macro could 
prove useful.

Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
