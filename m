Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C675A56C7B6
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Jul 2022 09:35:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0818E84D;
	Sat,  9 Jul 2022 09:34:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0818E84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657352111;
	bh=J7kE8Lsb/Mi4hMhKuusXd/r3ZPE62Dx8JDFS/7CxBCI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=St+0Rlikr5OA1+8i2GAFStwypKR6nNRM7MJL/p+zpZxwQo8WoJnh5oS/MB/UIXndP
	 zEznhlNTsc6jbdHIx+nlq5SSpylOV8qFsDonOQylsX1rdE6HtpP/IzGbHxmb2ly2Bg
	 fKTMO8PySvSrYpaoeR6y3UagouFJ7p7enM9N3aOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AC7BF80100;
	Sat,  9 Jul 2022 09:34:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47426F80245; Sat,  9 Jul 2022 09:34:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr
 [80.12.242.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FC96F80100
 for <alsa-devel@alsa-project.org>; Sat,  9 Jul 2022 09:34:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FC96F80100
Received: from [192.168.1.18] ([90.11.190.129]) by smtp.orange.fr with ESMTPA
 id A4yToJjXqN260A4yTo5RSC; Sat, 09 Jul 2022 09:34:01 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 09 Jul 2022 09:34:01 +0200
X-ME-IP: 90.11.190.129
Message-ID: <e2eab942-f122-7e37-e3a3-c8a1e153c91b@wanadoo.fr>
Date: Sat, 9 Jul 2022 09:33:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/3] ASoC: amd: fix for variable set but not used warning
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220707132613.3150931-1-Vijendar.Mukunda@amd.com>
 <20220707132613.3150931-3-Vijendar.Mukunda@amd.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220707132613.3150931-3-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Sunil-kumar.Dommati@amd.com, kernel test robot <lkp@intel.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 amadeuszx.slawinski@linux.intel.com, zhuning@everest-semi.com
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

Le 07/07/2022 à 15:26, Vijendar Mukunda a écrit :
> Fix below kernel warning.
>>>> sound/soc/amd/acp-es8336.c:200:13: warning: variable 'ret' set but
>>>> not used [-Wunused-but-set-variable]
> 

Hi,
this patch, looks odd to me.


> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>   sound/soc/amd/acp-es8336.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
> index 90f4e5809c72..e1479ae684e9 100644
> --- a/sound/soc/amd/acp-es8336.c
> +++ b/sound/soc/amd/acp-es8336.c
> @@ -206,6 +206,8 @@ static int st_es8336_late_probe(struct snd_soc_card *card)
>   		dev_err(card->dev, "can not find codec dev\n");

The next devm_acpi_dev_add_driver_gpios() will fail, should we return 
immediately?

>   
>   	ret = devm_acpi_dev_add_driver_gpios(codec_dev, acpi_es8336_gpios);
> +	if (ret)
> +		dev_warn(card->dev, "Failed to add driver gpios\n");

Should we return immediately?
>   
>   	gpio_pa = gpiod_get_optional(codec_dev, "pa-enable", GPIOD_OUT_LOW);
>   	if (IS_ERR(gpio_pa)) {
> @@ -213,6 +215,7 @@ static int st_es8336_late_probe(struct snd_soc_card *card)
>   				    "could not get pa-enable GPIO\n");
>   		gpiod_put(gpio_pa);
>   		put_device(codec_dev);
> +		return ret;

Here, we return 'ret' which is what is returned by 
devm_acpi_dev_add_driver_gpios(). So there doesn't seem to be a link 
with this block which checks for gpiod_get_optional() errors.

Moreover, returning an error for something that is optional 
(gpiod_get_optional()) looks strange.

Finally, should an error be returned, maybe PTR_ERR(gpio_pa) would be 
better here.


Just my 2c.

CJ

>   	}
>   	return 0;
>   }

