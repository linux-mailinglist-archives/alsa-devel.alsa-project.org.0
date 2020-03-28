Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5AD196868
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Mar 2020 19:28:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F56A1672;
	Sat, 28 Mar 2020 19:27:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F56A1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585420117;
	bh=9HitpvSOd4uXEzSWgcRjtySs6cY4CUU28PBLMZZKcK4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bl3Xbx4YUgGCoU9pStTt80rs/gnIoiv674Dv1zT5wdgz+XFxwJUSern+udKQqvlA2
	 Opmb7Q2Y1cZmE1umbWXo2XehdB0Q5v1HVYsCPGbhQO0gnpJX9wtKxMPjjQIvlPYanK
	 zTz4/o/Stt3mCjA7xzqkHiJDBvsU2dpYL7XFndwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EEE8F800EA;
	Sat, 28 Mar 2020 19:26:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23AC8F80234; Sat, 28 Mar 2020 19:26:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B088F800EA
 for <alsa-devel@alsa-project.org>; Sat, 28 Mar 2020 19:26:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B088F800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FwF0eXSo"
Received: by mail-wm1-x343.google.com with SMTP id z5so15078292wml.5
 for <alsa-devel@alsa-project.org>; Sat, 28 Mar 2020 11:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=46Rp9RE36yDQbFcaSnGrDTEn3YHuIH+Fs7PXkeNHX3I=;
 b=FwF0eXSoEh/4k/gV8jNV6I1bnz61NktG4hU8zEAC3EOIki68SqorUZ6HEzsp4bZEzn
 ErZXLPMvC53Ud2GkGSWYWuOAagDK01wSZHrmSj7+M/acWztD+73WikeoV11WxgERyRVR
 s1hYtz5Bhq5Nula/aEhcM4X01C0jMJkgWhfQv3ZTTdEMXHqo1d+z9usRWgyY4D0wzgJg
 28amIFDhXFNxAyFJehLp9KGbwiGJKwUwPs1CPqD6ZKvvmOovucMI1+zx6dxNODo20V37
 OGDmC94XI/O1bsHSLIYqMxcx7S9SMOm8QuesAqcI8Kgc2H4oI82cRQMHVE6xGA3tkMoX
 FvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=46Rp9RE36yDQbFcaSnGrDTEn3YHuIH+Fs7PXkeNHX3I=;
 b=C4ImAS4+YWc7DuOcFO/N/Rq0gzUPfKQL+MKxnm1FNx+DKvt9vG9P+KuxB4QMW7GdSA
 WD4mkatZcKLXED+xn+qtt03wo3Ffj/uNVX07iOz2F3c8Ithdo/9yTmNVnHFB6pvIUHaF
 0dEVu56zp6w3sHg+FB3hwWRPdKju4vyTXMCNRmWokkDns8wJ0v1CvzRvLFDwCkeEyoPO
 lY2/mjhkKdbYCtGMwEk+sO7R/7phMthdqVJUd4QuOiRdOhhx9ino3Kn7w5+eBP1Zli4P
 y4kPRehZBfFPLUFW6AugHmivYm0xSSm7KeMc3ultt9MTu0PAfwSvlR/FYwUh6lSvcIDQ
 b/1w==
X-Gm-Message-State: ANhLgQ3chZIpKXr5eONQBxUpTM0ZIphhiY7EAzopbmpeacT7UVpV7U/A
 iRWAMjAvBRDAdYTaWL4LLY5chrnI
X-Google-Smtp-Source: ADFU+vsFyMh8fitEwUP6qiXm/rULwCRyLM5YY3I841g8+i5WZLoP6u7KpHPJlCs5Acr7TFGQvSOT4A==
X-Received: by 2002:a1c:7d88:: with SMTP id y130mr5035988wmc.5.1585420010622; 
 Sat, 28 Mar 2020 11:26:50 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id y7sm15286433wrq.54.2020.03.28.11.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2020 11:26:50 -0700 (PDT)
Date: Sat, 28 Mar 2020 18:26:24 +0000
From: sylvain.bertrand@gmail.com
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: sw_params for a direct-ed(dmix) hw pcm
Message-ID: <20200328182624.GA775@freedom>
References: <20200321155303.GB357@freedom> <20200325174419.GA1224@freedom>
 <alpine.DEB.2.21.2003261350380.2957@eliteleevi.tm.intel.com>
 <9d986c48-184a-1d6e-4c5b-172a7ecd98a8@perex.cz>
 <20200326200415.GA1321@freedom> <s5hlfnmfcdt.wl-tiwai@suse.de>
 <0b0f5117-3b4b-0c25-cd4b-0ecc72479635@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0b0f5117-3b4b-0c25-cd4b-0ecc72479635@perex.cz>
User-Agent: Mutt/ (2018-04-13)
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On Fri, Mar 27, 2020 at 10:40:06AM +0100, Jaroslav Kysela wrote:
> Yes, it's a bug which should be fixed in dmix instead to use a workaround in
> the app. The easiest way is to return an error in set sw_params, but it may
> cause problems for the app which assumes that this timestamp mode can be set
> freely. Perhaps, we can add a timestamp translation layer (not easy, I
> know).

I understand that, in the case of a shared hw, reasonable defaults should be
enforce to avoid that any audio application which would be first to configure
this hw and throwing some audio configuration tantrum, forces it upon all the
other audio applications (this is the answer to "why has dmix some defaults?").

Speaking strictly, snd_pcm_sw_params_set_tstamp_type() has a return
value, namely application code must expect a return code which could be an
error code. Additionnaly an audio app using the kernel interface/a hw plugin
pcm, would have to track anyway the type of timestamp clock at the time of state
change: the trigger timestamp of a kernel status ioctl used the type of
timestamp clock at the time of the state change, not the type of timestamp
clock provided in the ioctl (btw, what about some documentation addition?).

In the use case of a shared device, it seems the right way would be to send an
error back to the application (aka "making snd_pcm_sw_params_set_tstamp_type()
recurse down the plugin pipeline"), because after giving some thoughts about it
I don't see how it is possible to convert a timestamp from one clock type to
another: backlog all adjtime deltas, plus the initial values, plus any natural
drift? The linux devs in charge of time keeping may be able to answer this.

-- 
Sylvain
