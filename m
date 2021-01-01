Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6532E83DB
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jan 2021 14:27:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6979716E6;
	Fri,  1 Jan 2021 14:26:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6979716E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609507616;
	bh=bb4MhU5yLr7+qFqSPP6AqEtElrsxoknE03Y8Jqiny+A=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AJ4zoshLf/R3BcUVYHWeHMzAWn6a/2Zfja2zQKDxjhzXZYiSDObKiz/DGXUfEXrlc
	 918cMBgs+VUUj6QogLn/FEi9+RJ++sKUJfiY+EeJPqwr+iAPxawHv89SZ0/qo1QFV1
	 eZLMGeOuy1mMVVu8GwatPshr3nFrjdAiJdKpP1Fs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47860F801ED;
	Fri,  1 Jan 2021 14:26:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D9E3F80245; Fri,  1 Jan 2021 14:26:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB21FF8015F
 for <alsa-devel@alsa-project.org>; Fri,  1 Jan 2021 14:25:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB21FF8015F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Wa1QVpHW"
Received: by mail-wr1-x431.google.com with SMTP id y17so21975125wrr.10
 for <alsa-devel@alsa-project.org>; Fri, 01 Jan 2021 05:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=N2lDy9/TSo1Q0eaHUZMjAV3VX4LqfddeRPtN3x+vRug=;
 b=Wa1QVpHWHcrE5Yy2xLW8M+QROIcR/5qiQciMXDyF36QU4Vy2awh3k0GMlBSBl6sW2J
 gLtRk4FM1V46Br2K2C4YksIzwj9v4eVQFflXNTadZXKy6HExF1aShLOrZS0vi51Z5nbV
 5iBcURCW7/lsiy3CTy7Bs6DdjmxTTnQbw7aTvVgnior8RWIr+v8oSBL63eFKiNGZtt8T
 YzaCqIWs5wQWGRvHNXghoeTSWJi6/55GiIQNKi9/21d5ajiuofuvx8tslX4k1YYGJWPK
 nJns4cTFFccm5F+ll8qnmZCngokr1TJu1nM+5YkgO8ArLTq+jLv2HwgG/IAozfiqEJqY
 wHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=N2lDy9/TSo1Q0eaHUZMjAV3VX4LqfddeRPtN3x+vRug=;
 b=Pes8kAZjYqZoBFO8ROykWvujAMJwj+CkEUscMTjoACNKUo9RRxEn+3sQFIk6XVuRWC
 lEBG0zjxMX0uQ7Sjn6XfRktYOKWUcalEzuE4IOZtzg6XVLSqqU/cFc/6/hbBpq9CYI+U
 tywjPh4YY4tXGKVdcCPCJ5iuPCoC/wY9NjaOwaokcw+xfZmczEDHGRWyI0x1PWFIu9KW
 e37SQDwIp2JpBjnjZBsJxbpjb4C06uwgjIPU1BNgZROPetEeUmvR6xkMCNXuIq5EcdX4
 /8z0sPfxI67CDj7nj/vH2MB4RzZO/LpQk3Z5A4mJjId0JIdFPHw+EkfYyk4Nbwrm2ypv
 sOxA==
X-Gm-Message-State: AOAM530pE9KZm+a7NlRvvpI3EfxbKS/IJtMQw508wOciWHBbTirFa8gX
 op+L0jw+yvKrAjaHen41b50Xak2ESnyZ9g==
X-Google-Smtp-Source: ABdhPJyQj8cghiNOQIGgQpdd0hHN8kti6YsnbBSSfOe6FVlPItd4It1ac8fmHSGbxFDDPqUDC0+Uvg==
X-Received: by 2002:a5d:4307:: with SMTP id h7mr69377292wrq.353.1609507552656; 
 Fri, 01 Jan 2021 05:25:52 -0800 (PST)
Received: from cl-fw-1.fritz.box
 (p200300d867287f008e6f6d509bafaa1a.dip0.t-ipconnect.de.
 [2003:d8:6728:7f00:8e6f:6d50:9baf:aa1a])
 by smtp.gmail.com with ESMTPSA id u13sm74768118wrw.11.2021.01.01.05.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jan 2021 05:25:51 -0800 (PST)
Message-ID: <1f5c37af35419358a8d7f22544490088675b2c3f.camel@gmail.com>
Subject: Re: Haswell audio no longer working with new Catpt driver
From: Christian Labisch <clnetbox@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Fri, 01 Jan 2021 14:25:50 +0100
In-Reply-To: <s5h1rf4c10a.wl-tiwai@suse.de>
References: <8b005c64fe129fc2a283da90b2949b1fcb42e8c2.camel@gmail.com>
 <1ad341b1b0e0eefb83d157ac24d162eaad53ab32.camel@gmail.com>
 <0111f282-f044-47ed-f93e-5a19de61bdce@metafoo.de>
 <088cd3b6ba6589266e316d6adcb76861edd18775.camel@gmail.com>
 <s5h1rf4c10a.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: gregkh@linuxfoundation.org,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Takashi Iwai <tiwai@suse.com>,
 amadeuszx.slawinski@linux.intel.com
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

Hi Takashi,

Thanks for your suggestion - unfortunately it does not work.
Still no sound after adding the boot parameter and a reboot.

Regards,
Christian

On Fri, 2021-01-01 at 13:09 +0100, Takashi Iwai wrote:
> On Fri, 01 Jan 2021 12:10:23 +0100,
> Christian Labisch wrote:
> > 
> > Hi Lars,
> > 
> > Thanks for your response, as requested I ran alsa-info while playing audio.
> > Please check the attached information - to me it looks like it being a bug.
> > It should affect many users, will it be solved in the next release 5.10.5 ?
> 
> It's likely some runtime PM-related changes that caused this behavior
> change.  But, there must be some program that sets the power_save
> option explicitly on your system.  As dmesg shows, the default
> power_save to this device has been suppressed, but it's activated by
> the later action.  On, 5.9.x, this didn't take effect, but on 5.10.x,
> this became effective, as it seems.
> 
> You can try to pass power_save=0 option to snd-hda-intel module (or
> boot with snd_hda_intel.power_save=0 boot option).  It could work
> around the issue, although it's no solution.
> 
> 
> thanks,
> 
> Takashi

