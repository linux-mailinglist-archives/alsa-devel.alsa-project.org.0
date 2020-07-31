Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCB5239FA5
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 08:26:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40BCD166D;
	Mon,  3 Aug 2020 08:25:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40BCD166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596436006;
	bh=8mD+nqB33TkoOoj/gJgWM5VeBC7j95G7SbgFkstL1+Y=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dMUv2VC1UZKjGk1+ZYTucTk4BLMTULtKGp4KL2yzixz1m1KI2S2B/dreM23aB8tg9
	 cK7VT4f/4yRphfs6ddWYBtnJCW3kRbARSTPMYKAbINwx0Ng7GGEpP2smhMSccW/cJA
	 r15FJGxrtv0o6LoKNnox2shVSqiXf97hllzEWySU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CDEFF80148;
	Mon,  3 Aug 2020 08:25:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CAC7F80171; Fri, 31 Jul 2020 11:20:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31BA5F80111
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 11:20:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31BA5F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kYONy1EG"
Received: by mail-lf1-x143.google.com with SMTP id m15so15815617lfp.7
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 02:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=8mD+nqB33TkoOoj/gJgWM5VeBC7j95G7SbgFkstL1+Y=;
 b=kYONy1EGZKl0txXMXdnNJT1Y23m2++O6HdGV8zLgsm4sCEMAk4SBmQNWhlxd1RyFjF
 mH9uaD7kMfSnJQuXDiqulF7cksFMlMFyQu1uhXZJKRRkx/rfeldFPCsO2st4PnmT/kDq
 GgQWPaMYzTpc2zdZcMeYUCGhg0EPuQUpoOWYoK/2aGEYM9vehvSOPrTkPc3veCvTt9+4
 vBmykpfMFEq9dDLUBzRBMzYkCzqkG+OST7U2uHzggevt/iPDVH0iMUQZFOaFL7U7aUQA
 EGMxdwknpaXiN9Z1bmHGl6cwvZpRnPncn/hh48VAwiif+7nAFYKUPceAD4e6TjEWS9uL
 A6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
 :date:message-id:mime-version;
 bh=8mD+nqB33TkoOoj/gJgWM5VeBC7j95G7SbgFkstL1+Y=;
 b=ll7fej8rvzPlhgZ4TzFPKbahDIwFI76A7oFb7kgHJaDUJgAcYKkKwLWC52dCa3wnNW
 mQx5nQFm2X9MAf1DFfsLa4USLMY/3EphCJBpN8M48ENvAyY9xSqo++2LXRlcXOQYrHXS
 JgSx1HvISKeW1Fdd55xZstmOQlsMgTDikJjtoxAmpllHnyBJ203uPj+gbhYUQMEhFw2X
 /LD47qBaNbA/HMKhQ1P2w7CRlnRk+z4sSb/nO0x9FbqAAGEui98iWRYpmfDq+ryHV1yK
 lcZ4qJxmUav1v73HQBNUsb3bgfF+Huecx8XTE0yPEFkIWTW1Y9JAjbbGts3F49r7R7OT
 LDlA==
X-Gm-Message-State: AOAM531MaI+X0AfNZoKd0fgcjXDKdRTw7ExDS8/kS0Fqnung0M7qxoJm
 d57p+owGAZ4Q6UGz6rjkDWE=
X-Google-Smtp-Source: ABdhPJzX+r8g5hxwtM4cWf4LYMeGpaFl7y04AtV1EWXCDj7oMyC8Q9bisj8CbBCupPDW3m2AB12hbw==
X-Received: by 2002:a19:8607:: with SMTP id i7mr1555288lfd.208.1596187209458; 
 Fri, 31 Jul 2020 02:20:09 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
 by smtp.gmail.com with ESMTPSA id v26sm1546603lji.65.2020.07.31.02.20.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 31 Jul 2020 02:20:08 -0700 (PDT)
From: Felipe Balbi <balbi@kernel.org>
To: Kees Cook <keescook@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/3] usb: gadget: udc: Avoid tasklet passing a global
In-Reply-To: <20200716030847.1564131-2-keescook@chromium.org>
References: <20200716030847.1564131-1-keescook@chromium.org>
 <20200716030847.1564131-2-keescook@chromium.org>
Date: Fri, 31 Jul 2020 12:20:02 +0300
Message-ID: <87zh7gm471.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
X-Mailman-Approved-At: Mon, 03 Aug 2020 08:25:02 +0200
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Oscar Carter <oscar.carter@gmx.com>, Mitchell Blank Jr <mitch@sfgoth.com>,
 kernel-hardening@lists.openwall.com, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, alsa-devel@alsa-project.org,
 Allen Pais <allen.lkml@gmail.com>,
 Christian Gromm <christian.gromm@microchip.com>, Will Deacon <will@kernel.org>,
 devel@driverdev.osuosl.org, Jonathan Corbet <corbet@lwn.net>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Julian Wiedmann <jwi@linux.ibm.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Nishka Dasgupta <nishkadg.linux@gmail.com>, Jiri Slaby <jslaby@suse.com>,
 Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Wambui Karuga <wambui.karugax@gmail.com>, Kees Cook <keescook@chromium.org>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-input@vger.kernel.org, Ursula Braun <ubraun@linux.ibm.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Kyungtae Kim <kt0755@gmail.com>,
 netdev@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Kevin Curtis <kevin.curtis@farsite.co.uk>, linux-usb@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 Romain Perier <romain.perier@gmail.com>, Karsten Graul <kgraul@linux.ibm.com>
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

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

Kees Cook <keescook@chromium.org> writes:
> There's no reason for the tasklet callback to set an argument since it
> always uses a global. Instead, use the global directly, in preparation
> for converting the tasklet subsystem to modern callback conventions.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>

looks okay to me.

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8j4kIACgkQzL64meEa
mQZ6zQ//ZXtGFv/fRsm1+M9OI2t7qOY4ZsyygLSKzdncJp2pYVhKXNiMOjtYNxRV
Hv8GjhXRlsOn7pZZ+BqcYWDjvJM20owDzT0NS7oeLKFeIXB6QR5Y/viDETy3MkId
eq1gPhxbK2szcyYVUqC6/qaOuDVpPV4PKlLDPfXev8REL78mYBAgKb5a8kVuZnjo
Lcg64xhnc9YAc5gj+f2HnybldhmU606mRQt/RDQlK9uUymMsD7rZw0L6zfV5r7AY
0oWUzryBMvVMMZ3l0ZpdiSWqoRVgOplih5AHcH4SFZq/5Rv14F7ILAV3JNsIoGZ3
x7MwtAJuIBmBNr48PSDtLu5ntF8OpRLhwBvt6onOzbOyqpk6TnjfbmVHcorlWtfE
tSy2qOo9W6Smc6NsFLcaoYlZUVAiPr2R0Ogap0ISvFF6nBe1b3CEp9Hco79blWCy
1CiCwhq17U6q3tgrRRc34+zewtdAYw+Xze3TNBhQi3EOuCjNNXAoNl6v20/8LOsI
lijSWagZFc7o3LM9xsxWhFVrAWI5bXY+1CmPdwd4dHbaCXg2rcQ33MGP0Uum/bHu
DijJZ1LszhIf1RgXrOD/kmY/WmSh4Nh6nQkdssxXSabz0oN0wsuxMfgNqnkcnIj9
56pCsJHf2phFZyTaMDgzL17tcfor5xQQs27yAoGI1ygKelTGAjY=
=ua4k
-----END PGP SIGNATURE-----
--=-=-=--
