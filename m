Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3F71957F5
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 14:25:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B4071675;
	Fri, 27 Mar 2020 14:24:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B4071675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585315514;
	bh=mFLSz14Ch+5wU6eA6PzzYKJ26HoFPRv2MzXlNF2Bnqc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TC9VOw5AY1qgswMBOmfTyTRsKReHLUX5lT7kYWLyYO5Sf/R4MpCXREOt9hzfgor6r
	 jCH7kbSw9GKkDh/gSAiXJ/NcFMzgkjUOmIp6PqIya3d4fFUqN9EdqM4B3gMcndIBdK
	 bULcWkR3jN1cijeOHs4D+6VD4wxAdUFDjnDNqlvA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53963F8028B;
	Fri, 27 Mar 2020 14:23:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E745DF80292; Fri, 27 Mar 2020 14:23:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.horus.com (mail.horus.com [78.46.148.228])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D73FAF80290
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 14:23:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D73FAF80290
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=horus.com header.i=@horus.com
 header.b="NaSOKIEm"
Received: from lenny.lan (193-83-225-155.adsl.highway.telekom.at
 [193.83.225.155])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "E-Mail Matthias Reichl Lenny",
 Issuer "HiassofT CA 2014" (verified OK))
 by mail.horus.com (Postfix) with ESMTPSA id 708AD640B1;
 Fri, 27 Mar 2020 14:23:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horus.com;
 s=20180324; t=1585315405;
 bh=/n6T9fLywOrR10zOU4gzpxZ7YUS9qiXTWrX/0NVhq80=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NaSOKIEm3VDtHUnmsHZEKmLBraRQSAMNMB/qnGzbDtl17Gw3WjIocrqWt6nCQKHb6
 snE2BrE+j8r4VHiIB3RyeJPrHlhMt3Tr6brEg+8syrJfunctEADCQPSUjd9G+uuA3v
 dlcIxwPJqltsWojnYHJIQN4PbutlEI9f05sMboBs=
Received: by lenny.lan (Postfix, from userid 1000)
 id EAC72203311; Fri, 27 Mar 2020 14:23:24 +0100 (CET)
Date: Fri, 27 Mar 2020 14:23:24 +0100
From: Matthias Reichl <hias@horus.com>
To: Matt Flax <flatmax@flatmax.org>
Subject: Re: [PATCH] ASoC: bcm2835-i2s: substream alignment now independent
 in hwparams
Message-ID: <20200327132324.GA4523@lenny.lan>
References: <20200324090823.20754-1-flatmax@flatmax.org>
 <d0684926-3f7a-0b97-a298-4088925442a4@flatmax.org>
 <1dcf128a-4ad3-0efa-81e4-b3ccc7caa8f1@flatmax.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1dcf128a-4ad3-0efa-81e4-b3ccc7caa8f1@flatmax.org>
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

