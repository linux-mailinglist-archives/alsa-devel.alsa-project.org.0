Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A39639FE
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2019 19:13:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 201191666;
	Tue,  9 Jul 2019 19:12:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 201191666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562692427;
	bh=+pbET3jqyX+IVFeWbBZh+kBX2sPg2NmPmwZlMLZfy9Y=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N2B3fiUbSQ7ooZkcqPxNKHoGSvj7xid7R6+3PNzARo7PevMIE56ccDU3xrPJ3FAjj
	 dhJI3XZrpYWkTEWdZ3XQCa3uIcsbNr4blmKzNnJ9mhf8g1031QIkXHNYpdAvObGFKG
	 YuQAfjyb0s0UwNKQlk4qpEgV8mUlo+0XL6IjMEss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5244F80274;
	Tue,  9 Jul 2019 19:12:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BA06F801A4; Tue,  9 Jul 2019 19:12:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PDS_NO_HELO_DNS,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83E75F801A4
 for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2019 19:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83E75F801A4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="M0HtE2zf"
Received: by mail-wr1-x443.google.com with SMTP id n9so12735518wrr.4
 for <alsa-devel@alsa-project.org>; Tue, 09 Jul 2019 10:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=r2TZxVWcdSd0UfNPfDh/m+C/l5rTSbdoS34pupBC7bs=;
 b=M0HtE2zfXv29HrNHQFh9iKDnPxGnU/7mFdhAvg8FDTh1SJGD9B/hMp31OdZB93aIaU
 emqfkxPYQTW7wLQlvCgeV9QbfH1qj+CwbWAyxD2JIjeo3jjdP0UJnsoiXJFE4nBoHS6o
 jOq6hnoaAKe911oA2m5WqM/DMIoBPmACGSe/rrmS/CZxnNhvhBsQT/xAf0DuALygXDvi
 zJj3UHjqrH5KmK0/hoU+WKTkmE+tirLIyIsxVX33nPvyIiBsvhJrUNHnH2XpFJkRp1hO
 0JFKvGnOACJmzOMd7q7UNFn+L9vv91hTnGfn33FD8Z+FDrXWpDG0h1fWIuiMwZ58vJW7
 sheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=r2TZxVWcdSd0UfNPfDh/m+C/l5rTSbdoS34pupBC7bs=;
 b=hE/2/Wtu7p0bOxdVpimM6xNuiM00VzdsO5KfMUGBkj2vBL0Sk2aPQ5iCkPD0yaUZE3
 fg0K1ydXJT+Lp/qgg/+g1SF0wDLQtIEojz3SXNZ9ty1AVL1Q3w6exZrVeuR8HnQTqV1r
 V3ABLWu42u3UITevp1+pxV1PNGPINSS7BU8L6Z0zd6CEbYBHOR8VU0p8dYicLIcG3UPH
 UDNtJj6+rpws5+Uxst3G7d8wi8b+PVyp7zlL6YlBkG2XWL/SeynTde7TsArcmD2OItJC
 ZdoV5VMUA7EHxnNvU+V0jXxrEyIcp7Rb+r9PR8CGAl7iOZxp2i9hhF6H3SeHWajyO1oS
 gwxg==
X-Gm-Message-State: APjAAAV6DVfhKI0GZDmpHw9KnWJCqZWflhohre1U0wO6Ii7raJC4qylb
 /hmCmGO1gJObif2xEt+v8eU=
X-Google-Smtp-Source: APXvYqwip3fu3f+Qkr4VPHuymeCT3juKyz96VYc1CBJcXVpcUuc0xL3rwMuX2a1JTuZtrZkFim3qKQ==
X-Received: by 2002:adf:f544:: with SMTP id j4mr26518083wrp.150.1562692316597; 
 Tue, 09 Jul 2019 10:11:56 -0700 (PDT)
Received: from localhost.localdomain ([86.124.23.156])
 by smtp.gmail.com with ESMTPSA id s18sm5860606wra.47.2019.07.09.10.11.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 10:11:55 -0700 (PDT)
Message-ID: <7d7073d339c7bfbb0079598d95c4faddbd5b51e4.camel@gmail.com>
From: gabrielcsmo@gmail.com
To: Viorel Suman <viorel.suman@nxp.com>, Daniel Baluta
 <daniel.baluta@nxp.com>,  Irina Patru <ioana-irina.patru@nxp.com>
Date: Tue, 09 Jul 2019 20:11:53 +0300
In-Reply-To: <1562246550.22836.17.camel@nxp.com>
References: <20190704125133.1463-1-ioana-irina.patru@nxp.com>
 <1562246550.22836.17.camel@nxp.com>
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 LnxRevLi <LnxRevLi@nxp.com>
Subject: Re: [alsa-devel] [PATCH] MLK-22197 sound: asoc: add micfil dc
 remover amixer control
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello Irina,

Please see my comments inline.

Best regards,
Cosmin

