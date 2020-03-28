Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AC21965ED
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Mar 2020 13:01:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ABBE1673;
	Sat, 28 Mar 2020 13:00:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ABBE1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585396859;
	bh=iiN59bdPd169AVqWebDhM2AJkzu8cWbbEAZkimmhwsw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eOMMrmIlaSkO08hZ5dwj0oTxv7nPHe2o5W5gNQRUrbCG6o6U7bVNXIOFs2G+ScULM
	 YOfpouEmq0adruRUHaGATmwMq/7qNO6dvgCeBpWyOfGwlfaaGBpJHYFNSuBiFOMjCB
	 GfOQZ8kbpZEGzPcNViU/QWlWiSbxQDxEZ6mE8Z38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99C50F80249;
	Sat, 28 Mar 2020 12:59:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 375DAF800EA; Sat, 28 Mar 2020 12:59:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.horus.com (mail.horus.com [78.46.148.228])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A389F800EA
 for <alsa-devel@alsa-project.org>; Sat, 28 Mar 2020 12:59:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A389F800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=horus.com header.i=@horus.com
 header.b="LJxuGkSf"
Received: from [192.168.1.20] (193-83-225-155.adsl.highway.telekom.at
 [193.83.225.155])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "E-Mail Matthias Reichl", Issuer "HiassofT CA 2014" (not verified))
 by mail.horus.com (Postfix) with ESMTPSA id A437C6412F;
 Sat, 28 Mar 2020 12:59:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horus.com;
 s=20180324; t=1585396752;
 bh=TNHYVUFCR6clz/R+eD1bmzTMCLkZjLvojGJzR0otF6A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LJxuGkSfrfeuM1g8unxtbFykkMbPU9XznwoYF6eaRgEpwrkzpk+6VB8EviKao//AA
 dDeLw8xah6fMrQUXKGZW4Buus4t3DX12FL9BPVsooDDicdw4puJNxH9zXo6KlQ7pX3
 kbwHeTb6jJXF2oKMeGvcnd09q9dMbiupEQZsiMvY=
Received: by camel2.lan (Postfix, from userid 1000)
 id 859AD1C72A8; Sat, 28 Mar 2020 12:59:11 +0100 (CET)
Date: Sat, 28 Mar 2020 12:59:11 +0100
From: Matthias Reichl <hias@horus.com>
To: Matt Flax <flatmax@flatmax.org>
Subject: Re: [PATCH] ASoC: bcm2835-i2s: substream alignment now independent
 in hwparams
Message-ID: <20200328115911.GA4997@camel2.lan>
References: <20200324090823.20754-1-flatmax@flatmax.org>
 <d0684926-3f7a-0b97-a298-4088925442a4@flatmax.org>
 <1dcf128a-4ad3-0efa-81e4-b3ccc7caa8f1@flatmax.org>
 <20200327132324.GA4523@lenny.lan>
 <59b9ef4e-0067-593e-b4f9-49a5b271b432@flatmax.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59b9ef4e-0067-593e-b4f9-49a5b271b432@flatmax.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-rpi-kernel@lists.infradead.org
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

