Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2726A8CE345
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2024 11:21:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAE687F8;
	Fri, 24 May 2024 11:20:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAE687F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716542459;
	bh=S5WIHfo/GVVFuV2a8N3J3V/bskkP4vgyxo9cxv7VQAU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xxy/I1Pv74TdqMKoCBEeGoG5xBBaFBzob42rrlYCj+S4E8wAJxZb2MEDDwTfcidKL
	 gqaM0AvAyK2m7ZHexN12sQOEO1NW8r5YgPpHxhiuWqrhCrhLhhyLgIpW3uFbG9bYSz
	 x5jIxSYn3cOFlcCeRc08IfCwcDEwbg6PTcWiszt0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 040E1F801F5; Fri, 24 May 2024 11:20:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D239F80525;
	Fri, 24 May 2024 11:20:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8ABB2F8020D; Fri, 24 May 2024 11:19:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B5DAF8016B
	for <alsa-devel@alsa-project.org>; Fri, 24 May 2024 11:19:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B5DAF8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Zh91Jd24
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-df4e40a3cb6so3017889276.0
        for <alsa-devel@alsa-project.org>;
 Fri, 24 May 2024 02:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716542369; x=1717147169;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BFC/Wq6r2ZnocxgGVbxbRurbvlwJyoIDrYIsqw3lJqc=;
        b=Zh91Jd24Z9L6IZ0CHJUSZUuhKrVvFohU3mgLZ5U0UclyJkGecvCz4nDjm04bhy03oy
         UaNqio6Ak1sZC+UJ9skMmJko0/+Zt7upyl0w5RzrIUj6DTXz397O/26JOd2trXtpzCMK
         EWE7FBSAYyigq2toUTB3dLO//ciU8QToD+D0xse32L4md3i5SrBN0aaZGwBbzHmdGvzC
         aB2wTLpPEl3y09U7l+QDR2CgCoh7mcDFlT1yiDLmkBPcXYAzwnydgd18MG8IRDgtwBBk
         lFYIdRtlyOJ6NyE0U/SrhwDtWIvosWIHah2jVwXHxuqfd2YW/arhvgnXi7wVO0mKeVRE
         QnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716542369; x=1717147169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BFC/Wq6r2ZnocxgGVbxbRurbvlwJyoIDrYIsqw3lJqc=;
        b=kDZTcvLpEHdovZ4yFCJqXt+VL3acZiXbOyhPZeFDX0D5OEO40BicdpjWXh6uHpbd+E
         +Vwxr8f/3Au0nDUomvkKQFxc0wxVo4MsjmZBvgbTNrX0G5Kksjct13Z0lIyWnDlR+Z/5
         bqCF5NAe0OkCangDi9TxeWlV9b4R3P5O2wxtsce3f0M04AtDs16sVl2uxuODKjrIVmsB
         tgXXUrYUAcogMKM9RyGhrdnJroAvdlaXu7UUeZ/L333P50dHNbVlYqGzAbqCj4PV7YzT
         0wg3m3RL812SnsSYt2TjvDA8vQnEGIrsPQoj/m/IqhGJ2Nx6eq14d0tJQ+zotCC1oUwP
         Qj6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCB6/UFL5XMvLgb+w196TrwZzKLIqg6SR11PUJqJJcp8RhtFbGY6HmrY5WBjKSrqKGVbMervnbYm7VnIY/yEJdvz0+kPNkKC48CA0=
X-Gm-Message-State: AOJu0YxavkRDtndApKivbEvBWeVvvJBfA1XYAu9niNE0epUgvOCLHdPf
	rhttDTyfq2GY/rYkKZQdTZM3rnqMVgpgd9FUmIfcgJp/4henS/YobzotR2gHU+vBKVQNRBq5lSo
	K1kMwR5d3LMSRjWsLkZdl4D3rHlRRV2TbOrshBA==
X-Google-Smtp-Source: 
 AGHT+IHQOGkX6tTv+H0dG9M4HcslJIDthMVJK/fTaxTSoTTh7UEYLllN3SvzcSDRZhpNnspLGW/VvYGgTEt21HlMSwo=
X-Received: by 2002:a25:adc2:0:b0:df7:695a:1cee with SMTP id
 3f1490d57ef6-df77221c3b5mr1532190276.50.1716542369346; Fri, 24 May 2024
 02:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240524035350.3118981-1-quic_mohs@quicinc.com>
 <865adb41-fd27-d303-5f0f-a68a814f41ab@quicinc.com>
In-Reply-To: <865adb41-fd27-d303-5f0f-a68a814f41ab@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 May 2024 12:19:18 +0300
Message-ID: 
 <CAA8EJprDb0fk0G1wrzB99EG=HAm5tw1Mz=mSd5mDMptDOoUb2Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add support for QCM6490 and QCS6490
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_rohkumar@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: KCZOOI5ZOQRR7VTOGQS332LYLTDRN65H
X-Message-ID-Hash: KCZOOI5ZOQRR7VTOGQS332LYLTDRN65H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KCZOOI5ZOQRR7VTOGQS332LYLTDRN65H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 24 May 2024 at 07:06, Mohammad Rafi Shaik <quic_mohs@quicinc.com> wrote:
>
> On 5/24/2024 9:23 AM, Mohammad Rafi Shaik wrote:
> > This patchset adds support for sound card on Qualcomm QCM6490 IDP and
> > QCS6490 RB3Gen2 boards.
>
> Please ignore this abounded patch series. No need for review.

In future please use a logical prefix for the cover letter too. This
helps other developers to understand whether they are interested or
not.

>
> Thanks,
> Rafi.
> >
> > Changes since v1:
> >       - Use existing sc8280xp machine driver instead of separate driver.
> >       - Modify qcs6490 compatible name as qcs6490-rb3gen2.
> >
> > Mohammad Rafi Shaik (2):
> >    ASoC: dt-bindings: qcom,sm8250: Add QCM6490 snd QCS6490 sound card
> >    ASoC: qcom: sc8280xp: Add support for QCM6490 and QCS6490
> >
> >   Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
> >   sound/soc/qcom/sc8280xp.c                                | 2 ++
> >   2 files changed, 4 insertions(+)
> >
>
>


-- 
With best wishes
Dmitry
