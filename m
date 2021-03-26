Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2490B34A234
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 07:55:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC2DB166A;
	Fri, 26 Mar 2021 07:54:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC2DB166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616741727;
	bh=PehycJVoQDQv77o1b+R7SM0Cf7uDAL6nv3gBWbK+0Lg=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZFJy+6E1CH+LBssTgyAit9Sj0OMfwE1ayRPqEf8avrWMmLyQSnHe3eNlg0OcIAv1H
	 X6UMGVW2EvguYKUWnvl5q94COUS6CIleuIoNJ/E9Z03fqve3U+FhMas4SFD0trHhwC
	 io32Qfpv4rihHv6vdBMjZaTj51kgOoF+c/9Ey8nQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C67DF801D5;
	Fri, 26 Mar 2021 07:54:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CF90F8016B; Fri, 26 Mar 2021 07:53:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEC5BF80104
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 07:53:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEC5BF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kfbwmYzd"
Received: by mail-qt1-x82c.google.com with SMTP id f12so3611716qtq.4
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 23:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=nUwFCtefq9Akj86fs38lRmS/6+y+x3jxc1EE8QP2oxA=;
 b=kfbwmYzd9ehL5KdkMxudoTA+LQSmRraO+Uj7iVqtHKa5ojhFA8Jx3Uv61jfMeXO7jo
 cCjKnAuO1kp2OFq22rGMtTXYPiSBaOmiTLkbx1+WpTY5kRh9w8OW/AmfATptftW2c/y7
 ESWi5i5qUfK2nTr7P8wA2vcJS7Vssmw8F2Wr+oerpkuMaBJ0P0twmbv/MLHSnpHFssFr
 lWtcz1T+EQSR/66gASxE9MFyTZAYd0NkS7xb51ibe8clS3vLNCJdXq+lRrxvNkQ/B2bW
 tmnB7uP+l/LXXWa9FtDalGlgXHQY8mnmT2ecur7qif/Po04i8Hq2+GyjnEEx8q/lcU4v
 HLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=nUwFCtefq9Akj86fs38lRmS/6+y+x3jxc1EE8QP2oxA=;
 b=Vc+LHKYVBMoFIm8DXlzJtqTLESuzqr45cS2XBDjaNEJ9zShgoONluF7RLecz69f5lA
 DI7tMG1nZ9U1TGG7oLpJ7T8sV9amyakBKze6pDjSJ8VH4AULljYZ1dNG2M6HHWocxhaI
 a0wTvy5Gp5ru2I3xLdJxo5u92MN1tVNA39xET4F2fnoNI9AlFC52eJky46n9JDGZQn9+
 cl/y66zKLlwNVo7QsqFLY3Uo5ZCK/7Rg+f82tdBF3Alds4voCuU8MXI2xpVGOp04V5g9
 0BN52bG84nfOGEkKRRdEcjZADaN2VeoztsTOU4iwJoiPu6W980xIk47a0VY3RH22b2Uq
 C0vA==
X-Gm-Message-State: AOAM5328XhePHKRTB6D1bSoGUyFhbYP9VVifv9Wia1b56m+BrVwrYwjs
 /RDYgDV5JzuOm0wg2eS0sEFJY4xO+S93PQ46
X-Google-Smtp-Source: ABdhPJydoab5AnAmnyhWxAtyEVod5CSEagF5rFVbo+FZJniNqy0g1jkltYo+65oE2y6iuu9XafXdLQ==
X-Received: by 2002:ac8:5913:: with SMTP id 19mr11112452qty.391.1616741630780; 
 Thu, 25 Mar 2021 23:53:50 -0700 (PDT)
Received: from Gentoo ([37.19.198.107])
 by smtp.gmail.com with ESMTPSA id r133sm6258784qke.20.2021.03.25.23.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 23:53:49 -0700 (PDT)
Date: Fri, 26 Mar 2021 12:23:40 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: Takashi Iwai <tiwai@suse.de>, perex@perex.cz, tiwai@suse.com,
 broonie@kernel.org, mirq-linux@rere.qmqm.pl, lars@metafoo.de,
 gustavoars@kernel.org, huawei@kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org
Subject: Re: [PATCH V3]  ALSA: pcm: Fix couple of typos
Message-ID: <YF2E9JEVH4ZzrmIC@Gentoo>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Takashi Iwai <tiwai@suse.de>, perex@perex.cz, tiwai@suse.com,
 broonie@kernel.org, mirq-linux@rere.qmqm.pl, lars@metafoo.de,
 gustavoars@kernel.org, huawei@kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org
References: <20210325090609.10372-1-unixbhaskar@gmail.com>
 <s5ho8f7mv5k.wl-tiwai@suse.de> <20210325095617.GB32566@debian>
 <s5hk0pvmrwp.wl-tiwai@suse.de> <20210325120717.GA9273@debian>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zCuWupg/ChuX+eaT"
