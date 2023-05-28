Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75545713859
	for <lists+alsa-devel@lfdr.de>; Sun, 28 May 2023 09:30:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B2453E8;
	Sun, 28 May 2023 09:30:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B2453E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685259056;
	bh=aDCF23O+zEtkn9xzYktTwKg53FEanfaaqY8MDg8ZsWA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E8yh89OqjlIJOmyMFIzz44w3spyOZ2jo8dsJYC7Azxiej5bSd/jYvZ472PYVeWLch
	 oC07TODq+Q9AnN6uMC59eHkpUWEd/D13Q0AAYptkuik2/t/k0sK8eFedk4XOw/cpMn
	 /FG5oxp3/rO9528lj4qsq3zvm8gEg9xnhJpbsePA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08B51F8053D; Sun, 28 May 2023 09:29:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFF5BF8026A;
	Sun, 28 May 2023 09:29:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47AB1F8042F; Sun, 28 May 2023 09:27:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr
 [80.12.242.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1B71F80086
	for <alsa-devel@alsa-project.org>; Sun, 28 May 2023 09:27:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1B71F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=MuAsw2s5
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id 3AoGqXVchfPUb3AoGqo1a5; Sun, 28 May 2023 09:27:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1685258851;
	bh=In/HEnJ59JVxAKJendXeaSKCqtakbTMfNFHPW6oXzSM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=MuAsw2s5g/3h7TW9jl01gYvAvWtaOCnzFoiIGGU/C/DRTkFB+d6/erUx5o5JHlnlA
	 TvZe/NaX7goJCkhZWQzjtN1tARwGOu5GRQO7Ycm+CRNGLuAdoryIEwxNs4Az3p8jrn
	 kJR7F05dt0G5xnxPrYfBj5bjB/0dLgrJJinBS2kwmZg/kOcj0VISnLxqXoX8U9AYF1
	 OqBhQ17ffyXg4wE/CvA7viQyeQT8n2ZzudwvlhXnRuQPxQxzNZJGEUFtEfKI6RQmBp
	 CjWYkbfdKouaEVLow/Kg4hcK+sx95c71fGZGF+y4Xq6HyVY2GZoPWZs/1XF+FrcGML
	 ufNkOGwf/F3QQ==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 28 May 2023 09:27:31 +0200
X-ME-IP: 86.243.2.178
Message-ID: <afe12540-0980-f536-996d-28807937f36b@wanadoo.fr>
Date: Sun, 28 May 2023 09:27:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 1/6] ASoC: tas2781: Add Header file for tas2781 driver
To: "13916275206@139.com >> Shenghao Ding" <13916275206@139.com>
Cc: Ryan_Chu@wistron.com, Sam_Wu@wistron.com, alsa-devel@alsa-project.org,
 broonie@kernel.org, devicetree@vger.kernel.org, gentuser@gmail.com,
 kevin-lu@ti.com, krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, navada@ti.com, peeyush@ti.com, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com, robh+dt@kernel.org,
 shenghao-ding@ti.com, tiwai@suse.de, x1077012@ti.com
References: <20230527223439.7741-1-13916275206@139.com>
Content-Language: fr
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230527223439.7741-1-13916275206@139.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q7OCCPKHVLCHQWNVVVOYEIT2QCZX2SSW
X-Message-ID-Hash: Q7OCCPKHVLCHQWNVVVOYEIT2QCZX2SSW
X-MailFrom: christophe.jaillet@wanadoo.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q7OCCPKHVLCHQWNVVVOYEIT2QCZX2SSW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Le 28/05/2023 à 00:34, Shenghao Ding a écrit :
> Create Header file for  tas2781 driver.
> 
> Signed-off-by: Shenghao Ding <13916275206-7R9yAhoRP9E@public.gmane.org>
> 
> ---
> Changes in v4:
>   - correct some enums have capitalized Chn, chn to all
>   Changes to be committed:
> 	new file:   include/sound/tas2781-dsp.h
> 	new file:   include/sound/tas2781-tlv.h
> 	new file:   include/sound/tas2781.h
> ---
>   include/sound/tas2781-dsp.h | 190 ++++++++++++++++++++++++++++++++++++
>   include/sound/tas2781-tlv.h |  22 +++++
>   include/sound/tas2781.h     | 182 ++++++++++++++++++++++++++++++++++
>   3 files changed, 394 insertions(+)
>   create mode 100644 include/sound/tas2781-dsp.h
>   create mode 100644 include/sound/tas2781-tlv.h
>   create mode 100644 include/sound/tas2781.h

[...]

> diff --git a/include/sound/tas2781-tlv.h b/include/sound/tas2781-tlv.h
> new file mode 100644
> index 000000000000..f4310dce655a
> --- /dev/null
> +++ b/include/sound/tas2781-tlv.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +//
> +// ALSA SoC Texas Instruments TAS2781 Audio Smart Amplifier
> +//
> +// Copyright (C) 2022 - 2023 Texas Instruments Incorporated
> +// https://www.ti.com
> +//
> +// The TAS2781 driver implements a flexible and configurable
> +// algo coefficient setting for one, two, or even multiple
> +// TAS2781 chips.
> +//
> +// Author: Shenghao Ding <shenghao-ding-l0cyMroinI0@public.gmane.org>
> +// Author: Kevin Lu <kevin-lu-l0cyMroinI0@public.gmane.org>
> +//
> +
> +#ifndef __TAS2781_TLV_H__
> +#define __TAS2781_TLV_H__
> +
> +static const DECLARE_TLV_DB_SCALE(dvc_tlv, -10000, 100, 0);
> +static const DECLARE_TLV_DB_SCALE(amp_vol_tlv, 1100, 50, 0);
> +
> +#endif /* __TAS2781_LIB_H__ */

Nit: __TAS2781_TLV_H__ (or nothing as in the file above)

> diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
> new file mode 100644
> index 000000000000..399bb8f9b54a
> --- /dev/null
> +++ b/include/sound/tas2781.h
> @@ -0,0 +1,182 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +//
> +// ALSA SoC Texas Instruments TAS2781 Audio Smart Amplifier
> +//
> +// Copyright (C) 2022 - 2023 Texas Instruments Incorporated
> +// https://www.ti.com
> +//
> +// The TAS2781 driver implements a flexible and configurable
> +// algo coefficient setting for one, two, or even multiple
> +// TAS2781 chips.
> +//
> +// Author: Shenghao Ding <shenghao-ding-l0cyMroinI0@public.gmane.org>
> +// Author: Kevin Lu <kevin-lu-l0cyMroinI0@public.gmane.org>
> +//
> +
> +#ifndef __TAS2781_H__
> +#define __TAS2781_H__
> +
> +#include <linux/kernel.h>

I've not chekced in details, but is it really needed?

I've been told once, that we should try to avoid kernel.h in /include/


CJ
