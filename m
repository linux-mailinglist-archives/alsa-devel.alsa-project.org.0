Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7766998483A
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2024 17:06:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8174B4E;
	Tue, 24 Sep 2024 17:06:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8174B4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727190407;
	bh=WEt4t4OKLC44wD9fFRRRREDLnvhSGokn0SJPbLcxpss=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fxzQV5EsSYN2XjM6jBJUeekdlNPjDl5CEQ+uSNxXpN1OZDuJ6Ukv1Vh3Px1NgGXdB
	 B91Fg1aTa0H4LokvW00mgiutmaeo+nR4y6W+4pD9Dwdm9SAbmahWeaqDpCL6qQ5hs8
	 rWIdhFsnujU36QrBsc9y05SitSv8Y4k67LhwwVyA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81E3FF805AC; Tue, 24 Sep 2024 17:06:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B66CF80518;
	Tue, 24 Sep 2024 17:06:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83060F802DB; Tue, 24 Sep 2024 17:06:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4D57F8010B
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 17:06:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4D57F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dpwp84He
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2f762de00e5so58572341fa.3
        for <alsa-devel@alsa-project.org>;
 Tue, 24 Sep 2024 08:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727190363; x=1727795163;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEt4t4OKLC44wD9fFRRRREDLnvhSGokn0SJPbLcxpss=;
        b=dpwp84HedmKuLI9FyT/UWm00qZ2frZQENqBZrPhruZ3fXL+Tah1hewnV44N/9chvX6
         XuSMZ0K1ATtH4KEWv3eA5KOJL41kfC4EH64i9T4II5Woobd98ZSwxhwvJvokzwXUL1Cj
         r6q1btpAcckUkZIeY33b0UFScqJMAbcWgmox8RaOt36SOC48FAFsIR7fEyEWyZAeuud+
         nS7Qk6XUVuGJtBugZYJ1f+XX+Mc3hlVUWwxPfyHUE43l8aZ6AunJL/r7sy16f+9pS8cW
         RlSemFxYi00ZRXxKFXSA/LBthQrubv8ygTD0L0xFbC/HijLgrYfwJsJwrcSVOAUDBZuf
         xxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727190363; x=1727795163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEt4t4OKLC44wD9fFRRRREDLnvhSGokn0SJPbLcxpss=;
        b=ddTm0Vsq7f+rwYoGvfz6shn4izxC1fdstmH3PHYPKMGXsSFcSJcXPzhcasktJary9Z
         A/ieTsdJFpx3kHh9E3L93mbc7hYEIllnrIVHBsVK1pkS33p/yOjhmKYipGsR19aXwU6T
         8zhyloz30ZGucLsKKGcQyBr871R35UtjmSI7PCQoxO9wBD7QM2lUjMVSYiQxUdk1tNBe
         GVEyCG9opwFpujnkrdEzOZGebX2irIZh1/wEtJjPYZkPSSjsQE5Cu9SE+4x1S95Z9sIc
         U6864Ir9j36t/uX+yXEjU6Iadd0sKeuvana5U3LRtdqWHO/okKRzVSr2z/uDTirHpyOd
         zc8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKWLShCure/bGPnryWKkwrXe3b6nT0PtoBT7OoozwvV1uaSO0IxXHVd9EF/Lhhmwhvci/NNp937zAh@alsa-project.org
X-Gm-Message-State: AOJu0YyMjeggKLKU5NlhZjL9NrAKCaRGm8X+5hUCNG6A+EPr71dnT62H
	3awzWBdDpWfoAj4sx7fVxR7yKkSAqQIVxsBOxT6hFbocaeI2YDkdLbxPCAWsk8QEbHDdEKD+yG8
	KiCHXtxCVwVUHk25DS8vq9lvzHNA=
X-Google-Smtp-Source: 
 AGHT+IHJXnBttmZSW+jlVDB4ya7Xha0cvgTxb8sPbFzzC+SpJMt6q1ghM6s3jvwsHh6rzM4yTYmh4kBk3zW7n3O2GmY=
X-Received: by 2002:a2e:4a12:0:b0:2ef:2d3a:e70a with SMTP id
 38308e7fff4ca-2f7cb2f6912mr64838401fa.18.1727190362321; Tue, 24 Sep 2024
 08:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240924-asoc-imx-maple-v1-1-8b993901f71e@kernel.org>
In-Reply-To: <20240924-asoc-imx-maple-v1-1-8b993901f71e@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 24 Sep 2024 12:05:50 -0300
Message-ID: 
 <CAOMZO5DYNK_T4xFBToMK25PuCfns57Cn+z0PoZ-y7pGr=2J=tA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: Use maple tree register cache
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 5YHMC2F6NC6TQ2U6U7LNYRTK4BXQRC3I
X-Message-ID-Hash: 5YHMC2F6NC6TQ2U6U7LNYRTK4BXQRC3I
X-MailFrom: festevam@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5YHMC2F6NC6TQ2U6U7LNYRTK4BXQRC3I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Sep 24, 2024 at 10:58=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> Several of the NXP drivers use regmaps with a rbtree register cache. Sinc=
e
> the maple tree cache is uisng a generally more modern data structure whic=
h

Typo: using.

Reviewed-by: Fabio Estevam <festevam@gmail.com>
