Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8244F188DC7
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 20:11:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3C0B17F9;
	Tue, 17 Mar 2020 20:11:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3C0B17F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584472318;
	bh=cKUmtWgsXTYhVHRq4t4bgZjMH5Db2bATfaxdGrjuHbc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SbvJCoS9OApdkiIdHt9FUrVB7we3ALvobzrppQiGFXhsrZ7c1dOcONpC9sZgcWQ5a
	 GIclJhtbXeAeS4TlA0pglHl/jlOEU6VOn7xmCOKTP+t6aa6nuCzzAqhJKdaW+xEwFX
	 YJSi2y2a9AFDIz4+EpGSs2b8PUYhm4pH6upTNOmc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C2C4F80217;
	Tue, 17 Mar 2020 20:10:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51E1EF8022B; Tue, 17 Mar 2020 20:09:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D262F80058
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 20:09:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D262F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="dWxsitvU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5UT2Wz6CJZWB2uuzVor6AdGb1SvtV4k8FNfjK8QT4ag=; b=dWxsitvUCI6WFPgTGRgsAUuRYI
 ElYY0rYjM/MoL7z3BYy9PNgPXfOFrpCRWCy3SsYC5ekNSO3PU61U42sV5ZgeqjvXeP1GCRKz8sJm1
 doDgPaHJFjo0ifIAhXOPKy43Jx1RxEZkCHeXPoQAj0mbiF35ZRbaTos8Ih6JhgdouDEWg36H7fjXR
 rNWqemPniRBHglksYL5bw5B31Ce3PYn2cVxOmSNHY7300og1d1bXyC4gvCxcSx537eeGKAneWTPR4
 py6YiIACXnibfwKawG9TxLPrhIGknoG3h2HIBIUjPoX73b9jFCeyuW9Scxu4SmKnX7ptJsPI+SnIK
 Tx1/DmFQ==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www381.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <lars@metafoo.de>)
 id 1jEHaE-0001Fb-Jk; Tue, 17 Mar 2020 20:08:58 +0100
Received: from [93.104.105.202] (helo=[192.168.178.20])
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1jEHaE-000D2U-D9; Tue, 17 Mar 2020 20:08:58 +0100
Subject: Re: [PATCH 6/6] ASoC: soc-pcm: Merge CPU/Codec MSB at
 soc_pcm_apply_msb()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87y2s0olg6.wl-kuninori.morimoto.gx@renesas.com>
 <87pndcoleh.wl-kuninori.morimoto.gx@renesas.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <a400680b-0334-be68-f137-19a601b43d33@metafoo.de>
Date: Tue, 17 Mar 2020 20:08:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <87pndcoleh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.2/25754/Tue Mar 17 14:09:15 2020)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On 3/16/20 7:37 AM, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> soc_pcm_apply_msb() is setting msb for both CPU/Codec,
> but we can merge these into one.
> This patch do it.

This patch changes the behavior. Before it was

min(max(ALL_CODEC_DAIS), max(ALL_CPU_DAIS))

Now it is just max(ALL_DAIS).

We really do need to differentiate between the DAIs on the transmit side 
and the DAIs on the receive side of a stream to compute this correctly.

> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/soc-pcm.c | 26 +++++++-------------------
>   1 file changed, 7 insertions(+), 19 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index e256d438ee68..aadf3349fb07 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -532,35 +532,23 @@ static void soc_pcm_set_msb(struct snd_pcm_substream *substream, int bits)
>   static void soc_pcm_apply_msb(struct snd_pcm_substream *substream)
>   {
>   	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> -	struct snd_soc_dai *cpu_dai;
> -	struct snd_soc_dai *codec_dai;
> -	struct snd_soc_pcm_stream *pcm_codec, *pcm_cpu;
> +	struct snd_soc_dai *dai;
> +	struct snd_soc_pcm_stream *pcm;
>   	int stream = substream->stream;
>   	int i;
> -	unsigned int bits = 0, cpu_bits = 0;
> +	unsigned int bits = 0;
>   
> -	for_each_rtd_codec_dais(rtd, i, codec_dai) {
> -		pcm_codec = snd_soc_dai_get_pcm_stream(codec_dai, stream);
> +	for_each_rtd_dais(rtd, i, dai) {
> +		pcm = snd_soc_dai_get_pcm_stream(dai, stream);
>   
> -		if (pcm_codec->sig_bits == 0) {
> +		if (pcm->sig_bits == 0) {
>   			bits = 0;
>   			break;
>   		}
> -		bits = max(pcm_codec->sig_bits, bits);
> -	}
> -
> -	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> -		pcm_cpu = snd_soc_dai_get_pcm_stream(cpu_dai, stream);
> -
> -		if (pcm_cpu->sig_bits == 0) {
> -			cpu_bits = 0;
> -			break;
> -		}
> -		cpu_bits = max(pcm_cpu->sig_bits, cpu_bits);
> +		bits = max(pcm->sig_bits, bits);
>   	}
>   
>   	soc_pcm_set_msb(substream, bits);
> -	soc_pcm_set_msb(substream, cpu_bits);
>   }
>   
>   /**
> 

