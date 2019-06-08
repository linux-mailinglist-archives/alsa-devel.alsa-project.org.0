Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D644E3A13F
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2019 20:40:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32C8B166D;
	Sat,  8 Jun 2019 20:39:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32C8B166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560019209;
	bh=+F9AWce5D0UZjbPzqZHCQg90xqAnBag8ANjXjI7mscc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gCXg6qX63oaZb+rLVRi8k+C3YbiyxaASSLnOTrbsDZvYi2mzaGotoyubTVc+OvBaT
	 v7hfYrdBNbf8Ujs2PS4eZE3/X9sMtDc34mj/v1FoZkhrjC40HTbLvPR00xl4Mw3nkM
	 i9L3wWXL4utbE0j7Svo9WDwtqoOHeJ2IbJp+ALnk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7205EF896F8;
	Sat,  8 Jun 2019 20:38:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3777F896F7; Sat,  8 Jun 2019 20:38:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12F29F896CE;
 Sat,  8 Jun 2019 20:38:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12F29F896CE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jun 2019 11:38:11 -0700
X-ExtLoop1: 1
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.251.93.16])
 ([10.251.93.16])
 by orsmga006.jf.intel.com with ESMTP; 08 Jun 2019 11:38:09 -0700
To: Adam Miartus <amiartus@de.adit-jv.com>, patch@alsa-project.org
References: <1559910203-29795-1-git-send-email-amiartus@de.adit-jv.com>
 <1559910203-29795-2-git-send-email-amiartus@de.adit-jv.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <4418bd15-24a0-401a-9d86-709fc99d7b49@intel.com>
Date: Sat, 8 Jun 2019 20:38:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1559910203-29795-2-git-send-email-amiartus@de.adit-jv.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH 1/2] pcm_file: do not disrupt playback on
 output file write fail
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

On 2019-06-07 14:23, Adam Miartus wrote:
> previously playback could be interrupted by snd_pcm_file_add_frames:
>      assert(file->wbuf_used_bytes < file->wbuf_size_bytes)
> 
> in case snd_pcm_file_write_bytes fails to write full amount of bytes
> to file, variable wbuf_used_bytes would not be fully decremented by
> requested amount of bytes function was called with
> 
> for the assert to trigger, multiple write fails need to happen, so
> that wbuf_used_bytes overflows wbuf_size_bytes,
> 
> this patch will allow application to report error code to api user
> who might have an idea how to recover, before assert is triggered,
> also reporting error along with the print out message might give user
> a better idea of what is going on, where previously reason for
> mentioned assert was not immediately clear
> 
> Signed-off-by: Adam Miartus <amiartus@de.adit-jv.com>
> ---
>   src/pcm/pcm_file.c | 36 ++++++++++++++++++++++++------------
>   1 file changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/src/pcm/pcm_file.c b/src/pcm/pcm_file.c
> index 1ef80b5..a1d15d6 100644
> --- a/src/pcm/pcm_file.c
> +++ b/src/pcm/pcm_file.c
> @@ -381,27 +381,31 @@ static void fixup_wav_header(snd_pcm_t *pcm)
>   
>   
>   
> -static void snd_pcm_file_write_bytes(snd_pcm_t *pcm, size_t bytes)
> +/* return error code in case write failed */
> +static int snd_pcm_file_write_bytes(snd_pcm_t *pcm, size_t bytes)
>   {
>   	snd_pcm_file_t *file = pcm->private_data;
> +	snd_pcm_sframes_t err = 0;
>   	assert(bytes <= file->wbuf_used_bytes);
>   
>   	if (file->format == SND_PCM_FILE_FORMAT_WAV &&
>   	    !file->wav_header.fmt) {
> -		if (write_wav_header(pcm) < 0)
> -			return;
> +		err = write_wav_header(pcm);
> +		if (err < 0) {
> +			SYSERR("%s write failed, file data may be corrupt", file->fname);
> +			return err;
> +		}

write_wav_header already dumps "Write error" on failure. Both messages 
are quite similar. Your message dumps filename though, so it's clearly 
more descriptive - consider updating write_wav_header SYSERR message all 
along while simplifying code here.

>   	}
>   
>   	while (bytes > 0) {
> -		snd_pcm_sframes_t err;
>   		size_t n = bytes;
>   		size_t cont = file->wbuf_size_bytes - file->file_ptr_bytes;
>   		if (n > cont)
>   			n = cont;
>   		err = write(file->fd, file->wbuf + file->file_ptr_bytes, n);
>   		if (err < 0) {
> -			SYSERR("write failed");
> -			break;
> +			SYSERR("%s write failed, file data may be corrupt", file->fname);
> +			return err;
>   		}
>   		bytes -= err;
>   		file->wbuf_used_bytes -= err;
> @@ -412,15 +416,18 @@ static void snd_pcm_file_write_bytes(snd_pcm_t *pcm, size_t bytes)
>   		if ((snd_pcm_uframes_t)err != n)
>   			break;
>   	}
> +
> +	return 0;
>   }
>   
> -static void snd_pcm_file_add_frames(snd_pcm_t *pcm,
> -				    const snd_pcm_channel_area_t *areas,
> -				    snd_pcm_uframes_t offset,
> -				    snd_pcm_uframes_t frames)
> +static int snd_pcm_file_add_frames(snd_pcm_t *pcm,
> +				   const snd_pcm_channel_area_t *areas,
> +				   snd_pcm_uframes_t offset,
> +				   snd_pcm_uframes_t frames)
>   {
>   	snd_pcm_file_t *file = pcm->private_data;
>   	while (frames > 0) {
> +		int err = 0;
>   		snd_pcm_uframes_t n = frames;
>   		snd_pcm_uframes_t cont = file->wbuf_size - file->appl_ptr;
>   		snd_pcm_uframes_t avail = file->wbuf_size - snd_pcm_bytes_to_frames(pcm, file->wbuf_used_bytes);
> @@ -437,10 +444,15 @@ static void snd_pcm_file_add_frames(snd_pcm_t *pcm,
>   		if (file->appl_ptr == file->wbuf_size)
>   			file->appl_ptr = 0;
>   		file->wbuf_used_bytes += snd_pcm_frames_to_bytes(pcm, n);
> -		if (file->wbuf_used_bytes > file->buffer_bytes)
> -			snd_pcm_file_write_bytes(pcm, file->wbuf_used_bytes - file->buffer_bytes);
> +		if (file->wbuf_used_bytes > file->buffer_bytes) {
> +			err = snd_pcm_file_write_bytes(pcm, file->wbuf_used_bytes - file->buffer_bytes);
> +			if (err < 0) {
> +				return err;
> +			}

Suggestion: drop unnecessary brackets.

> +		}
>   		assert(file->wbuf_used_bytes < file->wbuf_size_bytes);
>   	}
> +	return 0;

Hmm. For snd_pcm_file_write_bytes you've chosen a different form: 
newline + return. Code looks more cohesive if it's "formatted" in the 
same fashion.

>   }
>   
>   static int snd_pcm_file_close(snd_pcm_t *pcm)
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
