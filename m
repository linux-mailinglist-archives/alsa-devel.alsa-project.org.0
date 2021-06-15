Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DED23A76F7
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 08:16:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8566168F;
	Tue, 15 Jun 2021 08:15:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8566168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623737775;
	bh=5p6r7tT6JpnFVOCQc0t32V8ptgw1D+osB0n0nDQ9dZU=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lGOgWSBy49ia11J/pE/VKrXybB1Lk03q2jrK2ZRgl7VEzDbMmx/xnALBLTyybfAvM
	 IFtwMT+3YyfKYn9OGxxUayyLA2QolhuVQ16MSjEGy09LYowWRXnVqcxRkOz43dDsa3
	 VlNrtQfZdNE0mz3aWg7lyemN40UM6xm78UGtI6Ug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 401DBF8016C;
	Tue, 15 Jun 2021 08:14:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F37CDF800F7; Tue, 15 Jun 2021 08:14:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F35E1F800F7
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 08:14:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F35E1F800F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=vt-edu.20150623.gappssmtp.com
 header.i=@vt-edu.20150623.gappssmtp.com header.b="T2bnSnYN"
Received: by mail-qv1-xf36.google.com with SMTP id im10so20944665qvb.3
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 23:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vt-edu.20150623.gappssmtp.com; s=20150623;
 h=sender:from:to:cc:subject:in-reply-to:references:mime-version
 :content-transfer-encoding:date:message-id;
 bh=5p6r7tT6JpnFVOCQc0t32V8ptgw1D+osB0n0nDQ9dZU=;
 b=T2bnSnYNFfcwYBnxPxx2HOKCb0V6e+i0YyfI7rzyxiD5eF8+LeGZqMdv6Br3Mv6YDo
 jiWnTvbaLy8JONXsbpg4jTXZHgJTV9j5bLBjqNANfEHpjMLF4iPM1BYbz0WUj67zJejR
 kMz2QQBmzxq6o2c3yd/Ml2IIlFQCItgG9zEnxqwoA3fpfRznf1LY8KrcObSCH83Lavit
 WkRsAD7krZzpsBlSJFFStB+LWq3LxyDRA085FpTBfzcllEiYg4o7KPAJzXu8gldIkdUz
 pIh97MFFN1kNR95Yq7i5S91vj+2nRuAQ5PeR46FeHTAJXael3ddOt2Q4Q9BBpLg9pY4J
 6fng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
 :mime-version:content-transfer-encoding:date:message-id;
 bh=5p6r7tT6JpnFVOCQc0t32V8ptgw1D+osB0n0nDQ9dZU=;
 b=syZSAxUWECYpjyA8qleJZJUXnBWQv5vhtZFaNepaQfqMq1+lSSyxwGJ1KRSOBDAkme
 gD3jCuIiypKGj1QXzZ8jwOG8jQgsdcyjEBz3sp5Yq7naBrQ7JWniSyof7/35u8MoYX4C
 kpH8ghbCB03mDBXxiSuA9HUbPNnFnjCy9s44vb7PZ5peMBn0ciaBPiNn9DyeOffOXkah
 olMICF5+0/NkZxIjiTPw2scdTm0F375FFyieqIwjtn7D57zA1Z43Dds4DteJkzwMAMxa
 UCN17nwOvUC4ju1igVQ7pHVAJF/w8T7NaIwcOGIB/v6PDiEZMgpA14MbomqibpNqAzoU
 v+2g==
X-Gm-Message-State: AOAM532jyzU7DJEoSpoll74S/ooloNLnTou8d5SnZvD9sI7nwcfDZa+F
 fZWklnnx/ib+6CTvr6qQM/Ug2Q==
X-Google-Smtp-Source: ABdhPJxMAdHu3UVivt6CyjfIbsc13nvBGRaXL9cOxzuyGEdMnuynC8A7XlRVCPMCQBrHGUpWEqlprg==
X-Received: by 2002:ad4:4513:: with SMTP id k19mr3455852qvu.10.1623737662368; 
 Mon, 14 Jun 2021 23:14:22 -0700 (PDT)
