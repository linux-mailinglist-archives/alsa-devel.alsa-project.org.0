Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AD5474997
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 18:37:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FA552022;
	Tue, 14 Dec 2021 18:36:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FA552022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639503420;
	bh=FQiCn0PWxlYJopOtPI8gVOkE4Z+l0j0Ywcm+glOgYes=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bwBjkNRUcpiMXniWKu4jSGQaObQxbPtVq7dB0qtwX8DEbJ1QLAxr8rAIa8eChBGnF
	 LAVGPHH1dMsABQtonM0N+qikyfVbBK1xEyM7CcvbauqqKRtkXY86Wo5mmpCLOU1EdH
	 ozOZlvFRWbQEFIZ52QWVxU+L+hszxJLd+KLJHf3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3464F800FE;
	Tue, 14 Dec 2021 18:35:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50EA3F80246; Tue, 14 Dec 2021 18:35:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E499EF800FE
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 18:35:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E499EF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="agE5j1CI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=fx0brtaLzlC9ryVIdnbGoXxwD8F3GVdqkl4gyT5mEoA=; b=agE5j1CI6tPVJI2Jm97qtKVwdi
 5tJ/G4sDozsZyvr0TP0G33RWYFYVbGUMtf5/uvGpdXYA0b+PtVYCDohBpDlQEmob9iePaa3k82cVc
 vNR8NpD50B/2OBIl6GxtjekdymZcdnBTbaa2NQ/QhRYx+eSxndjQtfSANkQ60LDaXKXeA9JRGKMv5
 0XN7eNsLeSBm8WYhx/Sw575X704q/n3Tj91/a+wGksRWgDw5wEgd6kZ03XSmRreZoDrixibIVTdBI
 64UBJNVv5StKYFHggJLMzovKPsJodcpd8bwBwKfmnnrewXQ8YAbpTD/PMX7q7l/xT9lzzePMkff7G
 tH2LnDnQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1mxBiM-0002p5-Lt; Tue, 14 Dec 2021 18:35:46 +0100
Received: from [2001:a61:2bc8:8501:9e5c:8eff:fe01:8578]
 by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1mxBiM-000Jnk-Aw; Tue, 14 Dec 2021 18:35:46 +0100
Subject: Re: [PATCH] ASoC: wcd934x: Fix a incorrect use of kstrndup
To: Miaoqian Lin <linmq006@gmail.com>
References: <20211214152530.23767-1-linmq006@gmail.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <e7f2ce8d-b9e0-7f36-bff0-d799767c659d@metafoo.de>
Date: Tue, 14 Dec 2021 18:35:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211214152530.23767-1-linmq006@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
I'm wondering if it isn't better to re-structure the code to not 
allocate any memory.

something like

ret = sscan(w->name, "ADC MUX%d", &decimator);
if (ret != 1)
     ...


