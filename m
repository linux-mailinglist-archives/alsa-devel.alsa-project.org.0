Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B82C94470AF
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Nov 2021 22:34:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E6B783B;
	Sat,  6 Nov 2021 22:33:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E6B783B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636234451;
	bh=7sv3PS/S2Yogwyvs8Y7pKxwKcAvujl736cT5jF4irIE=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QItIZHcaVf/mKdz9Qkapxfv8CPJK0VuAv3VFD66xhirbUhJV5oSe9Unw2ib0D++PO
	 hTeajnWr3rx0gfKSSPJIdvR5Uyn89kX08iSFuBlSfqJIAX+iuYxC0VsThx10BIbqZN
	 mA+qwjdROWjb668gVXEHNfgo9nJjUO+qA8WPWpCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C90CBF80169;
	Sat,  6 Nov 2021 22:32:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09E46F8025D; Sat,  6 Nov 2021 22:32:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dog.elm.relay.mailchannels.net (dog.elm.relay.mailchannels.net
 [23.83.212.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FFAFF8012A
 for <alsa-devel@alsa-project.org>; Sat,  6 Nov 2021 22:32:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FFAFF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=thevertigo.com header.i=@thevertigo.com header.b="CYwSLL4G"
X-Sender-Id: dreamhost|x-authsender|kip@thevertigo.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 6F876620DEE;
 Sat,  6 Nov 2021 21:32:32 +0000 (UTC)
Received: from pdx1-sub0-mail-a275.central1.pdx1.dh-int.com (unknown
 [127.0.0.6]) (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 0C9EB620D50;
 Sat,  6 Nov 2021 21:32:32 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|kip@thevertigo.com
Received: from pdx1-sub0-mail-a275.central1.pdx1.dh-int.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.105.57.75 (trex/6.4.3); Sat, 06 Nov 2021 21:32:32 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kip@thevertigo.com
X-MailChannels-Auth-Id: dreamhost
X-Slimy-Thread: 28abc0b524cd4dcd_1636234352324_3987246292
X-MC-Loop-Signature: 1636234352324:4202973197
X-MC-Ingress-Time: 1636234352324
Received: from kip-desktop.kip-router (unknown [192.252.230.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: kip@thevertigo.com)
 by pdx1-sub0-mail-a275.central1.pdx1.dh-int.com (Postfix) with ESMTPSA id
 4HmrFC4mL1z1NS; Sat,  6 Nov 2021 14:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=thevertigo.com;
 s=thevertigo.com; t=1636234351; bh=0p77l1wotqJ53nnpMh8Oqd9ik4g=;
 h=Subject:From:To:Cc:Date:Content-Type;
 b=CYwSLL4GXckSDjop074W1giUz0u/OhAgsIW81JHcWR6PeqnaP8AOrgDweVxNLfgzJ
 kWp2Yp3hbTI2ZHhQFXgO2ITYVBuCriTQRZ0nbWejiEDwXQIVXqIS2IVuzOGnXoonjz
 voeaf0u4dC0ypk4bcmPvxI2C8BJm1U+rrN+faTa4=
Message-ID: <4cbf9bb8d417414d720560c05bddc9a2714e0975.camel@thevertigo.com>
Subject: Re: [Alsa-user] USB audio on riscv64
From: Kip Warner <kip@thevertigo.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Sat, 06 Nov 2021 14:32:30 -0700
In-Reply-To: <s5ha6ihdm24.wl-tiwai@suse.de>
References: <f2ec64dab6a74c7eee0625533d3c3630adb62a41.camel@thevertigo.com>
 <CAJZ5D0bnMA=zZPztvQB4h0sXhU2og9D84QH8CXx5-GRWeu+4Ug@mail.gmail.com>
 <e91d7a44b9a456141d856ea57aa2948c3be4422f.camel@thevertigo.com>
 <s5h35oahppb.wl-tiwai@suse.de>
 <3832054fd315605b19bd9d74977f83078a95ee08.camel@thevertigo.com>
 <s5hr1bue8fz.wl-tiwai@suse.de>
 <35c65f0177395968c01ea4b00d52c021cf2f9191.camel@thevertigo.com>
 <s5ho86xeoiy.wl-tiwai@suse.de>
 <07abba7df72f0dd27432a5dcda46f6b24483b78d.camel@thevertigo.com>
 <s5ha6ihdm24.wl-tiwai@suse.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-8yjUSESx2Bp0R4/X6PLG"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Cc: Alsa-user@lists.sourceforge.net, alsa-devel@alsa-project.org,
 Dmitri Seletski <drjoms@gmail.com>
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


--=-8yjUSESx2Bp0R4/X6PLG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2021-11-06 at 22:13 +0100, Takashi Iwai wrote:
> It depends rather on your system setup and desktop environment.
> Usually the device file permissions are managed by logind and
> modified dynamically at login via ACL.
>
> As it's no kernel issue, better to ask your distro.

It probably is a distro issue. But at least we know now that it works
and it's just a matter of fiddling with permissions. Thanks Takashi.

--=20
Kip Warner -- Senior Software Engineer
OpenPGP=C2=A0signed/encrypted mail preferred
https://www.thevertigo.com

--=-8yjUSESx2Bp0R4/X6PLG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEaUi0dj/qpTzsKe4xRLRlxF7U4wQFAmGG9G4ACgkQRLRlxF7U
4wTIjA//RYXrQaWhg13M1MnAVaMy4k44Cir2Wio3fuGKKrCo1y+zX4GTu6w3ogxN
C6dYJj5PQ4+rpXwNchKaXUXVz5oCtcU8cW4UO7gFxJtMYJVfLKEGDN900EUqRMwq
L8UKv6w9D8pNLTfUr9nfYoXAyJHcNg7BkWDbXKrT1ZrTX34Vn7lbcT2i7dKa09/+
Cj/x2bmeSt/rmiZmZHmfdHwsptG5TPA8c2pzh95+XBS4HKt8xKNxkug7mO7ctoOV
++xXFPj8UpjXIM0xxwR4sX9Kr5Wk5r9Fq8Mo8nd4rfOBfVBrwCjvlHoZ7X3xZDEG
sS831opfvtWK51jjRcFJCeJPAp2PLZX7hd7hxsYGCq2cJpw0P5M460Tw/b3YVvCQ
3c7LHXWu9cP35ihGOve+/2xr5pYdy6Kz3XjawTof5/5WBt4s1lHN4F0UhHT62GmU
79zyCXPIUknIMBKAVJLWnIsu23hcp/qRpbaUgYXvA1NmHiXxjtfJphds/V/IbIy7
RG5ze/D0LRyDC77+QPQhJFSX+fOmAoWPZS3il9WnUuYIvCQ05eIA8dg1niYgWoeY
gMQbuYGmNlTIVQSMLmfst4zWEckzMKh5stDxM9BhNzcfyH4wgqt+nCrKiOEWlLwq
BMZ2LBHOtngwY2+1mcuOsKxh4P4Wab3IIgPan7R0SbbGgTj/bnQ=
=NtmZ
-----END PGP SIGNATURE-----

--=-8yjUSESx2Bp0R4/X6PLG--

