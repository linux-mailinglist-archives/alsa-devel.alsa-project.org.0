Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF13A3408B
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 09:41:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45EBD16B6;
	Tue,  4 Jun 2019 09:40:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45EBD16B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559634093;
	bh=cCxMWOe+ZnUvEFoKwUWXjt4o8GklQCK1KAGG2gc3N7M=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kDjpOTj8KLVwHMwcI6NG+j58I6fkL6rgXhSx9yljs8EY8POtwyjeDVt+/7mjbpPKz
	 jYD4EGpKywMd3G2X+I4/vnuptb/yWjNwh/cdmhgCIkgReCxZeFhGLUm5r+biLcXYFE
	 HtexYpX3Cy1idxBjHmM8kAKQDToJVTlX0pg/WUYY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E52DF896EF;
	Tue,  4 Jun 2019 09:40:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09A45F896F8; Tue,  4 Jun 2019 09:40:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F8B5F896F7
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 09:39:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F8B5F896F7
Received: by mail-ed1-f66.google.com with SMTP id a8so30611863edx.3
 for <alsa-devel@alsa-project.org>; Tue, 04 Jun 2019 00:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HPZoKEpxMdZA3Cy+DOvZz+UKiVos8Da/MXX9dJMPwts=;
 b=nHwcTVZBbC2RkjVURFTZOV/U0JBpyFX01odXhElzxGW621slmW/GMijwQnsS3TmoHQ
 pZHrZ1i/EKwpxu7pBo0vl9XqSvtEvynKymlTqhu8PdLZ9xIU5/P+NseiMMTsX184jgvm
 l2HI+3eL9AU0FaLJ9Z5sRDZHkoaMjIGu27UrG+xEOJU6oPbw9WL+KR881aZYOcuQRrFv
 uH9zQAYDfnRXxSQGFWrJVIDvPpe0S2+Ved1mJVvpTneB+4xEu6c8n4ZSvaWwZgqWO14j
 CroKxLynrrZrM2G5bAHQVXJ88CKtazsy5t6aapYbuDNvTerwUTMGQ7adE7xjKdHQ6BpO
 0i3w==
X-Gm-Message-State: APjAAAV1RMVC3U0iHC/DXqj5H4PUR2DnFfOnYXtv2WrfImEKmnLDtqzq
 vpBGhLRKFuV6Vy7J0VDZzwXX4O9wVaw=
X-Google-Smtp-Source: APXvYqx4wKh7tl6R8bfdItV6V2cypAUTfzuWC7DwLomvDT8k8tp58TIiD82rIzVUYkOqG6v8/veu+A==
X-Received: by 2002:aa7:c991:: with SMTP id c17mr2993454edt.282.1559633997276; 
 Tue, 04 Jun 2019 00:39:57 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44])
 by smtp.gmail.com with ESMTPSA id b10sm3025895eja.58.2019.06.04.00.39.56
 for <alsa-devel@alsa-project.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 00:39:56 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id o12so7540606wrj.9
 for <alsa-devel@alsa-project.org>; Tue, 04 Jun 2019 00:39:56 -0700 (PDT)
X-Received: by 2002:a5d:4311:: with SMTP id h17mr19701241wrq.9.1559633996367; 
 Tue, 04 Jun 2019 00:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190603174735.21002-1-codekipper@gmail.com>
 <20190603174735.21002-3-codekipper@gmail.com>
 <20190604073651.gst57ki7ohzxcrqz@flea>
In-Reply-To: <20190604073651.gst57ki7ohzxcrqz@flea>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 4 Jun 2019 15:39:44 +0800
X-Gmail-Original-Message-ID: <CAGb2v67ch3F23q-SSxU01Mvkt-x8LL5HfwnZb4NdJcMMkN2H+w@mail.gmail.com>
Message-ID: <CAGb2v67ch3F23q-SSxU01Mvkt-x8LL5HfwnZb4NdJcMMkN2H+w@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Code Kipper <codekipper@gmail.com>, linux-sunxi <linux-sunxi@googlegroups.com>,
 Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [linux-sunxi] Re: [PATCH v4 2/9] ASoC: sun4i-i2s:
 Add offset to RX channel select
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

On Tue, Jun 4, 2019 at 3:37 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Mon, Jun 03, 2019 at 07:47:28PM +0200, codekipper@gmail.com wrote:
> > From: Marcus Cooper <codekipper@gmail.com>
> >
> > Whilst testing the capture functionality of the i2s on the newer
> > SoCs it was noticed that the recording was somewhat distorted.
> > This was due to the offset not being set correctly on the receiver
> > side.
> >
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
>
> Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Would be nice to have

Fixes: 7d2993811a1e ("ASoC: sun4i-i2s: Add support for H3")

But otherwise,

Acked-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
