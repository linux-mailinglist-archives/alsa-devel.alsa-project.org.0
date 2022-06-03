Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEC653CD71
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 18:45:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C83AC185B;
	Fri,  3 Jun 2022 18:44:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C83AC185B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654274735;
	bh=f/Cc7sfTxvocP+SH0XHZEPEtWLZ45J7whWONN0hiMns=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ky6HKDNCj3FXNtN+OPsI206mtf4GFLzc7Wj9nraa9tYbnrRr1wZmaYa4AdeXFxEYQ
	 8OkPuaQ/fG8fFvDF8WUW1wh2fqZ8n13UpGmzPFw1ywx+bzwpaU11ygCvdJ2dTG27Ah
	 n/90Q3spddoOHMOdxN4aF7HYt3MbPCLD+96VdcIw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4892CF804C1;
	Fri,  3 Jun 2022 18:44:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E132F804CC; Fri,  3 Jun 2022 18:44:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0572F800F5
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 18:44:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0572F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="aZlpQAhe"
Received: by mail-ej1-x62e.google.com with SMTP id s6so5454720eja.0
 for <alsa-devel@alsa-project.org>; Fri, 03 Jun 2022 09:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G8r/Lq2iH7lYUmC0qatILVQgk9vw3F/w16dF324mtWQ=;
 b=aZlpQAhecEI0B2kIC13P6x5Zi7SorObmX+eb4jK0LAIcvjFVxb0rxdh8NWqIqMSb7C
 Cfi4cEWw9aU39jvI2EkYKPTIqnlf8v2wWuanJWLAdi8Qmt7BGJMMLaktaKXmXK68JJRn
 bVI93mA/fdSToI5gpY/F2yumxShwPXRk5yjhc/qrABZmgOCPzaEeZv8FA6SYeLNPf4DU
 VZUBPgyyucalsVPqbohS5zxrscV8lzfGHitArpA+xclaMvrOYh1VW1QzzJRT/r4cwQbh
 +tzPOLZq7bDdKrXfbELBNy688C6F95mG2j6aIbAvBDK7BmdbMaWS790KVvPP6pUOgSAq
 sxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G8r/Lq2iH7lYUmC0qatILVQgk9vw3F/w16dF324mtWQ=;
 b=jWktk8eTvtRd0StyMkdRRHbqPw2mY1mHrx6c1vIFFpCMZfuBo5gMcVb6TwyMzto6Ze
 vSbeIQMnuBXFqvFGnu87w/R1FGHl9YwPLxTA50EoJMwANDzihN0mS2Ghgz5Ileu2D/YP
 GiDoV+GDM42KxmQolErf6LYVo7RDfHR51y9MZQjulaiue29gG+FWPoqtN+mCXK3lVXS5
 MfjLbSyjxlRc+EN4tEpvW/HtCBb7gOFROlFpkpbN4VqM6vp7YHUfdEhEs9tchXKYFoDe
 bNqS+H4ZB7miYQFyWcdbzF9GjJQWu/RJ8wO98CJbxw/a6QUdgnG/fiXgwvZzNu6QQoMK
 lCog==
X-Gm-Message-State: AOAM530nqjH/tzK85zNYs66PRFUML1IT/ohjlstTEoRc7pmIma3P84av
 oAK0PsZXQRuC4v1Oo9Wgshrr7TbgGHa/xBAfGlFdmQ==
X-Google-Smtp-Source: ABdhPJx7yM9xyk1/nxIev8AjizxzrThcBDzqhNNV9o8uXxQGxlx8Dciv8+BIp9+EOrN+IcDkDlsEmboiXQXOBpz+JKg=
X-Received: by 2002:a17:907:8689:b0:6fe:e525:ea9c with SMTP id
 qa9-20020a170907868900b006fee525ea9cmr9489496ejc.720.1654274666765; Fri, 03
 Jun 2022 09:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220603131043.38907-1-linmq006@gmail.com>
In-Reply-To: <20220603131043.38907-1-linmq006@gmail.com>
From: Guenter Roeck <groeck@google.com>
Date: Fri, 3 Jun 2022 09:44:15 -0700
Message-ID: <CABXOdTdZNBM=RA_72bL8nua=qajRWD3iKEDi3bai+Aghu1ygJQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: cros_ec_codec: Fix refcount leak in
 cros_ec_codec_platform_probe
To: Miaoqian Lin <linmq006@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 chrome-platform@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

On Fri, Jun 3, 2022 at 6:11 AM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> of_parse_phandle() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: b6bc07d4360d ("ASoC: cros_ec_codec: support WoV")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
> changes in v2:
> - update Fixes tag
> v1 Link: https://lore.kernel.org/r/20220602114529.6303-1-linmq006@gmail.com
> ---
>  sound/soc/codecs/cros_ec_codec.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
> index 8b0a9c788a26..11e7b3f6d410 100644
> --- a/sound/soc/codecs/cros_ec_codec.c
> +++ b/sound/soc/codecs/cros_ec_codec.c
> @@ -995,6 +995,7 @@ static int cros_ec_codec_platform_probe(struct platform_device *pdev)
>                         dev_dbg(dev, "ap_shm_phys_addr=%#llx len=%#x\n",
>                                 priv->ap_shm_phys_addr, priv->ap_shm_len);
>                 }
> +               of_node_put(node);
>         }
>  #endif
>
> --
> 2.25.1
>
