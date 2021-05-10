Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B230537916B
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 16:53:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BDAE1773;
	Mon, 10 May 2021 16:52:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BDAE1773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620658385;
	bh=dyIPtb49LgFnCoKazyq+bQhPSj3PCobNssG21KHdoK4=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ksCc8i1bjhbe5B16BMcABFdc5pm7tekq++9qXJmHGiSlQfec3gmaQUNbjVuGXZAJk
	 M+UFMF90xUY1JTMoNQnkuPo7LroZ1r7Md9Yx0TBJODJCiho8keS+CWfiENjF29Qkmv
	 ysbzdSVEGkE2g9yc2tJLIdfoZBMeQfSbT2bZozKw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8DAFF80430;
	Mon, 10 May 2021 16:50:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7EB2F80240; Mon, 10 May 2021 13:55:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_25,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE3D5F800E9
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 13:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE3D5F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="S4cpkndG"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 383C061260;
 Mon, 10 May 2021 11:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620647729;
 bh=dyIPtb49LgFnCoKazyq+bQhPSj3PCobNssG21KHdoK4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S4cpkndG9UuTYGkhKfO3hJLbYIHDWve5Su3QQFRXInDkMRoAu9bVjsNPKBQQExFiA
 MH/LvEqboPFe5Mg323DsrqgW7WJPZfjJ5OWh3KcGd7Kzb/Ed/OuhsjfzebDsCLf+jo
 Z2y3h21hX1f0r0znndE/gsvI3+7MfvcFNE3R9vJ3F6eSaoK3rYc9HAxpysQKCzq2nw
 XliTZNXkMCNQpYy6ormSrp00pDOW21OImF+xXBpjWC/JIXAZfq/wrXo3rh38peS5/g
 BQeri8Wl+fs0ihvm/Fcaw0vxpMvqk7Fkm7kctYIMuGKithMKv3Kd8J2NMAGsk2M1IJ
 Z8/9XzwZufeKA==
Date: Mon, 10 May 2021 13:55:18 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 00/53] Get rid of UTF-8 chars that can be mapped as ASCII
Message-ID: <20210510135518.305cc03d@coco.lan>
In-Reply-To: <2ae366fdff4bd5910a2270823e8da70521c859af.camel@infradead.org>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <2ae366fdff4bd5910a2270823e8da70521c859af.camel@infradead.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 10 May 2021 16:50:04 +0200
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org,
 dri-devel@lists.freedesktop.org, keyrings@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, x86@kernel.org, linux-acpi@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-sgx@vger.kernel.org, coresight@lists.linaro.org, rcu@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-integrity@vger.kernel.org
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

Hi David,

Em Mon, 10 May 2021 11:54:02 +0100
David Woodhouse <dwmw2@infradead.org> escreveu:

> On Mon, 2021-05-10 at 12:26 +0200, Mauro Carvalho Chehab wrote:
> > There are several UTF-8 characters at the Kernel's documentation.
> >=20
> > Several of them were due to the process of converting files from
> > DocBook, LaTeX, HTML and Markdown. They were probably introduced
> > by the conversion tools used on that time.
> >=20
> > Other UTF-8 characters were added along the time, but they're easily
> > replaceable by ASCII chars.
> >=20
> > As Linux developers are all around the globe, and not everybody has UTF=
-8
> > as their default charset, better to use UTF-8 only on cases where it is=
 really
> > needed. =20
>=20
> No, that is absolutely the wrong approach.
>=20
> If someone has a local setup which makes bogus assumptions about text
> encodings, that is their own mistake.
>=20
> We don't do them any favours by trying to *hide* it in the common case
> so that they don't notice it for longer.
>=20
> There really isn't much excuse for such brokenness, this far into the
> 21st century.
>=20
> Even *before* UTF-8 came along in the final decade of the last
> millennium, it was important to know which character set a given piece
> of text was encoded in.
>=20
> In fact it was even *more* important back then, we couldn't just assume
> UTF-8 everywhere like we can in modern times.
>=20
> Git can already do things like CRLF conversion on checking files out to
> match local conventions; if you want to teach it to do character set
> conversions too then I suppose that might be useful to a few developers
> who've fallen through a time warp and still need it. But nobody's ever
> bothered before because it just isn't necessary these days.
>=20
> Please *don't* attempt to address this anachronistic and esoteric
> "requirement" by dragging the kernel source back in time by three
> decades.

No. The idea is not to go back three decades ago.=20

The goal is just to avoid use UTF-8 where it is not needed. See, the vast
majority of UTF-8 chars are kept:

	- Non-ASCII Latin and Greek chars;
	- Box drawings;
	- arrows;
	- most symbols.

There, it makes perfect sense to keep using UTF-8.

We should keep using UTF-8 on Kernel. This is something that it shouldn't
be changed.

---

This patch series is doing conversion only when using ASCII makes
more sense than using UTF-8.=20

See, a number of converted documents ended with weird characters
like ZERO WIDTH NO-BREAK SPACE (U+FEFF) character. This specific
character doesn't do any good.

Others use NO-BREAK SPACE (U+A0) instead of 0x20. Harmless, until
someone tries to use grep[1].

[1] try to run:

    $ git grep "CPU 0 has been" Documentation/RCU/

    it will return nothing with current upstream.

    But it will work fine after the series is applied:

    $ git grep "CPU 0 has been" Documentation/RCU/
      Documentation/RCU/Design/Data-Structures/Data-Structures.rst:| #. CPU=
 0 has been in dyntick-idle mode for quite some time. When it   |
      Documentation/RCU/Design/Data-Structures/Data-Structures.rst:|    not=
ices that CPU 0 has been in dyntick idle mode, which qualifies  |

The main point on this series is to replace just the occurrences
where ASCII represents the symbol equally well, e. g. it is limited
for those chars:

	- U+2010 ('=E2=80=90'): HYPHEN
	- U+00ad ('=C2=AD'): SOFT HYPHEN
	- U+2013 ('=E2=80=93'): EN DASH
	- U+2014 ('=E2=80=94'): EM DASH

	- U+2018 ('=E2=80=98'): LEFT SINGLE QUOTATION MARK
	- U+2019 ('=E2=80=99'): RIGHT SINGLE QUOTATION MARK
	- U+00b4 ('=C2=B4'): ACUTE ACCENT

	- U+201c ('=E2=80=9C'): LEFT DOUBLE QUOTATION MARK
	- U+201d ('=E2=80=9D'): RIGHT DOUBLE QUOTATION MARK

	- U+00d7 ('=C3=97'): MULTIPLICATION SIGN
	- U+2212 ('=E2=88=92'): MINUS SIGN

	- U+2217 ('=E2=88=97'): ASTERISK OPERATOR
	  (this one used as a pointer reference like "*foo" on C code
	   example inside a document converted from LaTeX)

	- U+00bb ('=C2=BB'): RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK
	  (this one also used wrongly on an ABI file, meaning '>')

	- U+00a0 ('=C2=A0'): NO-BREAK SPACE
	- U+feff ('=EF=BB=BF'): ZERO WIDTH NO-BREAK SPACE

Using the above symbols will just trick tools like grep for no good
reason.

Thanks,
Mauro
