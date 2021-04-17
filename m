Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1711363287
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Apr 2021 23:55:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 443F11687;
	Sat, 17 Apr 2021 23:54:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 443F11687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618696512;
	bh=8DsAhfZWzqLzCo0CF2hgoT3W75/frAmWoRs6tk9B7IY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ImyvAdiaq7TG5rmAAm1scK59z0m6Ir2cFcHdhYr8mkXZzWdeYEIkom9hBNaQpjN6G
	 E7D4AiW9WFw1NNtAetUcuCF8sgpJ6TgQTNRB3xBPqJvjE164R6fNqZ4pdPRNg9JVWp
	 v306kurveT4zCj5s/+qMeAJ4ItGyg9vi3z70sL7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F80CF8021D;
	Sat, 17 Apr 2021 23:53:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F163F8022B; Sat, 17 Apr 2021 23:53:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42118F80108
 for <alsa-devel@alsa-project.org>; Sat, 17 Apr 2021 23:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42118F80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kp69ipOQ"
Received: by mail-ej1-x633.google.com with SMTP id r12so47235553ejr.5
 for <alsa-devel@alsa-project.org>; Sat, 17 Apr 2021 14:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EV8u7rmJYv/pxMPZOpvdNXYRncA5qdC1pm9AHNZWHyo=;
 b=kp69ipOQ2mHA4wItmDbErDFdUD0anIKtWwmMUVwT2e2UjgK3QMp2YZjb/bM8djA8v8
 UHH+tMvsw4y3kONWjgNvhcEwCo+7r21pPaMecojc+w0c1GIythBtnvvSXIb8RXPd+9fc
 R4vJjhtgXI4iZ9l1G8rloOFL+3P0GmCBEUrZXn3uryQ4l0UiTElvauPqETKAnwFdsfFo
 m0iBM6w+ePbadfChUHkakHlwbBBE4bfsw/Io4ykbvXOMkd879wpOAxC5gsXX8272+jN7
 NTIDGfdp22IXSbzFNLdAKvqOjLPEn2T0GqhjjMdxrIWOj78G9WjjDXx1uTZ8QjDRBi0w
 B5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EV8u7rmJYv/pxMPZOpvdNXYRncA5qdC1pm9AHNZWHyo=;
 b=JwOdvqjWrLqbdyEEi+jjsCXbm3skA9DzH+QaGTx6428giWDdfg6MDtawwA8AsYbSKx
 dvFXJrc8+BNgxx+3yRlNlWDMg1cSXvhN+Kls9cjitvDi4oUvbQ7QqCXen4fCRCVvTMIl
 vKVJ7DNw+SX8uwKk1YM0YGwQcPzX8rFXBeqR8jV06UzZxbUrBJypEETqZTmQ3qFK+21L
 nyOtyPGhFCbsjj1GHVVPid7RL5t7mPEhzF2qbtlBES6CgKIicoIfqf/qLDIR9DyKPnh0
 uULdT/oyDYqSq0rzfegrTwSIU3UcjEgtNpu4Xa/zUoFLNNnAW6wqGI/OX4CLC2e9wcFk
 SV1g==
X-Gm-Message-State: AOAM531/IA8iR75pr4pecuQZawZ8+U0iWQFPAj+gQ0Bt1ag2Hpt7yAVG
 Tl7L7XLjPcnn4ElqTzNdb+F27pFtSRx+E5eO+T8=
X-Google-Smtp-Source: ABdhPJwVjzGifcXKniNqYfjUUYS4pHI2b1uiqcLsn9DooUeroKI6MY1rkyKES7ywS3uDaEote/aBPyTbyGGuXYuqGos=
X-Received: by 2002:a17:906:a51:: with SMTP id
 x17mr14617746ejf.25.1618696415578; 
 Sat, 17 Apr 2021 14:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAOsVg8rA61B=005_VyUwpw3piVwA7Bo5fs1GYEB054efyzGjLw@mail.gmail.com>
 <s5hy2dhfi2j.wl-tiwai@suse.de>
 <CAOsVg8roXxu4nA92HPXRf9dyb3KSzaCbsQZ=tJx7RDvhTSSzQA@mail.gmail.com>
 <s5hsg3oga6z.wl-tiwai@suse.de>
In-Reply-To: <s5hsg3oga6z.wl-tiwai@suse.de>
From: Lucas <jaffa225man@gmail.com>
Date: Sat, 17 Apr 2021 16:53:18 -0500
Message-ID: <CAOsVg8qQj4A0voHA3RcWHf-pPN9Mnu=GpMm3Cp04W62A3dGLmQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Add support for many Roland devices'
 implicit feedback quirks
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
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

Yes, I figured you would know if that was the reason.  Thanks for that,
since I had reservations, just in case it was something else.  You're most
helpful and wonderful!

Thanks for everything,

  Lucas
