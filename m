Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B07294DBE
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Oct 2020 15:40:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95B961761;
	Wed, 21 Oct 2020 15:40:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95B961761
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603287651;
	bh=UPldQjzMA460/76oeqYLqIwb9VWbokzIGEBN55sPkYc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j2/gGNXp1+FyFthFVJMMK7aO1mAkLay+zT0NGAFTLl/Aw/HR29ZTk3fdrFoGFzDYK
	 RtBvQQNNBydDvgmI4GbRxjedOQJFq1MOxs9Qs++CtzR4kuqRE4ncL2ZYdlYQpn1tIK
	 0an8729VQ+MMXErlwuN3+MT1no8dEXosCm3UlK38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 083DBF804C2;
	Wed, 21 Oct 2020 15:37:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5639EF801F2; Sun, 18 Oct 2020 21:16:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25DC4F800AD
 for <alsa-devel@alsa-project.org>; Sun, 18 Oct 2020 21:16:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25DC4F800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="iJ9Ua4Sb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=jSZ48E7Pk5au6oJE5B/SpoPyGzHAu2LHc5e92XLrkbA=; b=iJ9Ua4Sb+7c2gBb5X093C2g3JF
 uPXvpy94QM9OfF4QdLHnbdoyPK+foTfLSCfptUIJX1L1QmBGwqRRLC+FO4yttdeacV1S+hl8hKo0C
 WTqtwQkEZQTbeO+X3m7Juje7eQPdNT7ZY2bxJ15gxf5bGTukHh/PFeI2Wotfd6qSzqn3KwhwiSJ8q
 nHMmLI1n6mOTyu1OQHnDgD5bqj+pk9E7DasCqQG55sL9hd/rW8umvQBQI/4FGFQAjFO02dSWITtwv
 yXkpHo9Iys1nXXFCivdyuKxTY6HM4UcykOYUxv1R/rziPsZPtETfWCfkBycLom8Snu0zA9/3jwQkF
 l4f6J+YQ==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kUEAE-0008Qi-Sy; Sun, 18 Oct 2020 19:16:19 +0000
Date: Sun, 18 Oct 2020 20:16:18 +0100
From: Matthew Wilcox <willy@infradead.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [Ocfs2-devel] [RFC] treewide: cleanup unreachable breaks
Message-ID: <20201018191618.GO20115@casper.infradead.org>
References: <20201017160928.12698-1-trix@redhat.com>
 <20201018185943.GM20115@casper.infradead.org>
 <45efa7780c79972eae9ca9bdeb9f7edbab4f3643.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45efa7780c79972eae9ca9bdeb9f7edbab4f3643.camel@HansenPartnership.com>
X-Mailman-Approved-At: Wed, 21 Oct 2020 15:37:33 +0200
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org, trix@redhat.com,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, usb-storage@lists.one-eyed-alien.net,
 devel@driverdev.osuosl.org, linux-samsung-soc@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-pm@vger.kernel.org,
 ath10k@lists.infradead.org, linux-acpi@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, industrypack-devel@lists.sourceforge.net,
 nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 MPT-FusionLinux.pdl@broadcom.com, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-nfc@lists.01.org,
 linux-serial@vger.kernel.org, linux-can@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 storagedev@microchip.com, linux-amlogic@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net, platform-driver-x86@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, clang-built-linux@googlegroups.com,
 patches@opensource.cirrus.com, linux-crypto@vger.kernel.org,
 linux-integrity@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 linux-power@fi.rohmeurope.com
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

On Sun, Oct 18, 2020 at 12:13:35PM -0700, James Bottomley wrote:
> On Sun, 2020-10-18 at 19:59 +0100, Matthew Wilcox wrote:
> > On Sat, Oct 17, 2020 at 09:09:28AM -0700, trix@redhat.com wrote:
> > > clang has a number of useful, new warnings see
> > > https://urldefense.com/v3/__https://clang.llvm.org/docs/DiagnosticsReference.html__;!!GqivPVa7Brio!Krxz78O3RKcB9JBMVo_F98FupVhj_jxX60ddN6tKGEbv_cnooXc1nnBmchm-e_O9ieGnyQ$ 
> > 
> > Please get your IT department to remove that stupidity.  If you
> > can't, please send email from a non-Red Hat email address.
> 
> Actually, the problem is at Oracle's end somewhere in the ocfs2 list
> ... if you could fix it, that would be great.  The usual real mailing
> lists didn't get this transformation
> 
> https://lore.kernel.org/bpf/20201017160928.12698-1-trix@redhat.com/
> 
> but the ocfs2 list archive did:
> 
> https://oss.oracle.com/pipermail/ocfs2-devel/2020-October/015330.html
> 
> I bet Oracle IT has put some spam filter on the list that mangles URLs
> this way.

*sigh*.  I'm sure there's a way.  I've raised it with someone who should
be able to fix it.
