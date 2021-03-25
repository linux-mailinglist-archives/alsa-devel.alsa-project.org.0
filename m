Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC09348D8E
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 10:59:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96C9B165D;
	Thu, 25 Mar 2021 10:58:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96C9B165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616666341;
	bh=33s2uZtwdJYeaj4xs99BBdcklMy3SEEzXA9M/LxLMRc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hncaernF6fuhkn9Zn/mL26mokMOHUsVRLC8P45EPpHmSvxfUml+pJMTqCTFoEQhVe
	 Ez/HXh+sPl8vtbeEjb7gb+2driUKz4A7OOc3kAq3YF2cgaSKj3wyg9xQ++4rQag1MZ
	 jrYpDIb2nGEIu7GjchPpGyEOZudjkGOdSe8HoN+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CB21F80268;
	Thu, 25 Mar 2021 10:57:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4477F8025F; Thu, 25 Mar 2021 10:57:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B2CCF80104
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 10:57:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B2CCF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HwDSmJt1"
Received: by mail-qt1-x833.google.com with SMTP id u8so1157332qtq.12
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 02:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gdI6DcPZqtntEW0jhnI8vupfZnjL8/OD+UtlEEYlAz8=;
 b=HwDSmJt1uzWTJwLwEZ4Et40GsmLIvuZcksX9+nrnLTvA79xnsyfn+7wVNMfbWEPcD8
 28rqEVaXgDpzpg0RUQD5XI4QZxYsKtdb+FYSuEXMUz5TNfHQ3l+NS+6eJQu8+33loxvj
 zhnbte74g8HkU2gyztVzUOYSubNamX4dYP9Q4c0zvPEVl+shicg8JgFcPEi5MYxXUG6+
 k5vJ1J5qcCE+nu4sImsMIWaLzDatM66mks9D/VJsFr1rrnAgNWm9DwJ6Em3uvC62PV6t
 GnbV1py5WLGy6sko05KivMwZAhfbiSE/TkoMw7Gx3tOhy+23Wy3xBTrNanci/WyojxnH
 KEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=gdI6DcPZqtntEW0jhnI8vupfZnjL8/OD+UtlEEYlAz8=;
 b=kJFltWtc4p+88FvNGA1pRGjqHb7jRVg3dsp6SdNS1bhryT6ReYrhtMn5EGSJGeH1jS
 HIjW450CpSAIhFN5V+/5hf05xVl3+qaukNOh1XjS1LMiO8PFvqqhEDRcygEjqLLnCC7M
 ef73hDOLYVbZ2TlO70OMn9QsSZjgjp5Ovq7ft4Zl2uyP12WLcn/MS8HiNbDrB+/6YYTe
 J1k2w6IRbXpkrag9e7BQR5J9MGZPGhPypkU+hhlKKsVS1msOE9o56sQbR40qi4KakFCa
 9qnzNxJv7QYzoiTpbaX4z+Xsmkme9cienxqP2Wod5PdgIAWMgQtDDSDSSxtk1WJp/dLe
 nRwQ==
X-Gm-Message-State: AOAM533qMhZD0cstpUZvIFGeOdh7wbbLw9980bpIbJXFFN/wNv/WzHQv
 mCOmXlQWwqafe+KRbEp1Dhk=
X-Google-Smtp-Source: ABdhPJzaev2WqpummeuaYWxBVbs21kqNmQGuIWH2GatgGmkdn+ZVQTditz4XmOpdizmnTOdZC0X1DA==
X-Received: by 2002:ac8:7f16:: with SMTP id f22mr6974724qtk.2.1616666242738;
 Thu, 25 Mar 2021 02:57:22 -0700 (PDT)
Received: from debian ([37.19.198.56])
 by smtp.gmail.com with ESMTPSA id g6sm3784009qkd.62.2021.03.25.02.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 02:57:22 -0700 (PDT)
