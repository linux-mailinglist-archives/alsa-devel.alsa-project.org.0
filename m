Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E519B18BF57
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 19:26:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C1631795;
	Thu, 19 Mar 2020 19:25:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C1631795
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584642370;
	bh=mr8DhTpfO1dFum79Ou2VVlUjMOxXA0D7RZV/s+fS5kA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ut1nTl3qTmQlzUnpApxh3KmdjQhqMkXLc0kBtUKJHZl5LcmxqVj7uqZEPKBHr9RfY
	 c4bvAIPMoOrmysLoep6mp0XHoPEV5bCpm8PoFM+5ygQYohDipTL6gpsXxFHFsfffC3
	 io/b199iQF6DDGBrl7inqP9eOt3Ykenk/5qsfUO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47E09F800C0;
	Thu, 19 Mar 2020 19:24:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E779F8022B; Thu, 19 Mar 2020 19:24:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from isilmar-4.linta.de (isilmar-4.linta.de [136.243.71.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA534F800C0
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 19:24:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA534F800C0
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
Received: from light.dominikbrodowski.net (brodo.linta [10.1.0.102])
 by isilmar-4.linta.de (Postfix) with ESMTPSA id 5249E200ACD;
 Thu, 19 Mar 2020 18:24:22 +0000 (UTC)
Received: by light.dominikbrodowski.net (Postfix, from userid 1000)
 id 3077D20578; Thu, 19 Mar 2020 19:24:13 +0100 (CET)
Date: Thu, 19 Mar 2020 19:24:13 +0100
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: snd_hda_intel/sst-acpi sound breakage on suspend/resume since
 5.6-rc1
Message-ID: <20200319182413.GA3968@light.dominikbrodowski.net>
References: <e49eec28-2037-f5db-e75b-9eadf6180d81@intel.com>
 <20200318192213.GA2987@light.dominikbrodowski.net>
 <b352a46b-8a66-8235-3622-23e561d3728c@intel.com>
 <20200318215218.GA2439@light.dominikbrodowski.net>
 <e7f4f38d-b53e-8c69-8b23-454718cf92af@intel.com>
 <20200319130049.GA2244@light.dominikbrodowski.net>
 <20200319134139.GB3983@sirena.org.uk>
 <a01359dc-479e-b3e3-37a6-4a9c421d18da@intel.com>
 <20200319165157.GA2254@light.dominikbrodowski.net>
 <a7bf2aee-78e7-f905-bcc3-cd21bf16a976@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7bf2aee-78e7-f905-bcc3-cd21bf16a976@intel.com>
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 curtis@malainey.com, tiwai@suse.com, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 Mark Brown <broonie@kernel.org>
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

On Thu, Mar 19, 2020 at 06:33:50PM +0100, Cezary Rojewski wrote:
> On 2020-03-19 17:51, Dominik Brodowski wrote:
> > On Thu, Mar 19, 2020 at 04:48:03PM +0100, Cezary Rojewski wrote:
> > > On 2020-03-19 14:41, Mark Brown wrote:
> > > > On Thu, Mar 19, 2020 at 02:00:49PM +0100, Dominik Brodowski wrote:
> > > > 
> > > > > Have some good news now, namely that a bisect is complete: That pointed to
> > > > > 1272063a7ee4 ("ASoC: soc-core: care .ignore_suspend for Component suspend");
> > > > > therefore I've added Kuninori Morimoto to this e-mail thread.
> > > > 
> > > > If that's an issue it feels more like a driver bug in that if the driver
> > > > asked for ignore_suspend then it should expect not to have the suspend
> > > > callback called.
> > > > 
> > > 
> > > Requested for tests with following diff applied:
> > > 
> > > diff --git a/sound/soc/intel/boards/broadwell.c
> > > b/sound/soc/intel/boards/broadwell.c
> > > index db7e1e87156d..6ed4c1b0a515 100644
> > > --- a/sound/soc/intel/boards/broadwell.c
> > > +++ b/sound/soc/intel/boards/broadwell.c
> > > @@ -212,7 +212,6 @@ static struct snd_soc_dai_link broadwell_rt286_dais[] =
> > > {
> > >                  .init = broadwell_rt286_codec_init,
> > >                  .dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
> > >                          SND_SOC_DAIFMT_CBS_CFS,
> > > -               .ignore_suspend = 1,
> > >                  .ignore_pmdown_time = 1,
> > >                  .be_hw_params_fixup = broadwell_ssp0_fixup,
> > >                  .ops = &broadwell_rt286_ops,
> > 
> > That patch fixes the issue(s). I didn't even need to revert 64df6afa0dab
> > ("ASoC: Intel: broadwell: change cpu_dai and platform components for SOF")
> > on top of that. But you can assess better whether that patch needs care for
> > other reasons; for me, this one-liner you have suggested is perfect.
> > 
> > Many thanks -- it's been a pleasure to work with you on tracking this issue
> > down.
> > 
> > 	Dominik
> > 
> 
> Thank you for being so cooperative during this 2day debug session.
> 
> The patch I mentioned earlier unintentionally (?) changed 'platform'
> component param for ssp0_port from 'dummy' to 'platform' for non-SOF
> solution:
> 
> diff --git a/sound/soc/intel/boards/broadwell.c
> b/sound/soc/intel/boards/broadwell.c
> index b9c12e24c70b..db7e1e87156d 100644
> --- a/sound/soc/intel/boards/broadwell.c
> +++ b/sound/soc/intel/boards/broadwell.c
> @@ -164,14 +164,6 @@ SND_SOC_DAILINK_DEF(platform,
>  SND_SOC_DAILINK_DEF(codec,
>         DAILINK_COMP_ARRAY(COMP_CODEC("i2c-INT343A:00", "rt286-aif1")));
> 
> -#if IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
> -SND_SOC_DAILINK_DEF(ssp0_port,
> -           DAILINK_COMP_ARRAY(COMP_CPU("ssp0-port")));
> -#else
> -SND_SOC_DAILINK_DEF(ssp0_port,
> -           DAILINK_COMP_ARRAY(COMP_DUMMY()));
> -#endif
> -
>  /* broadwell digital audio interface glue - connects codec <--> CPU */
>  static struct snd_soc_dai_link broadwell_rt286_dais[] = {
>         /* Front End DAI links */
> @@ -226,7 +218,7 @@ static struct snd_soc_dai_link broadwell_rt286_dais[] =
> {
>                 .ops = &broadwell_rt286_ops,
>                 .dpcm_playback = 1,
>                 .dpcm_capture = 1,
> -               SND_SOC_DAILINK_REG(ssp0_port, codec, platform),
> +               SND_SOC_DAILINK_REG(dummy, codec, dummy),
>         },
> 
> 
> Said change causes following to occur:
> 
> 
> (stream start)
> [  113.251950] haswell-pcm-audio haswell-pcm-audio: tx: 0x0000000003000000
> size: 77
> [  113.252090] haswell-pcm-audio haswell-pcm-audio: > rx: 0x0000000043000000
> size: 48
> [  113.252097] haswell-pcm-audio haswell-pcm-audio: tx: 0x0000000006301000
> size: 20
> [  113.252147] haswell-pcm-audio haswell-pcm-audio: tx: 0x0000000006301000
> size: 20
> [  113.252179] haswell-pcm-audio haswell-pcm-audio: tx: 0x0000000006100000
> size: 0
> [  113.252219] snd_soc_core:dpcm_fe_dai_hw_params:  System PCM: ASoC:
> hw_params FE System PCM rate 48000 chan 2 fmt 2
> [  113.252229] snd_soc_core:dapm_update_dai_unlocked: haswell-pcm-audio
> haswell-pcm-audio: Update DAI routes for System Pin playback
> [  113.252236] haswell-pcm-audio haswell-pcm-audio: tx: 0x0000000006000000
> size: 0
> [  113.252304] haswell-pcm-audio haswell-pcm-audio: tx: 0x0000000004000000
> size: 4
> [  113.252425] snd_soc_sst_haswell_pcm:create_adsp_page_table:  System PCM:
> generating page table for 00000000a8c2b8a6 size 0x17700 pages 24
> 
> 
> (In essence these tx'es denote sequence for stream initialization while the
> last two for stream RESET (0x6000000) and FREE (0x4000000))
> 
> and that is only to recreate the stream once again:
> 
> 
> [  113.252673] haswell-pcm-audio haswell-pcm-audio: tx: 0x0000000003000000
> size: 77
> [  113.252803] haswell-pcm-audio haswell-pcm-audio: > rx: 0x0000000043000000
> size: 48
> [  113.252810] haswell-pcm-audio haswell-pcm-audio: tx: 0x0000000006301000
> size: 20
> [  113.252864] haswell-pcm-audio haswell-pcm-audio: tx: 0x0000000006301000
> size: 20
> [  113.252900] haswell-pcm-audio haswell-pcm-audio: tx: 0x0000000006100000
> size: 0
> [  113.252987] snd_soc_core:dpcm_fe_dai_prepare:  System PCM: ASoC: prepare
> FE System PCM
> [  113.252993] snd_soc_core:dpcm_be_dai_prepare:  Codec: ASoC: prepare BE
> Codec
> [  113.253028] snd_soc_core:dpcm_dapm_stream_event:  Codec: ASoC: BE Codec
> event 1 dir 0
> [  113.254962] snd_soc_core:dpcm_do_trigger:  Codec: ASoC: trigger BE Codec
> cmd 1
> 
> 
> Because of that we ended up in _reset and _free being called twice:
> 
> 
> [  113.254969] haswell-pcm-audio haswell-pcm-audio: tx: 0x0000000006200000
> size: 0
> [  113.254980] snd_soc_core:dpcm_dai_trigger_fe_be:  System PCM: ASoC: post
> trigger FE System PCM cmd 1
> [  113.254983] haswell-pcm-audio haswell-pcm-audio: tx: 0x0000000006200000
> size: 0
> [  113.254996] snd_soc_sst_ipc:ipc_tx_msgs: haswell-pcm-audio
> haswell-pcm-audio: ipc_tx_msgs dsp busy
> [  118.486291]  System PCM: ASoC: trigger FE cmd: 7 failed: -22
> [  118.486431] snd_soc_core:dpcm_dai_trigger_fe_be:  System PCM: ASoC: pre
> trigger FE System PCM cmd 0
> [  118.486464] haswell-pcm-audio haswell-pcm-audio: tx: 0x0000000006100000
> size: 0
> [  118.486495] snd_soc_core:dpcm_do_trigger:  Codec: ASoC: trigger BE Codec
> cmd 0
> [  118.486514] haswell-pcm-audio haswell-pcm-audio: tx: 0x0000000006100000
> size: 0
> [  118.486550] snd_soc_core:dpcm_fe_dai_hw_free:  System PCM: ASoC: hw_free
> FE System PCM
> [  118.486569] snd_soc_core:dpcm_be_dai_hw_free:  Codec: ASoC: hw_free BE
> Codec
> [  118.486719] snd_soc_core:dpcm_fe_dai_hw_free:  System PCM: ASoC: hw_free
> FE System PCM
> [  118.486734] snd_soc_core:dpcm_be_dai_hw_free:  Codec: ASoC: hw_free BE
> Codec
> [  118.486751] snd_soc_core:dpcm_be_dai_shutdown:  Codec: ASoC: close BE
> Codec
> [  118.486801] snd_soc_sst_ipc:ipc_tx_msgs: haswell-pcm-audio
> haswell-pcm-audio: ipc_tx_msgs dsp busy
> [  118.489279] haswell-pcm-audio haswell-pcm-audio: tx: 0x0000000006000000
> size: 0
> [  118.489382] haswell-pcm-audio haswell-pcm-audio: tx: 0x0000000004000000
> size: 4
> [  118.489535] snd_soc_core:dpcm_fe_dai_shutdown:  System PCM: ASoC: close
> FE System PCM
> [  118.489547] haswell-pcm-audio haswell-pcm-audio: warning: stream is NULL,
> no stream to reset, ignore it.
> [  118.489553] haswell-pcm-audio haswell-pcm-audio: warning: stream is NULL,
> no stream to free, ignore it.
> [  118.489571] snd_soc_core:dpcm_be_disconnect:  System PCM: ASoC: BE
> playback disconnect check for Codec
> [  118.489580] snd_soc_core:dpcm_be_disconnect:  System PCM: freed DSP
> playback path System PCM -> Codec
> 
> 
> Could you confirm the same happens on your machine when revert of mentioned
> patch is not applied ("stream is NULL" messages occur)? Issue may be
> harmless but explained sequence does not look right.

Indeed, I still see

haswell-pcm-audio haswell-pcm-audio: warning: stream is NULL, no stream to reset, ignore it.
haswell-pcm-audio haswell-pcm-audio: warning: stream is NULL, no stream to free, ignore it.
haswell-pcm-audio haswell-pcm-audio: FW loaded, mailbox readback FW info: type 01, - version: 00.00, build 77, source commit id: 876ac6906f31a43b6772b23c7c983ce9dcb18a19
haswell-pcm-audio haswell-pcm-audio: warning: stream is NULL, no stream to reset, ignore it.
haswell-pcm-audio haswell-pcm-audio: warning: stream is NULL, no stream to free, ignore it.

though sounds continues to work.

Thanks again,
	Dominik
