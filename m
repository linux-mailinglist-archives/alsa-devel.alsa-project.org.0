Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1332C2DAA
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 18:03:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C9281700;
	Tue, 24 Nov 2020 18:02:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C9281700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606237396;
	bh=MIbDbY/3ZJ/znEuoqw1SyvrZ1f8YBrSG8tKwt3LdHHw=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vLC32jySb666+AcKBtvLzASZM0rvVZBPnMWhYGljb8/umqDwfeFHOWYKyRQNrl63q
	 JCH3ezCT6mxyadA4NEpKomohyBMv0nbeGkNoj3zvn81Ormy8jlnHWQV3AC56HlAmbW
	 fxQv6bhtnOJvMMb3aPl+9MFFVQS5sKqQWeYeKN7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90353F804FD;
	Tue, 24 Nov 2020 17:58:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 334E3F801ED; Sat, 21 Nov 2020 18:10:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=KHOP_HELO_FCRDNS, PRX_BODY_76, 
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0219.hostedemail.com
 [216.40.44.219])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 457C1F80166
 for <alsa-devel@alsa-project.org>; Sat, 21 Nov 2020 18:10:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 457C1F80166
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id C09E2837F24A;
 Sat, 21 Nov 2020 17:10:14 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: crook72_110ffeb27355
X-Filterd-Recvd-Size: 4090
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf05.hostedemail.com (Postfix) with ESMTPA;
 Sat, 21 Nov 2020 17:10:09 +0000 (UTC)
Message-ID: <2105f0c05e9eae8bee8e17dcc5314474b3c0bc73.camel@perches.com>
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
From: Joe Perches <joe@perches.com>
To: trix@redhat.com, clang-built-linux@googlegroups.com
Date: Sat, 21 Nov 2020 09:10:08 -0800
In-Reply-To: <20201121165058.1644182-1-trix@redhat.com>
References: <20201121165058.1644182-1-trix@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Sat, 2020-11-21 at 08:50 -0800, trix@redhat.com wrote:
> A difficult part of automating commits is composing the subsystem
> preamble in the commit log.  For the ongoing effort of a fixer producing
> one or two fixes a release the use of 'treewide:' does not seem appropriate.
> 
> It would be better if the normal prefix was used.  Unfortunately normal is
> not consistent across the tree.
> 
> So I am looking for comments for adding a new tag to the MAINTAINERS file
> 
> 	D: Commit subsystem prefix
> 
> ex/ for FPGA DFL DRIVERS
> 
> 	D: fpga: dfl:

I'm all for it.  Good luck with the effort.  It's not completely trivial.

From a decade ago:

https://lore.kernel.org/lkml/1289919077.28741.50.camel@Joe-Laptop/

(and that thread started with extra semicolon patches too)

> Continuing with cleaning up clang's -Wextra-semi-stmt

> diff --git a/Makefile b/Makefile
[]
> @@ -1567,20 +1567,21 @@ help:
>  	 echo  ''
>  	@echo  'Static analysers:'
>  	@echo  '  checkstack      - Generate a list of stack hogs'
>  	@echo  '  versioncheck    - Sanity check on version.h usage'
>  	@echo  '  includecheck    - Check for duplicate included header files'
>  	@echo  '  export_report   - List the usages of all exported symbols'
>  	@echo  '  headerdep       - Detect inclusion cycles in headers'
>  	@echo  '  coccicheck      - Check with Coccinelle'
>  	@echo  '  clang-analyzer  - Check with clang static analyzer'
>  	@echo  '  clang-tidy      - Check with clang-tidy'
> +	@echo  '  clang-tidy-fix  - Check and fix with clang-tidy'

A pity the ordering of the code below isn't the same as the above.

> -PHONY += clang-tidy clang-analyzer
> +PHONY += clang-tidy-fix clang-tidy clang-analyzer
[]
> -clang-tidy clang-analyzer: $(extmod-prefix)compile_commands.json
> +clang-tidy-fix clang-tidy clang-analyzer: $(extmod-prefix)compile_commands.json
>  	$(call cmd,clang_tools)
>  else
> -clang-tidy clang-analyzer:
> +clang-tidy-fix clang-tidy clang-analyzer:

[]

> diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
[]
> @@ -22,43 +22,57 @@ def parse_arguments():
[]
>      parser.add_argument("type",
> -                        choices=["clang-tidy", "clang-analyzer"],
> +                        choices=["clang-tidy-fix", "clang-tidy", "clang-analyzer"],

etc...

