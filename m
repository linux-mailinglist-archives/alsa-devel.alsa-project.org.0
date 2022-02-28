Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA004C6257
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 06:07:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 308151700;
	Mon, 28 Feb 2022 06:06:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 308151700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646024821;
	bh=R/d3zTORQX2Vl7fjUD8NgoNSGBKhvBVCb/nQ5NWlEPw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lvNJ5FuOtLUrneBH7N9mDzFSXlSA8J+WidH9YeqjHVu45EEJ9NhwiLmcnKN9Eh27B
	 QxxA1MxKcl/ff4pPQw4YjPwvc4BlFouOdHHX32Wo16pBAyPI3jGpjytxiGQ61J57xq
	 JzaMr5o/jZPT8zDvfYQpx1Xe2iFro5xJEpSq7Vdw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7AB5F80125;
	Mon, 28 Feb 2022 06:05:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F977F8013C; Mon, 28 Feb 2022 06:05:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=5.0 tests=FORGED_MUA_MOZILLA,
 INVALID_MSGID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from smtpbg156.qq.com (smtpbg156.qq.com [15.184.82.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01565F80054
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 06:05:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01565F80054
X-QQ-mid: bizesmtp67t1646024745tj66wpq4
Received: from [10.4.23.188] (unknown [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 28 Feb 2022 13:05:43 +0800 (CST)
X-QQ-SSF: 01400000002000C0F000B00A0000000
X-QQ-FEAT: hR9GyqeohShh3FTWiRf2epfDzkK3fKaGLqfkl7A0MZ5mg1lmRU+RkJQBM+NBc
 SbhMVolEMqkcavWTWZ0xjA46YurtDl/yBDWk+kIkiI/bli7GXmfE4ZmlKEbTzMbrBAD5rhg
 8nJIOFstISb8uzPOwAyk2NU6YDmEZwyom92qwgkuN5aqHvRsOYw2OunvGlUm37mgfevaFdZ
 tZLLz+/N7CNvZWq3qY8Go3tJ1TYqbpvTgMBTRRDHDxcQ82kxyg3CWLezkkQ/2naDR91UlAp
 g0x3NkrxuEF7+ZCzwpVOJjzQPPw3ftxtLBeG7U4E62PEv7rDGpeJx2oXgFSghWg48sX3Rho
 PG9mlFBQEnsM98hLbk+P5/TVrtS9FcjkGAykPQjFlPRGuDmZUo=
X-QQ-GoodBg: 2
Message-ID: <897fb1d8-440a-f70e-f83c-8ad19439598b@uniontech.com>+4B9CB7BD72A084A2
Date: Mon, 28 Feb 2022 13:05:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v2 2/2] ALSA: core: Remove redundant 'err' variable
To: Joe Perches <joe@perches.com>, perex@perex.cz, tiwai@suse.com
References: <20220228030614.10606-1-tangmeng@uniontech.com>
 <20220228030614.10606-2-tangmeng@uniontech.com>
 <486925d77d6c9f06b7b89e2c575a004bbda5bc3c.camel@perches.com>
From: tangmeng <tangmeng@uniontech.com>
In-Reply-To: <486925d77d6c9f06b7b89e2c575a004bbda5bc3c.camel@perches.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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



On 2022/2/28 12:21, Joe Perches wrote:

> 
> Perhaps clearer would be to make the typical return the last statement,
> return early and reduce the indentation too.
> 
> i.e.:
> 
> ---
>   sound/sound_core.c | 24 +++++++++++-------------
>   1 file changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/sound/sound_core.c b/sound/sound_core.c
> index 90d118cd91641..9f2cd6d91a034 100644
> --- a/sound/sound_core.c
> +++ b/sound/sound_core.c
> @@ -581,22 +581,20 @@ static int soundcore_open(struct inode *inode, struct file *file)
>   			new_fops = fops_get(s->unit_fops);
>   	}
>   	spin_unlock(&sound_loader_lock);
> -	if (new_fops) {
> -		/*
> -		 * We rely upon the fact that we can't be unloaded while the
> -		 * subdriver is there.
> -		 */
> -		int err = 0;
> -		replace_fops(file, new_fops);
> +	if (!new_fops)
> +		return -ENODEV;
>   
> -		if (file->f_op->open)
> -			err = file->f_op->open(inode,file);
> +	/*
> +	 * We rely upon the fact that we can't be unloaded while the
> +	 * subdriver is there.
> +	 */
> +	replace_fops(file, new_fops);
>   
> -		return err;
> -	}
> -	return -ENODEV;
> -}
> +	if (!file->f_op->open)
> +		return -ENODEV;
>   
> +	return file->f_op->open(inode,file);
> +}
>   MODULE_ALIAS_CHARDEV_MAJOR(SOUND_MAJOR);
>   
>   static void cleanup_oss_soundcore(void)
> 
> 
> 
Thanks, I  re-submit it according to your suggestions, and add you to 
the Signed-off-by list.



