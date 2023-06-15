Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7759E731D74
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 18:10:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 962AD836;
	Thu, 15 Jun 2023 18:09:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 962AD836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686845426;
	bh=yKVz/RTAXXjd8RP818E57r6LSIPS1q/cVSZkW9HhAGg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I0QapmH6r2gwvO1jgh0oXEdG+RA/TA+cwQ3jxtKPi/er2klvQi4yKk234h3nn+AH9
	 cRIph1tmxZ6NUVogVQ9Vk/yVkVpQe3BBtctg2dDeFLvDEBYqeKO37nLo1E38iHKyg+
	 fl+5k1E7JdIjVMFM58Qzdo9lfTV+SVlqxUlP97Xs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D95FF80246; Thu, 15 Jun 2023 18:09:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F1E2F80130;
	Thu, 15 Jun 2023 18:09:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83B6CF80155; Thu, 15 Jun 2023 18:09:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41CD2F80093
	for <alsa-devel@alsa-project.org>; Thu, 15 Jun 2023 18:09:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41CD2F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=hH3juqC0
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-760929a1783so345904485a.2
        for <alsa-devel@alsa-project.org>;
 Thu, 15 Jun 2023 09:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686845368; x=1689437368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKVz/RTAXXjd8RP818E57r6LSIPS1q/cVSZkW9HhAGg=;
        b=hH3juqC0OXxTzxcQ4IAU7ms8+4pF03Lo2Vz+zya+7KNRfs+qiTe9FIPMM1f5HbEb5e
         fJdI8GViioXHYDJOxOcZ6EO+oIJVTM/78JbN8kO6MXOHFoJnGkNAHVUzkXPGeaab1H/U
         nrCPvRi76Z37/ru8CtN/X4cn7014B5k9SjM1OSK6iHEtJ2fmqzReB4L9lGQjWn006dlB
         leXpIKyIgVGpjZlnke1ecaf2deciNuisCWHzPkxkiPCLiWjIJOSR6wAwFb48ZzLMFk5u
         gUPumIwEmnK9S8alVP7ArfsqEH5u0vcs8FGQjyFM0HNw3R3sgHLv7scc76dU04abcB/I
         BALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686845368; x=1689437368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yKVz/RTAXXjd8RP818E57r6LSIPS1q/cVSZkW9HhAGg=;
        b=V/5BfRoBgQ2F4lzWzcsTTgZlui3lAQh5I32gLE/HreDoAx4Nj8qtsknttltF8SONPN
         f/nLsk3QdEM1kYOWErymd8IqE2KAOJfDcYdsl34eUQqdgAvDU0Pul+WRvqewQfDoS9Bt
         lzmAc+Fw5oHt9JdsIoWpushYRot+cQ+q8cCCKbOTEvyE8PCpO/T8TorBgUSTyvsn7lRI
         Q1XtDkNv2n3T3ZSnBT6FUoA7w+mosqIY81uyG8j0ogcQFwrcnLUEQMRUjVFjkKrvAK8r
         YAdDkE8U7MMfbkzqtMuMYJbvzJY9d3MUI/3hERuzbf++DpyPIOojwFrGxGIf6m4MLibz
         yY9Q==
X-Gm-Message-State: AC+VfDy6BVKqBxfcpPQ7/AVAy9QH7xF0CtCJuZfyPLwf9D9l0kzo79Bq
	tdSR8gdYECIXpBw55tF4rK/2nHoKfVd9ZVuybhk=
X-Google-Smtp-Source: 
 ACHHUZ7ZwrxrtxBJReWHgNq5/laIrn64aqOWh6CzxudfDcovU5BZSNv/5cXUmDQyFYokHSDYfaa5eh1zV7d0oCC0ON0=
X-Received: by 2002:a05:6214:e4b:b0:629:78ae:80ef with SMTP id
 o11-20020a0562140e4b00b0062978ae80efmr20904575qvc.32.1686845367888; Thu, 15
 Jun 2023 09:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230615152631.224529-1-herve.codina@bootlin.com>
 <20230615152631.224529-8-herve.codina@bootlin.com>
In-Reply-To: <20230615152631.224529-8-herve.codina@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 15 Jun 2023 19:08:51 +0300
Message-ID: 
 <CAHp75VfQNtanhNvUeivHO_rpH0F+csPm6QPyheOV-W8hYkbbMQ@mail.gmail.com>
Subject: Re: [PATCH v5 07/13] minmax: Introduce {min,max}_array()
To: Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: NGF4XN7Y5L5PXV37TXGA5J2A4252JJKA
X-Message-ID-Hash: NGF4XN7Y5L5PXV37TXGA5J2A4252JJKA
X-MailFrom: andy.shevchenko@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NGF4XN7Y5L5PXV37TXGA5J2A4252JJKA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 15, 2023 at 6:26=E2=80=AFPM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> Introduce min_array() (resp max_array()) in order to get the
> minimal (resp maximum) of values present in an array.

Only in the case if you need to send a new version (otherwise a follow
up will be okay)...

...

> + * The first typeof(&(array)[0]) is needed in order to support arrays of=
 both
> + * 'int *buff' and 'int buf[N]' types.

int buff[N] ?

> + * The array can be an array of const items.
> + * typeof() keeps the const qualifier. Use __unconst_typeof() in order t=
o

+ _integer

> + * discard the const qualifier for the __element variable.

--=20
With Best Regards,
Andy Shevchenko
