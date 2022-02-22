Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D1A4BF352
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 09:16:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 814ED1700;
	Tue, 22 Feb 2022 09:16:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 814ED1700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645517811;
	bh=6v4M1DhRwhiCeHCZRoh2DblCzKIY+UXDQEEQewp0jR8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nerS3UMySk4pS9LzT2GTrYA9fFzkg+Hy1WmgEI55OnM3C3bpG7LyfirP9DvQMIH7l
	 mnzL8VopLY64v6enfsSr8NoJ1GSqM0jvgh9+F6tswGQPMYZpH8iMnDmrUQgPS7qCE1
	 GptfcWnKEdHckCyDWMYHWcWHb8AePjLDFD0f8OzE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E07F6F801F5;
	Tue, 22 Feb 2022 09:15:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F6FCF801EC; Tue, 22 Feb 2022 09:15:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AEF8F80118
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 09:15:35 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 525C5A0040;
 Tue, 22 Feb 2022 09:15:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 525C5A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1645517734; bh=sSCPoD/RQHN+SwDKJfGd09BCH/QOzkFeSK7690X41mU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mb3GVzjRlYWtpTwmSQO0FB2KpUBf5GGwYhgajw10onla6aHBl4LOZ0NfgJNLlr2T1
 Gj58DMJ9i+XEYIjwH5KKj3l+12mmCTGKIiVcQfk5knQnbjb1BGQlLTW8mjhlbkcgid
 hVOWY2iEFOWwerYNQPGVdGZr+haXxwsC9+1SRbyQ=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 22 Feb 2022 09:15:23 +0100 (CET)
Message-ID: <4bfa587f-3605-646c-8662-40c561beecc0@perex.cz>
Date: Tue, 22 Feb 2022 09:15:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] ASoC: amd: acp: Change card name for Guybrush Machine
Content-Language: en-US
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220222061128.719400-1-AjitKumar.Pandey@amd.com>
 <20220222061128.719400-2-AjitKumar.Pandey@amd.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20220222061128.719400-2-AjitKumar.Pandey@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 V sujith kumar Reddy <vsujithkumar.reddy@amd.com>, Vijendar.Mukunda@amd.com,
 Alexander.Deucher@amd.com
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

On 22. 02. 22 7:11, Ajit Kumar Pandey wrote:
> Change sound card name for guybrush machine with rt5682 as primary
> codec and rt1019 amp to align with names given in UCM config.

It's a Chrome OS UCM config? I don't have this config in upstream.

> Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
> ---
>   sound/soc/amd/acp/acp-legacy-mach.c | 4 ++--
>   sound/soc/amd/acp/acp-renoir.c      | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/amd/acp/acp-legacy-mach.c b/sound/soc/amd/acp/acp-legacy-mach.c
> index 91140d15691b..50a5aa4d6da9 100644
> --- a/sound/soc/amd/acp/acp-legacy-mach.c
> +++ b/sound/soc/amd/acp/acp-legacy-mach.c
> @@ -96,7 +96,7 @@ static int acp_asoc_probe(struct platform_device *pdev)
>   
>   static const struct platform_device_id board_ids[] = {
>   	{
> -		.name = "rn_rt5682_rt1019",
> +		.name = "acp3xalc56821019",
>   		.driver_data = (kernel_ulong_t)&rt5682_rt1019_data,
>   	},
>   	{ }
> @@ -113,5 +113,5 @@ module_platform_driver(acp_asoc_audio);
>   
>   MODULE_IMPORT_NS(SND_SOC_AMD_MACH);
>   MODULE_DESCRIPTION("ACP chrome audio support");
> -MODULE_ALIAS("platform:rn_rt5682_rt1019");
> +MODULE_ALIAS("platform:acp3xalc56821019");
>   MODULE_LICENSE("GPL v2");
> diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
> index d06ad5ce7fec..b8dc25a1d31d 100644
> --- a/sound/soc/amd/acp/acp-renoir.c
> +++ b/sound/soc/amd/acp/acp-renoir.c
> @@ -47,7 +47,7 @@ static struct snd_soc_acpi_codecs amp_rt1019 = {
>   static struct snd_soc_acpi_mach snd_soc_acpi_amd_acp_machines[] = {
>   	{
>   		.id = "10EC5682",
> -		.drv_name = "rn_rt5682_rt1019",
> +		.drv_name = "acp3xalc56821019",

I find this naming cryptic. Also, we have other ways to identify the exact 
driver / hardware configuration. It may make sense to have one driver name 
(like amd-acp3x) and use the sound card components to refine the hardware 
configuration for the user space. Your way will introduce a lot of new drivers.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
