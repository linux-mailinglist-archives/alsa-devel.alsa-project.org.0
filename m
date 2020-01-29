Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0CF14CC85
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 15:35:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E697F1671;
	Wed, 29 Jan 2020 15:34:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E697F1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580308509;
	bh=sduf7FXTDR13T6Pi7qDRuuwobjr+NTJc7kG+rqecT0s=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TDUKvFmR7xShBUUZVd4NdyM28Se2fQO9L496j2zFfYsBdEb6+Jo309UxMYFZApozF
	 XwzdF6ZNTphJDaR5UuuNCBakeXuqmORblUu4HzCamnC3vrAktlGwjZy5RfibmxiXSk
	 zM1jSs7QcsPoT1yJqMs6j3DvETRDmfAmK7BpKDRg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 003F0F80229;
	Wed, 29 Jan 2020 15:33:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 989B5F8021E; Wed, 29 Jan 2020 15:33:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D403F80122
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 15:33:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D403F80122
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="MrQ/OLnZ"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e31979a0000>; Wed, 29 Jan 2020 06:32:58 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 29 Jan 2020 06:33:18 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 29 Jan 2020 06:33:18 -0800
Received: from [10.21.133.51] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 Jan
 2020 14:33:15 +0000
From: Jon Hunter <jonathanh@nvidia.com>
To: Mark Brown <broonie@kernel.org>, Dmitry Osipenko <digetx@gmail.com>
References: <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
 <20200128121315.GD4689@sirena.org.uk>
 <4b90efd2-5d0c-84df-961d-80cee288e0d4@nvidia.com>
Message-ID: <586ea2b9-c204-2bd1-f8e2-875e0974e42d@nvidia.com>
Date: Wed, 29 Jan 2020 14:33:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <4b90efd2-5d0c-84df-961d-80cee288e0d4@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580308378; bh=q5nK7ZGYKHERyFArP7MvoxXSyWsbMp/JkPPV5Dp1yx4=;
 h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=MrQ/OLnZLkb5W5NbKyGywLti+GnNL5Kkk5EEebpVAd6FueXmDhBM4J+49TIN8rnLD
 IT4T/+4BRnZHmiVgUq2mS5AljgriMt7iQ7L0etVq93qNwZdwqpPQwF7aTo9xNlkmYh
 F9gIKUDPMGB5/xYtg8G6XdKGiyOzB8OBZy2I5umzFY36ZoPn0wJksOWRH+LysEB1nq
 GoJbvPGnc/xFgWTRDtVkGvO6MrEzbNyo8GlByvaIetr8xeFFv5Vcyd7XWS2BNjef/x
 5WeQrrOUuPsjp4tI4e0ndWQOlpWuYX/lw2rvyu60UrSGk56I3w0vMecgnOO/XFNG9K
 865sd1y3Fgk8w==
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
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


On 29/01/2020 10:49, Jon Hunter wrote:
> 
> On 28/01/2020 12:13, Mark Brown wrote:
>> I really don't understand why this is all taking so long, this thread
>> just seems to be going round in interminable circles long after it
>> looked like the issue was understood.  I have to admit I've not read
>> every single message in the thread but it's difficult to see why it
>> doesn't seem to be making any progress.
> 
> Sorry about that. On reviewing this with the audio team at NVIDIA, I was
> told we don't support S24_LE for I2S. The reason being that the crossbar
> between the DMA and I2S is not able to extract the correct 24-bits from
> the 32-bit sample to feed to the I2S interface. The Tegra documentation
> does show support for 24-bits, but not state explicit support for S24_LE.
> 
> Now Ben says that he has this working, but I am unable to reproduce
> this, so before just dropping the S24_LE support, I would like to
> understand how this is working for Ben in case there is something that
> we have overlooked here.

Ah, I see that part of the problem is that patches 6 and 7 are yet to be
applied and without these the audio is completely distorted because
there is a mismatch in the data size between the APBIF and I2S
controller. Applying these patches it is not distorted but now I am
observing the clocking issue Ben reported and so the tone is not quite
right.

Ben, I was able to workaround the clocking issue by making the I2S word
clock 64 bits long and not 48.

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index bbf81b5aa723..3c9b4779e61b 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -143,7 +143,7 @@ static int tegra30_i2s_hw_params(struct
snd_pcm_substream *substream,
        case SNDRV_PCM_FORMAT_S24_LE:
                val = TEGRA30_I2S_CTRL_BIT_SIZE_24;
                audio_bits = TEGRA30_AUDIOCIF_BITS_24;
-               sample_size = 24;
+               sample_size = 32;
                break;
        case SNDRV_PCM_FORMAT_S32_LE:
                val = TEGRA30_I2S_CTRL_BIT_SIZE_32;

For I2S I believe we only care about the edges of the word clock and so
we make the overall period of the word clock 64 bit clocks then we no
longer have an issue with the bit clock frequency. I assume that this
should also be fine for TDM modes as well.

Can you let me know if this works for you?

Cheers
Jon

-- 
nvpublic
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
