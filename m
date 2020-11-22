Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5436B2C2DCC
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 18:08:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9D771756;
	Tue, 24 Nov 2020 18:07:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9D771756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606237691;
	bh=2OZYi+O3MhUDz9Ym7TDOkPSPcchfxRAlasW5CrnNEp8=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DSJ5/GLL79S070AVS5RHCmT6y0IuI2440nQ5fhYxaERx1l8lcHDTQJ97rB9AdO7ca
	 qyoUnpnJmqiuVeBQQlRpDvvYtNP5YDSPjntH7W5OxAvZnDu0v7jzuDI1TdqaTJtobj
	 NysLJCoynC5Gg9M0/VRQ+KuTHlFWgncrExTWiMjc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 743B6F80568;
	Tue, 24 Nov 2020 17:58:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D502F80165; Sun, 22 Nov 2020 19:22:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0105.hostedemail.com
 [216.40.44.105])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40759F80107
 for <alsa-devel@alsa-project.org>; Sun, 22 Nov 2020 19:22:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40759F80107
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 5998D18029124;
 Sun, 22 Nov 2020 18:22:42 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: base07_180d0122735e
X-Filterd-Recvd-Size: 5347
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf13.hostedemail.com (Postfix) with ESMTPA;
 Sun, 22 Nov 2020 18:22:37 +0000 (UTC)
Message-ID: <859bae8ddae3238116824192f6ddf1c91a381913.camel@perches.com>
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
From: Joe Perches <joe@perches.com>
To: Tom Rix <trix@redhat.com>, clang-built-linux@googlegroups.com
Date: Sun, 22 Nov 2020 10:22:36 -0800
In-Reply-To: <6e8c1926-4209-8f10-d0f9-72c875a85a88@redhat.com>
References: <20201121165058.1644182-1-trix@redhat.com>
 <2105f0c05e9eae8bee8e17dcc5314474b3c0bc73.camel@perches.com>
 <6e8c1926-4209-8f10-d0f9-72c875a85a88@redhat.com>
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

On Sun, 2020-11-22 at 08:33 -0800, Tom Rix wrote:
> On 11/21/20 9:10 AM, Joe Perches wrote:
> > On Sat, 2020-11-21 at 08:50 -0800, trix@redhat.com wrote:
> > > A difficult part of automating commits is composing the subsystem
> > > preamble in the commit log.  For the ongoing effort of a fixer producing
> > > one or two fixes a release the use of 'treewide:' does not seem appropriate.
> > > 
> > > It would be better if the normal prefix was used.  Unfortunately normal is
> > > not consistent across the tree.
> > > 
> > > So I am looking for comments for adding a new tag to the MAINTAINERS file
> > > 
> > > 	D: Commit subsystem prefix
> > > 
> > > ex/ for FPGA DFL DRIVERS
> > > 
> > > 	D: fpga: dfl:
> > I'm all for it.  Good luck with the effort.  It's not completely trivial.
> > 
> > From a decade ago:
> > 
> > https://lore.kernel.org/lkml/1289919077.28741.50.camel@Joe-Laptop/
> > 
> > (and that thread started with extra semicolon patches too)
> 
> Reading the history, how about this.
> 
> get_maintainer.pl outputs a single prefix, if multiple files have the
> same prefix it works, if they don't its an error.
> 
> Another script 'commit_one_file.sh' does the call to get_mainainter.pl
> to get the prefix and be called by run-clang-tools.py to get the fixer
> specific message.

It's not whether the script used is get_maintainer or any other script,
the question is really if the MAINTAINERS file is the appropriate place
to store per-subsystem patch specific prefixes.

It is.

Then the question should be how are the forms described and what is the
inheritance priority.  My preference would be to have a default of
inherit the parent base and add basename(subsystem dirname).

Commit history seems to have standardized on using colons as the separator
between the commit prefix and the subject.

A good mechanism to explore how various subsystems have uses prefixes in
the past might be something like:

$ git log --no-merges --pretty='%s' -<commit_count> <subsystem_path> | \
  perl -n -e 'print substr($_, 0, rindex($_, ":") + 1) . "\n";' | \
  sort | uniq -c | sort -rn

Using 10000 for commit_count and drivers/scsi for subsystem_path, the
top 40 entries are below:

About 1% don't have a colon, and there is no real consistency even
within individual drivers below scsi.  For instance, qla2xxx:

     1	    814 scsi: qla2xxx:
     2	    691 scsi: lpfc:
     3	    389 scsi: hisi_sas:
     4	    354 scsi: ufs:
     5	    339 scsi:
     6	    291 qla2xxx:
     7	    256 scsi: megaraid_sas:
     8	    249 scsi: mpt3sas:
     9	    200 hpsa:
    10	    190 scsi: aacraid:
    11	    174 lpfc:
    12	    153 scsi: qedf:
    13	    144 scsi: smartpqi:
    14	    139 scsi: cxlflash:
    15	    122 scsi: core:
    16	    110 [SCSI] qla2xxx:
    17	    108 ncr5380:
    18	     98 scsi: hpsa:
    19	     97 
    20	     89 treewide:
    21	     88 mpt3sas:
    22	     86 scsi: libfc:
    23	     85 scsi: qedi:
    24	     84 scsi: be2iscsi:
    25	     81 [SCSI] qla4xxx:
    26	     81 hisi_sas:
    27	     81 block:
    28	     75 megaraid_sas:
    29	     71 scsi: sd:
    30	     69 [SCSI] hpsa:
    31	     68 cxlflash:
    32	     65 scsi: libsas:
    33	     65 scsi: fnic:
    34	     61 scsi: scsi_debug:
    35	     60 scsi: arcmsr:
    36	     57 be2iscsi:
    37	     53 atp870u:
    38	     51 scsi: bfa:
    39	     50 scsi: storvsc:
    40	     48 sd:


