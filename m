Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8092C47E1F6
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 12:06:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0537816E9;
	Thu, 23 Dec 2021 12:05:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0537816E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640257591;
	bh=moFrdfi1gAB4sIuYqhTiGf31cZmF2Nzr0u8tZE00HpY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z514lKOutIUI7uqSqfb959MA82oyNCdUmGNh8gYMHwpbT0VoznoXluUXU3LpS8y1r
	 UAAzU5cRYlRj4f8Ls9v8DPCxFuxQ+/u07NT+S1sWd2HI6nQqYU0RrwQ2wyaD09DQcH
	 nr9UmhCagQYhZlg3ICD6g9Rqdm/KvLD2iQ6MmYTQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 716BCF80115;
	Thu, 23 Dec 2021 12:05:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FD0BF80105; Thu, 23 Dec 2021 12:05:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82B22F800AF
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 12:05:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82B22F800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Vcfa2NrQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6EEA361E23;
 Thu, 23 Dec 2021 11:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B629C36AE5;
 Thu, 23 Dec 2021 11:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640257509;
 bh=moFrdfi1gAB4sIuYqhTiGf31cZmF2Nzr0u8tZE00HpY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vcfa2NrQT72MXrlXEZETDr9rJOcPeY8Li2U7nyjGsbcZ4054sCbG4y0ED24KXype3
 Jz7OakUaHBn0DaZOsem8PhPaSw5xHFmPi3kueUcD2GYaYtPaGPVwTZYEdZvkBuYrAY
 bxiH6J3nZnPg+ao2QP2TduF60aF2FLdxypN0jl6ipmI6OLO79QuOXqHDlM+Dfr/dXP
 mBVTOap75+ByDcT8uKIb+vrYlf1x7oE6v1K0L6Fq/pwoBjiKVLh7QVTBCp21FwQ4lq
 AirF7forLhGJFLVbVPjKBOw1AxK1RtcMF1vTqE+BBrtnftDeYjOlyffjw9G2V+qurs
 fqIL1qYzH7+iQ==
Date: Thu, 23 Dec 2021 16:35:05 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Liao, Bard" <bard.liao@intel.com>
Subject: Re: [PATCH 7/7] soundwire: intel: remove PDM support
Message-ID: <YcRX4ehgXZIWx3jf@matsya>
References: <20211213054634.30088-1-yung-chuan.liao@linux.intel.com>
 <20211213054634.30088-8-yung-chuan.liao@linux.intel.com>
 <YcQeRJ060/u4n6fR@matsya>
 <DM6PR11MB4074FEE19010B83F0CDDE8A9FF7E9@DM6PR11MB4074.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM6PR11MB4074FEE19010B83F0CDDE8A9FF7E9@DM6PR11MB4074.namprd11.prod.outlook.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>, "Kale,
 Sanyog R" <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On 23-12-21, 07:46, Liao, Bard wrote:
> > -----Original Message-----
> > From: Vinod Koul <vkoul@kernel.org>
> > Sent: Thursday, December 23, 2021 2:59 PM
> > To: Bard Liao <yung-chuan.liao@linux.intel.com>
> > Cc: alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org;
> > tiwai@suse.de; broonie@kernel.org; gregkh@linuxfoundation.org;
> > srinivas.kandagatla@linaro.org; pierre-louis.bossart@linux.intel.com; Kale,
> > Sanyog R <sanyog.r.kale@intel.com>; Liao, Bard <bard.liao@intel.com>
> > Subject: Re: [PATCH 7/7] soundwire: intel: remove PDM support
> > 
> > On 13-12-21, 13:46, Bard Liao wrote:
> > > From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > >
> > > While the hardware supports PDM streams, this capability has never
> > > been tested or enabled on any product, so this is dead-code. Let's
> > > remove all this.
> > 
> > So no plans to test and enable this? Do the DMICs not use PDM?
> 
> The point is that this code is unused/untested. We can re-add it after
> it was tested.

That does not answer my question. Do the DMICs not use PDM?

> 
> > 
> > Again this should not be in this series...
> 
> Agree, but since this patche depends on the previous patches, I sent them
> together to avoid conflict.

