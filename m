Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3414A34083
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 09:40:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E2A61693;
	Tue,  4 Jun 2019 09:40:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E2A61693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559634055;
	bh=0F5C7ocaLWzinEUrKYvlQxa60mEro5HmBOoGJVwZd5s=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K2GPYQID8SaU/xiaJQKMEkb/7wAMB+p8LZb3aQWo8Rnok9hqWIqbs/0PpbcH3dXor
	 UqxSV0o+U3TlqDXPCMx2Ur+HA7AFC4tn5kkwC4pKEJh0+3pH7hi68PyalBk7Ne0JbS
	 j/sQ06aOVKENmrTqq5vi0vjpxZP42R7t3/l6fXIM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26362F896FE;
	Tue,  4 Jun 2019 09:39:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E40B7F896F7; Tue,  4 Jun 2019 09:39:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26758F896CE
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 09:39:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26758F896CE
Received: by mail-ed1-f65.google.com with SMTP id w13so3961365eds.4
 for <alsa-devel@alsa-project.org>; Tue, 04 Jun 2019 00:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CYZmXX0Qajsd2CJ4M9QVAkg8+0uFy5kGttoDqJVnpRg=;
 b=HDAZ1jk4aM9PCErqWG+F7L8Zf9VyNF9jiADj8Ji0CJPx0NcfuS+6gLyYKDgMN3V5gU
 3XnRa9abcvar5E2OrObZTG2pYAPD8E5hG7/T9s1Y26ZnnBVCbBFs3n0IcMYO1EG+MSLc
 WRPG/PLh3BAC9lotj6p0yLnKc3x0yqBA+xCy279x4wWcS+ZXh9pRaWUEU3DP8XZEbbo2
 vUCMeA+k0I/wwHm0fEzoxqS1HVUtKMkxlQ2ej8Pf6x1djMrpxhzb3iLtrvXUTMtIJtBs
 cVSQN7p8ARjY4yQ7XBkDsYUUK6GShUSuTB3srwb9UoP//cMRR4C0P+4NIGQi2axL8ecn
 s1og==
X-Gm-Message-State: APjAAAXALZCeOEal8JeqW2cXLDATnwlubdRI7PbgxHQiYEzaMYsinJiN
 Umse4KOZDhmgIKP2DBnJXmB+7dO/D40=
X-Google-Smtp-Source: APXvYqx9AvNKVhtSuxXC0f9CgGQJj7Lt1LBn7v780cX0ixnnCn2VsEMyHzwqAnNDMj6FOB/W0w0LDQ==
X-Received: by 2002:a17:906:7cd2:: with SMTP id
 h18mr27764070ejp.267.1559633945103; 
 Tue, 04 Jun 2019 00:39:05 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42])
 by smtp.gmail.com with ESMTPSA id z10sm4664827edl.35.2019.06.04.00.39.04
 for <alsa-devel@alsa-project.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 00:39:04 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id f204so9695691wme.0
 for <alsa-devel@alsa-project.org>; Tue, 04 Jun 2019 00:39:04 -0700 (PDT)
X-Received: by 2002:a7b:c344:: with SMTP id l4mr16737404wmj.25.1559633944348; 
 Tue, 04 Jun 2019 00:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190603174735.21002-1-codekipper@gmail.com>
 <20190603174735.21002-2-codekipper@gmail.com>
 <20190604073443.cnnqd7ucbaehxdvj@flea>
In-Reply-To: <20190604073443.cnnqd7ucbaehxdvj@flea>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 4 Jun 2019 15:38:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v64T5MypDD9A5FNfyikB9vFJZf9+TiQaXi_o2K53QmfaQg@mail.gmail.com>
Message-ID: <CAGb2v64T5MypDD9A5FNfyikB9vFJZf9+TiQaXi_o2K53QmfaQg@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>,
 Code Kipper <codekipper@gmail.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [linux-sunxi] Re: [PATCH v4 1/9] ASoC: sun4i-i2s:
 Fix sun8i tx channel offset mask
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

On Tue, Jun 4, 2019 at 3:34 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Mon, Jun 03, 2019 at 07:47:27PM +0200, codekipper@gmail.com wrote:
> > From: Marcus Cooper <codekipper@gmail.com>
> >
> > Although not causing any noticeable issues, the mask for the
> > channel offset is covering too many bits.
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
