Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5202568D2CB
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Feb 2023 10:29:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA5681E4;
	Tue,  7 Feb 2023 10:28:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA5681E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675762161;
	bh=I7MtDEEjwHi5gNt9XKdtGnCjsQA/TswlthJwfeYwXIo=;
	h=References:From:To:Subject:Date:In-reply-to:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=D1mvQvR2h5YNq+oj6DSrHLSyJkVhPcN1IHb8WMgCusccUO724ctTKTlQOY9FeU5yu
	 D8urehnx1Pd8nfRH5JJMZIOJhRWbBY3GYDcpHRMxMPngPxZL0vMbsksTLx37qN0HMR
	 uoWWE/VVpfdVBvNX1HUjlHdqOBpuP2BJokySKidE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E700CF804AA;
	Tue,  7 Feb 2023 10:28:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D118EF8045D; Tue,  7 Feb 2023 10:28:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56045F8014E
 for <alsa-devel@alsa-project.org>; Tue,  7 Feb 2023 10:28:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56045F8014E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=4wSdJscR
Received: by mail-wm1-x32f.google.com with SMTP id z13so3083897wmp.2
 for <alsa-devel@alsa-project.org>; Tue, 07 Feb 2023 01:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
 bh=fcYMfFwrBDTiSgS1D5DQQyLqrqb91363x879A7vfPTI=;
 b=4wSdJscR7Zrk8CAATrkQ6roeRKQbEaEYZEEjsnESE9d7B7zDy6RoXwXDby6Q47+TKt
 +nX68CtmYqeCyNvEk26+QggvPF/niThLCzBwilyca0CQEEYXSgdRTTuuJnE8XXOFFJUD
 B7jH1Em2tmXHTkDoNcV44i3msTPv5oA+kwk+JCS9Ttxuc8rF7SD+0qVgnG1KAI6GBKUv
 hYR9eWe4LgEp/lqIJvrXaBFsPQV6/x3Ks9pM1jSxgr9yRjnVlWLwOQuBu3hnXnMzdo+x
 qhW4n/+a6Ms8E6Ts1CM6ziW9V3o8rc9zYj0uSfFv5awl7Gh8xEAIAfk/PCdaOZ5CeRjS
 cEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fcYMfFwrBDTiSgS1D5DQQyLqrqb91363x879A7vfPTI=;
 b=Ggzijp9SJEY0X3BcceJ+BgV79HLOeITG++GIojg5kFZUwNWQ+mGNYvnba0L+TIEv+j
 o2/BFtsbDW8T7ScftcXn0f4gHvjAnu2x61aePhwKk8ymxf0PW9+n9zhNoRncP1whyxns
 DyxSbBVx1jVQ2jHHy8AYJjhKuLQY1hnNIn6UpLWd68IVlRrrcXE8mvB94aApqb8+a6Lr
 TCDmxaL0BFYMO4uYvZaTHyyeBBh6gh5wJI0RZtUKc8NjrVWDI2zyZq4+b6idtV+7I4EU
 Q4gibGmawYzGSiBGVoHA869k1lUvVQ78otbjBWagUniJ5pNMM1OtUPHkck7tEaD9u/mJ
 OIuQ==
X-Gm-Message-State: AO0yUKWllJqUnUxj+FehgaqDxaRmhTvv4XBCnGgkndOyUgqisBGfa0yD
 uwoUH/9NFHE/rCX+qK28oxXGWw==
X-Google-Smtp-Source: AK7set9zNVx+57hEOZgnPtvD4Q05Tfog3tybMA2WkK7+QAyedz8hiD09lLmb812r+ufxAVP4VvrZwA==
X-Received: by 2002:a05:600c:1894:b0:3de:1d31:1048 with SMTP id
 x20-20020a05600c189400b003de1d311048mr2489815wmp.29.1675762084495; 
 Tue, 07 Feb 2023 01:28:04 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31]) by smtp.gmail.com with ESMTPSA id
 fc13-20020a05600c524d00b003db01178b62sm20449772wmb.40.2023.02.07.01.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 01:28:04 -0800 (PST)
References: <20230206153449.596326-1-jbrunet@baylibre.com>
 <20230206153449.596326-8-jbrunet@baylibre.com>
 <a711905e-dbfb-4258-62be-250a9549a9c4@linaro.org>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown
 <broonie@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 7/7] ASoC: dt-bindings: meson: convert axg sound card
 control to schema
Date: Tue, 07 Feb 2023 10:25:53 +0100
In-reply-to: <a711905e-dbfb-4258-62be-250a9549a9c4@linaro.org>
Message-ID: <1jbkm53jvg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Mon 06 Feb 2023 at 20:21, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

>> +
>> +  audio-routing:
>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>> +    description: |
>
> You still have everywhere | which should be removed. Here and in almost
> every other description when no special formatting is needed.

I'm sorry if I misunderstood your comment. I thought the problem was
with the '-' of '|-', which I removed here.

Should I use '>' for the YAML multiline format instead ?

>
>
>
> Best regards,
> Krzysztof

