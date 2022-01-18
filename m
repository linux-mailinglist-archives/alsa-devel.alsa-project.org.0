Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C5B492CE6
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jan 2022 19:01:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 767A62DEB;
	Tue, 18 Jan 2022 19:00:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 767A62DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642528866;
	bh=M0DmP3O3wGjwaTSVa4WjDEC8n8hjaz2nXEl+u4eOdMo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eChSVvZTFXumuURZ2Js9aGtLFTEw/NmiAkypc0KRazKa1UQsC9nBrg9Wd3asvx4Cy
	 8TlQJDA2O6IOiGAvgUmSUC2bpWdGDYQ4cXJBUm3gBEpAPGOltoSU/+h4zTsZWnnANf
	 OhyymGxQ66rpMGX6lwKsJKC6bEcglPvl5fiFGKYE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8608F800D8;
	Tue, 18 Jan 2022 19:00:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D721BF800D8; Tue, 18 Jan 2022 18:59:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB406F800D8
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 18:59:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB406F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YnOSAqTE"
Received: by mail-wm1-x32e.google.com with SMTP id v123so29527380wme.2
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 09:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4NNb0iIvZBgGyZQ4UOGRTomYdHNCz/kJcx5v8bWpRIE=;
 b=YnOSAqTE/k+dKD+eCBKsQqpyCz6FWqm/6qUnScINkpLr/olE6LbtfBSnGaIBak++fe
 6Aq3juSfmV9rjd/qhrPHAp+80r/9ltZ3byANKVGBpyIno3gTGF1AxvoUogboc0TVP4bJ
 XL19UT47yU4iRbZBGXKDCgcA3mskKukNZF0mVp9X65O7oUw1lwWy67X8QU41J3I2ted9
 NEAzpClayKAtPGJkKow+/O9l/jCD2KnTdVjydy9QVkW8bc9/nDBKSYcR3X0TKw8f2JX/
 CU5iY7OKoTCd5kjtWlv/r92+JlKaVpdsuSQtJO/AkZ3kxNYbhV6nQKcBk4ymPtdq3wUC
 y8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4NNb0iIvZBgGyZQ4UOGRTomYdHNCz/kJcx5v8bWpRIE=;
 b=42+6v0VUaYQDHgfQwFI6kL7hZkmfS2YvJnr2R4fvLf2h/Ej+m5CPkae3h9f2rIKEK/
 pz8sBcRadppZ6SIm2/eSe/m3IPCGHpb9pAHW7z6pWsPG/nlqaaQSFud+Wvk8ToJHTiXS
 czgkNsuKdfBybg/ecdwSC0lfdZ8jxcePSwHzReUZJs6Ya2s/4SaR5mvXZEiw8Q3z7dMx
 AiwsuN3sCLmt70kbR0yxdLDh5/WvyXimoCjKm4nSyJgj8rBLlejMbbUoMMmtkMABCBxd
 Z/nQmgbJ5M0+FfDhsLEBsIH/xr3CJF8qS2lfn+KSFX5sraSVDLH3WWOk6ttXKzsXg+go
 ICuQ==
X-Gm-Message-State: AOAM531XEszE94k+SD9pkYHR231tfeZ21nb+JiHF5MO5H4A7pdR+QBZQ
 FxS6pWw0pK/rprVjuv/xKhLBwYWhyXPCv2/jFJ8=
X-Google-Smtp-Source: ABdhPJx8nfmvZPRwW8qJMS4nMvvBthcZW9GL5M0SrVXLSQ0BrwQ9gFiQoujOW6gPj79Orkntp2Eur2pSBFnUaOFrvnQ=
X-Received: by 2002:a05:600c:3d12:: with SMTP id
 bh18mr15919791wmb.177.1642528787353; 
 Tue, 18 Jan 2022 09:59:47 -0800 (PST)
MIME-Version: 1.0
References: <20220113161341.371345-1-daniel.baluta@oss.nxp.com>
 <d7e63f52-a98e-0c99-906b-6c03b25da572@intel.com>
In-Reply-To: <d7e63f52-a98e-0c99-906b-6c03b25da572@intel.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 18 Jan 2022 19:59:35 +0200
Message-ID: <CAEnQRZA0YLFQWgPfwF2VPEPUYcLFXtUU88MozgbN_aqtodGnMA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: compr: Add compress ops implementation
To: Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
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

