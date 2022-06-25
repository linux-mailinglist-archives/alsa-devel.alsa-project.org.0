Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E773055AC79
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Jun 2022 22:20:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 372F516B9;
	Sat, 25 Jun 2022 22:19:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 372F516B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656188401;
	bh=r0zgKcm97EJzbVjdXR1baLaqYq5lH9/D/ydb4jVw8Ns=;
	h=From:To:Subject:In-Reply-To:Date:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=t+8RhBFm+46T3j0vfqLfBQGY7PDVkiTLbDxvIZgtyyOIC1krmK1OfsCp2aZeEFlF0
	 3fyhZidG8sjMGnLMQOP8XEF2Kn1JiMBvJbjXcjJK8ArV4nwNbRo1pr5G3NqlTUUiqN
	 iLHZVuRHZT25hmCN6M9bGuWwGbRz1f4F9GfoAq1Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90CE9F80109;
	Sat, 25 Jun 2022 22:19:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1EF6F80162; Sat, 25 Jun 2022 22:19:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2156F8010B
 for <alsa-devel@alsa-project.org>; Sat, 25 Jun 2022 22:18:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2156F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oJArxy16"
Received: by mail-wm1-x336.google.com with SMTP id
 u12-20020a05600c210c00b003a02b16d2b8so3336022wml.2
 for <alsa-devel@alsa-project.org>; Sat, 25 Jun 2022 13:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:date:message-id:mime-version;
 bh=Zr5TYuLs322d8i3hPwwTEw4UeO0cvecZhrQFoFZsZDI=;
 b=oJArxy16dC4WrwEb0nUbrFC9qHMiaqqRKXV8IR1+mOBOCumDBukfiVBiBr19n3oQrJ
 WW+oEKjEv/E64wHvuoeG3GZo+YEaB6h/xBhlRiVBaZ5++cGvdGYRV+Bw3X3NAO0q9bM3
 izsAiXz5fuBD3vZdsYCNnKIJkdkSFgjo/lGus5d5e7FPu0mQymj2GOvdAEzcH8p879QS
 ZMq7XkbvWfmeiuCeq4daAJHNMq1GnWWIyJpwIGHOv6wCh7MBD3JLXe/d+urfl5HMX8T8
 gqfIISros1EpTb2z55wcE6BhUogzgrlFJCvMH2KhQaE0hZ8G7HTYh4k8wf6rzQShnM3d
 Oydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:date:message-id
 :mime-version;
 bh=Zr5TYuLs322d8i3hPwwTEw4UeO0cvecZhrQFoFZsZDI=;
 b=v+roTyy9dz7/hYjdjiSQgmWomZGGjl4cPF8ILqZUp3epMKvY7zAo0DxRlFAlX6MQUd
 knVr/CHJAmXMiLtNc/Ry3TT+zLSVmUO/yRLyKpa1tyTywpr61yy92mg842KgKzwAVCoM
 DOrrRqfZY1qbbvhqoF+6WL6A+Fhsog/TBEbb7HyZflS0V53XDFBwCptBWvTGKaE11G7d
 KnnlQsn5F7Vqrh4Ca+ZURRkCLVcbgVxmasknrJ5fgrfwAeYqvOu0WcpWRo75cbPfR3YT
 Df5Pt7gqj+fTcUMzSrp/b0BKXBWkI/6Hyf7aJUvi8G4InjjmiIIMjRXnthTzM5N2OwT2
 /BRw==
X-Gm-Message-State: AJIora8f6C+nQigVyz+wQhvLA2ESede/6vO7Y6+RoMPnfLY+Y1LiqLbN
 Ij3IghN0H0BgRzO53CJnG/s=
X-Google-Smtp-Source: AGRyM1vV0vTlgy/6xlxHFUw3cvhlqrMnLw5DOqcNrBpnRYCiFNuCLLkfMPo051C2VPWQ+3Rm/K4IVg==
X-Received: by 2002:a05:600c:19c7:b0:39c:30b0:2b05 with SMTP id
 u7-20020a05600c19c700b0039c30b02b05mr6164392wmq.170.1656188333023; 
 Sat, 25 Jun 2022 13:18:53 -0700 (PDT)
Received: from localhost (92.40.170.242.threembb.co.uk. [92.40.170.242])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a05600c1c8800b003a04722d745sm23025wms.23.2022.06.25.13.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jun 2022 13:18:52 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net
Subject: Re: Questions about driver implementation (1 I2S controller to 2
 codecs)
In-Reply-To: <1310ER.AOPVK6422Q8P1@crapouillou.net>
Date: Sat, 25 Jun 2022 21:19:58 +0100
Message-ID: <YDzzGSWPBbtkGDRbdAaCsnxpIqqDpyJe@localhost>
MIME-Version: 1.0
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, cbranchereau@gmail.com
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


Paul Cercueil <paul@crapouillou.net> writes:

> Hi,
>
> I'm trying to add support for a new board that uses the Ingenic JZ4770 
> SoC.
>
> This SoC has a I2S/AC97 controller, and has an internal codec. The 
> controller has a register switch to select either the internal codec, 
> or an external codec; both cannot be enabled at the same time.
>
> On this board, the external speakers / audio line are wired to the 
> internal codec, while a HDMI chip (ITE66121) is wired as the external 
> codec.
>
> I'm having a hard time trying to figure out how the codec selection 
> switch should be exported. Should it be a regular widget, and the user 
> is responsible for selecting the right codec? Should it be a DAPM, and 
> plugging the HDMI cable auto-enables the switch? Is this configuration 
> (one controller to two codecs) already somehow supported by ALSA?
>
> Right now we're using a "simple-audio-card" in the device tree, and 
> trying to add HDMI sound support. I am not even sure if we should be 
> using one sound card with the two codecs, or one sound card per codec, 
> sharing the same I2S controller?
>
> Any thoughts?
>
> Thanks,
> -Paul

I'm also interested in this, although I'm using a different Ingenic SoC
(also using jz4740-i2s). In my case I have a microphone connected to
the internal codec and an external codec for playback.

Some thoughts: maybe DPCM is what we want? There's three DAIs: the CPU,
the internal codec, and the external codec. The I2S controller selects
which codec DAI the CPU DAI is connected to. DPCM seems to be the only
thing in ALSA that deals with dynamic DAI <-> DAI connections. I can't
figure it out though; the documentation is too sparse and DPCM-enabled
drivers are complicated beasts.

Codec selection should probably be left up to userspace though. ALSA
isn't really in a position to make routing decisions like that, there
is no one-size-fits-all approach that'd be suitable for every board.

What ALSA _can_ do is respond to the user's audio routing choice and
look at the machine state (jacks/connectors, muxes, mixers, etc), and
power things up or down as appropriate.

Regards,
Aidan
