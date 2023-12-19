Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B04818364
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 09:32:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD55EDF1;
	Tue, 19 Dec 2023 09:32:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD55EDF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702974735;
	bh=i5VFZBXoek/PmoENd13wHvQBkwNetTGq8HZiKbqScho=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oRlVaYWfPruOxMxOzPw0QlXCfoMqsHJm4L/R7NlXhWxzsi4MwrDpD8D2mx/sPemZe
	 JjvjhfrOxlUGiCYwueE9Zcp7oVRUdz7n2K787Vm9J/nY5nGGvpK/jaKBBqhjhxYwNj
	 Ny+gZBmQKJhPPKKik4fZeUlTGiC0nNwynf3h0IUY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45F8FF8057D; Tue, 19 Dec 2023 09:31:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB728F8057A;
	Tue, 19 Dec 2023 09:31:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37653F80425; Tue, 19 Dec 2023 09:31:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8DEE2F800D2
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 09:31:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DEE2F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GLwQ/kNs
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a234dc0984fso265435766b.0
        for <alsa-devel@alsa-project.org>;
 Tue, 19 Dec 2023 00:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702974672; x=1703579472;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5VFZBXoek/PmoENd13wHvQBkwNetTGq8HZiKbqScho=;
        b=GLwQ/kNsZ7b13vkPZycry5zvql3uiszzVDltbHi4jN7jljFQ+dLqkNA7OjLBsrFu2k
         IaBL1Q/appk2PvW+uro0k+KZygNIev8QL8A8+a/vMA5Wl/gVGbhk8s/9JIVuvxNpSnKO
         XvSCdHgg5ZQ/Orx0E66ODuz4fg8ice6scz7y3Y8/emlKzDuBEw6eMawygliZO8OuCu6l
         xjT5UZeeyuI9T6r4P17iiSc8JoQmJiWPv1rz74Inkb591viDVUYUwavYzbNtRp8vmrYa
         +fn9zSfrcuPw9oHmnf5b1DnlNPCGHFkdC2TTmWg6gN31vqBt61G8qxOcFxVuykxzkRyA
         VW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702974672; x=1703579472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5VFZBXoek/PmoENd13wHvQBkwNetTGq8HZiKbqScho=;
        b=pkWPhn5a+x24RLRdkWElNsFNwvtzQ07fYkaq9YNXklc0lGOGgslVOdIkaXPIIFX/m8
         98YH60zSaPpODcqSKLljO1LpUqK3taKfnVL28aZLlnvj51Nd5UobxAtpw0ostc9V5lwL
         uFhl5Fb9IS7F3dGWXs/qDfnX75Y0mA80HieQLhL4NqwFSYyoj0K2htl8Pci//5Dt2qTL
         HU7coAylWhf5gy/VgwATDdfv1yXYMgYVJK+VhCL3meI8KSv+KJNpjOVlFRRqOneUWvz4
         lX7yxkfJdkvkNTe+tXo+Ck2wgwR+HJwtMasvcAhMdHY8pZAo2pG5TROHw+/m/lOoWFh4
         XAVA==
X-Gm-Message-State: AOJu0YxBtIW/EDgYR11KGTY/+OY+ksEylNzhIK5ukz2KHFYzke1kNkIH
	9VU7CZJ5BzJXab6uWk08q+waIRJI3tDDmgF8Rkg=
X-Google-Smtp-Source: 
 AGHT+IER0EeD0F3ccRgxlejZrbYe3okE2GAyGDFMLJmQCmcEpMASztGNOjgzLjUdLJ3YpMtcTgLDZ6UTQoCoNj/9/Fg=
X-Received: by 2002:a17:906:d6:b0:a23:ff8:cda6 with SMTP id
 22-20020a17090600d600b00a230ff8cda6mr4758403eji.75.1702974672002; Tue, 19 Dec
 2023 00:31:12 -0800 (PST)
MIME-Version: 1.0
References: <1702953057-4499-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1702953057-4499-1-git-send-email-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 19 Dec 2023 10:31:00 +0200
Message-ID: 
 <CAEnQRZDHrihcP5TGLWKTYW=C27XSrBis7pLd2nMrQ2byJQhAJg@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl_sai: Fix channel swap issue on i.MX8MP
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: I4J6PX2SENFKKFRWA7IV776FHOMIW5XT
X-Message-ID-Hash: I4J6PX2SENFKKFRWA7IV776FHOMIW5XT
X-MailFrom: daniel.baluta@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I4J6PX2SENFKKFRWA7IV776FHOMIW5XT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Dec 19, 2023 at 5:12=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> When flag mclk_with_tere and mclk_direction_output enabled,
> The SAI transmitter or receiver will be enabled in very early
> stage, that if FSL_SAI_xMR is set by previous case,
> for example previous case is one channel, current case is
> two channels, then current case started with wrong xMR in
> the beginning, then channel swap happen.
>
> The patch is to clear xMR in hw_free() to avoid such
> channel swap issue.
>
> Fixes: 3e4a82612998 ("ASoC: fsl_sai: MCLK bind with TX/RX enable bit")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
