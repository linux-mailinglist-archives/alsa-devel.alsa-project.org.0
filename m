Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B535E41CD9E
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 22:51:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54BD816EA;
	Wed, 29 Sep 2021 22:50:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54BD816EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632948699;
	bh=jW9R70ZVmK5zlTh406exRfLL5lu6zYY3DqUm8Mz9lnE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qFFvHi/wrNT/SDvhEkgwu+hSNt8mdfCxYgCxxAx3pkpI7qfiJt10N9XqzRAV+miRJ
	 bXoz9PVE+6glwIoTQqpmQJ5jTggRXre9bXgusfiL8iBzjJMx3C89ZtVcsVJFxPaDHx
	 BJueOzmmny3Aakc44GQPorMu8Ch2j+2jxhtsvEd8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEBC1F80113;
	Wed, 29 Sep 2021 22:50:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10D26F80227; Wed, 29 Sep 2021 22:50:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99A1AF80161
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 22:50:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99A1AF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="N8F09wL8"
Received: by mail-qt1-x82c.google.com with SMTP id c20so3641060qtb.2
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 13:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8RYDBUsKZf8FoLqZ3UaxSfm5AEZBMAmMutrsRTlRdV0=;
 b=N8F09wL8FZO9HMqXXVkzEkBTKEiFiCYQbtCbOpBL8GTfwYPSJC/REzvE75MQN4u49f
 MqKd1oCmUz4nBFbVdczhG2RAKHBUFicn6RmrTdTpDfTuXQToG66af0SXgf57owq+Xe2k
 4ueTCCuh6XV1XMeaa7psR8fTDvaV04IgM7j7FBwZYYzNCicnAYeow7/Cs4gXHFn1TIx2
 w4jG+lvuMPtyQEQZobZR3ET9bxvs6tORklGvii87HNNy5aakpBQWei0jzC8L5USaAoK7
 GECPuzLOwsVx56+lzL5w40GnXqKaTYEuEGVp0+beq3f/8qQrmahoJFCKUi1bIxiV6oTu
 ikmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8RYDBUsKZf8FoLqZ3UaxSfm5AEZBMAmMutrsRTlRdV0=;
 b=6HEX7Mt7wEsrQFMFsN7YWRrW+TiQZ+QGywLMKvsmrWGB0QmZ7pbVW8SmsLOPyC+iNY
 s1I0+tw8ZVhxjnezEBCNpL5qnGpz7XrkW04Ki1/0CcN2PGe5SRZZxFA80tVHvMcqDiUW
 jXvqP4LowMEXSspcurOI8hXemXnW9IMVgmsggkOIeX/XnQhRmdWjLPhS9B2kfbyKozkX
 R92X8WhDKy6KlaVfcwdY403wxHsGx780wMldE7C9ikBat4HLDFy+Q062ETFJyToWqfZ9
 gN5aSpfUJNjFvo4s/ZkmBgUWCmXwNtsOOSw89wHEgj9Kn1pSfuCMSrWwkQyvorNzGfNw
 xQjA==
X-Gm-Message-State: AOAM532xvQcGmM2pXQbstyrgkaKTcuN0jZ/fNsRW7R+avP2GGgYRAPyT
 kVKfwOZRSXXMDjyh0LJU3N8=
X-Google-Smtp-Source: ABdhPJz+bsH7NNp0kMuKhaA571wpUUEaO0PBkmtbcdimm6UD/4LMfBXe2sCKjqOWc/4Yz1QWyS93Pg==
X-Received: by 2002:ac8:71d4:: with SMTP id i20mr2354145qtp.248.1632948611267; 
 Wed, 29 Sep 2021 13:50:11 -0700 (PDT)
Received: from geday ([2804:7f2:8280:7522:98f0:31ff:fe93:2dc7])
 by smtp.gmail.com with ESMTPSA id p201sm516267qke.27.2021.09.29.13.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 13:50:10 -0700 (PDT)
Date: Wed, 29 Sep 2021 17:50:11 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Davide Baldo <davide@baldo.me>
Subject: Re: [PATCH] Fixes HP Spectre x360 15-eb1xxx speakers
Message-ID: <YVTRg3gyoI0CpEjD@geday>
References: <s5hee99nfzg.wl-tiwai@suse.de>
 <20210929204236.4571-1-davide@baldo.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210929204236.4571-1-davide@baldo.me>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

On Wed, Sep 29, 2021 at 10:42:37PM +0200, Davide Baldo wrote:
> Thank your for your review Takashi, the entry is now correctly
> ordered.
> I've received some feedback from a user from bugzilla
> https://bugzilla.kernel.org/show_bug.cgi?id=213953
> To address his issues I've added a variant of the laptop and forced
> DAC1 for both speakers.
> 
> In laptop 'HP Spectre x360 Convertible 15-eb1xxx/8811' both front and
> rear speakers are silent, this patch fixes that by overriding the pin
> layout and by initializing the amplifier which needs a GPIO pin to be
> set to 1 then 0, similar to the existing HP Spectre x360 14 model.
> 
> In order to have volume control, both front and rear speakers were
> forced to use the DAC1.
> 
> This patch also correctly map the mute LED but since there is no
> microphone on/off switch exposed by the alsa subsystem it never turns
> on by itself.
> 
> There are still known audio issues in this laptop: headset microphone
> doesn't work, the button to mute/unmute microphone is not yet mapped,
> the LED of the mute/unmute speakers doesn't seems to be exposed via
> GPIO and never turns on.
> 
> Signed-off-by: Davide Baldo <davide@baldo.me>

Hi Davide,

I think you forgot to add a v2 to the [PATCH] headline as in [PATCH v2].

Thanks!
Geraldo Nascimento
