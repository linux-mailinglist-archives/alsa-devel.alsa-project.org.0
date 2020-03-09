Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C8A17DAFF
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 09:35:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF4D2166B;
	Mon,  9 Mar 2020 09:34:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF4D2166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583742944;
	bh=dbXO+ej4Uhcd1JHgUFGVT17fk5aQPjb0VWs/V970WZU=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oKpPCpsQ1id3yo2G/q9Iy1pZOEVrZ+vPF3UVdj3uLTTVKmrQBKvjTf614xNK+tnBI
	 FxrCHo8tDkJfEyTuxnn9Nke90x8v6S/TzvCOWDGSZHP3euxN1qxq12OtdvjZOpFUvt
	 TNEVr6hZZq+CypomFpuEIXbw0OdgOaMp0hr//Xts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B5ECF800B5;
	Mon,  9 Mar 2020 09:34:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2707F801EB; Mon,  9 Mar 2020 09:34:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E40AF800B5
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 09:33:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E40AF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=systemsoft-no.20150623.gappssmtp.com
 header.i=@systemsoft-no.20150623.gappssmtp.com header.b="cf+UX23g"
Received: by mail-pj1-x1032.google.com with SMTP id 39so749258pjo.1
 for <alsa-devel@alsa-project.org>; Mon, 09 Mar 2020 01:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=systemsoft-no.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=U7K52r4w2xw4v6LDAjiaHbnqnXKh4Tb/rVOUgxRU2p8=;
 b=cf+UX23gYYP+v4kP1KZU0zjovFoZqe7uVUGUfl1oA/P8tmFC0bCKS4y3tOn/iLC87J
 3GEv2n23VwSMYB4pT6Fp2reaUP2s2CPSvT99FmhGUq2KneFe+KROeVgAqI5lj7fcRnS0
 pY6MZZ8GS5x6/mbCJ8b1l9PVm0JIgnoWfqUeOdAAJ6L5sclrhZ4/sotw3fhOuZC61zxT
 xEgnEQF9SwdHXiK7znsGJrKj5pqLGgMQHNRPY38zcPHmfTOYuW6YvwMfqpq2t8ScdGea
 UoMTtHLNHhezHWxhYRks7hYh+nN09upaEZh7Bg24P9hNUq7dvGBMSVG9JQ4ZOG3cWuMn
 GmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=U7K52r4w2xw4v6LDAjiaHbnqnXKh4Tb/rVOUgxRU2p8=;
 b=VcB2CWj/G5CwrPTKCWEppXvIqMb4YYo1Ijtchs8XucJUXj81eucDl1Sx9Prk80vJoJ
 tBKPIenEhKBYWKvAOwZ31ewR4u8/DuUV2xerb0cKz60/+y6PXJIOelbnSWIg58kEYRlO
 Ys4UF4JtVauB/nbSYaeAbuc0Z4QtzXYKspBsqq8tfcTGsWpCtLjRsrPEmcavpVva7MGA
 uinMSPTN+zUPaVEk1XRYOUqnC4dHlYnWCbjTrGt3OOydc4SKGXxfuFcFZx0TfhcQ+7v0
 Nnz2lfbcuydqJB77KOHJnt/zyuQQb+FbpsIwEPfpvNxBdyaSNYOJvUDw7PRlEmV7wzzn
 svJQ==
X-Gm-Message-State: ANhLgQ1Csed2B7YlsIl5opZrNEdZ7sbWJL9oCUI/ab+GQCol49zoa0/R
 2BgARWSpVdxMj7aE52VlmODA4N6I8nl+3x8+zPh/xgHK7VKDiA==
X-Google-Smtp-Source: ADFU+vtZvoRAYIaO5cJHbDsPSunjFwA7d+a9tv/93R9z4j87OlQgPGtMvS7XzazktsuEdtDfCuxP2eaiF8YOrpU2ess=
X-Received: by 2002:a17:902:a701:: with SMTP id
 w1mr13606027plq.165.1583742833552; 
 Mon, 09 Mar 2020 01:33:53 -0700 (PDT)
MIME-Version: 1.0
From: Rolf Peder Klemetsen <rpk@systemsoft.no>
Date: Mon, 9 Mar 2020 09:33:42 +0100
Message-ID: <CANbLSG9F7V0nu7ibyW78SNmoznKOQm=58bk2a7ZRoyEjubHvEA@mail.gmail.com>
Subject: How to model 3xADAU1761 codec in TDM8 with 2xSAI in ALSA ?
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
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

Hello,

I am working on bringup of a custom board that has three ADAU1761
codecs, and a NXP LS1028A SoC. The codecs are supposed to be
configured in TDM8 mode and share a common playback I2S bus connected
to SAI4, and a common capture I2S bus connected to SAI3.
What is the recommended way of modelling this setup in the Linux device tree ?

So far I have tried the following:

&i2c0 {
    status = "okay";

    i2c_codec1: adau1761@38 {
        compatible = "adi,adau1761";
        #sound-dai-cells=<0>;
        reg = <0x38>;
        tdm-offset = <0>;
        clocks = <&adau1761_mclk>;
        clock-names = "mclk";
    };

    i2c_codec2: adau1761@39 {
        compatible = "adi,adau1761";
        #sound-dai-cells=<0>;
        reg = <0x39>;
        tdm-offset = <16>;
        clocks = <&adau1761_mclk>;
        clock-names = "mclk";
    };

    i2c_codec3: adau1761@3a {
        compatible = "adi,adau1761";
        #sound-dai-cells=<0>;
        reg = <0x3a>;
        tdm-offset = <32>;
        clocks = <&adau1761_mclk>;
        clock-names = "mclk";
    };
};

