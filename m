Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF96968BE62
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 14:37:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EC2B829;
	Mon,  6 Feb 2023 14:36:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EC2B829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675690622;
	bh=kHTeO7fdLoZ5/9N7FtwNPvxiVI7qsyMzw0nuJNAUkTE=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ghOHoC/um8SLqUqE+xUnCV8NX0AU8oqO+XT/Ui7NB4XAoKE731Ejq7EZhzKwKJGL6
	 HufkM/raH7pVmWbJW3kMu1ai5bG5jRSyVGUyKL0Z2PcZSXkukGazpoEWHXtuQT1gur
	 iRG1wN4OuJB+uL9wkWMwLRn1SlWuPFHFYJpXtTuQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7684BF800F5;
	Mon,  6 Feb 2023 14:35:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F721F8032B; Fri,  3 Feb 2023 11:36:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8885BF80022
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 11:36:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8885BF80022
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.95) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1pNtQu-0005LU-Pm; Fri, 03 Feb 2023 11:36:40 +0100
Received: from p57bd9464.dip0.t-ipconnect.de ([87.189.148.100]
 helo=[192.168.178.81]) by inpost2.zedat.fu-berlin.de (Exim 4.95)
 with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1pNtQu-000Qu4-EY; Fri, 03 Feb 2023 11:36:40 +0100
Message-ID: <1c4be6be8aa9f69af71c967b4cc0b77344d374de.camel@physik.fu-berlin.de>
Subject: Re: remove arch/sh
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 03 Feb 2023 11:36:35 +0100
In-Reply-To: <CAMuHMdUitVfW088YOmqYm4kwbKwkwb22fAakHcu6boxv7dXDfQ@mail.gmail.com>
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
 <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
 <20230203071423.GA24833@lst.de>
 <afd056a95d21944db1dc0c9708f692dd1f7bb757.camel@physik.fu-berlin.de>
 <20230203083037.GA30738@lst.de>
 <d10fe31b2af6cf4e03618f38ca9d3ca5c72601ed.camel@physik.fu-berlin.de>
 <CAMuHMdUitVfW088YOmqYm4kwbKwkwb22fAakHcu6boxv7dXDfQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.148.100
X-Mailman-Approved-At: Mon, 06 Feb 2023 14:35:04 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 linux-rtc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Geert!

On Fri, 2023-02-03 at 11:33 +0100, Geert Uytterhoeven wrote:
> Hi Adrian,
>=20
> On Fri, Feb 3, 2023 at 11:29 AM John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
> > On Fri, 2023-02-03 at 09:30 +0100, Christoph Hellwig wrote:
> > > On Fri, Feb 03, 2023 at 09:24:46AM +0100, John Paul Adrian Glaubitz w=
rote:
> > > > Since this is my very first time stepping up as a kernel maintainer=
, I was hoping
> > > > to get some pointers on what to do to make this happen.
> > > >=20
> > > > So far, we have set up a new kernel tree and I have set up a local =
development and
> > > > test environment for SH kernels using my SH7785LCR board as the tar=
get platform.
> > > >=20
> > > > Do I just need to send a patch asking to change the corresponding e=
ntry in the
> > > > MAINTAINERS file?
> > >=20
> > > I'm not sure a there is a document, but:
> > >=20
> > >  - add the MAINTAINERS change to your tree
> > >  - ask Stephen to get your tree included in linux-next
> > >=20
> > > then eventually send a pull request to Linus with all of that.  Make
> > > sure it's been in linux-next for a while.
> >=20
> > OK, thanks for the pointers! Will try to get this done by next week.
> >=20
> > We're still discussing among SuperH developer community whether there w=
ill be a second
> > maintainer, so please bear with us a few more days. I will collect patc=
hes in the
> > meantime.
>=20
> Thanks a lot!
>=20
> If you need any help with process, setup, ... don't hesitate to ask
> (on e.g. #renesas-soc on Libera).

Thanks a lot! I've got some real-life tasks to do today, but I will join la=
ter today.

And I will ask questions ;-).

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
