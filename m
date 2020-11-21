Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF49C2C2DBD
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 18:05:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 873491733;
	Tue, 24 Nov 2020 18:04:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 873491733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606237538;
	bh=IjgpfdrnD7JgyWrCwRvh9j/4hBjhPG+nHD052uAfAfY=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l2srehvhtNfY3GtvlR1HCfM+Sm5UthbokewaMPMdPZ5OcbQRgo+yi1k+u/COS0CKl
	 bmjlFZe0k1y1cI9dGRJuweyTvKtQAwejMhOOxsdefYe3TWvreOsTf0pHPGD40AxzhZ
	 Gk0JyYD0K2Be8d1qUmAJm0Aj+HiKQsVOB9pkxeZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CB6CF80529;
	Tue, 24 Nov 2020 17:58:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D624F801ED; Sat, 21 Nov 2020 19:02:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0001.hostedemail.com
 [216.40.44.1])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9BF1F800C5
 for <alsa-devel@alsa-project.org>; Sat, 21 Nov 2020 19:02:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9BF1F800C5
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id AF7D7181D3025;
 Sat, 21 Nov 2020 18:02:23 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: uncle36_3402e8c27356
X-Filterd-Recvd-Size: 3937
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf04.hostedemail.com (Postfix) with ESMTPA;
 Sat, 21 Nov 2020 18:02:18 +0000 (UTC)
Message-ID: <f7643c9cb0a896f3ead65e86084b7c143e21ef43.camel@perches.com>
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
From: Joe Perches <joe@perches.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 trix@redhat.com,  clang-built-linux@googlegroups.com
Date: Sat, 21 Nov 2020 10:02:17 -0800
In-Reply-To: <5843ef910b0e86c00d9c0143dec20f93823b016b.camel@HansenPartnership.com>
References: <20201121165058.1644182-1-trix@redhat.com>
 <5843ef910b0e86c00d9c0143dec20f93823b016b.camel@HansenPartnership.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 24 Nov 2020 17:58:08 +0100
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-scsi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 cluster-devel@redhat.com, linux-acpi@vger.kernel.org,
 tboot-devel@lists.sourceforge.net, coreteam@netfilter.org,
 xen-devel@lists.xenproject.org, MPT-FusionLinux.pdl@broadcom.com,
 linux-media@vger.kernel.org, alsa-devel@alsa-project.org,
 intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
 linux-omap@vger.kernel.org, devel@acpica.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-crypto@vger.kernel.org, patches@opensource.cirrus.com,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org
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

On Sat, 2020-11-21 at 09:18 -0800, James Bottomley wrote:
> On Sat, 2020-11-21 at 08:50 -0800, trix@redhat.com wrote:
> > A difficult part of automating commits is composing the subsystem
> > preamble in the commit log.  For the ongoing effort of a fixer
> > producing one or two fixes a release the use of 'treewide:' does
> > not seem appropriate.
> > 
> > It would be better if the normal prefix was used.  Unfortunately
> > normal is not consistent across the tree.
> > 
> > 	D: Commit subsystem prefix
> > 
> > ex/ for FPGA DFL DRIVERS
> > 
> > 	D: fpga: dfl:
> 
> I've got to bet this is going to cause more issues than it solves. 
> SCSI uses scsi: <driver>: for drivers but not every driver has a
> MAINTAINERS entry.  We use either scsi: or scsi: core: for mid layer
> things, but we're not consistent.  Block uses blk-<something>: for all
> of it's stuff but almost no <somtehing>s have a MAINTAINERS entry.  So
> the next thing you're going to cause is an explosion of suggested
> MAINTAINERs entries.

As well as some changes require simultaneous changes across
multiple subsystems.

> Has anyone actually complained about treewide:?

It depends on what you mean by treewide:

If a treewide: patch is applied by some "higher level" maintainer,
then generally, no.

If the treewide patch is also cc'd to many individual maintainers,
then yes, many many times.

Mostly because patches cause what is in their view churn or that
changes are not specific to their subsystem grounds.

The treewide patch is sometimes dropped, sometimes broken up and
generally not completely applied.

What would be useful in many cases like this is for a pre and post
application of the treewide patch to be compiled and the object
code verified for lack of any logic change.

Unfortunately, gcc does not guarantee deterministic compilation so
this isn't feasible with at least gcc.  Does clang guarantee this?

I'm not sure it's possible:
https://blog.llvm.org/2019/11/deterministic-builds-with-clang-and-lld.html


