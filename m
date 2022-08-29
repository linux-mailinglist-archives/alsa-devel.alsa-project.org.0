Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 674515A56C9
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 00:08:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01A3F112;
	Tue, 30 Aug 2022 00:07:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01A3F112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661810910;
	bh=hha+rQcnlZzZOY1umtz1sH6o5W3YKInJwbRszuXYHwQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MNYzV5MLKZevELSgVzip20/i9jtkLEvqkL+Q3SMCXv4IzxnbrL+1HnJTf61hisvUW
	 C50YJcwVVW9OyBJCccn2l9UJxmxa7Jm3w/IQmjGbSae6d8a0A5iEJi/+4ETe7gtof0
	 A9FsewINKb6Svczl4qvyBjqx0IX5zXcj2DsHiouw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54E15F80217;
	Tue, 30 Aug 2022 00:07:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DD22F801F7; Tue, 30 Aug 2022 00:07:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E85ECF8012A
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 00:07:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E85ECF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="kgkdmJX7"
Received: by mail-pl1-x629.google.com with SMTP id x23so9290791pll.7
 for <alsa-devel@alsa-project.org>; Mon, 29 Aug 2022 15:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=k2Isl7E2TJrjz9RWvaLb1hVmrU1bdckrw7QzjwxtCok=;
 b=kgkdmJX7EizEvIXDuh3PyH9dF4tkinwEbVoInAmpJDW2RpLs7hLMkXJ04kArFIK4uw
 xJinRNSts20Fpeyl0cWOYrfKmZ93mkCktWz28aG7myBx5tzDJ3gL5KlNzCWRomOCtDQZ
 RUyqDuIw0xjEQayVF6Ia5ksfmxWePWZW1oRRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=k2Isl7E2TJrjz9RWvaLb1hVmrU1bdckrw7QzjwxtCok=;
 b=Cl1G8NEXa5dnwkV8FL/g2r9+/LAlEOsewIa2OoCPpvVZx4UShT5B175tW4bMJCiKup
 m6IOBpTUjiyYNpnS47QOBM+hpjKgMVs/D4o3IEXv5jNC4lCaMO1IarGSs6ZtMSXqwa6k
 JbhZK5Ej4spOaBnQ9dKHH9Y/+iFp9o0YVAL5fQdB+NWqTNcY0FVqlbfsPyR3F9BxPtoJ
 N4K2sO1OubD+HHHDzDopMhVRj8M/Ex94xnDPl1MFnKA+9GVLFZ9IYoyXX7s+bGf8oiOF
 Wo4+vWj9CVxBM1HIeLUZ0S4aQ2VXTV/xPHbx1xIZdQ0Z7vWtnP8K9GqQiF0nkkKdt/U5
 aGqg==
X-Gm-Message-State: ACgBeo01y1eOfuzAZQkm6DJ4TeOqO7Rv/iu5O3gHzf0+jG5dbXgUyDXB
 JtazpeyvRu3ColI2zdoXwAiCVXipszaW9Q==
X-Google-Smtp-Source: AA6agR4KrLR6NM3om4AqBBqcBSC2Rv/4c/jLw32zl1wdhvYKXC6KOo0sBiRaKJGSYNPNPGv75DjJ2Q==
X-Received: by 2002:a17:902:c94d:b0:16d:c10a:650e with SMTP id
 i13-20020a170902c94d00b0016dc10a650emr17851903pla.29.1661810838390; 
 Mon, 29 Aug 2022 15:07:18 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 md10-20020a17090b23ca00b001f24c08c3fesm7324164pjb.1.2022.08.29.15.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 15:07:17 -0700 (PDT)
Date: Mon, 29 Aug 2022 15:07:16 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] ALSA: hda/hdmi: Replace zero-length array with
 DECLARE_FLEX_ARRAY() helper
Message-ID: <202208291507.FBA7EF4@keescook>
References: <Yw01A+TvF1FWQ588@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yw01A+TvF1FWQ588@work>
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

On Mon, Aug 29, 2022 at 04:52:03PM -0500, Gustavo A. R. Silva wrote:
> Zero-length arrays are deprecated and we are moving towards adopting
> C99 flexible-array members, instead. So, replace zero-length array
> declaration in union audio_infoframe with the new DECLARE_FLEX_ARRAY()
> helper macro.
> 
> This helper allows for a flexible-array member in a union.
> 
> Link: https://github.com/KSPP/linux/issues/193
> Link: https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
