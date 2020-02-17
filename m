Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2552A160D2C
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 09:25:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B06D282E;
	Mon, 17 Feb 2020 09:24:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B06D282E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581927920;
	bh=FmGN78bD/6I501G/vyQdTjs+jry35yMYlWWHIxbK3MA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vN35+kHxM62up/jtnp+bW5tcnmojORUqMUBdwliopO5si4S9ZLo3WJjidTL++J9zh
	 rElk7BBaaH3Av2omWt60CRuGdxRdQmUjfgo0XxAnx7BSCBcT06/ZHTBhv+B6Fbkxj5
	 5xoaoGE/14M4mW0gBi8IEkIWr0e1bOn2sitFu7fw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89682F80096;
	Mon, 17 Feb 2020 09:23:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 107B1F801F5; Mon, 17 Feb 2020 09:23:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBF64F80096
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 09:23:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBF64F80096
Received: by mail-ed1-f67.google.com with SMTP id j17so19680943edp.3
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 00:23:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RCvgYdsJcfvOF7DNGv6F0fWsfl3RWpjn9MSCG6l5nng=;
 b=SpXhbTKJGEizln8p5uoEkFXJ1nH+ryB4EKI2wgiUTOX5STMnbJSY9HO6fKI1jWotNc
 gJp3BV36dW85b0h5Jnxjy1hz5gwz1o8J4zhgemq9nnK1IbaeV3zR/xOHk9wLWUytbHsV
 o37qSmpbLqMKY7nxhQvv4OTvL8FFMxgMs0Z38qeP5MVIH3pHL8885Dl6FJ1WIyZO81eA
 zvmD8mXSsX3i50RySM5A/ucxtlRwmFSLYt87mUQCp+f5usdzd1fkayqIkXe8a4zNcxnl
 hPYWytM20/2Kh0gVe0hKG8tai1qtrv/KMFHIWYKjJmC6l3qzYcJ2ua9dXixOBDjmmfGt
 XkpQ==
X-Gm-Message-State: APjAAAV9hEruAfxbiW74SyGK8x8h0mouST2kIS9cWJYByfLlOuiuPrJA
 v/NNTkNFEnWm0ABe0TNXbH8byzAST+4=
X-Google-Smtp-Source: APXvYqxRqBvPXsjhZ+KLnvSVPvSvRhcnqhgdhgUVsJK0oEa4GWz2eJ+wjO3QtfgmNzZjShFuC7eHig==
X-Received: by 2002:aa7:cf83:: with SMTP id z3mr12961290edx.166.1581927823611; 
 Mon, 17 Feb 2020 00:23:43 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41])
 by smtp.gmail.com with ESMTPSA id w18sm851842eja.57.2020.02.17.00.23.42
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 00:23:43 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id w15so18492961wru.4
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 00:23:42 -0800 (PST)
X-Received: by 2002:a5d:6805:: with SMTP id w5mr21282613wru.64.1581927822372; 
 Mon, 17 Feb 2020 00:23:42 -0800 (PST)
MIME-Version: 1.0
References: <20200217064250.15516-1-samuel@sholland.org>
 <20200217064250.15516-7-samuel@sholland.org>
In-Reply-To: <20200217064250.15516-7-samuel@sholland.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Feb 2020 16:23:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v65pow6ufaz=6f8rWMXkmknLL2toYgUj-wM9sqns9Xy-ow@mail.gmail.com>
Message-ID: <CAGb2v65pow6ufaz=6f8rWMXkmknLL2toYgUj-wM9sqns9Xy-ow@mail.gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, stable@kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [RFC PATCH 06/34] ASoC: sun8i-codec: Fix setting
	DAI data format
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Feb 17, 2020 at 2:43 PM Samuel Holland <samuel@sholland.org> wrote:
>
> Use the correct mask for this two-bit field. This fixes setting the DAI
> data format to RIGHT_J or DSP_A.
>
> Cc: stable@kernel.org
> Fixes: 36c684936fae ("ASoC: Add sun8i digital audio codec")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
