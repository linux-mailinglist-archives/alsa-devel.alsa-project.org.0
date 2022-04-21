Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C20EC50A5E2
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 18:37:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67F131683;
	Thu, 21 Apr 2022 18:37:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67F131683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650559075;
	bh=HSEp35CcEFzqXi5YnZz6wUujqbNFlArIS1pEImrjHiY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cUT4i4Su2NXZpHZ/Gkej6qCFllymCsq5C8tPWH9XVh7zR6138EYYEZOZFR/ZLJeJS
	 k5cdA6YU7smhCkIA27tcAEM8aK4CQKHgzUEP3bg2zlfr7sVFgCsoW80G+B27JnMWjh
	 deVA35DwYQyV3NT2pUCWPHfkSab1MPlOqL8SyElw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC78EF804DA;
	Thu, 21 Apr 2022 18:36:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93910F8032D; Thu, 21 Apr 2022 18:36:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8326AF800C1
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 18:36:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8326AF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="YZ0zbWZ1"
Received: by mail-ot1-x32e.google.com with SMTP id
 i11-20020a9d4a8b000000b005cda3b9754aso3621266otf.12
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 09:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=83PXzm6x6eodtfaWWKtWJXEPAymm3hB3+JWzv8XJjRE=;
 b=YZ0zbWZ1qT4B2qeGZYeXoZQOF+2QyAZzlKtV3C4egrQkbWH5zETdeRWRzldys1bPFo
 ih2FXDbV5soqMVuCveMKgAOhTL9bcjrD+li153kj//vfYDSoNUm8crPdNkmT8O7r9SAg
 8bEeXrU6vOM4gv9luI4CP2OQl09e79pCZu8jZ0/DUzPg8ATHDapu3GSk59/Mej//NlUb
 uBJ8jLDO1Gf4qpruJSAXPAQMpraxRBbmsaTj6IFkvpV2vvZP+K+icqfUcNgBLDgJCe8/
 DvGKj5+Guyi6jn2zuaKE8sR86GSiDrrYmjRHDWM4uZadLZFesreOdwtHOok0BHdZVH4j
 z+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=83PXzm6x6eodtfaWWKtWJXEPAymm3hB3+JWzv8XJjRE=;
 b=HNy1yvgpJ3Xy9uwXsfFN+7HRkfY/32J+QSnkjf8og00LWEtoTjjDqqROqE5Aj1tz6v
 fpVWBeLOqxF2FWSWN5UGPmcOW6/6VjAt1IDtmHsLCdyqpwOIUr/DjcKpN5VwMtzISGOK
 hL0kwJ7HGaUiO5hcdNWvm6L+q7vFi01Cv6gci9pDB9Tm8rtGxL73yFNn51jcARFDrvjO
 S69Xf9yYTx0VkN9F/pHgwuwIcshIrZhDztb6HV/qQDDhG4jCntgoBGFir+hNpcDe4Upk
 fAcjP8+r2PuGjY+uc8N2tG2AqTUcqdrmAk4fftWUOVceDvbXLoFHKqWqmb7BSs1xzL74
 I08A==
X-Gm-Message-State: AOAM532c6mLT/v1p0V0qe7x26Zhr+P7+fz20TL0vOR1PoLDArJAqfix/
 m7kOhXsA/fsX3enDNTEKFrgnFA==
X-Google-Smtp-Source: ABdhPJwc7/n1sA7lRJ8fymgn0dC0huOPaDGwWhO7t0+WFNHW5yYiUNnYifSc2gzQYpmp/6E0CjYGnw==
X-Received: by 2002:a05:6830:116:b0:605:4e0d:f020 with SMTP id
 i22-20020a056830011600b006054e0df020mr256809otp.43.1650559003377; 
 Thu, 21 Apr 2022 09:36:43 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 hq6-20020a0568709b0600b000e59102e1bbsm1193568oab.22.2022.04.21.09.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 09:36:42 -0700 (PDT)
Date: Thu, 21 Apr 2022 09:38:45 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v12 0/7] Add pin control support for lpass sc7280
Message-ID: <YmGIlZcxmhiegmw/@ripper>
References: <1647447426-23425-1-git-send-email-quic_srivasam@quicinc.com>
 <CACRpkdZKQRnxFjOD9z7iNvRQeM6kGBBopjW7VzFSuj91GYeJOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZKQRnxFjOD9z7iNvRQeM6kGBBopjW7VzFSuj91GYeJOw@mail.gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 tiwai@suse.com, agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 linux-gpio@vger.kernel.org, rohitkr@codeaurora.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, quic_plai@quicinc.com, judyhsiao@chromium.org,
 linux-kernel@vger.kernel.org,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

On Sun 17 Apr 16:32 PDT 2022, Linus Walleij wrote:

> On Wed, Mar 16, 2022 at 5:17 PM Srinivasa Rao Mandadapu
> <quic_srivasam@quicinc.com> wrote:
> 
> > This patch series is to split lpass variant common pin control
> > functions and SoC specific functions and to add lpass sc7280 pincontrol support.
> > It also Adds dt-bindings for lpass sc7280 lpass lpi pincontrol.
> >
> > Changes Since V11:
> 
> Bjorn what do you say about v12?
> 

I say:

Thanks for the updates to the patches Srinivasa!

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
