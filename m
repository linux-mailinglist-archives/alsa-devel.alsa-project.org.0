Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 273B28CB98
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 08:09:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8508586E;
	Wed, 14 Aug 2019 08:08:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8508586E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565762985;
	bh=vtbpZGrDUTUUuOwgl6EaoOx6b3mDn0MxZPTODgIquwE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l6O8avAUUn23AZIMqbEGLxGHOBgxedFX4wMY/LZ7rE0ZHVTtyfd1cBbB+f2AECvVY
	 vDHusCDEyuPljLLZsxM3P7tzCdHEAnMBs6aALz9EU6T4QpjUBFMsHd9Ye/RtETcIuq
	 22wQxuM/w6HfnX0GO5ucjk+AGlq0Q9UfqiUUPBso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC168F80214;
	Wed, 14 Aug 2019 08:08:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1618CF80273; Tue, 13 Aug 2019 10:44:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47E21F80120
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 10:44:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47E21F80120
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fJtewxdP"
Received: by mail-wr1-x444.google.com with SMTP id n9so107083279wru.0
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 01:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:openpgp:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SDJwnQjuv8+cFv70gCeD4pPzDeWrNoPVh3U04PT4UTo=;
 b=fJtewxdPG91j4ntA6IRwYWaehG/C7ZE1FeBUd+Yf8PiTqWCE2rhuklmiys/EBFkqtX
 UqVrHjsFgRF88ZLDIxUk/PtD8H7MfvWr6RdgPNBa2i/lky+2NeHlvfriIinGYsgEt588
 eypIYoXICelKldnhDzyEy7o9xnhErO0tlhl+sY2DM24LHAkI/3Y0yYvurZP+fb6ZwRLq
 xpYDqMaw37Sa4I4ikaPkNuh7dD+Rv6OpRWPO0T8Jcc+lu9jo80gfzkLQjoseIxIURVNt
 19KxsxM3vXIu5ge12T8A+3/8etiRG2Mux4y6Gw66OTRwTsxgjc648d/VYitBFBZd45T+
 GLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=SDJwnQjuv8+cFv70gCeD4pPzDeWrNoPVh3U04PT4UTo=;
 b=qD3AcRR0z8ZojGY0IXDTum8TFS+uL9kjXrbdANCoYq62TNwUz/CReYvTA/Un0Cx7H4
 AzV6yMBNfLxRnkilVGRrJakDV6xCqhJP6bESpBKdcAZYnFOtiT9BTvBn3uco83EMAe+e
 qZePUQKmj4NqUJOYOCp0I+Q0blOxux70V0K4w+q7HVJeizH+Ez1PdfH7mu1XOzIwVZZq
 4dLe/ZWTG7yHzTkQ11dtYLus55AniSSHq2zPEswOCC2WvTejN5RzLpvdebH7JQ9pgFX/
 avbhUiZGMJ4oAiZRT+NYiROZQfbUTusKlyBZRJ9FBq3TV4BE3ouFGUmJKKQ6d7ypwClo
 qPLg==
X-Gm-Message-State: APjAAAU19o23AqP/3gsfGhnib4gc91+HUxdbE1OsEVF7wZo1q2PBa74S
 yN8+RrGL8YLy4uh/rrTpbUA=
X-Google-Smtp-Source: APXvYqyh5cs0zBfsrQ9/9b4GlmZJ4f1O1rnDXbQI6CpyecdaWis32Z7KfISDGKCOzITPkf4SiQ85Zg==
X-Received: by 2002:adf:dd88:: with SMTP id x8mr37133406wrl.331.1565685873196; 
 Tue, 13 Aug 2019 01:44:33 -0700 (PDT)
Received: from [192.168.1.35] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id k124sm1896121wmk.47.2019.08.13.01.44.31
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Aug 2019 01:44:32 -0700 (PDT)
To: Lee Jones <lee.jones@linaro.org>, Paul Cercueil <paul@crapouillou.net>
References: <20190725220215.460-1-paul@crapouillou.net>
 <20190725220215.460-11-paul@crapouillou.net> <20190812081640.GA26727@dell>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <4b48e597-951e-45fd-dfb2-4a1292a8b067@amsat.org>
Date: Tue, 13 Aug 2019 10:44:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190812081640.GA26727@dell>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 14 Aug 2019 08:07:59 +0200
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, James Hogan <jhogan@kernel.org>,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, od@zcrc.me, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Artur Rojek <contact@artur-rojek.eu>, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dmaengine@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 10/11] mfd: Drop obsolete JZ4740 driver
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Lee,

On 8/12/19 10:16 AM, Lee Jones wrote:
> On Thu, 25 Jul 2019, Paul Cercueil wrote:
> 
>> It has been replaced with the ingenic-iio driver for the ADC.
>>
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> Tested-by: Artur Rojek <contact@artur-rojek.eu>
>> ---
>>  drivers/mfd/Kconfig      |   9 --
>>  drivers/mfd/Makefile     |   1 -
>>  drivers/mfd/jz4740-adc.c | 324 ---------------------------------------
>>  3 files changed, 334 deletions(-)
>>  delete mode 100644 drivers/mfd/jz4740-adc.c
> 
> Applied, thanks.

It seems the replacement is done in "MIPS: qi_lb60: Migrate to
devicetree" which is not yet merged.

Probably easier if this patch goes thru the MIPS tree as part of the
"JZ4740 SoC cleanup" series.

Regards,

Phil.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
