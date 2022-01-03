Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4FC48309A
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jan 2022 12:34:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AC92176B;
	Mon,  3 Jan 2022 12:34:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AC92176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641209692;
	bh=9Eb9RTl6r0Jo4AZnaJxxoeVBx8+wxIx0oPD3y4CCLV4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QlQhFQ/la2+rIVwkIrbrR7E7EB6xQ4g5opYtdVIVIjIYp/rhobG0yHzo1DT0J0h7Z
	 DUwj69YyIYMYJA6dTMLbb/mGs8Tbzgb8xFkN5+ojmYPlnQwTAnPruVJaLSqbVujJMJ
	 zMs7gk9W4IkmvRiPJq9UPy2STGAKXJsgnGKPLap4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6A77F8028D;
	Mon,  3 Jan 2022 12:33:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 960A0F80107; Mon,  3 Jan 2022 12:33:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97C8DF800FF
 for <alsa-devel@alsa-project.org>; Mon,  3 Jan 2022 12:33:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97C8DF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="S5YV6oLG"
Received: by mail-wm1-x32f.google.com with SMTP id
 n10-20020a7bc5ca000000b00345c520d38eso18195212wmk.1
 for <alsa-devel@alsa-project.org>; Mon, 03 Jan 2022 03:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N0OzaQNNJIq+kyud4Uc895pmB53bHPkNVDy1dZpq2BY=;
 b=S5YV6oLGkx9HLLn70EWetLIwKIpMhDDka9K6iTjBuiDp8tiI06mPD4nLh1AV6Cksig
 CyMwr/DzsD22E8GBRkQV9ACd9bjHjW0A+i2EHupKlg0C67AO+Bhhh+H7Ggq+qAeBKrOz
 Bz0lqvAaylJ2VItFZhZhiZUlpmNWXf5DePp89VDsNGOSYIELJLFDWx91LPCDOQZHeyVh
 1oqWxUB6gj009b8u4h49jD9C4+zGrnhK1uIQw0N7GoWElVhIH1XIK7m/6Vf5cKcpW0O+
 zT1+1zMDjfT2lNb/oks7qViaeU+gSNPdc44J/SEjm2Sxz3uku+bZMXtsLbN1jBI1k4sq
 dBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=N0OzaQNNJIq+kyud4Uc895pmB53bHPkNVDy1dZpq2BY=;
 b=ywImiYnx8u4qsHoZIvDiD2tPX6Jrm42V2KK9d+PB7EnPm5DhTxEP/Ym6k2IjYZ8GTj
 vdaDXvs0D8dDyLEkRx6kNn2A3OWQ/3zdalulwQwOCvsV1izcu3iU9cdVg+4O8St4wxu7
 1pEQcCcMwhZkZ6VEHYyQE+1TYP5iUr21pmDW+13+bDFqGRujxemM7kk3l3WM1RbkmmEZ
 Yor//w6d+KFhbclvttU20pKn+Zs+H+XRklrOF8202SWtjTZqFmEfaoPUpNhJlq4uIiiN
 0YZ3qWcdnGC4zoMXit3HZOgOEPgLQNUPlBQSw78qMtfstVXGdkcyj9WtJDShDccvMJO4
 5caw==
X-Gm-Message-State: AOAM5317Z3c9pwSvd+auToo7Z7zK+48WWuagiZfsAGg7Aj1PZKKy/Ms3
 Wb8262RCPRMu+/D2AGiyZHza8w==
X-Google-Smtp-Source: ABdhPJxaKxKULNBrd2g60r7nvvEmGuq97mfXP3cU7zsuBf7u0Tovr+OYsByszfTTH5I8CBn4x3gaXw==
X-Received: by 2002:a05:600c:19ce:: with SMTP id
 u14mr34813970wmq.49.1641209580705; 
 Mon, 03 Jan 2022 03:33:00 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:7c9d:a967:38e2:5220?
 ([2001:861:44c0:66c0:7c9d:a967:38e2:5220])
 by smtp.gmail.com with ESMTPSA id p18sm47514860wmq.0.2022.01.03.03.32.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 03:33:00 -0800 (PST)
Subject: Re: [PATCH 1/3] dt-bindings: display: meson-dw-hdmi: add missing
 sound-name-prefix property
To: Alexander Stein <alexander.stein@mailbox.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20211223122434.39378-1-alexander.stein@mailbox.org>
 <20211223122434.39378-2-alexander.stein@mailbox.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <c4d5d774-6d9a-410d-b651-e452894e99eb@baylibre.com>
Date: Mon, 3 Jan 2022 12:32:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211223122434.39378-2-alexander.stein@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 23/12/2021 13:24, Alexander Stein wrote:
> This is used in meson-gx and meson-g12. Add the property to the binding.
> This fixes the dtschema warning:
> hdmi-tx@c883a000: 'sound-name-prefix' does not match any of the
> regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> ---
>  .../devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml   | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> index cf5a208f2f10..343598c9f473 100644
> --- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> @@ -10,6 +10,9 @@ title: Amlogic specific extensions to the Synopsys Designware HDMI Controller
>  maintainers:
>    - Neil Armstrong <narmstrong@baylibre.com>
>  
> +allOf:
> +  - $ref: /schemas/sound/name-prefix.yaml#
> +
>  description: |
>    The Amlogic Meson Synopsys Designware Integration is composed of
>    - A Synopsys DesignWare HDMI Controller IP
> @@ -99,6 +102,8 @@ properties:
>    "#sound-dai-cells":
>      const: 0
>  
> +  sound-name-prefix: true
> +
>  required:
>    - compatible
>    - reg
> 

Fixes: 376bf52deef5 ("dt-bindings: display: amlogic, meson-dw-hdmi: convert to yaml")

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
