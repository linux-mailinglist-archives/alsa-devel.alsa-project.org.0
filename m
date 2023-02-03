Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D46689F46
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 17:30:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C832844;
	Fri,  3 Feb 2023 17:30:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C832844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675441858;
	bh=qX83ZNcdnsm0/ff/cNgXMe+cUWVFzmHvSsdipQ/VNh0=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=X/r7lLlqTTyzxU6jOK++87jIF7/M9elGOmJJDd26OuzsflN2b5Hi0CSCegca1R8ep
	 nTh9qaRkCY1U5kkQzwA+ISP32oufBTupjVGbUob6TqXSlWZ8onbW05S7SrFF8ColJd
	 IsKkjLKK/Yn+Qje23KaxP5YiwxSgNdJAMrFpCx+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86115F802E8;
	Fri,  3 Feb 2023 17:29:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48143F80254; Fri,  3 Feb 2023 17:29:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 394ACF800E3
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 17:29:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 394ACF800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=VnPfY6G7
Received: by mail-pj1-x1031.google.com with SMTP id o13so5536730pjg.2
 for <alsa-devel@alsa-project.org>; Fri, 03 Feb 2023 08:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=EGj5KCWeluHnuZthHjKS/p0W/Q63My14ajFgn/N7qhE=;
 b=VnPfY6G7WLkodXEsJkzaXZAEnTsENaxYzDFISjb6PNoaycBXUugUZezZK1sL6bZ2d5
 CIABhclo6LVO8xyysXi6VjdhLtrl2TjHQqTKNhN/kNLaroMQ7b5CnnhZ6/XL+aqL2sN0
 kgbGj04aiIaBJig1rV44FxUURpCdpvCBDE0EU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EGj5KCWeluHnuZthHjKS/p0W/Q63My14ajFgn/N7qhE=;
 b=mAhryi0qParAayp+0YeZjpkqV6jIh1OR0CSfpclx+KaYlACdEiEDUrwRrafzxDZkKC
 7E/xgkwHKmyX8J/29QFj+HEzZf+wujYlcBK8b/Ouv4tiV6Z9EswqXosxzHm+jwRsODkb
 kPlvPrm0SKop2xKNgBm9B+xa/iZdTaiI90s3zDFYJcagmK4wTr/ujNv0qwD+q54sobfa
 BE7uiNI3psJthQ8m65lGY390Y4lx1M/Us7ios8f+5CWzuBTdCkfufMHxWtrhHO6/RdXO
 iHYXeMnOkTQUYfwN64GTrGb0ZZ7WMgqgNClel+wgkf4sec3IsKMP7tTU6Yf1rTQie7gX
 YxOw==
X-Gm-Message-State: AO0yUKWmIaJSUZ3VA3CxX0Ug5cb1/EV/t3fm1F4AeV81tjSKP/W4AOaW
 OUbmejsuyoDat8fp+G/QrLuNxyRqvMyKudx0
X-Google-Smtp-Source: AK7set+bY+B15yGzpYLybxs7pdiMEx2TrMbimOis4YoDfiySO3n8L/uGAam2EAZZNsS8vm3OkApl1g==
X-Received: by 2002:a17:903:22cf:b0:192:4f85:b91d with SMTP id
 y15-20020a17090322cf00b001924f85b91dmr12771941plg.46.1675441782953; 
 Fri, 03 Feb 2023 08:29:42 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 d7-20020a170902b70700b001869b988d93sm1800377pls.187.2023.02.03.08.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 08:29:42 -0800 (PST)
Message-ID: <63dd3676.170a0220.1f1b2.3244@mx.google.com>
X-Google-Original-Message-ID: <202302031629.@keescook>
Date: Fri, 3 Feb 2023 16:29:41 +0000
From: Kees Cook <keescook@chromium.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH][next] ASoC: uapi: Replace zero-length arrays with
 __DECLARE_FLEX_ARRAY() helper
References: <YzIzUjUuJKf0mkKg@work>
 <fcd83e77-a3fb-9061-771a-8509ea6f5950@embeddedor.com>
 <Y9wmnfTi/p4FuRmd@sirena.org.uk>
 <bb43c410-bd8c-66fe-19a1-0f41442838eb@embeddedor.com>
 <Y90ExljX2qCsowhu@sirena.org.uk>
 <652684af-bd10-99da-1ed8-104407493428@embeddedor.com>
 <Y90P3kik6ONZg3U4@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y90P3kik6ONZg3U4@sirena.org.uk>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Feb 03, 2023 at 01:45:02PM +0000, Mark Brown wrote:
> On Fri, Feb 03, 2023 at 07:27:03AM -0600, Gustavo A. R. Silva wrote:
> 
> > I think we have run into this same issue (you not being listed in the
> > MAINTAINERS file) at least once in the past, right? (thinkingface)
> 
> > IMHO, the sensible solution for this is to keep the MAINTAINERS file
> > up-to-date. So, get_maintainer.pl can continue to be useful for people.
> 
> Sure, feel free to send an update...

Is this accurate?


diff --git a/MAINTAINERS b/MAINTAINERS
index 7f86d02cb427..e21a3412a546 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19564,6 +19564,8 @@ F:	Documentation/devicetree/bindings/sound/
 F:	Documentation/sound/soc/
 F:	include/dt-bindings/sound/
 F:	include/sound/soc*
+F:	include/sound/sof/
+F:	include/uapi/sound/asoc.h
 F:	sound/soc/
 
 SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS


-- 
Kees Cook