On Thu, 2019-07-04 at 13:22 +0000, Viorel Suman wrote:
> Hi Irina,
> 
> Some nitpicks inline.
> 
> /Viorel
> 
> On Jo, 2019-07-04 at 12:52 +0000, Irina Patru wrote:
> 
> 
> <snip>
> 
> 
> +static int micfil_put_dc_remover_state(struct snd_kcontrol
> *kcontrol,
> +                                       struct snd_ctl_elem_value
> *ucontrol)
> +{
> +       struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
> +       struct soc_enum *e = (struct soc_enum *)kcontrol-
> >private_value;
> +       struct fsl_micfil *micfil =
> snd_soc_component_get_drvdata(comp);
> +       unsigned int *item = ucontrol->value.enumerated.item;
> +       int val = snd_soc_enum_item_to_val(e, item[0]);
> +       int i = 0, ret = 0;
> +       u32 reg_val = 0;
> +
> +       if (val < 0 || val > 3)

Use defines for constants instead of hardcoded values.

> +               return -1;
> 
> 
> Maybe return -EINVAL here ?
> 
> 
> +       micfil->dc_remover = val;
> +
> +       /* Calculate total value for all channels */
> +       for (i = 0; i < 8; i++)

Same as before. I think you already have MICFIL_NUM_CHANNELS in header.

> +               reg_val |= MICFIL_DC_MODE(val, i);
> +
> +       /* Update DC Remover mode for all channels */
> +       ret = snd_soc_component_update_bits(comp,
> +                                       REG_MICFIL_DC_CTRL,
> +                                       MICFIL_DC_CTRL_MASK,
> +                                       reg_val);

I don't know if there is an updated manual for MICFIL but it would be
nice to have a public link.
Please make sure that this change in the configuration can be done live
witout side-effects. Modifying some of the settings were affecting
performance or functionality and you must use other mechanism for
updating the DC_CTRL if it is the case.
> 
> 
> Please check the description of snd_soc_component_update_bits return
> value:
> ==========
>  * Return: 1 if the operation was successful and the value of the
> register
>  * changed, 0 if the operation was successful, but the value did not
> change.
>  * Returns a negative error code otherwise.
> ==========
> 
> We may need to return a non-zero value in case of error only, ie:
> =============
> if (ret < 0)
> return ret;
> 
> return 0;
> =============
> 
> 
> +       return ret;
> +}
> +
> +static int micfil_get_dc_remover_state(struct snd_kcontrol
> *kcontrol,
> +                                       struct snd_ctl_elem_value
> *ucontrol)
> +{
> +       struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
> +       struct fsl_micfil *micfil =
> snd_soc_component_get_drvdata(comp);
> +
> +       ucontrol->value.enumerated.item[0] = micfil->dc_remover;
> +
> +       return 0;
> +}
> +
> +
>  static int hwvad_put_init_mode(struct snd_kcontrol *kcontrol,
>                                struct snd_ctl_elem_value *ucontrol)
>  {
> @@ -676,6 +731,10 @@ static const struct snd_kcontrol_new
> fsl_micfil_snd_controls[] = {
>         SOC_ENUM_EXT("Clock Source",
>                      fsl_micfil_clk_src_enum,
>                      micfil_get_clk_src, micfil_put_clk_src),
> +       SOC_ENUM_EXT("MICFIL DC Remover Control",
> +                       fsl_micfil_dc_remover_enum,
> +                       micfil_get_dc_remover_state,
> +                       micfil_put_dc_remover_state),
>         {
>                 .iface = SNDRV_CTL_ELEM_IFACE_MIXER,
>                 .name = "HWVAD Input Gain",
> diff --git a/sound/soc/fsl/fsl_micfil.h b/sound/soc/fsl/fsl_micfil.h
> index 792187b717f0..e47dba9b90b8 100644
> --- a/sound/soc/fsl/fsl_micfil.h
> +++ b/sound/soc/fsl/fsl_micfil.h
> @@ -278,6 +278,16 @@
>  #define MICFIL_HWVAD_HPF_102HZ         3
>  #define MICFIL_HWVAD_FRAMET_DEFAULT    10
> 
> +/* MICFIL DC Remover Control Register -- REG_MICFIL_DC_CTRL */
> +#define MICFIL_DC_CTRL_SHIFT           0
> +#define MICFIL_DC_CTRL_MASK                    0xFFFF
> +#define MICFIL_DC_CTRL_WIDTH           2
> +#define MICFIL_DC_CHX_SHIFT(v)         (2 * (v))
> +#define MICFIL_DC_CHX_MASK(v)          ((BIT(MICFIL_DC_CTRL_WIDTH) -
> 1) \
> +                               << MICFIL_DC_CHX_SHIFT(v))
> +#define MICFIL_DC_MODE(v1, v2)         (((v1) <<
> MICFIL_DC_CHX_SHIFT(v2)) \
> +                               & MICFIL_DC_CHX_MASK(v2))
> +
>  /* MICFIL Output Control Register */
>  #define MICFIL_OUTGAIN_CHX_SHIFT(v)    (4 * (v))
> 
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
