Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 445D11A68AB
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Apr 2020 17:20:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2707169D;
	Mon, 13 Apr 2020 17:19:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2707169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586791226;
	bh=0iWxNHNxSH5+gIuNpsKhPDAtpGUoUa+IAoxT81ul4qA=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ucd687g7N3xC6gNwIuaUIRG6708XRM7iTdDTLAPsw52Wa2Nbj1cVi/SDwca/jnrlO
	 XDNjqhn0EnhFLE3x8R8qlusMvpz4z7uOS0Y6jLphQJTZ6X1CshpvyaUcC+zD6/soMg
	 ChkvvQ4R6BhxMXs/OPnLdAMcEhYnsizfagzhqMjU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6B0DF8025F;
	Mon, 13 Apr 2020 17:18:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B4A8F80245; Mon, 13 Apr 2020 17:18:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9786CF800B9
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 17:18:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9786CF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AsjaRIIr"
Received: by mail-il1-x133.google.com with SMTP id i14so8724954ilr.11
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 08:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=0iWxNHNxSH5+gIuNpsKhPDAtpGUoUa+IAoxT81ul4qA=;
 b=AsjaRIIrmptDRn0gyX6m6rbEMdIPuxl1kvSH7WdSCnsKbFuNKZbJ870fj1ADd+qS60
 gf3zzTPNwEk7u7KyFTG1s3a0tj4EVhWZifJBJeDZt3gTpeXTZ851ibNjqspTyVmi0qtP
 x2ThEtEE92keSQsXe+vi9sjcR+TqToY4QSpuLXOpneb7hZhDmWWVewNtQZgXJtIW7eMr
 yrOwOj/DKmzz/8dkswsf2qwddZuiQD95XvvD/glBJMJ1GSgQo7Gjl64G9YkT/53ZCDqt
 tCJME7RXNDva6CD1+g89fehEMRvOobKPMtLzCpq66QAq3uplFMAyuvBkI9d8OskKddKf
 W7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=0iWxNHNxSH5+gIuNpsKhPDAtpGUoUa+IAoxT81ul4qA=;
 b=Swd0+VQRBo9NmSANk6c9PCEK9ZewewQAiCJUoHXkZTTL+MfpVylQU+hisX8u9QfUSH
 ZZxCs824OP5M3bLyR/8LXOmmqj3RJg7cW61L8FI9khoIkhiWO/Z01iermlxRrRJok+Dr
 gr5Dw/FsEwtZ2ylUmfeMQn5AOalcTI8o/Ke/iMKoY42gyOIKEffdHC61uPBPE5pLn0NP
 9xJyQYMeozFYbzmpOStu1dGP+RgBdPLv/Zvt0afErknsj1bdU/wcJNB33UpdfnS55BVq
 Ac8StozKJQk6DUIFEvcjIlAPMzj4cCkMbNq9JpqlA5k/rtHcT9qQW8M3Jw4JCmojksSs
 /kUQ==
X-Gm-Message-State: AGi0PuasLp3SaIDCTyBPAJn7rnrsg1g5jIcX9i7hbLxxfip56fZZNait
 w8kR5rdKkYfyqEuk2eIzdQHXzrNJDijGEdb9xqI=
X-Google-Smtp-Source: APiQypK05Zq7H2cLaGBEPgAe0oaMAKXhw9HpW//44RndID6nwTE91JvWDK34fxDK99o4BsnPEpSP9m0S7uckDa86SVo=
X-Received: by 2002:a92:ba87:: with SMTP id t7mr17773085ill.287.1586791115154; 
 Mon, 13 Apr 2020 08:18:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a58b:0:0:0:0:0 with HTTP; Mon, 13 Apr 2020 08:18:34
 -0700 (PDT)
In-Reply-To: <a0c7ef47-83f3-c82a-17ed-f015c516d370@redhat.com>
References: <20200405183454.34515-4-hdegoede@redhat.com>
 <20200413131949.12341-1-youling257@gmail.com>
 <a0c7ef47-83f3-c82a-17ed-f015c516d370@redhat.com>
From: youling 257 <youling257@gmail.com>
Date: Mon, 13 Apr 2020 23:18:34 +0800
Message-ID: <CAOzgRdb=m9s98XseCot5LP8vnM_cBTFV4pWK3eKP9YofwO9Kfg@mail.gmail.com>
Subject: Re: [4/5] chtrt5645: Remove bogus JackHWMute settings
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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

Yes, you are right.
remove the EnableSeq.conf stupid Disable all output, i can get speaker
and headphone work on ubuntu focal with pulseaudio.
if remove JackHWMute "Speaker", speaker and headphone both has sound.

2020-04-13 22:39 GMT+08:00, Hans de Goede <hdegoede@redhat.com>:
> Hi,
>
> On 4/13/20 3:19 PM, youling257 wrote:
>> please also remove es8316 HeadPhones.conf JackHWMute "Speaker"
>
> Erm, no that is not right. The ES8316 actually needs this.
>
> The es8316 actually only has 1 amplified output (and no un-amplified
> outputs IIRC). In the reference designs (appnote) for the es8316
> the output is actually switched in hardware based on jack-detect.
>
> In practice this is implemented by connecting the L/R speaker
> output signals *directly* to the jack and through a analog switch
> which is controlled through a GPIO to the speakers.
>
> So when headphones are plugged in we can (and must) disable the
> analog-switch so that the speakers are disconnected from the outputs
> and the outputs only drive the headphones.
>
> If we remove the JackHWMute "Speaker" and then switch the sound
> to the speakers, the sound will be send to both the speakers
> and the headphones at the same time; there is no way to turn off
> the headphones.
>
> So we need the JackHWMute "Speaker" here.
>
> Regards,
>
> Hans
>
>
