Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 245B268EEB7
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 13:15:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11247827;
	Wed,  8 Feb 2023 13:14:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11247827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675858515;
	bh=h83LFYg1036DlAQYGjRtYZhqea03R+l109S3GfwLeLc=;
	h=Subject:From:To:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g0/bzpUbN//d1KBb6FZbpGR/X2lDkrdlUbvC2sM8wxKwU+i0+4hodS93Kh7kMdIMT
	 O2JJc9PMOehrfd92K5SBuTQPx0+k0fGFFxkydX9w9hd+FONxUV/tx4NPpQNHuQ5mVq
	 gtqmauRHXLultD5tXRUOEHRhP+PHqVK89OPA+mYw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E65BF8012B;
	Wed,  8 Feb 2023 13:14:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D015F80152; Wed,  8 Feb 2023 13:14:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EA139F800AA
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 13:14:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA139F800AA
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pPjKb-0028L0-7w; Wed, 08 Feb 2023 13:13:45 +0100
Received: from p57bd9464.dip0.t-ipconnect.de ([87.189.148.100]
 helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pPjKa-000FU0-W6; Wed, 08 Feb 2023 13:13:45 +0100
Message-ID: 
 <f6317e9073362b13b10df57de23e63945becea32.camel@physik.fu-berlin.de>
Subject: Re: remove arch/sh
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Randy Dunlap <rdunlap@infradead.org>, Christoph Hellwig <hch@lst.de>
Date: Wed, 08 Feb 2023 13:13:43 +0100
In-Reply-To: <0e26bf17-864e-eb22-0d07-5b91af4fde92@infradead.org>
References: <20230113062339.1909087-1-hch@lst.de>
	 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
	 <20230116071306.GA15848@lst.de>
	 <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
	 <20230203071423.GA24833@lst.de>
	 <60ed320c8f5286e8dbbf71be29b760339fd25069.camel@physik.fu-berlin.de>
	 <0e26bf17-864e-eb22-0d07-5b91af4fde92@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.148.100
Message-ID-Hash: YUXLZ2G52BWH3Y4UYEMGMD33T2546LMB
X-Message-ID-Hash: YUXLZ2G52BWH3Y4UYEMGMD33T2546LMB
X-MailFrom: glaubitz@zedat.fu-berlin.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arch@vger.kernel.org, dmaengine@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sh@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YUXLZ2G52BWH3Y4UYEMGMD33T2546LMB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Randy!

On Tue, 2023-02-07 at 17:31 -0800, Randy Dunlap wrote:
>=20
> On 2/7/23 01:06, John Paul Adrian Glaubitz wrote:
> > Hello Christoph!
> >=20
> > On Fri, 2023-02-03 at 08:14 +0100, Christoph Hellwig wrote:
> > > On Mon, Jan 16, 2023 at 09:52:10AM +0100, John Paul Adrian Glaubitz w=
rote:
> > > > We have had a discussion between multiple people invested in the Su=
perH port and
> > > > I have decided to volunteer as a co-maintainer of the port to suppo=
rt Rich Felker
> > > > when he isn't available.
> > >=20
> > > So, this still isn't reflected in MAINTAINERS in linux-next.  When
> > > do you plan to take over?  What platforms will remain supported and
> > > what can we start dropping due to being unused and unmaintained?
> >=20
> > I'm getting everything ready now with Geert's help and I have a probabl=
y dumb
> > question regarding the MAINTAINERS file change: Shall I just add myself=
 as an
> > additional maintainer first or shall I also drop Yoshinori Sato?
> >=20
> > Also, is it desirable to add a "T:" entry for the kernel tree?
>=20
> Yes, definitely.

Geert has suggested to wait with adding a tree source to the entry until I =
get my
own kernel.org account. I have enough GPG signatures from multiple kernel d=
evelopers
on my GPG key, so I think it shouldn't be too difficult to qualify for an a=
ccount.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
