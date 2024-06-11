Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACD2902DBB
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2024 02:46:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2A20829;
	Tue, 11 Jun 2024 02:46:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2A20829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718066808;
	bh=dhKRHtF4SgAN+8QKhbvAqBOVF8bJZ+pKcc9susdjNyc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hOsIHt3XlL9x9xA28+CKS1uWD/jNeelqiT+K7zM2Xu6P3uHwcUtV7x3uLq0LRflnM
	 BFtamFFxq1bnvZTM0ELyRGplXBgAx/9UhsarYWDergqm2WTWzZaIqU2hhDdHWDsVSK
	 RlBthDtD4kd7ag6W1iMhWT6Yg2SiyPCsTfVRif3I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EAF0F805B6; Tue, 11 Jun 2024 02:46:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3A60F8010C;
	Tue, 11 Jun 2024 02:46:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB6B0F8057A; Tue, 11 Jun 2024 02:46:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11659F8010C
	for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2024 02:46:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11659F8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=metafoo.de header.i=@metafoo.de header.a=rsa-sha256
 header.s=default2002 header.b=XhB5QTbi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
	s=default2002; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=jWkaSxfNx+pzsfSK1fY94WQ4Jtn8QLkhhm2QngdCkpA=; b=XhB5QTbiDTZ0gTP04i5yOGIXAj
	14BvTDKEOtr0ApCPNT/sfFqCixnn8O9csTMMUXe2pQy1YADBClpCkgjyF/RnF46cVMgNg6++tfIqH
	JlorxJ5baLZ05f3TI+akEBTuq46ojoty1UE+HJC2IMglqjvNFP/tgT96+rj7yfM6u0EQj7B7Qjye0
	dRvx7PwFExfMuR4ccyJn56ugKioQwRhfbFZZ9I6K2DLpN0S+C6y2RynWEURzdyL3FYpALb/Ee1gVM
	XjCJcJOIa0S7qXed0Gzm3e1HHZuNuETOMMCSN6aJaFPfHWyMq9DOfAlncGXNfz8Wn50drVwX9mbfK
	rzY/EU8A==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <lars@metafoo.de>)
	id 1sGpe8-000MIq-UQ; Tue, 11 Jun 2024 02:45:56 +0200
Received: from [136.25.87.181] (helo=[192.168.86.26])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls
 TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <lars@metafoo.de>)
	id 1sGpe8-000ME2-2Z;
	Tue, 11 Jun 2024 02:45:56 +0200
Message-ID: <3557bd0f-86b4-4dce-90dd-59303f4f1154@metafoo.de>
Date: Mon, 10 Jun 2024 17:45:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] ALSA: dmaengine: Synchronize dma channel in
 prepare()
To: Jai Luthra <j-luthra@ti.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Devarsh Thakkar <devarsht@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>
References: <20240610-asoc_next-v2-0-b52aaf5d67c4@ti.com>
 <20240610-asoc_next-v2-1-b52aaf5d67c4@ti.com>
Content-Language: en-US
From: Lars-Peter Clausen <lars@metafoo.de>
In-Reply-To: <20240610-asoc_next-v2-1-b52aaf5d67c4@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.10/27302/Mon Jun 10 10:25:43 2024)
Message-ID-Hash: PFAVQ2AU3GLD2RZPQQ7QMIQ4PS6AO7L6
X-Message-ID-Hash: PFAVQ2AU3GLD2RZPQQ7QMIQ4PS6AO7L6
X-MailFrom: lars@metafoo.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PFAVQ2AU3GLD2RZPQQ7QMIQ4PS6AO7L6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 6/10/24 03:56, Jai Luthra wrote:
> Sometimes the stream may be stopped due to XRUN events, in which case
> the userspace can call snd_pcm_drop() and snd_pcm_prepare() to stop and
> start the stream again.
>
> In these cases, we must wait for the DMA channel to synchronize before
> marking the stream as prepared for playback, as the DMA channel gets
> stopped by snd_pcm_drop() without any synchronization.


We should really implement the sync_stop() PCM callback and let the ALSA 
core let care of the sync.


> Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---
>   include/sound/dmaengine_pcm.h         |  1 +
>   sound/core/pcm_dmaengine.c            | 10 ++++++++++
>   sound/soc/soc-generic-dmaengine-pcm.c |  8 ++++++++
>   3 files changed, 19 insertions(+)
>
> diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
> index c11aaf8079fb..9c5800e5659f 100644
> --- a/include/sound/dmaengine_pcm.h
> +++ b/include/sound/dmaengine_pcm.h
> @@ -36,6 +36,7 @@ snd_pcm_uframes_t snd_dmaengine_pcm_pointer_no_residue(struct snd_pcm_substream
>   int snd_dmaengine_pcm_open(struct snd_pcm_substream *substream,
>   	struct dma_chan *chan);
>   int snd_dmaengine_pcm_close(struct snd_pcm_substream *substream);
> +int snd_dmaengine_pcm_prepare(struct snd_pcm_substream *substream);
>   
>   int snd_dmaengine_pcm_open_request_chan(struct snd_pcm_substream *substream,
>   	dma_filter_fn filter_fn, void *filter_data);
> diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
> index 12aa1cef11a1..dbf5c6136d68 100644
> --- a/sound/core/pcm_dmaengine.c
> +++ b/sound/core/pcm_dmaengine.c
> @@ -349,6 +349,16 @@ int snd_dmaengine_pcm_open_request_chan(struct snd_pcm_substream *substream,
>   }
>   EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_open_request_chan);
>   
> +int snd_dmaengine_pcm_prepare(struct snd_pcm_substream *substream)
> +{
> +	struct dmaengine_pcm_runtime_data *prtd = substream_to_prtd(substream);
> +
> +	dmaengine_synchronize(prtd->dma_chan);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_prepare);
> +
>   /**
>    * snd_dmaengine_pcm_close - Close a dmaengine based PCM substream
>    * @substream: PCM substream
> diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
> index ea3bc9318412..078fcb0ba8a2 100644
> --- a/sound/soc/soc-generic-dmaengine-pcm.c
> +++ b/sound/soc/soc-generic-dmaengine-pcm.c
> @@ -318,6 +318,12 @@ static int dmaengine_copy(struct snd_soc_component *component,
>   	return 0;
>   }
>   
> +static int dmaengine_pcm_prepare(struct snd_soc_component *component,
> +				 struct snd_pcm_substream *substream)
> +{
> +	return snd_dmaengine_pcm_prepare(substream);
> +}
> +
>   static const struct snd_soc_component_driver dmaengine_pcm_component = {
>   	.name		= SND_DMAENGINE_PCM_DRV_NAME,
>   	.probe_order	= SND_SOC_COMP_ORDER_LATE,
> @@ -327,6 +333,7 @@ static const struct snd_soc_component_driver dmaengine_pcm_component = {
>   	.trigger	= dmaengine_pcm_trigger,
>   	.pointer	= dmaengine_pcm_pointer,
>   	.pcm_construct	= dmaengine_pcm_new,
> +	.prepare	= dmaengine_pcm_prepare,
>   };
>   
>   static const struct snd_soc_component_driver dmaengine_pcm_component_process = {
> @@ -339,6 +346,7 @@ static const struct snd_soc_component_driver dmaengine_pcm_component_process = {
>   	.pointer	= dmaengine_pcm_pointer,
>   	.copy		= dmaengine_copy,
>   	.pcm_construct	= dmaengine_pcm_new,
> +	.prepare	= dmaengine_pcm_prepare,
>   };
>   
>   static const char * const dmaengine_pcm_dma_channel_names[] = {
>

