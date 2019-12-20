Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF0A127EDD
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 15:58:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71A3E1673;
	Fri, 20 Dec 2019 15:58:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71A3E1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576853930;
	bh=sDLDeOTJUDuj3tKqj66qMmWLpARTlBmskdEb/tZ+wLg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jnV+pP6APTyEnvfW2EV5Vf4dONM57bryFOXi0zAuCnin0I379uCl7xnghb9j46sgD
	 5uVSA502zqHMQyySo+1PVaJMrbIhUgSrEJ8bZqjxgvCoL46ZVe2MZ2lsOS0wuyNQP3
	 URAqJ3JkqG1Pn6v0BOfWw3oFX7f67JeX1LyPN0KQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D52DCF8015A;
	Fri, 20 Dec 2019 15:57:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7B06F8015A; Fri, 20 Dec 2019 15:57:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13,SPF_HELO_PASS,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk
 [78.40.148.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95127F800B5
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 15:57:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95127F800B5
Received: from [167.98.27.226] (helo=[10.35.5.173])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1iiJhw-0002Ze-DJ; Fri, 20 Dec 2019 14:56:48 +0000
To: Dmitry Osipenko <digetx@gmail.com>, Jon Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-3-ben.dooks@codethink.co.uk>
 <d2110a1f-c1de-e2c5-a1ff-5eb4c5d3e1da@gmail.com>
 <b4e2ec44-bc89-b5ca-cfa7-a6d5c45a9c94@codethink.co.uk>
 <a11ba33e-5ffb-c5c6-04f5-0e031877c55f@gmail.com>
 <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
 <a0f027d9-e9e0-d76c-1e40-002fdc37eb5f@nvidia.com>
 <d43d518d-9336-a011-2a69-3f9331f6d0b4@codethink.co.uk>
 <aba4edd6-0ea5-5e95-c5a0-9e749587c763@nvidia.com>
 <449bdc3c-bf82-7cc4-6704-440dd100ca3a@gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <5d3ae629-5d30-0930-5dd1-15161e64926e@codethink.co.uk>
Date: Fri, 20 Dec 2019 14:56:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <449bdc3c-bf82-7cc4-6704-440dd100ca3a@gmail.com>
Content-Type: multipart/mixed; boundary="------------9B013E3CB7279968CFD65AEB"
Content-Language: en-GB
Cc: linux-kernel@lists.codethink.co.uk,
 Edward Cragg <edward.cragg@codethink.co.uk>
Subject: Re: [alsa-devel] [PATCH v5 2/7] ASoC: tegra: Allow 24bit and 32bit
	samples
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

This is a multi-part message in MIME format.
--------------9B013E3CB7279968CFD65AEB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/12/2019 14:43, Dmitry Osipenko wrote:
> 20.12.2019 16:57, Jon Hunter пишет:
>>
>> On 20/12/2019 11:38, Ben Dooks wrote:
>>> On 20/12/2019 11:30, Jon Hunter wrote:
>>>>
>>>> On 25/11/2019 17:28, Dmitry Osipenko wrote:
>>>>> 25.11.2019 20:22, Dmitry Osipenko пишет:
>>>>>> 25.11.2019 13:37, Ben Dooks пишет:
>>>>>>> On 23/11/2019 21:09, Dmitry Osipenko wrote:
>>>>>>>> 18.10.2019 18:48, Ben Dooks пишет:
>>>>>>>>> From: Edward Cragg <edward.cragg@codethink.co.uk>
>>>>>>>>>
>>>>>>>>> The tegra3 audio can support 24 and 32 bit sample sizes so add the
>>>>>>>>> option to the tegra30_i2s_hw_params to configure the S24_LE or
>>>>>>>>> S32_LE
>>>>>>>>> formats when requested.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
>>>>>>>>> [ben.dooks@codethink.co.uk: fixup merge of 24 and 32bit]
>>>>>>>>> [ben.dooks@codethink.co.uk: add pm calls around ytdm config]
>>>>>>>>> [ben.dooks@codethink.co.uk: drop debug printing to dev_dbg]
>>>>>>>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>>>>>>>> ---
>>>>>>>>> squash 5aeca5a055fd ASoC: tegra: i2s: pm_runtime_get_sync() is
>>>>>>>>> needed
>>>>>>>>> in tdm code
>>>>>>>>>
>>>>>>>>> ASoC: tegra: i2s: pm_runtime_get_sync() is needed in tdm code
>>>>>>>>> ---
>>>>>>>>>     sound/soc/tegra/tegra30_i2s.c | 25 ++++++++++++++++++++-----
>>>>>>>>>     1 file changed, 20 insertions(+), 5 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/sound/soc/tegra/tegra30_i2s.c
>>>>>>>>> b/sound/soc/tegra/tegra30_i2s.c
>>>>>>>>> index 73f0dddeaef3..063f34c882af 100644
>>>>>>>>> --- a/sound/soc/tegra/tegra30_i2s.c
>>>>>>>>> +++ b/sound/soc/tegra/tegra30_i2s.c
>>>>>>>>> @@ -127,7 +127,7 @@ static int tegra30_i2s_hw_params(struct
>>>>>>>>> snd_pcm_substream *substream,
>>>>>>>>>         struct device *dev = dai->dev;
>>>>>>>>>         struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>>>>>>>>>         unsigned int mask, val, reg;
>>>>>>>>> -    int ret, sample_size, srate, i2sclock, bitcnt;
>>>>>>>>> +    int ret, sample_size, srate, i2sclock, bitcnt, audio_bits;
>>>>>>>>>         struct tegra30_ahub_cif_conf cif_conf;
>>>>>>>>>           if (params_channels(params) != 2)
>>>>>>>>> @@ -137,8 +137,19 @@ static int tegra30_i2s_hw_params(struct
>>>>>>>>> snd_pcm_substream *substream,
>>>>>>>>>         switch (params_format(params)) {
>>>>>>>>>         case SNDRV_PCM_FORMAT_S16_LE:
>>>>>>>>>             val = TEGRA30_I2S_CTRL_BIT_SIZE_16;
>>>>>>>>> +        audio_bits = TEGRA30_AUDIOCIF_BITS_16;
>>>>>>>>>             sample_size = 16;
>>>>>>>>>             break;
>>>>>>>>> +    case SNDRV_PCM_FORMAT_S24_LE:
>>>>>>>>> +        val = TEGRA30_I2S_CTRL_BIT_SIZE_24;
>>>>>>>>> +        audio_bits = TEGRA30_AUDIOCIF_BITS_24;
>>>>>>>>> +        sample_size = 24;
>>>>>>>>> +        break;
>>>>>>>>> +    case SNDRV_PCM_FORMAT_S32_LE:
>>>>>>>>> +        val = TEGRA30_I2S_CTRL_BIT_SIZE_32;
>>>>>>>>> +        audio_bits = TEGRA30_AUDIOCIF_BITS_32;
>>>>>>>>> +        sample_size = 32;
>>>>>>>>> +        break;
>>>>>>>>>         default:
>>>>>>>>>             return -EINVAL;
>>>>>>>>>         }
>>>>>>>>> @@ -170,8 +181,8 @@ static int tegra30_i2s_hw_params(struct
>>>>>>>>> snd_pcm_substream *substream,
>>>>>>>>>         cif_conf.threshold = 0;
>>>>>>>>>         cif_conf.audio_channels = 2;
>>>>>>>>>         cif_conf.client_channels = 2;
>>>>>>>>> -    cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
>>>>>>>>> -    cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
>>>>>>>>> +    cif_conf.audio_bits = audio_bits;
>>>>>>>>> +    cif_conf.client_bits = audio_bits;
>>>>>>>>>         cif_conf.expand = 0;
>>>>>>>>>         cif_conf.stereo_conv = 0;
>>>>>>>>>         cif_conf.replicate = 0;
>>>>>>>>> @@ -306,14 +317,18 @@ static const struct snd_soc_dai_driver
>>>>>>>>> tegra30_i2s_dai_template = {
>>>>>>>>>             .channels_min = 2,
>>>>>>>>>             .channels_max = 2,
>>>>>>>>>             .rates = SNDRV_PCM_RATE_8000_96000,
>>>>>>>>> -        .formats = SNDRV_PCM_FMTBIT_S16_LE,
>>>>>>>>> +        .formats = SNDRV_PCM_FMTBIT_S32_LE |
>>>>>>>>> +               SNDRV_PCM_FMTBIT_S24_LE |
>>>>>>>>> +               SNDRV_PCM_FMTBIT_S16_LE,
>>>>>>>>>         },
>>>>>>>>>         .capture = {
>>>>>>>>>             .stream_name = "Capture",
>>>>>>>>>             .channels_min = 2,
>>>>>>>>>             .channels_max = 2,
>>>>>>>>>             .rates = SNDRV_PCM_RATE_8000_96000,
>>>>>>>>> -        .formats = SNDRV_PCM_FMTBIT_S16_LE,
>>>>>>>>> +        .formats = SNDRV_PCM_FMTBIT_S32_LE |
>>>>>>>>> +               SNDRV_PCM_FMTBIT_S24_LE |
>>>>>>>>> +               SNDRV_PCM_FMTBIT_S16_LE,
>>>>>>>>>         },
>>>>>>>>>         .ops = &tegra30_i2s_dai_ops,
>>>>>>>>>         .symmetric_rates = 1,
>>>>>>>>>
>>>>>>>>
>>>>>>>> Hello,
>>>>>>>>
>>>>>>>> This patch breaks audio on Tegra30. I don't see errors anywhere, but
>>>>>>>> there is no audio and reverting this patch helps. Please fix it.
>>>>>>>
>>>>>>> What is the failure mode? I can try and take a look at this some time
>>>>>>> this week, but I am not sure if I have any boards with an actual
>>>>>>> useful
>>>>>>> audio output?
>>>>>>
>>>>>> The failure mode is that there no sound. I also noticed that video
>>>>>> playback stutters a lot if movie file has audio track, seems something
>>>>>> times out during of the audio playback. For now I don't have any
>>>>>> more info.
>>>>>>
>>>>>
>>>>> Oh, I didn't say how to reproduce it.. for example simply playing
>>>>> big_buck_bunny_720p_h264.mov in MPV has the audio problem.
>>>>>
>>>>> https://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_720p_h264.mov
>>>>>
>>>>
>>>> Given that the audio drivers uses regmap, it could be good to dump the
>>>> I2S/AHUB registers while the clip if playing with and without this patch
>>>> to see the differences. I am curious if the audio is now being played as
>>>> 24 or 32-bit instead of 16-bit now these are available.
>>>>
>>>> You could also dump the hw_params to see the format while playing as
>>>> well ...
>>>>
>>>> $ /proc/asound/<scard-name>/pcm0p/sub0/hw_params
>>>
>>> I suppose it is also possible that the codec isn't properly doing >16
>>> bits and the fact we now offer 24 and 32 could be an issue. I've not
>>> got anything with an audio output on it that would be easy to test.
>>
>> I thought I had tested on a Jetson TK1 (Tegra124) but it was sometime
>> back. However, admittedly I may have only done simple 16-bit testing
>> with speaker-test.
>>
>> We do verify that all soundcards are detected and registered as expected
>> during daily testing, but at the moment we don't have anything that
>> verifies actual playback.
> 
> Please take a look at the attached logs.

I wonder if we are falling into FIFO configuration issues with the
non-16 bit case.

Can you try adding the following two patches?


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

--------------9B013E3CB7279968CFD65AEB
Content-Type: text/x-patch;
 name="0002-ASoC-tegra-take-packing-settings-from-the-audio-cif_.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0002-ASoC-tegra-take-packing-settings-from-the-audio-cif_.pa";
 filename*1="tch"

From 5b5add6595c03e09ac183b787264d40ca356f491 Mon Sep 17 00:00:00 2001
From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Tue, 16 Apr 2019 14:34:48 +0100
Subject: [PATCH 2/2] ASoC: tegra: take packing settings from the audio
 cif_config

If the CIF is not configured as 16 or 8 bit, then the
packing for 8/16 bits should not be enabled as the
hardware only supports 8 or 16 bit packing.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 sound/soc/tegra/tegra30_ahub.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 24bc03428b45..0768c6b6dc25 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -96,10 +96,17 @@ int tegra30_ahub_setup_rx_fifo(enum tegra30_ahub_rxcif rxcif,
 	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
 	val = tegra30_apbif_read(reg);
 	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_MASK |
-		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_MASK);
-	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_SHIFT) |
-	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN |
-	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
+		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_MASK |
+		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN);
+	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_SHIFT);
+	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_16 ||
+	    cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_8)
+		val |= TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN;
+	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_16)
+		val |= TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
+	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_8)
+		val |= TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_8_4;
+
 	tegra30_apbif_write(reg, val);
 
 	cif_conf->direction = TEGRA30_AUDIOCIF_DIRECTION_RX;
