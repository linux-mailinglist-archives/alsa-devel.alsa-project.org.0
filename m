Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDE42A0FD7
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 22:01:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 614611660;
	Fri, 30 Oct 2020 22:00:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 614611660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604091691;
	bh=yVWuuDRbBWJ5DK/y1CPH3kMVbnbrqO/RGH6gs6uCZkg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AKin0OoMsSz6E9MgndQuNmmdHdIyeFWUMEn92o0RcZwTrWPin8z17gPCJUvqlhQU9
	 Re3Gx2uumZgtwOZWSwi0XLNM4Q9M92tmlI3ceplOVE5FNDL23o6ZEZZBezcpWz6jL2
	 /5TAxuDsjKfnIVChnzMxr/ETK/jnbOzgdyq4SLW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1ADBF800C0;
	Fri, 30 Oct 2020 21:59:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45C09F80212; Fri, 30 Oct 2020 21:59:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_14,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69DAFF80107
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 21:59:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69DAFF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="vesqpwoV"
Received: by mail-ej1-x644.google.com with SMTP id p9so10450545eji.4
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 13:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k3WkoFBU74q2UUkntKKl2jUcW+YT3JWi72RY5sPwOfk=;
 b=vesqpwoVaNunwsRNYlewpH7leCs8rK5Ez+sifuWXtWFpLMB1bhb0y33nDMgYvwByw3
 tohjzgZ/ttG3vlbRT3y7ZJa+WYJ3ASCgH9VHXLHhX+FIpqlEH6rGnUyQnja+k1c/nxZk
 SLz4bWfb7lwECVgzXLuPxET1rNSJeudHd5mBOCFsRULvJOViO9/dKHLp/9oJrS9iJPyT
 qJ/wHQl7TA1n0jHpQr6bx91XwsO0AvQ66YnQeurV0oLG7b4zl3xEOttK/VK6w/GxeCQU
 HC8iVDJdVa8xV4JGvM1SeTOAInlCEwS/LsnMI4jxcaco7bGqbpcB5bQ4pPjx5aK6DFT9
 3fZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k3WkoFBU74q2UUkntKKl2jUcW+YT3JWi72RY5sPwOfk=;
 b=heAeoDdvSZ2uVmHtmdwgk+KeimBJaVuyxZ6nymV2f+c+M1cPOIHEdwkGYu1t+og/b7
 VY8WvxQ/ZEihtNTGNVJVtpmjHTQ3wnknDTo5mB3ndQJsABGUHcYJivp8+wECg2o1B651
 yO1R4KYxKqvow9vXZM9gvqONkfOgTIr5x2mGpbdhT4n1kmS1e/FYYcf9YqXbVtubzOgX
 gbsWcZQjEPBaIFEF6zFL92Z2yVpnjm+8P/vLyA5rrKqV/C58wQTVEo+CwQ4aY2rbX4PJ
 BK4PCfXAeHa7GTvfXt5IlaJijF58Eu298KJ07u+18GUMY2fzdiJN5SqHvaIz8oQnlvub
 0Wjg==
X-Gm-Message-State: AOAM530t/+ymFsffBWAaF6EPel6pY8dsUGWIczZef6yVkg68hjorLx5f
 ps417iQj/YRBRLgakAUJGCg=
X-Google-Smtp-Source: ABdhPJxnmacl+QU6UAVfnglw7U9K7nUmqKXuVD/IqcAM7LsfWaAjX4Ia4WbMBk84ZIpYZC9Qp37Uxg==
X-Received: by 2002:a17:906:2e59:: with SMTP id
 r25mr4478407eji.520.1604091585688; 
 Fri, 30 Oct 2020 13:59:45 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe1-5-97.cable.triera.net.
 [213.161.5.97])
 by smtp.gmail.com with ESMTPSA id bn2sm3376596ejb.48.2020.10.30.13.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 13:59:44 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@googlegroups.com
Subject: Re: [linux-sunxi] Re: [PATCH v10 00/15] Add Allwinner H3/H5/H6/A64
 HDMI audio
Date: Fri, 30 Oct 2020 21:59:43 +0100
Message-ID: <1619332.Na9eyGIdAE@jernej-laptop>
In-Reply-To: <jwv361va1g9.fsf-monnier+gmane.comp.hardware.netbook.arm.sunxi@gnu.org>
References: <20201030144648.397824-1-peron.clem@gmail.com>
 <160408688151.11950.1284919768798155829.b4-ty@kernel.org>
 <jwv361va1g9.fsf-monnier+gmane.comp.hardware.netbook.arm.sunxi@gnu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 monnier@iro.umontreal.ca
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

Dne petek, 30. oktober 2020 ob 21:50:43 CET je Stefan Monnier napisal(a):
> >> This series add H6 I2S support and the I2S node missing to support
> >> HDMI audio in different Allwinner SoC.
> > 
> > Applied to
> > 
> >    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
> >    for-next
> 
> Yay!

Note that this doesn't bring HDMI audio card just yet. Another driver will be 
needed for that.

> 
> Now, I wonder: will that make it easier to add support for HDMI-Audio for
> the A10/A20?

No, A10/A20 HDMI audio uses completely different interface.

> 
> (there was a patch for that submitted earlier this year by Stefan
> Mavrodiev <stefan@olimex.com>, but it seems there hasn't been any
> progress on it since then (I think the last message on it concluded that
> it should be rewritten to use ALSA instead of ASoC)).

IIUC original author left Olimex, so work stalled.

Best regards,
Jernej

> 
> [ To clarify, don't know what's the difference between ALSA and ASoC;
>   I'm only interested here as an owner of an A20 box on which I'd
>   love to be able to use the HDMI-Audio.  ]
> 
> 
> -- Stefan




