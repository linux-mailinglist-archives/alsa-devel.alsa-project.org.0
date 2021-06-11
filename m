Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A443A4B65
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Jun 2021 01:48:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E8801AB1;
	Sat, 12 Jun 2021 01:47:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E8801AB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623455294;
	bh=7snQ1lsR3Jw5YSnjnAIoqMzvNLQa6McMpm/xBm5nPpc=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KsMSCIwjlpVQanvKSH8aJ4rC1llyYGaa2HdceQeSy1GmLrSSekytStqxTOOspONKH
	 pKtwZStRmKDFYA8BeNuF3JK8seCH15felq35Zd8beGvLaF3Xci7FTHS1N/TgIQJHqo
	 SeADpwvKthS0kHoNdvxtnUAHmuASNITIqT7Exsuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6CB6F80276;
	Sat, 12 Jun 2021 01:46:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCF0FF8026C; Sat, 12 Jun 2021 01:46:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A058F800FB
 for <alsa-devel@alsa-project.org>; Sat, 12 Jun 2021 01:46:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A058F800FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=vt-edu.20150623.gappssmtp.com
 header.i=@vt-edu.20150623.gappssmtp.com header.b="hWWOILzI"
Received: by mail-qt1-x834.google.com with SMTP id a15so3898127qtx.13
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 16:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vt-edu.20150623.gappssmtp.com; s=20150623;
 h=sender:from:to:cc:subject:in-reply-to:references:mime-version
 :content-transfer-encoding:date:message-id;
 bh=9k5XTuzdGjpcIWll5aNtcDOwxzv06WPFRNlOE7yNKzU=;
 b=hWWOILzIj3GVS133jYfWoDePKUXOfR6PPnuTZGbbkuQzy0ANnotLLpzqCt7AspwSR6
 TWFcnYKNczG36U7xSyWIXJclofsB5ZxG/0ElGlUTeG8EOmK5iSeOYJaGVDtf/ptUuYcg
 TY/k9bbaI1XRc0QpMUMduMNO70tspZ9S6ZiM4Tqsf+qjuv/oZcpKGiX7bDqrxlWumkel
 /xm26vs9qCY+d2N6JeNCysnExHSUp79owoYY4CO+T+N4hhKcKcRFCacbRUg8o1FedqAu
 mVpL3uCCSjOl2LsrFjXv3L/3EnZT20j8QONlw6gXrNjdGTuiM3/Ed6ntDQFrZpqSBmDu
 a8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
 :mime-version:content-transfer-encoding:date:message-id;
 bh=9k5XTuzdGjpcIWll5aNtcDOwxzv06WPFRNlOE7yNKzU=;
 b=Zz3LA9ruuV7n+4lNwlt3mTTGvmaq7X6skkUpbsLey972YPrQ8pzY1SGij0uvLDiAy1
 E8lR6AxegRXaFPesG41pAxXM5Jik5ig+FVoZClX108WkdFYQWIsh/R77ugls0e4+LBfe
 9ck1EWHHDHoXvXN3X0lhVCSNZqz8nMikjNnjnUJKsIW03GGJtFAy4XENOjOXlEZLHBn+
 9gLO4mED3hhAwW53GtDON5VMKGwRd+IAtezRJfrOAzcwbBMzi3cVh8LpFRcDrIPhLiI6
 u0paiYQ836z+B731tuVM3JPW+IIcghJzYO2HyVSfv1FGKehM85Fx5OK0aiu+2ZLy09A2
 JVDg==
X-Gm-Message-State: AOAM532asthyY9xxwoy7SifIwy4HvFkIqoFbYsL5QJTZltmvhkO38vW7
 vkQzs9ZD3Mty7l1nvKqNQKXBQg==
X-Google-Smtp-Source: ABdhPJxDo9CKPwfYYQ62I6co+RpPSdFHSZp0VsmTQ8KneCoKgTbWkekdRlvpRjBbJ2rtjB3lgfF5MA==
X-Received: by 2002:ac8:5ed5:: with SMTP id s21mr6420142qtx.87.1623455196302; 
 Fri, 11 Jun 2021 16:46:36 -0700 (PDT)
Received: from turing-police ([2601:5c0:c380:d61::359])
 by smtp.gmail.com with ESMTPSA id g5sm5496121qke.101.2021.06.11.16.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:46:35 -0700 (PDT)
From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks"
 <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.9.0 11/07/2018 with nmh-1.7+dev
To: Muni Sekhar <munisekharrms@gmail.com>
Subject: Re: USB sound card issues
In-Reply-To: <CAHhAz+haTa8FJep+mokae4O7Gy9zzq2dbPk28fuEH5FO24uTzw@mail.gmail.com>
References: <CAHhAz+haTa8FJep+mokae4O7Gy9zzq2dbPk28fuEH5FO24uTzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1623455194_23653P";
 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date: Fri, 11 Jun 2021 19:46:34 -0400
Message-ID: <26698.1623455194@turing-police>
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

--==_Exmh_1623455194_23653P
Content-Type: text/plain; charset=us-ascii

On Tue, 08 Jun 2021 16:20:07 +0530, Muni Sekhar said:

> $ arecord --device hw:1,0 --channels 1 --format S16_LE --rate 32000_Hz x.wav
> Recording WAVE 'x.wav' : Signed 16 bit Little Endian, Rate 32000 Hz, Mono
> arecord: pcm_read:2032: read error: Input/output error

Always check the obvious stuff first  does the card support S16_LE 32Khz data?
And if it's configurable for multiple formats, was it set for the correct one?

Does wireshark or other USB snoop program show any traffic at all?
Does the record die immediately, or hang for a few seconds and timeout?
Does 'arecord -v' or arecord -vv' tell us anything more about the situation?

--==_Exmh_1623455194_23653P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBYMP12gdmEQWDXROgAQLIDg/+OTEH8NUNHBi0Z0ZAwqC40hjQlz5u+K/x
/1Lm/4vfMZo5O9Xs3S1pgtTkElRWkKls5gErziSPTOFsKF9yAWsz+rTxKT4+NKNt
OK8DQicMfmbzKYNslThtm6V5JTLRJMGDtho6tK9K2V8n9C3WJTJHclvuTyWBXyLE
ZeJQa//b95ce8q+9e4MmYv9KU1Nyf7uKTleQPUWMNBcYC2MvB6okb/D6Q3N0zSZV
wWbMMC00oilqfkJxBw0AvjhdpQ+0Yc2dbx58NaIwirAs/okE1z1uPJoW05XoSdwo
unQuKKa6qoN85wwo4qkKjN2H4Ev9ao5+427M+xPPc2AjhBoctNzA7CQJeg9ZmyTI
T1ewBD8sxNrharNeZ0BLtMTgpfcFhpXCLOcaMbUqIqu9iE6hDypACSWYSLZgN1ee
fJr8tkIe6qUx75VbbY1f0H+UfRqVrogp/EFqJYQaiXL461Ls0Lc4PyzqRMEMEjwR
vRMjOci0Q1tbEO0UXjaw7XSs8lKE0IcBYHGOBGanrPNDfDlMu0RCbAeWiHgC0vxn
ZFZ4m37nJN0Pj9mQiuyk1RAzTMyOCc/t213dNjOElYb8ZpvqjyHngIxTtAHzCSVG
g1l5m6gXxWM54gN6pDn/4sk40TPmwPHNcCaYpzkUa2/8xudTs/zZ+lQoc8Znd4nx
LxU/hQOag6s=
=1MM3
-----END PGP SIGNATURE-----

--==_Exmh_1623455194_23653P--