@@ -203,10 +210,16 @@ int tegra30_ahub_setup_tx_fifo(enum tegra30_ahub_txcif txcif,
 	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
 	val = tegra30_apbif_read(reg);
 	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_TX_THRESHOLD_MASK |
-		 TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_MASK);
-	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_TX_THRESHOLD_SHIFT) |
-	       TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_EN |
-	       TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_16;
+		 TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_MASK |
+		 TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_EN);
+	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_TX_THRESHOLD_SHIFT);
+	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_16 ||
+	    cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_8)
+		val |= TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_EN;
+	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_16)
+		val |= TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_16;
+	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_8)
+		val |= TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_8_4;
 	tegra30_apbif_write(reg, val);
 
 	cif_conf->direction = TEGRA30_AUDIOCIF_DIRECTION_TX;
-- 
2.24.0


--------------9B013E3CB7279968CFD65AEB
Content-Type: text/x-patch;
 name="0001-ASoC-tegra-config-fifos-on-hw_param-changes.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-ASoC-tegra-config-fifos-on-hw_param-changes.patch"

From b2e14a9cc4c07d2dfdb5aa4269b55910d46a04d0 Mon Sep 17 00:00:00 2001
From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Tue, 4 Oct 2016 16:31:53 +0100
Subject: [PATCH 1/2] ASoC: tegra: config fifos on hw_param changes

