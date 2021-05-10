Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0507F37919D
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 16:55:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88140177E;
	Mon, 10 May 2021 16:54:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88140177E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620658529;
	bh=1T1Pdq0PMCmxSsi7XCFmknclUO/XI4WSkdYPnUkerfY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HWg+Sc52eXZyTW+hCY3UOvaGEWc+hBcqO2GUkoaSl6P6DHSJeUb0lgP2UDixQsXDj
	 WIRtXVeoRaD//wBixdtP+e/fK0qvwKrfa2v48ucqUh90dO3itxqAPEIbJFFx43L9Mv
	 kL+Ny73NCOHR1F4pa4eVifqRJltN7pClceN1zBXg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72C17F804ED;
	Mon, 10 May 2021 16:50:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC053F80240; Mon, 10 May 2021 16:00:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6F90F800EA
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 16:00:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6F90F800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="djb3CWn/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=i6vAxLOytNOYwyM1NYfARO0i+7jkuFK7y9pYt7pXuwE=; b=djb3CWn/LU378IzapvABLkn8Gd
 Mp82QkScestEUeQW2L+zqtEN7XvYp31eFRebvjBEITr//+6YOo6+SYheq9BxF7YMTeqbS+RN1ORYU
 WcTwnub1JAhAEwo1EbdH4ZtDbzKRVhVt7KKBx8eH43WzT6ZsZkO7OQPiITlB671P2UStmst5kwHpO
 oLDGkct+Pf7s4vCchonkHPjgJ2dHAgGdY9eEvhnNfgt0nMzg4EJ/N8O7mpCEUjiq1yDlLopkoOUQy
 tCb7mahOMAZ84vugzBeIjfIYkNlViOtJdTlUAmJVQy5eePLrQct4R8yXLPW7Hy+DjovMg5jAZGdoa
 yuW/o03A==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lg6RA-006DIB-7H; Mon, 10 May 2021 13:59:19 +0000
Date: Mon, 10 May 2021 14:59:08 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Edward Cree <ecree.xilinx@gmail.com>
Subject: Re: [PATCH 00/53] Get rid of UTF-8 chars that can be mapped as ASCII
Message-ID: <YJk8LMFViV7Z3Uu7@casper.infradead.org>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <2ae366fdff4bd5910a2270823e8da70521c859af.camel@infradead.org>
 <20210510135518.305cc03d@coco.lan>
 <df6b4567-030c-a480-c5a6-fe579830e8c0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df6b4567-030c-a480-c5a6-fe579830e8c0@gmail.com>
X-Mailman-Approved-At: Mon, 10 May 2021 16:50:04 +0200
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org,
 dri-devel@lists.freedesktop.org, keyrings@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, x86@kernel.org,
 linux-acpi@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-input@vger.kernel.org, linux-ext4@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-sgx@vger.kernel.org,
 coresight@lists.linaro.org, rcu@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-rdma@vger.kernel.org, linux-integrity@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>
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

On Mon, May 10, 2021 at 02:16:16PM +0100, Edward Cree wrote:
> On 10/05/2021 12:55, Mauro Carvalho Chehab wrote:
> > The main point on this series is to replace just the occurrences
> > where ASCII represents the symbol equally well
> 
> > 	- U+2014 ('—'): EM DASH
> Em dash is not the same thing as hyphen-minus, and the latter does not
>  serve 'equally well'.  People use em dashes because — even in
>  monospace fonts — they make text easier to read and comprehend, when
>  used correctly.
> I accept that some of the other distinctions — like en dashes — are
>  needlessly pedantic (though I don't doubt there is someone out there
>  who will gladly defend them with the same fervour with which I argue
>  for the em dash) and I wouldn't take the trouble to use them myself;
>  but I think there is a reasonable assumption that when someone goes
>  to the effort of using a Unicode punctuation mark that is semantic
>  (rather than merely typographical), they probably had a reason for
>  doing so.

I think you're overestimating the amount of care and typographical
knowledge that your average kernel developer has.  Most of these
UTF-8 characters come from latex conversions and really aren't
necessary (and are being used incorrectly).

You seem quite knowedgeable about the various differences.  Perhaps
you'd be willing to write a document for Documentation/doc-guide/
that provides guidance for when to use which kinds of horizontal
line?  https://www.punctuationmatters.com/hyphen-dash-n-dash-and-m-dash/
talks about it in the context of publications, but I think we need
something more suited to our needs for kernel documentation.
