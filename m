Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 443A7A7F5D
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2019 11:29:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6D8716A3;
	Wed,  4 Sep 2019 11:28:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6D8716A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567589377;
	bh=pq8Jd1lIEUvSHhPuQtNWPz8JCB7TTDA009rwSLcjxV0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ogUM9eMSA9PddW2R36YATzkhS3SB/tzW/8EdmJXfsXmMFtnwCnwpKzjDqua/RF9kh
	 r+d402skLd18ZNNxQ9/8y72VjIVM5Pzwd1YK6GPGkaH79neY74gqlocobL9k2xxnc0
	 rNKNx02pRybrYiaj+h97RJXt91wKqPdSXd02up1Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F818F80228;
	Wed,  4 Sep 2019 11:27:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3A8BF80171; Wed,  4 Sep 2019 11:27:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F1E0F80171
 for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2019 11:27:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F1E0F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk
 header.b="Om8Lq5NK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XKThuSbZFfZ7pl95l1VPO0wQKRiG+nLbFF9OeGTjtYM=; b=Om8Lq5NKTbiEdTpux26a7qCk5
 dZ5tJGlG6PK6Luh2tvZO7cMaOJLPmYev9eKKaC+piAWTYRoP3tQBsAX1v0z0Rmmf6HCqVQAkuV80k
 f9MovrDB/BdqRql6wDTRmwUw4C0xwquaK5wQ98nhINmsPydabgyv424kYP72LLxUYR/NFlWMA+5VY
 p9ygB+RVjjh9ozvrDrk/c83hko1T+Krs2RxUAUfeFFukYaxNLm/NHyAnrKbfhgsLJkyFZ4pfG+ZxA
 EzXEF67V3Av318bsLe0fW/7CVPA0qtAMOVbSUl4lU4N80WT/8hmoVpi0tao6OabLx64hmsNOLxnj7
 cqhKedPvQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39512)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1i5RZb-0003Yi-2F; Wed, 04 Sep 2019 10:27:31 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1i5RZP-0004Q3-GU; Wed, 04 Sep 2019 10:27:19 +0100
Date: Wed, 4 Sep 2019 10:27:19 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Cheng-yi Chiang <cychiang@chromium.org>
Message-ID: <20190904092719.GJ13294@shell.armlinux.org.uk>
References: <20190903055103.134764-1-cychiang@chromium.org>
 <e1c3483c-baa6-c726-e547-fadf40d259f4@baylibre.com>
 <CAFv8NwKHZM+zTu7GF_J0Xk6hubA2JK4cCsdhsDPOGk=3rnbCZw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFv8NwKHZM+zTu7GF_J0Xk6hubA2JK4cCsdhsDPOGk=3rnbCZw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, kuninori.morimoto.gx@renesas.com,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, cain.cai@rock-chips.com,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Yakir Yang <ykk@rock-chips.com>, sam@ravnborg.org,
 Xing Zheng <zhengxing@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Dylan Reid <dgreid@chromium.org>, tzungbi@chromium.org,
 Jeffy Chen <jeffy.chen@rock-chips.com>,
 =?utf-8?B?6JSh5p6r?= <eddie.cai@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org, Doug Anderson <dianders@chromium.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
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

On Wed, Sep 04, 2019 at 05:09:29PM +0800, Cheng-yi Chiang wrote:
> Hi,
> 
> On Tue, Sep 3, 2019 at 5:53 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >
> > Hi,
> >
> > On 03/09/2019 07:51, Cheng-Yi Chiang wrote:
> > > From: Yakir Yang <ykk@rock-chips.com>
> > >
> > > When transmitting IEC60985 linear PCM audio, we configure the
> > > Audio Sample Channel Status information of all the channel
> > > status bits in the IEC60958 frame.
> > > Refer to 60958-3 page 10 for frequency, original frequency, and
> > > wordlength setting.
> > >
> > > This fix the issue that audio does not come out on some monitors
> > > (e.g. LG 22CV241)
> > >
> > > Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> > > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > > ---
> > >  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 59 +++++++++++++++++++++++
> > >  drivers/gpu/drm/bridge/synopsys/dw-hdmi.h | 20 ++++++++
> > >  2 files changed, 79 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > > index bd65d0479683..34d46e25d610 100644
> > > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > > @@ -582,6 +582,63 @@ static unsigned int hdmi_compute_n(unsigned int freq, unsigned long pixel_clk)
> > >       return n;
> > >  }
> > >
> > > +static void hdmi_set_schnl(struct dw_hdmi *hdmi)
> > > +{
> > > +     u8 aud_schnl_samplerate;
> > > +     u8 aud_schnl_8;
> > > +
> > > +     /* These registers are on RK3288 using version 2.0a. */
> > > +     if (hdmi->version != 0x200a)
> > > +             return;
> >
> > Are these limited to the 2.0a version *in* RK3288, or 2.0a version on all
> > SoCs ?
> >
> 
> In the original patch by Yakir,
> 
> https://lore.kernel.org/patchwork/patch/539653/   (sorry, I should
> have added this link in the "after the cut" note)
> 
> The fix is limited to version 2.0.
> Since I am only testing on RK3288 with 2.0a, I change the check to 2.0a only.
> I can not test 2.0a version on other SoCs.
> The databook I have at hand is 2.0a (not specific to RK3288) so I
> think all 2.0a should have this register.
> 
> As for other version like version 1.3 on iMX6, there is no such
> register, as stated by Russell
> 
> http://lkml.iu.edu/hypermail/linux/kernel/1501.3/06268.html.

It's likely more to do with how the IP is configured rather than the
version.  The big difference between dw-hdmi used in iMX6 and elsewhere
is that iMX6 uses a built-in AHB audio interface and not I2S.  Elsewhere
uses I2S.

I2S does not have the capability to convey channel status information
(which is required by HDMI).  With AHB, it is encoded into the data in
memory.

So, I think this setup should be done in the I2S driver and not in the
core driver.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
