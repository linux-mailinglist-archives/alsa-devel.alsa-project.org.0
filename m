Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA63BA7249
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2019 20:10:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CD9016A9;
	Tue,  3 Sep 2019 20:09:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CD9016A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567534225;
	bh=/eMDXjMRQdfJQ5cZAGZgN75jS2dxUC7f2kYQmI042fM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D7whkUNWAtnvL1Hm6U/uOVFAN4MdnaI/r1JGiciG+CQTyAFyPN47IOXn5Yh2vJsCs
	 ohWk7eRgNdPUHhkUVZ1ylaDMRGz7Ew31EtWPd+NaImlM4rGsQywsTDedHPdbX7020G
	 1exeTFpJ/224iWAacrtrt35oNqs1/QvHMp5C07C8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D5E3F8045F;
	Tue,  3 Sep 2019 20:08:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F0F8F8011E; Tue,  3 Sep 2019 20:08:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=FROM_EXCESS_BASE64, PRX_BODY_26,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.siol.net (mailoutvs22.siol.net [185.57.226.213])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 394ECF8011E
 for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2019 20:08:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 394ECF8011E
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id A94315219C4;
 Tue,  3 Sep 2019 20:08:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id P2mZ8gzE8-O5; Tue,  3 Sep 2019 20:08:33 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id E59FD521C1B;
 Tue,  3 Sep 2019 20:08:32 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net
 [86.58.59.25]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id 5FE0D5219C4;
 Tue,  3 Sep 2019 20:08:28 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Neil Armstrong <narmstrong@baylibre.com>
Date: Tue, 03 Sep 2019 20:08:28 +0200
Message-ID: <19353031.SdOy5F5fmg@jernej-laptop>
In-Reply-To: <d8a80ba5-dd2b-f84d-bbfc-9dd5ccbc26e9@baylibre.com>
References: <20190903055103.134764-1-cychiang@chromium.org>
 <e1c3483c-baa6-c726-e547-fadf40d259f4@baylibre.com>
 <d8a80ba5-dd2b-f84d-bbfc-9dd5ccbc26e9@baylibre.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 cain.cai@rock-chips.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 Yakir Yang <ykk@rock-chips.com>, sam@ravnborg.org,
 Cheng-Yi Chiang <cychiang@chromium.org>, zhengxing@rock-chips.com,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org, tzungbi@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, jeffy.chen@rock-chips.com,
 eddie.cai@rock-chips.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, daniel@ffwll.ch, enric.balletbo@collabora.com,
 kuankuan.y@gmail.com
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi!

Dne torek, 03. september 2019 ob 20:00:33 CEST je Neil Armstrong napisal(a):
> Hi,
> =

> Le 03/09/2019 =E0 11:53, Neil Armstrong a =E9crit :
> > Hi,
> > =

> > On 03/09/2019 07:51, Cheng-Yi Chiang wrote:
> >> From: Yakir Yang <ykk@rock-chips.com>
> >> =

> >> When transmitting IEC60985 linear PCM audio, we configure the
> >> Audio Sample Channel Status information of all the channel
> >> status bits in the IEC60958 frame.
> >> Refer to 60958-3 page 10 for frequency, original frequency, and
> >> wordlength setting.
> >> =

> >> This fix the issue that audio does not come out on some monitors
> >> (e.g. LG 22CV241)
> >> =

> >> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> >> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> >> ---
> >> =

> >>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 59 +++++++++++++++++++++++
> >>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.h | 20 ++++++++
> >>  2 files changed, 79 insertions(+)
> >> =

> >> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> >> b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c index
> >> bd65d0479683..34d46e25d610 100644
> >> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> >> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> >> @@ -582,6 +582,63 @@ static unsigned int hdmi_compute_n(unsigned int
> >> freq, unsigned long pixel_clk)>> =

> >>  	return n;
> >>  =

> >>  }
> >> =

