Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB18A80B5
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2019 12:54:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A03416AB;
	Wed,  4 Sep 2019 12:53:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A03416AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567594488;
	bh=tuGGgW0F2YyuJvVvYRrfKFNfWPsvLHp9lmepajYFAk8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DavGq6S7h9eUI7qQclGbGSOkAGE3WMrIAVMudmULsjVI3f/Z6PpfxoNPr6+k9epp+
	 Te81VjcB/vQpvxTNrmhoQJmRH66fFiN1IRqawOOhJXhtqg53hk6IKROoEbTUgPI/5R
	 6mBIVdZSC35/TVbRY5Agcsip+Gm+6ZKc/8KJynDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ED51F80394;
	Wed,  4 Sep 2019 12:53:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 837DAF80171; Wed,  4 Sep 2019 12:53:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32F4BF80171
 for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2019 12:52:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32F4BF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="F7InDeDd"
Received: by mail-ua1-x944.google.com with SMTP id i17so3250230ual.7
 for <alsa-devel@alsa-project.org>; Wed, 04 Sep 2019 03:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e4KIv9I3g7+mOQqRzTP4rO2ZJBefQoecY/Xb2Ym6olU=;
 b=F7InDeDdRxFYW2jGglTfH+IsPhK3owVOWn3dkfwpo+nJLSRDoIp+fkzvjDeg0KbMYy
 RLx8BUk6e8PoVvZbOix87mZMX/EOJHsHM970X3VY1pyk3ySyUBMaTu1Ryh10AN4LYkOQ
 VoGLVuBctVdz6OE9UTz0WnU5x/EoSaeM6JFcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e4KIv9I3g7+mOQqRzTP4rO2ZJBefQoecY/Xb2Ym6olU=;
 b=N4XKDfJzSqiou7jNm4VFjtAcChiloVEthwy3ymEKbnyjAGMkwzzCXpdauJp8xEBwOd
 NzAp4cL90HgdpBBN802/zrGjMVFUorGAD3UXRn7x0JfMfuZ30g72iMFzMN4ExRRpPPsZ
 MShQqZb69w29ZaREzAVAM1ZAAKg5UEO5n1febXDiiRyvPk9GhJx/CMlLzvTsq1XSvAw1
 5Yjh6EqlUI74sDrkYDrwBJTqFMUVMh0FfEOyEK6DBrXRhchNgigZxpZ73PA2NympxOim
 zYHiHXzI6L3ImuWltMUihQUKnAKf6gk2OPf/bg6RPPmdHxDpkhmWE5jTeFOeEi5AyhSE
 TQ0Q==
X-Gm-Message-State: APjAAAWUa6DDGCxcirMZe7YtCms+7AAFunseLrHnH00QHxR/Ak4ZpsH/
 DiBGG/BEG0W2Y3r98iTbETXBe5nYmaRlrG1pef+95g==
X-Google-Smtp-Source: APXvYqzTsm1PRXBLENmLqKrpnRjHHEkTnH3e+BsDOUowsK8ueNa1E9U4VdvhS65bKO4gdsnFmtPbwI6X5Ogz5qz4D7k=
X-Received: by 2002:ab0:7c3:: with SMTP id d3mr19181451uaf.131.1567594374428; 
 Wed, 04 Sep 2019 03:52:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190903055103.134764-1-cychiang@chromium.org>
 <e1c3483c-baa6-c726-e547-fadf40d259f4@baylibre.com>
 <CAFv8NwKHZM+zTu7GF_J0Xk6hubA2JK4cCsdhsDPOGk=3rnbCZw@mail.gmail.com>
 <1a167659-2eb1-d9be-c1ae-4958ac3f7929@baylibre.com>
 <CAFv8NwLFd4EZY5tcYeaagRiHWPx_QWDrtKs3WPT4ouJBMvM-LQ@mail.gmail.com>
 <20190904103150.GK13294@shell.armlinux.org.uk>
In-Reply-To: <20190904103150.GK13294@shell.armlinux.org.uk>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Wed, 4 Sep 2019 18:52:27 +0800
Message-ID: <CAFv8Nw+7DU2iM7XxZ1Nz4BW-=Xv731i-4LXe1_Bfm46hAosnkg@mail.gmail.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, kuninori.morimoto.gx@renesas.com,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, sam@ravnborg.org,
 cain.cai@rock-chips.com, Xing Zheng <zhengxing@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Dylan Reid <dgreid@chromium.org>,
 tzungbi@chromium.org, Jonas Karlman <jonas@kwiboo.se>,
 Jeffy Chen <jeffy.chen@rock-chips.com>,
 =?UTF-8?B?6JSh5p6r?= <eddie.cai@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Doug Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, kuankuan.y@gmail.com
