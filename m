Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED460476E33
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 10:50:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D07A189A;
	Thu, 16 Dec 2021 10:49:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D07A189A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639648214;
	bh=0wYl8lEtb0p+l/2quEKfYyCZ3KU7GlC2BhL0UVkQilU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GDW7qgxXGLIIcTkzyEz1DHaXixWnif+y1Yo6+nZjI9ydNRQX3vcr4hgJy+HMJmHHK
	 jxmu7jx4XKDA+gJPap0LmLkp8DGqK+Yx7XZXQ6tzfRHDMeoznJb3HxkQL5aQQhJ8ZF
	 khaUFl2DLJeGDw3x2ATjngCtNVwDwryCg7u+iElI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC0B0F8015B;
	Thu, 16 Dec 2021 10:49:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1154DF8014C; Thu, 16 Dec 2021 10:49:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6BDEF800DE
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 10:49:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6BDEF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="GOAmdyeS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=ntg7e5pIKDJub3AsWnxe963Ibt7J4lRU+KrHr8W7tG8=; b=GOAmdyeSR7QsSfG3ra+8yb3rYk
 EONX1kgKi2wk1EO68BZU3uxZn92JsqP0zfe3/P8Mfyzzp41D44lv9dUBI0bKp3DEe+JrAUYtbIhAn
 ejRS3y2UTHbOyxgOfczuIEVOz0hOlVfmOpJG0XyiOl/+ztuxQavSFEmVT6QB+/lzyMmBQ3WVXGbVh
 ldjUav1Ienph+0nvf8JL+qHTFmGFOaYZD14LkyiabLYRL/yflL8X4j2xq4PG2KoQj7eFOoLLmBqqw
 tl4aP3DdQUwIQC8114/r7F86KncHNhYDUgPoH++X8V4dtDyidUl5DKauM75ABDSKgluReXxdxni4Q
 /eFkomRA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1mxnNh-000Dab-6X; Thu, 16 Dec 2021 10:48:57 +0100
Received: from [2001:a61:2bc8:8501:9e5c:8eff:fe01:8578]
 by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1mxnNh-000WCD-21; Thu, 16 Dec 2021 10:48:57 +0100
Subject: Re: Question about soc_pcm_apply_msb()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <871r2dnir2.wl-kuninori.morimoto.gx@renesas.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <638df4d7-0645-1cf7-635a-ea448d0c3aef@metafoo.de>
Date: Thu, 16 Dec 2021 10:48:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <871r2dnir2.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.3/26389/Thu Dec 16 07:02:49 2021)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>
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

On 12/16/21 7:53 AM, Kuninori Morimoto wrote:
> Hi ALSA ML
>
> At soc_pcm_apply_msb(),
> (A) part finds max sig_bits for Codec, and
> (B) part finds max sig_bits for CPU
> and, set it to substream via soc_pcm_set_msb() at (X), (Y).
>
> 	static void soc_pcm_apply_msb()
> 	{
> 		...
>   ^		for_each_rtd_codec_dais(rtd, i, codec_dai) {
> (A)			...
>   v			bits = max(pcm_codec->sig_bits, bits);
> 		}
>
>   ^		for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> (B)			...
>   v			cpu_bits = max(pcm_cpu->sig_bits, cpu_bits);
> 		}
>
> (X)		soc_pcm_set_msb(substream, bits);
> (Y)		soc_pcm_set_msb(substream, cpu_bits);
> 	}
>
> I wonder do we need both (X) (Y) ?
> I think we can merge (A) and (B) (= find Codec/CPU max sig_bits),
> and call soc_pcm_set_msb() once, but am I misunderstand ?
We need both. Or alternatively you could write 
soc_pcm_set_msb(substream, min(bits, cpu_bits)).

What this does is it computes the maximum msb bits from both the CPU 
side and the CODEC side and then sets the msb bits reported to userspace 
to the minimum of the two.

The largest number of MSBs we'll see on the CODEC side is the max() and 
the largest number of MSBs we'll see on the CPU side is the max(). And 
the number of MSBs that the application will be able to see is the 
smaller of the two.


