Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6107370330
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Apr 2021 23:47:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B52316AE;
	Fri, 30 Apr 2021 23:46:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B52316AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619819269;
	bh=Tp3HQQw250bHLRTVyK9PRJhwknpMI8FUxlQ6qaEW7iI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yprz/kBS7TKiMO1CGpPKRw3U6w7/Gf9BSW/mMdd+7r8tUejieSrmUSP3HK8RtU3nG
	 nsF2nH+bL93JFsTm9nMXfIEzdmHGTBbMTxL5C3OQczJ7iRdTzJM5yF9o9IsKe7vKoh
	 Kxld6pVVSHE46NuAojpUGI+6YWXrLJcJfht9c3vc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5577F80171;
	Fri, 30 Apr 2021 23:46:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C92CF8016C; Fri, 30 Apr 2021 23:46:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F6F5F8012B
 for <alsa-devel@alsa-project.org>; Fri, 30 Apr 2021 23:46:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F6F5F8012B
Received: by mail-oo1-f44.google.com with SMTP id
 i3-20020a4ad3830000b02901ef20f8cae8so8539825oos.11
 for <alsa-devel@alsa-project.org>; Fri, 30 Apr 2021 14:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lQ8vdEh4rJx00Ki7Tq3K8HSCeSzDZ++EPb2cKQeU+yo=;
 b=TrNtCumbuyMsl6D/VSVWVBlosIyFGDsA7+PRTn/XQ++1JasMv1MVbO7b3Qs9x9A8Ao
 AIQ0aQ0pWX9xgOjM7wF1hgP4eTJOT/jrOLAfPuyHlZRv0SrGLwxVEdbz4xIB6303HDw2
 pFOX1cQZy7jfbC5CzOWSZFpQqVkPxR1N4e/lJRqo8dXWIMZGzZVivmJxdKSl8OYiHO/I
 5yk5BO4XGQCFTnZO2EZ7tKhFGTlZeGSVYQgA8DpIpAl7D6PNqYEC7aTSSbBbaOUrSxaW
 ToKxKH5a+8go0ksNfjkaS9/z8+QEctwBk3ARpl87kNOTomxwPhwhsU5jHgolCfWcfdMk
 O8SQ==
X-Gm-Message-State: AOAM532x+ElidBnOyNtUzlEdJER8S+uPit2S6Ffxye+eQgsuI1GYScox
 7e4UnhlMdksnSowHEUwgwQ==
X-Google-Smtp-Source: ABdhPJz6PdKIigOtZcVYOpEsFx+nvBVRc8Vx+MdzxKvkVayWWFkpXLA1s7S9yhZm38LZWhL24gYbaQ==
X-Received: by 2002:a4a:1104:: with SMTP id 4mr6265762ooc.57.1619819171630;
 Fri, 30 Apr 2021 14:46:11 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u1sm1055005otj.43.2021.04.30.14.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 14:46:10 -0700 (PDT)
Received: (nullmailer pid 3956163 invoked by uid 1000);
 Fri, 30 Apr 2021 21:46:09 -0000
Date: Fri, 30 Apr 2021 16:46:09 -0500
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 1/7] ASoC: dt-bindings: sun8i-codec: Increase
 #sound-dai-cells
Message-ID: <20210430214609.GA3955996@robh.at.kernel.org>
References: <20210430035859.3487-1-samuel@sholland.org>
 <20210430035859.3487-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210430035859.3487-2-samuel@sholland.org>
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, linux-sunxi@lists.linux.dev,
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

On Thu, 29 Apr 2021 22:58:53 -0500, Samuel Holland wrote:
> Increase sound-dai-cells to 1 to allow using the DAIs in the codec
> corresponding to AIF2 and AIF3.
> 
> The generic ASoC OF code supports a #sound-dai-cells value of 0 or 1
> with no impact to the driver, so this is a backward-compatible change.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../bindings/sound/allwinner,sun8i-a33-codec.yaml         | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
