Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B4A907181
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 14:38:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93822DF9;
	Thu, 13 Jun 2024 14:37:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93822DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718282289;
	bh=HO+x80vOL45DfnbGDH+HE4l2kGlmP8xcQBK47SIOSDk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KbRqw9goD5yBZhgyvy4Ob6ciQjAB7G+RVUnxK47zGtqrus2LhY316HMUzc/1oG+76
	 X9z+OKK/y9dvwhmGeSa7R0AI+S+u/J+zfBSuktfF31WfmM74xdhC3cRz7A9G3tRtTC
	 PY5CqW5n8lWx9sAplGnEKmW44kQ2Zubq33sTdJDo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F30BF805B2; Thu, 13 Jun 2024 14:37:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CB3DF80587;
	Thu, 13 Jun 2024 14:37:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16490F80580; Thu, 13 Jun 2024 14:37:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D87FF80578
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 14:37:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D87FF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Mf2oJLvy
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-6316253dc52so4046937b3.0
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Jun 2024 05:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718282244; x=1718887044;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lK324ZHK2UbYkaord9YynZkPLQSYfxb5dYuVjUssGuM=;
        b=Mf2oJLvyatWoVOe29+8Hj2NAuif46Cx+66H2S37w+Ve8bKxusyC45dluUtPk47Gtar
         bYFF2ctjZej84dTGX8tKYcTqiJslCqbR0ce/G1PViMwRjRQvLg9HYkEVaPHQtpIEDS8D
         ryXeAauGmbcvBUeJMJ0WeR+IOUf60+YNMKjnEamFITGJGy3kCZikqd59V8STSXLrIBIF
         q15CPnZef88v18uf9GKndcnufYyA3rJVBnY/bzZNQ51raoVqc7Yq+IAvtr9FFxzW182c
         gD6jUNyJ86gzOqweUEOIFrBUnDXi8vSYazUyR6w7HqJF+1Z3m4KlI45hHfNTlAfid/C/
         NmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718282244; x=1718887044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lK324ZHK2UbYkaord9YynZkPLQSYfxb5dYuVjUssGuM=;
        b=LuRHwMJfHE8BVm5BdSYz9BKS9fJXosn31gzF8JHz3YWww7PmKNv77ZiwCL/E5VHJiI
         2NP21Uix3nLpodFXQrPH9aeqNdIKXybCpzbFz+4ttKGuo6M9FlN6UT2/yNX5piz5+P7h
         PULXuSEseTRxk0W3G/oJruPLRVEDcJVpwpPFhXXYJ4ucm8xPik48gxWyq3pTdjVmryAh
         8dY5LG3797Fc1wtv3KXD/gNO9dQUFzHVnzgGABXJdvddKWyWxm41EFCJ0kiUpEyY7vrh
         youBe9gGcWQHjGaPc2FpL9E/JehkUwhEWc/VqVZcQqJZ61OYsUIyRpkFYoy+j3Zq12jh
         y/Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8cPtIwI/wHDEW7Kd/G5D5I5/mq3kx7aiIzKliwjEnck8RF8uj4kx3tVeQv6Vi4nk538aREe2KnA/CZzZq0l8gR8ibMGeB/9ooIIc=
X-Gm-Message-State: AOJu0YxH1JdhYIyRiY939sG/oGEyfT1PiXnt7Z6kkl5vyJQLT4DcgdEb
	YgBN11bHID2REu40OZnOofKwupZmmP5od7rFt9mOnR2U9MZpAlBeiPfppwbVBt8ymE/bSKd50n+
	IWlT999fsVU4/A9zOsz8pYbr9SMv8usm5JlqOlQ==
X-Google-Smtp-Source: 
 AGHT+IHZvUBnLsMhW62XBAnxIb34bbF6VpwyWCJv6bXVbMOYQVTTwWrwK1vnVsv5FrvtFe2dwrIEhVqsavWTdlA/pfI=
X-Received: by 2002:a81:8a42:0:b0:62f:9e2d:3e5d with SMTP id
 00721157ae682-62fbdba5388mr40959977b3.43.1718282243851; Thu, 13 Jun 2024
 05:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240613-q6apm-fixes-v1-1-d88953675ab3@linaro.org>
In-Reply-To: <20240613-q6apm-fixes-v1-1-d88953675ab3@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 15:37:11 +0300
Message-ID: 
 <CAA8EJpq7SN5J8Ye8nGfbJdKAC5Ws61iKMu6QO9ebnRV6q3EVNQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: q6apm-lpass-dai: close graph on prepare errors
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: YE6DXATXEYTIF4YAROCAFPJH45O457TB
X-Message-ID-Hash: YE6DXATXEYTIF4YAROCAFPJH45O457TB
X-MailFrom: dmitry.baryshkov@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YE6DXATXEYTIF4YAROCAFPJH45O457TB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Jun 2024 at 15:13, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> There is an issue around with error handling and graph management with
> the exising code, none of the error paths close the graph, which result in
> leaving the loaded graph in dsp, however the driver thinks otherwise.
>
> This can have a nasty side effect specially when we try to load the same
> graph to dsp, dsp returns error which leaves the board with no sound and
> requires restart.
>
> Fix this by properly closing the graph when we hit errors between
> open and close.
>
> Fixes: 30ad723b93ad ("ASoC: qdsp6: audioreach: add q6apm lpass dai support")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # X13s

> ---
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 32 ++++++++++++++++++++------------
>  1 file changed, 20 insertions(+), 12 deletions(-)

[...]

> ---
> base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0

Note: this didn't go to linux-arm-msm, probably because of the use of
an outdated tree for submission. This commit is v6.10-rc1, it probably
should have been Mark's tree instead or linux-next.

> change-id: 20240613-q6apm-fixes-6a9c84852713
>
> Best regards,
> --
> Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>


-- 
With best wishes
Dmitry
