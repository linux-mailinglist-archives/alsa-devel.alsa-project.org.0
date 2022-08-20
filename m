Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C399C59B0DA
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Aug 2022 00:54:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46E17161E;
	Sun, 21 Aug 2022 00:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46E17161E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661036055;
	bh=Zel6OyxIxLrOEAz1RPb93ek6l5vEouDMENYHqx/wlGk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kKfTe2uhG2gut69NM2vqWMK5XKU/OiuaY7M9/e3GkIpd5pixN1JKrc3cOu2v8aCE2
	 gn7zJPU7wHUfMmefPjN6CtO2FDKs67d1VpJFE8lUoYqYjfkdYa+4+ZD9FRMDMOmZy1
	 f17EnRPox79AgMH1LikieR0kEr06StyWKU0GKU00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD1D7F80240;
	Sun, 21 Aug 2022 00:53:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0002CF801F5; Sun, 21 Aug 2022 00:53:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3E6DF800EE
 for <alsa-devel@alsa-project.org>; Sun, 21 Aug 2022 00:53:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3E6DF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ioLH/5lS"
Received: by mail-vs1-xe2d.google.com with SMTP id j2so7739087vsp.1
 for <alsa-devel@alsa-project.org>; Sat, 20 Aug 2022 15:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=3YMaXAp+wzE01n62LwBhLAk4yymVPtpwlD9YcbsqWqQ=;
 b=ioLH/5lSjmpyBufQ7nxNejMFREqlgVN4r2g8ltb1cfQQ/2WIqcpvktD9g8ijor3G02
 ffbrAYj/5TNoM2hk9uvhI1vnF8APYLgHSwLR8XatqnzzbCGNMkhC/y08/K4hTgJ5t5a9
 mB9JVVdBCmpEJhHDKSCe7BScnjyhJxKEWskI3gG89ypgx9rJPESG8bit+WTJCHWr4bu6
 psNUzsAMmg41CA9ZpT6dhwWyQCdid0dzMMv7NSZrmJw4Uz2AYMGXWUikFxfAK7qi+bVl
 Ub2rfTFbuk6Zc03XAi5YyX1rnmklnnbmz1D6yt+c9dfXWIZwuDIwgpY98GUYOaLKXuJ9
 fIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=3YMaXAp+wzE01n62LwBhLAk4yymVPtpwlD9YcbsqWqQ=;
 b=xwjAFAkDWQ/gqz4UvID1DLqssET3+7NKfubGz3jtIMqQJT+Tf4S1vZnN/m3McRCK4E
 kF9Uv7R6jIM5ee4eCKixoCQN4YWoMHgXJS5sj+2rEo34hQHoYU2AgcKsrIMR/KKGVu/G
 S8i+TJne6iU9CXHBSpbruBFN7uXDQL6afbQmCUh+jcYVN8LO1NPbTtpMUvOPvr2r4gOo
 KBOzoHnYHcxiONGIHYAkKpB2RXWm9z67jtysLxaeceiDBZIBGuvjro73BmTIWK2d1V2+
 YoyxYdWB4SMrfB0gZOlf0eThGShZYdghZLjUSn2+3Gr4mFOXg2/4RboI+5i0wGk5NzBo
 pg2g==
X-Gm-Message-State: ACgBeo1TtLHVMSQMbUMZ1yZPo9bxqqPh23dUiSrXQ/5WIRfb6r80s9g1
 7PR0NvjU9Xm3OPjK6FJqYxBfLYN0Z0w=
X-Google-Smtp-Source: AA6agR54XI03jtNo1UVts1/Gz/XBJuc5PgjdqR8QA7f3lbEKAHxQGu7ylNp1Kz2Kl6ZdFmZUv8HH1Q==
X-Received: by 2002:a05:6102:2836:b0:386:91a5:a241 with SMTP id
 ba22-20020a056102283600b0038691a5a241mr4892439vsb.51.1661035988068; 
 Sat, 20 Aug 2022 15:53:08 -0700 (PDT)
Received: from geday ([2804:7f2:8006:f71:a581:5947:7302:d05f])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a1f1f10000000b00383bebb17bdsm5772335vkf.16.2022.08.20.15.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Aug 2022 15:53:07 -0700 (PDT)
Date: Sat, 20 Aug 2022 19:53:04 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: sugar zhang <sugar.zhang@rock-chips.com>
Subject: Re: Rockchip I2S commit possibly ignored
Message-ID: <YwFl0FltQXNVdxZq@geday>
References: <YvuYZE0biiAn/sxQ@geday> <YvuZbrBWzRjHYQZj@sirena.org.uk>
 <Yvudjkjxtv7M/DPL@geday> <Yvu2PRrQvsRAJSm7@sirena.org.uk>
 <YvvZzkYQ8Ce3/Lwj@geday>
 <5b15df0d-428c-d2c2-6467-3c0a3a161af8@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b15df0d-428c-d2c2-6467-3c0a3a161af8@rock-chips.com>
Cc: ALSA-devel <alsa-devel@alsa-project.org>
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

On Wed, Aug 17, 2022 at 11:17:32AM +0800, sugar zhang wrote:
> Hi Geraldo, Mark,

Hi Sugar!

> could you share your I2S and HDMI register dump to me to dig out the 
> root cause.

I ended up sorting it out on my own. HDMI AudioSample Register aud_conf2 must
be set to 0x4. This sets insert_pcuv bit and solves the extreme clipping
problem.

I'll post a patch later.

Thank you,
Geraldo Nascimento