Received: from turing-police ([2601:5c0:c380:d61::359])
 by smtp.gmail.com with ESMTPSA id d10sm9126220qko.73.2021.06.14.23.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 23:14:21 -0700 (PDT)
From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks"
 <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.9.0 11/07/2018 with nmh-1.7+dev
To: Muni Sekhar <munisekharrms@gmail.com>
Subject: Re: USB sound card issues
In-Reply-To: <CAHhAz+goVhacpDPc-OaVuG151TS8QKYdsqdnK9UcAx+Hc07zSg@mail.gmail.com>
References: <CAHhAz+haTa8FJep+mokae4O7Gy9zzq2dbPk28fuEH5FO24uTzw@mail.gmail.com>
 <26698.1623455194@turing-police>
 <CAHhAz+goVhacpDPc-OaVuG151TS8QKYdsqdnK9UcAx+Hc07zSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1623737660_27061P";
 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date: Tue, 15 Jun 2021 02:14:20 -0400
Message-ID: <27987.1623737660@turing-police>
Cc: alsa-devel <alsa-devel@alsa-project.org>, linux-usb@vger.kernel.org,
 linux-sound@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>
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

--==_Exmh_1623737660_27061P
Content-Type: text/plain; charset=us-ascii

On Sat, 12 Jun 2021 16:45:00 +0530, Muni Sekhar said:

> > And if it's configurable for multiple formats, was it set for the correct one?
> Is there a way to verify was it set for the correct one or not?

arecord -v gives what it thinks the setup is.

> > Does the record die immediately, or hang for a few seconds and timeout?
> What is the difference between these two ways?

An immediate failure is usually related to a "Can't do it" situation where the
USB interaction to configure the device has failed, while a timeout usually
indicates that the configuration at least *claimed* to succeed, but is failing
to properly transfer valid data.

> For my hardware, I noticed that it hangs for a few seconds and gives EIO (arecord:
> pcm_read:2032: read error: Input/output error).

Given that the usbmon output ran to several megabytes, that's tending to
point at "the card was returning lots of packets, but they weren't actually the
format/data that arecord was expecting.

--==_Exmh_1623737660_27061P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBYMhFPAdmEQWDXROgAQLflRAAs+j4NzJsZvDoYyONGr7oogKXJeN9xOeC
MZ4TriWfaNZFsJjF4vZLASaJHchFooza6IVmfXyydw5eaDqiMjY29248qWt3Udcn
pX0riM8ss4f1PZHJJ1wxXUB7xyWllk8B7rSUCQVQzleBa869EnUBL8scgZo4wfFR
bLcIWoB6MOYzCWUCAH46qKVBlDfuF21vH3X/njcPoYVDFkBzrWBdtf7EZRNUD4eF
OZECVvE6Wlf7FrAhMX7Z25MKEtvFk/5/3XO18vMvB+iI/4mcqgYhhTbL9T20kHxn
X5Z4diY31QZNRitK7uQvBCv70moH0gyP5wmP1qaEV6NV3PojwBsC2UlvkKx0Rq8q
Yj/+3BEhaJI3lmKnFzNKaAlxSoWLtkfaiYz3fq0s04kQg36j05eV+UuzvKMe6Nvi
PiB/QPhDAqpnxWCEQ8vAi9CXV/pM46ZdPFJlZtLZZe0RcwCRKKUfGKFVK9i19cRX
ifhZOMUtHdcQi8j7cDuauFQYd4j+M8wLsTEd7E4G0vEcp+hebC66s+cWMP0Ofg0f
OVRT4jHovw4UQuimQ5M7dc0B+MAqLUYv8caoHgBI3/Wvy7de/b7tSGwoEt8uZbha
opHBCfQ+5lxTwMn66g6GGMEarC1CCjD0D9DtaT4DaDHzx/ZUNg9w+rxS/sKJen+i
Q40iY/MKlhU=
=3wIB
-----END PGP SIGNATURE-----

--==_Exmh_1623737660_27061P--