On Sat, Jan 15, 2022 at 12:43 AM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 2022-01-13 5:13 PM, Daniel Baluta wrote:
> > From: Daniel Baluta <daniel.baluta@nxp.com>
> >
> > Implement snd_compress_ops. There are a lot of similarities with
> > PCM implementation.
> >
> > For now we use sof_ipc_pcm_params to transfer compress parameters to SOF
> > firmware.
> >
> > This will be changed in the future once we either add new compress
> > parameters to SOF or enhance existing sof_ipc_pcm_params structure
> > to support all native compress params.
> >
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>
> ...
>
> > +static int create_page_table(struct snd_soc_component *component,
> > +                          struct snd_compr_stream *cstream,
> > +                          unsigned char *dma_area, size_t size)
> > +{
> > +     struct snd_soc_pcm_runtime *rtd = cstream->private_data;
> > +     struct snd_dma_buffer *dmab = cstream->runtime->dma_buffer_p;
> > +     int dir = cstream->direction;
> > +     struct snd_sof_pcm *spcm;
>
> The layout of this declaration block is weird - it's neither a
> reversed-christmas-tree nor higher->lower complexity (e.g. structs ->
> primitives). Could you explain why it is shaped as is?

You are right, never put too much thought for this. Looking at SOF anyhow,
it doesn't seem that all kind of styles are used including just random order.

Will fix it :).

