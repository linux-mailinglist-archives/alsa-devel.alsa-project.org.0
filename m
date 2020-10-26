Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB84298F73
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 15:36:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AC9016DA;
	Mon, 26 Oct 2020 15:35:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AC9016DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603722965;
	bh=H/QIj8CEg2vA9ekDAiskbIJ3gYTAxZSABxzsN3p9INU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VXD1AsXn1ntznlKgdzM1BUiHzmC9Q19aa33qTpg0y7k1QxdUbEGzmpqWdPYZVjGcG
	 cK11SNTzdxX2+MYK/tVtn1FsD4ZK5Wbwqt2k6qVFX8kAf9jusTyFokt0Gx/xkYXOJq
	 ALI3/ZHiE/OpUuLY2JzrKXcqb7PD1unTCumhwVIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78C9CF80272;
	Mon, 26 Oct 2020 15:34:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0F8BF8026D; Mon, 26 Oct 2020 15:34:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oo1-f67.google.com (mail-oo1-f67.google.com
 [209.85.161.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8FCCF800CC
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 15:34:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8FCCF800CC
Received: by mail-oo1-f67.google.com with SMTP id f25so114581oou.4
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 07:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YJe0fLSQoNV5qYO4yyIlYdA+m7aYQXXQ7220k06Xnlg=;
 b=M5EBjRw4nQukW777oboduusNajeHDWgHgx7B3g8CH2w499HmXCnuH9rovxglfDf/OB
 rXStoqv5YVQdpy49Sup07QMerUa5mafS4OJYmCVzzMPqc0AMn85Swyvjd1gLlu/OmQ8o
 GketebH5Yjn6PqB1GzzRQLk5WJimG8VYNI2WdO2vLHJC5kBaBvUXtjhvYCY3bnea++I9
 Y6g4zg8dAByLeIm6aPu5KnZsdbuqzlyxD6fPaIl7g0gdRuDqxkYKOwlHc+t1HrYUvZ7M
 RCvDu0nhkuGQziTSG+3Omb5yMw0d4f+h1smDjUSoTj7aB/jtaaQ8HhZjIhTUji13fKBm
 gxEg==
X-Gm-Message-State: AOAM531+Dp1ltq1/3HoC0IS5aEIxskbOPVPBs71FVoIokQo+5/eqgpP2
 fKecQMVc641nqkTXKOhOAg==
X-Google-Smtp-Source: ABdhPJzOzRdziG3eUhJyZY+fC+o+9/Ohme3aRAN88WQMguo4FqGdzYCyXFjHSK0uXu5EcU8Jcmx8gQ==
X-Received: by 2002:a4a:b28b:: with SMTP id k11mr14177359ooo.54.1603722865532; 
 Mon, 26 Oct 2020 07:34:25 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k51sm3633362otc.46.2020.10.26.07.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 07:34:24 -0700 (PDT)
Received: (nullmailer pid 118055 invoked by uid 1000);
 Mon, 26 Oct 2020 14:34:23 -0000
Date: Mon, 26 Oct 2020 09:34:23 -0500
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: stm32: dfsdm: remove
 stm32-adfsdm.txt binding
Message-ID: <20201026143423.GA118005@bogus>
References: <20201020155709.2621-1-olivier.moysan@st.com>
 <20201020155709.2621-3-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201020155709.2621-3-olivier.moysan@st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, alexandre.torgue@st.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, tiwai@suse.com,
 broonie@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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

On Tue, 20 Oct 2020 17:57:09 +0200, Olivier Moysan wrote:
> Device tree audio configuration for STM32 DFSDM is already
> covered in the following binding:
> Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> Remove stm32-adfsdm.txt obsolete binding.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
>  .../bindings/sound/st,stm32-adfsdm.txt        | 63 -------------------
>  1 file changed, 63 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-adfsdm.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
