Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0E1146536
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jan 2020 10:57:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB1B7168F;
	Thu, 23 Jan 2020 10:56:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB1B7168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579773423;
	bh=QrjULwcH6SW7GOwQZt8yw0fdgjtrOn25ACObVt5ah4g=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P7yBLWQ+ZqiGmTPPxcsF+V+ii3Q+H9PUG0yjAoHWz6Fnl0tEmhRIMeu7pkDLKdMdv
	 39swND7x/8Tc7QTR1EX4gGBX7+nz6srnvWWMTDautOCFSiOTO8wgCcrzyOuehQcHYx
	 wjqJoQXRtN5hVGEHdSYxu7MEY4/zOB6NwTticHrU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BFD0F801D9;
	Thu, 23 Jan 2020 10:55:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 807D9F801D9; Thu, 23 Jan 2020 10:55:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82681F800E7
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 10:55:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82681F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="XNAb6nBb"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e296d710000>; Thu, 23 Jan 2020 01:54:57 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 23 Jan 2020 01:55:11 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 23 Jan 2020 01:55:11 -0800
Received: from [10.24.44.92] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Jan
 2020 09:55:09 +0000
To: <tiwai@suse.com>, <perex@perex.cz>
References: <1579443563-12287-1-git-send-email-spujar@nvidia.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <32021032-6b3c-9056-d194-ce7902e5fcbf@nvidia.com>
Date: Thu, 23 Jan 2020 15:25:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1579443563-12287-1-git-send-email-spujar@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1579773297; bh=L8ghlLd5KcxfJQc3HDcCUJatTjhdcq6Wmqdd0ONIYxo=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=XNAb6nBbKf5/i4gyAoNdzynBl+amoQPmeQjq+tnRLJ7mjUT9ew64H0CLFclgL8W8x
 n2M/vySLqN6SF5dBkmHqNFuoxXpCXfLavtZOKCo7yYjhRqlbzlPKwxNBuivEZgNLBv
 fvFGyPLeax2+JAdQ7ObYJGxIGJKWNG1/p+o9cz54D2VA0jVdscBBM6us7dhYrpvdAc
 6KYaqhbIBB6dUuIGi2ee45LByp6nIQdOysKYget5FF2y1q528DCFgnD4rJXWuHFPSY
 6cibZrDpE5BVb4LEI8GnAL2FotDFkIAaqJCF2JfDGQr5uUlLqygok4p3xyyvOPM0Yt
 Y9A968P000Fag==
Cc: spujar@nvidia.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [RFC] ASoC: soc-pcm: crash in snd_soc_dapm_new_dai
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi All,
Request for comments if my understanding is right here. Thanks.

On 1/19/2020 7:49 PM, Sameer Pujar wrote:
> Crash happens in snd_soc_dapm_new_dai() when substream->private_data
> access is made and substream is NULL here. This is seen for DAIs where
> only playback or capture stream is defined. This seems to be happening
> for codec2codec DAI link.
>
> Both playback and capture are 0 during soc_new_pcm(). This is probably
> happening because cpu_dai and codec_dai are both validated either for
> SNDRV_PCM_STREAM_PLAYBACK or SNDRV_PCM_STREAM_CAPTURE.
>
> Shouldn't be playback = 1 when,
>   - playback stream is available for codec_dai AND
>   - capture stream is available for cpu_dai
>
> and vice-versa for capture = 1?
>
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>   sound/soc/soc-pcm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 74d340d..5aa9c0b 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2855,10 +2855,10 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
>   
>   		for_each_rtd_codec_dai(rtd, i, codec_dai) {
>   			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
> -			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_PLAYBACK))
> +			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_CAPTURE))
>   				playback = 1;
>   			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
> -			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_CAPTURE))
> +			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_PLAYBACK))
>   				capture = 1;
>   		}
>   

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
