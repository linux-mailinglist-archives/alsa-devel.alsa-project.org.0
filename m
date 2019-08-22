Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E0199E8B
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 20:18:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E9421666;
	Thu, 22 Aug 2019 20:17:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E9421666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566497897;
	bh=qNRTdIxahP4yIffBW8LL0aEF+CEEiuaDjvJI3262ohM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tWbV+YplYDYfZfSUZQzuwAFVTmiydC/lPvI52xK1QpzidS/4GirQDn/VljL3fK1XR
	 Yxw5yUT7Rni25G0kpME7Db6YTnlQyFQbMgUCwQy0SyR7yOXuTqHFPhF9StkOd7NBi+
	 JDOLQpgf+2nZuxm4u0rLcLMmBG3gPDRF6Z4/MeTI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0F98F80391;
	Thu, 22 Aug 2019 20:16:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB096F8036E; Thu, 22 Aug 2019 20:16:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8D6CF80112
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 20:16:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8D6CF80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FQvwb1l0"
Received: by mail-pg1-x529.google.com with SMTP id w10so4126389pgj.7
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 11:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=W3kptTBslAzPXBCKsTvqtwxGrUy+wu1JabpYbyy8jr0=;
 b=FQvwb1l0qaJiB0P7pZso/2IHFpgCW22YpAKockn3LCukG7qeiKcNGjmzs+wx1baAq1
 hjvTZdFgkBBzf2cIKfSoRkxIzTL1APsrGmPR/R85R/R6uqTpSvqTa2j920Xqopt+x/Vt
 Esd7GWZrirvkmlKFP7e13xKJsCfSw3gitZIQiEyGI9DuofrtL5NYOAJUBFY9bfGCpVRW
 RyGRrkqEMsAyrefMtEig7wrZmKmRk8pWSsxTBl1udM6FJFbtsw/IA9u+ARCpycdYB9Xl
 p1MvUmjtovS8RGBHAy1zdp/rGXUcrQxE7UJx7LNl+DRHo87JDLJYQ1bRiCZGFa729gUf
 /QNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=W3kptTBslAzPXBCKsTvqtwxGrUy+wu1JabpYbyy8jr0=;
 b=QSGjnlGf+Cg0yfZ378w6vB2udXO3oY3EDXuqXwXr1sZvAiop8nR2sNKbWSvupCVK15
 JAYxX4JwJSfmPF8KMSEidgE/bWKpsSkBn/w3TAefCWrBuCEr9sHg8E6Qq9X5vbnDJ604
 SZYsLjnOwb85DF7JX9tC1MFylu9XKp7BKkVJKu4wEkqYOnNgKHdVWiUn1wOutBMjrG/H
 q0OhVJ7Xq82H5KpDzaGu2mNZUGYW1W1OqMsQMSR5P4LP5h9X6+wnXwHrAS3caUs5Y4M+
 Q68x7EHehl+lO3MC7z/AJdL9PlS+TliXpcGJ5VJGL21IJ2fqaLpKEYsPVodge7muEV9v
 T9Ug==
X-Gm-Message-State: APjAAAXqhujuH44v7MwMIoIIFEV7/M+BYe1WjSLiLOHBNtZyggoAfu4d
 ICC1sUpkS9/EqTJbyNDPyEM=
X-Google-Smtp-Source: APXvYqyiqpbRnqs1D4820DbRQSb4fOCe75D5lzhtL3p1Nfa54wWStJlIXvFXrdC45TFxS00RICp/yQ==
X-Received: by 2002:a63:b102:: with SMTP id r2mr466093pgf.370.1566497783999;
 Thu, 22 Aug 2019 11:16:23 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
 by smtp.gmail.com with ESMTPSA id f27sm23033pgm.60.2019.08.22.11.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 11:16:22 -0700 (PDT)
Date: Thu, 22 Aug 2019 11:16:19 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: bgoswami@codeaurora.org
Message-ID: <20190822181619.GH76194@dtor-ws>
References: <1558730438-16524-1-git-send-email-bgoswami@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558730438-16524-1-git-send-email-bgoswami@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, plai@codeaurora.org, tiwai@suse.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org,
 linux-input@vger.kernel.org, Gopikrishnaiah Anandan <agopik@codeaurora.org>
Subject: Re: [alsa-devel] [PATCH 2/3] input: Add SW_UNSUPPORT_INSERT define
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

Hi Banajit,

On Fri, May 24, 2019 at 01:40:38PM -0700, bgoswami@codeaurora.org wrote:
> From: Banajit Goswami <bgoswami@codeaurora.org>
> 
> Some devices may not support specific type of input devices. For example,
> when a headset or extension cable with GND/MIC swap is plugged into a
> headset jack that does not support the headset/cable, it needs to be
> reported with a corresponding input event. Also, increase the max values
> for INPUT_DEVICE_ID_SW_MAX and SW_MAX, to accommodate future extension of
> the number of event.

I do not think that adding this switch is a good idea as it will not
allow you to easily extend the reporting and to convey to the user why
something is not supported. I would look into alternate mechanism to
signal when and why a headset/peripheral was rejected.

Thanks.

-- 
Dmitry
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
