Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DDB2C2DBC
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 18:05:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFD0B1709;
	Tue, 24 Nov 2020 18:04:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFD0B1709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606237519;
	bh=oKjwoQQYqAGHYIcGa87tH3kfRh6eNDZ11DRWs/5n6Nc=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pfvu8BLTfPUA1In9f1k/mOe8hCKvpn3qfrMFHyblMz9ACeFK1W/vwihPNkJZT4wo+
	 /kI05u/+Y4VI272Z9kidmem2J4a5lr6/j4APjuJiPV+OE3ZMGebRT+t39Z2zqOiUmF
	 4DKc7iTSosz6rYxK2Ll+yCGv+ODSuD6ks+iM9700=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2A96F80524;
	Tue, 24 Nov 2020 17:58:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D7CBF801ED; Sat, 21 Nov 2020 18:19:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
 [IPv6:2607:fcd0:100:8a00::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BF42F800C5
 for <alsa-devel@alsa-project.org>; Sat, 21 Nov 2020 18:19:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BF42F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=hansenpartnership.com
 header.i=@hansenpartnership.com header.b="Lvt0xf0A"; 
 dkim=pass (1024-bit key) header.d=hansenpartnership.com
 header.i=@hansenpartnership.com header.b="qZT/78tS"
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 2C7E2128048D;
 Sat, 21 Nov 2020 09:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1605979140;
 bh=oKjwoQQYqAGHYIcGa87tH3kfRh6eNDZ11DRWs/5n6Nc=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=Lvt0xf0A2UjzBqGR2epCNoE7DN6YV9pUrVXD+f22BVAeiOW2KxZsGCImkMcXBrgh/
 zD0zBdigF+USoIPaRfSUxU4T/o3yBTwQz1ZuRUKYioWvma2ORezv7XJ+/UVZk14HDg
 znn3A0Y1A4QkkRvYDhfOKnhgBoH92sfIP7bAjSz4=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id dA_Y3gfv-HlR; Sat, 21 Nov 2020 09:19:00 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown
 [IPv6:2601:600:8280:66d1::527])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 584A71280481;
 Sat, 21 Nov 2020 09:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1605979139;
 bh=oKjwoQQYqAGHYIcGa87tH3kfRh6eNDZ11DRWs/5n6Nc=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=qZT/78tSZnguNV1yoYzSSmvqmDGgzNIuIpg2PbOws0zqwE5yu2CoK/DoUP3fxAE7/
 cwr3zThASX8R91ADl4Ew6X2dNx0rQAVJjUjWHCFXFVZg8s5iaP8BFiZuwsxl12vuws
 rCw1QQ3k1zT/j95+Y6p1vgihiOvqC5dVUCKPWDl0=
Message-ID: <5843ef910b0e86c00d9c0143dec20f93823b016b.camel@HansenPartnership.com>
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: trix@redhat.com, joe@perches.com, clang-built-linux@googlegroups.com
Date: Sat, 21 Nov 2020 09:18:57 -0800
In-Reply-To: <20201121165058.1644182-1-trix@redhat.com>
References: <20201121165058.1644182-1-trix@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 24 Nov 2020 17:58:06 +0100
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
> preamble in the commit log.  For the ongoing effort of a fixer
> producing
> one or two fixes a release the use of 'treewide:' does not seem
> appropriate.
> 
> It would be better if the normal prefix was used.  Unfortunately
> normal is
> not consistent across the tree.
> 
> 
> 	D: Commit subsystem prefix
> 
> ex/ for FPGA DFL DRIVERS
> 
> 	D: fpga: dfl:
> 

I've got to bet this is going to cause more issues than it solves. 
SCSI uses scsi: <driver>: for drivers but not every driver has a
MAINTAINERS entry.  We use either scsi: or scsi: core: for mid layer
things, but we're not consistent.  Block uses blk-<something>: for all
of it's stuff but almost no <somtehing>s have a MAINTAINERS entry.  So
the next thing you're going to cause is an explosion of suggested
MAINTAINERs entries.

Has anyone actually complained about treewide:?

James


