Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FD19E638
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 12:57:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A35A1666;
	Tue, 27 Aug 2019 12:57:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A35A1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566903470;
	bh=DinRKD5QrnwBcaIX8yUyMPmH+wzjLrxNjVHnBMm/gsY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S4H+Kr2JYo+MwsAQzBJcVR8SBFEpkpJ9CCzr9HKYuisSVTYiy3OuK8WXP7euWwgkA
	 FIjJZtooBc65nQUKgwOngJNDtk+gN52wAX8KNtJ2EnEii4f37JpBTzC0eEfMHTTknM
	 KNgtW4Bn3hol+4yrj0yHJ7QHpTnN68p32qxl+bCk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E9B1F80274;
	Tue, 27 Aug 2019 12:56:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D5B4F80274; Tue, 27 Aug 2019 12:56:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CFC5F801ED
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 12:55:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CFC5F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NqNrQmQF"
Received: by mail-lj1-x243.google.com with SMTP id x4so18005175ljj.6
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 03:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wq/U2uqRcLoFz7h5fswTveJreTohoqdRqnhzH4lXvVc=;
 b=NqNrQmQF1TMINxnG3tXMC6N5lSsJnysRJ2K4cMrSNhSxsvBEaXWJi9hcdMosgflzuj
 FCBt/kJFLNjNFxuovam6nPV8YMSq07JTyoks0a12zNst31Hu/OGjLsRQnmnk1u95vL8q
 96rtvTczjT2qyj0J5j+n2gVnXJiyMoxyl0gQYV9ANzRPa+zfFMBoVKLhcSm8IYrhujwS
 pucH7orz6GYQ98O8FpJXrIVLkQxoTmG40eyJ8t4D4x49aEERcS6lSRbxVwxNB7ZkJn3q
 q7pgDqiayFM2B6KfTf4GFJXxI/QfLb9Z65Qyd1G85gHlazbmKo/koDG+OvWDpGLLPzqd
 jMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wq/U2uqRcLoFz7h5fswTveJreTohoqdRqnhzH4lXvVc=;
 b=TQ0PSluWrFPqkesFU0x+lWe3nyLf4b+8J3zF8qF8ty5fOd+8D2YArDzPfts9CO6bwQ
 p3rwdgZXYYLnde+MhOKyg7BIqC6Sg2Q79g1bn8PFnuLUCKiTGAavVtUKkQJ0ovD/Rw4/
 MefN+26jif0nF428cRWtPRoenoHZhji9yiDVrxCSJFuTXbW4kpF2laDQa9eLFrtZQh3F
 GS+KjoT64eCMfrH3gNTTpNNhkOSIKxYMML8h92rK26F6ce1KT5RWPYV1Auhi5IsfG3Fc
 1bNbuPqMjUuMCMh0jB8NNbVZ2WbQ7lpGaxWfmRr+mxe8K3WdCr/Ec/kRSudztx5pM/KA
 OzrA==
X-Gm-Message-State: APjAAAWQbHnPxWtRXudMMnxV6CfZ3XlVJ7VGgb3Q8tDcsvUtkNB/v/Dh
 Y4GwWJtXNsbLneO2ZF4RYkEv8avapmktmNUODlY=
X-Google-Smtp-Source: APXvYqzJByXIYwML49GNgKStE890AUBK1DvwMnysuxEQMAxx+kxsF/bgtN7N1xuNGViTj1IJJw3i7Lf8ckkaj1at2EY=
X-Received: by 2002:a2e:3c12:: with SMTP id j18mr12914274lja.50.1566903358224; 
 Tue, 27 Aug 2019 03:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190826180734.15801-1-codekipper@gmail.com>
 <20190826180734.15801-3-codekipper@gmail.com>
 <20190827093429.fkh4cqbygxxyvkk3@flea>
In-Reply-To: <20190827093429.fkh4cqbygxxyvkk3@flea>
From: Code Kipper <codekipper@gmail.com>
Date: Tue, 27 Aug 2019 12:55:46 +0200
Message-ID: <CAEKpxBmpNk=QPnOqCX7cWCV8qvxqhgEVT2AWhwGUmFMRyoF50g@mail.gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v6 2/3] ASoC: sun4i-i2s: Add regmap field
	to sign extend sample
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

On Tue, 27 Aug 2019 at 11:34, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Mon, Aug 26, 2019 at 08:07:33PM +0200, codekipper@gmail.com wrote:
> > From: Marcus Cooper <codekipper@gmail.com>
> >
> > On the newer SoCs such as the H3 and A64 this is set by default
> > to transfer a 0 after each sample in each slot. However the A10
> > and A20 SoCs that this driver was developed on had a default
> > setting where it padded the audio gain with zeros.
> >
> > This isn't a problem whilst we have only support for 16bit audio
> > but with larger sample resolution rates in the pipeline then SEXT
> > bits should be cleared so that they also pad at the LSB. Without
> > this the audio gets distorted.
> >
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
>
> If anything, I'd like to have less regmap_fields rather than more of
> them. This is pretty easy to add to one of the callbacks, especially
> since the field itself has been completely reworked from one
> generation to the other.
>
ACK
That's fine....I've been doing that with the patches which follow this.
CK
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
