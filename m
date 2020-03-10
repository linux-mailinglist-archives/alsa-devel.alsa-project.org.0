Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EF717FDBF
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 14:30:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8ACA81673;
	Tue, 10 Mar 2020 14:29:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8ACA81673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583847045;
	bh=MpoJrycdWE5dRE/GHyGNZhXekZiugUDqQhBuAeTFJxg=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TiNijM3SdPV9yYPcNNT0wg15VzXt+JZQ6Z9jvlAQQSb8RKnm3kZMJPuweW+6ys3mJ
	 Gw4t8pwx2xaXjBsY+aA+aw1W1KeBytbPCmcAQN8yBUQS6XyQetsRvSQIl10Q1X2gqy
	 vyGSiRB4rZ0vgb1NsXbWXh0laSgDb0CizY3zoc+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70A90F8021C;
	Tue, 10 Mar 2020 14:29:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B934F80217; Tue, 10 Mar 2020 14:29:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC713F80123
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 14:28:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC713F80123
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="VGTts3+t"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+5AqH/elxFe10+dMxCoYQDl96y5I74iWnYGHqiIN6z0=; b=VGTts3+tNwbJucvGIjKlHriaQR
 1XWo/47m2Rkhcd9CkPN64V05JM2EnTyVi3yNDns08aHKw/kKp8N+Cy0tWnk21gMZ8sEdOKjGr14ID
 Iss1abDcp5uKu/KA70NsWbMjuX+m3+mSQdZtxXLnLCA7M+X1GNCVHVOPJG5IPH+t539xUK7Ik5RgN
 IBqiAc6ZqNt+Tr0hpPBpUvGRYEPE2VGD7Hsoxy4GpvM0wIe7eC+oMe1AVzCfV7ZeTPTwASGY1RVJR
 nocHibZGqCbiOp7/i/dN9wJrOPCeerF3RraVu54YclKuCpoTQ0iXpWaT5ycFJwLhZIZwObs66PwLj
 PHDPzfVw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www381.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <lars@metafoo.de>)
 id 1jBewI-0008DM-Ra; Tue, 10 Mar 2020 14:28:55 +0100
Received: from [93.104.100.58] (helo=[192.168.178.20])
 by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1jBewI-000G8v-JM; Tue, 10 Mar 2020 14:28:54 +0100
Subject: Re: How to model 3xADAU1761 codec in TDM8 with 2xSAI in ALSA ?
To: Rolf Peder Klemetsen <rpk@systemsoft.no>, alsa-devel@alsa-project.org
References: <CANbLSG9F7V0nu7ibyW78SNmoznKOQm=58bk2a7ZRoyEjubHvEA@mail.gmail.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <deb30c73-3a39-092d-9cac-fb1a5208cebd@metafoo.de>
Date: Tue, 10 Mar 2020 14:28:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CANbLSG9F7V0nu7ibyW78SNmoznKOQm=58bk2a7ZRoyEjubHvEA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.2/25747/Tue Mar 10 12:06:29 2020)
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

On 3/9/20 9:33 AM, Rolf Peder Klemetsen wrote:
> Hello,
>
> I am working on bringup of a custom board that has three ADAU1761
> codecs, and a NXP LS1028A SoC. The codecs are supposed to be
> configured in TDM8 mode and share a common playback I2S bus connected
> to SAI4, and a common capture I2S bus connected to SAI3.
> What is the recommended way of modelling this setup in the Linux device tree ?
>
> So far I have tried the following:
>
> &i2c0 {
>      status = "okay";
>
>      i2c_codec1: adau1761@38 {
>          compatible = "adi,adau1761";
>          #sound-dai-cells=<0>;
>          reg = <0x38>;
>          tdm-offset = <0>;
>          clocks = <&adau1761_mclk>;
>          clock-names = "mclk";
>      };
>
>      i2c_codec2: adau1761@39 {
>          compatible = "adi,adau1761";
>          #sound-dai-cells=<0>;
>          reg = <0x39>;
>          tdm-offset = <16>;
>          clocks = <&adau1761_mclk>;
>          clock-names = "mclk";
>      };
>
>      i2c_codec3: adau1761@3a {
>          compatible = "adi,adau1761";
>          #sound-dai-cells=<0>;
>          reg = <0x3a>;
>          tdm-offset = <32>;
>          clocks = <&adau1761_mclk>;
>          clock-names = "mclk";
>      };
> };
>
> At first I attempted creating three simple-audio-card's. That
> attempted failed since sharing the same cpu (SAI3 and SAI4) failed
> with no ALSA device as a result.
>
> Then I attempted creating a single simple-audio-card with two
> dai-links (one for playback and one for capture), each containing
> three codec sub-nodes.
> That doesn't really work either. Can someone please point me in the
> right direction?
> Many of the parameters that I have put in the dts have no effect and
> are assumed not supported.

Hi,

One physical sound card is definitely the right direction. If you need 
multiple sound cards exposed to userspace you can use the ALSA plugin 
architecture to create multiple virtual sound cards on top of the one 
sound card.

Do you know why your approach with a single sound card does not work, do 
you get any error messages? Is the sound card registered?

The primary use case of the simple-audio-card is as the name suggests 
simple setups and your setup is not that simple. It is possible that 
your particular setup has never been tested with the simple-sound-card 
and there are still some hidden bugs. It might also be the case that you 
might have to create a custom sound card driver for your setup if you 
can't make it work with the simple card driver.

I believe I can see at least on issue with your DT snipped. For the 
widgets that are registered by the CODECs the prefix will be added to 
the name. So for example "LOUT" has to be "c1 LOUT", in addition you'll 
have to add one route for each sound card.

