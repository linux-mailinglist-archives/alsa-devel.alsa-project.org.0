Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 489581036F6
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 10:46:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA2BF16A1;
	Wed, 20 Nov 2019 10:45:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA2BF16A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574243203;
	bh=v/cl8bFD2Alrt8Xm1JikNHeSsvCVMlY0kyHKhZ8Bhos=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BCyKn4VHZek8ubJfr52mqLaOKv9/PtR7yKSUYUgRuZpyymt8gOLIyQUEVgDeTEX17
	 z4Q+FZ17xgklvtKmIwYVRKfDn0Bh5dFWxwo2ahAJTl84jGJriUVh/yz4eSf6l49/OV
	 j1ImHCymvE8YHFfGQkyb1+A2lsCVKIMiaAwz0zi0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1499AF8013F;
	Wed, 20 Nov 2019 10:45:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3154AF8013D; Wed, 20 Nov 2019 10:44:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E53DFF800FF
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 10:44:55 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id B749FA0040;
 Wed, 20 Nov 2019 10:44:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz B749FA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1574243094; bh=co9lAvGS55VrOCqiehvDtojzLe1bgnCbS9EnGzOkV4I=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=D4rPfLgxZYgtKupTIX9anZuLlnIxAXdLSF7SNPgoAHhLKCNW6lWProT7NFoRnVKR6
 pT6UzyD2UUM2Cq2I46ADiceORUaNYUzFxsLe9OZpaPMOCNF9lTi6bnp7e4D7SaRqID
 mIwk7Fv8c7LQZC24bB6KGGX01Ayu+CH3iFC7KMHE=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 20 Nov 2019 10:44:50 +0100 (CET)
To: ALSA development <alsa-devel@alsa-project.org>
References: <20191120072821.6648-1-perex@perex.cz>
 <20191120072821.6648-2-perex@perex.cz>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <e1cad114-6874-3f56-7d31-0434ae6282c5@perex.cz>
Date: Wed, 20 Nov 2019 10:44:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191120072821.6648-2-perex@perex.cz>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2 2/3] ASoC: Intel - use control
 components to describe card config
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

Dne 20. 11. 19 v 8:28 Jaroslav Kysela napsal(a):

> diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c

...

> +	/* register the soc card */
>   	snd_soc_card_set_drvdata(&byt_cht_es8316_card, priv);
>   
>   	ret = devm_snd_soc_register_card(dev, &byt_cht_es8316_card);
>   	if (ret) {
>   		gpiod_put(priv->speaker_en_gpio);
>   		dev_err(dev, "snd_soc_register_card failed: %d\n", ret);
> +
>   		return ret;
>   	}
>   	platform_set_drvdata(pdev, &byt_cht_es8316_card);

Please, remove this extra new line when you apply the patch.

					Thanks,
						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
