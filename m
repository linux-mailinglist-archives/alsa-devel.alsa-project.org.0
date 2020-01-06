Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E15A81315BB
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jan 2020 17:08:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 183171678;
	Mon,  6 Jan 2020 17:07:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 183171678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578326916;
	bh=BkY+c8tbpQ7AktBOvi/CRom5V5QtPqW78pssERfGuQM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CLPHGt1uoGkTgCc3Y+Ta6e9J7lwkXS109MuTGIL8Gv8DDpcRbdq0i2nAVNabv8pZL
	 wJIteAc8cPDWU7EuszIG4LEMzqJtak8mtyHj9coTAUY1jrHvdl3cdWX3FzKHCJIn0T
	 8EkXLEa4kyQXZKvZfcFIkXszcu+FTGsKnjPCtvis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 661D0F80159;
	Mon,  6 Jan 2020 17:06:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8521BF8010C; Mon,  6 Jan 2020 17:06:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC839F8010C
 for <alsa-devel@alsa-project.org>; Mon,  6 Jan 2020 17:06:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC839F8010C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jan 2020 08:06:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,403,1571727600"; d="scan'208";a="216866400"
Received: from cwpinto-mobl.amr.corp.intel.com (HELO [10.252.199.187])
 ([10.252.199.187])
 by fmsmga007.fm.intel.com with ESMTP; 06 Jan 2020 08:06:39 -0800
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20200106113903.279394-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <920b8e1a-e01c-08b4-500a-9983a21fccab@linux.intel.com>
Date: Mon, 6 Jan 2020 08:23:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200106113903.279394-1-hdegoede@redhat.com>
Content-Language: en-US
Cc: russianneuromancer@ya.ru, alsa-devel@alsa-project.org,
 stable@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: bytcht_es8316: Fix Irbis NB41
 netbook quirk
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



On 1/6/20 5:39 AM, Hans de Goede wrote:
> When a quirk for the Irbis NB41 netbook was added, to override the defaults
> for this device, I forgot to add/keep the BYT_CHT_ES8316_SSP0 part of the
> defaults, completely breaking audio on this netbook.
> 
> This commit adds the BYT_CHT_ES8316_SSP0 flag to the Irbis NB41 netbook
> quirk, making audio work again.
> 
> Cc: stable@vger.kernel.org
> Cc: russianneuromancer@ya.ru
> Fixes: aa2ba991c420 ("ASoC: Intel: bytcht_es8316: Add quirk for Irbis NB41 netbook")
> Reported-and-tested-by: russianneuromancer@ya.ru
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/intel/boards/bytcht_es8316.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
> index 46612331f5ea..54e97455d7f6 100644
> --- a/sound/soc/intel/boards/bytcht_es8316.c
> +++ b/sound/soc/intel/boards/bytcht_es8316.c
> @@ -442,7 +442,8 @@ static const struct dmi_system_id byt_cht_es8316_quirk_table[] = {
>   			DMI_MATCH(DMI_SYS_VENDOR, "IRBIS"),
>   			DMI_MATCH(DMI_PRODUCT_NAME, "NB41"),
>   		},
> -		.driver_data = (void *)(BYT_CHT_ES8316_INTMIC_IN2_MAP
> +		.driver_data = (void *)(BYT_CHT_ES8316_SSP0
> +					| BYT_CHT_ES8316_INTMIC_IN2_MAP
>   					| BYT_CHT_ES8316_JD_INVERTED),
>   	},
>   	{	/* Teclast X98 Plus II */
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
