Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1DD12A17B
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Dec 2019 13:58:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0117816AA;
	Tue, 24 Dec 2019 13:57:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0117816AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577192285;
	bh=iP06Q3bN9vhYrzMF3Z5iDDj2qqvJUZcdK7H9shCmDxQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IO0bZ0Arxq5tex8Ba0g+2Uc/EA99ow24xfxSkgeJhbpPPNK7nA12oOBBU/KrtosZa
	 +s744vOdc8GXXG1ZUrSrV6aTJ2K6ZlBwtvlVrsCR2QWjpQF1MRSk5oUHCe6QsK99bk
	 xTKzYUZEDuxeENr6Qz1Z/I6PSzqWFTY43l3phpOM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC9F5F8019B;
	Tue, 24 Dec 2019 13:56:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 930C2F80148; Tue, 24 Dec 2019 13:56:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDF1CF800E3
 for <alsa-devel@alsa-project.org>; Tue, 24 Dec 2019 13:56:17 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C1CCEA004B;
 Tue, 24 Dec 2019 13:56:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C1CCEA004B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1577192176; bh=CMTPb3S+ByBZszZCDOpZHTJb9NvrcHala3gBS9iX7C0=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=FT5/MAA0JkfDjzJLyz+lncbg86TQhyttwoRdDGVIBq3bA53RrGAb6SoJN5ojE4DPk
 uJRHc2j1vvJmSeWvEke6ODiF0U9Gd4OJi+wWYBLykF3Y68pBFqnciAYdbR/51UlsBK
 kRyCThWK+DKu4Ph278xUF71uHqe2ec11NAHUugLM=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 24 Dec 2019 13:56:12 +0100 (CET)
To: alsa-devel@alsa-project.org
References: <20191223093347.15279-1-o-takashi@sakamocchi.jp>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <a7b60d53-848e-6679-8b54-050c1d3a1f22@perex.cz>
Date: Tue, 24 Dec 2019 13:56:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191223093347.15279-1-o-takashi@sakamocchi.jp>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>
Subject: Re: [alsa-devel] [PATCH] ALSA: ctl: allow TLV read operation for
 callback type of element in locked case
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

Dne 23. 12. 19 v 10:33 Takashi Sakamoto napsal(a):
> A design of ALSA control core allows applications to execute three
> operations for TLV feature; read, write and command. Furthermore, it
> allows driver developers to process the operations by two ways; allocated
> array or callback function. In the former, read operation is just allowed,
> thus developers uses the latter when device driver supports variety of
> models or the target model is expected to dynamically change information
> stored in TLV container.
> 
> The core also allows applications to lock any element so that the other
> applications can't perform write operation to the element for element
> value and TLV information. When the element is locked, write and command
> operation for TLV information are prohibited as well as element value.
> Any read operation should be allowed in the case.
> 
> At present, when an element has callback function for TLV information,
> TLV read operation returns EPERM if the element is locked. On the
> other hand, the read operation is success when an element has allocated
> array for TLV information. In both cases, read operation is success for
> element value expectedly.
> 
> This commit fixes the bug. This change can be backported to v4.14
> kernel or later.
> ---
>   sound/core/control.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/core/control.c b/sound/core/control.c
> index 3fa1171dc1c2..49f3428dfacb 100644
> --- a/sound/core/control.c
> +++ b/sound/core/control.c
> @@ -1398,8 +1398,9 @@ static int call_tlv_handler(struct snd_ctl_file *file, int op_flag,
>   	if (kctl->tlv.c == NULL)
>   		return -ENXIO;
>   
> -	/* When locked, this is unavailable. */
> -	if (vd->owner != NULL && vd->owner != file)
> +	// Write and command operations are not allowed for locked element.
> +	if (op_flag != SNDRV_CTL_TLV_OP_READ &&
> +	    vd->owner != NULL && vd->owner != file)
>   		return -EPERM;
>   
>   	return kctl->tlv.c(kctl, op_flag, size, buf);
> 

Thanks. Good catch. I would change only the comment back to /* */ to be
consistent with the other sound/core code.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
