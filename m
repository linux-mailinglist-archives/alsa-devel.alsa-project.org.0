Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2D262C8C2
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 20:08:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69D20F3;
	Wed, 16 Nov 2022 20:08:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69D20F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668625736;
	bh=NdwEpDUnBO45KT246BqyGhye3PmrULBWSVF+6/upxLI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vU+PJDd34TAq+54bS46rXuuBfs6JIHvrExhVzEl2JrItCM1KklFO3CLyG0YC+ockG
	 GMDy3V1ezHR6DthvffasN8ocv5U9xQUSxJU29pjFGxEr4rl16KaSHu1ceEeWkoOZiL
	 hYaqcjdequJzcXG2VdJ/Orpw7U4AEwllWnqzDQbQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7FBCF80238;
	Wed, 16 Nov 2022 20:08:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2CF2F80169; Wed, 16 Nov 2022 20:07:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FSL_HELO_FAKE,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9E6FF800B5
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 20:07:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9E6FF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qmsaZBsJ"
Received: by mail-pj1-x1030.google.com with SMTP id
 r61-20020a17090a43c300b00212f4e9cccdso3196118pjg.5
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 11:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=J5/L9gx7uHlkg6YvQqykA2KOy2JRTFm3MWwwROT0O+M=;
 b=qmsaZBsJQK2yABkO2BV73dp+CBmYwcdsg3ddxCxsumfdNAkXPkdXO5BIUQJuGzY4XC
 8VH1kPmwWqCK7BlD1OYgbBC9xoJnrXcdRUvZWC3XGqtK0dJ2OsH9ctEryLi2fq/v3Arj
 asmnkttcNzPtDXYU36nYEeo3sBK0wP+3sa18sTp1NpNptQ0iDm0hYwOlKeMq5q6C4XHu
 dgbY0oBxpbvRzjXzMM8YVThPQIbZl9ZydL+E4celtTvupzjMUHCpcVRkSxxRf1JBtCSU
 a5pUMM6CSOKgaYhBfuXzpo2vFz9oESDNJatJITLchdKKyPZ7+faH9ugwHqUFSOel+LSW
 V5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J5/L9gx7uHlkg6YvQqykA2KOy2JRTFm3MWwwROT0O+M=;
 b=YmrsbIhez+mxWda1Pcd6Qikh+UIYZWq3Qye7tT99FMx5BsRnZoPwR5TnPB47sjdir0
 WMaSJ5ZfXdGrQ/vNLO+CgEih7MmCNxs/nHYjYOx6ZF/Gw+heC1EaNjJr7ylyRN/truky
 mOxIB8iV20sSIMbJnOLXxFiE91R+SSElKPHGSXO7f/vONeMLynzwZor/qd2Pf9nXqMvx
 /OlPGtG3sheJRXoLzgJLEih7syaIk1vFfWIKdyk71CFn4Dks0Isl9iUNv5Y1u5SOWkzw
 lzFSk6uTl/2fHM7nSuFBslg/kidltjKHqkXVpB5QsnyWrFxqNAjWLGMZ9B2DzsCoZvF1
 1ywQ==
X-Gm-Message-State: ANoB5pn0paL7xeM9svttc9oI/0pNHgiTKjH37BEjVz3sjWyRwN49gRZ2
 A66fmtxfPxpftAJdW6CdKqo=
X-Google-Smtp-Source: AA0mqf5+bG9sEnMKP+9HajB56aaLXTQEP1UCjd6GRZbgnz6tt4861Uimqb2SYZgf0JkD6zXcvXK6Wg==
X-Received: by 2002:a17:902:8608:b0:186:61a7:ae94 with SMTP id
 f8-20020a170902860800b0018661a7ae94mr10206904plo.2.1668625672521; 
 Wed, 16 Nov 2022 11:07:52 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:fb51:2ecd:7287:8649])
 by smtp.gmail.com with ESMTPSA id
 o1-20020aa79781000000b0056ba02feda1sm11513152pfp.94.2022.11.16.11.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 11:07:51 -0800 (PST)
Date: Wed, 16 Nov 2022 11:07:48 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 01/11] ASoC: ak5386: switch to using gpiod API
Message-ID: <Y3U1BJAPOJTLw/Zb@google.com>
References: <20221116053817.2929810-1-dmitry.torokhov@gmail.com>
 <Y3S9KzTE1/UQDmJl@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3S9KzTE1/UQDmJl@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
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

On Wed, Nov 16, 2022 at 10:36:27AM +0000, Mark Brown wrote:
> On Tue, Nov 15, 2022 at 09:38:07PM -0800, Dmitry Torokhov wrote:
> 
> > Switch the driver from legacy gpio API that is deprecated to the newer
> > gpiod API that respects line polarities described in ACPI/DT.
> 
> > -	if (gpio_is_valid(priv->reset_gpio))
> > -		gpio_set_value(priv->reset_gpio, 1);
> > +	if (priv->reset_gpio)
> > +		gpiod_set_value(priv->reset_gpio, 0);
> 
> How are we ensuring that people have described signals as active
> low/high in existing DTs, and are we positive that the signal is
> described as active low for all devices?  In particular if the
> signal is described as a reset signal then it's active high even
> if we want it low while the device is actually in use.

I have been going through in-kernel DTSes and adjusting ones that are
incorrect. For external ones I think we should take a pragmatic approach
and say that if driver has last non-mechanical update in 2014 and there
are no users submitted to mainline since then (as this one), then it is
highly unlikely that devices currently using this component/codec will
be updated to the 6.2+ kernel even if they are still in service. And if
this does happen the breakage will be immediately obvious as we'll keep
the codec in reset state.

But if you really want to I can add quirk(s) to gpiolib forcing this
line to be treated as active-low regardless of what specified in DTS.
This kind of negates benefit of going to gpiod though.

Please let me know.

-- 
Dmitry
