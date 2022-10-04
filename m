Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA0D5F41D9
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Oct 2022 13:19:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0A9D16F0;
	Tue,  4 Oct 2022 13:18:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0A9D16F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664882370;
	bh=Ydkxtxicfmofj1JjvywIek48xWO5IV7LdpxUXeeo4Fo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tAM3j8cXeT0fpIf+oSRaAzYn2K9U6S/vcnm0m1BHiJeeIbmXnLlBbTNPQPeHJTFBY
	 HV/lPt4AkPiT/mvH6c84fj/qUGV+7fwgM3xDUt0NPzKQjKQ/Ggng2Y1fWlID8jOjSJ
	 1y1928Yzui4D4KNwbxXJAPZobbeqQbHfkyjNR9cE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E2F1F800C1;
	Tue,  4 Oct 2022 13:18:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9B0EF801EC; Tue,  4 Oct 2022 13:18:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 724F1F80118
 for <alsa-devel@alsa-project.org>; Tue,  4 Oct 2022 13:18:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 724F1F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ljj4x0ni"
Received: by mail-ej1-x634.google.com with SMTP id qx23so10049124ejb.11
 for <alsa-devel@alsa-project.org>; Tue, 04 Oct 2022 04:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Ydkxtxicfmofj1JjvywIek48xWO5IV7LdpxUXeeo4Fo=;
 b=ljj4x0ni66GLCgns5fww2uZEa8LE4hC2Nr2ajALIEFxbAXVCCqKxTL6A4R85fNRbOO
 F48ueDXQbU1IuETsLVg+y2KgN/mM52yd7/MK9rouelh5N9P71D6NukYQRPBflfiDPkzg
 EqDwtRP9bc8vFyu3S2A+0Ug4rBRT91Yh4rSyqkOin/XpGLQZ2wC61f9Q9/CCeu/8PYnJ
 bpnpnrB0TiSroLkQTsxWEgDo3sDvCYNpVGjwDjbJKbKtmkWvkNQ5NgAdlHbLAzlTaYtM
 CdsNRpAkvmXCbCa6u7LiTllRAyjF/cprrkcU5WJai8sULIY7QrkpiPC7ZB4OD7lX0CiB
 yLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Ydkxtxicfmofj1JjvywIek48xWO5IV7LdpxUXeeo4Fo=;
 b=ByaD1va/j6Dm79kLEKxpxb8XdNtaBs+/CaEFWRJCbzLjEMyx2OIhityS/1Q51SnJHO
 7k96uV8vDaqI1cBTHBjrCDnQw2kTauAhH/ZvP1fzLUlmBuzDVRVthhLPdVpe30BxiraS
 IAVqD+ttBn9CZixzhV34phzU0rEoCsJ3DruqHvEv4KY1X3TLom8M29Bs0gNSZeu4hdKC
 jwAtRiGZIQf1co3Xgk3Bge1UaJIs8vlmMW+ASpix10yQjhPeIjPMIucFul8i2t/ISZd4
 SEN1z/VZWCRwau421qTSNopvRbCSrBR38BXEKGrfpf43Ys0W+8cwZhHBUnnbHZZ1eEb8
 Rvfw==
X-Gm-Message-State: ACrzQf1dFHXbgU4z5gxKvlaUduYB6WLmbX0auWYBXhFgMc8aENhp+Swd
 Yk7nY6I+FXPTGl49yUn8oR1WSD8gZTxsjbGEUv0=
X-Google-Smtp-Source: AMsMyM7Dh3Xqsy2vwIP7AlrBx7QANX+cRDYoz4nn3OH/6QgI59fnAx5Uwajm+E8TN3CZAfQ6gkFQKdLFp4gAEv5Mluk=
X-Received: by 2002:a17:907:e94:b0:782:f9d2:5301 with SMTP id
 ho20-20020a1709070e9400b00782f9d25301mr18872479ejc.393.1664882304274; Tue, 04
 Oct 2022 04:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAEnQRZALsr3Cf20K103ax9kvk-opAfWMW5XBE6pgu0KKq2Xaxw@mail.gmail.com>
 <2d31661e-0542-69b0-4a97-ff1e277c3351@linux.intel.com>
In-Reply-To: <2d31661e-0542-69b0-4a97-ff1e277c3351@linux.intel.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 4 Oct 2022 14:18:15 +0300
Message-ID: <CAEnQRZCkJGe8OQdFDAhB_p-xLcb+S=6g6JG0jdBhNEUVzuP1ow@mail.gmail.com>
Subject: Re: ALSA Compress API - system suspend/resume
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Paul Olaru <paul.olaru@nxp.com>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>
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

On Tue, Oct 4, 2022 at 12:46 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
> On 10/4/22 11:07 AM, Daniel Baluta wrote:
> > Hello all,
> >
> > It looks like system suspend is not implemented for Compress streams.
> >
> > Any story behind this? Were there any attempts on implementing this?
>
> It depends on the definition of 'system suspend'.
>
> What we had in mind back in the early 2010s was to allow for 'active
> suspend' aka S0ix or low-power playback. That was the main reason for
> introducing the API.
>
> For suspend to S3/D3, the plan was to just completely stop any
> playback/capture and restart on resume. I am not sure if this was ever
> implemented, that may be a miss.

I see. Yes, we are looking at S3/D3 suspend and this doesn't look to
be implemented.

>
> There is a corner case we may have overlooked. I am not sure what
> happens if the S3/D3 suspend while playing. This is supported with e.g.
> aplay but for the compressed case it's a bit more complicated. Not all
> formats support rendering for a random position.

True. We want to implement the same behavior as for aplay. Stop
any playback/capture and restart on resume.

Thanks!
