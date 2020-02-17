Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2FA160CEB
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 09:21:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E7D91670;
	Mon, 17 Feb 2020 09:20:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E7D91670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581927704;
	bh=p8tHXWCiSvkuEYWjW8VUGd376lNNw//xrFhalbSTt1Y=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pf6q7UnzsKWMWQuQRQVUol6lgsvJ/7RfEH/xiOBhbVCBFS1kXalSot3Pm/hOqYKwp
	 /0Eo7TdwZfyM0NnKFuBWCCALYzBip2Tj1RyjhPiJ3rdOToDehGC2A0uGDXhwaIZ04F
	 h0k0+ooxj7TFwKY2h2dxoaeZgFp18UijzjgunbUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AA34F800C4;
	Mon, 17 Feb 2020 09:20:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78B9BF800B6; Mon, 17 Feb 2020 09:20:00 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C376F800B6
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 09:19:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C376F800B6
Received: by mail-ed1-f67.google.com with SMTP id p23so19648073edr.5
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 00:19:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ATnQLLigNnNp+3vrMMUywd96YC/sdkp/YQzir+b0HgQ=;
 b=G1H3dv0BPX9f+mq02AQfSEubAtrd4Yhs11DiSralcvkL3yEyjA4PKz2kjCWBRYz6Fo
 onwtbQzEYUUIyPZZj6m+2DuRDhMiezpC5e9ETWJ5zvvUD9uejKc4NUDAb0wBaa2JBnIB
 MDaTVcicwUICko2G9GM0dip+betAsp0EuCevGDrtzw0gxHj95gsGEQD/Uzz8U8Q6Q9NV
 2pte7gFpee5YPvCCwzsWAraIvsReKJrv1DWjInYVghnxrms7dZC8EnBvkMAaZ5JdiYQ/
 9EpcunebOdLJOkps5vPQAoZBkyWhEW7CmVQVVjJQVgxJKJrbCWu1PkySIMyzavTeDv37
 Uwtg==
X-Gm-Message-State: APjAAAXEqN21fKPsSaoU0V911fQFllr7wHCQ/FeFfHsvtqprqLC90fQf
 3L17b+CvVZToJrieiup7gOyh+FStaLw=
X-Google-Smtp-Source: APXvYqznrwAH5sil7koMB2YIKWNVPijfppm7neMEE7ZxHPfhLkLlnjY+6WdqDfxdWlHGfZWX+pKScA==
X-Received: by 2002:aa7:d9c6:: with SMTP id v6mr13249066eds.107.1581927596024; 
 Mon, 17 Feb 2020 00:19:56 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51])
 by smtp.gmail.com with ESMTPSA id q5sm440940edb.70.2020.02.17.00.19.54
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 00:19:55 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id c84so17356648wme.4
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 00:19:54 -0800 (PST)
X-Received: by 2002:a05:600c:34d:: with SMTP id
 u13mr21454590wmd.77.1581927594021; 
 Mon, 17 Feb 2020 00:19:54 -0800 (PST)
MIME-Version: 1.0
References: <20200217064250.15516-1-samuel@sholland.org>
 <20200217064250.15516-6-samuel@sholland.org>
In-Reply-To: <20200217064250.15516-6-samuel@sholland.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Feb 2020 16:19:43 +0800
X-Gmail-Original-Message-ID: <CAGb2v64p9QEhni1sAQWA9eOtGYDcc2_VnUd92sUxK7M_doHZJA@mail.gmail.com>
Message-ID: <CAGb2v64p9QEhni1sAQWA9eOtGYDcc2_VnUd92sUxK7M_doHZJA@mail.gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, stable@kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [RFC PATCH 05/34] ASoC: sun8i-codec: Remove
	incorrect SND_SOC_DAIFMT_DSP_B
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
> DSP_A and DSP_B are not interchangeable. The timing used by the codec in
> DSP mode is consistent with DSP_A. This is verified with an EG25-G modem
> connected to AIF2, as well as by comparing with the BSP driver.
>
> Remove the DSP_B option, as it is not supported by the hardware.
>
> Cc: stable@kernel.org
> Fixes: 36c684936fae ("ASoC: Add sun8i digital audio codec")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
