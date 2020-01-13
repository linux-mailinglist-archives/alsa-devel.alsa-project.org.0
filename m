Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 638A613AB16
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:29:33 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0939F1775;
	Mon, 13 Jan 2020 14:11:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0939F1775
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD4A1F801F7;
	Mon, 13 Jan 2020 14:10:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92CF0F801EB; Mon, 13 Jan 2020 14:10:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53DA7F80149
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 14:10:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53DA7F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="bpJWK7/X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1578921042;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=CZ/ItoagmVarxZ9Rm+9gJpemMc/V2vXvYV32eIOTk8w=;
 b=bpJWK7/XBAYgUPNFVGq2kMnEAUrNZAG0LDc8sib9mgVjjWKi3IV3UgN9+WBe/LILV9
 0331kaNWYsOerXJX9CX4FhStyuHwHArkDGUBasrpwFDqBkMiGVrR8D/1sGrL2bVfUdZU
 hVRR9sG154XFmRqQQEjBvcSGqBrjuwgTowo8xxD29Mu8F/TKff+Ev44j494jUnURdTrC
 DeiGxr57aUZWAGv/HTYMoBAAEWBU9AD28hvWgY29zHWQFRtElLGEw1+ZIE79lEuXBp5J
 n+ILVUL7lEYx3Q8LsUXe0eCm7E3WQ7dbakj+f4FKMX9Mlu0j1ehJ7mgTla6RpsWN25+1
 x0UA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zH4phNhJA0AIphrNzqA=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.1.4 AUTH)
 with ESMTPSA id h048a6w0DDAdNx1
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 13 Jan 2020 14:10:39 +0100 (CET)
Date: Mon, 13 Jan 2020 14:10:34 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20200113131034.GA12166@gerhold.net>
References: <20200105102753.83108-1-stephan@gerhold.net>
 <33e68247-ff11-6c0c-b91c-9b406f9607cd@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <33e68247-ff11-6c0c-b91c-9b406f9607cd@linaro.org>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [alsa-devel] [PATCH] ASoC: msm8916-wcd-digital: Reset RX
 interpolation path after use
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

On Mon, Jan 13, 2020 at 11:30:48AM +0000, Srinivas Kandagatla wrote:
> 
> 
> On 05/01/2020 10:27, Stephan Gerhold wrote:
> > For some reason, attempting to route audio through QDSP6 on MSM8916
> > causes the RX interpolation path to get "stuck" after playing audio
> > a few times. In this situation, the analog codec part is still working,
> > but the RX path in the digital codec stops working, so you only hear
> > the analog parts powering up. After a reboot everything works again.
> > 
> > So far I was not able to reproduce the problem when using lpass-cpu.
> > 
> > The downstream kernel driver avoids this by resetting the RX
> > interpolation path after use. In mainline we do something similar
> > for the TX decimator (LPASS_CDC_CLK_TX_RESET_B1_CTL), but the
> > interpolator reset (LPASS_CDC_CLK_RX_RESET_CTL) got lost when the
> > msm8916-wcd driver was split into analog and digital.
> > 
> > Fix this problem by adding the reset to
> > msm8916_wcd_digital_enable_interpolator().
> > 
> > Fixes: 150db8c5afa1 ("ASoC: codecs: Add msm8916-wcd digital codec")
> > Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> 
> Thanks for the patch and testing it with QDSP6.
> 
> > ---
> > Tested on msm8916-samsung-a5u:
> >    - qdsp6 does no longer stop working after playing audio a few times
> >    - lpass-cpu is still working fine (no difference)
> > ---
> >   sound/soc/codecs/msm8916-wcd-digital.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/sound/soc/codecs/msm8916-wcd-digital.c b/sound/soc/codecs/msm8916-wcd-digital.c
> > index 58b2468fb2a7..09fccacadd6b 100644
> > --- a/sound/soc/codecs/msm8916-wcd-digital.c
> > +++ b/sound/soc/codecs/msm8916-wcd-digital.c
> > @@ -586,6 +586,12 @@ static int msm8916_wcd_digital_enable_interpolator(
> >   		snd_soc_component_write(component, rx_gain_reg[w->shift],
> >   			      snd_soc_component_read32(component, rx_gain_reg[w->shift]));
> >   		break;
> > +	case SND_SOC_DAPM_POST_PMD:
> 
> We should do this in SND_SOC_DAPM_PRE_PMU rather than in power down
> sequence.
> 

Thanks for the suggestion! Any particular reason for this?

I used earlier versions of your msm8916-wcd patch series and the
downstream driver as a base, and it does this in POST_PMD:

https://source.codeaurora.org/quic/la/kernel/msm-3.10/tree/sound/soc/codecs/msm8x16-wcd.c?h=LA.BR.1.2.9.1-02310-8x16.0#n3773

For msm8916_wcd_digital_enable_dec() we also do it in POST_PMD:

	/* ... */
	case SND_SOC_DAPM_POST_PMD:
		snd_soc_component_update_bits(component, dec_reset_reg, 1 << w->shift,
				    1 << w->shift);
		snd_soc_component_update_bits(component, dec_reset_reg, 1 << w->shift, 0x0);
		/* ... */

I don't mind testing if moving it to PRE_PMU works, I'm just wondering
if doing it in PRE_PMU has any advantages. 

> 
> > +		snd_soc_component_update_bits(component, LPASS_CDC_CLK_RX_RESET_CTL,
> > +					      1 << w->shift, 1 << w->shift);
> > +		snd_soc_component_update_bits(component, LPASS_CDC_CLK_RX_RESET_CTL,
> > +					      1 << w->shift, 0x0);
> > +		break;
> >   	}
> >   	return 0;
> >   }
> > 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
