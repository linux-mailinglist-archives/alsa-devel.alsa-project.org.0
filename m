Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE494349197
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 13:09:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AC9A16A8;
	Thu, 25 Mar 2021 13:08:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AC9A16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616674151;
	bh=j+NQM84yspUbrxaer0qNsVo7FdQPC/Xci+BXkAnxVv8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rHKKGK1C2Y4daVRh3adkT6F123jKir0AWwe2LPLyWt6Ovpcilo4cCeZSmV9BWipat
	 q0c+2ka5GX0wxN7pEyvIPpqSCR2LNp9vJTw+2ujDJj6k+U0zYtUUIqv+Jrf7c2Pk46
	 Eb8gxY5JKeFE9gxF3HNvYq8+AC0EtMY66k8yO1bs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FCD0F80268;
	Thu, 25 Mar 2021 13:07:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEBB6F8025F; Thu, 25 Mar 2021 13:07:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11FC7F800FF
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 13:07:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11FC7F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PExBHGeQ"
Received: by mail-qt1-x835.google.com with SMTP id l13so1388210qtu.9
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 05:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kYT3ITsLPoPpWsYn5h5XRyDJBXwfCvVZAljAcGNbjnc=;
 b=PExBHGeQf3XDRWdPLd9QVOEqgEcEmE9x8OiWcgMxTB/E5WqTRXbRhoHAL18Omn35qu
 EO8ltdLUnCZXxccrkHhg+cEGHSUVoW3YFTDRfOFFU4IbDcDFWzLOp9Z5elbD72WVeCAb
 5+D/Xzi0mgWFshqs0aHn8hW1rTZbW5quQ6qppaIx3OKBrezCwbC3aRGwqforPZb6Z8So
 yYyH43jPAUJBYVw/EJtP2p1SNEtKX9vhE+H1xfnqN6fuqGlBxiW0dmxuB0+bntrqt9DL
 bRPPcnLFFWzEweMh2ZFrAV8g2UpWbGTz5Fsn3iwyRxPsTQ+oSpS4Wc6TfuZRl6mb4M/i
 TcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=kYT3ITsLPoPpWsYn5h5XRyDJBXwfCvVZAljAcGNbjnc=;
 b=k3E5uVJnyeoubK/obcpsenZatbcq7gtrBGvJkpTs4VzA+3ieOAGVfbkSZmv+QbDnYv
 xwEnlbOsPxaa/ER5PoDjmo6QuQEkjn1PlmGYzRx1HNvDogOV6ZDlBjV9O4v16/o9uqob
 pemhaCsXTVew0wcYy1mDcASFFiOvyPJfqMJ57Fq0pTTEkG45xLFFu5j8WHWwO9kvfY5t
 Lf5LkuospajDT4aMQwnWzDgQ7AUo9hxUOuLVdKybCvEXa4p6wym4WhBawaB+hwmUiTnz
 JoqjxNk/XaYaN4f6PSqO5IdhNiK/pFp5P9PF8KHG7sv3uSKiR0Q3xOj5voXuct/WSv6+
 SSRg==
X-Gm-Message-State: AOAM5305IltP7wU6F1kNlnhEKCxSkmufb6tCdXSCaAnqIZmNVeWlG6OG
 cOTpWaRaL6YO+QdF4vi/QVs=
X-Google-Smtp-Source: ABdhPJymF873pbmqSzUsLuRD42xGR/6NI7EqDjeGJoP725P8hDfxVpCjnrlnFJqXWdDXEiDjWzDwOw==
X-Received: by 2002:ac8:5a42:: with SMTP id o2mr7323604qta.191.1616674049100; 
 Thu, 25 Mar 2021 05:07:29 -0700 (PDT)
Received: from debian ([37.19.198.103])
 by smtp.gmail.com with ESMTPSA id e1sm3459859qti.10.2021.03.25.05.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 05:07:28 -0700 (PDT)
Date: Thu, 25 Mar 2021 17:37:19 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH V3]  ALSA: pcm: Fix couple of typos
Message-ID: <20210325120717.GA9273@debian>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Takashi Iwai <tiwai@suse.de>, perex@perex.cz, tiwai@suse.com,
 broonie@kernel.org, mirq-linux@rere.qmqm.pl, lars@metafoo.de,
 gustavoars@kernel.org, huawei@kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org
