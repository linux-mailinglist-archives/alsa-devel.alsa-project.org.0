Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E50077754C4
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 10:07:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35276829;
	Wed,  9 Aug 2023 10:06:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35276829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691568443;
	bh=7z3zUKHK6KbKc6oMY5+o65USRGtdhLECvICUqwdDCdE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MlsyMgO0y11boT9bnOq/ptadE8JaTCnX1vpdm6HSOpzGnGjO+7nF57EA+tlJJKVBN
	 y9Ef/4KmrjMctYE6OO6Y3ZO7ssdIr0Iw+iTdjBv7gAvOCO76yCsil172TgqBRTW3BF
	 oPpp1c8ycAHI8svfCxmWPAqdHf9v/3ScIbZeXnHI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84125F80549; Wed,  9 Aug 2023 10:06:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E337EF80116;
	Wed,  9 Aug 2023 10:06:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72099F80134; Wed,  9 Aug 2023 10:05:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49A01F800FE
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 10:05:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49A01F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DZ+zv+oL
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-d5f65fc51c6so557702276.0
        for <alsa-devel@alsa-project.org>;
 Wed, 09 Aug 2023 01:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691568346; x=1692173146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7z3zUKHK6KbKc6oMY5+o65USRGtdhLECvICUqwdDCdE=;
        b=DZ+zv+oLEa11NnQdJer4D7OY+A9F70GFZ+YhPxjA4s35LJdjv1sDwHizTyEZd1US41
         KCrEpb/1qod6egGT1QeJCwUM9yjecXtQkeRmao2F18UrCzH5Smjpc/BCxhuCxclIWDPO
         pfDQYsFV/QMUKNtwS9UNqmMJFPK8AjzSrlEgsWECkfaazifgu+cgKKQq7x5hoW9TXm1t
         ivRp4x2lhWFu8XT1QIhv7rZbyA6yHa/tgKXEE0MEvpB0qv2cU6Vzk1DZl/QqgTem9v/y
         QRcGEC1t7q782u4mbSMK2o2qioBFn4hH3XijeeGDeCFhiylhB6ELYpC0M4mAjYptyx8V
         0O6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691568346; x=1692173146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7z3zUKHK6KbKc6oMY5+o65USRGtdhLECvICUqwdDCdE=;
        b=it+weKVe7mlclxKW5JJaqgZRQkn6THh/lP3byeQMkYSFd53aceaIr6xKTZbSoXURvy
         FdyNNH8VFyK1unb19KyIekWg9SZqHlv+p1ysRky7PZeLwpu5w/a4XyyQRuRL5inui89d
         lsbthfPSaZnpbhXZWGrqhnIgUgQ/tzYRTQucsSG3gZb+H5L4KlInEMFVGZWhvbnOKSF4
         BTECd90g3FvsOMRtDGOAFtjCPHT4VS6f2jCAykVa86u/VtSJrBj3MqkrDYnqgio1sfiW
         AB/5ZhYi2acJ8Gyq4GSuptjOGslhATlNNTkwkL8jUTSXG6qw061bGAPh27yIVtAqHRRr
         VCOQ==
X-Gm-Message-State: AOJu0YwISy8iJngQBx94AgwCoOjFYUqFmEUIWYdL4APSf3FC6IN9x+Yu
	hO7+DhlRpcpwFRstODWyisOWFfZXjNYvzobIP19jnA==
X-Google-Smtp-Source: 
 AGHT+IHC3OGVvRMXPoy/ylgdYisdJ1PxdmgNxJAxssRzJ/ZyHdkiFAZS+GoJ8QcD4ZyniKYVzif/aOUTVzcW3eEHZkk=
X-Received: by 2002:a25:c710:0:b0:d3b:e659:5329 with SMTP id
 w16-20020a25c710000000b00d3be6595329mr1889586ybe.9.1691568346061; Wed, 09 Aug
 2023 01:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
 <877cq5b0sx.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877cq5b0sx.wl-kuninori.morimoto.gx@renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Aug 2023 10:05:34 +0200
Message-ID: 
 <CACRpkdZHH96UbJf_ay8ih0WQBiRrqi8hOOQM-HCnVFzZger3+g@mail.gmail.com>
Subject: Re: [PATCH v2 18/39] ASoC: ux500: merge DAI call back functions into
 ops
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: HZ22M4DZDQDGUZZBO7XTVJN7LICTQVYE
X-Message-ID-Hash: HZ22M4DZDQDGUZZBO7XTVJN7LICTQVYE
X-MailFrom: linus.walleij@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HZ22M4DZDQDGUZZBO7XTVJN7LICTQVYE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Aug 9, 2023 at 12:56=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:

> ALSA SoC merges DAI call backs into .ops.
> This patch merge these into one.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
