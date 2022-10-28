Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3541610FFB
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 13:45:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A11D1E77;
	Fri, 28 Oct 2022 13:44:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A11D1E77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666957546;
	bh=1bWiADtDd/t4Z9azXx4wg4Dmo+HQ4lKAycHBBevlklw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pBasfvP8oL5xLuTwIKfLE8gvfq1H5H2vxhx+35lRdCKujfQbaighzKDW2evMrRse7
	 02feAWw7YchKHLpIvyeMnZHPpQilkCbJCxmEuLHDA2Slj4i1K7eZrRcufxngQ4EUCv
	 Mna8MmRLXh1PhbTSEq42FMHEONpC0mY8gr0mzSys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB9C9F80095;
	Fri, 28 Oct 2022 13:44:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9C42F8024C; Fri, 28 Oct 2022 13:44:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_30,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 109A4F80095
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 13:44:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 109A4F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="gFKMATH3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666957488; x=1698493488;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1bWiADtDd/t4Z9azXx4wg4Dmo+HQ4lKAycHBBevlklw=;
 b=gFKMATH383s5N0A/ZM+ElnvtBnbHPs/e8mQ2kq2xuN5SmDW10wCUGqFa
 sy9+xHmpZOFNakwF3onRS/I0PKaZcvDpu5JFuRb9wlTeQoHouHPB2fFy4
 grh4MKByzgwytQiDz0+T1piJGldTxt4XkBhRFgxmDCkS8Tot47v0hz9aI
 Nz5pgDKnQ1XJ/1RnCRl7MRz4zf5Doswsisu3zUhxaBPBSQc5vTm3Ges5p
 bRyN1Q0eZR/ZjV5nsHHgA02avGn+KmAcHizBkDeyWusds6wjPKJ3sAQwd
 giEduSW2T1gk2rPUiT5gioK2U2w06Gh2UOgb9pHJu0j0rveTqFTWCF606 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="306080964"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; d="scan'208";a="306080964"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 04:44:44 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="758056624"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; d="scan'208";a="758056624"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.230])
 ([10.99.249.230])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 04:44:40 -0700
Message-ID: <a7275ee4-c6ec-c0e8-c49d-dec9ca367d9f@linux.intel.com>
Date: Fri, 28 Oct 2022 13:44:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v1 2/2] ASoC: dmic: Add optional dmic selection
Content-Language: en-US
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 linux-kernel@vger.kernel.org
References: <20221028102450.1161382-1-ajye_huang@compal.corp-partner.google.com>
 <20221028102450.1161382-3-ajye_huang@compal.corp-partner.google.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20221028102450.1161382-3-ajye_huang@compal.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, devicetree@vger.kernel.org,
 angelogioacchino.delregno@collabora.corp-partner.google.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
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

On 10/28/2022 12:24 PM, Ajye Huang wrote:
> Having two DMICs, a front DMIC and a rear DMIC,
> but only host audio input AUX port0 is used for these two Dmics.
> A "dmic_sel-gpios" property is used for a mixer control to switch
> the dmic signal source between the Front and Rear Dmic.
> 
> usage: amixer -c0 cset name='Dmic Mux' 'FrontMic'
> usage: amixer -c0 cset name='Dmic Mux' 'RearMic'
> 
> Refer to this one as an example,
> commit 3cfbf07c6d27
> ("ASoC: qcom: sc7180: Modify machine driver for 2mic")
> 
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> ---


I'm very suspicious of this patchset. As it is you add kcontrol which 
won't take effect on most platforms making use of DMIC. It feels to me 
that it is something you want to handle on machine driver side instead.