Subject: Re: [alsa-devel] [PATCH] drm: bridge/dw_hdmi: add audio sample
	channel status setting
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

On Wed, Sep 4, 2019 at 6:32 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> On Wed, Sep 04, 2019 at 05:45:20PM +0800, Cheng-yi Chiang wrote:
> > On Wed, Sep 4, 2019 at 5:28 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> > >
> > > Hi,
> > >
> > > On 04/09/2019 11:09, Cheng-yi Chiang wrote:
> > > > Hi,
> > > >
> > > > On Tue, Sep 3, 2019 at 5:53 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> > > >>
> > > >> Hi,
> > > >>
> > > >> On 03/09/2019 07:51, Cheng-Yi Chiang wrote:
> > > >>> From: Yakir Yang <ykk@rock-chips.com>
> > > >>>
> > > >>> When transmitting IEC60985 linear PCM audio, we configure the
> > > >>> Audio Sample Channel Status information of all the channel
> > > >>> status bits in the IEC60958 frame.
> > > >>> Refer to 60958-3 page 10 for frequency, original frequency, and
> > > >>> wordlength setting.
> > > >>>
> > > >>> This fix the issue that audio does not come out on some monitors
> > > >>> (e.g. LG 22CV241)
> > > >>>
> > > >>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> > > >>> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > > >>> ---
> > > >>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 59 +++++++++++++++++++++++
> > > >>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.h | 20 ++++++++
> > > >>>  2 files changed, 79 insertions(+)
> > > >>>
> > > >>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > > >>> index bd65d0479683..34d46e25d610 100644
> > > >>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > > >>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > > >>> @@ -582,6 +582,63 @@ static unsigned int hdmi_compute_n(unsigned int freq, unsigned long pixel_clk)
> > > >>>       return n;
> > > >>>  }
> > > >>>
> > > >>> +static void hdmi_set_schnl(struct dw_hdmi *hdmi)
> > > >>> +{
> > > >>> +     u8 aud_schnl_samplerate;
> > > >>> +     u8 aud_schnl_8;
> > > >>> +
> > > >>> +     /* These registers are on RK3288 using version 2.0a. */
> > > >>> +     if (hdmi->version != 0x200a)
> > > >>> +             return;
> > > >>
> > > >> Are these limited to the 2.0a version *in* RK3288, or 2.0a version on all
> > > >> SoCs ?
> > > >>
> > > >
> > > > In the original patch by Yakir,
> > > >
> > > > https://lore.kernel.org/patchwork/patch/539653/   (sorry, I should
> > > > have added this link in the "after the cut" note)
> > > >
> > > > The fix is limited to version 2.0.
> > > > Since I am only testing on RK3288 with 2.0a, I change the check to 2.0a only.
> > > > I can not test 2.0a version on other SoCs.
> > > > The databook I have at hand is 2.0a (not specific to RK3288) so I
> > > > think all 2.0a should have this register.
> > > >
> > > > As for other version like version 1.3 on iMX6, there is no such
> > > > register, as stated by Russell
> > > >
> > > > http://lkml.iu.edu/hypermail/linux/kernel/1501.3/06268.html.
> > >
> > > Russell assumes the registers are not present on the iMX6 IP not having
> > > the I2S registers, but they are present on the IPs configured with I2S
> > > at any versions.
> >
> > I see. Thanks for the check.
> >
> > >
> > > My databook version (1.40.a) specifies :
> > >
> > > fc_audschnls0 to fc_audschnls8
> > >
> > > ```
> > > When transmitting IEC60958 linear PCM audio, this registers allow to configure the channel status
> > > information of all the channel status bits in the IEC60958 frame. For the moment this configuration is only
> > > used when the I2S audio interface, General Purpose Audio (GPA), or AHB audio DMA (AHBAUDDMA)
> > > interface is active (for S/PDIF interface this information comes from the stream).
> > > ```
> > >
> > > But the databook Revision History shows these registers were present since version 1.10a.
> > >
> > > I propose you remove the version check, but you only setup these registers when I2S is enabled:
> > > (hdmi_readb(hdmi, HDMI_CONFIG0_ID) & HDMI_CONFIG0_I2S) until a AHBAUDDMA user needs this,
> > > with a small comment explaining the situation.
> >
> > I see. Sound like a good plan.
> > In sum, I will add
> > set_channel_status()
> > in dw_hdmi.c
> > And in the beginning of this function,
> > check it is using I2S
> >  (hdmi_readb(hdmi, HDMI_CONFIG0_ID) & HDMI_CONFIG0_I2S)
> > with a comment explaining the situation.
> >
> > And let dw-hdmi-audio-i2s dw_hdmi_i2s_hw_params() to call this
> > function after dw_hdmi_set_sample_rate, with word length (or
> > sample_bit) passed it as argument.
>
> If you're going to do it this way, there's little point having the
> check.  The dw-hdmi-audio-i2s device will only be created if that
> ID bit is already set.  So, provided set_channel_status() (which
> should probably be dw_hdmi_set_channel_status()) is only called from
> the I2S driver, then everything should be fine without such a check.
> However, it is worth noting in the docbook comments above the function
> that it is only for I2S setups.
>
I see. Yes it is simpler.
Thanks for the suggestion!
Will fix in v2.


