Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA2B5AA042
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Sep 2022 21:40:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7CF2161E;
	Thu,  1 Sep 2022 21:39:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7CF2161E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662061227;
	bh=czf+hxpxVjL2zRVTqzVr6h0JvZ3Vy0/hvkIxm79vY9g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gncOvYF1zwMsG/NMSqcUaSZyDReKS4hkwuRI7jNnMZzfvM5IECEu2KSUNUQz6fLtE
	 YJ0kIxV28jms1NA5cGxdUsF5dFhFpz4tYy9If+fA5zmlTvRo5xrf7OT86lNPR/aqsf
	 AwoTGXPm73NKkrcSnmCb8IKQA20qfdk8UyarFHSI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59134F804A9;
	Thu,  1 Sep 2022 21:39:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FB4AF8026D; Thu,  1 Sep 2022 21:39:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED91FF80236
 for <alsa-devel@alsa-project.org>; Thu,  1 Sep 2022 21:39:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED91FF80236
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KOA+pEkU"
Received: by mail-qt1-x834.google.com with SMTP id x5so14290978qtv.9
 for <alsa-devel@alsa-project.org>; Thu, 01 Sep 2022 12:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=caA/FC3GwEIv5k9saHBJim4xjLc8yHfbXgArB9Vpu9o=;
 b=KOA+pEkUTKh6NEiZvW0bhOuMsKMrHRq0GZiZppZfrIzhJJlf/cNhMT5nKA3TMNP8r3
 Wo6rhkS0WvSoCvTy65pQrh2rO+8OEqebCcaPd40uEpi3IO0luDF8LcQ9/0tQ2BqMelYi
 7KKGmUWZbiv3yUcuuoNFr+RhkGCla80rI/V6FLXc2KuqKCeGFT7WsqixGlO6IdDJJCeE
 hPRCBX5Tc3zbkoRnFBueyUKt3BDNeSo7y5IZFPkqhhUWlTe0EZKfzobTpmLOrXExn8Mk
 zK0oQRfAldkCNbAo9cRUG2hIAUFxJRbNQ4uCNeDc6iwrGB7z55hO5EJKxzJF4X8ZJCWO
 kTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=caA/FC3GwEIv5k9saHBJim4xjLc8yHfbXgArB9Vpu9o=;
 b=WlKA1UkI5z0jG7IlcI7C3govhLNJ5V+ETVYUdpnmEdVUKTa/GIRMWt0OEPDqyePnrX
 Rc5lhVtsrnzXMEpzP2R9IleDP07oK1wNf9szy08iy2Fm/DeRZhQqXW6hKREMMGp/Iuna
 ORD2Lbvajy4fAenR5n4QbqnaVvQxCEZxcDwpgS2C3HWytWDQJCJvKgVdi9P/duKjYkmI
 nH3Hy/wBvi91R844jjrK5dpg9LC7NESMPsPn7ldEueFyOQywwha97T1Kx7s5QxYlr/in
 pGVplWPMmz37u41Y3OVj+c3vT8bwt1RbQ355fnShsUp0viOptdlWeuXAa73feqTIIlnD
 u12Q==
X-Gm-Message-State: ACgBeo0h74CloiCCeGjpflRjOS3eIVuMgIFqGHA6cFhki5tWtTOJYeyH
 VSFyw3y/8vw4psM9QmDYdHYweR/aR7KjhcG3bPE=
X-Google-Smtp-Source: AA6agR7ycdrj03TpdN1pNIKGGZ9QWs6zk+zelMKiqHJgiCa6yv0iI9OO+AGRoQEK0SvmHRtqi1edNJROMh8PLIAu4EE=
X-Received: by 2002:ac8:5786:0:b0:343:3051:170d with SMTP id
 v6-20020ac85786000000b003433051170dmr25052426qta.429.1662061156594; Thu, 01
 Sep 2022 12:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220901175022.334824-1-cezary.rojewski@intel.com>
 <20220901175022.334824-3-cezary.rojewski@intel.com>
In-Reply-To: <20220901175022.334824-3-cezary.rojewski@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 1 Sep 2022 22:38:40 +0300
Message-ID: <CAHp75VdVqRyA=J0-HsHtgiAZhd8XxqxmMddTyV2u29TxvV9=Cw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ASoC: SOF: Remove strsplit_u32() and
 tokenize_input()
To: Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Andy Shevchenko <andy@kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Matthew Wilcox <willy@infradead.org>, Takashi Iwai <tiwai@suse.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 amadeuszx.slawinski@linux.intel.com,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Thu, Sep 1, 2022 at 8:40 PM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> Make use of global user input tokenization helper instead of the
> internal one as both serve same purpose. With that, both strsplit_u32()

the same

> and tokenize_input() become unused so remove them.

...

>  #include <linux/debugfs.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/string_helpers.h>

I believe either blank line needs to be here (to split the sound / SOF
group of headers) or this should be put after 'so*'-ones

>  #include <sound/soc.h>
>  #include <sound/sof/header.h>
>  #include "sof-client.h"

...

>         struct sof_probes_priv *priv = cdev->data;
>         struct device *dev = &cdev->auxdev.dev;
>         struct sof_probe_point_desc *desc;
> -       size_t num_tkns, bytes;
> -       u32 *tkns;
> +       size_t bytes;
> +       u32 num_tkns, *tkns;

I would expect a longer line first.

>         int ret, err;

...

With the above addressed
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

-- 
With Best Regards,
Andy Shevchenko
