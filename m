Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 021752F2FBF
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 14:03:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91A1C1680;
	Tue, 12 Jan 2021 14:02:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91A1C1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610456601;
	bh=V6PKO8Tsrb/tQwzWxfJTeh0sRBo/oZwKuHRYJjmPPEg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aHKXQUzhiDPqKHNapZNJGh1kg8rXRqyiHUKvQ8AUskcgCGnD4c5BbDDvzGAbwl7JH
	 OK/3485tTKLpLcttRJ6uU0Abk7Hd367LxsKDmNo3ARdrCLaVlTSlkQ7LTcVoi+Vana
	 wC8Qt3gf28HGlMwB4YWwA8CAnvryFkkn7T2EJ4R0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 977A0F80475;
	Tue, 12 Jan 2021 14:00:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3C56F80279; Tue, 12 Jan 2021 14:00:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D86F7F8025E
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 14:00:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D86F7F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="i4/OO+X/"
Received: by mail-io1-xd2a.google.com with SMTP id w18so3773103iot.0
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 05:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Bl6G1rAuVb/adOj0Od9vL1lMatTSfI2ajKlBHjpw74Y=;
 b=i4/OO+X/N2LqDVoD/jUzcozf+EvAiReaJZr5ICPWBOpNFleYALweAck7rcfG2NxIs7
 2englFESSMpZ6PFu5aS2ADPGCn9ndkqC8dfrKUr88qZiJeES4MV7s8SLpdpmdETnP5IR
 6YjpCWXl6mUWgBTQvI6VaPMGu040n2dZ9BgLjPTCVENHAAPvj3dEB4dVK9ChWO2wgndx
 Pc1rx8lUB/BM1pock/z3EdMURVFH149yiBw+IBpq41j5KSTSG64dTDb01Tt58/GYAOBO
 FdhNgiQsazyihjhW/rlAlWuo1ExObV54m6S2E2AMdVRvjM+e0llFMreb77i85dAL4CYs
 SbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Bl6G1rAuVb/adOj0Od9vL1lMatTSfI2ajKlBHjpw74Y=;
 b=MElmKmmBhDIpAdCPVoz2Tt97yHQUp9Yug4oPwAYxA8YNYUdwCUkcYuJKp+ZBJ2+iti
 pNfR00tigUiVYx53CIxH1ln8xRlA3QyMg+f9XgTaGy0AAPyrld5Y0txHnngQgfRk8O1w
 J7uG42+QFb5MrLPKbRQLLD6zYjNn8VewB952gO3MwWrH8w1k17EBOgTbTnGsGqIDrknK
 umpsnds5EIP8Zltd7220VQYHWceT5DJKfNxzSEzSXIdeTezad6s+zIoVkIx4MbcUijyw
 l5EuomzovIbKnh6M0+RV8Q4OkcIenwEnDn6pMvE55SbXs3PvENywGClaDiq4hNgRWb1f
 N2DQ==
X-Gm-Message-State: AOAM530vbolNv5S1J1JFrFSjcsEHg0xaU/FoKQ1olFUIYbUiOn2hL6YK
 bwQ1tuY0Hnd6a385sXP9e3c=
X-Google-Smtp-Source: ABdhPJx2M5LbtmFtPAAXjJ5AseYWFasODAQS6NYgRqyuHb72NP/iLxCMNlDew00AMwFldJQUdkJ6zA==
X-Received: by 2002:a92:c104:: with SMTP id p4mr3814264ile.228.1610456441534; 
 Tue, 12 Jan 2021 05:00:41 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id j12sm2801519ili.48.2021.01.12.05.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 05:00:40 -0800 (PST)
Date: Tue, 12 Jan 2021 14:00:37 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2 0/2] fix tegra-hda on tegra30 devices
Message-ID: <X/2ddbamUzXECZDT@ulmo>
References: <20210108135913.2421585-1-pgwipeout@gmail.com>
 <s5hv9c2sgxd.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="drqTfn9TqBQMdij7"
Content-Disposition: inline
In-Reply-To: <s5hv9c2sgxd.wl-tiwai@suse.de>
User-Agent: Mutt/2.0.3 (a51f058f) (2020-12-04)
Cc: alsa-devel@alsa-project.org, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Sameer Pujar <spujar@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 linux-clk@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Mohan Kumar <mkumard@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>
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


