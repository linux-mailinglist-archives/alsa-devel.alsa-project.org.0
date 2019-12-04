Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E710112112
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Dec 2019 02:34:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C94CC1660;
	Wed,  4 Dec 2019 02:33:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C94CC1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575423267;
	bh=N+SOjo12+SYbxOgTNv8NrJzrmNJLIhQsle1CjWqGmvU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d8uMyLJP9VDe/u4ni6iu6Ic9n4sJCFbjL53nWXYQKXHtwsEcfPzsnfhTgz/qPqtot
	 G5OcXV1n5TV2K5jN88Zx68icXRU/YvqKlCC6lNsqSbU1t64rilCusTzzurYdlAlWmK
	 2RgVfl3xEIM+WcRpd909rVs0nXYXodfGOQgyxS2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DC8FF8015A;
	Wed,  4 Dec 2019 02:32:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 412B4F80227; Wed,  4 Dec 2019 02:32:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 534A8F800B4
 for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2019 02:32:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 534A8F800B4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 17:32:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,275,1571727600"; d="scan'208";a="208639690"
Received: from cakumnji-mobl.amr.corp.intel.com (HELO [10.254.102.10])
 ([10.254.102.10])
 by fmsmga008.fm.intel.com with ESMTP; 03 Dec 2019 17:32:34 -0800
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20191203221442.2657-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <988f40c4-04d8-fab2-ff96-5d4a6ba3b383@linux.intel.com>
Date: Tue, 3 Dec 2019 18:36:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191203221442.2657-1-hdegoede@redhat.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: bytcr_rt5640: Update quirk
 for Teclast X89
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



On 12/3/19 4:14 PM, Hans de Goede wrote:
> When the Teclast X89 quirk was added we did not have jack-detection
> support yet.
> 
> Note the over-current detection limit is set to 2mA instead of the usual
> 1.5mA because this tablet tends to give false-positive button-presses
> when it is set to 1.5mA.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks Hans!

> ---
>   sound/soc/intel/boards/bytcr_rt5640.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
> index dd2b5ad08659..243f683bc02a 100644
> --- a/sound/soc/intel/boards/bytcr_rt5640.c
> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
> @@ -707,13 +707,17 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
>   					BYT_RT5640_MCLK_EN),
>   	},
>   	{
> +		/* Teclast X89 */
>   		.matches = {
>   			DMI_MATCH(DMI_BOARD_VENDOR, "TECLAST"),
>   			DMI_MATCH(DMI_BOARD_NAME, "tPAD"),
>   		},
>   		.driver_data = (void *)(BYT_RT5640_IN3_MAP |
> -					BYT_RT5640_MCLK_EN |
> -					BYT_RT5640_SSP0_AIF1),
> +					BYT_RT5640_JD_SRC_JD1_IN4P |
> +					BYT_RT5640_OVCD_TH_2000UA |
> +					BYT_RT5640_OVCD_SF_1P0 |
> +					BYT_RT5640_SSP0_AIF1 |
> +					BYT_RT5640_MCLK_EN),
>   	},
>   	{	/* Toshiba Satellite Click Mini L9W-B */
>   		.matches = {
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
