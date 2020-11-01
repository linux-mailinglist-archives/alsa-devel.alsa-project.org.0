Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E35612A2058
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Nov 2020 18:32:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7676A16A3;
	Sun,  1 Nov 2020 18:31:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7676A16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604251927;
	bh=horNYbigRkIDJTgv0bLB489ackww8RhDFMij2VXFQYA=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p30jZd8JN7i2Q7lw5zzZeQ+MswtymgTYOh+b7dcHcdyupkgBehBm3nJSFPqx8jZDs
	 xkwYQf2Pehal1VxwX2KjSfov5mFVhItLFdHDZAqmKqWAvT1H8yMNMkwmv9Fk3y37tr
	 rlMyaoVTp+lJtubBC5CORUvwMg9dU8wBiiJsGDLQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B12C5F8012B;
	Sun,  1 Nov 2020 18:30:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DED61F80162; Sun,  1 Nov 2020 18:30:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D2F6F80158
 for <alsa-devel@alsa-project.org>; Sun,  1 Nov 2020 18:30:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D2F6F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TV07pa3Y"
Received: by mail-il1-x12e.google.com with SMTP id a20so10913976ilk.13
 for <alsa-devel@alsa-project.org>; Sun, 01 Nov 2020 09:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=8DJgmxtam0fsA7Yaz4RpCJCGI7oB/JrdHqZsXWywIlY=;
 b=TV07pa3Y1G1g/XHh05r1Dy+Y41sFN0Oxr9nk77p1vDpH4EJaByPgLmPNXzP+OcPRp9
 EFN3zDV8DHHYTT22Oz4zDjZ+Np1XXBE0lHHj3dte2/bjya/4Ke9OI9LCdZje4cmYyYMh
 0c3cbD/h86ktBEimEhqToyQQ+rK0FtmPHS3aSQbPqWM0tPCQAG5O33DAGCYD1ht8NXvf
 i+TfU7Svq8hUUXY1PRI97+ibgoYq3IyprX2X8WzjNytJVMVH/D8SgqfFCQHqmlZ9BL3u
 9EQ5TQ476wwweOifRSxRMH+7COh5KDHLzftFVNIDP3Q359cU+3kjfazPz1sWTCCTMpmY
 WXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=8DJgmxtam0fsA7Yaz4RpCJCGI7oB/JrdHqZsXWywIlY=;
 b=mKqj5Qj16ZrQ69Q76cpxkYM/WKAwa8JKtFe7u2b8nhbpFSHKYlsyzB7fVPHNKJ559V
 CSFPXnBJUh/fP0Hg6RrvHQsICHNmZWgyrXMvijGzU7MKs4pb8PjeUOrmk6iJrfcWjzXR
 fHGIoMqgvB2BuVLcij6BN29TnTr1zP4ec3CvjdTTU7Fo5az8aYpgRVibDbeuyrfN4B0D
 lQzprCP8QKBFyRhVAjYOsuUcZtxXDNQ5aNn70s0Yo/j3PO3tGRSKiFNWCVW2YGbGv3M4
 Xf4e6ZEcQxRI/ZddT8UyqrP/7tBXAm1igRuTFX5dLlT2+FovyOnbx0i/5EihF1N4Yruj
 EchQ==
X-Gm-Message-State: AOAM533dF64MjJVsEMnKKrIzzrBCNFcgfZQyvj10HEgIduO/gl9z+LkO
 9ZGeaT8ASHwxCi5yuV7M9+wgwrYORYMXbEO9clY=
X-Google-Smtp-Source: ABdhPJzidrcvd5thvWFkOensKbEmp0zDYFA8cU/rxYa76qQESK0Y3vy2MOVbpv5gbM1q/9gRKAziek25HvK154M2KCI=
X-Received: by 2002:a92:a14f:: with SMTP id v76mr8393365ili.293.1604251826058; 
 Sun, 01 Nov 2020 09:30:26 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 1 Nov 2020 18:30:15 +0100
Message-ID: <CAJiuCcfBOHhniDQOaB8ixU0pY9u0GVivkj7po-kozBV8LqmB6A@mail.gmail.com>
Subject: ASoC: Question regarding device-tree multi-lane I2S for Allwinner SoC
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Samuel Holland <samuel@sholland.org>, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
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

Hi device-tree and sound Maintainers,

I have a question regarding multi-lane i2S representation.

On the Allwinner SoC the I2S/PCM Interface can handle up to four lanes
as output or input.
For each lane we can enable up to sixteen slots.
And for each output slot we can choose which slot to map.

The only representation I found is for Amlogic device-tree they did
the following sound node :
/* 8ch hdmi interface */
dai-link-7 {
    sound-dai = <&tdmif_b>;
    dai-format = "i2s";
    dai-tdm-slot-tx-mask-0 = <1 1>;
    dai-tdm-slot-tx-mask-1 = <1 1>;
    dai-tdm-slot-tx-mask-2 = <1 1>;
    dai-tdm-slot-tx-mask-3 = <1 1>;
    mclk-fs = <256>;

    codec {
        sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
    };
};

This kind of representation gives the information that 2 slots should
be enabled as TX per lane but don't give which slot to map.
I was thinking about a representation per lane but maybe it's a bit
complicated  ?

    dai-format = "dsp_a";
    dai-tdm-slot-width = <32>;
    // Lane 0 : Output 8 channels 0-7 using TDM
    dai-tdm-slot-tx-mask-0 = <1 1 1 1 1 1 1 1>;
    dai-tdm-slot-chmap-0 = <0 1 2 3 4 5 6 7>;
    // Lane 1 : Output 3 channels 5-7 using TDM
    dai-tdm-slot-tx-mask-1 = <1 1 1>;
    dai-tdm-slot-chmap-1 = <5 6 7>;

I will only start to support HDMI, so 4 I2S lanes for now it should
look like this

    dai-format = "i2s";
    dai-tdm-slot-width = <32>;
    frame-inversion;
    // Lane 0 : Output channels 0,1
    dai-tdm-slot-tx-mask-0 = <1 1>;
    dai-tdm-slot-chmap-0 = <0 1>;
    // Lane 1: Output channels 2,3
    dai-tdm-slot-tx-mask-1 = <1 1>;
    dai-tdm-slot-chmap-1 = <2 3>;
    // Lane 2: Output channels 4,5
    dai-tdm-slot-tx-mask-2 = <1 1>;
    dai-tdm-slot-chmap-2 = <4 5>;
    // Lane 3: Output channels 6,7
    dai-tdm-slot-tx-mask-3 = <1 1>;
    dai-tdm-slot-chmap-3 = <6 7>;

What do you think? Do you have any remark / idea about this ?

Thanks for your help
Clement
