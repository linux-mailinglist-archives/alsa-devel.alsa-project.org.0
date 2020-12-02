Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC422CBC96
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Dec 2020 13:16:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3412116B9;
	Wed,  2 Dec 2020 13:15:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3412116B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606911374;
	bh=dHdu5NS4Xw4IX9X/GFAxYuxXCqWGRcHQlDUnVy182gE=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cka2xlYWmoEdrrP1fDkkNEycke9ItVycGJMTDIHDOgEEWMvMIMXDITwFXowWzvqQD
	 QyeLbR1Gu7OLiH/ufkt6PopETXPbtesEzmze5tUeGtvhe6YdEK3fYEH4174DGfXmX5
	 p/qMW8rfFm9OrJ3hv9ksBkTQ56jIVQThAR8BcTIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDD6DF8049C;
	Wed,  2 Dec 2020 13:14:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E6C1F80168; Wed,  2 Dec 2020 13:14:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC631F80168
 for <alsa-devel@alsa-project.org>; Wed,  2 Dec 2020 13:14:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC631F80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="qtDh7Ivv"
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CmHvM13p4z9sW0;
 Wed,  2 Dec 2020 23:14:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606911257;
 bh=dHdu5NS4Xw4IX9X/GFAxYuxXCqWGRcHQlDUnVy182gE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qtDh7IvvHnc1+eKidZ76vTxF/6g74s2Qv4NdJCP3ZbL1MvM7SMn0lhAVe5tKSzbZQ
 HAZWdo85rrG0VGkeOEqwRUPOnvHmcNv66RNAVaUJFUprFf5SkMq27aOekm8dbPRCY5
 gkzvsxHN3LwDnlCxInjPmxzTiDx21ibFqTqqu3eDy34Z8nkx1csBez+MJFFdL11gkd
 f/LwaVwDLEtHeYQ1e4yz1BkCIl0n6WAAZmXjde8XppUxjXPuEllv155QVe9hK1naST
 fh3/pL4XJyDtWcjIvBpmTiEV3p97PKO/mL+YIWoTYOapjBgcldMx3HEGaWB6OkoQ9g
 G0I0mDDBKdB0w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 2/2] powerpc/ps3: make system bus's remove and shutdown
 callbacks return void
In-Reply-To: <20201129173153.jbt3epcxnasbemir@pengutronix.de>
References: <20201126165950.2554997-1-u.kleine-koenig@pengutronix.de>
 <20201126165950.2554997-2-u.kleine-koenig@pengutronix.de>
 <s5hv9dphnoh.wl-tiwai@suse.de>
 <20201129173153.jbt3epcxnasbemir@pengutronix.de>
Date: Wed, 02 Dec 2020 23:14:06 +1100
Message-ID: <875z5kwgkx.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>,
 linux-scsi@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-block@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Geoff Levand <geoff@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jim Paris <jim@jtan.com>,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
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

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:
> Hello Michael,
>
> On Sat, Nov 28, 2020 at 09:48:30AM +0100, Takashi Iwai wrote:
>> On Thu, 26 Nov 2020 17:59:50 +0100,
>> Uwe Kleine-K=C3=B6nig wrote:
>> >=20
>> > The driver core ignores the return value of struct device_driver::remo=
ve
>> > because there is only little that can be done. For the shutdown callba=
ck
>> > it's ps3_system_bus_shutdown() which ignores the return value.
>> >=20
>> > To simplify the quest to make struct device_driver::remove return void,
>> > let struct ps3_system_bus_driver::remove return void, too. All users
>> > already unconditionally return 0, this commit makes it obvious that
>> > returning an error code is a bad idea and ensures future users behave
>> > accordingly.
>> >=20
>> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>>=20
>> For the sound bit:
>> Acked-by: Takashi Iwai <tiwai@suse.de>
>
> assuming that you are the one who will apply this patch: Note that it
> depends on patch 1 that Takashi already applied to his tree. So you
> either have to wait untils patch 1 appears in some tree that you merge
> before applying, or you have to take patch 1, too. (With Takashi
> optinally dropping it then.)

Thanks. I've picked up both patches.

If Takashi doesn't want to rebase his tree to drop patch 1 that's OK, it
will just arrive in mainline via two paths, but git should handle it.

cheers
