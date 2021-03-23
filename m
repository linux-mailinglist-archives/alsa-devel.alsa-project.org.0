Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8473468FC
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 20:27:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 667481674;
	Tue, 23 Mar 2021 20:26:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 667481674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616527649;
	bh=ekkzg+vqvEJ0+D+B33oKB/oyXNG4B7K8j8IDs9YIJ7k=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vt+0NZMa2L0WTGndOd0YlfYYK1Mr18ePYGy5VJLxBELkW2zElEIwaKvNfHM9sO/XP
	 1ZWoBWDlqnksCte8bCrvJNNvjh9k9z9yTLnMOaYvAlfAPC8BV8UFFjibBT0CF7JIdq
	 hlYwVDCIZ+APPoQZbUjcUfnNHqrhd9AuoUxHIoAo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF810F80268;
	Tue, 23 Mar 2021 20:26:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B83D0F8025F; Tue, 23 Mar 2021 20:26:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9E15F800EE
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 20:25:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9E15F800EE
IronPort-SDR: l54+Wh5NgGy/YxrAb2bEwod6KT8lp7bycBdud6ous/6ggUPrqnjj4Ldr09THVN+t3B8ZRTwWQq
 CyAvrHNI8I4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="169881431"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="169881431"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 12:25:56 -0700
IronPort-SDR: x+OPO9b/i9LEWXEAcRDIffKzth8pec2KbD2O+lB/rSIAU8vRV7XcbNGRVAKiC/eKu+IDyiX4yP
 1UCX/s6h5iOw==
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="452280164"
Received: from laguitie-mobl.amr.corp.intel.com (HELO [10.252.129.185])
 ([10.252.129.185])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 12:25:55 -0700
Subject: Re: [RFC PATCH 0/3] Separate BE DAI HW constraints from FE ones
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20210323114327.3969072-1-codrin.ciubotariu@microchip.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7364fb08-fe43-167d-a083-db4a6234222c@linux.intel.com>
Date: Tue, 23 Mar 2021 14:25:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323114327.3969072-1-codrin.ciubotariu@microchip.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: lgirdwood@gmail.com, broonie@kernel.org, mirq-linux@rere.qmqm.pl,
 gustavoars@kernel.org, tiwai@suse.com
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



On 3/23/21 6:43 AM, Codrin Ciubotariu wrote:
> HW constraints are needed to set limitations for HW parameters used to
> configure the DAIs. All DAIs on the same link must agree upon the HW
> parameters, so the parameters are affected by the DAIs' features and
> their limitations. In case of DPCM, the FE DAIs can be used to perform
> different kind of conversions, such as format or rate changing, bringing
> the audio stream to a configuration supported by all the DAIs of the BE's
> link. For this reason, the limitations of the BE DAIs are not always
> important for the HW parameters between user-space and FE, only for the
> paratemers between FE and BE DAI links. This brings us to this patch-set,
> which aims to separate the FE HW constraints from the BE HW constraints.
> This way, the FE can be used to perform more efficient HW conversions, on
> the initial audio stream parameters, to parameters supported by the BE
> DAIs.
> To achieve this, the first thing needed is to detect whether a HW
> constraint rule is enforced by a FE or a BE DAI. This means that
> snd_pcm_hw_rule_add() needs to be able to differentiate between the two
> type of DAIs. For this, the runtime pointer to struct snd_pcm_runtime is
> replaced with a pointer to struct snd_pcm_substream, to be able to reach
> substream->pcm->internal to differentiate between FE and BE DAIs.
> This change affects many sound drivers (and one gpu drm driver).
> All these changes are included in the first patch, to have a better
> overview of the implications created by this change.
> The second patch adds a new struct snd_pcm_hw_constraints under struct
> snd_soc_dpcm_runtime, which is used to store the HW constraint rules
> added by the BE DAIs. This structure is initialized with a subset of the
> runtime constraint rules which does not include the rules that affect
> the buffer or period size. snd_pcm_hw_rule_add() will add the BE rules
> to the new struct snd_pcm_hw_constraints.
> The third and last patch will apply the BE rule constraints, after the
> fixup callback. If the fixup HW parameters do not respect the BE
> constraint rules, the rules will exit with an error. The FE mask and
> interval constraints are copied to the BE ones, to satisfy the
> dai_link->dpcm_merged_* flags. The dai_link->dpcm_merged_* flags are
> used to know if the FE does format or sampling rate conversion.
> 
> I tested with ad1934 and wm8731 codecs as BEs, with a not-yet-mainlined
> ASRC as FE, that can also do format conversion. I realize that the
> change to snd_pcm_hw_rule_add() has a big impact, even though all the
> drivers use snd_pcm_hw_rule_add() with substream->runtime, so passing
> substream instead of runtime is not that risky.