>
> > +
> > +     spcm = snd_sof_find_spcm_dai(component, rtd);
> > +     if (!spcm)
> > +             return -EINVAL;
> > +
> > +     return snd_sof_create_page_table(component->dev, dmab,
> > +                                      spcm->stream[dir].page_table.area, size);
> > +}
> > +
> > +int sof_compr_open(struct snd_soc_component *component,
> > +                struct snd_compr_stream *cstream)
> > +{
> > +     struct snd_soc_pcm_runtime *rtd = cstream->private_data;
> > +     struct snd_compr_runtime *runtime = cstream->runtime;
>
> Making use of 'rtd' and 'runtime' simultaneously within a function make
> it less readable.

I see. I will use rtd for snd_soc_pcm_runtime as usual and crtd for
snd_compr_runtime.
Naming is hard.

>
> > +     struct sof_compr_stream *sstream;
> > +     struct snd_sof_pcm *spcm;
> > +     int dir;
> > +
> > +     sstream = kzalloc(sizeof(*sstream), GFP_KERNEL);
> > +     if (!sstream)
> > +             return -ENOMEM;
> > +
> > +     spcm = snd_sof_find_spcm_dai(component, rtd);
> > +     if (!spcm) {
> > +             kfree(sstream);
> > +             return -EINVAL;
> > +     }
> > +
> > +     dir = cstream->direction;
> > +
> > +     if (spcm->stream[dir].cstream) {
> > +             kfree(sstream);
> > +             return -EBUSY;
> > +     }
>
> Could you explain why this check is needed? i.e. Is is possible for
> compress stream to be opened "twice"?

This is needed because compress upper layers do not forbid opening the
device twice
but also it doesn't make much sense to open it twice.

So, I just have exclusive access to Compr device and the rest of the
calls to return
-EBUSY.

Same approach as in sound/soc/uniphier/aio-compress.c
>
> > +
> > +     spcm->stream[dir].cstream = cstream;
> > +     spcm->stream[dir].posn.host_posn = 0;
> > +     spcm->stream[dir].posn.dai_posn = 0;
> > +     spcm->prepared[dir] = false;
> > +
> > +     runtime->private_data = sstream;
> > +
> > +     return 0;
> > +}
> > +
> > +int sof_compr_free(struct snd_soc_component *component,
> > +                struct snd_compr_stream *cstream)
> > +{
> > +     struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
> > +     struct snd_soc_pcm_runtime *rtd = cstream->private_data;
> > +     struct snd_compr_runtime *runtime = cstream->runtime;
>
> Ditto.

Thanks. Will fix.

>
> > +     struct sof_compr_stream *sstream = runtime->private_data;
> > +     struct sof_ipc_stream stream;
> > +     struct sof_ipc_reply reply;
> > +     struct snd_sof_pcm *spcm;
> > +     int ret = 0;
> > +
> > +     spcm = snd_sof_find_spcm_dai(component, rtd);
> > +     if (!spcm)
> > +             return -EINVAL;
> > +
> > +     stream.hdr.size = sizeof(stream);
> > +     stream.hdr.cmd = SOF_IPC_GLB_STREAM_MSG | SOF_IPC_STREAM_PCM_FREE;
> > +     stream.comp_id = spcm->stream[cstream->direction].comp_id;
> > +
> > +     if (spcm->prepared[cstream->direction]) {
> > +             ret = sof_ipc_tx_message(sdev->ipc, stream.hdr.cmd,
> > +                                      &stream, sizeof(stream),
> > +                                      &reply, sizeof(reply));
> > +             if (!ret)
> > +                     spcm->prepared[cstream->direction] = false;
>
> Why is the assignment conditional? If IPC fails, is the ->prepared flag
> respected and addressed later on? It does not seem to happen here.
>

If this call fails it mean that freeing the pipeline has failed and we
return an error
to the upper layer.

I dont think it makes sense to mark the stream as freed (prepared =
false) if the IPC has failed
we just return an error to the upper layers.

I'm not sure if we can do anything useful with respect to failures in
sof_compr_free other then
report it to upper layers and keep internal error.

If the upper layers decide to call again compr_open() the prepare will
be set at that point to false.

> > +     }
> > +
> > +     cancel_work_sync(&spcm->stream[cstream->direction].period_elapsed_work);
> > +     spcm->stream[cstream->direction].cstream = NULL;
> > +     kfree(sstream);
> > +
> > +     return ret;
> > +}
> > +
> > +int sof_compr_set_params(struct snd_soc_component *component,
> > +                      struct snd_compr_stream *cstream, struct snd_compr_params *params)
> > +{
> > +     struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
> > +     struct snd_soc_pcm_runtime *rtd_pcm = cstream->private_data;
> > +     struct snd_compr_runtime *rtd = cstream->runtime;
> > +     struct sof_compr_stream *sstream = rtd->private_data;
> > +     struct sof_ipc_pcm_params_reply ipc_params_reply;
> > +     struct sof_ipc_pcm_params pcm;
> > +     struct snd_sof_pcm *spcm;
> > +     int ret;
> > +
> > +     spcm = snd_sof_find_spcm_dai(component, rtd_pcm);
> > +     if (!spcm)
> > +             return -EINVAL;
> > +
> > +     cstream->dma_buffer.dev.type = SNDRV_DMA_TYPE_DEV_SG;
> > +     cstream->dma_buffer.dev.dev = sdev->dev;
> > +     ret = snd_compr_malloc_pages(cstream, rtd->buffer_size);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     create_page_table(component, cstream, rtd->dma_area, rtd->dma_bytes);
>
> Shouldn't the result of create_page_table() be tested before moving on?

You are right. Will fix.

>
>
> ...
>
> > +int sof_compr_trigger(struct snd_soc_component *component,
> > +                   struct snd_compr_stream *cstream, int cmd)
> > +{
> > +     struct sof_ipc_stream stream;
> > +     struct sof_ipc_reply reply;
> > +     struct snd_soc_pcm_runtime *rtd = cstream->private_data;
> > +     struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
> > +     struct snd_sof_pcm *spcm;
>
> Similarly to create_page_table() case, layout of this declaration block
> is weird. Perhaps I'm just unaware of the convention used within this
> directory.

True. I just added the fields at random points while they were used. If you look
at the sof directory this happens all over the place.

>
>
> ...
>
> > +static int sof_compr_pointer(struct snd_soc_component *component,
> > +                          struct snd_compr_stream *cstream,
> > +                          struct snd_compr_tstamp *tstamp)
> > +{
> > +     struct snd_compr_runtime *runtime = cstream->runtime;
> > +     struct sof_compr_stream *sstream = runtime->private_data;
>
> I'd suggest declaring single local variable instead. The 'runtime' one
> is unused except for the initial 'sstream' assignemnt.

Will do.
>
> > +
> > +     tstamp->sampling_rate = sstream->sample_rate;
> > +     tstamp->copied_total = sstream->copied_total;
> > +
> > +     return 0;
> > +}
>
> ...
>
> > diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
> > index 087935192ce8..d001a762a866 100644
> > --- a/sound/soc/sof/sof-priv.h
> > +++ b/sound/soc/sof/sof-priv.h
> > @@ -108,6 +108,12 @@ enum sof_debugfs_access_type {
> >       SOF_DEBUGFS_ACCESS_D0_ONLY,
> >   };
> >
> > +struct sof_compr_stream {
> > +     unsigned int copied_total;
> > +     unsigned int sample_rate;
> > +     size_t posn_offset;
> > +};
>
> Some streaming-related PCM structs follow snd_sof_xxx naming pattern
> instead, e.g.: snd_sof_pcm. Is the naming convention for compress
> streams seen here intentional?

Hmm, again naming is hard. I will think about it.
>
> > +
> >   struct snd_sof_dev;
> >   struct snd_sof_ipc_msg;
> >   struct snd_sof_ipc;
> >
