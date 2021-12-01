Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4394644EE
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 03:34:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C4371690;
	Wed,  1 Dec 2021 03:33:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C4371690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638326051;
	bh=SiTj/8z137Q7irQh3aiFkKAcZaIe74wuvVVrSb46BlQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ILmBA/hT/dMburKfSeJF+epQ+3GmH8TveeKeyG5vA/QUZnIzqoHB6u5N2EFZ7ZnSQ
	 b4R9iDfrVgI0ZM0L/mRXmAtKWh4ct32qoJt8+fzYNo343VDfuKNa3B5fJak43nTB0R
	 8/UvkfWOaWtslyGnftMPi5mmo4e/MPPykNTmQDGI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EDD3F802E0;
	Wed,  1 Dec 2021 03:32:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C04CF802A0; Wed,  1 Dec 2021 03:32:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3ABB2F800EE
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 03:32:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ABB2F800EE
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="236597526"
X-IronPort-AV: E=Sophos;i="5.87,277,1631602800"; d="scan'208";a="236597526"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 18:32:42 -0800
X-IronPort-AV: E=Sophos;i="5.87,277,1631602800"; d="scan'208";a="744974606"
Received: from vschult-mobl1.amr.corp.intel.com (HELO [10.212.122.173])
 ([10.212.122.173])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 18:32:42 -0800
Subject: Re: [PATCH] ALSA: hda: intel-dsp-config: add JasperLake support
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <20211201004628.1153763-1-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4e0ec119-2b15-644d-9cab-b2e19b5c0e48@linux.intel.com>
Date: Tue, 30 Nov 2021 20:32:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211201004628.1153763-1-brent.lu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Hans de Goede <hdegoede@redhat.com>, Bard Liao <bard.liao@intel.com>,
 linux-kernel@vger.kernel.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
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



On 11/30/21 6:46 PM, Brent Lu wrote:
> Add rules to select SOF driver for Jasper Lake systems if digital
> microphone is present or the system is a Chromebook.

Thanks Brent, yes this is an oversight, we should have added this a long
time ago.

I don't think however that this will apply on Takashi's for-next branch,
it'll conflict with the ALSA: intel-dsp-config: add quirk for JSL
devices based on ES8336 codec

+/* JasperLake */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_JASPERLAKE)
+	{
+		.flags = FLAG_SOF,
+		.device = 0x4dc8,
+		.codec_hid = "ESSX8336",
+	},
+#endif

Do you mind rebasing and resending the update? Let's keep the ESS stuff
last as done in other platforms, and add your changes on top of this.

Thanks!

> 
> Signed-off-by: Brent Lu <brent.lu@intel.com>
> ---
>  sound/hda/intel-dsp-config.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
> index b9ac9e9e45a4..be47a1ca12b6 100644
> --- a/sound/hda/intel-dsp-config.c
> +++ b/sound/hda/intel-dsp-config.c
> @@ -299,6 +299,27 @@ static const struct config_entry config_table[] = {
>  	},
>  #endif
>  
> +/* Jasper Lake */
> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_JASPERLAKE)
> +	{
> +		.flags = FLAG_SOF,
> +		.device = 0x4dc8,
> +		.dmi_table = (const struct dmi_system_id []) {
> +			{
> +				.ident = "Google Chromebooks",
> +				.matches = {
> +					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
> +				}
> +			},
> +			{}
> +		}
> +	},
> +	{
> +		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
> +		.device = 0x4dc8,
> +	},
> +#endif
> +
>  /* Tigerlake */
>  #if IS_ENABLED(CONFIG_SND_SOC_SOF_TIGERLAKE)
>  	{
> 
