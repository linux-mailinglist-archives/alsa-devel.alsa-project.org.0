Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91377348BF6
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 09:57:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18C641669;
	Thu, 25 Mar 2021 09:57:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18C641669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616662674;
	bh=1yrIWOl2HBWD5JseCVssc0inyDybw53Z+AUyAfVFF24=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QrwbL60Wx12iFq4uFVI6ZtvQFO80YCPf9CTxYx7lpOE/jK1gXRh2lYmIPqOSz8Dao
	 cLz3w5fT2wkffwPnV6pvTlkyTlMeKqrDdqv+H5popcgwTyI0ALBYILBa8/gnM4nFU+
	 sLGlr1lvzFXqjD25GhgBkq126TE2XIj57LuQu3dw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3637FF800FF;
	Thu, 25 Mar 2021 09:56:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89201F80257; Thu, 25 Mar 2021 09:56:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05881F80103
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 09:56:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05881F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bXCNa2fx"
Received: by mail-qk1-x734.google.com with SMTP id c3so1016651qkc.5
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 01:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=A9Ll1rmk8Y637in8AMrmKOLeqLVtJXFpIdS35azKjQg=;
 b=bXCNa2fxKiB+0sT2ZXOjC0LlF1J8Qdl5S8Chjh41KLd/MQOZK9mU1cvV9doePy48WT
 /7mvyOjW0ePLdRNGdhgXPjzLI4539f+OUXsakPbGFJCnSfOf1amUU4k45z3yqT8BLtQf
 tyUg6Jjpd/9IAMzlasFbQfhlMmt92gjRL9b3wS3RE/FknHHbj8RnJMj/Gg0S1fwd1z6A
 XSzqkOfpyVnNiBBkbKdTehLrlTrjwkFfGcLEscTbz1KMvcdiOCuRUMALsKFTWiNP5bmK
 aq3MGzGJ8dHV/iFJ3SgArKMp1YFp2clgBbndIHvmfF1DNef7mhhCOfOKyyJPkLv85IdP
 tl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=A9Ll1rmk8Y637in8AMrmKOLeqLVtJXFpIdS35azKjQg=;
 b=UnySG8w+oCkqR/XkVIBfAKkyIZkGfNAOYhZcSlHj4SdBVpXDkBLzaLkiB6fjIn9HfQ
 It0seHJ1yuTenDdv1R5kwKVqPV5zAqbwH/shEPlwmheBjoX6pgFX+vd+3LucIerlfTqO
 avwz212kxFCw8q7S1LLqAq0ubcvGyIIafS5UsRxYXMBUimvQmP6YVk5ZZVIvtqTvGIAk
 THqzYuSLNSp5hf6qzlLz/uqcWUqnxPgQGKof0hWRUv8W/JPbKS4jguZgjT9+dtYiastT
 ItdA1tOFuKLMqYu9htiSiAyI4pgMeVDm+19P6VvuHTx3DUkKOVbhDxhQnT6ectelIJ37
 hNGA==
X-Gm-Message-State: AOAM530Py1Oe71Nm+WK6/A18WXcpi3wU82Qg4H2vE/CxUtP/I4eCR0hK
 ExB1XP2mNK/FMSV510sf2/o=
X-Google-Smtp-Source: ABdhPJyz3D9nry+L8EmmLGLPSFz5xyRAipEq9HRK0onj8J3Wm+qbffJQd7ybXt2YVrla7lN7aSaLjA==
X-Received: by 2002:a05:620a:b01:: with SMTP id
 t1mr6745203qkg.422.1616662581665; 
 Thu, 25 Mar 2021 01:56:21 -0700 (PDT)
Received: from OpenSuse ([156.146.58.54])
 by smtp.gmail.com with ESMTPSA id t185sm2320878qke.83.2021.03.25.01.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 01:56:20 -0700 (PDT)
