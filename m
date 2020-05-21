Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD511DC5DE
	for <lists+alsa-devel@lfdr.de>; Thu, 21 May 2020 05:47:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA38E1825;
	Thu, 21 May 2020 05:46:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA38E1825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590032836;
	bh=pRVMj4ZH0h/5F/GFZzp2+Cg7kB0wUyoF2B8d307i0rQ=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kiHhVDVqmUnbvMsRwIolbwORTLaLNai9RzNt4ahDTIwLYv0DXKtbFr8iG1+FzTjSF
	 uqOMYl+p33XZFMA93ysQLFZ6rGsvONCLVAeLOUSS7mFWY4LPg3qEaIZTRxFyfJvWQN
	 qElVmamrkTXpF4lk/rvp2xcp0tpIwNvXrM3fJLcs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC055F801A3;
	Thu, 21 May 2020 05:45:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24C09F801D8; Thu, 21 May 2020 05:45:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFB2BF80161
 for <alsa-devel@alsa-project.org>; Thu, 21 May 2020 05:45:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFB2BF80161
Received: from imladris.surriel.com ([96.67.55.152])
 by shelob.surriel.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <riel@shelob.surriel.com>)
 id 1jbc8w-0006nk-50; Wed, 20 May 2020 23:45:14 -0400
Message-ID: <d75c3a3cda51149a054838652243de2b8ac20854.camel@surriel.com>
Subject: Re: XHCI vs PCM2903B/PCM2904 part 2
From: Rik van Riel <riel@surriel.com>
To: Alan Stern <stern@rowland.harvard.edu>
Date: Wed, 20 May 2020 23:45:13 -0400
In-Reply-To: <20200520203417.GA23602@rowland.harvard.edu>
References: <273cc1c074cc4a4058f31afe487fb233f5cf0351.camel@surriel.com>
 <20200520163840.GA11084@rowland.harvard.edu>
 <667d8d156fa5d8420ef1c3b1d08b94a10d2398cc.camel@surriel.com>
 <20200520203417.GA23602@rowland.harvard.edu>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-SzGJaqzGbl8x/tsVgjRx"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>
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


--=-SzGJaqzGbl8x/tsVgjRx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-05-20 at 16:34 -0400, Alan Stern wrote:
> On Wed, May 20, 2020 at 03:21:44PM -0400, Rik van Riel wrote:
> >=20
> > Interesting. That makes me really curious why things are
> > getting stuck, now...
>=20
> This could be a bug in xhci-hcd.  Perhaps the controller's endpoint=20
> state needs to be updated after one of these errors occurs.  Mathias=20
> will know all about that.

I am seeing something potentially interesting in the
giant trace. First the final enqueue/dequeue before
the babble error:

          <idle>-0     [005] d.s. 776367.638233: xhci_inc_enq: ISOC
0000000033a6879e: enq 0x0000001014070420(0x0000001014070000) deq
0x0000001014070360(0x0000001014070000) segs 2 stream 0 free_trbs 497
bounce 196 cycle 1

The next reference to 0x0000001014070360 is the babble error,
and some info on the ISOC buffer itself:

          <idle>-0     [005] d.h. 776367.639187: xhci_handle_event:
EVENT: TRB 0000001014070360 status 'Babble Detected' len 196 slot 15 ep
9 type 'Transfer Event' flags e:C
          <idle>-0     [005] d.h. 776367.639195: xhci_handle_transfer:
ISOC: Buffer 0000000e2676f400 length 196 TD size 0 intr 0 type 'Isoch'
flags b:i:I:c:s:I:e:C

Immediately after the babble error, the next request is enqueued,
and the doorbell is rung:

          <idle>-0     [005] d.h. 776367.639196: xhci_inc_deq: ISOC 0000000=
033a6879e: enq 0x0000001014070420(0x0000001014070000) deq 0x000000101407037=
0(0x0000001014070000) segs 2 stream 0 free_trbs 498 bounce 196 cycle 1
          <idle>-0     [005] d.h. 776367.639197: xhci_urb_giveback: ep4in-i=
soc: urb 0000000072126553 pipe 135040 slot 15 length 196/196 sgs 0/0 stream=
 0 flags 00000206
          <idle>-0     [005] d.h. 776367.639197: xhci_inc_deq: EVENT 000000=
0097f84b16: enq 0x00000010170b5000(0x00000010170b5000) deq 0x00000010170b56=
70(0x00000010170b5000) segs 1 stream 0 free_trbs 254 bounce 0 cycle 1
          <idle>-0     [005] ..s. 776367.639212: xhci_urb_enqueue: ep4in-is=
oc: urb 0000000072126553 pipe 135040 slot 15 length 0/196 sgs 0/0 stream 0 =
flags 00000206
          <idle>-0     [005] d.s. 776367.639214: xhci_queue_trb: ISOC: Buff=
er 0000000e2676f400 length 196 TD size 0 intr 0 type 'Isoch' flags b:i:I:c:=
s:I:e:c
          <idle>-0     [005] d.s. 776367.639214: xhci_inc_enq: ISOC 0000000=
033a6879e: enq 0x0000001014070430(0x0000001014070000) deq 0x000000101407037=
0(0x0000001014070000) segs 2 stream 0 free_trbs 497 bounce 196 cycle 1
          <idle>-0     [005] d.s. 776367.639215: xhci_ring_ep_doorbell: Rin=
g doorbell for Slot 15 ep4in

However, after that point, no more xhci_handle_transfer: ISOC
lines ar seen in the log. The doorbell line above is the last
line in the log for ep4in.

Is this some area where USB3 and USB2 behave differently?

dmesg:=20
https://drive.google.com/open?id=3D1S2Qc8lroqA5-RMukuLBLWFGx10vEjG-i

usb trace, as requested by Mathias:=20
https://drive.google.com/open?id=3D1cbLcOnAtQRW0Chgak6PNC0l4yJv__4uO

--=20
All Rights Reversed.

--=-SzGJaqzGbl8x/tsVgjRx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEKR73pCCtJ5Xj3yADznnekoTE3oMFAl7F+UkACgkQznnekoTE
3oO+PAf+KRwyLSAqD1QWNerMZF5VpLDf1fe9DWc+r8YG2W1H5mx/vtB/k0tMt/vA
skoIIv/i/UsjmcZJDxuEKk56fZSGoV8plHYzgSk13xoast8OcZAdaC3lXFWtFq1V
x62IKORBC4pJmgtaITWLTsqgHNfrgOfKClnQJmxZPmSm6CHbD8cyONTjb7IAy9Mf
7EUE6oJBWLqtzELXHXIf3YKMWYu5sePAKziLd+Tow5cF2SCqSDQHrizk72xM5rBY
QQmZNdQWTA83Gvbeh5I9oMLCMp0bChxi4+hx7IYc6A+jfyV51yTBsqU2q4FWbBpO
kZ2fKMyazQtvULM3lj1nNoNP0s8Esg==
=+/sv
-----END PGP SIGNATURE-----

--=-SzGJaqzGbl8x/tsVgjRx--

