Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 999201F4EB2
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jun 2020 09:18:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EB6F166C;
	Wed, 10 Jun 2020 09:18:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EB6F166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591773532;
	bh=nmcdEattGRG4Rcv0Ohh2Flc7pJOrXsmyEnaq1bib4Rg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pTE5gh+aopPWv82bTlqxK1jvqiCvj77ffSdKnH16GnOacQCzMd5laIrWgN2+vhfwH
	 l9JdV+PZM41lmCAPmuFCJMQrZzTsSj9Pcz45WM59ZBbuOMsdLaCJfMrJJHTI+XOMIi
	 r2D4Zp6xvhbqA7G7i3M0/kAfb26duUEZAnPCbAYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44071F8021E;
	Wed, 10 Jun 2020 09:17:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2214FF8021C; Wed, 10 Jun 2020 09:14:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72F83F80088
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 09:14:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72F83F80088
Received: by verein.lst.de (Postfix, from userid 2407)
 id ADF4A68AEF; Wed, 10 Jun 2020 09:14:10 +0200 (CEST)
Date: Wed, 10 Jun 2020 09:14:10 +0200
From: Christoph Hellwig <hch@lst.de>
To: David Rientjes <rientjes@google.com>
Subject: Re: next-0519 on thinkpad x60: sound related? window manager crash
Message-ID: <20200610071410.GD1397@lst.de>
References: <20200520111136.GA3802@amd> <1591545088.74ii116nf2.none@localhost>
 <20200608061950.GA17476@lst.de> <1591624340.z01ejtod28.none@localhost>
 <alpine.DEB.2.22.394.2006081928070.148886@chino.kir.corp.google.com>
 <20200609054306.GA9606@lst.de>
 <alpine.DEB.2.22.394.2006092213110.154443@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2006092213110.154443@chino.kir.corp.google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: alsa-devel@alsa-project.org, x86@kernel.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, "Alex Xu \(Hello71\)" <alex_y_xu@yahoo.ca>,
 hch@infradead.org, mingo@redhat.com, bp@alien8.de, Pavel Machek <pavel@ucw.cz>,
 hpa@zytor.com, tglx@linutronix.de, Christoph Hellwig <hch@lst.de>
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

On Tue, Jun 09, 2020 at 10:26:45PM -0700, David Rientjes wrote:
> If this option should not implicitly be set for DMA_COHERENT_POOL, then I 
> assume we need yet another Kconfig option since DMA_REMAP selected it 
> before and DMA_COHERENT_POOL selects DMA_REMAP :)

Yes, but what do we actually need DMA_REMAP for just for the coherent
pool?  We shuldn't really remap anything for AMD-SEV.  Sorry for not
noticing this earlier.