At first I attempted creating three simple-audio-card's. That
attempted failed since sharing the same cpu (SAI3 and SAI4) failed
with no ALSA device as a result.

Then I attempted creating a single simple-audio-card with two
dai-links (one for playback and one for capture), each containing
three codec sub-nodes.
That doesn't really work either. Can someone please point me in the
right direction?
Many of the parameters that I have put in the dts have no effect and
are assumed not supported.


Regards
Rolf

sound {
        status = "okay";
        model = "Super Sound System";
        compatible = "simple-audio-card";
        simple-audio-card,name = "sound";
        simple-audio-card,format = "i2s";
        simple-audio-card,bitclock-master = <&p_snd_codec_o1>;
        simple-audio-card,frame-master = <&p_snd_codec_o1>;
        simple-audio-card,widgets =
            "Microphone", "Mic In",
            "Headphone", "Headphone Out",
            "Line", "Line In",
            "Line", "Line Out";

        simple-audio-card,routing =
            "Line Out", "LOUT",
            "Line Out", "ROUT",
            "Headphone Out", "LHP",
            "Headphone Out", "RHP",
            "Mic In", "MICBIAS",
            "LINN", "Mic In",
            "RINN", "Mic In",
            "LINP", "Mic In",
            "RINP", "Mic In",
            "LAUX", "Line In",
            "RAUX", "Line In";

        playback_link: simple-audio-card,dai-link@0 {
            format = "i2s";
            convert-channels = <8>;
            bitclock-master = <&p_snd_codec_o1>;
            frame-master = <&p_snd_codec_o1>;
            name-prefix = "p";

            snd_dai_playback: cpu@0 {

                cpu-dai-name = "sai4_0";
                sound-dai-name = "sai4_0";


                sound-dai = <&sai4 0>;
                dai-tdm-slot-num = <8>;
                dai-tdm-slot-width = <16>;
                dai-tdm-slot-tx-mask = <1 0 1 0 1 0 0 0>;
                dai-tdm-slot-rx-mask = <0 0 0 0 0 0 0 0>;
            };

            p_snd_codec_o1: codec@0 {
                sound-dai = <&i2c_codec1>;
                frame-master;
                bitclock-master;
                clocks=<&adau1761_mclk>;
                clock-frequency = <12288000>;
                clock-names = "mclk";
                name-prefix = "c1";
                dai-tdm-slot-tx-mask = <1 0 0 0 0 0 0 0>;
                dai-tdm-slot-rx-mask = <0 0 0 0 0 0 0 0>;
            };

            p_snd_codec_o2: codec@1 {
                sound-dai = <&i2c_codec2>;
                clocks=<&adau1761_mclk>;
                clock-frequency = <12288000>;
                clock-names = "mclk";
                name-prefix = "c2";
                dai-tdm-slot-tx-mask = <0 0 1 0 0 0 0 0>;
                dai-tdm-slot-rx-mask = <0 0 0 0 0 0 0 0>;
            };
            p_snd_codec_o3: codec@2 {
                sound-dai = <&i2c_codec3>;
                clocks=<&adau1761_mclk>;
                clock-frequency = <12288000>;
                clock-names = "mclk";
                name-prefix = "c3";
                dai-tdm-slot-tx-mask = <0 0 0 0 1 0 0 0>;
                dai-tdm-slot-rx-mask = <0 0 0 0 0 0 0 0>;
            };


        };

        capture_link: simple-audio-card,dai-link@1 {
            format = "i2s";
            convert-channels = <8>;
            bitclock-master = <&c_snd_codec_o1>;
            frame-master = <&c_snd_codec_o1>;
            name-prefix = "c";

            snd_dai_capture: cpu@0 {
                sound-dai = <&sai3>;
                dai-tdm-slot-num = <8>;
                dai-tdm-slot-width = <16>;
                dai-tdm-slot-tx-mask = <0 0 0 0 0 0 0 0>;
                dai-tdm-slot-rx-mask = <0 1 0 1 0 1 0 0>;
            };

            c_snd_codec_o1: codec@0 {
                sound-dai = <&i2c_codec1>;
                frame-master;
                bitclock-master;
                clocks=<&adau1761_mclk>;
                clock-names = "mclk";
                clock-frequency = <12288000>;
                name-prefix = "c1";
                dai-tdm-slot-tx-mask = <0 0 0 0 0 0 0 0>;
                dai-tdm-slot-rx-mask = <0 1 0 0 0 0 0 0>;
            };

            c_snd_codec_o2: codec@1 {
                sound-dai = <&i2c_codec2>;
                clocks=<&adau1761_mclk>;
                clock-names = "mclk";
                clock-frequency = <12288000>;
                name-prefix = "c2";
                dai-tdm-slot-tx-mask = <0 0 0 0 0 0 0 0>;
                dai-tdm-slot-rx-mask = <0 0 0 1 0 0 0 0>;
            };
            c_snd_codec_o3: codec@2 {
                sound-dai = <&i2c_codec3>;
                clocks=<&adau1761_mclk>;
                clock-names = "mclk";
                clock-frequency = <12288000>;
                name-prefix = "c3";
                dai-tdm-slot-tx-mask = <0 0 0 0 0 0 0 0>;
                dai-tdm-slot-rx-mask = <0 0 0 0 0 1 0 0>;
            };


        };
