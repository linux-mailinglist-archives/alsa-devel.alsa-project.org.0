Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAC383CBDA
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jan 2024 20:04:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3BA4850;
	Thu, 25 Jan 2024 20:04:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3BA4850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706209495;
	bh=k4alKl4ZXoowv6FzIFl05GN/hgyHnj+4p9u8hin33Zk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pGY1x+Qdh+OHdmA9SFPS2zz9IZUXbfQaM2f2sV0LsylvAtdIbmZY/V4A8YtrfyteH
	 nyqlrIiNj8jweCyu/VHeJYmNKRnqTQrWolJZCxBEr0oUWTNemL3SENV98ModtJlmad
	 sQ38ypwK9SRhqWC3gRAyTMZ/kK+k6lsqpV5vBxmA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69F03F80587; Thu, 25 Jan 2024 20:04:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BABF8F80587;
	Thu, 25 Jan 2024 20:04:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC43EF8028D; Thu, 25 Jan 2024 20:00:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED42CF800C1
	for <alsa-devel@alsa-project.org>; Thu, 25 Jan 2024 20:00:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED42CF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lwdffbtM
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a2dc7827a97so799120366b.2
        for <alsa-devel@alsa-project.org>;
 Thu, 25 Jan 2024 11:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706209239; x=1706814039;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k4alKl4ZXoowv6FzIFl05GN/hgyHnj+4p9u8hin33Zk=;
        b=lwdffbtMziGyN4LEyUIZsnvm/t9tlFDaL14qhofnnfT7vi6sUzlSCAwMyQcceoG+nO
         fxedMnHP/OP8w5rMyGsXNJJxwQMbnSvaLZ0L3gG5YQk3f+AfydBcKJ1OhAYN3Q1NXkjZ
         JGBfV79SCrgaB1ddWd8rHMbj/sxL+ZIUxzLpGdHgm1jjEodWM2j/W6RzgB8qymlf3bvQ
         O69yDPmKugQQI+MZT2iegV4j17SeHoWA+2rMQOxhJjT8GhszN3wODSQ2tI4Hsuuu8oey
         JwR8wluhDuy1ECLf9cSzwYsnL1g+XS9Lb/l/VP14/YLdEIgL2kKgydlXjytVVH5UqHnm
         ukjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706209239; x=1706814039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4alKl4ZXoowv6FzIFl05GN/hgyHnj+4p9u8hin33Zk=;
        b=mSw2vHylfOTXmmk6YQ6zGbgvMIr6ESL6SIT6I86hCAXjKdtwz3nj9LvMRhXPFS9hby
         8dOUPYPsiXE//KBzwMd5Rfv0HCgZgH0tWiLy7N9kK4DPxeT1qx1UT5v6oOgmUsYOYHpp
         krZjC22bi0oLic4nNnc8ECEyQ5yA/qwS2A3wwTVeKolmGh0ehQEomxamKi5kcgWhQVlt
         HD+NPqW028RGb2FFBOutkqweUYXvUt6eo/iIS2ZmWBwZXmFraY7CuXuxWJKej4uVaY6R
         7a2UGzJRFXoE47Gq+PQ11hz+z7ZJslHSqCTbyZpLd1o/BcPWRBAYukW2xyTK0oX71qG/
         4Sdg==
X-Gm-Message-State: AOJu0YziwxBPS3kzjtV3SGbzpjuNvu0sW4wZKxTs2sBcoVbd+EoEezth
	xJwFx3ZwctOH8mGvi+JW46QsirlQekogetX3Wge9vRMjxHiLBboofQa9tIG8y03UZf4IHxnnms4
	6hK9kR/sNtgWtMpoGlsht9Kh+iLE=
X-Google-Smtp-Source: 
 AGHT+IH8LUXM8+5/hOq34RBERyrCuIHb0Q0VNE8VNaYRCZR0HhtyHp7VfZXdBR+c0W4guh0qyebXkCH2T/7DnipEds0=
X-Received: by 2002:a17:906:b245:b0:a28:fe84:f2c6 with SMTP id
 ce5-20020a170906b24500b00a28fe84f2c6mr30455ejb.15.1706209238613; Thu, 25 Jan
 2024 11:00:38 -0800 (PST)
MIME-Version: 1.0
References: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
 <20240125103117.2622095-4-ckeepax@opensource.cirrus.com>
In-Reply-To: <20240125103117.2622095-4-ckeepax@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 25 Jan 2024 21:00:02 +0200
Message-ID: 
 <CAHp75Vd7CsZAMNKGY=a4+J6Wzb7a6oDa3-coXoDVK8AOgvKHGA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] ASoC: cs42l43: Add pm_ptr around the power ops
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: DI4KD6MIGX5Q5BFWLSGG4OZGXC4AK46Y
X-Message-ID-Hash: DI4KD6MIGX5Q5BFWLSGG4OZGXC4AK46Y
X-MailFrom: andy.shevchenko@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DI4KD6MIGX5Q5BFWLSGG4OZGXC4AK46Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jan 25, 2024 at 12:31=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> Add missing pm_ptr around the power ops.

pm_ptr() (here and in the Subject), but it's a minor one.

--=20
With Best Regards,
Andy Shevchenko
