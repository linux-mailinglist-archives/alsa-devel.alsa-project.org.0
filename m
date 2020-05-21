Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E16F1E0A6D
	for <lists+alsa-devel@lfdr.de>; Mon, 25 May 2020 11:27:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9A3182C;
	Mon, 25 May 2020 11:27:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9A3182C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590398879;
	bh=x0gmE3z8OBKdaFX9xEcEKrvKpGE5oUxiR1vLxs+y9m0=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XUYObgKZ9wVZOXqak1QqEapHucVL1Z1k8utcAbEPpLS12vFM7OeJbucA+2R6CDvEV
	 /f8OFvpfsa6khe5oSxe4P1PBMtSVoHVGiSJWkrPn0bedunSbiOad91fbPNUud+VNTV
	 6Xx+ojpraJA5+cOpKm8ayCV3N6l5O76oTS2O09U4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DB87F8028E;
	Mon, 25 May 2020 11:25:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 214C2F801D8; Thu, 21 May 2020 15:53:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB0F5F80111
 for <alsa-devel@alsa-project.org>; Thu, 21 May 2020 15:53:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB0F5F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="U1ummp7o"
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49SWKw5Zjyz9sRf;
 Thu, 21 May 2020 23:53:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590069215;
 bh=x0gmE3z8OBKdaFX9xEcEKrvKpGE5oUxiR1vLxs+y9m0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=U1ummp7o80EpVG+XHrZ+kY4mdOMj66aPIDu5nh5DSYxAr90UFT/UjNp2Zv20PMhPq
 FutLYG1LwUbwvn8i0fOfPn08DRbaU4pDlYWcByEyHRHQYMEtctNRfa0WgmM8ZBaPhb
 uVYMYUTuMpgq+CMyGEULlRnrrJm9WVjrG4Du9vtHMQmANXcX+VE0M5rEEcE86PnsNS
 Mul59ND40j40D1g5t26BIV6SW9Xbe0Z428Ag6OFLi0HcS/10P0QKyszCzFH/9TqS9j
 6PfjFLvhroAJX5arEVgTI8cNrRF/utxBtxRY+bGX61fCFkKMLmUk28N+hRusHvh1j3
 LWzQ6uAZR8snA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
In-Reply-To: <33b873a8-ded2-4866-fb70-c336fb325923@csgroup.eu>
References: <cover.1585311091.git.michal.simek@xilinx.com>
 <CAK8P3a2mKPRFbRE3MWScr9GSiL4cpLg0wqv1Q28XDCZVPWgHfg@mail.gmail.com>
 <20200327131026.GT1922688@smile.fi.intel.com>
 <20200327131531.GU1922688@smile.fi.intel.com>
 <CAK8P3a1Z+ZPTDzgAjdz0a7d85R62BhUqkdEWgrwXh-OnYe6rog@mail.gmail.com>
 <20200327141434.GA1922688@smile.fi.intel.com>
 <b5adcc7a-9d10-d75f-50e3-9c150a7b4989@c-s.fr>
 <87mu7xum41.fsf@mpe.ellerman.id.au>
 <bac9af641140cf6df04e3532589a11c2f3bccd2f.camel@kernel.crashing.org>
 <87pncprwp9.fsf@mpe.ellerman.id.au>
 <5782f9a42ad8acd8b234fa9c15a09db93552dc6b.camel@kernel.crashing.org>
 <871roykwu6.fsf@mpe.ellerman.id.au>
 <CAK8P3a1XmeeP7FKfNwXZO8cXyJ_U_Jr0kjOaGZ6F=7OcoZ+0nw@mail.gmail.com>
 <87zha17otl.fsf@mpe.ellerman.id.au>
 <33b873a8-ded2-4866-fb70-c336fb325923@csgroup.eu>
Date: Thu, 21 May 2020 23:53:45 +1000
Message-ID: <87o8qhgzrq.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 25 May 2020 11:25:07 +0200
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Jonathan Corbet <corbet@lwn.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Michal Simek <michal.simek@xilinx.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Leonardo Bras <leonardo@linux.ibm.com>,
 Matt Porter <mporter@kernel.crashing.org>, DTML <devicetree@vger.kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Alistair Popple <alistair@popple.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, git@xilinx.com,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Allison Randal <allison@lohutok.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Michal Simek <monstr@monstr.eu>,
 Wei Hu <weh@microsoft.com>, Christian Lamparter <chunkeey@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Armijn Hemel <armijn@tjaldur.nl>, Rob Herring <robh+dt@kernel.org>,
 Enrico Weigelt <info@metux.net>, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
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

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 21/05/2020 =C3=A0 09:02, Michael Ellerman a =C3=A9crit=C2=A0:
>> Arnd Bergmann <arnd@arndb.de> writes:
>>> +On Wed, Apr 8, 2020 at 2:04 PM Michael Ellerman <mpe@ellerman.id.au> w=
rote:
>>>> Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
>>>>> On Fri, 2020-04-03 at 15:59 +1100, Michael Ellerman wrote:
>>>>>> Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
>>>>> IBM still put 40x cores inside POWER chips no ?
>>>>
>>>> Oh yeah that's true. I guess most folks don't know that, or that they
>>>> run RHEL on them.
>>>
>>> Is there a reason for not having those dts files in mainline then?
>>> If nothing else, it would document what machines are still being
>>> used with future kernels.
>>=20
>> Sorry that part was a joke :D  Those chips don't run Linux.
>>=20
>
> Nice to know :)
>
> What's the plan then, do we still want to keep 40x in the kernel ?

I guess we keep it for now.

Perhaps we mark it BROKEN for a few releases and see if anyone
complains?

> If yes, is it ok to drop the oldies anyway as done in my series=20
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D172630 ?

Yeah let's do it. I would love to get rid of that horrible
PPC405_ERR77() sprinkled all through our atomics.

> (Note that this series will conflict with my series on hugepages on 8xx=20
> due to the PTE_ATOMIC_UPDATES stuff. I can rebase the 40x modernisation=20
> series on top of the 8xx hugepages series if it is worth it)

Yeah if you can rebase that would be great.

cheers