> >> +static void hdmi_set_schnl(struct dw_hdmi *hdmi)
> >> +{
> >> +	u8 aud_schnl_samplerate;
> >> +	u8 aud_schnl_8;
> >> +
> >> +	/* These registers are on RK3288 using version 2.0a. */
> >> +	if (hdmi->version !=3D 0x200a)
> >> +		return;
> > =

> > Are these limited to the 2.0a version *in* RK3288, or 2.0a version on a=
ll
> > SoCs ?
> =

> After investigations, Amlogic sets these registers on their 2.0a version
> aswell, and Jernej (added in Cc) reported me Allwinner sets them on their
> < 2.0a and > 2.0a IPs versions.
> =

> Can you check on the Rockchip IP versions in RK3399 ?
> =

> For reference, the HDMI 1.4a IP version allwinner setups is:
> https://github.com/Allwinner-Homlet/H3-BSP4.4-linux/blob/master/drivers/v=
ide
> o/fbdev/sunxi/disp2/hdmi/hdmi_bsp_sun8iw7.c#L531-L539 (registers a
> "scrambled" but a custom bit can reset to the original mapping, 0x1066 ...
> 0x106f)

For easier reading, here is similar, but annotated version: http://ix.io/1U=
b6
Check function bsp_hdmi_audio().

Unless there is a special reason, you can just remove that check.

Best regards,
Jernej

> =

> Neil
> =

> >> +
> >> +	switch (hdmi->sample_rate) {
> >> +	case 32000:
> >> +		aud_schnl_samplerate =3D HDMI_FC_AUDSCHNLS7_SMPRATE_32K;
> >> +		break;
> >> +	case 44100:
> >> +		aud_schnl_samplerate =3D HDMI_FC_AUDSCHNLS7_SMPRATE_44K1;
> >> +		break;
> >> +	case 48000:
> >> +		aud_schnl_samplerate =3D HDMI_FC_AUDSCHNLS7_SMPRATE_48K;
> >> +		break;
> >> +	case 88200:
> >> +		aud_schnl_samplerate =3D HDMI_FC_AUDSCHNLS7_SMPRATE_88K2;
> >> +		break;
> >> +	case 96000:
> >> +		aud_schnl_samplerate =3D HDMI_FC_AUDSCHNLS7_SMPRATE_96K;
> >> +		break;
> >> +	case 176400:
> >> +		aud_schnl_samplerate =3D =

HDMI_FC_AUDSCHNLS7_SMPRATE_176K4;
> >> +		break;
> >> +	case 192000:
> >> +		aud_schnl_samplerate =3D HDMI_FC_AUDSCHNLS7_SMPRATE_192K;
> >> +		break;
> >> +	case 768000:
> >> +		aud_schnl_samplerate =3D HDMI_FC_AUDSCHNLS7_SMPRATE_768K;
> >> +		break;
> >> +	default:
> >> +		dev_warn(hdmi->dev, "Unsupported audio sample rate (%u)
\n",
> >> +			 hdmi->sample_rate);
> >> +		return;
> >> +	}
> >> +
> >> +	/* set channel status register */
> >> +	hdmi_modb(hdmi, aud_schnl_samplerate, =

HDMI_FC_AUDSCHNLS7_SMPRATE_MASK,
> >> +		  HDMI_FC_AUDSCHNLS7);
> >> +
> >> +	/*
> >> +	 * Set original frequency to be the same as frequency.
> >> +	 * Use one-complement value as stated in IEC60958-3 page 13.
> >> +	 */
> >> +	aud_schnl_8 =3D (~aud_schnl_samplerate) <<
> >> +			HDMI_FC_AUDSCHNLS8_ORIGSAMPFREQ_OFFSET;
> >> +
> >> +	/* This means word length is 16 bit. Refer to IEC60958-3 page 12. =

*/
> >> +	aud_schnl_8 |=3D 2 << HDMI_FC_AUDSCHNLS8_WORDLEGNTH_OFFSET;
> >> +
> >> +	hdmi_writeb(hdmi, aud_schnl_8, HDMI_FC_AUDSCHNLS8);
> >> +}
> >> +
> >> =

