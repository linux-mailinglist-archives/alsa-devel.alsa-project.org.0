Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88912694CF1
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 17:32:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 732EA83A;
	Mon, 13 Feb 2023 17:31:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 732EA83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676305929;
	bh=zm2U3AR0lSY3YVDlMFmAyq3X6P2wuZmOXqCHiDF0wSU=;
	h=Subject:From:To:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KaWlI98yqWbs2oB1zP/xCkU1owIClASjXiY34UUeBEzUY3Sq6CzE7gRa3HJIaVSpL
	 Sr4c0Hn5MY0fVCYFBcO57GkqGcoCEOtWcQAhhxa7z1nqy8jJ89BxcXyrUKenJL6K0G
	 JRxuEaAVg3ir1bYwgeu0FgXdWLaajxuMWH5oWy+k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AA5BF804B0;
	Mon, 13 Feb 2023 17:31:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 122BCF804B4; Mon, 13 Feb 2023 17:31:15 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B2AE5F80051
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 17:31:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2AE5F80051
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pRbiw-0043kT-S2; Mon, 13 Feb 2023 17:30:38 +0100
Received: from p5b13aa49.dip0.t-ipconnect.de ([91.19.170.73]
 helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pRbiw-0046cc-HY; Mon, 13 Feb 2023 17:30:38 +0100
Message-ID: 
 <dbda1f6e1c280c13d963ad6e7f68a853a7741199.camel@physik.fu-berlin.de>
Subject: Re: remove arch/sh
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 13 Feb 2023 17:30:36 +0100
In-Reply-To: <20230206100856.603a0f8f@canb.auug.org.au>
References: <20230113062339.1909087-1-hch@lst.de>
	 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
	 <20230116071306.GA15848@lst.de>
	 <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
	 <20230203071423.GA24833@lst.de>
	 <afd056a95d21944db1dc0c9708f692dd1f7bb757.camel@physik.fu-berlin.de>
	 <20230203083037.GA30738@lst.de> <20230206100856.603a0f8f@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.170.73
Message-ID-Hash: W6VLCIISUUSCLVDIJLDNN6JBOY4LD2H6
X-Message-ID-Hash: W6VLCIISUUSCLVDIJLDNN6JBOY4LD2H6
X-MailFrom: glaubitz@zedat.fu-berlin.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Christoph Hellwig <hch@lst.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Arnd Bergmann <arnd@arndb.de>,
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W6VLCIISUUSCLVDIJLDNN6JBOY4LD2H6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Steve!

On Mon, 2023-02-06 at 10:08 +1100, Stephen Rothwell wrote:
> Hi,
>=20
> On Fri, 3 Feb 2023 09:30:37 +0100 Christoph Hellwig <hch@lst.de> wrote:
> >=20
> > On Fri, Feb 03, 2023 at 09:24:46AM +0100, John Paul Adrian Glaubitz wro=
te:
> > > Since this is my very first time stepping up as a kernel maintainer, =
I was hoping
> > > to get some pointers on what to do to make this happen.
> > >=20
> > > So far, we have set up a new kernel tree and I have set up a local de=
velopment and
> > > test environment for SH kernels using my SH7785LCR board as the targe=
t platform.
> > >=20
> > > Do I just need to send a patch asking to change the corresponding ent=
ry in the
> > > MAINTAINERS file? =20
> >=20
> > I'm not sure a there is a document, but:
> >=20
> >  - add the MAINTAINERS change to your tree
> >  - ask Stephen to get your tree included in linux-next
>=20
> And by "Stephen", Christoph means me.  When you are ready, please send
> me a request to include your tree/branch in linux-next (usually the
> branch is called something like "for-next" or just "next") telling me
> the git URL, and the contacts I should send email to if there are
> conflicts/build issues with the branch.  I will then fetch the branch
> every time I create a new linux-next release (most work days), so all
> you need to do is update that branch each time you are ready to publish
> more commits.

I'm in the MAINTAINERS now in Linus' tree. I have requested a kernel.org
account now and will hopefully have my trees set up later this week.

I'll let you know about the URLs as soon as possible.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