> > I have not tested setting this register here as in the original patch
> > it was set in hdmi_set_clk_regenerator.
> > I will test it and update in my v2.
> >
> > Thanks again to everyone for the prompt reply and help.
> >
> > >
> > > Neil
> > >
> > > >
> > > > So at least we should check the version.
> > > > Maybe we can set the criteria as version 2.0 or above to make it a safe patch ?
> > > > If there is the same need on other SoC with version < 2.0, it can be
> > > > added later.
> > > > Presumably, there will be databook of that version to help confirming
> > > > this setting.
> > > >
> > > > Thanks!
> > > >>> +
> > > >>> +     switch (hdmi->sample_rate) {
> > > >>> +     case 32000:
> > > >>> +             aud_schnl_samplerate = HDMI_FC_AUDSCHNLS7_SMPRATE_32K;
> > > >>> +             break;
> > > >>> +     case 44100:
> > > >>> +             aud_schnl_samplerate = HDMI_FC_AUDSCHNLS7_SMPRATE_44K1;
> > > >>> +             break;
> > > >>> +     case 48000:
> > > >>> +             aud_schnl_samplerate = HDMI_FC_AUDSCHNLS7_SMPRATE_48K;
> > > >>> +             break;
> > > >>> +     case 88200:
> > > >>> +             aud_schnl_samplerate = HDMI_FC_AUDSCHNLS7_SMPRATE_88K2;
> > > >>> +             break;
> > > >>> +     case 96000:
> > > >>> +             aud_schnl_samplerate = HDMI_FC_AUDSCHNLS7_SMPRATE_96K;
> > > >>> +             break;
> > > >>> +     case 176400:
> > > >>> +             aud_schnl_samplerate = HDMI_FC_AUDSCHNLS7_SMPRATE_176K4;
> > > >>> +             break;
> > > >>> +     case 192000:
> > > >>> +             aud_schnl_samplerate = HDMI_FC_AUDSCHNLS7_SMPRATE_192K;
> > > >>> +             break;
> > > >>> +     case 768000:
> > > >>> +             aud_schnl_samplerate = HDMI_FC_AUDSCHNLS7_SMPRATE_768K;
> > > >>> +             break;
> > > >>> +     default:
> > > >>> +             dev_warn(hdmi->dev, "Unsupported audio sample rate (%u)\n",
> > > >>> +                      hdmi->sample_rate);
> > > >>> +             return;
> > > >>> +     }
> > > >>> +
> > > >>> +     /* set channel status register */
> > > >>> +     hdmi_modb(hdmi, aud_schnl_samplerate, HDMI_FC_AUDSCHNLS7_SMPRATE_MASK,
> > > >>> +               HDMI_FC_AUDSCHNLS7);
> > > >>> +
> > > >>> +     /*
> > > >>> +      * Set original frequency to be the same as frequency.
> > > >>> +      * Use one-complement value as stated in IEC60958-3 page 13.
> > > >>> +      */
> > > >>> +     aud_schnl_8 = (~aud_schnl_samplerate) <<
> > > >>> +                     HDMI_FC_AUDSCHNLS8_ORIGSAMPFREQ_OFFSET;
> > > >>> +
> > > >>> +     /* This means word length is 16 bit. Refer to IEC60958-3 page 12. */
> > > >>> +     aud_schnl_8 |= 2 << HDMI_FC_AUDSCHNLS8_WORDLEGNTH_OFFSET;
> > > >>> +
> > > >>> +     hdmi_writeb(hdmi, aud_schnl_8, HDMI_FC_AUDSCHNLS8);
> > > >>> +}
> > > >>> +
> > > >>>  static void hdmi_set_clk_regenerator(struct dw_hdmi *hdmi,
> > > >>>       unsigned long pixel_clk, unsigned int sample_rate)
> > > >>>  {
> > > >>> @@ -620,6 +677,8 @@ static void hdmi_set_clk_regenerator(struct dw_hdmi *hdmi,
> > > >>>       hdmi->audio_cts = cts;
> > > >>>       hdmi_set_cts_n(hdmi, cts, hdmi->audio_enable ? n : 0);
> > > >>>       spin_unlock_irq(&hdmi->audio_lock);
> > > >>> +
> > > >>> +     hdmi_set_schnl(hdmi);
> > > >>>  }
> > > >>>
> > > >>>  static void hdmi_init_clk_regenerator(struct dw_hdmi *hdmi)
> > > >>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
> > > >>> index 6988f12d89d9..619ebc1c8354 100644
> > > >>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
> > > >>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
> > > >>> @@ -158,6 +158,17 @@
> > > >>>  #define HDMI_FC_SPDDEVICEINF                    0x1062
> > > >>>  #define HDMI_FC_AUDSCONF                        0x1063
> > > >>>  #define HDMI_FC_AUDSSTAT                        0x1064
> > > >>> +#define HDMI_FC_AUDSV                           0x1065
> > > >>> +#define HDMI_FC_AUDSU                           0x1066
> > > >>> +#define HDMI_FC_AUDSCHNLS0                      0x1067
> > > >>> +#define HDMI_FC_AUDSCHNLS1                      0x1068
> > > >>> +#define HDMI_FC_AUDSCHNLS2                      0x1069
> > > >>> +#define HDMI_FC_AUDSCHNLS3                      0x106a
> > > >>> +#define HDMI_FC_AUDSCHNLS4                      0x106b
> > > >>> +#define HDMI_FC_AUDSCHNLS5                      0x106c
> > > >>> +#define HDMI_FC_AUDSCHNLS6                      0x106d
> > > >>> +#define HDMI_FC_AUDSCHNLS7                      0x106e
> > > >>> +#define HDMI_FC_AUDSCHNLS8                      0x106f
> > > >>>  #define HDMI_FC_DATACH0FILL                     0x1070
> > > >>>  #define HDMI_FC_DATACH1FILL                     0x1071
> > > >>>  #define HDMI_FC_DATACH2FILL                     0x1072
> > > >>> @@ -706,6 +717,15 @@ enum {
> > > >>>  /* HDMI_FC_AUDSCHNLS7 field values */
> > > >>>       HDMI_FC_AUDSCHNLS7_ACCURACY_OFFSET = 4,
> > > >>>       HDMI_FC_AUDSCHNLS7_ACCURACY_MASK = 0x30,
> > > >>> +     HDMI_FC_AUDSCHNLS7_SMPRATE_MASK = 0x0f,
> > > >>> +     HDMI_FC_AUDSCHNLS7_SMPRATE_192K = 0xe,
> > > >>> +     HDMI_FC_AUDSCHNLS7_SMPRATE_176K4 = 0xc,
> > > >>> +     HDMI_FC_AUDSCHNLS7_SMPRATE_96K = 0xa,
> > > >>> +     HDMI_FC_AUDSCHNLS7_SMPRATE_768K = 0x9,
> > > >>> +     HDMI_FC_AUDSCHNLS7_SMPRATE_88K2 = 0x8,
> > > >>> +     HDMI_FC_AUDSCHNLS7_SMPRATE_32K = 0x3,
> > > >>> +     HDMI_FC_AUDSCHNLS7_SMPRATE_48K = 0x2,
> > > >>> +     HDMI_FC_AUDSCHNLS7_SMPRATE_44K1 = 0x0,
> > > >>>
> > > >>>  /* HDMI_FC_AUDSCHNLS8 field values */
> > > >>>       HDMI_FC_AUDSCHNLS8_ORIGSAMPFREQ_MASK = 0xf0,
> > > >>>
> > > >>
> > >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> >
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
> According to speedtest.net: 11.9Mbps down 500kbps up
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