References: <20210325090609.10372-1-unixbhaskar@gmail.com>
 <s5ho8f7mv5k.wl-tiwai@suse.de> <20210325095617.GB32566@debian>
 <s5hk0pvmrwp.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline
In-Reply-To: <s5hk0pvmrwp.wl-tiwai@suse.de>
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


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 11:47 Thu 25 Mar 2021, Takashi Iwai wrote:
>On Thu, 25 Mar 2021 10:56:39 +0100,
>Bhaskar Chowdhury wrote:
>>
>> On 10:37 Thu 25 Mar 2021, Takashi Iwai wrote:
>> >On Thu, 25 Mar 2021 10:06:09 +0100,
>> >Bhaskar Chowdhury wrote:
>> >>
>> >> s/unconditonally/unconditionally/
>> >> s/succesful/successful/
>> >>
>> >> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> >> ---
>> >>  Changes from V2:
>> >>  Takashi pointed out that the patch was not applicable due to some un=
wanted
>> >>  stuff get into it. Resending it with the new patch creation.
>> >
>> >Hrm, still not applicable.  Can you apply the patch from your own post
>> >via git-am in your side?
>> >
>> Here is what I do for this specific case :
>>
>> =E2=9C=94 ~/git-linux/linux-next [patch L|=E2=9C=94]
>> 15:18 $ sed -i 's/unconditonally/unconditionally/' sound/core/pcm_native=
=2Ec
>> =E2=9C=94 ~/git-linux/linux-next [patch L|=E2=9C=9A 1]
>> 15:19 $ sed -i 's/succesful/successful/' sound/core/pcm_native.c
>> =E2=9C=94 ~/git-linux/linux-next [patch L|=E2=9C=9A 1]
>> 15:19 $ git add .
>> =E2=9C=94 ~/git-linux/linux-next [patch L|=E2=97=8F1]
>> 15:19 $ git ci "Fix some patch error"
>> [patch 88d5af187dbb] Fix some patch error
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> 15:21 $ git_fetch_single_file.sh sound/core/pcm_native.c
>> Looks alright!=E2=9C=94 ~/git-linux/linux-next [patch L|=E2=97=8F1]
>> 15:21 $ git add .
>> =E2=9C=94 ~/git-linux/linux-next [patch L|=E2=97=8F1]
>> 15:21 $ git ci "Bring for patch"
>> [patch 352e1ce8dacf] Bring for patch
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>> =E2=9C=94 ~/git-linux/linux-next [patch L|=E2=9C=94]
>> 15:22 $ git apply --verbose 0001-Made-patche-for-this.patch
>> Checking patch sound/core/pcm_native.c...
>> Applied patch sound/core/pcm_native.c cleanly.
>
>I meant to try to apply the patch from mail fetched from the ML, not
>the patch you made from your git tree.
>
>

Hmmmmmm

bhaskar@debian_16:18:41_Thu Mar 25 :~> mutt
Applying: ALSA: pcm: Fix couple of typos
error: corrupt patch at line 29
Patch failed at 0001 ALSA: pcm: Fix couple of typos
hint: Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Press any key to continue...


Something bugging it ....
>Takashi

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAmBcfPEACgkQsjqdtxFL
KRW03ggAtQwsG2J/1kiWlNSs6QF37p9WP/jvZTyvpfpH6zzH9GGbgd7s2NZVBbOA
6q0l86QrWe+gIvN2/23LygXUWFPXiF/eFxYU+2g7Ir2eg6mV7RSNbc7KyTHP75ze
CNwt6KpvyUD0HKMWgclK+TJU7+VNNO7pMPJ3O8vJCMiujzRLK+zsMbUx4l1OjLnl
qr5siOqzXmgrt4wgb1WIvYiZDCBcTOqQT5WoYbFp3Koy0sLcRVk5JP20IRlw28Q+
4BIk4FCJfC5X+wAmb1xQkpzIaNiYCEnfRvMJKbk6BVWWZozGnEudQoaDScpFlyRK
1mFQQyWy6a5JEyKiXu6zppy42ZbeKA==
=G0p9
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