If the hw_params uses a different bit or channel count, then we
need to change both the I2S unit's CIF configuration as well as
the APBIF one.

To allow changing the APBIF, add a call to reconfigure the RX or
TX FIFO without changing the DMA or allocation, and get the I2S
driver to call it once the hw params have been calculate.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 sound/soc/tegra/tegra30_ahub.c | 115 ++++++++++++++++++---------------
 sound/soc/tegra/tegra30_ahub.h |   5 ++
 sound/soc/tegra/tegra30_i2s.c  |   2 +
 3 files changed, 69 insertions(+), 53 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 952381260dc3..24bc03428b45 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -84,12 +84,40 @@ static int tegra30_ahub_runtime_resume(struct device *dev)
 	return 0;
 }
 
+int tegra30_ahub_setup_rx_fifo(enum tegra30_ahub_rxcif rxcif,
+			       struct tegra30_ahub_cif_conf *cif_conf)
+{
+	int channel = rxcif - TEGRA30_AHUB_RXCIF_APBIF_RX0;
+	u32 reg, val;
+
+	pm_runtime_get_sync(ahub->dev);
+
+	reg = TEGRA30_AHUB_CHANNEL_CTRL +
+	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
+	val = tegra30_apbif_read(reg);
+	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_MASK |
+		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_MASK);
+	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_SHIFT) |
+	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN |
+	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
+	tegra30_apbif_write(reg, val);
+
+	cif_conf->direction = TEGRA30_AUDIOCIF_DIRECTION_RX;
+
+	reg = TEGRA30_AHUB_CIF_RX_CTRL +
+	      (channel * TEGRA30_AHUB_CIF_RX_CTRL_STRIDE);
+	ahub->soc_data->set_audio_cif(ahub->regmap_apbif, reg, cif_conf);
+
+	pm_runtime_put(ahub->dev);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tegra30_ahub_setup_rx_fifo);
+
 int tegra30_ahub_allocate_rx_fifo(enum tegra30_ahub_rxcif *rxcif,
 				  char *dmachan, int dmachan_len,
 				  dma_addr_t *fiforeg)
 {
 	int channel;
-	u32 reg, val;
 	struct tegra30_ahub_cif_conf cif_conf;
 
 	channel = find_first_zero_bit(ahub->rx_usage,
@@ -104,37 +132,14 @@ int tegra30_ahub_allocate_rx_fifo(enum tegra30_ahub_rxcif *rxcif,
 	*fiforeg = ahub->apbif_addr + TEGRA30_AHUB_CHANNEL_RXFIFO +
 		   (channel * TEGRA30_AHUB_CHANNEL_RXFIFO_STRIDE);
 
-	pm_runtime_get_sync(ahub->dev);
+	memset(&cif_conf, 0, sizeof(cif_conf));
 
-	reg = TEGRA30_AHUB_CHANNEL_CTRL +
-	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
-	val = tegra30_apbif_read(reg);
-	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_MASK |
-		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_MASK);
-	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_SHIFT) |
-	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN |
-	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
-	tegra30_apbif_write(reg, val);
-
-	cif_conf.threshold = 0;
 	cif_conf.audio_channels = 2;
 	cif_conf.client_channels = 2;
 	cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
 	cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
-	cif_conf.expand = 0;
-	cif_conf.stereo_conv = 0;
-	cif_conf.replicate = 0;
-	cif_conf.direction = TEGRA30_AUDIOCIF_DIRECTION_RX;
-	cif_conf.truncate = 0;
-	cif_conf.mono_conv = 0;
-
-	reg = TEGRA30_AHUB_CIF_RX_CTRL +
-	      (channel * TEGRA30_AHUB_CIF_RX_CTRL_STRIDE);
-	ahub->soc_data->set_audio_cif(ahub->regmap_apbif, reg, &cif_conf);
-
-	pm_runtime_put(ahub->dev);
 
-	return 0;
+	return tegra30_ahub_setup_rx_fifo(*rxcif, &cif_conf);
 }
 EXPORT_SYMBOL_GPL(tegra30_ahub_allocate_rx_fifo);
 
