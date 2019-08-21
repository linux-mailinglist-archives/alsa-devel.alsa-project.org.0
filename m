Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCC8970CD
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 06:09:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E68E165D;
	Wed, 21 Aug 2019 06:08:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E68E165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566360587;
	bh=KPsEPpK2HSoVKQ42bI/CFWCM4ua2p/FE0urbuG65MkQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o4bz1Lkjtmj6gu27f6Vh3Yn7i8+ag3et4kgTfs1OX/vZ2+5OJvvAoldQ6aTCqCYAr
	 LnlsC0PvV4NUlrLQietW+S50L9dE24378rYaqU5DxWshwW1Hp32gQy1QRZxzKYVjW9
	 ZNBxJdaFnuBH0ne+YUxQaZAVkRscp5lZKOKr4eFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61154F802FB;
	Wed, 21 Aug 2019 06:08:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A988EF80306; Wed, 21 Aug 2019 06:07:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCD7BF80157
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 06:07:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCD7BF80157
Received: by mail-ed1-f68.google.com with SMTP id w5so1257480edl.8
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 21:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2DH+Z8zu5DA8qxbFBSKsglzPr+woO5ZxUEZnrR+PcUs=;
 b=muE2ERf//At3yarnP5rHRHxIENAa1Po7u/Eh1Rsbjgp26n4ohRmm8EDGF37zyHNHt8
 pG7GgMhqDXqyQGfvgua6+H/MXevBR6gN+vopQMv5b9BcXu1pMF8oyf/8jFVotbgvlUwb
 zYt5cKNwQMsmfIUucisMCyjrCMamuyI88tXA0FUYc6s5xS7b0aJ1AETwh0GVX0bTTWMv
 EwBnhh0Loi4/UaocNOjgv9jVE+3wSmwWFTXnHMQ0KcknhAU5+iwVT4jK9blO7qdRu1GV
 WCS2z7JEqkxybiengqLabEbmKCckyvVZZJ6JnCfZWqie43pAvvledoc+R+ab8nkEa3xd
 1FIA==
X-Gm-Message-State: APjAAAVkR3AvQLvOJ05RMD4u/deMf/DOVPQO4CITPAXoVjda+S/HmOYU
 Us5OOAvhK7fRyHXiBHe2GemoKiRzzLI=
X-Google-Smtp-Source: APXvYqw6qshE0QgkJObHriuxtMvZmCrK3UIAmIu2ZCqArvJIETBfTQDg2Geh+kbmE0eridaU9fPGpg==
X-Received: by 2002:a50:ab5d:: with SMTP id t29mr34737629edc.32.1566360470578; 
 Tue, 20 Aug 2019 21:07:50 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54])
 by smtp.gmail.com with ESMTPSA id k12sm3850379edr.84.2019.08.20.21.07.49
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2019 21:07:50 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id f72so621609wmf.5
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 21:07:49 -0700 (PDT)
X-Received: by 2002:a7b:c8c5:: with SMTP id f5mr3226423wml.25.1566360469671;
 Tue, 20 Aug 2019 21:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190814060854.26345-1-codekipper@gmail.com>
 <20190814060854.26345-10-codekipper@gmail.com>
In-Reply-To: <20190814060854.26345-10-codekipper@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 21 Aug 2019 12:07:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v65+-OB4zEyW8f7hcWHkL7DtfEB1YK2B1nOKdgNdNqC0kQ@mail.gmail.com>
Message-ID: <CAGb2v65+-OB4zEyW8f7hcWHkL7DtfEB1YK2B1nOKdgNdNqC0kQ@mail.gmail.com>
To: Code Kipper <codekipper@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [linux-sunxi] [PATCH v5 09/15] clk: sunxi-ng: h6:
 Allow I2S to change parent rate
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

On Wed, Aug 14, 2019 at 2:09 PM <codekipper@gmail.com> wrote:
>
> From: Jernej Skrabec <jernej.skrabec@siol.net>
>
> I2S doesn't work if parent rate couldn't be change. Difference between
> wanted and actual rate is too big.
>
> Fix this by adding CLK_SET_RATE_PARENT flag to I2S clocks.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

This lacks your SoB. Please reply and I can add it when applying.

ChenYu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