--drqTfn9TqBQMdij7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 09:22:38AM +0100, Takashi Iwai wrote:
> On Fri, 08 Jan 2021 14:59:11 +0100,
> Peter Geis wrote:
> >=20
> > The following patches fix tegra-hda on legacy tegra devices.
> > Two issues were discovered preventing tegra-hda from functioning:
> > -The hda clocks on tegra30 were assigned to clk_m and running at too low
> > of a rate to function.
> > -The tegra-hda encounters an input/output error when opening a stream.
> >=20
> > Since the only mainline device that used tegra-hda until recently was t=
he
> > t124, it is unknown exactly when this was broken. Fortunately a recent
> > patch was submitted that fixed the issue only on t194 devices. We can
> > apply it to the tegra30-hda device to resolve the issue across the boar=
d.
> > Note that downstream devices used the spdif device instead of hda for h=
dmi
> > audio. The spdif device lacks a driver on mainline.
> >=20
> > -Checkpatch seems to have issues finding [1], but git show has no issue.
> > [1] commit 60019d8c650d ("ALSA: hda/tegra: workaround playback failure =
on
> > Tegra194")
> >=20
> > Changelog:
> >=20
> > v2:
> > -Added ack and reviewed-by from Jon
> > -Updated fix to apply to tegra30-hda vice universally (Thanks Jon)
> > -Updated commit to include comments from hardware team (Thanks Sameer)
> > -Cleaned up commit messages
> >=20
> > Peter Geis (2):
> >   clk: tegra30: Add hda clock default rates to clock driver
> >   ALSA: hda/tegra: fix tegra-hda on tegra30 soc
>=20
> Shall I apply both patches via sound git tree?
>=20
> Or, if you want to take through clk tree, let me know.  In that case,
> feel free to take my ack:
> Acked-by: Takashi Iwai <tiwai@suse.de>

There doesn't seem to be a build-time (or even runtime) dependency
between the two patches and they fix two independent issues, so they
could also go in separately.

I'm fine either way. From a Tegra perspective, the Tegra30 clock driver
is very low activity, so I don't expect any conflicts with between this
and some other patches that might go in through the clock tree.

Thierry

--drqTfn9TqBQMdij7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/9nXUACgkQ3SOs138+
s6GqTg/+OADUywchD2A60VkcQ2urUoARq6t0hydg25Ly37rjRWhl92PWQ9V3YULd
HZAA38q+/PzszkSs0ivCRKPV9QPz/YjOjpJgR3XX0GSOCxXMzxcni4GKQ5p06BsG
hCadEe1K+YXSznQn1hX6hjuuPWjSs2ZijMM/yTILil0fAd5P4LTxkbuGgxwFPXPf
/g2j/KY1IYwPotwYuOdn9eakJJaHTZJAV3pO6eDiJ+WYC4u0tPZLiCtozSSPxCAF
IZJZuBzFiMgurxjTMIlQW82Mn0R7Bpr9ERlAGIVGaPMKOugajQV/lg9223SHPlei
4tnGIU6Ven7HhFQYWxvzV32GFiuNorsSDMbCAqObPglo30Qt0jSW+DDEn9ymb9rg
owNjg8+7+uckLTRggIWoMv5eG2gh+inGOE31uNx5umn0U72JVAqjjM2YgCA5+nB4
G8lHQXFsEM4phFj+SwH1mT1u8xBeEQ5FB++hHZGX6Q3UQe4XN8w2JRAwroGRsupS
oan0d5kY0aSxzRxqXRbAFFt6SmkV+1vH1Qt0NrjAji9k9jEw/8kHcgeEEG52mHZe
c4ykdSeLwM40vCLLjAH5frO0mCGwy87y7epP8fq9t2mAFhnE6te1JZZh2d66mH7k
y3qIffocs2VEyxyMnK+EPceKMMDCg09LerCkt7ON2gde9ymVANk=
=csJX
-----END PGP SIGNATURE-----

--drqTfn9TqBQMdij7--
