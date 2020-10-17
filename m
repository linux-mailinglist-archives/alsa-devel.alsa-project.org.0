Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 006BF294DCA
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Oct 2020 15:44:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F390179F;
	Wed, 21 Oct 2020 15:43:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F390179F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603287865;
	bh=XZ+KbGzeu8JFGqsEqMNK3B8MrMmknSmA4Qd9FYn6o28=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lhDAZ9hHUJ9l1MyPN/WxAMOk2LXIv27jAWvpu4WBiLKbMLcj//kE4HHHVNz21maW3
	 UDvsc7XvWBx0CrV/EAoFWo9k12yQQSqm9v0Lb/PdAOYjLuwudsSUCb6JH22lJ3YRme
	 yHdKKyQg3UQX9ayZt9Oq30fwzby1P7nSN1uKsYVs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29B13F80515;
	Wed, 21 Oct 2020 15:37:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0C37F80255; Sat, 17 Oct 2020 21:00:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0025.hostedemail.com
 [216.40.44.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD686F800AD
 for <alsa-devel@alsa-project.org>; Sat, 17 Oct 2020 21:00:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD686F800AD
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id 15895182CED2A;
 Sat, 17 Oct 2020 19:00:10 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: jewel08_4005cbe27228
X-Filterd-Recvd-Size: 5179
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf01.hostedemail.com (Postfix) with ESMTPA;
 Sat, 17 Oct 2020 19:00:02 +0000 (UTC)
Message-ID: <503af4a57ca6daeb3e42a9be136dcd21e6d6e23d.camel@perches.com>
Subject: Re: [Cocci] [RFC] treewide: cleanup unreachable breaks
From: Joe Perches <joe@perches.com>
To: Julia Lawall <julia.lawall@inria.fr>
Date: Sat, 17 Oct 2020 12:00:01 -0700
In-Reply-To: <alpine.DEB.2.22.394.2010172016370.9440@hadrien>
References: <20201017160928.12698-1-trix@redhat.com>
 <f530b7aeecbbf9654b4540cfa20023a4c2a11889.camel@perches.com>
 <alpine.DEB.2.22.394.2010172016370.9440@hadrien>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 21 Oct 2020 15:37:34 +0200
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org, trix@redhat.com,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 usb-storage@lists.one-eyed-alien.net, devel@driverdev.osuosl.org,
 linux-samsung-soc@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-pm@vger.kernel.org, ath10k@lists.infradead.org,
 cocci <cocci@systeme.lip6.fr>, clang-built-linux@googlegroups.com,
 intel-wired-lan@lists.osuosl.org, industrypack-devel@lists.sourceforge.net,
 nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 MPT-FusionLinux.pdl@broadcom.com, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-nfc@lists.01.org,
 linux-serial@vger.kernel.org, linux-can@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 storagedev@microchip.com, xen-devel@lists.xenproject.org,
 openipmi-developer@lists.sourceforge.net, platform-driver-x86@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org,
 patches@opensource.cirrus.com, linux-integrity@vger.kernel.org,
 ocfs2-devel@oss.oracle.com, linux-power@fi.rohmeurope.com
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

On Sat, 2020-10-17 at 20:21 +0200, Julia Lawall wrote:
> On Sat, 17 Oct 2020, Joe Perches wrote:
> > On Sat, 2020-10-17 at 09:09 -0700, trix@redhat.com wrote:
> > > From: Tom Rix <trix@redhat.com>
> > > 
> > > This is a upcoming change to clean up a new warning treewide.
> > > I am wondering if the change could be one mega patch (see below) or
> > > normal patch per file about 100 patches or somewhere half way by collecting
> > > early acks.
> > > 
> > > clang has a number of useful, new warnings see
> > > https://clang.llvm.org/docs/DiagnosticsReference.html
> > > 
> > > This change cleans up -Wunreachable-code-break
> > > https://clang.llvm.org/docs/DiagnosticsReference.html#wunreachable-code-break
> > > for 266 of 485 warnings in this week's linux-next, allyesconfig on x86_64.
> > 
> > Early acks/individual patches by subsystem would be good.
> > Better still would be an automated cocci script.
> 
> Coccinelle is not especially good at this, because it is based on control
> flow, and a return or goto diverts the control flow away from the break.
> A hack to solve the problem is to put an if around the return or goto, but
> that gives the break a meaningless file name and line number.  I collected
> the following list, but it only has 439 results, so fewer than clang.  But
> maybe there are some files that are not considered by clang in the x86
> allyesconfig configuration.
> 
> Probably checkpatch is the best solution here, since it is not
> configuration sensitive and doesn't care about control flow.

Likely the clang compiler is the best option here.

It might be useful to add -Wunreachable-code-break to W=1
or just always enable it if it isn't already enabled.

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 95e4cdb94fe9..3819787579d5 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -32,6 +32,7 @@ KBUILD_CFLAGS += $(call cc-option, -Wunused-but-set-variable)
 KBUILD_CFLAGS += $(call cc-option, -Wunused-const-variable)
 KBUILD_CFLAGS += $(call cc-option, -Wpacked-not-aligned)
 KBUILD_CFLAGS += $(call cc-option, -Wstringop-truncation)
+KBUILD_CFLAGS += $(call cc-option, -Wunreachable-code-break)
 # The following turn off the warnings enabled by -Wextra
 KBUILD_CFLAGS += -Wno-missing-field-initializers
 KBUILD_CFLAGS += -Wno-sign-compare

(and thank you Tom for pushing this forward)

checkpatch can't find instances like:

	case FOO:
		if (foo)
			return 1;
		else
			return 2;
		break;

As it doesn't track flow and relies on the number
of tabs to be the same for any goto/return and break;

checkpatch will warn on:

	case FOO:
		...
		goto bar;
		break;


