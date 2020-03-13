Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2A918471C
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 13:42:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D21B317F8;
	Fri, 13 Mar 2020 13:42:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D21B317F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584103373;
	bh=tgITx3udnkEgR1xuM2wgsUOQN1rzYgIiMUlHDX0dYaE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SaG4lisFWvdJ1TuqzLWkMwuPdIXZXfhuIvrkqNV77VodXANlrQbQAeBzF6CikOq3q
	 1PQBi4lx2lmpLgpKqZ5StUiyD1y8W0Wrxf/ktvGYTtOSieirR0c05O4joHimmq28HS
	 C/OBLyXlWCZ0wkArnJ4IFVowJDSlXMpQDEiwenrs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED18DF801EB;
	Fri, 13 Mar 2020 13:41:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 876CCF801F7; Fri, 13 Mar 2020 13:41:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA3CAF801A3
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 13:40:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA3CAF801A3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="g+gYR2Lv"
Received: from localhost (unknown [171.76.107.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 11DE520724;
 Fri, 13 Mar 2020 12:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584103254;
 bh=tgITx3udnkEgR1xuM2wgsUOQN1rzYgIiMUlHDX0dYaE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g+gYR2LvtvlA8v0hrbnFWvTCbNSX+vqRry14M3Uuzpmxt6rk3WQ17iARExRk3loUu
 /wv5tuKoZZG+9F2ADNlpQUpQL3QvpXf3XRRO/WZWYTz7k9TYO0dmFaevu/XiM3Ocih
 fgS4UxHUWklz/tB0U6Nqc99mbA8f1sIDr9FwlI3E=
Date: Fri, 13 Mar 2020 18:10:49 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [RESEND PATCH v2 8/9] ASoC: qcom: q6asm-dai: add support for
 ALAC and APE decoders
Message-ID: <20200313124049.GJ4885@vkoul-mobl>
References: <20200313101627.1561365-1-vkoul@kernel.org>
 <20200313101627.1561365-9-vkoul@kernel.org>
 <fcee2779-fee8-e3d9-590f-e28fc5880ea0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcee2779-fee8-e3d9-590f-e28fc5880ea0@linaro.org>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
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

On 13-03-20, 12:15, Srinivas Kandagatla wrote:
> 
> 
> On 13/03/2020 10:16, Vinod Koul wrote:
> > Qualcomm DSPs also supports the ALAC and APE decoders, so add support
> > for these and convert the snd_codec_params to qdsp format.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> One minor nit, other that,
> 
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Thanks Srini for the reviews

> > ---
> >   sound/soc/qcom/qdsp6/q6asm-dai.c | 67 +++++++++++++++++++++++++++++++-
> >   1 file changed, 66 insertions(+), 1 deletion(-)
> > 
> > diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
> > index 53c250778eea..948710759824 100644
> > --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> > +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
> > @@ -628,12 +628,16 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
> >   	struct q6asm_dai_data *pdata;
> >   	struct q6asm_flac_cfg flac_cfg;
> >   	struct q6asm_wma_cfg wma_cfg;
> > +	struct q6asm_alac_cfg alac_cfg;
> > +	struct q6asm_ape_cfg ape_cfg;
> >   	unsigned int wma_v9 = 0;
> >   	struct device *dev = c->dev;
> >   	int ret;
> >   	union snd_codec_options *codec_options;
> >   	struct snd_dec_flac *flac;
> >   	struct snd_dec_wma *wma;
> > +	struct snd_dec_alac *alac;
> > +	struct snd_dec_ape *ape;
> >   	codec_options = &(prtd->codec_param.codec.options);
> > @@ -756,6 +760,65 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
> >   			dev_err(dev, "WMA9 CMD failed:%d\n", ret);
> >   			return -EIO;
> >   		}
> > +		break;
> > +
> > +	case SND_AUDIOCODEC_ALAC:
> > +		memset(&alac_cfg, 0x0, sizeof(alac_cfg));
> > +		alac = &codec_options->alac_d;
> > +
> > +		alac_cfg.sample_rate = params->codec.sample_rate;
> > +		alac_cfg.avg_bit_rate = params->codec.bit_rate;
> > +		alac_cfg.bit_depth = prtd->bits_per_sample;
> > +		alac_cfg.num_channels = params->codec.ch_in;
> > +
> > +		alac_cfg.frame_length = alac->frame_length;
> > +		alac_cfg.pb = alac->pb;
> > +		alac_cfg.mb = alac->mb;
> > +		alac_cfg.kb = alac->kb;
> > +		alac_cfg.max_run = alac->max_run;
> > +		alac_cfg.compatible_version = alac->compatible_version;
> > +		alac_cfg.max_frame_bytes = alac->max_frame_bytes;
> > +
> > +		switch (params->codec.ch_in) {
> > +		case 1:
> > +			alac_cfg.channel_layout_tag = (100 << 16) | 1;
> 
> We should probably define this layout tag in asm.h
> something like:
> 
> #define ALAC_CHANNEL_LAYOUT_TAG_Mono (100<<16) | 1
> #define ALAC_CHANNEL_LAYOUT_TAG_STEREO (100<<16) | 2

Sure I will add these

-- 
~Vinod