Date: Thu, 25 Mar 2021 14:26:12 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH V2] ALSA: pcm: Fix couple of typos
Message-ID: <YFxQLL/9FUi1LWxZ@OpenSuse>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Takashi Iwai <tiwai@suse.de>, perex@perex.cz, tiwai@suse.com,
 broonie@kernel.org, mirq-linux@rere.qmqm.pl, huawei@kernel.org,
 joe@perches.com, viro@zeniv.linux.org.uk, gustavoars@kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org
References: <20210325013631.3935-1-unixbhaskar@gmail.com>
 <s5hv99fn1b8.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="v4C+TDv/+3K0lmcR"
Content-Disposition: inline
In-Reply-To: <s5hv99fn1b8.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, gustavoars@kernel.org,
 linux-kernel@vger.kernel.org, rdunlap@infradead.org, tiwai@suse.com,
 huawei@kernel.org, mirq-linux@rere.qmqm.pl, broonie@kernel.org,
 viro@zeniv.linux.org.uk, joe@perches.com
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


--v4C+TDv/+3K0lmcR
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On 08:24 Thu 25 Mar 2021, Takashi Iwai wrote:
>On Thu, 25 Mar 2021 02:36:31 +0100,
>Bhaskar Chowdhury wrote:
>>
>>
>> s/unconditonally/unconditionally/
>> s/succesful/successful/
>>
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>
>The patch isn't cleanly applicable, some space was put at the
>beginning of the line incorrectly.  Possibly a MUA problem?
>Could you resubmit with git-send-email instead?
>
Whoops! let me send you a V2...
>
>thanks,
>
>Takashi
>
>
>> ---
>>  Changes from V1:
>>   Randy's finding incorporated ,plus the subject line adjusted.
>>
>>  sound/core/pcm_native.c | 82 ++++++++++++++++++++---------------------
>>  1 file changed, 41 insertions(+), 41 deletions(-)
>>
>> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
>> index 17a85f4815d5..afb670d7fd53 100644
>> --- a/sound/core/pcm_native.c
>> +++ b/sound/core/pcm_native.c
>> @@ -1425,7 +1425,7 @@ static int snd_pcm_do_stop(struct snd_pcm_substream *substream,
>>  		substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_STOP);
>>  		substream->runtime->stop_operating = true;
>>  	}
>> -	return 0; /* unconditonally stop all substreams */
>> +	return 0; /* unconditionally stop all substreams */
>>  }
>>
>>  static void snd_pcm_post_stop(struct snd_pcm_substream *substream,
>> @@ -1469,7 +1469,7 @@ EXPORT_SYMBOL(snd_pcm_stop);
>>   * After stopping, the state is changed to SETUP.
>>   * Unlike snd_pcm_stop(), this affects only the given stream.
>>   *
>> - * Return: Zero if succesful, or a negative error code.
>> + * Return: Zero if successful, or a negative error code.
>> --
>> 2.30.1
>>

--v4C+TDv/+3K0lmcR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAmBcUCkACgkQsjqdtxFL
KRXukAgAn0dvxJCoyiQUDrsGy0Kca1+cQdkarf3QqAnxtOArIbge+fMIDZHVA6AS
RosxNpZmrtOBkHoQTdxQUryxNn0Qo/yhS09/Ox7bZvQTTUEpwAlw8kR1wZttrxFl
+vNYVxxydUA82r7VCgT3vzY6/oO1XNu5pnikm2BviJ+jUlrT42MjEUCwoWzpU33e
HZHihfTvBDYmprBxeVJLaXKqVrVLYjSMzbCOx4KtygUM7MdYvRhjJ+4Q+6zpEv0C
M+nJeH15+bB6ytPoLGAD+kNzaYsyehAaNgB8y7lj2NHgy4oIN9yYmmcXlRfTARN5
IqTJBO/efwud7iy7eF2kBRkUUu1Kqw==
=5RR6
-----END PGP SIGNATURE-----

--v4C+TDv/+3K0lmcR--
