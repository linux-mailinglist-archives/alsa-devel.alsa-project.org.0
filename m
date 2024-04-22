Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6EF8AD3F0
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Apr 2024 20:30:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BD4282A;
	Mon, 22 Apr 2024 20:29:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BD4282A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713810608;
	bh=1h+evOSvGtt3s6c9TWnokHAZzgZvlLSU6zNd9yNdKao=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=TCkRstc8BplRFJamSngRTox+LeNYNE+kePZRdxDk4Neyi7PkRb7KCFkcUUBJy6dnc
	 sSe9Vz9yIIRBZWX7mr5TtBrvHU5QQZLBvlGrQ6pdzFZOlX69/mdTH7IkIOVqXPeE0V
	 dHL06rASpkrczYBogEp/RTBnw3LPtlCFPdcmWH88=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70714F8059F; Mon, 22 Apr 2024 20:29:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F258DF8057E;
	Mon, 22 Apr 2024 20:29:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 652DBF80423; Mon, 22 Apr 2024 20:29:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6CC78F8003C
	for <alsa-devel@alsa-project.org>; Mon, 22 Apr 2024 20:29:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CC78F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KD3+ZwW0
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56e6a1edecfso7232230a12.1
        for <alsa-devel@alsa-project.org>;
 Mon, 22 Apr 2024 11:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713810562; x=1714415362;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EAJXw4qL5XqbXKvrSrbOx2i3FY76p5+FoD9qTGn0oV8=;
        b=KD3+ZwW0RdlNpJxBY5Ne5WT+3F1K8eFJgG3Q6hbh7huDqvxjRzYinIHUXtd+031H+g
         T2XjsN4tuYzvzvbVpSIQCF0d8S6yz5RFXHOBaH6gGQr54Cqvfy+QwmsreqbCn5nDvIRO
         wupAhsYV+9hI9CxzVd+u0u91DB32NX3ScVT31HRDhFYh0hR+rU/dobFKhXFD3/410KpF
         i01PzwQn2Hxkvfjs4y3RKyoEfju/p6fz3RWx23NJ4W0+BWCHVRAZLMhnlR5Ll4SkN3Bh
         4xVeSXqeqVv9ZP83uux4/ZO0ez0t9KWB9O/MdNXWRXfBAt3do5Hw50ZwWer1ok2mqFN7
         b/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713810562; x=1714415362;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EAJXw4qL5XqbXKvrSrbOx2i3FY76p5+FoD9qTGn0oV8=;
        b=haEFIZc1unLwrFDgWd0U+C6JoM/tGZE3I5SQ4gSgQ4nQw93rLOa+9MXAA4Nb0jLnvp
         soSP9GIreJZqNu8HkVXmqJg8qVTwUCUkGBhtIEEsh1Dtt7wlAbHGC/vHmWtN7Cv7xlxb
         NPIAnUPln00GOMaqfwxMlWujbPIhsqDv4BD0KSZSM00tYnhMsEIKIe+giAmpRdQ1nzTP
         OuOq2DOXn3igJdp8TMqmhmXQIDuOW2YavHM/fkM0eVKfMEQO/0/LOcWxV/XypP5qcNTu
         LN5ITvhXVf6h1q7i8BNMmwuJwY9LWK5E8Cs22ubUauGD2TpcTt74OOZrV3x1W5Fnqvz1
         aniA==
X-Gm-Message-State: AOJu0Yyq8CgBKcgbHrKDO2LKlHiR3W8i6DFB2wnNvhz3QBbarx4rg+a0
	LFuSgh8zvSdlqcl5HQi86jnvwWECYBUxPux9hj37RrBV5MuF9A+G5CokAUId+nSdGL07qYwsEKI
	oN6kbHqHlhX2dXZ4tN5ngD2W91QdWtFjLcXU=
X-Google-Smtp-Source: 
 AGHT+IExBpcrYZOafU8zzQAOA6YVzRpxMrYLYYLKXykxWpdrHU3QajFE+0l623LymDT51IfBkFUMCZC7EYUmfbObORU=
X-Received: by 2002:a17:906:f8d9:b0:a57:2cef:89c0 with SMTP id
 lh25-20020a170906f8d900b00a572cef89c0mr1505905ejb.67.1713810561714; Mon, 22
 Apr 2024 11:29:21 -0700 (PDT)
MIME-Version: 1.0
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 22 Apr 2024 21:28:45 +0300
Message-ID: 
 <CAHp75Vf36mOsHCMH2bPCew-7e75SjMQVqxKR4CU+BV1oQPiHmA@mail.gmail.com>
Subject: Missed review / mailing list submission?
To: ALSA Development Mailing List <alsa-devel@alsa-project.org>
Cc: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: LFQNJNYUTLXWIDDCKTWBPGU7B54HGI2C
X-Message-ID-Hash: LFQNJNYUTLXWIDDCKTWBPGU7B54HGI2C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LFQNJNYUTLXWIDDCKTWBPGU7B54HGI2C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?h=asoc-6.10&id=710f9a3673d6839c485d6a1cd59a2b5078092d47

I can't find this in the mailing list.
Moreover, it has an obstacle to be applied, i.e. as per
https://elixir.bootlin.com/linux/v6.9-rc5/source/include/linux/gpio.h#L5
the gpio.h must not be included in a new code and brief looking into
that driver shows that legacy APIs are being used without _any_ good
reason.

This has to be fixed (by the author).

-- 
With Best Regards,
Andy Shevchenko
