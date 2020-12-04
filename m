Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB162CEA59
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Dec 2020 09:59:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E6CC16E6;
	Fri,  4 Dec 2020 09:58:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E6CC16E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607072387;
	bh=gPqaIPNl8OK7ElkpG2tf4OoF7m0q96tdpK4KOTWZAXs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bKXwN7evNh0fCe1zPstW+rMtI3C9VXZarl0KOdsRJ1o2XrezLIoqFJ1gV/pue1Lzx
	 cB+bIAdjCxsBiLWPKalvxDAl1keXXxYuu206S/YgIx4buGjxPL6rbJcSb0Jin2b/+R
	 kZeDN67p0Wv+AeQU8rVKGgY3ngfxPpQaS4QhD//Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 296C8F8049C;
	Fri,  4 Dec 2020 09:58:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4F8EF80278; Fri,  4 Dec 2020 09:58:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6B56F800E2
 for <alsa-devel@alsa-project.org>; Fri,  4 Dec 2020 09:57:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6B56F800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Rl9cs+dx"
Received: by mail-il1-x12a.google.com with SMTP id t9so210941ilf.2
 for <alsa-devel@alsa-project.org>; Fri, 04 Dec 2020 00:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XmQjhzYNqgYZKImG2frkG1lyoH5e3l99E8yp4cXqbzc=;
 b=Rl9cs+dxyTbnMogdfA4TKp9g1jJVoy0vyFvk7aco83cP8exhCMI6tOc1Ug/PL50D9Q
 YE9hcHMa+RbKwwGPagyW0FE2TmEg0Y187GgZaSmcTCSQy0ayryDs8jDPubaLM6fg1upw
 YPPP/gtL5NhRuuZw8WL8Vw1J5WcANY2yvSOEbpIzBdZ+1ZE/P7ktp5JZsw/s2eFR3hjF
 AkPqjrI+S/Oc+H/v9TwTOQ/1rxI5s8/l55aH//NlVnvQ7iTtUid2dolKjgJqmvT75vs/
 caDHCTYz3Uyo0dEkunIew7hAgd9k6sdwcvkib3zOZplOYUuMTvrEZ5Sr7GIoIaYxQe3Y
 WTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XmQjhzYNqgYZKImG2frkG1lyoH5e3l99E8yp4cXqbzc=;
 b=csEGG/9AiNRCH0wC4Ei5YmYVMgl5pOHlqPde+gX0pE0xrTGYwWFyYSVzAaH0BuX4/r
 UWeAQeqUAXhi83Fs8jfc9T8dmyihQUzCggBm+Fk/MTtY2qZbp/zRAMXLW7MR2GfeAcqm
 rqa8r3mXltaLuLalyp4lM49OYLNki85iivd2j/JyeStj+smwDGPa14OdQneHHCXBu4I3
 g0r6/DN4r1KuCAzWo3N8K0iuoIXoAXY6y1rB5ZP4jHAHanK2arRT9hA6enmZVPwampnB
 lp7JQWXcdXkqhsQY34WeqWDp0ca3aHadOruqKqT8mknci4iBUjYfBDZiv0UCIcnEvTi+
 LMHg==
X-Gm-Message-State: AOAM5317Kgsq/oAjs3mR9ED90QiW3nJAQdKWsbx2FdWp8PN2iiVJbBBw
 SAgsuiq7PX2sNi3b99f4a9Md/0zumv2tpvGQnQaZdg==
X-Google-Smtp-Source: ABdhPJyfNbyd9YDuWkH1Fb7q5huunpM0zX4sCUACLW6U4Ts+ZB6wLIK6lHlD7+aZFvwwSVYOO3JnVKzPOXx5XyyKywc=
X-Received: by 2002:a92:6403:: with SMTP id y3mr5123195ilb.72.1607072276519;
 Fri, 04 Dec 2020 00:57:56 -0800 (PST)
MIME-Version: 1.0
References: <20201204083624.2711356-1-arnd@kernel.org>
In-Reply-To: <20201204083624.2711356-1-arnd@kernel.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 4 Dec 2020 16:57:45 +0800
Message-ID: <CA+Px+wVYCp=x1_zPkmgd3LLYH=wp1yYHCHZbuT4ecMgPCuYXMA@mail.gmail.com>
Subject: Re: [PATCH] [v2] ASoC: cros_ec_codec: fix uninitialized memory read
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Eric Biggers <ebiggers@google.com>, Takashi Iwai <tiwai@suse.com>,
 Guenter Roeck <groeck@chromium.org>, Mark Brown <broonie@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>, Benson Leung <bleung@chromium.org>,
 Ard Biesheuvel <ardb@kernel.org>, Cheng-Yi Chiang <cychiang@chromium.org>
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

On Fri, Dec 4, 2020 at 4:36 PM Arnd Bergmann <arnd@kernel.org> wrote:
> diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
> index 58894bf47514..6ec673573c70 100644
> --- a/sound/soc/codecs/cros_ec_codec.c
> +++ b/sound/soc/codecs/cros_ec_codec.c
> @@ -348,7 +348,7 @@ static int i2s_rx_event(struct snd_soc_dapm_widget *w,
>         }
>
>         return send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
> -                                   (uint8_t *)&p, sizeof(p), NULL, 0);
> +                                   &p.cmd, sizeof(p.cmd), NULL, 0);
>  }

I would prefer your v1.

Reasons:
1. The change is not just kernel related.
There is a EC (embedded controller) firmware to collaborate with the
code.  The firmware doesn't know the kernel only copies the first byte
of the packet (at least for now).  See
https://chromium.googlesource.com/chromiumos/platform/ec/+/refs/heads/master/common/audio_codec_i2s_rx.c#120.

2. We don't copy partial packets in a EC host command.
IMHO, it is also not a big deal if copying a few unused bytes in the packet.