There are ways to handle that...

> 
> > 
> > >
> > > Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > > Reviewed-by: P�ter Ujfalusi <peter.ujfalusi@linux.intel.com>
> > > Reviewed-by: Rander Wang <rander.wang@intel.com>
> > > Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> > > ---
> > >  drivers/soundwire/cadence_master.c |  36 +--------
> > >  drivers/soundwire/cadence_master.h |  12 +--
> > >  drivers/soundwire/intel.c          | 123 +++++++----------------------
> > >  3 files changed, 31 insertions(+), 140 deletions(-)
> > >
> > > diff --git a/drivers/soundwire/cadence_master.c
> > b/drivers/soundwire/cadence_master.c
> > > index 4fcc3ba93004..558390af44b6 100644
> > > --- a/drivers/soundwire/cadence_master.c
> > > +++ b/drivers/soundwire/cadence_master.c
> > > @@ -1178,9 +1178,6 @@ int sdw_cdns_pdi_init(struct sdw_cdns *cdns,
> > >  	cdns->pcm.num_bd = config.pcm_bd;
> > >  	cdns->pcm.num_in = config.pcm_in;
> > >  	cdns->pcm.num_out = config.pcm_out;
> > > -	cdns->pdm.num_bd = config.pdm_bd;
> > > -	cdns->pdm.num_in = config.pdm_in;
> > > -	cdns->pdm.num_out = config.pdm_out;
> > >
> > >  	/* Allocate PDIs for PCMs */
> > >  	stream = &cdns->pcm;
> > > @@ -1211,32 +1208,6 @@ int sdw_cdns_pdi_init(struct sdw_cdns *cdns,
> > >  	stream->num_pdi = stream->num_bd + stream->num_in + stream-
> > >num_out;
> > >  	cdns->num_ports = stream->num_pdi;
> > >
> > > -	/* Allocate PDIs for PDMs */
> > > -	stream = &cdns->pdm;
> > > -	ret = cdns_allocate_pdi(cdns, &stream->bd,
> > > -				stream->num_bd, offset);
> > > -	if (ret)
> > > -		return ret;
> > > -
> > > -	offset += stream->num_bd;
> > > -
> > > -	ret = cdns_allocate_pdi(cdns, &stream->in,
> > > -				stream->num_in, offset);
> > > -	if (ret)
> > > -		return ret;
> > > -
> > > -	offset += stream->num_in;
> > > -
> > > -	ret = cdns_allocate_pdi(cdns, &stream->out,
> > > -				stream->num_out, offset);
> > > -
> > > -	if (ret)
> > > -		return ret;
> > > -
> > > -	/* Update total number of PDM PDIs */
> > > -	stream->num_pdi = stream->num_bd + stream->num_in + stream-
> > >num_out;
> > > -	cdns->num_ports += stream->num_pdi;
> > > -
> > >  	return 0;
> > >  }
> > >  EXPORT_SYMBOL(sdw_cdns_pdi_init);
> > > @@ -1681,7 +1652,7 @@ int sdw_cdns_probe(struct sdw_cdns *cdns)
> > >  EXPORT_SYMBOL(sdw_cdns_probe);
> > >
> > >  int cdns_set_sdw_stream(struct snd_soc_dai *dai,
> > > -			void *stream, bool pcm, int direction)
> > > +			void *stream, int direction)
> > >  {
> > >  	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
> > >  	struct sdw_cdns_dma_data *dma;
> > > @@ -1705,10 +1676,7 @@ int cdns_set_sdw_stream(struct snd_soc_dai
> > *dai,
> > >  		if (!dma)
> > >  			return -ENOMEM;
> > >
> > > -		if (pcm)
> > > -			dma->stream_type = SDW_STREAM_PCM;
> > > -		else
> > > -			dma->stream_type = SDW_STREAM_PDM;
> > > +		dma->stream_type = SDW_STREAM_PCM;
> > >
> > >  		dma->bus = &cdns->bus;
> > >  		dma->link_id = cdns->instance;
> > > diff --git a/drivers/soundwire/cadence_master.h
> > b/drivers/soundwire/cadence_master.h
> > > index aa4b9b0eb2a8..595d72c15d97 100644
> > > --- a/drivers/soundwire/cadence_master.h
> > > +++ b/drivers/soundwire/cadence_master.h
> > > @@ -17,7 +17,7 @@
> > >   * @h_ch_num: high channel for PDI
> > >   * @ch_count: total channel count for PDI
> > >   * @dir: data direction
> > > - * @type: stream type, PDM or PCM
> > > + * @type: stream type, (only PCM supported)
> > >   */
> > >  struct sdw_cdns_pdi {
> > >  	int num;
> > > @@ -62,17 +62,11 @@ struct sdw_cdns_streams {
> > >   * @pcm_bd: number of bidirectional PCM streams supported
> > >   * @pcm_in: number of input PCM streams supported
> > >   * @pcm_out: number of output PCM streams supported
> > > - * @pdm_bd: number of bidirectional PDM streams supported
> > > - * @pdm_in: number of input PDM streams supported
> > > - * @pdm_out: number of output PDM streams supported
> > >   */
> > >  struct sdw_cdns_stream_config {
> > >  	unsigned int pcm_bd;
> > >  	unsigned int pcm_in;
> > >  	unsigned int pcm_out;
> > > -	unsigned int pdm_bd;
> > > -	unsigned int pdm_in;
> > > -	unsigned int pdm_out;
> > >  };
> > >
> > >  /**
> > > @@ -111,7 +105,6 @@ struct sdw_cdns_dma_data {
> > >   * @ports: Data ports
> > >   * @num_ports: Total number of data ports
> > >   * @pcm: PCM streams
> > > - * @pdm: PDM streams
> > >   * @registers: Cadence registers
> > >   * @link_up: Link status
> > >   * @msg_count: Messages sent on bus
> > > @@ -129,7 +122,6 @@ struct sdw_cdns {
> > >  	int num_ports;
> > >
> > >  	struct sdw_cdns_streams pcm;
> > > -	struct sdw_cdns_streams pdm;
> > >
> > >  	int pdi_loopback_source;
> > >  	int pdi_loopback_target;
> > > @@ -188,7 +180,7 @@ cdns_xfer_msg_defer(struct sdw_bus *bus,
> > >  int cdns_bus_conf(struct sdw_bus *bus, struct sdw_bus_params
> > *params);
> > >
> > >  int cdns_set_sdw_stream(struct snd_soc_dai *dai,
> > > -			void *stream, bool pcm, int direction);
> > > +			void *stream, int direction);
> > >
> > >  void sdw_cdns_check_self_clearing_bits(struct sdw_cdns *cdns, const
> > char *string,
> > >  				       bool initial_delay, int reset_iterations);
> > > diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> > > index 45ea55a7d0c8..79ba0e3f6dac 100644
> > > --- a/drivers/soundwire/intel.c
> > > +++ b/drivers/soundwire/intel.c
> > > @@ -564,7 +564,7 @@ static void intel_pdi_init(struct sdw_intel *sdw,
> > >  {
> > >  	void __iomem *shim = sdw->link_res->shim;
> > >  	unsigned int link_id = sdw->instance;
> > > -	int pcm_cap, pdm_cap;
> > > +	int pcm_cap;
> > >
> > >  	/* PCM Stream Capability */
> > >  	pcm_cap = intel_readw(shim, SDW_SHIM_PCMSCAP(link_id));
> > > @@ -575,41 +575,25 @@ static void intel_pdi_init(struct sdw_intel *sdw,
> > >
> > >  	dev_dbg(sdw->cdns.dev, "PCM cap bd:%d in:%d out:%d\n",
> > >  		config->pcm_bd, config->pcm_in, config->pcm_out);
> > > -
> > > -	/* PDM Stream Capability */
> > > -	pdm_cap = intel_readw(shim, SDW_SHIM_PDMSCAP(link_id));
> > > -
> > > -	config->pdm_bd = FIELD_GET(SDW_SHIM_PDMSCAP_BSS,
> > pdm_cap);
> > > -	config->pdm_in = FIELD_GET(SDW_SHIM_PDMSCAP_ISS, pdm_cap);
> > > -	config->pdm_out = FIELD_GET(SDW_SHIM_PDMSCAP_OSS,
> > pdm_cap);
> > > -
> > > -	dev_dbg(sdw->cdns.dev, "PDM cap bd:%d in:%d out:%d\n",
> > > -		config->pdm_bd, config->pdm_in, config->pdm_out);
> > >  }
> > >
> > >  static int
> > > -intel_pdi_get_ch_cap(struct sdw_intel *sdw, unsigned int pdi_num, bool
> > pcm)
> > > +intel_pdi_get_ch_cap(struct sdw_intel *sdw, unsigned int pdi_num)
> > >  {
> > >  	void __iomem *shim = sdw->link_res->shim;
> > >  	unsigned int link_id = sdw->instance;
> > >  	int count;
> > >
> > > -	if (pcm) {
> > > -		count = intel_readw(shim, SDW_SHIM_PCMSYCHC(link_id,
> > pdi_num));
> > > +	count = intel_readw(shim, SDW_SHIM_PCMSYCHC(link_id,
> > pdi_num));
> > >
> > > -		/*
> > > -		 * WORKAROUND: on all existing Intel controllers, pdi
> > > -		 * number 2 reports channel count as 1 even though it
> > > -		 * supports 8 channels. Performing hardcoding for pdi
> > > -		 * number 2.
> > > -		 */
> > > -		if (pdi_num == 2)
> > > -			count = 7;
> > > -
> > > -	} else {
> > > -		count = intel_readw(shim, SDW_SHIM_PDMSCAP(link_id));
> > > -		count = FIELD_GET(SDW_SHIM_PDMSCAP_CPSS, count);
> > > -	}
> > > +	/*
> > > +	 * WORKAROUND: on all existing Intel controllers, pdi
> > > +	 * number 2 reports channel count as 1 even though it
> > > +	 * supports 8 channels. Performing hardcoding for pdi
> > > +	 * number 2.
> > > +	 */
> > > +	if (pdi_num == 2)
> > > +		count = 7;
> > >
> > >  	/* zero based values for channel count in register */
> > >  	count++;
> > > @@ -620,12 +604,12 @@ intel_pdi_get_ch_cap(struct sdw_intel *sdw,
> > unsigned int pdi_num, bool pcm)
> > >  static int intel_pdi_get_ch_update(struct sdw_intel *sdw,
> > >  				   struct sdw_cdns_pdi *pdi,
> > >  				   unsigned int num_pdi,
> > > -				   unsigned int *num_ch, bool pcm)
> > > +				   unsigned int *num_ch)
> > >  {
> > >  	int i, ch_count = 0;
> > >
> > >  	for (i = 0; i < num_pdi; i++) {
> > > -		pdi->ch_count = intel_pdi_get_ch_cap(sdw, pdi->num, pcm);
> > > +		pdi->ch_count = intel_pdi_get_ch_cap(sdw, pdi->num);
> > >  		ch_count += pdi->ch_count;
> > >  		pdi++;
> > >  	}
> > > @@ -635,25 +619,23 @@ static int intel_pdi_get_ch_update(struct
> > sdw_intel *sdw,
> > >  }
> > >
> > >  static int intel_pdi_stream_ch_update(struct sdw_intel *sdw,
> > > -				      struct sdw_cdns_streams *stream, bool
> > pcm)
> > > +				      struct sdw_cdns_streams *stream)
> > >  {
> > >  	intel_pdi_get_ch_update(sdw, stream->bd, stream->num_bd,
> > > -				&stream->num_ch_bd, pcm);
> > > +				&stream->num_ch_bd);
> > >
> > >  	intel_pdi_get_ch_update(sdw, stream->in, stream->num_in,
> > > -				&stream->num_ch_in, pcm);
> > > +				&stream->num_ch_in);
> > >
> > >  	intel_pdi_get_ch_update(sdw, stream->out, stream->num_out,
> > > -				&stream->num_ch_out, pcm);
> > > +				&stream->num_ch_out);
> > >
> > >  	return 0;
> > >  }
> > >
> > >  static int intel_pdi_ch_update(struct sdw_intel *sdw)
> > >  {
> > > -	/* First update PCM streams followed by PDM streams */
> > > -	intel_pdi_stream_ch_update(sdw, &sdw->cdns.pcm, true);
> > > -	intel_pdi_stream_ch_update(sdw, &sdw->cdns.pdm, false);
> > > +	intel_pdi_stream_ch_update(sdw, &sdw->cdns.pcm);
> > >
> > >  	return 0;
> > >  }
> > > @@ -840,7 +822,6 @@ static int intel_hw_params(struct
> > snd_pcm_substream *substream,
> > >  	struct sdw_port_config *pconfig;
> > >  	int ch, dir;
> > >  	int ret;
> > > -	bool pcm = true;
> > >
> > >  	dma = snd_soc_dai_get_dma_data(dai, substream);
> > >  	if (!dma)
> > > @@ -852,13 +833,7 @@ static int intel_hw_params(struct
> > snd_pcm_substream *substream,
> > >  	else
> > >  		dir = SDW_DATA_DIR_TX;
> > >
> > > -	if (dma->stream_type == SDW_STREAM_PDM)
> > > -		pcm = false;
> > > -
> > > -	if (pcm)
> > > -		pdi = sdw_cdns_alloc_pdi(cdns, &cdns->pcm, ch, dir, dai->id);
> > > -	else
> > > -		pdi = sdw_cdns_alloc_pdi(cdns, &cdns->pdm, ch, dir, dai->id);
> > > +	pdi = sdw_cdns_alloc_pdi(cdns, &cdns->pcm, ch, dir, dai->id);
> > >
> > >  	if (!pdi) {
> > >  		ret = -EINVAL;
> > > @@ -888,12 +863,7 @@ static int intel_hw_params(struct
> > snd_pcm_substream *substream,
> > >  	sconfig.frame_rate = params_rate(params);
> > >  	sconfig.type = dma->stream_type;
> > >
> > > -	if (dma->stream_type == SDW_STREAM_PDM) {
> > > -		sconfig.frame_rate *= 50;
> > > -		sconfig.bps = 1;
> > > -	} else {
> > > -		sconfig.bps =
> > snd_pcm_format_width(params_format(params));
> > > -	}
> > > +	sconfig.bps = snd_pcm_format_width(params_format(params));
> > >
> > >  	/* Port configuration */
> > >  	pconfig = kzalloc(sizeof(*pconfig), GFP_KERNEL);
> > > @@ -1012,13 +982,7 @@ static void intel_shutdown(struct
> > snd_pcm_substream *substream,
> > >  static int intel_pcm_set_sdw_stream(struct snd_soc_dai *dai,
> > >  				    void *stream, int direction)
> > >  {
> > > -	return cdns_set_sdw_stream(dai, stream, true, direction);
> > > -}
> > > -
> > > -static int intel_pdm_set_sdw_stream(struct snd_soc_dai *dai,
> > > -				    void *stream, int direction)
> > > -{
> > > -	return cdns_set_sdw_stream(dai, stream, false, direction);
> > > +	return cdns_set_sdw_stream(dai, stream, direction);
> > >  }
> > >
> > >  static void *intel_get_sdw_stream(struct snd_soc_dai *dai,
> > > @@ -1133,16 +1097,6 @@ static const struct snd_soc_dai_ops
> > intel_pcm_dai_ops = {
> > >  	.get_stream = intel_get_sdw_stream,
> > >  };
> > >
> > > -static const struct snd_soc_dai_ops intel_pdm_dai_ops = {
> > > -	.startup = intel_startup,
> > > -	.hw_params = intel_hw_params,
> > > -	.prepare = intel_prepare,
> > > -	.hw_free = intel_hw_free,
> > > -	.shutdown = intel_shutdown,
> > > -	.set_sdw_stream = intel_pdm_set_sdw_stream,
> > > -	.get_sdw_stream = intel_get_sdw_stream,
> > > -};
> > > -
> > >  static const struct snd_soc_component_driver dai_component = {
> > >  	.name           = "soundwire",
> > >  	.suspend	= intel_component_dais_suspend
> > > @@ -1151,7 +1105,7 @@ static const struct snd_soc_component_driver
> > dai_component = {
> > >  static int intel_create_dai(struct sdw_cdns *cdns,
> > >  			    struct snd_soc_dai_driver *dais,
> > >  			    enum intel_pdi_type type,
> > > -			    u32 num, u32 off, u32 max_ch, bool pcm)
> > > +			    u32 num, u32 off, u32 max_ch)
> > >  {
> > >  	int i;
> > >
> > > @@ -1180,10 +1134,7 @@ static int intel_create_dai(struct sdw_cdns *cdns,
> > >  			dais[i].capture.formats =
> > SNDRV_PCM_FMTBIT_S16_LE;
> > >  		}
> > >
> > > -		if (pcm)
> > > -			dais[i].ops = &intel_pcm_dai_ops;
> > > -		else
> > > -			dais[i].ops = &intel_pdm_dai_ops;
> > > +		dais[i].ops = &intel_pcm_dai_ops;
> > >  	}
> > >
> > >  	return 0;
> > > @@ -1197,7 +1148,7 @@ static int intel_register_dai(struct sdw_intel *sdw)
> > >  	int num_dai, ret, off = 0;
> > >
> > >  	/* DAIs are created based on total number of PDIs supported */
> > > -	num_dai = cdns->pcm.num_pdi + cdns->pdm.num_pdi;
> > > +	num_dai = cdns->pcm.num_pdi;
> > >
> > >  	dais = devm_kcalloc(cdns->dev, num_dai, sizeof(*dais),
> > GFP_KERNEL);
> > >  	if (!dais)
> > > @@ -1207,39 +1158,19 @@ static int intel_register_dai(struct sdw_intel
> > *sdw)
> > >  	stream = &cdns->pcm;
> > >
> > >  	ret = intel_create_dai(cdns, dais, INTEL_PDI_IN, cdns->pcm.num_in,
> > > -			       off, stream->num_ch_in, true);
> > > +			       off, stream->num_ch_in);
> > >  	if (ret)
> > >  		return ret;
> > >
> > >  	off += cdns->pcm.num_in;
> > >  	ret = intel_create_dai(cdns, dais, INTEL_PDI_OUT, cdns-
> > >pcm.num_out,
> > > -			       off, stream->num_ch_out, true);
> > > +			       off, stream->num_ch_out);
> > >  	if (ret)
> > >  		return ret;
> > >
> > >  	off += cdns->pcm.num_out;
> > >  	ret = intel_create_dai(cdns, dais, INTEL_PDI_BD, cdns->pcm.num_bd,
> > > -			       off, stream->num_ch_bd, true);
> > > -	if (ret)
> > > -		return ret;
> > > -
> > > -	/* Create PDM DAIs */
> > > -	stream = &cdns->pdm;
> > > -	off += cdns->pcm.num_bd;
> > > -	ret = intel_create_dai(cdns, dais, INTEL_PDI_IN, cdns->pdm.num_in,
> > > -			       off, stream->num_ch_in, false);
> > > -	if (ret)
> > > -		return ret;
> > > -
> > > -	off += cdns->pdm.num_in;
> > > -	ret = intel_create_dai(cdns, dais, INTEL_PDI_OUT, cdns-
> > >pdm.num_out,
> > > -			       off, stream->num_ch_out, false);
> > > -	if (ret)
> > > -		return ret;
> > > -
> > > -	off += cdns->pdm.num_out;
> > > -	ret = intel_create_dai(cdns, dais, INTEL_PDI_BD, cdns-
> > >pdm.num_bd,
> > > -			       off, stream->num_ch_bd, false);
> > > +			       off, stream->num_ch_bd);
> > >  	if (ret)
> > >  		return ret;
> > >
> > > --
> > > 2.17.1
> > 
> > --
> > ~Vinod

-- 
~Vinod
