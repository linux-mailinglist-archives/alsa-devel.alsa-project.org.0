Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D06BD899BD5
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 13:24:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DEDB2D10;
	Fri,  5 Apr 2024 13:23:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DEDB2D10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712316241;
	bh=qNaZ/Ljr6QC2DNYsYEV3APw00MOZudVAaiM+bryv7FM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XmW7fqDiNlv4zU0R9l12ZXzN6PACE5rmNDQte4+EcxD5K8P14QBrieTmq6YFmI6Z4
	 uo67sWNEz7P80wNxXrOBgiYuu02JJsXsvY5tlOJtei8AWat7np1tzbY/DfgPF8JLDk
	 ddj5M/5AItCB/Q1WASt/zrTFMTnlFP4Fv41wY20I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C09B9F80578; Fri,  5 Apr 2024 13:23:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20736F8016E;
	Fri,  5 Apr 2024 13:23:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B34AF8020D; Fri,  5 Apr 2024 13:23:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55E13F80007
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 13:23:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55E13F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NTZRuGHX
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2a2d248a2e1so1236950a91.0
        for <alsa-devel@alsa-project.org>;
 Fri, 05 Apr 2024 04:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712316198; x=1712920998;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNaZ/Ljr6QC2DNYsYEV3APw00MOZudVAaiM+bryv7FM=;
        b=NTZRuGHXlBB0K57iV7WBwz1tcmaQqq0/4d6iHhO4VNy1YtceV2iUnVf6lnpQfJ5wKS
         FUrxGO9U2G4iTdqjeawgIfZqDzOVw803Vcv2Qbub8g5DMXeLYdnRf/aNRDrzqNmc3X7w
         2s1kTwsJg/GN5z0ikZI6ObqhNC5yL17ZToyH6wvFpxSf8F/A8SD+WHs3qbM/hrKhyOuJ
         lTKjVSMMyQ5iyu9XtFPyQEUW8aTEINekArGY/wPaKlXsid6bDK11ZfAMaD3CZ+ijBYdu
         Th6lEulIT/7wr819bmW5QIQWK8tbUM6ARfzQUO1x7xlyZzBiSHmEpHRAT9v2NBwX9UiT
         ERLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712316198; x=1712920998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNaZ/Ljr6QC2DNYsYEV3APw00MOZudVAaiM+bryv7FM=;
        b=vc5y4MMmomSI9qzin6ElHK4HC0dVoQD8yLX3Wz3cC1HEEGGNEYhNJyyvFrABdKqCE/
         U7E9qUvDirKorV4psANbWObB23fcHR4HPXZ0QTJ37f8zg17Jv9Y3dGzC4GAI4/rPzklU
         JaNiZe/Q2hFVGraThjjCbBXDvNSk11+HQXwGK2cOcYCSZ9gKYivkY/clSifBAK1CmQZs
         p5MznAbWYAJHYq/rr+x1+59UkXOsV17amEENEHPpOh26rGjikGxSlaWYcRruK3ZsKEnF
         sBhrCYIRBbVf/5URjTnFWWNcHx/E4S9VM3HviQwvQ3xn06yLuEdKllq7QQddSdsCSyJC
         uM4w==
X-Gm-Message-State: AOJu0Ywu3XJgkMCqw39Bd9qdHx74C0GVoGJ3pq5KBB39pwYn0I7WtscO
	RDG7obeCjnJqLhMtltxoZwL891AOJh98oitewTApfKI9F2jd0QTM2PEFo2VKYiHdoierCXx3NYX
	tre+GKQP8lk/EiksAOFKfkSgRx8s=
X-Google-Smtp-Source: 
 AGHT+IFUtlRTeX/Z/ireLG6vtDIUcECDstSGFFj0Bj1JaWWkGsRjoqnUaGS3+LWh1lgtAOfA4MdiQrNnWuEjF7UMW30=
X-Received: by 2002:a17:90a:b382:b0:2a2:9d4c:2166 with SMTP id
 e2-20020a17090ab38200b002a29d4c2166mr3162921pjr.4.1712316197906; Fri, 05 Apr
 2024 04:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240401201151.560355-1-oswald.buddenhagen@gmx.de>
In-Reply-To: <20240401201151.560355-1-oswald.buddenhagen@gmx.de>
From: Manuel Lauss <manuel.lauss@gmail.com>
Date: Fri, 5 Apr 2024 13:22:41 +0200
Message-ID: 
 <CAOLZvyGnfGjNA=N30LC+UVt92obOoHQt+bekADey=amKkTr8EQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: au1x: declare that FIFO is reported in frames
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: EECE5ZUKLDVOZ5HANDXZ5GZRMSCAEHXI
X-Message-ID-Hash: EECE5ZUKLDVOZ5HANDXZ5GZRMSCAEHXI
X-MailFrom: manuel.lauss@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EECE5ZUKLDVOZ5HANDXZ5GZRMSCAEHXI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,

On Mon, Apr 1, 2024 at 10:11=E2=80=AFPM Oswald Buddenhagen
<oswald.buddenhagen@gmx.de> wrote:
>
> Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
> ---
>
> Is this right? The comment on the field says "fifo entries of AC97/I2S
> PSC", which doesn't suggest bytes. The data sheet speaks of "words" and
> "byte masks", but without digging into it I can't tell how it would
> behave with different sample widths and channel counts (which the driver
> does not seem to limit _at all_? what am I missing?).

Each fifo entry contains a sample; wordsize is configured in register
0x08[24:21].
The fifo is 16 samples deep, so you can have 8 stereo frames or 16
mono frames queued up.
But the fifo isn't managed by hand, dma transfers are used instead and
the amount
of transmitted bytes is extracted from DMA information, so I think this cha=
nge
is pointless.

Manuel
