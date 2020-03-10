Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F961807E5
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 20:23:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12FE21672;
	Tue, 10 Mar 2020 20:22:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12FE21672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583868200;
	bh=L1eCseHvuCRDQ6Ww5kX6UKHjklJH8VScrQ+zudfDYt4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UxnLCUY+nmMm68FVHSfdNVm8MwEQEpWa/tG9sXGRiI6K9lQuqnzB6ePduUDYur4sX
	 gR7HQ1CD95YHkWAV0xZfwW5k1tRneUeTryw8iD2Yqu/k6l1E4yBAhiboYiqngAVUBp
	 JwG0K1zbp6WZvprxHEnCq4WulD3Yp9acLHqSMKa8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24FBAF8020C;
	Tue, 10 Mar 2020 20:21:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC3D4F80217; Tue, 10 Mar 2020 20:21:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CA58F800DA
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 20:21:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CA58F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=systemsoft-no.20150623.gappssmtp.com
 header.i=@systemsoft-no.20150623.gappssmtp.com header.b="07i2d0Zx"
Received: by mail-pj1-x1036.google.com with SMTP id y7so841697pjn.1
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 12:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=systemsoft-no.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gGN9s+NFf1iCKPXX7Fm31tzIGES1qdiFe3+voKUObuc=;
 b=07i2d0ZxTGJ0kgxwrLnCXcDBpwqWO9R+Yy1puZKr4pOgYGLIsyOl+sgMCzKZDuQl5w
 cLDDfjFqlenEVIQYnDM3essK+3oujvhRbICrJVAOBu2jpuOobVrgnpgdjuStc9dyuBID
 Dmq/kP2mkO8PLXd9dXG+E7TLj1HcvMeDSHTbPhP3WTnSkmZ5pjns6xkUgVePG8Axk3TK
 Q/fS/cfMxFnv4E/CTxX3xj/5Xn7Ta1kuHdYBneio90k5AQjEYXga2ayeEDPeNUPL9OZk
 ZHPHm/2wCX3Org/BkqJwwPWiCbXa12ndR8/biAGe1kkWC7WEhyPzgAdWjGEof0lE1MbF
 O0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gGN9s+NFf1iCKPXX7Fm31tzIGES1qdiFe3+voKUObuc=;
 b=soT76faiLVoXGP5vQ8R86r+QpS78dkHny1l3zFv0zUyPP0hXv/Y0nk4re9yV/t92fK
 iJqlnDe6ET9/Y2e5rWGEpKXhpMrckGPYiLHlxf7EL3CbV8cCebBi4Q0Ar8I4J0aPbaPc
 m/dku4R/7MltUCD91TmFKWGQyKBNJhe1rPS3dZdVsaCZy6p86qBXD/fyaZN0IM3T0Saf
 /DVNPEUVtlSS584PR6GuQWpOPWdK90UEWJxviBC4UHcPP53qRAjVYNHHgNsFwA97BLaP
 Fl2hIAYs+3/ELLlOa62LVizKEpsHptDsayN37jDFQT9M9xvQieBaIadNL1rfWFLp7rB9
 cFBg==
X-Gm-Message-State: ANhLgQ22OK8tty3gvpL/haBKV+EQhlZD2gMvnALleMQ5Jg9frpt7wAIQ
 gSKI8BJSfVm4UsD4aHa6mu4ZAQn9l8R8tj/i7jr3sw==
X-Google-Smtp-Source: ADFU+vs4qUFtY/VgBUoEb0pLc0MSo3PWkspSEpdLguTK0ez35zLYy7rurigEy8pKlhIMJyhJ81Aa2jvxSSIeuq7nYp0=
X-Received: by 2002:a17:90b:1984:: with SMTP id
 mv4mr3255813pjb.196.1583868082021; 
 Tue, 10 Mar 2020 12:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <CANbLSG9F7V0nu7ibyW78SNmoznKOQm=58bk2a7ZRoyEjubHvEA@mail.gmail.com>
 <deb30c73-3a39-092d-9cac-fb1a5208cebd@metafoo.de>
In-Reply-To: <deb30c73-3a39-092d-9cac-fb1a5208cebd@metafoo.de>
From: Rolf Peder Klemetsen <rpk@systemsoft.no>
Date: Tue, 10 Mar 2020 20:21:10 +0100
Message-ID: <CANbLSG-D31iQG35_XygPJYuksMj1MBccqnM9HkwrB+L61HS70w@mail.gmail.com>
Subject: Re: How to model 3xADAU1761 codec in TDM8 with 2xSAI in ALSA ?
To: Lars-Peter Clausen <lars@metafoo.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org
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

Hi,

