Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B392C2E1F
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 18:12:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0271E1775;
	Tue, 24 Nov 2020 18:11:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0271E1775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606237962;
	bh=50l12hVrQfSv6i3VYjuJGLXxMP8sxcaqNRov35se4Lc=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B+T2ZHOWx9EZqE5XTIzOkKznhctP8nxzE9N2lMdQs3Cuep+srWGJfGmR2tEHQrrZ3
	 fnQbL07MVR/kujUew7NZfHaISS+8N2/1j+ZTzqWP6b9zfQfo0brz9BQGLbq00zbloW
	 WP3J2SX/fSvV+z83qlAEgKX163LTbcteJaG0w2Tk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCC28F805E1;
	Tue, 24 Nov 2020 17:58:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8330F80165; Mon, 23 Nov 2020 01:54:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0112.hostedemail.com
 [216.40.44.112])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB4EFF8015B
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 01:54:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB4EFF8015B
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 2D37318029125;
 Mon, 23 Nov 2020 00:54:05 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: steam95_4513bd127361
X-Filterd-Recvd-Size: 3177
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf02.hostedemail.com (Postfix) with ESMTPA;
 Mon, 23 Nov 2020 00:53:59 +0000 (UTC)
Message-ID: <21826b6d513c4d9ccc795179c1edb0df2361d870.camel@perches.com>
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
From: Joe Perches <joe@perches.com>
To: Finn Thain <fthain@telegraphics.com.au>
Date: Sun, 22 Nov 2020 16:53:58 -0800
In-Reply-To: <alpine.LNX.2.23.453.2011230810210.7@nippy.intranet>
References: <20201121165058.1644182-1-trix@redhat.com>
 <20201122032304.GE4327@casper.infradead.org>
 <ddb08a27-3ca1-fb2e-d51f-4b471f1a56a3@redhat.com>
 <20201122145635.GG4327@casper.infradead.org>
 <0819ce06-c462-d4df-d3d9-14931dc5aefc@redhat.com>
 <751803306cd957d0e7ef6a4fc3dbf12ebceaba92.camel@HansenPartnership.com>
 <dec07021e7fc11a02b14c98b713ae2c6e2a4ca00.camel@perches.com>
 <alpine.LNX.2.23.453.2011230810210.7@nippy.intranet>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 24 Nov 2020 17:58:08 +0100
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 Tom Rix <trix@redhat.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 ibm-acpi-devel@lists.sourceforge.net, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, Matthew Wilcox <willy@infradead.org>,
 linux-scsi@vger.kernel.org, clang-built-linux@googlegroups.com,
 amd-gfx@lists.freedesktop.org, cluster-devel@redhat.com,
 linux-acpi@vger.kernel.org, tboot-devel@lists.sourceforge.net,
 coreteam@netfilter.org, xen-devel@lists.xenproject.org,
 MPT-FusionLinux.pdl@broadcom.com, linux-media@vger.kernel.org,
 alsa-devel@alsa-project.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-omap@vger.kernel.org, devel@acpica.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
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

On Mon, 2020-11-23 at 09:33 +1100, Finn Thain wrote:
> On Sun, 22 Nov 2020, Joe Perches wrote:

> > But provably correct conversions IMO _should_ be done and IMO churn 
> > considerations should generally have less importance.
[]
> Moreover, the patch review workload for skilled humans is being generated 
> by the automation, which is completely backwards: the machine is supposed 
> to be helping.

Which is why the provably correct matters.

coccinelle transforms can be, but are not necessarily, provably correct.

The _show transforms done via the sysfs_emit_dev.cocci script are correct
as in commit aa838896d87a ("drivers core: Use sysfs_emit and sysfs_emit_at
for show(device *...) functions")

Worthwhile?  A different question, but I think yes as it reduces the
overall question space of the existing other sprintf overrun possibilities.


