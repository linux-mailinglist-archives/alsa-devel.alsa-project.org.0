Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8F89DA7ED
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2024 13:37:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D44D279F;
	Wed, 27 Nov 2024 13:37:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D44D279F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732711031;
	bh=ovFcfCtAUMuGNlyKXnFXK16nOM5aLWZ0LNzCYWuesUI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fu/XIAXNw6gUeOxe9ex2PKeu866PEH+Q5DSoC2vb2lqs6Z+TE5JgN45J4VRSK52Cb
	 WFVUOCIicm81QObrx+c+4JVQrj21L+LYTRpp4m5beS9cJWhxUnJ0cndPutza/F4uEG
	 X6DAmgJ5/zaLkk2eZ0kIJoUyXdsVlaZzQqh/VJyQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3E3AF8058C; Wed, 27 Nov 2024 13:36:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84DD0F80588;
	Wed, 27 Nov 2024 13:36:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B2AEF80236; Wed, 27 Nov 2024 13:36:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5601F800F0
	for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2024 13:36:31 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D70914A8D;
	Wed, 27 Nov 2024 13:36:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D70914A8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1732710989; bh=Isf08T0SoGvhi10+22gzYCxr6h/uJrrbgDa5UdX+FD4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OWXtCUiqxNsFULe0mtomnD/56UChy6VAJFJsMfCO1VV9oirLiUMTKFQp+8yx58f2N
	 WP0nR5TbIBZ0KHuddKM59P15Pb4wdJnZytcgUuG7jZIwijci60iI/WLSlRawIrxBdr
	 WEXOIrsUNF6Yu24Eu06hglNIB8hrzS/xR6FOgk90=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed, 27 Nov 2024 13:36:12 +0100 (CET)
Message-ID: <a6036171-2dfd-4296-9fe4-242c306e5449@perex.cz>
Date: Wed, 27 Nov 2024 13:36:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: yc: Fix for enabling DMIC on acp6x via _DSD
 entry
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 broonie@kernel.org, alsa-devel@alsa-project.org
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com,
 mario.limonciello@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Tim Crawford <tcrawford@system76.com>,
 =?UTF-8?B?QXR0aWxhIFTFkWvDqXM=?= <attitokes@gmail.com>,
 Techno Mooney <techno.mooney@gmail.com>, Jeremy Soller
 <jeremy@system76.com>, Malcolm Hart <malcolm@5harts.com>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20241127112227.227106-1-venkataprasad.potturu@amd.com>
From: Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <20241127112227.227106-1-venkataprasad.potturu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GC2KZ6R3CA63PHS5WNPXC3O3RRE27KYX
X-Message-ID-Hash: GC2KZ6R3CA63PHS5WNPXC3O3RRE27KYX
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GC2KZ6R3CA63PHS5WNPXC3O3RRE27KYX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27. 11. 24 12:22, Venkata Prasad Potturu wrote:
> Add condition check to register ACP PDM sound card by reading
> _WOV acpi entry.
> 
> Fixes: 5426f506b584 ("ASoC: amd: Add support for enabling DMIC on acp6x via _DSD")
> 
> Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
> ---
>   sound/soc/amd/yc/acp6x-mach.c | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
> index 438865d5e376..c301dac8b979 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -523,8 +523,14 @@ static int acp6x_probe(struct platform_device *pdev)
>   	struct acp6x_pdm *machine = NULL;
>   	struct snd_soc_card *card;
>   	struct acpi_device *adev;
> +	acpi_handle handle;
> +	acpi_integer dmic_status;
>   	int ret;
> +	bool is_dmic_enable, wov_en;
>   
> +	/* IF WOV entry not found, enable dmic based on AcpDmicConnected entry*/
> +	is_dmic_enable = false;
> +	wov_en = true;
>   	/* check the parent device's firmware node has _DSD or not */
>   	adev = ACPI_COMPANION(pdev->dev.parent);
>   	if (adev) {
> @@ -532,9 +538,19 @@ static int acp6x_probe(struct platform_device *pdev)
>   
>   		if (!acpi_dev_get_property(adev, "AcpDmicConnected", ACPI_TYPE_INTEGER, &obj) &&
>   		    obj->integer.value == 1)
> -			platform_set_drvdata(pdev, &acp6x_card);
> +			is_dmic_enable = true;
>   	}
>   
> +	handle = ACPI_HANDLE(pdev->dev.parent);
> +	ret = acpi_evaluate_integer(handle, "_WOV", NULL, &dmic_status);
> +	if (!ACPI_FAILURE(ret))
> +		wov_en = dmic_status;
> +
> +	if (is_dmic_enable && wov_en)
> +		platform_set_drvdata(pdev, &acp6x_card);
> +	else
> +		return 0;

The logic seems wrong. The overrides code bellow won't be executed when ACPI 
_WOV data are not set. I think that it may cause regressions for some BIOS 
versions.

Also, the return code should be probably -ENODEV.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
