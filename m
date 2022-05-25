Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D23C534578
	for <lists+alsa-devel@lfdr.de>; Wed, 25 May 2022 23:01:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FCE516A5;
	Wed, 25 May 2022 23:00:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FCE516A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653512465;
	bh=yzAy7uVOrWy2btbv/yATT3NHgIH0p/5Z2fvXVXuY4dQ=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a4Yjw2egiYGHc0Lox8wqyldlrM/ZAF2u7hhb+yubAovTxbCO25XKZbnfZ5R0jd2aV
	 uZB6yVk065lcb6G2dEh/HcHZ6BTsrfLh584OhtELtKofzkOICGMsqtG0XzF2dT7osY
	 JL4egeKHiZx6QOiwIQSNilUEkXaJJ2y26GZyfFPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75533F80116;
	Wed, 25 May 2022 23:00:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6703F8016D; Wed, 25 May 2022 23:00:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA11CF80116
 for <alsa-devel@alsa-project.org>; Wed, 25 May 2022 23:00:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA11CF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com
 header.b="ZU6yZxcz"
Received: by mail-qk1-x72b.google.com with SMTP id x65so14270910qke.2
 for <alsa-devel@alsa-project.org>; Wed, 25 May 2022 14:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=yzAy7uVOrWy2btbv/yATT3NHgIH0p/5Z2fvXVXuY4dQ=;
 b=ZU6yZxczWcDhn90IcgteaTCE6Er/+tqZZ8iBw+pqR6b1czxIdnRKLA54QAFKkxNx22
 PzUQIWOKsVSCmVacFn2Wy5tx4XqwdyDwFLJB7EzS5Mli39kF0ltKZ9Py1b3IF1Rc8ok9
 I3gTnWP/pwLEsF+UJajL65OCG3tKisHHyKieg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=yzAy7uVOrWy2btbv/yATT3NHgIH0p/5Z2fvXVXuY4dQ=;
 b=TDkXd8AyXi/fXfaOVOJrqzF5gwnHhSbLtQb8OZu/8cKjfodeQ2gxrel1uv3jKaR1v6
 pHe92VjF4gFCCbhkRyRKrsiGJmM6AreGVyPv7pFbeZpNnfa1s8UyIveZfoNWed+4+zry
 +85vvP2o/M1t90FmMFw3967THkeErDewsvRb0cAPw39CjXnErBcmmWWq/ktAEikJAYB7
 IbLR9kmL/dkJm65joySesAUIB+6TlRKBmuuw+TGKLtWseHApe2bFlxFnsBAFw3OaJ3CX
 6tEKWSnhRJHbkZvy6qeMwUv6P6GcqgTzi4zjKuZhMbRcomIK4iT5LIvfQy3ac2pNzSOX
 cYdg==
X-Gm-Message-State: AOAM531AyEfIZqd3Y52wZpfDyOPvrB4jNU9rxADKnbAnIpGqsqCZFJJc
 3bT+tn1O5J8AldtjJT1lcY1dMGvvxUOkqBNSBfXozr+cQTiztA==
X-Google-Smtp-Source: ABdhPJyGyNtzV/wUqStpeK/CMlDHIP40Mx07THSuZ7Qsty0bq8Lt8KvyKpBWsnsy0N0LfhyaqDw6VHxpX6ZeCt+9MQw=
X-Received: by 2002:a05:620a:2992:b0:6a0:94d2:2e5c with SMTP id
 r18-20020a05620a299200b006a094d22e5cmr21521242qkp.62.1653512399282; Wed, 25
 May 2022 13:59:59 -0700 (PDT)
MIME-Version: 1.0
From: Michael Welling <michael.welling@konsulko.com>
Date: Wed, 25 May 2022 13:59:48 -0700
Message-ID: <CAMM3KADDNMD0X6q_vPbe8xLgzJ3Unguhz29Xk5cwnwaD2YmwRQ@mail.gmail.com>
Subject: Enabling fsl_sai MCLK before codec probe
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>
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

So I have a tricky race condition that comes up with hardware that
combines imx8 with a pcm1681 codec. The pcm1681 requires that MCLK be
enabled for 65536 cycles before accessing the I2C management port.

The imx8 sai driver on the other hand does not start the built in MCLK
until a confluence of events that is not triggered until just before
streaming starts which is too late.

Is there a clean way to start the imx8 sai MCLK before the codec probe occurs?
Or have it started and delayed during the codec probe before it tries
to access i2c?

We have a working solution but it is a bit overreaching and adds a
callback function to the snd_soc_dai_ops struct to start the clock,
and adds the code to the fsl_sai.c to toggle the appropriate bits in
the SoC sai driver to make a clock appear and registers to the new
function callback.

Then the simple-card was amended to add the appropriate enabling
through the new callback such that the clock is on long enough before
the codec is probed.

There was some suggestion of caching the i2c registers until the clock
is enabled but this would be difficult given the clock is not started
until streaming starts and we don't want to stream until the codec is
initialized.

I am looking for a solution that is minimal and robust.

Any pointers would be greatly appreciated.
