Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C97F5EB7B5
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 04:31:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CFC43E8;
	Tue, 27 Sep 2022 04:31:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CFC43E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664245915;
	bh=iE09VGekRQ8YujdOIAidDZPWqvogpi5SYGTWTGNiutI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HFQM/EMolkOwJVXeGAGHwQq/JEEyFZCVqnsO/Jwb4553BMyNCxFJd8KRPUUiY7ywg
	 RVEqBkYud6kRdnWWWL0mZttpsoYQgk90ZBY6AmtefwEjDz/fqyaF3sIo9AJHYfHQy4
	 Y0YrP33PQ0Xswsw2ablH0DLWHZvR1L+ianvWeHBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF498F8011C;
	Tue, 27 Sep 2022 04:30:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1924F8025E; Tue, 27 Sep 2022 04:30:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 788B2F8011C
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 04:30:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 788B2F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="JLnoASLU"
Received: by mail-pj1-x102b.google.com with SMTP id rt12so7983995pjb.1
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 19:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=M6ZjbEpb/UdQZtA16p01zlM8hWd+9RIaPah6OiYEF9s=;
 b=JLnoASLUHeDPUf6dI39o1+5rs9AzhUtl9AApNwejURiKdFKySH7qwrWxoCD8281JdM
 s5VZBA3uCrzXB/vkhMOC5uX2WZ+020yhDkhV3nLWWe84wG1IrVbTXzd7loPubISbr7Lq
 REDFu0hTtFb8HmZWdQO+0sCSW2tjfT1AFwfcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=M6ZjbEpb/UdQZtA16p01zlM8hWd+9RIaPah6OiYEF9s=;
 b=7WCxLxeAUpNQEW8ZmIqX04yADvNWJdxKptQxrbJecJXDl9UaReB4jlb2yr5v6liMDZ
 s7+i1JAC+ww0Fj66CgW07EOhleKyvPZeU0I14gP29AoWIT+LYZVTFwnCSKzzE9uOp73r
 LSn5097JgNa/lPSJSG2jm8G3dXLkM7MxvmhZ2K1KK0YgBNm6Wxv8m2j38PkvQfn8QjcN
 1ljJmXt3iTcDI4v4QtZqWFBacOhXUdvpaa5AxFu2+Usa6Y0OIF82lYBmYqRquKTEEDpq
 ZYfI6ebFR4FMUd7MaKqxapIxbFdyEC6Vv0zf8AfIpkR+VnQ7jQkxF38xqw/UjphPU6E3
 jT6Q==
X-Gm-Message-State: ACrzQf2UCUzri7jRMvS3m42+KlEh3iRhEJXosgo2RNnjcKbMhzHuckly
 1zAsgnH79oYQdZouhVHXMofYMN/9AKMjDQ==
X-Google-Smtp-Source: AMsMyM4fVILya89l/buI/6YDmjZuGWn9S4tka+jx7icqv87/971kE+MPYocVhEp623vm5hAMuZB50Q==
X-Received: by 2002:a17:90b:4c8b:b0:203:5db5:8b71 with SMTP id
 my11-20020a17090b4c8b00b002035db58b71mr1933594pjb.51.1664245847736; 
 Mon, 26 Sep 2022 19:30:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a1709027fc600b00176dc72ad88sm117601plb.287.2022.09.26.19.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 19:30:46 -0700 (PDT)
Date: Mon, 26 Sep 2022 19:30:46 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] ASoC: Intel: Skylake: Replace zero-length arrays
 with DECLARE_FLEX_ARRAY() helper
Message-ID: <202209261930.A40876B@keescook>
References: <YzIuiUul2CwPlkKh@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzIuiUul2CwPlkKh@work>
Cc: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, linux-hardening@vger.kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org
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

On Mon, Sep 26, 2022 at 05:58:17PM -0500, Gustavo A. R. Silva wrote:
> Zero-length arrays are deprecated and we are moving towards adopting
> C99 flexible-array members, instead. So, replace zero-length arrays
> declarations in anonymous union with the new DECLARE_FLEX_ARRAY()
> helper macro.
> 
> This helper allows for flexible-array members in unions.
> 
> Link: https://github.com/KSPP/linux/issues/193
> Link: https://github.com/KSPP/linux/issues/226
> Link: https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
