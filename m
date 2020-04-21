Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CCF1B2BBC
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 17:57:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC9DA16CF;
	Tue, 21 Apr 2020 17:56:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC9DA16CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587484640;
	bh=BAW0+T6XTjOXMnngIG+zVNvt7I2G3nrMZwRjgWNO/qY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kkzyDxJRX0bIADRf/j56WcRn8fDeYBR99XPOotNLT8kkePYOc7a/UFp6JcXccGVDi
	 Ka7VEpsMTKBVGzm1BOPIzVizoRDCtaOa7t3+LNeWxXR+bCbbWm14P2aQ5m3Ho0dcrv
	 uiUuTGSmenpeMUje0n13/eyMnyE8btScf5CkRtuE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03827F801ED;
	Tue, 21 Apr 2020 17:55:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEF40F801EC; Tue, 21 Apr 2020 17:55:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by alsa1.perex.cz (Postfix) with ESMTP id 18092F8012F
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 17:55:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18092F8012F
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 03LFtMkQ010973;
 Tue, 21 Apr 2020 10:55:22 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 03LFtG0c010964;
 Tue, 21 Apr 2020 10:55:16 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 21 Apr 2020 10:55:16 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 2/5] powerpc: Replace _ALIGN_DOWN() by ALIGN_DOWN()
Message-ID: <20200421155516.GT26902@gate.crashing.org>
References: <a5945463f86c984151962a475a3ee56a2893e85d.1587407777.git.christophe.leroy@c-s.fr>
 <3911a86d6b5bfa7ad88cd7c82416fbe6bb47e793.1587407777.git.christophe.leroy@c-s.fr>
 <CACPK8XfqnqgkXcBzp=nqd=AJX1MK05eTNiyOdaEuRu3_6RsXSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XfqnqgkXcBzp=nqd=AJX1MK05eTNiyOdaEuRu3_6RsXSQ@mail.gmail.com>
User-Agent: Mutt/1.4.2.3i
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linux-fbdev@vger.kernel.org,
 kvm@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
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

Hi!

On Tue, Apr 21, 2020 at 01:04:05AM +0000, Joel Stanley wrote:
> On Mon, 20 Apr 2020 at 18:38, Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> > _ALIGN_DOWN() is specific to powerpc
> > ALIGN_DOWN() is generic and does the same
> >
> > Replace _ALIGN_DOWN() by ALIGN_DOWN()
> 
> This one is a bit less obvious. It becomes (leaving the typeof's alone
> for clarity):
> 
> -((addr)&(~((typeof(addr))(size)-1)))
> +((((addr) - ((size) - 1)) + ((typeof(addr))(size) - 1)) &
> ~((typeof(addr))(size)-1))
> 
> Which I assume the compiler will sort out?

[ This is line-wrapped, something in your mailer?  Took me a bit to figure
  out the - and + are diff -u things :-) ]

In the common case where size is a constant integer power of two, the
compiler will have no problem with this.  But why do so complicated?

Why are the casts there, btw?


Segher