can you use the BE hw_params_fixup instead?

That's what we use for SOF.

The FE hw_params are propagated to the BE, and then the BE can update 
the hw_params based on its own limitations and pass the result 
downstream, e.g. to a codec.

I'll copy below my understanding of the flow, which we discussed 
recently in the SOF team:

my understanding is that we start with the front-end hw_params as the 
basis for the back-end hw_params.

static int dpcm_fe_dai_hw_params(struct snd_pcm_substream *substream,
                  struct snd_pcm_hw_params *params)
{
     struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(substream);
     int ret, stream = substream->stream;

     mutex_lock_nested(&fe->card->mutex, SND_SOC_CARD_CLASS_RUNTIME);
     dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_FE);

     memcpy(&fe->dpcm[stream].hw_params, params,
             sizeof(struct snd_pcm_hw_params));
     ret = dpcm_be_dai_hw_params(fe, stream);
<<< the BE is handled first.
     if (ret < 0) {
         dev_err(fe->dev,"ASoC: hw_params BE failed %d\n", ret);
         goto out;
     }

     dev_dbg(fe->dev, "ASoC: hw_params FE %s rate %d chan %x fmt %d\n",
             fe->dai_link->name, params_rate(params),
             params_channels(params), params_format(params));

     /* call hw_params on the frontend */
     ret = soc_pcm_hw_params(substream, params);

then each BE will be configured

int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
{
     struct snd_soc_dpcm *dpcm;
     int ret;

     for_each_dpcm_be(fe, stream, dpcm) {

         struct snd_soc_pcm_runtime *be = dpcm->be;
         struct snd_pcm_substream *be_substream =
             snd_soc_dpcm_get_substream(be, stream);

         /* is this op for this BE ? */
         if (!snd_soc_dpcm_be_can_update(fe, be, stream))
             continue;

         /* copy params for each dpcm */
         memcpy(&dpcm->hw_params, &fe->dpcm[stream].hw_params,
                 sizeof(struct snd_pcm_hw_params));

         /* perform any hw_params fixups */
         ret = snd_soc_link_be_hw_params_fixup(be, &dpcm->hw_params);

The fixup is the key, in SOF this is where we are going to look for 
information from the topology.

/* fixup the BE DAI link to match any values from topology */
int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct 
snd_pcm_hw_params *params)
{
     struct snd_interval *rate = hw_param_interval(params,
             SNDRV_PCM_HW_PARAM_RATE);
     struct snd_interval *channels = hw_param_interval(params,
                         SNDRV_PCM_HW_PARAM_CHANNELS);
     struct snd_mask *fmt = hw_param_mask(params, 
SNDRV_PCM_HW_PARAM_FORMAT);
     struct snd_soc_component *component =
         snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
     struct snd_sof_dai *dai =
         snd_sof_find_dai(component, (char *)rtd->dai_link->name);
     struct snd_soc_dpcm *dpcm;

     /* no topology exists for this BE, try a common configuration */
     if (!dai) {
         dev_warn(component->dev,
              "warning: no topology found for BE DAI %s config\n",
              rtd->dai_link->name);

         /*  set 48k, stereo, 16bits by default */
         rate->min = 48000;
         rate->max = 48000;

         channels->min = 2;
         channels->max = 2;

         snd_mask_none(fmt);
         snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);

         return 0;
     }

     /* read format from topology */
     snd_mask_none(fmt);

     switch (dai->comp_dai.config.frame_fmt) {
     case SOF_IPC_FRAME_S16_LE:
         snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
         break;
     case SOF_IPC_FRAME_S24_4LE:
         snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
         break;
     case SOF_IPC_FRAME_S32_LE:
         snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
         break;
     default:
         dev_err(component->dev, "error: No available DAI format!\n");
         return -EINVAL;
     }

     /* read rate and channels from topology */
     switch (dai->dai_config->type) {
     case SOF_DAI_INTEL_SSP:
         rate->min = dai->dai_config->ssp.fsync_rate;
         rate->max = dai->dai_config->ssp.fsync_rate;
         channels->min = dai->dai_config->ssp.tdm_slots;
         channels->max = dai->dai_config->ssp.tdm_slots;
