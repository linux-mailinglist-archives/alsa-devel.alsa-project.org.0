Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1C48A3B6C
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Apr 2024 09:17:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4B01279C;
	Sat, 13 Apr 2024 09:16:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4B01279C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712992624;
	bh=o3+z2gjvWYe3ycjNtnxQBlBPcTLvyVZ3uulsKyfAvvQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hp/mFxoZW6ID40COClWSd1K5o6oG+iYxkV15KXu5bE+qRgjgoJxUZhaSTpYPytBGt
	 cxlGQNqw8OAV8XFbrXh5FaEpFEeMR40EbUpsVPIH/tOUYFdPcmWsrMOm9Earv+YUGi
	 aSAm+OS8lLh+8JqUO4lLbJcFfFebVXB6JW/ex/4E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE943F80588; Sat, 13 Apr 2024 09:16:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0451DF8057D;
	Sat, 13 Apr 2024 09:16:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C782F8026D; Sat, 13 Apr 2024 09:14:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07BA2F80130
	for <alsa-devel@alsa-project.org>; Sat, 13 Apr 2024 09:14:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07BA2F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kali.org header.i=@kali.org header.a=rsa-sha256
 header.s=google header.b=UeLkMo3q
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-56e4a148aeeso648418a12.2
        for <alsa-devel@alsa-project.org>;
 Sat, 13 Apr 2024 00:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1712992468; x=1713597268;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HHtPvGouLUwNBinHLkaycjej5YlmhYQaDzE3CvXbqE=;
        b=UeLkMo3qKfC/HCPPaxNrMlY1qfze7yKpCJIeZFdZn+2FDGn3C7W3eaquB749T0YO7l
         emyUuQRrNvfotO3GGduF5ixzNis6Cc04w0/Ijyn2WlB3cCc+SiPZ2bbW0DSYESlcn4GV
         09g/oTwhQNjfvI+WjrAGoJgnLpicQftG3xfL1GF+I1bteLPjhEa/gnVLC/ByAZfpF2aQ
         +IgJpXWUIzYqdbHzut9YByeUvpV7quSKDBtnfpJIfsum5o5TzQB+Ng1kNlT6uYvdL5OJ
         pdNKWxblc4wPE4OWXvDkWOLiXPSd1CN9SBgo3l+Qk6VfKlM9/ISbWGl44Yv+j+Hjq/b8
         j4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712992468; x=1713597268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/HHtPvGouLUwNBinHLkaycjej5YlmhYQaDzE3CvXbqE=;
        b=djg0tWP+2C0+Wl/EI8BPtC+7VekTRAstkEV3wK6gUSuP0TRSiCj7vP32ZQd57KY/K4
         DMT3iU+4XHEdsMLopXjAYtSvnZmudXRzYXama/4/4K8Q+okyG9aK9xdranB1J76hIFPl
         UBbnhtR2+J63g6Ksn3E1Xuws+I6JnWsdEDIqQq7A1uzTLk6GKUdy8i/m+yWApBGGvmmZ
         5bev35HS+LFVoCy6rVJ/pJAbQoa7iuPV3i+O77Gt/xQqRSt2qBKdEeYq3C/0UKs0Iw1U
         USRCYuyR2N6zUzxn8wIAvM80XcqGg0zpMC48Z/nTdj7Q3IxW5h7yKLtYUNrmwdnRKDQe
         /ggQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzhkGmU4m51zfVBibcxDlXLIAcKCBLAKkmDYgfIVdfoJ8Bfop6u1ju7YSt0lajuVKWPmjgyCM1kaMus+QXNgoThMDsaBnZ4Gdf7kw=
X-Gm-Message-State: AOJu0YxXdAJuryEWvR8sfcPRXbQoP2KweXRp7JiQ9F6Ok9+SHXSUmt6p
	jhQ1FXER7NBvlSVJr0pp6hDcpWAsKWOC3Sm3lHyXb8mgZNQA7Ua2/MmZmuXt6wmxenBDgh4fYWM
	7oWsNac+Ic0WOG6aNuPQp5dr8D8vMjxJS8Q5Dqw==
X-Google-Smtp-Source: 
 AGHT+IGjKQPBWk3zY4ooVWSwwjx8svo3iMnk4hrUD8lrSsQHtU9YoU3a9b5yDiFZBd6peTfPY9ZB3ENbAOeulzcfskI=
X-Received: by 2002:a50:8754:0:b0:56e:2a38:1fb3 with SMTP id
 20-20020a508754000000b0056e2a381fb3mr3884604edv.4.1712992467646; Sat, 13 Apr
 2024 00:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240413064225.39643-1-jenneron@postmarketos.org>
 <20240413064225.39643-2-jenneron@postmarketos.org>
In-Reply-To: <20240413064225.39643-2-jenneron@postmarketos.org>
From: Steev Klimaszewski <steev@kali.org>
Date: Sat, 13 Apr 2024 02:14:16 -0500
Message-ID: 
 <CAKXuJqg43-QVWAANyt3_z3fEVrHtXqVuJy5OFNMEZz=STDZQ0A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] soundwire: qcom: disable stop clock on 1.3.0 and
 below
To: Anton Bambura <jenneron@postmarketos.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: UUXTQBT2HLAL2GCVCSAA6N2I7SGIZHHW
X-Message-ID-Hash: UUXTQBT2HLAL2GCVCSAA6N2I7SGIZHHW
X-MailFrom: steev@kali.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UUXTQBT2HLAL2GCVCSAA6N2I7SGIZHHW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thank you!

On Sat, Apr 13, 2024 at 1:43=E2=80=AFAM Anton Bambura <jenneron@postmarketo=
s.org> wrote:
>
> This patch returns back the behavior of disabling stop clock on soundwire
> 1.3.0 and below which seems to have been altered by accident which
> results in broken audio on sdm845 + wcd9340. For example, on AYN Odin and
> Lenovo Yoga C630 devices.
>
> Fixes: 4830bfa2c812 ("soundwire: qcom: set clk stop need reset flag at ru=
ntime")
> Signed-off-by: Anton Bambura <jenneron@postmarketos.org>
> ---
>  drivers/soundwire/qcom.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index a1e2d6c98186..bc03484a28e8 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -628,6 +628,9 @@ static int qcom_swrm_enumerate(struct sdw_bus *bus)
>                         }
>                 }
>
> +               if (ctrl->version <=3D SWRM_VERSION_1_3_0)
> +                       ctrl->clock_stop_not_supported =3D true;
> +
>                 if (!found) {
>                         qcom_swrm_set_slave_dev_num(bus, NULL, i);
>                         sdw_slave_add(bus, &id, NULL);
> --
> 2.43.0
>
>
Tested on the Lenovo Yoga C630
Tested-by: Steev Klimaszewski <steev@kali.org>

-- steev
