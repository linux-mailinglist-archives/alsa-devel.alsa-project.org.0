Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 967795EB7BC
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 04:34:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 445AD827;
	Tue, 27 Sep 2022 04:33:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 445AD827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664246058;
	bh=bh/r0SZwdGbwaiAw/XjSxGOZLqQ5vJFv/Fjiypnl6Ts=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qqFTxtxcA2+c4nOcOIzlZna1iCFSCPLKJyyqLXf7h+ZSJIHI3RbJBBDwoox1/Trxl
	 tyWlFae3LZZL28L41HwRgTCUBcrEozxHT8vGEtX68bdvobdZAOyJzhOH43LsYbd+li
	 pL7KZNEnWazCIc60Xm3IHdebViiu/mBnap3QqTfg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF87AF80496;
	Tue, 27 Sep 2022 04:33:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11070F8025E; Tue, 27 Sep 2022 04:33:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C19BF80166
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 04:33:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C19BF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="GgaqksQN"
Received: by mail-pj1-x102b.google.com with SMTP id
 i15-20020a17090a4b8f00b0020073b4ac27so8746586pjh.3
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 19:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=beHOJoLMzhtQvwqCVFQE08wvFbsVkqCmgSaQLkojE3Q=;
 b=GgaqksQNT7cicjmr8VgOSy18SzVIWhA+3pfG4AqV2d7ivrbRQA9jxsvP1pfBShGzj/
 OvNqU5NPFlK+0R9qj3ayrs9rJ3IpaxXlAFgu1tPwntOP5mXcOTCS+Eh7FGqrCC7D5LcR
 2mrrZL+fahvKy6IbegfbZ4MQ1qtychGvEdPHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=beHOJoLMzhtQvwqCVFQE08wvFbsVkqCmgSaQLkojE3Q=;
 b=CuGFFtotds4yXbS/XkLIBVGp+RT/YN/KcshhIY+GIHR4uwe2DWdeKk2PCaKWcdxGo1
 ujdc26IWYhyz7Ctj4CkSFE0c2Dp9uMXkeTQ9UJ3wlBEQMAi9Z/0ogxZwYw8lCM4cgI8K
 Tz37MNGJPN4EW0y9flHSxcA54y+++buC/JHa6uRO+K18bWfaUauIn239CMw5vZhPe6Kf
 npvkqAFMtj12P03B0BXsku6cXTBrGFEJbhWY0i8qxC5nA/L+rlAK+7fd9u9XonlUII4s
 xqVzf2DqHGh/jjQxGKgoLbjjcXcjL2/5yhPNguYQLHW3QKFTxZkzm3CDhb4vuHUpAKHB
 coyA==
X-Gm-Message-State: ACrzQf26KC4/N+Jtd5G2tOd5pUTedx21DYwVhe+WUX8PkaASFvYkN922
 fxF2gcX4Pz6PJpPngL9rm2bfzHZIwmCArg==
X-Google-Smtp-Source: AMsMyM5NGw1Q0GfafCgkdr3TRCr4jnFSRQlgeAjDLSIqENbtY3Pu0+GX+M5Sea67UDU9T9u8oKayRQ==
X-Received: by 2002:a17:902:9006:b0:178:b494:c15a with SMTP id
 a6-20020a170902900600b00178b494c15amr25467224plp.37.1664245991191; 
 Mon, 26 Sep 2022 19:33:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a170902f38900b001783f964fe3sm155268ple.113.2022.09.26.19.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 19:33:10 -0700 (PDT)
Date: Mon, 26 Sep 2022 19:33:09 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] ASoC: uapi: Replace zero-length arrays with
 __DECLARE_FLEX_ARRAY() helper
Message-ID: <202209261932.F68BBD85@keescook>
References: <YzIzUjUuJKf0mkKg@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzIzUjUuJKf0mkKg@work>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-hardening@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
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

On Mon, Sep 26, 2022 at 06:18:42PM -0500, Gustavo A. R. Silva wrote:
> Zero-length arrays are deprecated and we are moving towards adopting
> C99 flexible-array members, instead. So, replace zero-length arrays
> declarations in anonymous union with the new __DECLARE_FLEX_ARRAY()
> helper macro.
> 
> This helper allows for flexible-array members in unions.
> 
> Link: https://github.com/KSPP/linux/issues/193
> Link: https://github.com/KSPP/linux/issues/227
> Link: https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Some day after the __element_count__ attribute exists, we might want to
consider a __type_select__ attribute to tie union members to a variable
outside the union (like the "type" member here).

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