On Sat, Mar 28, 2020 at 08:50:52AM +1100, Matt Flax wrote:
> 
> On 28/3/20 12:23 am, Matthias Reichl wrote:
> > On Fri, Mar 27, 2020 at 11:30:50AM +1100, Matt Flax wrote:
> > > On 27/3/20 10:56 am, Matt Flax wrote:
> > > > Should this patch be handled through the ALSA team the R. Pi team or the
> > > > BCM team ?
> > > > 
> > > Resending again with reduced recipients.
> > > 
> > > 
> > > > thanks
> > > > 
> > > > Matt
> > > > 
> > > > On 24/3/20 8:08 pm, Matt Flax wrote:
> > > > > Substream sample alignment was being set in hwparams for both
> > > > > substreams at the same time. This became a problem when    the Audio
> > > > > Injector isolated sound card needed to offset sample alignment
> > > > > for high sample    rates. The latency difference between playback
> > > > > and capture occurs because of the digital isolation chip
> > > > > propagation time, particularly when the codec is master and
> > > > > the DAC return is twice delayed.
> > > > > 
> > > > > This patch sets sample alignment registers  based on the substream
> > > > > direction in hwparams. This gives the machine driver more control
> > > > > over sample alignment in the bcm2835 i2s driver.
> > > > > 
> > > > > Signed-off-by: Matt Flax <flatmax@flatmax.org>
> > > > > ---
> > > > >    sound/soc/bcm/bcm2835-i2s.c | 36 +++++++++++++++++++-----------------
> > > > >    1 file changed, 19 insertions(+), 17 deletions(-)
> > > > > 
> > > > > diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
> > > > > index e6a12e271b07..9db542699a13 100644
> > > > > --- a/sound/soc/bcm/bcm2835-i2s.c
> > > > > +++ b/sound/soc/bcm/bcm2835-i2s.c
> > > > > @@ -493,11 +493,6 @@ static int bcm2835_i2s_hw_params(struct
> > > > > snd_pcm_substream *substream,
> > > > >            return -EINVAL;
> > > > >        }
> > > > >    -    bcm2835_i2s_calc_channel_pos(&rx_ch1_pos, &rx_ch2_pos,
> > > > > -        rx_mask, slot_width, data_delay, odd_slot_offset);
> > > > > -    bcm2835_i2s_calc_channel_pos(&tx_ch1_pos, &tx_ch2_pos,
> > > > > -        tx_mask, slot_width, data_delay, odd_slot_offset);
> > > > > -
> > > > >        /*
> > > > >         * Transmitting data immediately after frame start, eg
> > > > >         * in left-justified or DSP mode A, only works stable
> > > > > @@ -508,19 +503,26 @@ static int bcm2835_i2s_hw_params(struct
> > > > > snd_pcm_substream *substream,
> > > > >                "Unstable slave config detected, L/R may be swapped");
> > > > >          /*
> > > > > -     * Set format for both streams.
> > > > > -     * We cannot set another frame length
> > > > > -     * (and therefore word length) anyway,
> > > > > -     * so the format will be the same.
> > > > > +     * Set format on a per stream basis.
> > > > > +     * The alignment format can be different depending on direction.
> > > > >         */
> > > > > -    regmap_write(dev->i2s_regmap, BCM2835_I2S_RXC_A_REG,
> > > > > -          format
> > > > > -        | BCM2835_I2S_CH1_POS(rx_ch1_pos)
> > > > > -        | BCM2835_I2S_CH2_POS(rx_ch2_pos));
> > > > > -    regmap_write(dev->i2s_regmap, BCM2835_I2S_TXC_A_REG,
> > > > > -          format
> > > > > -        | BCM2835_I2S_CH1_POS(tx_ch1_pos)
> > > > > -        | BCM2835_I2S_CH2_POS(tx_ch2_pos));
> > > > > +    if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
> > > > > +        bcm2835_i2s_calc_channel_pos(&rx_ch1_pos, &rx_ch2_pos,
> > > > > +            rx_mask, slot_width, data_delay, odd_slot_offset);
> > > > > +        regmap_write(dev->i2s_regmap, BCM2835_I2S_RXC_A_REG,
> > > > > +              format
> > > > > +            | BCM2835_I2S_CH1_POS(rx_ch1_pos)
> > > > > +            | BCM2835_I2S_CH2_POS(rx_ch2_pos));
> > > > > +    }
> > > > > +
> > > > > +    if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> > > > > +        bcm2835_i2s_calc_channel_pos(&tx_ch1_pos, &tx_ch2_pos,
> > > > > +            tx_mask, slot_width, data_delay, odd_slot_offset);
> > > > > +        regmap_write(dev->i2s_regmap, BCM2835_I2S_TXC_A_REG,
> > > > > +              format
> > > > > +            | BCM2835_I2S_CH1_POS(tx_ch1_pos)
> > > > > +            | BCM2835_I2S_CH2_POS(tx_ch2_pos));
> > > > > +    }
> > > > >          /* Setup the I2S mode */
> > This will break duplex operation if a second stream is opened when
> > a stream is already running as the channel position registers for
> > the second stream haven't been set up.
> > 
> > Note this code at the very beginning of hw_params:
> > 
> >          /*
> >           * If a stream is already enabled,
> >           * the registers are already set properly.
> >           */
> >          regmap_read(dev->i2s_regmap, BCM2835_I2S_CS_A_REG, &csreg);
> > 
> >          if (csreg & (BCM2835_I2S_TXON | BCM2835_I2S_RXON))
> >                  return 0;
> > 
> > The reason for this check is that we can't change bcm2835 I2S registers
> > after I2S RX/TX has been enabled - the reason why is explained in the
> > datasheet:
> > 
> > > The PCM interface runs asynchronously at the PCM_CLK rate and
> > > automatically transfers transmit and receive data across to the
> > > internal APB clock domain. The control registers are NOT
> > > synchronised and should be programmed before the device is enabled
> > > and should NOT be changed whilst the interface is running.
> > > 
> > > Only the EN, RXON and TXON bits of the PCMCS register are synchronised
> > > across the PCM - APB clock domain and are allowed to be changed whilst
> > > the interface is running.
> > Therefore we need to set up channel masks for both RX and TX before
> > any stream is started.
> 
> 
> I see what you mean. We can't change the registers once the system has
> started half duplex and then subsequently changed to full duplex.
> 
> There are cases however where playback and capture need to be set
> independently. In these cases the machine driver requires different format
> settings based on the stream direction.
> 
> What if we make a check for whether the system is already running and in
> that case return an error - forcing the user to use specify the same dai_fmt
> which is already in use before continuing ?

I'm not sure if I can follow you. dai_fmt, as the name implies, sets
the format of the DAI - you can't have different DAI formats for
playback/capture active at the same time.

This sounds a bit like you may be trying to work around some hardware
or codec configuration issue by creative use of the API.

> Would there be a better way to achieve different hwparams based on stream
> direction ?

If you really need different DAI formats for playback/capture it's
best to disallow full-duplex mode and set the DAI format based on
stream direction in the machine driver.

so long,

Hias

> 
> Matt
> 
