Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B2920D06D
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 19:36:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EC6A851;
	Mon, 29 Jun 2020 19:35:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EC6A851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593452197;
	bh=jAjpeq9O0V81sAWNaBZ37BJdwjsNSa1TZsUMnTQG+Cw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sim26wETV1RiZEYPCHhBSL/DuEf7G01Xvlp1Ojwmpyu+2hazfLH0X63t1Lu2eWNC0
	 TWcqUiD5aH8kK0mmb6AfOQqd2pI72CxUd+d+EZ9+1FFkFhmitfsj8MCPWPTF2yEG5l
	 J2WiXjS/aqUlTlUxA12szjIg1ri4nF4SE0asXRY4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9C6AF80256;
	Mon, 29 Jun 2020 19:34:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 992A9F80217; Mon, 29 Jun 2020 19:34:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6A86F800BA
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 19:34:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6A86F800BA
IronPort-SDR: 89Htt1YOs9KLtOsQz1Ll3EtnokX5Ur4n2i2/2ffntrSsjFU+XeUQqFDNxKMzdbLsfoNqQ6ZBEr
 s/rKS9BeNcvg==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="147561797"
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; d="scan'208";a="147561797"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2020 10:34:00 -0700
IronPort-SDR: XtbORH+xdr+AuKfzFW62Gyia2Eydvbs4wBa1yt5wkwcsrlPz1KOEjC9bmXc0drLcRgoJS4BSZM
 hNcqOBNP6Ytg==
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; d="scan'208";a="318665313"
Received: from mmmille1-t460s.amr.corp.intel.com (HELO [10.255.230.126])
 ([10.255.230.126])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2020 10:33:59 -0700
Subject: Re: [PATCH 4/6] ASoC: rt5670: Fix dac- and adc- vol-tlv values being
 off by a factor of 10
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20200628155231.71089-1-hdegoede@redhat.com>
 <20200628155231.71089-5-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <fc377733-8db7-3422-65be-d79effaaad77@linux.intel.com>
Date: Mon, 29 Jun 2020 10:10:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200628155231.71089-5-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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



On 6/28/20 10:52 AM, Hans de Goede wrote:
> The adc_vol_tlv volume-control has a range from -17.625 dB to +30 dB,
> not -176.25 dB to + 300 dB. This wrong scale is esp. a problem in userspace

D'oh! nice catch.

> apps which translate the dB scale to a linear scale. With the logarithmic
> dB scale being of by a factor of 10 we loose all precision in the lower
> area of the range when apps translate things to a linear scale.
> 
> E.g. the 0 dB default, which corresponds with a value of 47 of the
> 0 - 127 range for the control, would be shown as 0/100 in alsa-mixer.
> 
> Since the centi-dB values used in the TLV struct cannot represent the
> 0.375 dB step size used by these controls, change the TLV definition
> for them to specify a min and max value instead of min + stepsize.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   sound/soc/codecs/rt5670.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/rt5670.c b/sound/soc/codecs/rt5670.c
> index f21181734170..dfbc0ca38ff7 100644
> --- a/sound/soc/codecs/rt5670.c
> +++ b/sound/soc/codecs/rt5670.c
> @@ -603,9 +603,9 @@ int rt5670_set_jack_detect(struct snd_soc_component *component,
>   EXPORT_SYMBOL_GPL(rt5670_set_jack_detect);
>   
>   static const DECLARE_TLV_DB_SCALE(out_vol_tlv, -4650, 150, 0);
> -static const DECLARE_TLV_DB_SCALE(dac_vol_tlv, -65625, 375, 0);
> +static const DECLARE_TLV_DB_MINMAX(dac_vol_tlv, -6562, 0);
>   static const DECLARE_TLV_DB_SCALE(in_vol_tlv, -3450, 150, 0);
> -static const DECLARE_TLV_DB_SCALE(adc_vol_tlv, -17625, 375, 0);
> +static const DECLARE_TLV_DB_MINMAX(adc_vol_tlv, -1762, 3000);
>   static const DECLARE_TLV_DB_SCALE(adc_bst_tlv, 0, 1200, 0);
>   
>   /* {0, +20, +24, +30, +35, +40, +44, +50, +52} dB */
> 
