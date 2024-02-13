Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B355852FC6
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 12:44:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3939682B;
	Tue, 13 Feb 2024 12:44:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3939682B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707824662;
	bh=j0EcmW86LVwxDZD8jjvR3IIBsMo9Vd5fN53o5Q4wNco=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BzXPvWyfMn96CRRmPF+NG2aILzee22sRUCAts252MO9Z94WLjxLU6jINNXqfkHDnZ
	 jk9JjbfXKrQgvSExc3kMQ+yzzRcr3a0xOi2+4GXLk1eWup5JkuuY/lexN9fNYRO3nR
	 VAuarfCDavhRlFiead1DBcQcDCbeqcR8XMUbzUfk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A55EF80589; Tue, 13 Feb 2024 12:43:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43B2AF8057C;
	Tue, 13 Feb 2024 12:43:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3477F80238; Tue, 13 Feb 2024 12:43:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4DD56F8015B
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 12:43:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DD56F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=O4esTIaQ
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33b2960ff60so3002896f8f.1
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Feb 2024 03:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707824610;
 x=1708429410; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=E9Sow8wf4cLhsoNjPkxy+Vy7mK54b8EsDuIPycqqMjY=;
        b=O4esTIaQ5kpQpG9b0n0E6zCl/XRLDiXE+Lenq5YL5hE5G8J4utUSX5/oOG15dWDBJJ
         AsxtSHXSeOgIcmnWlpgBkZvSr9PqVaLTSIPEXYVCXA7RDS0onQx/GKJjhjYD8W2lqPlB
         W/rqygB/y7HDsB5CbRBDV0ThLeXTFU10Z6pRYxFzl5pDGbqQk4hMCaXNe8Rx8NJMEsNC
         i75jdLrLlTsc/VYGK6y0iUWUi/0COmubCNgr/XpDEqr9GR/ugup7m+2ygOUSfkLPUt58
         t5sturjOQBMErBfzx3RlsiqlmOsTpQfBPL3ymY8vUqfwpKdrF8dvIupd+m6f4IJQEu14
         fkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707824610; x=1708429410;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9Sow8wf4cLhsoNjPkxy+Vy7mK54b8EsDuIPycqqMjY=;
        b=NsTEUi4ybhcsr75vywGL3VuqtGbyvYI04Wct/jH/e9amNeJpf8XQ7uON3Sap5biNfs
         Vg0nDSUR43ZcWbRXW6GezaASDGpvVpn88tEAJcKn2LZ4rlu8npGAJfW1rfyoybfeeOtx
         gqc7B7G4FRAV5fBrA4IKW6ipVhohFcfZg+CenoG8z1a2DIEap5saCDVPv7M0VkjUuO9K
         Cu4X+l+zucr5yMMGXxJz7enA25gKVOIImVYCHNk+D6A0yVOBDM0LkBiqoMdKouhIvwcw
         LT0ErM34kxt/DLXnYmHEORnlT4RuTdEjovG1eJUucRE88/y4MQosVcEbvplYvjz2hbjj
         ogzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXeHau84rADRTLYPjlg4nuJMgELygncFGmwTvMyRFGcZZSGR7kyDHtQq8JncSFM11S/8/NhFJLjT24wEKCQ+WzzdpGXvQEKEch0sc=
X-Gm-Message-State: AOJu0YwXwBJwEjVyptrIwdqNy59En9YyHP0lTdq9a2N2/MaB6lQfTgKR
	cAAtRbmR9Jiuks7CTJu7rcr4If/Iqwc8OAYQwbyrkgcuA4veK7L5w+Ip2RpoTd0=
X-Google-Smtp-Source: 
 AGHT+IG5/46zhd1eOGmh0ra4YTAm6cqkOsrOZ3nHpxyZmRoQkb4L9iG9KRCKL7XD6RvIzjKFdLIpsQ==
