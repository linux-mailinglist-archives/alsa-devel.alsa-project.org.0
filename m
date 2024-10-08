Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 801DD995184
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2024 16:25:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B75A9F51;
	Tue,  8 Oct 2024 16:24:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B75A9F51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728397509;
	bh=hCLWlw0j3aBtBWIKToAqdb5t72nChThzzCfqeoBaQ1w=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X0/p2GZwoRSEFxsLUL750XlPJWNdIJVTjuBXT7yK9QW29G4IHRLtcyyI41cEcTw4a
	 OvhDahtowqJO66taatvtS6o6/11VTQeyvQz6wM42C7L2rpN1dlHPxc0F+//POXkh53
	 Kpdm6/AW0/Pn0dlkFHgK0TMoNzBZ+7TgBjfG8THM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18A18F80609; Tue,  8 Oct 2024 16:22:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B2D3F805F0;
	Tue,  8 Oct 2024 16:22:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89400F80528; Tue,  8 Oct 2024 05:52:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 752F4F800ED
	for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2024 05:52:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 752F4F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HJ35Z7yT
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37cc60c9838so2891525f8f.1
        for <alsa-devel@alsa-project.org>;
 Mon, 07 Oct 2024 20:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728359572; x=1728964372;
 darn=alsa-project.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElqD9Hm+WZEodZrxK7bnkSFLALYB9eCjiPyOgKg3kGo=;
        b=HJ35Z7yTBXsv3tH6TUJa7HZQQSWbGvOaEe+3zBU57MQRpy6b2aD8FvGAQzfjSIl4oK
         bU5qetZKM3kEdJ4Zh1jY7aQiMRs8NO241p5fRt30C4LIrd3z+4R89pMWp00PaHh6LI9N
         RY5J4zqJWtLrQ9s0ZmPrT1DYgL0Rjeijb/I1IbT1dEjsRYMIKqcJ4HVk1zFvJ6s+6BW/
         yI33NPD5UCfOe5AUoCY+oWxIxbwsn3AtahAGKnTgjBjnXW54o2JAL/Oxd8r7x50izlfQ
         7JVmNGnddtWnddVLw4faHK9BGEPBY7xPgKuQ0lgEaCksGjiBWMer0H4VwBwxDyYdcN8a
         qGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728359572; x=1728964372;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ElqD9Hm+WZEodZrxK7bnkSFLALYB9eCjiPyOgKg3kGo=;
        b=n3zTY0XMbsjUu83FjsAJvd4smEpfOYkZZ59Q7Xtt+ykl7PAgwI2TEDcS9NaeUtSB0z
         SSx8MtQKiUotzqafYpRg7vavsvm635KDCxjwZprbroBZc+4RnuWxHwm28mJcM7fQrJIx
         xcpZoVls66oBdsYSKZk/ap5dAMAHXIHSwuC+1vcVLxF4TYWODVmFvlneHwT7R2mhlUL0
         DgdqSfk242tfRQ8SfLtI/iHCrEVZJBNGytxn9OwvMvpLO+bCYEBVJ7e+Nautv5D01XX+
         FwTackyt1aeutiV25ctEOhwRfTIBXYKKNF0mDIP1NVhBjmNnclKNIQ+U0fFNChlUyx99
         TYmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUI6NWXWs0owkdr1flBDNI6ugKzhZVs+ZXADQWsWjhMA0Bc/W59/QgK1/1Y82Pkdv1iJJ0koFccDboE@alsa-project.org
X-Gm-Message-State: AOJu0YyBxKCluDHQ2I2toy288JU2ElWZ6egqJSTjSiVjJPwRLCDBUL2z
	auHSYzU1/W2WdSs/Npb2cZHf7Co5KULc/e7BapAQBioybR6OjZO/FMBthLsDKv8=
X-Google-Smtp-Source: 
 AGHT+IG0BGCL/uld55vxEnmyp6p8cfwtL2b0uOPAyw08t7e4tq0ydjKfo3AyQfjiW9owlo+MdBT4cQ==
X-Received: by 2002:a5d:5105:0:b0:374:d130:a43b with SMTP id
 ffacd0b85a97d-37d291a9ccdmr959081f8f.4.1728359571913;
        Mon, 07 Oct 2024 20:52:51 -0700 (PDT)
Received: from localhost ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d16972b97sm6973289f8f.99.2024.10.07.20.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 20:52:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Oct 2024 04:52:50 +0100
Message-Id: <D4Q4C17E1A8J.3O1CD1PDP51HH@linaro.org>
Cc: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
 <kernel@quicinc.com>, "Rohit kumar" <quic_rohkumar@quicinc.com>
Subject: Re: [PATCH v1] ASoC: codecs: lpass-macro: Add support for channel
 map mixer control
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Mohammad Rafi Shaik" <quic_mohs@quicinc.com>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Srinivas Kandagatla"
 <srinivas.kandagatla@linaro.org>
X-Mailer: aerc 0.18.2
References: <20240930053111.3986838-1-quic_mohs@quicinc.com>
In-Reply-To: <20240930053111.3986838-1-quic_mohs@quicinc.com>
X-MailFrom: alexey.klimov@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: R7FZFOMUCJ2UYZ55TNTNSOBGS7H2D4KY
X-Message-ID-Hash: R7FZFOMUCJ2UYZ55TNTNSOBGS7H2D4KY
X-Mailman-Approved-At: Tue, 08 Oct 2024 14:22:07 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R7FZFOMUCJ2UYZ55TNTNSOBGS7H2D4KY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon Sep 30, 2024 at 6:31 AM BST, Mohammad Rafi Shaik wrote:
> From: Rohit kumar <quic_rohkumar@quicinc.com>
>
> Add channel map mixer control for lpass macro codec DAIs.
>
> Signed-off-by: Rohit kumar <quic_rohkumar@quicinc.com>
> Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---

IIUC there was off-the-list discussion about why it is needed.
Could you please elaborate a bit more in the commit message?

> --- a/sound/soc/codecs/lpass-macro-common.c
> +++ b/sound/soc/codecs/lpass-macro-common.c
> @@ -8,12 +8,67 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
> +#include <sound/control.h>
> +#include <sound/pcm.h>
> +#include <sound/soc.h>
> =20
>  #include "lpass-macro-common.h"
> =20
>  static DEFINE_MUTEX(lpass_codec_mutex);
>  static enum lpass_codec_version lpass_codec_version;
> =20
> +static int lpass_macro_chmap_ctl_get(struct snd_kcontrol *kcontrol,
> +				     struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_pcm_chmap *info =3D snd_kcontrol_chip(kcontrol);
> +	struct snd_soc_dai *dai =3D info->private_data;
> +	u32 *chmap_data =3D NULL;

You don't really need to set chmap_data to NULL if you're going to overwrit=
e
it with a kzalloc() call a couple of lines below.

> +	u32 rx_ch_cnt =3D 0;
> +	u32 tx_ch_cnt =3D 0;
> +	u32 rx_ch, tx_ch;
> +
> +	chmap_data =3D kzalloc(sizeof(u32) * 2, GFP_KERNEL);
> +	if (!chmap_data)
> +		return -ENOMEM;
> +

[...]

Thanks,
Alexey


