Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEA06D5B1
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2019 22:21:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A6291689;
	Thu, 18 Jul 2019 22:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A6291689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563481269;
	bh=j4SmaTeCpHYjyA3Xcsn+UDwMNp1PPo61Y5eVg66Drrw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dMwYmRLdXLhNFoCj/p0IcpRCHlG7x+BzGh9NvzqqiuIG8o7vF4ZHE+nIiTEELxYGs
	 lA9CGXXPJtQSdrqaF6Rjuhrc9l+Xd36/rkHD1o36Wor/FrAVFpdn7RlMk6iCc+Fe5V
	 m/QIUQQlLZ2W8RxHottOq4Q1etSWoxLwLNG3xCwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA1FBF80362;
	Thu, 18 Jul 2019 22:19:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FFB0F80362; Thu, 18 Jul 2019 22:19:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8057CF8015B
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 22:19:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8057CF8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 13:19:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,279,1559545200"; d="scan'208";a="251925525"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.251.81.172])
 ([10.251.81.172])
 by orsmga001.jf.intel.com with ESMTP; 18 Jul 2019 13:19:10 -0700
To: Daniel Baluta <daniel.baluta@gmail.com>
References: <20190717105635.18514-1-l.stach@pengutronix.de>
 <20190717105635.18514-4-l.stach@pengutronix.de>
 <9ebe242b-ceac-6064-5b8b-698068fa11f0@intel.com>
 <CAEnQRZDk-O9B2iyjO=cnmqff6praf-SqNFsR=SM2Et-5Xxui5Q@mail.gmail.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <a7eabb9d-6600-6b50-3f12-71fe19d971ae@intel.com>
Date: Thu, 18 Jul 2019 22:19:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAEnQRZDk-O9B2iyjO=cnmqff6praf-SqNFsR=SM2Et-5Xxui5Q@mail.gmail.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Angus Ainslie <angus@akkea.ca>,
 Liam Girdwood <lgirdwood@gmail.com>, patchwork-lst@pengutronix.de,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
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

On 2019-07-18 21:22, Daniel Baluta wrote:
> On Thu, Jul 18, 2019 at 10:12 PM Cezary Rojewski
> <cezary.rojewski@intel.com> wrote:
>>
>> On 2019-07-17 12:56, Lucas Stach wrote:
>>>    static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
>>>        .use_imx_pcm = false,
>>> +     .has_version_registers = false,
>>>        .fifo_depth = 32,
>>>    };
>>>
>>>    static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
>>>        .use_imx_pcm = true,
>>> +     .has_version_registers = false,
>>>        .fifo_depth = 32,
>>>    };
>>>
>>> +static const struct fsl_sai_soc_data fsl_sai_imx8m_data = {
>>> +     .use_imx_pcm = true,
>>> +     .has_version_registers = true,
>>> +     .fifo_depth = 128,
>>> +};
>>> +
>>>    static const struct of_device_id fsl_sai_ids[] = {
>>>        { .compatible = "fsl,vf610-sai", .data = &fsl_sai_vf610_data },
>>>        { .compatible = "fsl,imx6sx-sai", .data = &fsl_sai_imx6sx_data },
>>>        { .compatible = "fsl,imx6ul-sai", .data = &fsl_sai_imx6sx_data },
>>> +     { .compatible = "fsl,imx8mq-sai", .data = &fsl_sai_imx8m_data },
>>>        { /* sentinel */ }
>>>    };
>>
> 
> Hi Czarek,
> 
>> These datas are populating quite rapidly. If you're planning for adding
>> more (and/ or appending additional fields), declaring helper macro could
>> prove useful.
> 
> There would be definitely more fields inside *_data structures. Anyhow,
> not sure what do you mean by declaring a helper macro.
> 
> Can you provide an example and how would that be helpful?
> 
> thanks,
> Daniel.
> 

Hello Daniel,

My suggestion was rather straight-forward - examples of such can be 
found in soc-dapm.h header file. Instead of stating everything 
explicitly, there are e.g.: SND_SOC_DAPM_SPK or SND_SOC_DAPM_PGA 
declared to help me out.

Nothing fancy, just space savers if your structs populate like rabbits.

Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
