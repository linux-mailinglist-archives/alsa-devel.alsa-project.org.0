Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D3E9A8FB
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 09:37:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CD041607;
	Fri, 23 Aug 2019 09:36:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CD041607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566545833;
	bh=EzP9fQtlbNfDApD/ke8RO44Nhyc7M2MedtfnxhSTzyw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O+d1sV+sHbTRhtNPT+dh5awPuLezxIADnKSKZ7i/KOFqtCyUBpslqjKcXQijTGDkK
	 MIj/di9mn2dMfcGgKjM4j5cSswJi0z1HsjfTmMud3ZkwEYY/lvBLNkVWqZgKV+oyWd
	 xrngjLhx8y6mDdEckpCWAgFW1JnWYnBF0S6u6wf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E563DF80306;
	Fri, 23 Aug 2019 09:35:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CCC9F80306; Fri, 23 Aug 2019 09:35:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33014F80147
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 09:35:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33014F80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fjW9/aM3"
Received: from localhost (unknown [106.200.210.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3D3D92341F;
 Fri, 23 Aug 2019 07:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566545720;
 bh=bbLkXAsHEX8Wn+grOk4i/1hsz2fjmgUr2Kj6i2J/rPM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fjW9/aM3xPahmihoNOYFcTCads+Zl94leJ6QpWXcOUVLFa10S1tQGTkED3P7dIkqj
 rQhddxY2T9+i6BH9sLI8PEn2wzdOEaie39zoZv3vluGoa6T+360J40QRavFv/Ev9c9
 AxvI7Vu9rG+fQYl3xADrlgvqGBx+bQX3GhKzqmrs=
Date: Fri, 23 Aug 2019 13:04:07 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190823073407.GF2672@vkoul-mobl>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-32-pierre-louis.bossart@linux.intel.com>
 <39318aab-b1b4-2cce-c408-792a5cc343dd@intel.com>
 <ee87d4bb-3f35-eb27-0112-e6e64a09a279@linux.intel.com>
 <20190802172843.GC12733@vkoul-mobl.Dlink>
 <7abdb0e8-b9c4-28c7-d9ed-a7db1574e0b2@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7abdb0e8-b9c4-28c7-d9ed-a7db1574e0b2@linux.intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 31/40] soundwire: intel: move
 shutdown() callback and don't export symbol
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

On 14-08-19, 14:31, Pierre-Louis Bossart wrote:
> =

> =

> > > > > +void intel_shutdown(struct snd_pcm_substream *substream,
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct snd_soc_dai *dai)
> > > > > +{
> > > > > +=A0=A0=A0 struct sdw_cdns_dma_data *dma;
> > > > > +
> > > > > +=A0=A0=A0 dma =3D snd_soc_dai_get_dma_data(dai, substream);
> > > > > +=A0=A0=A0 if (!dma)
> > > > > +=A0=A0=A0=A0=A0=A0=A0 return;
> > > > > +
> > > > > +=A0=A0=A0 snd_soc_dai_set_dma_data(dai, substream, NULL);
> > > > > +=A0=A0=A0 kfree(dma);
> > > > > +}
> > > > =

> > > > Correct me if I'm wrong, but do we really need to _get_dma_ here?
> > > > _set_dma_ seems bulletproof, same for kfree.
> > > =

> > > I must admit I have no idea why we have a reference to DMAs here, thi=
s looks
> > > like an abuse to store a dai-specific context, and the initial test l=
ooks
> > > like copy-paste to detect invalid configs, as done in other callbacks=
. Vinod
> > > and Sanyog might have more history than me here.
> > =

> > I dont see snd_soc_dai_set_dma_data() call for
> > sdw_cdns_dma_data so somthing is missing (at least in upstream code)
> > =

> > IIRC we should have a snd_soc_dai_set_dma_data() in alloc or some
> > initialization routine and we free it here.. Sanyog?
> =

> Vinod, I double-checked that we do not indeed have a call to
> snd_soc_dai_dma_data(), but there is code in cdns_set_stream() that sets =
the
> relevant dai->playback/capture_dma_data, see below
> =

> I am not a big fan of this code, touching the ASoC core internal fields
> isn't a good idea in general.

IIRC as long as you stick to single link I do not see this required. The
question comes into picture when we have multi links as you would need
to allocate a soundwire stream and set that for all the sdw DAIs

So, what is the current model of soundwire stream, which entity allocates
that and do you still care about multi-link? is there any machine driver
with soundwire upstream yet?

> Also not sure why for a DAI we need both _drvdata and _dma_data (especial=
ly

_drvdata is global for driver whereas _dma_data is typically used per
DAI

> for this case where the information stored has absolutely nothing to do w=
ith
> DMAs).
> =

> If the idea was to keep a context that is direction-dependent, that's lik=
ely
> unnecessary. For the Intel/Cadence case the interfaces can be configured =
as
> playback OR capture, not both concurrently, so the "dma" information could
> have been stored in the generic DAI _drvdata.
> =

> I have other things to look into for now but this code will likely need to
> be cleaned-up at some point to remove unnecessary parts.

Sure please go ahead and do the cleanup.
> =

> int cdns_set_sdw_stream(struct snd_soc_dai *dai,
> 			void *stream, bool pcm, int direction)
> {
> 	struct sdw_cdns *cdns =3D snd_soc_dai_get_drvdata(dai);
> 	struct sdw_cdns_dma_data *dma;
> =

> 	dma =3D kzalloc(sizeof(*dma), GFP_KERNEL);
> 	if (!dma)
> 		return -ENOMEM;
> =

> 	if (pcm)
> 		dma->stream_type =3D SDW_STREAM_PCM;
> 	else
> 		dma->stream_type =3D SDW_STREAM_PDM;
> =

> 	dma->bus =3D &cdns->bus;
> 	dma->link_id =3D cdns->instance;
> =

> 	dma->stream =3D stream;
> =

> >>> this is equivalent to snd_soc_dai_dma_data()
> =

> 	if (direction =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
> 		dai->playback_dma_data =3D dma;
> 	else
> 		dai->capture_dma_data =3D dma;
> <<<<
> 	return 0;
> }
> EXPORT_SYMBOL(cdns_set_sdw_stream);

-- =

~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
