Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ADB434D67
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 16:22:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8131D1660;
	Wed, 20 Oct 2021 16:21:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8131D1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634739749;
	bh=C3qentOdEXzLKhc+4IHLaBX6IUo3vXrqzHvES/RldUk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=quMNxbI8Eqa0GFL63J9+GaI+FtFfNW+NjdWsi7/0rgK9Q2Fno0ks+xu3FL7hrFFQr
	 iStxKaoGATNHzQOBBK/kTD5I8WIAvFr3g18TfiwPDDKhH8My3nOjxrN0CmE/0+tkZC
	 JJEF+QoFF8nZe6swWcl2WpzhEhf8vBBEzb3hayhM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9AB5F80253;
	Wed, 20 Oct 2021 16:21:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7EB0F80229; Wed, 20 Oct 2021 16:21:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69A87F80082
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 16:21:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69A87F80082
Received: by mail-ot1-f46.google.com with SMTP id
 s18-20020a0568301e1200b0054e77a16651so8410781otr.7
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 07:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OtlyZ4tM5HVNxxxSuht/xQxNTgNpEFDHBixCg8G/aP0=;
 b=z3ePsjqWHKFropYMKDAGTDXVa2DOJQPtsFEZC75Tx0i6pt4Hq9o2HQgDVGLb0oivdu
 XMC+F+X/5JGVJirkfAh34bPsp3GsZlMZj8FqDlpeKQjc2TImFZwv1XiU11JQ6LdN73Gs
 +StC1dKnGCwIqUALrOp1ZdaaKuKPQQB9zQw/81s4Xu0NHEnnaUcx/YOEwyjNc4xWGyHe
 nRlklEPdnx1R3sOReVaaMKHl0OqcAPA2RnIA3QHggNZNW/BALBmrdooVJAllydc7QgLn
 N6vzbQMp5lLC6huRbw9edKDAQ2uYl9C3HKvoaCk7NpYhROaTmVQmSko4qTMf7HgmIZJ8
 Y9gA==
X-Gm-Message-State: AOAM530o3Jvuzd1fzA3DIaJ7bnJNV0eHjD2YLnkq/46GMLcLOFd4zphM
 f0f3LR2w8xXKmWF0SKqPtw==
X-Google-Smtp-Source: ABdhPJzVTXxnsvrkypxQr92U5Baw1wlrHKzXZIiEHF7zFf35Dsmgo8RmLjasUUdOtXj1BE8czU7iyA==
X-Received: by 2002:a05:6830:3096:: with SMTP id
 f22mr107618ots.195.1634739661049; 
 Wed, 20 Oct 2021 07:21:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id y12sm473538otq.60.2021.10.20.07.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 07:21:00 -0700 (PDT)
Received: (nullmailer pid 2301034 invoked by uid 1000);
 Wed, 20 Oct 2021 14:20:58 -0000
Date: Wed, 20 Oct 2021 09:20:58 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: wlf, wm8962: Convert to json-schema
Message-ID: <YXAlyjCOjmh96gL1@robh.at.kernel.org>
References: <cover.1634565154.git.geert+renesas@glider.be>
 <b0868d2f62fd57499c79d96298e99e5f9e4fbc76.1634565154.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0868d2f62fd57499c79d96298e99e5f9e4fbc76.1634565154.git.geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Adam Ford <aford173@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
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

On Mon, 18 Oct 2021 15:59:03 +0200, Geert Uytterhoeven wrote:
> Convert the Wolfson WM8962 Ultra-Low Power Stereo CODEC Device Tree
> binding documentation to json-schema.
> 
> Add missing *-supply and port properties.
> Update the example.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/sound/wlf,wm8962.yaml | 118 ++++++++++++++++++
>  .../devicetree/bindings/sound/wm8962.txt      |  43 -------
>  2 files changed, 118 insertions(+), 43 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8962.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/wm8962.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
