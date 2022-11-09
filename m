Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC3A6225A1
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 09:40:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE809836;
	Wed,  9 Nov 2022 09:39:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE809836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667983235;
	bh=1ssOoBP00ioXANUUquG3SWFiRZeOUvGR/k73PbFsmZI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s4bq7oZJ4p/5f3Melhgcc0DumuhwCy6DqOXdVyjvAwzWTPiMCNgaT+nvGQW9JdAsG
	 IcFJ5JeGfSp2vPCEqGasIfMy0KTmh+AyXn1ZdC/e4ZXDlECndmmtpfrb08Q2CYeZRC
	 iBXf0Gqxs0W2KJWoiLX7suDs2rjo5ewRuTIMyYzk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65C66F8023B;
	Wed,  9 Nov 2022 09:39:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC18EF80217; Wed,  9 Nov 2022 09:39:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E48DEF800EC
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 09:39:31 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 140D4A003F;
 Wed,  9 Nov 2022 09:39:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 140D4A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1667983171; bh=imbi9OxRhC0tasxDFFByDWMFKtDknxAnFa2WdZ1HhFA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fAO+1jWnKJ/eUPXepWWv+oxrYByooK5hWVx1JZvn3fQP+gkQuCclYmYlpeoGYqU/q
 ONh/cXMse+XNxMcpwZNtD3Gps67v8DdxYAcBgczuhocsFlsh4Hlw9GTb8ZxVoG9Mlo
 AK3sHeCJWnmCcZhUMTMW9c+mKR9K12DfjwQEeHKc=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed,  9 Nov 2022 09:39:24 +0100 (CET)
Message-ID: <c15c4464-6f44-26c0-36ba-05232af5362a@perex.cz>
Date: Wed, 9 Nov 2022 09:39:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] pcm: rate - check rate type for using
 snd_pcm_rate_slave_frames
Content-Language: en-US
To: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org, tiwai@suse.com, alsa-devel@alsa-project.org
References: <1667793912-18957-1-git-send-email-shengjiu.wang@nxp.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <1667793912-18957-1-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: shengjiu.wang@gmail.com
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

On 07. 11. 22 5:05, Shengjiu Wang wrote:
> With plughw device and mmap case, the plug pcm fast_ops pointer is same
> as slave pcm fast_ops, but ops pointer is different, which cause
> the "bus error" in snd_pcm_rate_slave_frames.
> 
> The test command is
> arecord -Dplughw:x -r12000 -c2 -fS16_LE -M temp.wav
> 
> This patch is to add pcm type check as commit:
> d21e0e01 pcm: plugin - fix avail_min calculation on rate plugin
> 
> Fixes: d9dbb57b ("pcm: rate - rewrite the may_wait_for_avail_min callback for the rate plugin")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>   src/pcm/pcm_rate.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/src/pcm/pcm_rate.c b/src/pcm/pcm_rate.c
> index e8815e8b..dc502202 100644
> --- a/src/pcm/pcm_rate.c
> +++ b/src/pcm/pcm_rate.c
> @@ -1304,8 +1304,11 @@ static snd_pcm_uframes_t snd_pcm_rate_slave_frames(snd_pcm_t *pcm, snd_pcm_ufram
>   static int snd_pcm_rate_may_wait_for_avail_min(snd_pcm_t *pcm,
>   					       snd_pcm_uframes_t avail)
>   {
> -	return snd_pcm_plugin_may_wait_for_avail_min_conv(pcm, avail,
> -							  snd_pcm_rate_slave_frames);
> +	if (snd_pcm_type(pcm) == SND_PCM_TYPE_RATE)
> +		return snd_pcm_plugin_may_wait_for_avail_min_conv(pcm, avail,
> +								  snd_pcm_rate_slave_frames);
> +	else
> +		return snd_pcm_plugin_may_wait_for_avail_min_conv(pcm, avail, NULL);
>   }
>   
>   static const snd_pcm_fast_ops_t snd_pcm_rate_fast_ops = {

It's not a correct fix. The snd_pcm_t pointer passed to all fast ops functions should be in sync with the callback implementation.

I tried to fix this issue in commits:

https://github.com/alsa-project/alsa-lib/commit/aa4f56c3c952269c36464cc0da9db5a1381648fa
https://github.com/alsa-project/alsa-lib/commit/39060852d810461dc8cd1464cfb2ffe84da42d56

Let me know, if this update does work for you. Thank you for your report.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
