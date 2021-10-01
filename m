Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1227841F83F
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Oct 2021 01:34:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 461FE16DF;
	Sat,  2 Oct 2021 01:33:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 461FE16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633131288;
	bh=5pEDyMIfetgnWBcRM+8nPbVQWwiy1VJWa3OoNpcnepo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KfzQow8Tjby1rZuG4IxfKKUzrkcdj9tEYv6gLrY6zLi3j74nbI96lpbMgHIcjRvYR
	 HWV8Q3ufz8Q+WBEZCu1a+AlhJhHykvqD2jNeHTxQuI9oVtgm5y3y+IsC8Sb5Xsc0z5
	 Nwu0B36kaAvdkZndK01iZXd1Ka7IznP1jk0zuWco=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBC13F8026D;
	Sat,  2 Oct 2021 01:33:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79F2EF80245; Sat,  2 Oct 2021 01:33:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A5D5F801F7
 for <alsa-devel@alsa-project.org>; Sat,  2 Oct 2021 01:33:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A5D5F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="M21Spffx"
Received: by mail-ua1-x933.google.com with SMTP id 64so7783153uab.12
 for <alsa-devel@alsa-project.org>; Fri, 01 Oct 2021 16:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Az2ZwLEgAe0ltkXib0Rl0Z43gR7D/6GVhGgAnp8gRjQ=;
 b=M21SpffxV7j8xsLxu4LJA4ckJ6JZH4GDJDiKl/YZNfGmAt3cxOAe2nz/v0uZLYwBt5
 YYsi1fZC9Q593imWRcj0uCjPCPZa8MXXJIcjI254O5l3o7yodaROlHqSx1jaVCCIN8JK
 /Tm8w8YOEAYgItU51BgUMC9mYBvTijx5e+IvtYUv5Ng5lSZaSeDWP843bA17FjdlqJeG
 l6ivitpbfhHocfrO1yJ9jjAMMhTmBNEHF6me3CNIqJ4YZi2sDvT+wRuAfCMWAlpVo5eo
 TIocOwjtKE9Tu6TOm+ZRLl2oQmsJiJu/BokEFgboRbZO5uigSUituc9xS1Qt87zeoQEQ
 +UXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Az2ZwLEgAe0ltkXib0Rl0Z43gR7D/6GVhGgAnp8gRjQ=;
 b=mqsk3HyJamUHjOUhN6o9vRwaQUI2vVDG2Uq+OdMXTNElApDeGm7WIiVzmCGZvqbX4j
 ZtS0UbEBWs9IPhKDdY5IT6XB6thFGuDl2EiMXWGXKpdqvfdtxoEZI40RDcH3YAHtEDjQ
 Vz29bHwfZtY9W9vNQEZbGCwA8V/a+P35poPqQL6Oh2Fnd0pDrNWifrVq/mDX+8nTxGi/
 Yqh1gutri3Awe5/Zh+ADq3576t3skd0kxGgYM1/iscp/3DxwNoZWIo8NDYBcqO8pl2c6
 3x7CvLYFInh8wOetC/1U5ZRF9eVYc9oo4RXqzg/L0Zk4ngpi8ODdFMbFtTfHivYvTZSl
 s1Ow==
X-Gm-Message-State: AOAM532RdZq1hd2OGKGfKkO9V7kwgH0sTozJMTIahpsW7H1rP/djtlsb
 4IyCJEWiILMPVDKxpTzrTbw=
X-Google-Smtp-Source: ABdhPJzvRP+AZs2DIqeY9owx/R4OCS6m0XDYjxYxnmgzdYfHIc08qqttPxDvi0KGOyvSOxFtWBoELg==
X-Received: by 2002:ab0:3d99:: with SMTP id l25mr545585uac.83.1633131202665;
 Fri, 01 Oct 2021 16:33:22 -0700 (PDT)
Received: from geday ([2804:7f2:8280:6c81:98f0:31ff:fe93:2dc7])
 by smtp.gmail.com with ESMTPSA id r21sm3903379vso.22.2021.10.01.16.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 16:33:22 -0700 (PDT)
Date: Fri, 1 Oct 2021 20:33:20 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Zhang Boyang <zhangboyang.id@gmail.com>
Subject: Re: [BUG?] Setting (start_threshold > stop_threshold) makes
 snd_pcm_writei(a_small_buffer) XRUN immediately
Message-ID: <YVeawIksIf1wKa2s@geday>
References: <0b00ad37-41a3-f078-6600-d3580ad903a1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b00ad37-41a3-f078-6600-d3580ad903a1@gmail.com>
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

On Sat, Oct 02, 2021 at 01:31:12AM +0800, Zhang Boyang wrote:
> Hello,

Hello, Zhang!

> 
>    I'm using ALSA to develop an audio-streaming application. I try to 
> use start_threshold and stop_threshold in combination with small 
> buffers. However, I think I probably found a bug about this.
>    I'm setting start_threshold=100 and stop_threshold=50. I'm also using 
> a buffer of 44 frames. When I call 
> snd_pcm_writei(the_small_44_frames_buffer), pcm state came to XRUN from 
> PREPARED directly. I think this is a bug because the stream hasn't 
> started. It's hard to say a xrun occurred while stream not started.
>    I'm wondering if this is a ALSA-bug or a misuse of ALSA. A simple bug 
> test program is attached.

No, I don't think it's a bug. You're bound to run into problems with a
period size of only 44 frames.

Moreover, working with the code you provided, I was able to get a RUNNING
state without XRUNs with a period size of 4410 frames (100 milliseconds of
audio) but I had to comment out snd_pcm_sw_params_set_stop_threshold() for
it to work or I'd have those instant XRUNs.

That's how snd_pcm_sw_params_set_stop_threshold() is supposed to work by
the way. It creates a XRUN once the threshold is hit.

Thanks!
Geraldo Nascimento

>    Thank you very much!
> 
> Zhang Boyang
> 
> p.s.
>    I dug into kernel code. After writting hardware buffer, 
> __snd_pcm_lib_xfer() called snd_pcm_update_state(), which set the XRUN 
> state.