X-Received: by 2002:adf:e501:0:b0:33c:ddf1:4e70 with SMTP id
 j1-20020adfe501000000b0033cddf14e70mr954874wrm.32.1707824610355;
        Tue, 13 Feb 2024 03:43:30 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV7XrcP98bixIaJaWBm55q3RGYgSAE7tBhAYxKCoTsFS3k+4Ze4N9ov5S7jgh/2kJS+irBO7hxgVQEv5sDqQLLxPDbHWC/Gs9TNJlYjDEdufmt8KqWgoLUap5P3RpuWSetm000MWsh8TG+RUnCiXYaeMS5P0KNR3vebzw4AK/Q7JSo2GChThL92QnUXlhhiqm3T+6Rm3bvBKFEBzRlNWsZ+oOtKvz4oZ5nrlk648f3KJ2YpB/AX8hYJ587hDFDHo7r1dZijD51CXUPKlm5Vvhyal5Vcu8pdKF6uRZUApCiCyWoYNna6+r1jeyiDnM+GrXyNfiI2jbQ39aZMPjTPS8Zd3pV6gPE6Q7iU5e+r5dq5ve8rVNhCu75nGRzfJSoMnFhhSRik6L03/9iH7StxCOiMjhlgvJXp0QLxcfnI7mQfyKBVWxmvK2n71BqvpzozyhkCuO8AO5J3tR81TAvxXYjA7ctciW/JxNy+0RD/Pu/DIgB3TrohH6Ieb4EtEjvFx//s0BbxRWmV5YdUNG0mEtgvFkabj7dgVuJmSkIyba37uRJ9Nj4vceMwV61cZXHq4Bloh/1m9MdaDSFr4L6+ysW0lgb2UhEH255fGSjDzoKUuGFhCI24w+H3rJL0zLOVpS/KYYbMSbqL1GxJsA+mmbtlzt0e6TZAQ/d1Iwa3
Received: from localhost ([2a01:e0a:3c5:5fb1:509b:4241:48a3:e3e0])
        by smtp.gmail.com with ESMTPSA id
 m18-20020a5d56d2000000b0033b60bad2fcsm9261852wrw.113.2024.02.13.03.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 03:43:29 -0800 (PST)
References: <20240213101220.459641-1-arnd@kernel.org>
 <1jbk8kk5pk.fsf@starbuckisacylon.baylibre.com>
 <c61d7daf-1b13-4ff8-aeae-7dcd8dd02131@app.fastmail.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Arnd Bergmann <arnd@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] ASoC: meson: add helpers for clk_disable_unprepare
Date: Tue, 13 Feb 2024 12:09:52 +0100
In-reply-to: <c61d7daf-1b13-4ff8-aeae-7dcd8dd02131@app.fastmail.com>
Message-ID: <1j7cj8k2se.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: 6AWBDDAHMOUS24YJF5IRP2YYKTOHRST6
X-Message-ID-Hash: 6AWBDDAHMOUS24YJF5IRP2YYKTOHRST6
X-MailFrom: jbrunet@baylibre.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6AWBDDAHMOUS24YJF5IRP2YYKTOHRST6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue 13 Feb 2024 at 11:52, "Arnd Bergmann" <arnd@arndb.de> wrote:

> On Tue, Feb 13, 2024, at 11:36, Jerome Brunet wrote:
>> On Tue 13 Feb 2024 at 11:11, Arnd Bergmann <arnd@kernel.org> wrote:
>
>> This probably pre-dates the introduction of devm_clk_get_enabled()
>> It would probably be better to use that instead of duplicating helper
>> functions which do the same thing.
>
> Ah, I had not thought of that interface either, so you are probably
> right that this is the best way to do it.
> Can you send a replacement patch then and add my Reported-by?

Sure.

How may I reproduce the problem ?
Just tried with 'Debian clang version 16.0.6 (19)', no warning.

I suppose I need to add something ?

>
> I also sent the same patch for drivers/nvmem/meson-efuse.c, which
> I guess will also need the same treatment. I also checked and saw
> that all three files already had this code in linux-6.0 when
> devm_clk_get_enabled() got added.
>
>> If for any reason it is not possible, a common helper in clk.h would
>> preferable I think.
>
> I can't think of anything that prevents us from using
> devm_clk_get_enabled() here.
>
>     Arnd


-- 
Jerome
