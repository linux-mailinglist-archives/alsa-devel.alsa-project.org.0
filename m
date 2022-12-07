Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D67D8645A0D
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Dec 2022 13:42:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7067C1906;
	Wed,  7 Dec 2022 13:41:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7067C1906
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670416949;
	bh=XNylr1o2GriNA7XeJhBZk3A4urfgkIqU0Dde4ocPrSU=;
	h=From:Date:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O+q9XsRjQh9r0qC2lPMH7gMODleDXz/FkcjqnS6clJ4sYDJywn+JP3b8N+6jYGqzJ
	 lQVV7fXKKquIYeZ/YnwsUUXiChpDMISaI+d+q4jOTKdHJpI1YVIhtLQ2VqzPnpkck9
	 rZ3MotATAPTEG8qpDq7QYWuO72JrW1Qare/TZzi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DEFFF80301;
	Wed,  7 Dec 2022 13:41:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F17A5F80169; Wed,  7 Dec 2022 13:41:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 828DFF80169
 for <alsa-devel@alsa-project.org>; Wed,  7 Dec 2022 13:41:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 828DFF80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NeUOUUL7"
Received: by mail-ej1-x634.google.com with SMTP id fc4so13608485ejc.12
 for <alsa-devel@alsa-project.org>; Wed, 07 Dec 2022 04:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:subject:cc:to:content-language:user-agent
 :mime-version:date:message-id:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dCfP62VAKi29Q/mNaSjgpzkzI8eKKwmeJu38jpN11i4=;
 b=NeUOUUL7CVKlB428X6YqM3Cz9J7q+f9nUmBcjURFlMtlTlGuAJfv6bAQTQgoYyNA+p
 vbE+TC+kvaqyIp6AEMA4VKJmf3NAK4Jd2gZUKE+Z94YJefh4a0KTgOJayTF2iSNLHWCE
 2w7fpmCMq5Ba6WvDctRUekL6zWQd8wfyui1OjeG1+MsULCezqFjNcKzpcUKtZ9fLCFRG
 aIk2/m9Du54BTtr6h8CWeu1S94bqwdZTtYuQhuTDNd/8Q42LAkU8TbaYiR/6rvzsNsrH
 O5NuqwwkbaRj1WAImuTuzT5CqPsVcXpM6LB+Eew9E2UCScx+SwBZI700JdXR98/45tx1
 gCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:cc:to:content-language:user-agent
 :mime-version:date:message-id:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dCfP62VAKi29Q/mNaSjgpzkzI8eKKwmeJu38jpN11i4=;
 b=P5esjqrDpKd634LsTigRCwQ++VkkEY7Zh1s3K1bAUaunLKjP+PcmdioVPWsDWuup/Z
 z0Pg9ZnRZ6vKujX7vg5CbQ5X29j0wdIS1bNp4HZ2oyfA/eBMYadOOKaxXJEzUoQAFc1J
 Fz1ss43RAzDyvIGo1zMq/Vpdl3moCFGA/mC89Ia1KGOZKQkoV/Qasn3wy2dJH4RiGfsV
 Z7Ypstr6RID0NRn0J5zwZ74tqpSl436Tdt9Th67pxgThldXJ6ecmyB1SzZkWXyZKVeip
 lyk88ymqq/zIvUD3Ynf28z3CgfvRNk5lPHOdTs2DEI3pXq3nmDddxfB542IwToWnptrq
 BU4w==
X-Gm-Message-State: ANoB5pn8BvdC//+jje+lmxW2YgcxM3Bh1w+Cw9p8Htk8L23B9PjQIdYX
 ycEa9LZrT0FhENvUjAm9287miZMfcHwvwWx1nsA=
X-Google-Smtp-Source: AA0mqf47y832dI+r3uycWTlcf8qAmaVU31q6+NbbnYtTJABYegg2VXkFGQwCWT2fBIJViOSM1ONaGQ==
X-Received: by 2002:a17:906:f281:b0:7ae:3b9e:1d8a with SMTP id
 gu1-20020a170906f28100b007ae3b9e1d8amr73276816ejb.581.1670416885215; 
 Wed, 07 Dec 2022 04:41:25 -0800 (PST)
Received: from [10.0.0.182] (31-10-206-125.static.upc.ch. [31.10.206.125])
 by smtp.gmail.com with ESMTPSA id
 la9-20020a170907780900b007c0baedc9d0sm6526415ejc.95.2022.12.07.04.41.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 04:41:24 -0800 (PST)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
X-Google-Original-From: Emanuele Ghidoli <ghidoli.emanuele@gmail.com>
Message-ID: <4172f4b2-9198-dfc8-a2b0-d75a95265e14@gmail.com>
Date: Wed, 7 Dec 2022 13:41:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: alsa-devel@alsa-project.org
Subject: Simple card and PLL/FLL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 emanuele.ghidoli@toradex.com, Liam Girdwood <lgirdwood@gmail.com>
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

Hello,
I want to understand what is the right way to implement PLL/FLL usage on 
audio codec when using simple-card.
In wm8904 driver I found that FLL is used if set_sysclk is called (that 
means mclk-fs property is set, otherwise it is not called).
In this case the frequency passed to set_sysclk is assumed to be the 
"desired" frequency, the codec read the currently clkrate coming from 
"cpu" ("clk_get_rate(priv->mclk)") and use these information to program FLL.
In other codec drives I do not find a similar approach.
In general codec register the set_pll function but it is never called by 
simple-card driver.
I guess what is the "right/better" implementation? Have we to add the 
set_pll call in simple-card? Or have we to add it to e.g. fsl_sai 
driver? Or, in some way, the wm8904 codec driver is approaching in the 
right way?

Is there any documentation that explain all of that (I have already 
looked at Documentation/sound)? Any driver that is considered well 
written and complete I should use as a reference?


Thanks a lot for your help
Best regards,

Emanuele