- Lars

>
> Regards
> Rolf
>
> sound {
>          status = "okay";
>          model = "Super Sound System";
>          compatible = "simple-audio-card";
>          simple-audio-card,name = "sound";
>          simple-audio-card,format = "i2s";
>          simple-audio-card,bitclock-master = <&p_snd_codec_o1>;
>          simple-audio-card,frame-master = <&p_snd_codec_o1>;
>          simple-audio-card,widgets =
>              "Microphone", "Mic In",
>              "Headphone", "Headphone Out",
>              "Line", "Line In",
>              "Line", "Line Out";
>
>          simple-audio-card,routing =
>              "Line Out", "LOUT",
>              "Line Out", "ROUT",
>              "Headphone Out", "LHP",
>              "Headphone Out", "RHP",
>              "Mic In", "MICBIAS",
>              "LINN", "Mic In",
>              "RINN", "Mic In",
>              "LINP", "Mic In",
>              "RINP", "Mic In",
>              "LAUX", "Line In",
>              "RAUX", "Line In";
>
>          playback_link: simple-audio-card,dai-link@0 {
>              format = "i2s";
>              convert-channels = <8>;
>              bitclock-master = <&p_snd_codec_o1>;
>              frame-master = <&p_snd_codec_o1>;
>              name-prefix = "p";
>
>              snd_dai_playback: cpu@0 {
>
>                  cpu-dai-name = "sai4_0";
>                  sound-dai-name = "sai4_0";
>
>
>                  sound-dai = <&sai4 0>;
>                  dai-tdm-slot-num = <8>;
>                  dai-tdm-slot-width = <16>;
>                  dai-tdm-slot-tx-mask = <1 0 1 0 1 0 0 0>;
>                  dai-tdm-slot-rx-mask = <0 0 0 0 0 0 0 0>;
>              };
>
>              p_snd_codec_o1: codec@0 {
>                  sound-dai = <&i2c_codec1>;
>                  frame-master;
>                  bitclock-master;
>                  clocks=<&adau1761_mclk>;
>                  clock-frequency = <12288000>;
>                  clock-names = "mclk";
>                  name-prefix = "c1";
>                  dai-tdm-slot-tx-mask = <1 0 0 0 0 0 0 0>;
>                  dai-tdm-slot-rx-mask = <0 0 0 0 0 0 0 0>;
>              };
>
>              p_snd_codec_o2: codec@1 {
>                  sound-dai = <&i2c_codec2>;
>                  clocks=<&adau1761_mclk>;
>                  clock-frequency = <12288000>;
>                  clock-names = "mclk";
>                  name-prefix = "c2";
>                  dai-tdm-slot-tx-mask = <0 0 1 0 0 0 0 0>;
>                  dai-tdm-slot-rx-mask = <0 0 0 0 0 0 0 0>;
>              };
>              p_snd_codec_o3: codec@2 {
>                  sound-dai = <&i2c_codec3>;
>                  clocks=<&adau1761_mclk>;
>                  clock-frequency = <12288000>;
>                  clock-names = "mclk";
>                  name-prefix = "c3";
>                  dai-tdm-slot-tx-mask = <0 0 0 0 1 0 0 0>;
>                  dai-tdm-slot-rx-mask = <0 0 0 0 0 0 0 0>;
>              };
>
>
>          };
>
>          capture_link: simple-audio-card,dai-link@1 {
>              format = "i2s";
>              convert-channels = <8>;
>              bitclock-master = <&c_snd_codec_o1>;
>              frame-master = <&c_snd_codec_o1>;
>              name-prefix = "c";
>
>              snd_dai_capture: cpu@0 {
>                  sound-dai = <&sai3>;
>                  dai-tdm-slot-num = <8>;
>                  dai-tdm-slot-width = <16>;
>                  dai-tdm-slot-tx-mask = <0 0 0 0 0 0 0 0>;
>                  dai-tdm-slot-rx-mask = <0 1 0 1 0 1 0 0>;
>              };
>
>              c_snd_codec_o1: codec@0 {
>                  sound-dai = <&i2c_codec1>;
>                  frame-master;
>                  bitclock-master;
>                  clocks=<&adau1761_mclk>;
>                  clock-names = "mclk";
>                  clock-frequency = <12288000>;
>                  name-prefix = "c1";
>                  dai-tdm-slot-tx-mask = <0 0 0 0 0 0 0 0>;
>                  dai-tdm-slot-rx-mask = <0 1 0 0 0 0 0 0>;
>              };
>
>              c_snd_codec_o2: codec@1 {
>                  sound-dai = <&i2c_codec2>;
>                  clocks=<&adau1761_mclk>;
>                  clock-names = "mclk";
>                  clock-frequency = <12288000>;
>                  name-prefix = "c2";
>                  dai-tdm-slot-tx-mask = <0 0 0 0 0 0 0 0>;
>                  dai-tdm-slot-rx-mask = <0 0 0 1 0 0 0 0>;
>              };
>              c_snd_codec_o3: codec@2 {
>                  sound-dai = <&i2c_codec3>;
>                  clocks=<&adau1761_mclk>;
>                  clock-names = "mclk";
>                  clock-frequency = <12288000>;
>                  name-prefix = "c3";
>                  dai-tdm-slot-tx-mask = <0 0 0 0 0 0 0 0>;
>                  dai-tdm-slot-rx-mask = <0 0 0 0 0 1 0 0>;
>              };
>
>
>          };