Date: Thu, 25 Mar 2021 15:26:39 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH V3]  ALSA: pcm: Fix couple of typos
Message-ID: <20210325095617.GB32566@debian>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Takashi Iwai <tiwai@suse.de>, perex@perex.cz, tiwai@suse.com,
 broonie@kernel.org, mirq-linux@rere.qmqm.pl, lars@metafoo.de,
 gustavoars@kernel.org, huawei@kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org
References: <20210325090609.10372-1-unixbhaskar@gmail.com>
 <s5ho8f7mv5k.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Content-Disposition: inline
In-Reply-To: <s5ho8f7mv5k.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, linux-kernel@vger.kernel.org,
 tiwai@suse.com, gustavoars@kernel.org, huawei@kernel.org,
 mirq-linux@rere.qmqm.pl, broonie@kernel.org, rdunlap@infradead.org
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


--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 10:37 Thu 25 Mar 2021, Takashi Iwai wrote:
>On Thu, 25 Mar 2021 10:06:09 +0100,
>Bhaskar Chowdhury wrote:
>>
>> s/unconditonally/unconditionally/
>> s/succesful/successful/
>>
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>>  Changes from V2:
>>  Takashi pointed out that the patch was not applicable due to some unwan=
ted
>>  stuff get into it. Resending it with the new patch creation.
>
>Hrm, still not applicable.  Can you apply the patch from your own post
>via git-am in your side?
>
Here is what I do for this specific case :

=E2=9C=94 ~/git-linux/linux-next [patch L|=E2=9C=94]
15:18 $ sed -i 's/unconditonally/unconditionally/' sound/core/pcm_native.c
=E2=9C=94 ~/git-linux/linux-next [patch L|=E2=9C=9A 1]
15:19 $ sed -i 's/succesful/successful/' sound/core/pcm_native.c
=E2=9C=94 ~/git-linux/linux-next [patch L|=E2=9C=9A 1]
15:19 $ git add .
=E2=9C=94 ~/git-linux/linux-next [patch L|=E2=97=8F1]
15:19 $ git ci "Fix some patch error"
[patch 88d5af187dbb] Fix some patch error
 1 file changed, 2 insertions(+), 2 deletions(-)

15:21 $ git_fetch_single_file.sh sound/core/pcm_native.c
Looks alright!=E2=9C=94 ~/git-linux/linux-next [patch L|=E2=97=8F1]
15:21 $ git add .
=E2=9C=94 ~/git-linux/linux-next [patch L|=E2=97=8F1]
15:21 $ git ci "Bring for patch"
[patch 352e1ce8dacf] Bring for patch
 1 file changed, 2 insertions(+), 2 deletions(-)
=E2=9C=94 ~/git-linux/linux-next [patch L|=E2=9C=94]
15:22 $ git apply --verbose 0001-Made-patche-for-this.patch
Checking patch sound/core/pcm_native.c...
Applied patch sound/core/pcm_native.c cleanly.



>
>Takashi

--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAmBcXkAACgkQsjqdtxFL
KRURgwf/T3lfMkAI59EaBVQhjHhqTSYHhrkLt47MgwZgs1G7DdWbqAhSObm0iWiM
1Xz6PLJ3HussXX+SnZHvcLwGaAwJc0aN7a9ytLNhkQBTJ0MLgiAqcaD5Up6Bjlvs
s4+WzSCPU/sWFM8j/HNePTxQiG3/S/UGXddwjkosbaQYQXVyQkKM9hMtouzWF28G
PTteRB14akdKAYuF748L9j6dw7UCmAiHYQAPTGojWUdWgAG3ttOQOM7YClak0p9j
Y+OWd27UKI9b+ZD/bMzo8wfPme4BCjRnD8snCwnJwH2sPQlrk1Cj2/zGUUe0uRy3
nqTW8Ik4WUfTG6OpnU7I0T4K24W9FQ==
=j7Eq
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
