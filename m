Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D097268F832
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 20:38:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10134836;
	Wed,  8 Feb 2023 20:37:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10134836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675885113;
	bh=UbbeBQGDC2WxicmBhH+e7LvUsGcSg7kz1I5HUsANMjs=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dxu4VT6CLCTuYiRDMggl65q9UOlKhW0i30K8XUcUTjO0OkgdWZpBj72OKo/CZ0CLx
	 GhVcrYStNG4x2C8OJvmT6I08AQUzpDyrNpgs7U4MlFd16tmBXoNZgzkenGe7PbKgV8
	 Y8IENeF0VH+GPVszQD8SpcdfNfR5bAEszlGVgsRw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 367AFF800E4;
	Wed,  8 Feb 2023 20:37:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A866F8012B; Wed,  8 Feb 2023 20:37:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F057AF8001E
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 20:37:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F057AF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Tf7g5VTR
Received: by mail-wr1-x430.google.com with SMTP id y1so17929024wru.2
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Feb 2023 11:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pl3dbhpEG6Kk1GoL/DPqwV3Qyi+vQX/NfFDA0o7wGFU=;
        b=Tf7g5VTRK99FyjQXJoKTupMl38GKbPYe4fIgwxfxZqkvK6ztKyIwCfdyU1XLjbdDAq
         I7RdPSs9WTQRQL9NfVOlQlUOaDdX39bzR0YqKyY2E06/MH0mkxnPHSnoeTB37XBzb4z/
         4kp3Y0xEzR2igA+Dhox2rZ+bUi5FyuZaOTMEVpgBl7e2evWhbJGZMwXqR2qaJBPoUMCv
         oIcLoJIjya4uTk5UB3JfGCh2QP/EN6jPyFqDDJ5eV8UdL6FVgC0OensXWp6zNJb+tRX0
         sY9QDuu3D7xSMjD3cnTVkBT/DQ+3I8Z3w/jh4fMR3Nw1KQyhK5h9RiYk81v+C5xmOPCx
         QjQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pl3dbhpEG6Kk1GoL/DPqwV3Qyi+vQX/NfFDA0o7wGFU=;
        b=dWaSGmM7TPTTbBnlNmO4ozXMSD85oz6w/1UnBlhlODKU/SUQRgnpsFZuioAJiQw7+w
         LwY/VPR0U3cKfYpOqkdlOiH1f/0tUB33sdrMT4dWBjFfDKfCHAGVCet584Q9vXttssag
         EuRCRbUmiL+TpdmhIlWinheAIh9jBp9MvfC5wD6rQ9jV2NNPmINFmHnRQpW1lWgih22X
         0HzMa2UGnpqLVPMC9ypbWRWygMwAo1gIIvDdvuR0CzVWxhjlWk74onNfVRfFeKxr+Q6T
         Gnid4LpZqwdC+Qta1nyeA/PQKzftaE8Ejlx7kjqZmKpU3icy2rsUEcNFQUTFzXmWHbHT
         y86A==
X-Gm-Message-State: AO0yUKW9avwpcxkJoK+XEHm9YIO2+zagSrQX8HdqQsniiQbwRLfavTDw
	bkWXTG6hZqRbWdyJul/OC7LiZg==
X-Google-Smtp-Source: 
 AK7set+SNrYvyRQN/7d2R5sXxvthYndgy/lcDLA1C3Np8r2unDUEEAtE4VjuP+DDWEkWXVDvat5PDw==
X-Received: by 2002:adf:f80c:0:b0:2c3:cdcd:f0b3 with SMTP id
 s12-20020adff80c000000b002c3cdcdf0b3mr7233340wrp.9.1675885044603;
        Wed, 08 Feb 2023 11:37:24 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 u17-20020adfdb91000000b002bdd96d88b4sm14522878wri.75.2023.02.08.11.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 11:37:24 -0800 (PST)
Message-ID: <c876f40a-2db5-eb50-9706-3147671ec4c5@linaro.org>
Date: Wed, 8 Feb 2023 20:37:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] ASoC: dt-bindings: wlf,wm8994: Convert to dtschema
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20230208172552.404324-1-krzysztof.kozlowski@linaro.org>
 <Y+PeR4EFfcVDbUfV@sirena.org.uk>
 <51e8e157-3f60-1731-a8ca-4a678c8eafd6@linaro.org>
 <Y+PlUtAmbl5TJq6z@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y+PlUtAmbl5TJq6z@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FD6URHHF25MIZHATCVHB3D3TFSJQOKW2
X-Message-ID-Hash: FD6URHHF25MIZHATCVHB3D3TFSJQOKW2
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 - <patches@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FD6URHHF25MIZHATCVHB3D3TFSJQOKW2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/02/2023 19:09, Mark Brown wrote:
> 
>>> Are you *sure* they are grounded and not supplied from the LDOs?
> 
>> That's what I have on schematics (attached), if I got it right.
> 
> You'll notice that they've got decoupling caps on rather than being
> grounded - there's an internal connection to the LDO output so if the
> LDOs are in use that's all that's required, while if the LDOs are not in
> use for some reason then an external supply is connected there.

Yes, indeed, not grounded. I'll rephrase the commit. I also found few
other differences needed:
1. AVDD2 should be always required,
2. LDO2VDD exists on WM8994.

Best regards,
Krzysztof

