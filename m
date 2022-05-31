Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E2C539994
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jun 2022 00:33:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22E0B167A;
	Wed,  1 Jun 2022 00:32:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22E0B167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654036394;
	bh=eeqHsEM+DLucHdS7HDnt9+vgcaGWveb6R5gqZjV1xDk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KCSpMv9FXtfbQFrtEVjU7MpFBEtKe3aQ982jAAUVBh669CwQ0//eJn96bSLGi9a1t
	 35mhT5nBNUQoVamIric0nkQylElJeUQio7V5G/ficoITjWtlFxPYyRrLVPm3pGeB0Q
	 mhABquDTAzCIzwe0ntRcMgymzBSIEgurDxiY+pmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B853F8051C;
	Wed,  1 Jun 2022 00:32:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBC7CF80516; Wed,  1 Jun 2022 00:32:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13D20F800BD
 for <alsa-devel@alsa-project.org>; Wed,  1 Jun 2022 00:32:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13D20F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="KN2tTYof"
Received: by mail-pf1-x430.google.com with SMTP id w21so268297pfc.0
 for <alsa-devel@alsa-project.org>; Tue, 31 May 2022 15:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=P9LyQVuvmVsNZW+3nPRkSL6POGxEfk0Mn3guF1+YKuI=;
 b=KN2tTYofItlyGe49xSbgyxQWQ327Y7iR6YoFSM9lhh+wiM1RX/01VGMPQk3muL0ImN
 ZabsYj5dpUeZY8QZi0bzCA53EjL5//Ogzm6HcmIBFQLYHH6Gdnqx/Mm0QCfURZwwN/6+
 Bfh5dacPirFGkAjSKezJgUXm/9DqjlcIXhLQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P9LyQVuvmVsNZW+3nPRkSL6POGxEfk0Mn3guF1+YKuI=;
 b=wwv+JoOihk9oBUrsRl43ay4EjLsVpMcvwklBlvoy8B0M/4LfwndmOjPva32qkvItYa
 sgfN0+k0cHO/cztpgeoVB2xyFuf8iuykyCVOcl7VdVJC45XSIeNGBksU3MtM0pWQp1CK
 7VMIkoyh7WFTjbPi3ICB6MEvmH/J1gfXf4b9tO6rdgP7T4iiZGpZfYhMmK0FohrcUXXL
 nXICTS4MhSss4N8EPoxLKPooqkTvi5GjMdao72dGhbK5FKdKGGdL3hZ6B3xFbB9nN7Us
 3ebbZGMEQMgMdVaTGI7c7Pxjox62eMAiZkYPTZ/UloC62sKOCfni/B09rmRXHP79ZZ8u
 wK/w==
X-Gm-Message-State: AOAM53051DLoBv8g0oQwrOPad67svHE1JFFy+29aa9IN+8Qpm5mijAoN
 +h0sNF1TpfF3CGoeZxhwRbpVTw==
X-Google-Smtp-Source: ABdhPJwjBCrqDfLak45rq28qmCzF8Bpop3q8Bs7jqR40KSaDpro/v7PxK29LFIjoEyuzeSdZ/p9aGA==
X-Received: by 2002:a63:5843:0:b0:3fc:34b5:8278 with SMTP id
 i3-20020a635843000000b003fc34b58278mr7454016pgm.249.1654036329384; 
 Tue, 31 May 2022 15:32:09 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:e69e:f483:e751:7c7c])
 by smtp.gmail.com with UTF8SMTPSA id
 b3-20020a170902d40300b001620a2737b6sm59801ple.74.2022.05.31.15.32.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 15:32:09 -0700 (PDT)
Date: Tue, 31 May 2022 15:32:07 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v2] ASoC: qcom: soundwire: Add support for controlling
 audio CGCR from HLOS
Message-ID: <YpaXZ6KfApGebkBy@google.com>
References: <1652877755-25120-1-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n53g9rWks+euk5KHBzmJNEB3xLbJzMgCxN52DO5x+9-Wgg@mail.gmail.com>
 <51b8aca1-e038-4907-e973-ebdbebaf9b28@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <51b8aca1-e038-4907-e973-ebdbebaf9b28@quicinc.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, broonie@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, vkoul@kernel.org, agross@kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, quic_plai@quicinc.com,
 Stephen Boyd <swboyd@chromium.org>, judyhsiao@chromium.org,
 linux-kernel@vger.kernel.org
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

On Tue, May 24, 2022 at 04:19:47PM +0530, Srinivasa Rao Mandadapu wrote:
> 
> On 5/21/2022 8:43 AM, Stephen Boyd wrote:
> Thanks for your time Stephen!!!
> > Quoting Srinivasa Rao Mandadapu (2022-05-18 05:42:35)
> > > diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> > > index da1ad7e..445e481 100644
> > > --- a/drivers/soundwire/qcom.c
> > > +++ b/drivers/soundwire/qcom.c
> > > @@ -1333,6 +1337,10 @@ static int qcom_swrm_probe(struct platform_device *pdev)
> > >          ctrl->bus.compute_params = &qcom_swrm_compute_params;
> > >          ctrl->bus.clk_stop_timeout = 300;
> > > 
> > > +       ctrl->audio_cgcr = devm_reset_control_get_exclusive(dev, "swr_audio_cgcr");
> > > +       if (IS_ERR(ctrl->audio_cgcr))
> > > +               dev_err(dev, "Failed to get audio_cgcr reset required for soundwire-v1.6.0\n");
> > Why is there no return on error here? Is the reset optional?
> Yes it's optional. For older platforms this is not required.

If it's optional then either there should be no error message, or the
error message should only be logged when the version is >= 1.6.0. There
are few things worse than a kernel log riddled with misleading error
messages.