Content-Disposition: inline
In-Reply-To: <20210325120717.GA9273@debian>
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


--zCuWupg/ChuX+eaT
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 17:37 Thu 25 Mar 2021, Bhaskar Chowdhury wrote:
>On 11:47 Thu 25 Mar 2021, Takashi Iwai wrote:
>>On Thu, 25 Mar 2021 10:56:39 +0100,
>>Bhaskar Chowdhury wrote:
>>>
>>> On 10:37 Thu 25 Mar 2021, Takashi Iwai wrote:
>>> >On Thu, 25 Mar 2021 10:06:09 +0100,
>>> >Bhaskar Chowdhury wrote:
>>> >>
>>> >> s/unconditonally/unconditionally/
>>> >> s/succesful/successful/
>>> >>
>>> >> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>>> >> ---
>>> >>  Changes from V2:
>>> >>  Takashi pointed out that the patch was not applicable due to some u=
nwanted
>>> >>  stuff get into it. Resending it with the new patch creation.
>>> >
>>> >Hrm, still not applicable.  Can you apply the patch from your own post
>>> >via git-am in your side?
>>> >
>>> Here is what I do for this specific case :
>>>
>>> =E2=9C=94 ~/git-linux/linux-next [patch L|=E2=9C=94]
>>> 15:18 $ sed -i 's/unconditonally/unconditionally/' sound/core/pcm_nativ=
e.c
>>> =E2=9C=94 ~/git-linux/linux-next [patch L|=E2=9C=9A 1]
>>> 15:19 $ sed -i 's/succesful/successful/' sound/core/pcm_native.c
>>> =E2=9C=94 ~/git-linux/linux-next [patch L|=E2=9C=9A 1]
>>> 15:19 $ git add .
>>> =E2=9C=94 ~/git-linux/linux-next [patch L|=E2=97=8F1]
>>> 15:19 $ git ci "Fix some patch error"
>>> [patch 88d5af187dbb] Fix some patch error
>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> 15:21 $ git_fetch_single_file.sh sound/core/pcm_native.c
>>> Looks alright!=E2=9C=94 ~/git-linux/linux-next [patch L|=E2=97=8F1]
>>> 15:21 $ git add .
>>> =E2=9C=94 ~/git-linux/linux-next [patch L|=E2=97=8F1]
>>> 15:21 $ git ci "Bring for patch"
>>> [patch 352e1ce8dacf] Bring for patch
>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>> =E2=9C=94 ~/git-linux/linux-next [patch L|=E2=9C=94]
>>> 15:22 $ git apply --verbose 0001-Made-patche-for-this.patch
>>> Checking patch sound/core/pcm_native.c...
>>> Applied patch sound/core/pcm_native.c cleanly.
>>
>>I meant to try to apply the patch from mail fetched from the ML, not
>>the patch you made from your git tree.
>>
>>
>
>Hmmmmmm
>
>bhaskar@debian_16:18:41_Thu Mar 25 :~> mutt
>Applying: ALSA: pcm: Fix couple of typos
>error: corrupt patch at line 29
>Patch failed at 0001 ALSA: pcm: Fix couple of typos
>hint: Use 'git am --show-current-patch' to see the failed patch
>When you have resolved this problem, run "git am --continue".
>If you prefer to skip this patch, run "git am --skip" instead.
>To restore the original branch and stop patching, run "git am --abort".
>Press any key to continue...
>
>
>Something bugging it ....
>>Takashi

Okay ,I have sent a V4 now and it seems working ....when I did a "git am fr=
om
mutt" and the result is getting reflected on linux-next file.

Takashi, could you please give it another shot....

~Bhaskar

--zCuWupg/ChuX+eaT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAmBdhOoACgkQsjqdtxFL
KRUj9Af+JK2fMeO4t4hVldwgvY3tOWTqZ3+7723IjuEMz38R9zZoIo9cWV89c24s
gs/jIWiRdB+HSQCLKoidZg3cZmbmssn6snv9M8J7f3gv4paasdXKNKSLtPmSSeYo
GSfvR5JjuUzQbZZA42uoIMCZRLB3fBP37kXdvwSgaPqHtgrkliNKQ43HT6xMIB4J
sR4VBL4rEicFObUOMs70Bzy1KmLsYCdahXoxmSFEHwLyIAQmEQPcTnoK2vFDlT3e
4rVj2b2LUJ22RaSRT5SaMjprmlNf4QhZGsWlyxhLe9TrgMr9hFPnoHggEyROSutY
SFmOti8eBtgRwV8dp4Gz6K6aqAOeXQ==
=HcJT
-----END PGP SIGNATURE-----

--zCuWupg/ChuX+eaT--
