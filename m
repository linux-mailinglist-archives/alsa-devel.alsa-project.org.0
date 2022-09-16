Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A73A5BAF3D
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 16:25:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D90DD1ACB;
	Fri, 16 Sep 2022 16:24:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D90DD1ACB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663338342;
	bh=IoMPuMCwvjabVDhEb84AfPRn+hsVrAew00VjwYolvs4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mzEtckZCN8ME1lAxoV1f1OhMGIf+Cfn7nymzL9NfjOYcRmwWPRkFDUbXwMUjKyxn+
	 uYrgsqEPp2Z5XjbomsduEFlqK3Dy9BH42c5TwggLQAznpDz+dyiVIVMSz6pIKJlcN/
	 7J5Hfw8i1VSF66Xkoc1UHNLRYNxkg2BmwlwnXmKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 332B9F80538;
	Fri, 16 Sep 2022 16:24:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC48CF80537; Fri, 16 Sep 2022 16:24:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06, DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D627F8024C
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 16:24:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D627F8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="a2Q65m0J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663338246; x=1694874246;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IoMPuMCwvjabVDhEb84AfPRn+hsVrAew00VjwYolvs4=;
 b=a2Q65m0J5xtoZWdUa8PRLM0gWZeY4MMmCu+2Nl6TitWTvv3MgZN78irI
 ZgVncTLkLVVdRabRqvlzeheldzlal4PfkCZsgn1sykaHYkD+yEHcrYIxC
 kn/A8S+Wj/qe3ldwnBbZ7Y3FK2xIgRwzVgVgkfRk/wIKLYjE5uhyXwoKH
 VGw09kdsRsceI1Amf3AomfDTu2XGW9phD6j4vGLmyPIgJtiALWW6U7vrz
 z3+ZQansugSUAtm5f6PJegmkepP7ZFoSmUohZw7LIEK+agU6A96+/D0pJ
 AZmV6DLjBjHfF0/gc7rf56MxCm+KvuPcla0o4beepAX2R1LWEvcVVWk0B g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="296589147"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="296589147"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 07:24:05 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="650888925"
Received: from kchan21-mobl1.ger.corp.intel.com (HELO [10.252.61.56])
 ([10.252.61.56])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 07:23:59 -0700
Message-ID: <fd74f04a-b4ef-565e-5b1e-a2f901d311a0@linux.intel.com>
Date: Fri, 16 Sep 2022 10:24:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH linux-next] ASoC: Intel: sof_es8336: use function
 devm_kcalloc() instead of devm_kzalloc()
Content-Language: en-US
To: cgel.zte@gmail.com, broonie@kernel.org
References: <20220916062415.153659-1-ye.xingchen@zte.com.cn>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220916062415.153659-1-ye.xingchen@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, cezary.rojewski@intel.com,
 andrey.turkin@gmail.com, kai.vehmanen@linux.intel.com,
 peter.ujfalusi@linux.intel.com, Zeal Robot <zealci@zte.com.cn>, tiwai@suse.com,
 ranjani.sridharan@linux.intel.com, liam.r.girdwood@linux.intel.com,
 muralidhar.reddy@intel.com, ye xingchen <ye.xingchen@zte.com.cn>,
 mchehab@kernel.org, yung-chuan.liao@linux.intel.com,
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



On 9/16/22 08:24, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Use 2-factor multiplication argument form devm_kcalloc() instead
> of devm_kzalloc().
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>


Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


> ---
>  sound/soc/intel/boards/sof_es8336.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
> index 606cc3242a60..fbb42e54947a 100644
> --- a/sound/soc/intel/boards/sof_es8336.c
> +++ b/sound/soc/intel/boards/sof_es8336.c
> @@ -481,9 +481,10 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
>  
>  	/* HDMI */
>  	if (hdmi_num > 0) {
> -		idisp_components = devm_kzalloc(dev,
> -						sizeof(struct snd_soc_dai_link_component) *
> -						hdmi_num, GFP_KERNEL);
> +		idisp_components = devm_kcalloc(dev,
> +						hdmi_num,
> +						sizeof(struct snd_soc_dai_link_component),
> +						GFP_KERNEL);
>  		if (!idisp_components)
>  			goto devm_err;
>  	}
