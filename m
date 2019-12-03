Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CA5110659
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 22:14:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DBBC166F;
	Tue,  3 Dec 2019 22:13:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DBBC166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575407670;
	bh=3khMC8K3PS36VtRdk+skykbe1kdvUhzmCqIJMCVoSz4=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pxcCaOLm3kruN/MzTw7i7X+uBi0W5pB+Xj8ZeBnNMQI0HSwvAr1DdNQnE73uxn6MM
	 snhRuHCMe6T+7MWUpdES8M4CPfxeAqIwZm9k8YkxkpMOmLxAVeDexPaXphHAaRuKWA
	 sBcdcws1+171WBvtrRNqGIOtoYchuBgo54d0en9Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 661ACF80228;
	Tue,  3 Dec 2019 22:12:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60094F8015A; Tue,  3 Dec 2019 22:12:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3797DF800B4
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 22:12:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3797DF800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GGoDx/F6"
Received: by mail-lf1-x12d.google.com with SMTP id a17so4181364lfi.13
 for <alsa-devel@alsa-project.org>; Tue, 03 Dec 2019 13:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=uUideO4aOK8Q8XnWlMwaFfWu06dgRPla2JJ/UV44Q2U=;
 b=GGoDx/F6Kqo2JKdEHH1igAuW32yN2lEwBR8njRhpxEhduLOVXyD6T0/i8dWTj9BBWL
 L7M3DtJbt0PaQr1BKPj3p3ivIIe7UoJyaamHabAGGFRfsyWG7fldONQQgwltuLRqbhf7
 qgsU2rwzLbyyGgwnpB/cfvs+giV30ps4mUlIoV/EG/UrF1N2+GtD+ZrPYlYTQ5TvhtGD
 WniwP7pootEZdX+ihEnp29u/RKZlxC7eO4YCJNVxs1WgtRR2ip3sQfDEjCCsQNc9dMtL
 ftNEIJNHbg2cYORWhBY1F0eQeg24TUYEprDIeB6K589wWAVARlCfrBzwi+7b86swgjLx
 DnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=uUideO4aOK8Q8XnWlMwaFfWu06dgRPla2JJ/UV44Q2U=;
 b=bGNoaJMZHqhTJ+K0EWuDzmgiNbpvMM63cLcD3nvZ/ouhvmJ80KZRpQnK1LGN3/ztL1
 jUQxTniD22wUPkrDKA/DtLYazRSyT4MS1E+Z49q3eWTH9rl/+rXMo+OeXPqRazt02fXI
 6e37aRhlZh7JVL7s9lFwy0TZtXk+08R+saM5cfzt2bszUlfKNbnisVWJJpi/+kqndvA/
 8C+wsbcKhyNX1CpEyAXczdkm+Imjpxxvi/PLkJVVQSOgTZO95kma7EuqZCDuMm6tTbZz
 n7GsmnEwpDJ+AskCo4xmSSN4ZlsIh0X2WtrMX58g29N+vXD5iqyCsQnvZWOUNxdDqF0q
 SadQ==
X-Gm-Message-State: APjAAAWdUR5bQ10SkBS5UTBkS9mHzMiwLgUyxcnc1kB0sVKXwu93RFLG
 6Q1OSik+EpZ2tIAc3zWIgk1ZmfnoURzqcelnHAEetlLM
X-Google-Smtp-Source: APXvYqyJIBEvkzRxak2H4oSC+B4IrTUWMppna/j/5okMp8mJOZDIzQZO7fW3DM/SSKsvBnNpVo6CpBUr+MTBUNKXHSM=
X-Received: by 2002:ac2:5283:: with SMTP id q3mr4024302lfm.21.1575407549730;
 Tue, 03 Dec 2019 13:12:29 -0800 (PST)
MIME-Version: 1.0
From: Umar Dockrat <umarfd@gmail.com>
Date: Tue, 3 Dec 2019 23:12:18 +0200
Message-ID: <CAE08+QYSM4jQEc31qe4t=K1EbfX2wKSpeGSFkhCFOM4iW1fAWA@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] Integrating Texes Instruments PCM1860 ADC
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

Good Day,

I have been struggling with the integration of a PCM1860 ADC for audio
recording. I have created a "sound card" board that contains both a
PCM5102A (DAC) and PCM1860 (ADC).

The main processor is an Omega Onion 2 which is based on MediaTek MT7688
SoC device.

I am struggling with creating the device tree as the Kernel currently has
reference to the PCM186X where X is 2,3,4 or 5 but not the more simple
PCM1860. The difference between the PCM1860 and the PCM186X is that the
PCM1860 does not have I2C control and is HW configured using pull up/down.

https://www.kernel.org/doc/Documentation/devicetree/bindings/sound/pcm186x.txt


I have tried multiple device tree setup's and have only got the DAC working
when configured in isolation, as soon as I add any reference to the ADC
then both DAC and ADC are not recognised.

This DTSI allows the DAC to function
https://pastebin.com/z9H67DHd

There are my attempts at including the DAC and ADC:
https://pastebin.com/RLsKNsiR
https://pastebin.com/rmJVcCz1

Please can someone assist with the correct way to integrate this ADC
device?
Any suggestions on how to properly debug this further is also really
appreciated.

Thanks,
UFD
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
