Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBABF4749E8
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 18:43:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67CA820EB;
	Tue, 14 Dec 2021 18:43:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67CA820EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639503837;
	bh=86qyYvJ3otVl+jRKFJZR0WmgQGK62+VvmaOGpktiYd4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M9FqfaCl87RtoPhn7LAWF6jerthfUbePm54C78FyWWkyW4Xn4FFoGfTNzUtBi6WMU
	 BqfYNmBFjtNzjuhrHwMmTmedWN5kMhklqcpWsLruK91jmzh7bLvQpmVMkxxtLyQ6pn
	 FbYDaRNqITVH3SlyeON8UBCGugwfw8K+Rl/JgrNM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D402EF80249;
	Tue, 14 Dec 2021 18:42:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1243EF80246; Tue, 14 Dec 2021 18:42:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD474F800FE
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 18:42:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD474F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="HKNIvUv/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=GPK+n5MrkQApeMJaTshLG0e3f9wJqeaDHXMDdFU7TnA=; b=HKNIvUv/1EC+gP9WQ6c0DAVZL8
 TylVc4nUagecMUQwnb+8poxSNqa9EEkYpbzvgasT92ghjmNYLPfqExTRGUMCaYINfgSXKRjm7BPFm
 8ml/uYCl75Rx3hq30vGzpKVUPglV+SgJPCfRVKhuFgCemI8gp8XY8aZVyYKihKqSzMU8dDoL2RNsC
 IcaYmPYn3a8U60Q2zKwoije0m0aEGH58euhC4ItefKMhWO9j606XM6YXpziqtzLhgOSQPnHkJQNsD
 Dys49QHIEzdMqK2jfO7PSD1HuET+1FF7cyWFsrt86wd/evmJxdvD48H5JHRH0uAjK/8ZdwpAYS3Me
 tCUAKPhw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1mxBp6-0003ky-Aa; Tue, 14 Dec 2021 18:42:44 +0100
Received: from [2001:a61:2bc8:8501:9e5c:8eff:fe01:8578]
 by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1mxBp6-0007SG-0y; Tue, 14 Dec 2021 18:42:44 +0100
Subject: Re: [PATCH] ASoC: wcd934x: Fix a incorrect use of kstrndup
To: Miaoqian Lin <linmq006@gmail.com>
References: <20211214152530.23767-1-linmq006@gmail.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <03a2bb9d-972d-b481-f03b-d50bab422f78@metafoo.de>
Date: Tue, 14 Dec 2021 18:42:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211214152530.23767-1-linmq006@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.3/26387/Tue Dec 14 10:33:30 2021)
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

On 12/14/21 4:25 PM, Miaoqian Lin wrote:
> In wcd934x_codec_enable_dec(), widget_name is allocated by kstrndup().
> However, according to doc: "Note: Use kmemdup_nul() instead if the size
> is known exactly." So we should use kmemdup_nul() here instead of
> kstrndup(). It's similar to CVE-2019-12454.
>
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>   sound/soc/codecs/wcd934x.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
> index e63c6b723d76..c6677cfbce59 100644
> --- a/sound/soc/codecs/wcd934x.c
> +++ b/sound/soc/codecs/wcd934x.c
> @@ -5005,7 +5005,7 @@ static int wcd934x_codec_enable_dec(struct snd_soc_dapm_widget *w,
>   	char *dec;
>   	u8 hpf_coff_freq;
>   
> -	widget_name = kstrndup(w->name, 15, GFP_KERNEL);
> +	widget_name = kmemdup_nul(w->name, 15, GFP_KERNEL);

Thinking a bit more about it, this is wrong. The source string is 
shorter than 15 character. So with this change you are copying past the 
end of the string, which depending on where in memory the string is 
placed can cause undefined behavior.