> >>  static void hdmi_set_clk_regenerator(struct dw_hdmi *hdmi,
> >>  =

> >>  	unsigned long pixel_clk, unsigned int sample_rate)
> >>  =

> >>  {
> >> =

> >> @@ -620,6 +677,8 @@ static void hdmi_set_clk_regenerator(struct dw_hdmi
> >> *hdmi,>> =

> >>  	hdmi->audio_cts =3D cts;
> >>  	hdmi_set_cts_n(hdmi, cts, hdmi->audio_enable ? n : 0);
> >>  	spin_unlock_irq(&hdmi->audio_lock);
> >> =

> >> +
> >> +	hdmi_set_schnl(hdmi);
> >> =

> >>  }
> >>  =

> >>  static void hdmi_init_clk_regenerator(struct dw_hdmi *hdmi)
> >> =

> >> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
> >> b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h index
> >> 6988f12d89d9..619ebc1c8354 100644
> >> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
> >> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
> >> @@ -158,6 +158,17 @@
> >> =

> >>  #define HDMI_FC_SPDDEVICEINF                    0x1062
> >>  #define HDMI_FC_AUDSCONF                        0x1063
> >>  #define HDMI_FC_AUDSSTAT                        0x1064
> >> =

> >> +#define HDMI_FC_AUDSV                           0x1065
> >> +#define HDMI_FC_AUDSU                           0x1066
> >> +#define HDMI_FC_AUDSCHNLS0                      0x1067
> >> +#define HDMI_FC_AUDSCHNLS1                      0x1068
> >> +#define HDMI_FC_AUDSCHNLS2                      0x1069
> >> +#define HDMI_FC_AUDSCHNLS3                      0x106a
> >> +#define HDMI_FC_AUDSCHNLS4                      0x106b
> >> +#define HDMI_FC_AUDSCHNLS5                      0x106c
> >> +#define HDMI_FC_AUDSCHNLS6                      0x106d
> >> +#define HDMI_FC_AUDSCHNLS7                      0x106e
> >> +#define HDMI_FC_AUDSCHNLS8                      0x106f
> >> =

> >>  #define HDMI_FC_DATACH0FILL                     0x1070
> >>  #define HDMI_FC_DATACH1FILL                     0x1071
> >>  #define HDMI_FC_DATACH2FILL                     0x1072
> >> =

> >> @@ -706,6 +717,15 @@ enum {
> >> =

> >>  /* HDMI_FC_AUDSCHNLS7 field values */
> >>  =

> >>  	HDMI_FC_AUDSCHNLS7_ACCURACY_OFFSET =3D 4,
> >>  	HDMI_FC_AUDSCHNLS7_ACCURACY_MASK =3D 0x30,
> >> =

> >> +	HDMI_FC_AUDSCHNLS7_SMPRATE_MASK =3D 0x0f,
> >> +	HDMI_FC_AUDSCHNLS7_SMPRATE_192K =3D 0xe,
> >> +	HDMI_FC_AUDSCHNLS7_SMPRATE_176K4 =3D 0xc,
> >> +	HDMI_FC_AUDSCHNLS7_SMPRATE_96K =3D 0xa,
> >> +	HDMI_FC_AUDSCHNLS7_SMPRATE_768K =3D 0x9,
> >> +	HDMI_FC_AUDSCHNLS7_SMPRATE_88K2 =3D 0x8,
> >> +	HDMI_FC_AUDSCHNLS7_SMPRATE_32K =3D 0x3,
> >> +	HDMI_FC_AUDSCHNLS7_SMPRATE_48K =3D 0x2,
> >> +	HDMI_FC_AUDSCHNLS7_SMPRATE_44K1 =3D 0x0,
> >> =

> >>  /* HDMI_FC_AUDSCHNLS8 field values */
> >>  =

> >>  	HDMI_FC_AUDSCHNLS8_ORIGSAMPFREQ_MASK =3D 0xf0,




_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