@@ -186,12 +191,40 @@ int tegra30_ahub_free_rx_fifo(enum tegra30_ahub_rxcif rxcif)
 }
 EXPORT_SYMBOL_GPL(tegra30_ahub_free_rx_fifo);
 
+int tegra30_ahub_setup_tx_fifo(enum tegra30_ahub_txcif txcif,
+			       struct tegra30_ahub_cif_conf *cif_conf)
+{
+	int channel = txcif - TEGRA30_AHUB_TXCIF_APBIF_TX0;
+	u32 reg, val;
+
+	pm_runtime_get_sync(ahub->dev);
+
+	reg = TEGRA30_AHUB_CHANNEL_CTRL +
+	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
+	val = tegra30_apbif_read(reg);
+	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_TX_THRESHOLD_MASK |
+		 TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_MASK);
+	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_TX_THRESHOLD_SHIFT) |
+	       TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_EN |
+	       TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_16;
+	tegra30_apbif_write(reg, val);
+
+	cif_conf->direction = TEGRA30_AUDIOCIF_DIRECTION_TX;
+
+	reg = TEGRA30_AHUB_CIF_TX_CTRL +
+	      (channel * TEGRA30_AHUB_CIF_TX_CTRL_STRIDE);
+	ahub->soc_data->set_audio_cif(ahub->regmap_apbif, reg, cif_conf);
+
+	pm_runtime_put(ahub->dev);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tegra30_ahub_setup_tx_fifo);
+
 int tegra30_ahub_allocate_tx_fifo(enum tegra30_ahub_txcif *txcif,
 				  char *dmachan, int dmachan_len,
 				  dma_addr_t *fiforeg)
 {
 	int channel;
-	u32 reg, val;
 	struct tegra30_ahub_cif_conf cif_conf;
 
 	channel = find_first_zero_bit(ahub->tx_usage,
@@ -206,37 +239,13 @@ int tegra30_ahub_allocate_tx_fifo(enum tegra30_ahub_txcif *txcif,
 	*fiforeg = ahub->apbif_addr + TEGRA30_AHUB_CHANNEL_TXFIFO +
 		   (channel * TEGRA30_AHUB_CHANNEL_TXFIFO_STRIDE);
 
-	pm_runtime_get_sync(ahub->dev);
-
-	reg = TEGRA30_AHUB_CHANNEL_CTRL +
-	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
-	val = tegra30_apbif_read(reg);
-	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_TX_THRESHOLD_MASK |
-		 TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_MASK);
-	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_TX_THRESHOLD_SHIFT) |
-	       TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_EN |
-	       TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_16;
-	tegra30_apbif_write(reg, val);
-
-	cif_conf.threshold = 0;
+	memset(&cif_conf, 0, sizeof(cif_conf));
 	cif_conf.audio_channels = 2;
 	cif_conf.client_channels = 2;
 	cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
 	cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
-	cif_conf.expand = 0;
-	cif_conf.stereo_conv = 0;
-	cif_conf.replicate = 0;
-	cif_conf.direction = TEGRA30_AUDIOCIF_DIRECTION_TX;
-	cif_conf.truncate = 0;
-	cif_conf.mono_conv = 0;
-
-	reg = TEGRA30_AHUB_CIF_TX_CTRL +
-	      (channel * TEGRA30_AHUB_CIF_TX_CTRL_STRIDE);
-	ahub->soc_data->set_audio_cif(ahub->regmap_apbif, reg, &cif_conf);
 
-	pm_runtime_put(ahub->dev);
-
-	return 0;
+	return tegra30_ahub_setup_tx_fifo(*txcif, &cif_conf);
 }
 EXPORT_SYMBOL_GPL(tegra30_ahub_allocate_tx_fifo);
 