Thanks Lars.
I finally got prefix working by adding "sound-name-prefix" to the
adau1761 definitions under &i2c0. And as you stated the controls are
now name "c1 LOUT", etc. So that is good!
But I still haven't got multi-codec to work; only the first codec in
each dailink is enumerated. The others are ignored.

To me it seems that Asoc simple card supports multi-codec. See for
example  here:
https://www.alsa-project.org/pipermail/alsa-devel/2018-March/133104.html
and "Example 2 - many DAI links and multi-CODECs".
I am unable to spot what is wrong with my dailink definition compared
to the above example.

/Rolf








tir. 10. mar. 2020 kl. 14:28 skrev Lars-Peter Clausen <lars@metafoo.de>:
>
> On 3/9/20 9:33 AM, Rolf Peder Klemetsen wrote:
> > Hello,
> >
> > I am working on bringup of a custom board that has three ADAU1761
> > codecs, and a NXP LS1028A SoC. The codecs are supposed to be
> > configured in TDM8 mode and share a common playback I2S bus connected
> > to SAI4, and a common capture I2S bus connected to SAI3.
> > What is the recommended way of modelling this setup in the Linux device tree ?
> >
> > So far I have tried the following:
> >
> > &i2c0 {
> >      status = "okay";
> >
> >      i2c_codec1: adau1761@38 {
> >          compatible = "adi,adau1761";
> >          #sound-dai-cells=<0>;
> >          reg = <0x38>;
> >          tdm-offset = <0>;
> >          clocks = <&adau1761_mclk>;
> >          clock-names = "mclk";
> >      };
> >
> >      i2c_codec2: adau1761@39 {
> >          compatible = "adi,adau1761";
> >          #sound-dai-cells=<0>;
> >          reg = <0x39>;
> >          tdm-offset = <16>;
> >          clocks = <&adau1761_mclk>;
> >          clock-names = "mclk";
> >      };
> >
> >      i2c_codec3: adau1761@3a {
> >          compatible = "adi,adau1761";
> >          #sound-dai-cells=<0>;
> >          reg = <0x3a>;
> >          tdm-offset = <32>;
> >          clocks = <&adau1761_mclk>;
> >          clock-names = "mclk";
> >      };
> > };
> >
> > At first I attempted creating three simple-audio-card's. That
> > attempted failed since sharing the same cpu (SAI3 and SAI4) failed
> > with no ALSA device as a result.
> >
> > Then I attempted creating a single simple-audio-card with two
> > dai-links (one for playback and one for capture), each containing
> > three codec sub-nodes.
> > That doesn't really work either. Can someone please point me in the
> > right direction?
> > Many of the parameters that I have put in the dts have no effect and
> > are assumed not supported.
>
> Hi,
>
> One physical sound card is definitely the right direction. If you need
> multiple sound cards exposed to userspace you can use the ALSA plugin
> architecture to create multiple virtual sound cards on top of the one
> sound card.
>
> Do you know why your approach with a single sound card does not work, do
> you get any error messages? Is the sound card registered?
>
> The primary use case of the simple-audio-card is as the name suggests
> simple setups and your setup is not that simple. It is possible that
> your particular setup has never been tested with the simple-sound-card
> and there are still some hidden bugs. It might also be the case that you
> might have to create a custom sound card driver for your setup if you
> can't make it work with the simple card driver.
>
> I believe I can see at least on issue with your DT snipped. For the
> widgets that are registered by the CODECs the prefix will be added to
> the name. So for example "LOUT" has to be "c1 LOUT", in addition you'll
> have to add one route for each sound card.
>
> - Lars
>
> >
> > Regards
> > Rolf
> >
> > sound {
> >          status = "okay";
> >          model = "Super Sound System";
> >          compatible = "simple-audio-card";
> >          simple-audio-card,name = "sound";
> >          simple-audio-card,format = "i2s";
> >          simple-audio-card,bitclock-master = <&p_snd_codec_o1>;
> >          simple-audio-card,frame-master = <&p_snd_codec_o1>;
> >          simple-audio-card,widgets =
> >              "Microphone", "Mic In",
> >              "Headphone", "Headphone Out",
> >              "Line", "Line In",
> >              "Line", "Line Out";
> >
> >          simple-audio-card,routing =
> >              "Line Out", "LOUT",
> >              "Line Out", "ROUT",
> >              "Headphone Out", "LHP",
> >              "Headphone Out", "RHP",
> >              "Mic In", "MICBIAS",
> >              "LINN", "Mic In",
> >              "RINN", "Mic In",
> >              "LINP", "Mic In",
> >              "RINP", "Mic In",
> >              "LAUX", "Line In",
> >              "RAUX", "Line In";
> >
> >          playback_link: simple-audio-card,dai-link@0 {
> >              format = "i2s";
> >              convert-channels = <8>;
> >              bitclock-master = <&p_snd_codec_o1>;
> >              frame-master = <&p_snd_codec_o1>;
> >              name-prefix = "p";
> >
> >              snd_dai_playback: cpu@0 {
> >
> >                  cpu-dai-name = "sai4_0";
> >                  sound-dai-name = "sai4_0";
> >
> >
> >                  sound-dai = <&sai4 0>;
> >                  dai-tdm-slot-num = <8>;
> >                  dai-tdm-slot-width = <16>;
> >                  dai-tdm-slot-tx-mask = <1 0 1 0 1 0 0 0>;
> >                  dai-tdm-slot-rx-mask = <0 0 0 0 0 0 0 0>;
> >              };
> >
> >              p_snd_codec_o1: codec@0 {
> >                  sound-dai = <&i2c_codec1>;
> >                  frame-master;
> >                  bitclock-master;
> >                  clocks=<&adau1761_mclk>;
> >                  clock-frequency = <12288000>;
> >                  clock-names = "mclk";
> >                  name-prefix = "c1";
> >                  dai-tdm-slot-tx-mask = <1 0 0 0 0 0 0 0>;
> >                  dai-tdm-slot-rx-mask = <0 0 0 0 0 0 0 0>;
> >              };
> >
> >              p_snd_codec_o2: codec@1 {
> >                  sound-dai = <&i2c_codec2>;
> >                  clocks=<&adau1761_mclk>;
> >                  clock-frequency = <12288000>;
> >                  clock-names = "mclk";
> >                  name-prefix = "c2";
> >                  dai-tdm-slot-tx-mask = <0 0 1 0 0 0 0 0>;
> >                  dai-tdm-slot-rx-mask = <0 0 0 0 0 0 0 0>;
> >              };
> >              p_snd_codec_o3: codec@2 {
> >                  sound-dai = <&i2c_codec3>;
> >                  clocks=<&adau1761_mclk>;
> >                  clock-frequency = <12288000>;
> >                  clock-names = "mclk";
> >                  name-prefix = "c3";
> >                  dai-tdm-slot-tx-mask = <0 0 0 0 1 0 0 0>;
> >                  dai-tdm-slot-rx-mask = <0 0 0 0 0 0 0 0>;
> >              };
> >
> >
> >          };
> >
> >          capture_link: simple-audio-card,dai-link@1 {
> >              format = "i2s";
> >              convert-channels = <8>;
> >              bitclock-master = <&c_snd_codec_o1>;
> >              frame-master = <&c_snd_codec_o1>;
> >              name-prefix = "c";
> >
> >              snd_dai_capture: cpu@0 {
> >                  sound-dai = <&sai3>;
> >                  dai-tdm-slot-num = <8>;
> >                  dai-tdm-slot-width = <16>;
> >                  dai-tdm-slot-tx-mask = <0 0 0 0 0 0 0 0>;
> >                  dai-tdm-slot-rx-mask = <0 1 0 1 0 1 0 0>;
> >              };
> >
> >              c_snd_codec_o1: codec@0 {
> >                  sound-dai = <&i2c_codec1>;
> >                  frame-master;
> >                  bitclock-master;
> >                  clocks=<&adau1761_mclk>;
> >                  clock-names = "mclk";
> >                  clock-frequency = <12288000>;
> >                  name-prefix = "c1";
> >                  dai-tdm-slot-tx-mask = <0 0 0 0 0 0 0 0>;
> >                  dai-tdm-slot-rx-mask = <0 1 0 0 0 0 0 0>;
> >              };
> >
> >              c_snd_codec_o2: codec@1 {
> >                  sound-dai = <&i2c_codec2>;
> >                  clocks=<&adau1761_mclk>;
> >                  clock-names = "mclk";
> >                  clock-frequency = <12288000>;
> >                  name-prefix = "c2";
> >                  dai-tdm-slot-tx-mask = <0 0 0 0 0 0 0 0>;
> >                  dai-tdm-slot-rx-mask = <0 0 0 1 0 0 0 0>;
> >              };
> >              c_snd_codec_o3: codec@2 {
> >                  sound-dai = <&i2c_codec3>;
> >                  clocks=<&adau1761_mclk>;
> >                  clock-names = "mclk";
> >                  clock-frequency = <12288000>;
> >                  name-prefix = "c3";
> >                  dai-tdm-slot-tx-mask = <0 0 0 0 0 0 0 0>;
> >                  dai-tdm-slot-rx-mask = <0 0 0 0 0 1 0 0>;
> >              };
> >
> >
> >          };
>
>
