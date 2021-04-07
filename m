Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D46356C0C
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Apr 2021 14:28:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4FDA829;
	Wed,  7 Apr 2021 14:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4FDA829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617798539;
	bh=ykPC81Br780mz3XS0F650l1GsXGL5kKxY2znHes0yYo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V5v7tKngGr47nbMPag5IB+txdu5Uz4D68paeOgqY+KYdpMDkALJOEKVaHw/d1+sTu
	 6cMG/kG4vVrNUCwj+1QF+Qo7NSePbXd6ofBX56ltLm72Th5c3dgowMIJoFv1/w7j/d
	 o2jL0YMder7EeuQX55Eq91Ogs3EbT1BQbujPTB8E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A9E3F80124;
	Wed,  7 Apr 2021 14:27:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9889BF8016A; Wed,  7 Apr 2021 14:27:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C843F80124
 for <alsa-devel@alsa-project.org>; Wed,  7 Apr 2021 14:27:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C843F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="vLnM6fvB"
Received: by mail-lf1-x135.google.com with SMTP id d13so28203665lfg.7
 for <alsa-devel@alsa-project.org>; Wed, 07 Apr 2021 05:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9SISt/W/3sXxPFaIuYkTClnfPMS3gAsgLovAVBJjy1A=;
 b=vLnM6fvBwkOrA/hbQKi8h2nM6K3yxm9vBpdAFCnoHu1Huz3r3iRMBTlCw/sZK6YkA3
 +pNfr5UtR2yFB/QwB16oWJGdIxPpjj1gortYjMAjTp+HmicFZnvOR2isMwWF6thbeLSc
 8y7u/Lp3GEy628N2rKlaP+MPuR6DdRaHPNTiJM/RTnFeRRwNaq8weOLmngv4kwQupGRd
 EY/ybXIf7zx95oIEvwqotzhDR3ICHtZvTQOtcG9gxwaDLJKah8n+hCUlcYvejBojX8py
 yp2iiW31VxHlGqI5pBhbVmkYCVeVuVnZujl6kbl2ukYsnx285HoxQddzKBdz0Zj2G+XK
 hRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9SISt/W/3sXxPFaIuYkTClnfPMS3gAsgLovAVBJjy1A=;
 b=UiuWLJPm4I3BrWleoJF6ySC9icAPe1qpIuFPc85JJHvVJbUgkAj3fsyZpFXPN9yJNf
 NmLyySdMXj41usc/TQcSbciMwqvQBdAp/3IZYBEZqr1VlbfaA7Wg2nExqpdStiiKXDsL
 Dec3uOu8h5Z1ybG8vzfO91yfdlma2JWMt2ZMT7EDnx7MCnlUPx0BcLWpLS5vUO0ZAE6s
 34LV0YgxpY7ydfkSLw9ilEzRZ6wjuXF8LIMrs/OahdtlSrGpw63HNaMe1LW4W4JZW8OS
 b5I6d4VVuRzvQf35PmJ/vUtvJdN2A9+YhtgDVSXeNHyrjpewdhexI3jrNl5cCfiPG2PO
 bttQ==
X-Gm-Message-State: AOAM5334tzywCg4rBJ+tdXvtCHWmoKuTytSqI9Xzq2j3yYSoMynq6fOO
 TkMvamodmZ/k15w5ZuptO7I=
X-Google-Smtp-Source: ABdhPJz3ObbPabZB5M+IjGaeI1HJZlZnJrtr1XuzUUU/ok7WapSTf++CIKDcz4XodA22UJo5fxHYBg==
X-Received: by 2002:a05:6512:b81:: with SMTP id
 b1mr2487833lfv.345.1617798428598; 
 Wed, 07 Apr 2021 05:27:08 -0700 (PDT)
Received: from [10.0.0.42] (91-157-86-200.elisa-laajakaista.fi.
 [91.157.86.200])
 by smtp.gmail.com with ESMTPSA id l12sm2513451ljg.39.2021.04.07.05.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 05:27:08 -0700 (PDT)
Subject: Re: [PATCH 4/4] ASoC: codecs: tlv320aic3x: add SPI support
To: =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal@aksignal.cz>,
 Mark Brown <broonie@kernel.org>
References: <20210406142439.102396-1-jiri.prchal@aksignal.cz>
 <20210406142439.102396-5-jiri.prchal@aksignal.cz>
 <20210406165440.GN6443@sirena.org.uk>
 <afb3d94a-ad3b-369d-e370-1fc82232e11c@aksignal.cz>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Message-ID: <da847bcb-e9e8-4a2f-bdd6-57ebc7e44a2e@gmail.com>
Date: Wed, 7 Apr 2021 15:28:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <afb3d94a-ad3b-369d-e370-1fc82232e11c@aksignal.cz>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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

On 4/7/21 8:44 AM, Jiří Prchal wrote:
> 
> 
> On 06. 04. 21 18:54, Mark Brown wrote:
>> On Tue, Apr 06, 2021 at 04:24:39PM +0200, Jiri Prchal wrote:
>>> Added SPI support.
>>>
>>> Signed-off-by: Jiri Prchal <jiri.prchal@aksignal.cz>
>>> ---
>>>   sound/soc/codecs/Kconfig           |  7 +++
>>>   sound/soc/codecs/Makefile          |  2 +
>>>   sound/soc/codecs/tlv320aic3x-spi.c | 76 ++++++++++++++++++++++++++++++
>>>   3 files changed, 85 insertions(+)
>>>   create mode 100644 sound/soc/codecs/tlv320aic3x-spi.c
>>
>> This looks good but we should also add an update to the DT binding which
>> notes that SPI is also supported, right now reg is documented as being
>> at an I2C address.
>>
> Mark, please, will you navigate me where DT binding is.

Documentation/devicetree/bindings/sound/tlv320aic3x.txt

> I just added this to my board dts and that's all:
>     spi0: spi@f0000000 {
>     ...
>         // audio codec
>         tlv320aic3106: codec@3 {
>             compatible = "ti,tlv320aic3106";
>             reg = <3>;
>             #sound-dai-cells = <0>;
>             spi-max-frequency = <1000000>;
>             status = "okay";
>             DRVDD-supply = <&reg_3v3>;
>             AVDD-supply = <&reg_3v3>;
>             IOVDD-supply = <&reg_3v3>;
>             DVDD-supply = <&reg_1v8>;
>             ai3x-ocmv = <0>;
>         };

-- 
Péter