diff --git a/sound/soc/tegra/tegra30_ahub.h b/sound/soc/tegra/tegra30_ahub.h
index 6889c5f23d02..26120aee64b3 100644
--- a/sound/soc/tegra/tegra30_ahub.h
+++ b/sound/soc/tegra/tegra30_ahub.h
@@ -490,6 +490,11 @@ void tegra30_ahub_set_cif(struct regmap *regmap, unsigned int reg,
 void tegra124_ahub_set_cif(struct regmap *regmap, unsigned int reg,
 			   struct tegra30_ahub_cif_conf *conf);
 
+extern int tegra30_ahub_setup_tx_fifo(enum tegra30_ahub_txcif txcif,
+				      struct tegra30_ahub_cif_conf *cif_conf);
+extern int tegra30_ahub_setup_rx_fifo(enum tegra30_ahub_rxcif,
+				      struct tegra30_ahub_cif_conf *cif_conf);
+
 struct tegra30_ahub_soc_data {
 	u32 mod_list_mask;
 	void (*set_audio_cif)(struct regmap *regmap,
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index e99126600fc4..89ac0c5e1332 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -201,9 +201,11 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		cif_conf.direction = TEGRA30_AUDIOCIF_DIRECTION_RX;
+		tegra30_ahub_setup_tx_fifo(i2s->playback_fifo_cif, &cif_conf);
 		reg = TEGRA30_I2S_CIF_RX_CTRL;
 	} else {
 		cif_conf.direction = TEGRA30_AUDIOCIF_DIRECTION_TX;
+		tegra30_ahub_setup_rx_fifo(i2s->capture_fifo_cif, &cif_conf);
 		reg = TEGRA30_I2S_CIF_TX_CTRL;
 	}
 
-- 
2.24.0


--------------9B013E3CB7279968CFD65AEB
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--------------9B013E3CB7279968CFD65AEB--
