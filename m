Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C61B48B771
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jan 2022 20:39:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDB641AE3;
	Tue, 11 Jan 2022 20:38:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDB641AE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641929974;
	bh=m6AqsmsQNqx88hG0YVxhJJpIop4zq6ScDp94oAWOE2A=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cTxZ+5krKMgE3EfC+hANgmdIXgUFHoKj2jZmskCl7FRhlhtq0asbpJh2e00AdfeAa
	 EEXzmtBE+8lez8uYd4Ol3fq5GQfpkrNcKRGRJmLeqzPpzYXU9qBZ+wV9WoQgWNvbuZ
	 6PSSem8Vl2Y2ry3PjgvkxydxUxojgpk07heKn/7k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBC53F80430;
	Tue, 11 Jan 2022 20:38:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FEDEF80302; Tue, 11 Jan 2022 20:38:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B03DF800A7
 for <alsa-devel@alsa-project.org>; Tue, 11 Jan 2022 20:38:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B03DF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FZMSntPk"
Received: by mail-lf1-x12c.google.com with SMTP id j11so374278lfg.3
 for <alsa-devel@alsa-project.org>; Tue, 11 Jan 2022 11:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=gCA03Y8txjZiDgmmkgC6vSFKPvusDQ96DqTHZL4jtHk=;
 b=FZMSntPkSIzKrqITY9rAON0lmZYT/THkwcu2kSIZzsmU84vXUvnzLa2SFJA72IfETY
 MTgCbXLIbwaNrhSG2AKYlDzxlQ1n4zobcbJ/M1Ju05R5ScvkiQnOhkxcd4boBc1JHypt
 cgRIOJse4I07nEnsaZxBonFSnjCj6D3oe2E31JXK2a7X9oKvhUuqMkvqIrf+xqY1MbgD
 Ie9x520HIONwTpEKJUAzBvsd+HOu2KaGJ4FQHcaSnEA0/t2pIi/Ds4UMu6Mu9+wZ1X6w
 jNixV38ZnCM0PTyhuh5TFuZurIdJI4RJIsgzvL0qBkbQY+rtTS05a8UTgZ5cqe/GBLzv
 liwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=gCA03Y8txjZiDgmmkgC6vSFKPvusDQ96DqTHZL4jtHk=;
 b=NH9ljonrXrea+ay97ROU8M4eulE5v10hdd6H8SlLwmbdNb1iLUTL1azpBBBQP0Sx4r
 +b1sdrXFUwoBONjSxJJe2KwuUc6cR0nOyV80etzivSRR8046CmaNI7M56dr9h1vR3YCS
 0hsRK6iGdTy1PsBqzj6BPF4aEZ9pw38OZDMdKVYHS8GXwj3mjY5F3KiHbh0miwq+ISg1
 3MLlJTPCW8IouU2IF7HegoTBFt6UZgnjDlpYQkfiNiZpIqyY61+yvGehwJuOXxtHcUlf
 sCICMhfNifckt4sJ1Yrn58XkiuFNtOKKCRxm/QV9g58d12FrYNTMIjsqPDiTsWpiuDus
 usZg==
X-Gm-Message-State: AOAM533CIl44R9ebQ4+RCtvvc9cmodL1thRc/Tn1OHsOTfz81wU/0kes
 zCNXRyYEiJkFlfQ9jhvRNrQ=
X-Google-Smtp-Source: ABdhPJxuTBO7wEiTLvI+W/Xa1On/i+omE0wFswDUMxG8C6QIYgu8MpzMsLxU+w7zBoxbOx2/u4wQSA==
X-Received: by 2002:a2e:9ec7:: with SMTP id h7mr292524ljk.394.1641929899202;
 Tue, 11 Jan 2022 11:38:19 -0800 (PST)
Received: from [10.0.0.42] (91-153-170-164.elisa-laajakaista.fi.
 [91.153.170.164])
 by smtp.gmail.com with ESMTPSA id i16sm1427429lfe.273.2022.01.11.11.38.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 11:38:18 -0800 (PST)
Message-ID: <83c51ee4-ac10-0e44-d1cc-f69cebcbf0b8@gmail.com>
Date: Tue, 11 Jan 2022 21:43:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v5] ASoC: dt-bindings: davinci-mcasp: convert McASP
 bindings to yaml schema
Content-Language: en-US
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
To: Jayesh Choudhary <j-choudhary@ti.com>, robh+dt@kernel.org
References: <20220103074427.4233-1-j-choudhary@ti.com>
 <2cf3c89c-169f-3421-25d4-c80a6c9737ae@gmail.com>
In-Reply-To: <2cf3c89c-169f-3421-25d4-c80a6c9737ae@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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



On 1/11/22 21:21, Péter Ujfalusi wrote:
> Hi Javesh,
> 
> On 03/01/2022 09:44, Jayesh Choudhary wrote:
>> Convert the bindings for McASP controllers for TI SOCs from txt
>> to YAML schema.
>>
>> Adds additional properties 'clocks', 'clock-names', 'power-domains',
>> '#sound-dai-cells' and 'port' which were missing from the txt file.
>> Removes properties 'sram-size-playback' and 'sram-size-capture'
>> since they are not used.
>> Adds 'dmas' and 'dma-names' in the example which were missing from
>> the txt file.
>> Changes 'interrupts' and 'interrupt-names' from optional to
>> required properties.
>> Changes 'op-modes', 'serial-dir' to optional properties as they are
>> not needed if the McASP is used only as GPIO.
>> Changes 'tdm-slots' to required property only for I2S operation mode.
>>
>> Adds the yaml file in the 'MAINTAINERS' under the heading 'TEXAS
>> INSTRUMENTS ASoC DRIVERS'
> 
> I would have added description for the GPIO support as it is not obvious
> that 2 is going to be for AXR2 or 29 is for ACLKR pin.
> But I don't think this functionality is going to be used apart from the
> one dra7 evm.
> 
> Thank you for the updates and the nice work!
> 
> Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
> 
...

>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ti,dm646x-mcasp-audio
>> +      - ti,da830-mcasp-audio
>> +      - ti,am33xx-mcasp-audio
>> +      - ti,dra7-mcasp-audio
>> +      - ti,omap4-mcasp-audio

This is the only thing which bugs me: the pointless '-audio' postfix for
the compatible string...

-- 
Péter
