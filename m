Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B81D563845
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 18:48:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C269716B4;
	Fri,  1 Jul 2022 18:48:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C269716B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656694135;
	bh=3aXEKuYhSekfjFf2iaJFFk/57mY9AqJp8+HZ/oMIjzQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DgMOCH/jNIKn0hLZf+ssm3RdQwdjVUpqgfv2D7+yBrBSW2+P9uHCiRxnJCtxSS4eR
	 gjK0gh5k0LWfHxKiAqiaTp9pDbt6ARHCQxJYYIWjjnbCrLZ89KS1Te+hXWmx9Y/NKv
	 sz71WnDWAznHrXwXnfJDrL53PGhtqnGpiPZBqPUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40E76F80256;
	Fri,  1 Jul 2022 18:47:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFC98F800E8; Fri,  1 Jul 2022 18:47:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42215F800E8
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 18:47:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42215F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="NFQb1gvP"
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-fe023ab520so4223586fac.10
 for <alsa-devel@alsa-project.org>; Fri, 01 Jul 2022 09:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3aXEKuYhSekfjFf2iaJFFk/57mY9AqJp8+HZ/oMIjzQ=;
 b=NFQb1gvPPgh9l6ruExkaXLZ1hFCZfoyPD99CK1HWB7to7E8wSHjtHLAHs8hQK2c5nM
 FpMJM4l43Kc6cdx0S/XcRRbIGzbRiat3w+G1TAfva2q1K0ZtJCzvIuZpQ2lf96iLM/sP
 RXGhwEwsvIQNicNbaidCfit2HC/ghNX/2Rxbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3aXEKuYhSekfjFf2iaJFFk/57mY9AqJp8+HZ/oMIjzQ=;
 b=aegseXvleOudB3jS3AuTOqHxdATgVHrLGjeEwL8RTHBotg5LHFTGTGqHOEVSzAPD/t
 nU5QlDxAVbfO3f/yU09YlTR1gDytO4muj6GpAX4afQArfGQtxd2lx2v2PWoxxw2Anvfm
 RFMpamS9yjWYplK6k4MaQ8LcNIVTaGTGJdjjO+xPL8dSPyIzlbCcSuHH3Tz6dUZB9XA6
 zvcKOvHi6ALhtxQf6HgI9H3u8fMI4He+YgZnhFx8m2OcRyQbDJQ+OV4NNHIrE64DN5ND
 1719aMfNUDZ/O4YFSM6TPLta8OKLQbUBHMv8sJmIBxh+F6GCy0rmOlhXN2WDWAL7Cs6F
 vxIg==
X-Gm-Message-State: AJIora9QSe2TZguyP8UBJz/tPOk7+0RMq01GbO7jcA+lkzPgdLRK7U7j
 P6Yx7TCjTCW6nBh234R5ETwL25oMjqkpbA==
X-Google-Smtp-Source: AGRyM1uNPz/R5Hky58CnKeWEPZlfVDULSOb/gq6KDXDUS9LIt3SKqV5U77llT1B+feL4hIlU0dKGJA==
X-Received: by 2002:a05:6870:2483:b0:ed:f721:2734 with SMTP id
 s3-20020a056870248300b000edf7212734mr9055233oaq.242.1656694063871; 
 Fri, 01 Jul 2022 09:47:43 -0700 (PDT)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com.
 [209.85.160.44]) by smtp.gmail.com with ESMTPSA id
 z39-20020a056870d6a700b000f342119f41sm14655073oap.42.2022.07.01.09.47.42
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jul 2022 09:47:43 -0700 (PDT)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-101dc639636so4254784fac.6
 for <alsa-devel@alsa-project.org>; Fri, 01 Jul 2022 09:47:42 -0700 (PDT)
X-Received: by 2002:a05:6870:2326:b0:f1:7485:2a92 with SMTP id
 w38-20020a056870232600b000f174852a92mr9593871oao.291.1656694062616; Fri, 01
 Jul 2022 09:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220701021427.3120549-1-judyhsiao@chromium.org>
In-Reply-To: <20220701021427.3120549-1-judyhsiao@chromium.org>
From: Brian Norris <briannorris@chromium.org>
Date: Fri, 1 Jul 2022 09:47:30 -0700
X-Gmail-Original-Message-ID: <CA+ASDXMof_NA0v_PwD6--ojrsEiMvSOpx48UWS0vmVB4xBc_VA@mail.gmail.com>
Message-ID: <CA+ASDXMof_NA0v_PwD6--ojrsEiMvSOpx48UWS0vmVB4xBc_VA@mail.gmail.com>
Subject: Re: [PATCH v1] FROMGIT: ASoC: rockchip: i2s: Fix error code when fail
 to read I2S_CLR
To: Judy Hsiao <judyhsiao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

On Thu, Jun 30, 2022 at 7:14 PM Judy Hsiao <judyhsiao@chromium.org> wrote:
>
> Add the error code '-EBUSY' when fail to read I2S_CLR
> in rockchip_snd_rxctrl() and rockchip_snd_txctrl()
>
> Fixes: 44f362c2cc6d ("ASoC: rockchip: i2s: switch BCLK to GPIO")
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>

Apart from the FROMGIT subject:

Reviewed-by: Brian Norris <briannorris@chromium.org>