On Fri, Mar 27, 2020 at 11:30:50AM +1100, Matt Flax wrote:
> 
> On 27/3/20 10:56 am, Matt Flax wrote:
> > 
> > Should this patch be handled through the ALSA team the R. Pi team or the
> > BCM team ?
> > 
> 
> Resending again with reduced recipients.
> 
> 
> > 
> > thanks
> > 
> > Matt
> > 
> > On 24/3/20 8:08 pm, Matt Flax wrote:
> > > Substream sample alignment was being set in hwparams for both
> > > substreams at the same time. This became a problem when    the Audio
> > > Injector isolated sound card needed to offset sample alignment
> > > for high sample    rates. The latency difference between playback
> > > and capture occurs because of the digital isolation chip
> > > propagation time, particularly when the codec is master and
> > > the DAC return is twice delayed.
> > > 
> > > This patch sets sample alignment registers  based on the substream
> > > direction in hwparams. This gives the machine driver more control
> > > over sample alignment in the bcm2835 i2s driver.
> > > 
> > > Signed-off-by: Matt Flax <flatmax@flatmax.org>
> > > ---
> > >   sound/soc/bcm/bcm2835-i2s.c | 36 +++++++++++++++++++-----------------
> > >   1 file changed, 19 insertions(+), 17 deletions(-)
> > > 
> > > diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
> > > index e6a12e271b07..9db542699a13 100644
> > > --- a/sound/soc/bcm/bcm2835-i2s.c
> > > +++ b/sound/soc/bcm/bcm2835-i2s.c
> > > @@ -493,11 +493,6 @@ static int bcm2835_i2s_hw_params(struct
> > > snd_pcm_substream *substream,
> > >           return -EINVAL;
> > >       }
> > >   -    bcm2835_i2s_calc_channel_pos(&rx_ch1_pos, &rx_ch2_pos,
> > > -        rx_mask, slot_width, data_delay, odd_slot_offset);
> > > -    bcm2835_i2s_calc_channel_pos(&tx_ch1_pos, &tx_ch2_pos,
> > > -        tx_mask, slot_width, data_delay, odd_slot_offset);
> > > -
> > >       /*
> > >        * Transmitting data immediately after frame start, eg
> > >        * in left-justified or DSP mode A, only works stable
> > > @@ -508,19 +503,26 @@ static int bcm2835_i2s_hw_params(struct
> > > snd_pcm_substream *substream,
> > >               "Unstable slave config detected, L/R may be swapped");
> > >         /*
> > > -     * Set format for both streams.
> > > -     * We cannot set another frame length
> > > -     * (and therefore word length) anyway,
> > > -     * so the format will be the same.
> > > +     * Set format on a per stream basis.
> > > +     * The alignment format can be different depending on direction.
> > >        */
> > > -    regmap_write(dev->i2s_regmap, BCM2835_I2S_RXC_A_REG,
> > > -          format
> > > -        | BCM2835_I2S_CH1_POS(rx_ch1_pos)
> > > -        | BCM2835_I2S_CH2_POS(rx_ch2_pos));
> > > -    regmap_write(dev->i2s_regmap, BCM2835_I2S_TXC_A_REG,
> > > -          format
> > > -        | BCM2835_I2S_CH1_POS(tx_ch1_pos)
> > > -        | BCM2835_I2S_CH2_POS(tx_ch2_pos));
> > > +    if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
> > > +        bcm2835_i2s_calc_channel_pos(&rx_ch1_pos, &rx_ch2_pos,
> > > +            rx_mask, slot_width, data_delay, odd_slot_offset);
> > > +        regmap_write(dev->i2s_regmap, BCM2835_I2S_RXC_A_REG,
> > > +              format
> > > +            | BCM2835_I2S_CH1_POS(rx_ch1_pos)
> > > +            | BCM2835_I2S_CH2_POS(rx_ch2_pos));
> > > +    }
> > > +
> > > +    if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> > > +        bcm2835_i2s_calc_channel_pos(&tx_ch1_pos, &tx_ch2_pos,
> > > +            tx_mask, slot_width, data_delay, odd_slot_offset);
> > > +        regmap_write(dev->i2s_regmap, BCM2835_I2S_TXC_A_REG,
> > > +              format
> > > +            | BCM2835_I2S_CH1_POS(tx_ch1_pos)
> > > +            | BCM2835_I2S_CH2_POS(tx_ch2_pos));
> > > +    }
> > >         /* Setup the I2S mode */

This will break duplex operation if a second stream is opened when
a stream is already running as the channel position registers for
the second stream haven't been set up.

Note this code at the very beginning of hw_params:

        /*
         * If a stream is already enabled,
         * the registers are already set properly.
         */
        regmap_read(dev->i2s_regmap, BCM2835_I2S_CS_A_REG, &csreg);

        if (csreg & (BCM2835_I2S_TXON | BCM2835_I2S_RXON))
                return 0;

The reason for this check is that we can't change bcm2835 I2S registers
after I2S RX/TX has been enabled - the reason why is explained in the
datasheet:

> The PCM interface runs asynchronously at the PCM_CLK rate and
> automatically transfers transmit and receive data across to the
> internal APB clock domain. The control registers are NOT
> synchronised and should be programmed before the device is enabled
> and should NOT be changed whilst the interface is running.
> 
> Only the EN, RXON and TXON bits of the PCMCS register are synchronised
> across the PCM - APB clock domain and are allowed to be changed whilst
> the interface is running.

Therefore we need to set up channel masks for both RX and TX before
any stream is started.

so long,

Hias
