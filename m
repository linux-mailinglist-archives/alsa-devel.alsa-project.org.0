Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA6D173DC3
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Feb 2020 17:59:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBB1216E7;
	Fri, 28 Feb 2020 17:58:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBB1216E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582909140;
	bh=Sktcwjtz293t3EwNDpvm9Bep0iAVnxp3FpLZjGygntA=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XaBsiWwjNyiP2NRH9lpnCZ2YnKG31U1Sw7c8W+d5eO7xEdhpH245me24Z47r73XtP
	 0mDM9DcXmB8Pj74+HPU9i4J9f5nIl3N0VIhwBbAi/tUehA0FdUKOIBjJiyx4l5dyHC
	 YVvqB5aCIeVSXXIKTOnvjvpWgA2NHXiFVYKgh8W4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D24FAF8014D;
	Fri, 28 Feb 2020 17:57:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6305AF8014E; Fri, 28 Feb 2020 17:57:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF507F80113
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 17:57:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF507F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="IhXA9nbg"
Received: by mail-wm1-x344.google.com with SMTP id p9so3922517wmc.2
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 08:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=A+A25OPbN7c0Hb+kDxkLLF4o6kk9ftbHcHDjaa9bDHg=;
 b=IhXA9nbgy+q/POpe9udr4TB+ykkDxlX+HTpnb3PggnZ+4YLOovZZoyTtRYlSTpitqC
 /C5iuvnFnvdUUDhTsQYAXzs92WlPtEAJzPXRb+xNWq5QzJIdUkQJBHbUXi8m9RJV3xSj
 y2A3xkboJgJCjSN2ztwh8iB46KpzfEuToyRom2WnTCA3REa1S3R7pUdPB7d8hU20crnb
 hI4UiDmacgpsYcfEGME/3ZoS/Lv+dqZdk5hngbZ34A4rmo0OnXi0pasxyj/KAhYenPOe
 sqj+AsXgDMGWvbsac53SEtIgKhzYMUNxKBgeIrihYFMqVH73AOPiBkrmCIcISy8odjud
 BxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=A+A25OPbN7c0Hb+kDxkLLF4o6kk9ftbHcHDjaa9bDHg=;
 b=luios333uWUzIhqU2xassyK+ZGSGTJ6QLo8UfX6sgnd4tbmtlMNU86jBuCW5R8MwhW
 CEHeOTif8JSVbxg8j/7jYBDTOoFsmeSqAdaSdKpYOoPhOudx9CCunmdX7gZRe6cmctKp
 wKAAXCR5PTssui9VuFPxVItzEI2JZlxUWW2uD9yDYu3pUigXolnug4F2jshnyFIReHph
 duB4jbJDmO7a4L/QJzkx61EWn9Mch6kaPTZv96DqwIEsxgT535eww5q+h6aDepDsi1cE
 xOFoMx/wM6QuXRqG5P6CFufCtGswiVxz63z5/l425Bb49SLM1QX+soKxqiVoIpbxWq+z
 smHg==
X-Gm-Message-State: APjAAAVqkyXhmmcyiD0iPP06xmCMU0QUqz9wNiM5EtpFYEkvKibJabjR
 81aYDmJCrf3IHJN+YZlMJBLjFA==
X-Google-Smtp-Source: APXvYqy1Ur/W3S+TgCWd2fsapozAnq2RpmkzdXDsfH9HZXa0i2WSU1Rbd1rhaCVIj7olyI1mBNqiaQ==
X-Received: by 2002:a05:600c:228f:: with SMTP id
 15mr5990087wmf.56.1582909033626; 
 Fri, 28 Feb 2020 08:57:13 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id n2sm13817320wro.96.2020.02.28.08.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 08:57:12 -0800 (PST)
References: <20200224145821.262873-1-jbrunet@baylibre.com>
 <20200224145821.262873-3-jbrunet@baylibre.com> <20200228155017.GA24730@bogus>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/9] ASoC: meson: convert axg tdm interface to schema
In-reply-to: <20200228155017.GA24730@bogus>
Date: Fri, 28 Feb 2020 17:57:12 +0100
Message-ID: <1jpndyejkn.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
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


On Fri 28 Feb 2020 at 16:50, Rob Herring <robh@kernel.org> wrote:

> On Mon, Feb 24, 2020 at 03:58:14PM +0100, Jerome Brunet wrote:
>> Convert the DT binding documentation for the Amlogic tdm interface to
>> schema.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  .../bindings/sound/amlogic,axg-tdm-iface.txt  | 22 -------
>>  .../bindings/sound/amlogic,axg-tdm-iface.yaml | 57 +++++++++++++++++++
>>  2 files changed, 57 insertions(+), 22 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
>>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
>> deleted file mode 100644
>> index cabfb26a5f22..000000000000
>> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
>> +++ /dev/null
>> @@ -1,22 +0,0 @@
>> -* Amlogic Audio TDM Interfaces
>> -
>> -Required properties:
>> -- compatible: 'amlogic,axg-tdm-iface'
>> -- clocks: list of clock phandle, one for each entry clock-names.
>> -- clock-names: should contain the following:
>> -  * "sclk" : bit clock.
>> -  * "lrclk": sample clock
>> -  * "mclk" : master clock
>> -	     -> optional if the interface is in clock slave mode.
>> -- #sound-dai-cells: must be 0.
>> -
>> -Example of TDM_A on the A113 SoC:
>> -
>> -tdmif_a: audio-controller@0 {
>> -	compatible = "amlogic,axg-tdm-iface";
>> -	#sound-dai-cells = <0>;
>> -	clocks = <&clkc_audio AUD_CLKID_MST_A_MCLK>,
>> -		 <&clkc_audio AUD_CLKID_MST_A_SCLK>,
>> -		 <&clkc_audio AUD_CLKID_MST_A_LRCLK>;
>> -	clock-names = "mclk", "sclk", "lrclk";
>> -};
>> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
>> new file mode 100644
>> index 000000000000..5f04f9cf30a0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
>> @@ -0,0 +1,57 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic Audio TDM Interfaces
>> +
>> +maintainers:
>> +  - Jerome Brunet <jbrunet@baylibre.com>
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^audio-controller-.*"
>> +
>> +  "#sound-dai-cells":
>> +    const: 0
>> +
>> +  compatible:
>> +    items:
>> +      - const: 'amlogic,axg-tdm-iface'
>> +
>> +  clocks:
>> +    minItems: 2
>> +    maxItems: 3
>> +    items:
>> +      - description: Bit clock
>> +      - description: Sample clock
>> +      - description: Master clock #optional
>> +
>> +  clock-names:
>> +    minItems: 2
>> +    maxItems: 3
>> +    items:
>> +      - const: sclk
>> +      - const: lrclk
>> +      - const: mclk
>> +
>> +required:
>> +  - "#sound-dai-cells"
>> +  - compatible
>> +  - clocks
>> +  - clock-names
>
> Add an:
>
> additionalProperties: false

I did not put that on purpose.
Most of the amlogic devices use an generic ASoC property called
"sound-name-prefix"

You may see examples of that in
arch/arm64/boot/dts/amlogic/meson-axg.dtsi.

That property is not expressed in json schema yet, and I don't
really know what is the best way to add that.

Adding 'additionalProperties: false' right now would generate a fair
amount of warning with 'make dtbs_check'

>
> With that,
>
> Reviewed-by: Rob Herring <robh@kernel.org>

