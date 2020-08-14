Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DAF244CC0
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Aug 2020 18:32:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC17C1667;
	Fri, 14 Aug 2020 18:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC17C1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597422738;
	bh=RPib77+1iFWs+fYvy9vOaY5mrTX3Q6XRQz6cvpt/jr8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gJraF1H4ko9ZNQWL9dsgzEIWU4BRSUQqTqvPM8tUBGBZWj9b0mw6hvcaT/0u7m/Pm
	 BZiFHTzMlpNQVThhPJaVpQrPdB8D4MECZxxaswkUd5HgjI8gUpD4ufnEqejnyiBixq
	 6qaDGshy6VO2bbIGBfvAOGfYmJx5XVrpODa9KDIA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C62F4F80146;
	Fri, 14 Aug 2020 18:30:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C58CF8022B; Fri, 14 Aug 2020 18:30:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=NICE_REPLY_A,PRX_BODY_135,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2AD2F80146
 for <alsa-devel@alsa-project.org>; Fri, 14 Aug 2020 18:30:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2AD2F80146
Received: from [37.160.38.175] (port=40734 helo=[192.168.42.162])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <luca@lucaceresoli.net>)
 id 1k6cay-0001mB-F9; Fri, 14 Aug 2020 18:30:20 +0200
Subject: Re: [PATCH] dt-bindings: Whitespace clean-ups in schema files
To: Rob Herring <robh@kernel.org>
References: <20200812203618.2656699-1-robh@kernel.org>
 <d5808e9c-07fe-1c28-b9a6-a16abe9df458@lucaceresoli.net>
 <CAL_JsqKekx0VO4NROwLrgrU8+L584HaLHM9i3kCZvU+g5myeGw@mail.gmail.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <f1963eb9-283f-e903-2a3a-4f324d71d418@lucaceresoli.net>
Date: Fri, 14 Aug 2020 18:30:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKekx0VO4NROwLrgrU8+L584HaLHM9i3kCZvU+g5myeGw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Linux Input <linux-input@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 devicetree@vger.kernel.org, "open list:THERMAL" <linux-pm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux HWMON List <linux-hwmon@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>
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

Hi,

On 14/08/20 16:51, Rob Herring wrote:
> On Thu, Aug 13, 2020 at 4:31 AM Luca Ceresoli <luca@lucaceresoli.net> wrote:
>>
>> Hi Rob,
>>
>> On 12/08/20 22:36, Rob Herring wrote:
>>> Clean-up incorrect indentation, extra spaces, long lines, and missing
>>> EOF newline in schema files. Most of the clean-ups are for list
>>> indentation which should always be 2 spaces more than the preceding
>>> keyword.
>>>
>>> Found with yamllint (which I plan to integrate into the checks).
>>
>> [...]
>>
>>> diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
>>> index 3d4e1685cc55..28c6461b9a9a 100644
>>> --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
>>> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
>>> @@ -95,10 +95,10 @@ allOf:
>>>        # Devices without builtin crystal
>>>        properties:
>>>          clock-names:
>>> -            minItems: 1
>>> -            maxItems: 2
>>> -            items:
>>> -              enum: [ xin, clkin ]
>>> +          minItems: 1
>>> +          maxItems: 2
>>> +          items:
>>> +            enum: [ xin, clkin ]
>>>          clocks:
>>>            minItems: 1
>>>            maxItems: 2
>>
>> Thanks for noticing, LGTM.
>>
>> [...]
>>
>>> diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
>>> index d7dac16a3960..36dc7b56a453 100644
>>> --- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
>>> +++ b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
>>> @@ -33,8 +33,8 @@ properties:
>>>      $ref: /schemas/types.yaml#/definitions/uint32
>>>
>>>    touchscreen-min-pressure:
>>> -    description: minimum pressure on the touchscreen to be achieved in order for the
>>> -                 touchscreen driver to report a touch event.
>>> +    description: minimum pressure on the touchscreen to be achieved in order
>>> +      for the touchscreen driver to report a touch event.
>>
>> Out of personal taste, I find the original layout more pleasant and
>> readable. This third option is also good, especially for long descriptions:
>>
>>   description:
>>     minimum pressure on the touchscreen to be achieved in order for the
>>     touchscreen driver to report a touch event.
>>
>> At first glance yamllint seems to support exactly these two by default:
>>
>>> With indentation: {spaces: 4, check-multi-line-strings: true}
> 
> Turning on check-multi-line-strings results in 10K+ warnings, so no.
> 
> The other issue is the style ruamel.yaml wants to write out is as the
> patch does above. This matters when doing some scripted
> transformations where we read in the files and write them back out. I
> can somewhat work around that by first doing a pass with no changes
> and then another pass with the actual changes, but that's completely
> scriptable. Hopefully, ruamel learns to preserve the style better.

Kind of sad, but I understand the reason as far as my understanding of
the yaml world allows. Thanks for the explanation.

[For idt,versaclock5.yaml, plus an overview of whole patch]
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
