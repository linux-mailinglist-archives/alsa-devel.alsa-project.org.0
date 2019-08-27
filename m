Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F470A1C9D
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:23:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27C931697;
	Thu, 29 Aug 2019 16:23:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27C931697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567088633;
	bh=STNq3o7/v8mucHIH3D+AWygvWdU1swUWpLZUeCSXQAk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NF7JwXwWg/84NFli7Y0j4pUM7NWqgN+85g6pq6j16J4XN/IeDPXxTL9tqDLekfTw7
	 7n62W2OhowVGORvRJS2Cy3mVuLEkaHINQOBAS6yVU7e+SXcqubl672iWI3Yqla2bRN
	 ltdG5c/CwyQ8sC9rwwrRGyi9AfgYGdQTTQltIWVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C15CF80CB7;
	Wed, 28 Aug 2019 00:13:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D2F2F80CB6; Wed, 28 Aug 2019 00:13:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26DD1F80CAB
 for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 00:13:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26DD1F80CAB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qY4Vfyb0"
Received: from localhost (unknown [69.71.4.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D036120679;
 Tue, 27 Aug 2019 22:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566944004;
 bh=LZPQogWInSb9gqAI/aacGbig10OJaeQDStsJ1k9m4k8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qY4Vfyb0VjYNejMGwIgHw25hJrjYFb+65rOtdKARqBjG31pqtDOU7WfU9tXxDjYjo
 jPnwwr5yMWnzW5y6m1+X2akbYC87QcyyGv+tGBnMRnxtfq+6uD1FgObO18DFy7kPw/
 zRECNK84asDwgGcK+jly/EWPp28g+asVgZxD8N1s=
Date: Tue, 27 Aug 2019 17:13:21 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Message-ID: <20190827221321.GA9987@google.com>
References: <20190827134756.10807-1-kai.heng.feng@canonical.com>
 <s5hr2567hrd.wl-tiwai@suse.de>
 <0379E973-651A-442C-AF74-51702388F55D@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0379E973-651A-442C-AF74-51702388F55D@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Peter Wu <peter@lekensteyn.nl>, Dave Airlie <airlied@redhat.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/2] PCI: Add a helper to check Power
 Resource Requirements _PR3 existence
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

[+cc Peter, Mika, Dave]

https://lore.kernel.org/r/20190827134756.10807-1-kai.heng.feng@canonical.com

On Wed, Aug 28, 2019 at 12:58:28AM +0800, Kai-Heng Feng wrote:
> at 23:25, Takashi Iwai <tiwai@suse.de> wrote:
> > On Tue, 27 Aug 2019 15:47:55 +0200,
> > Kai-Heng Feng wrote:
> > > A driver may want to know the existence of _PR3, to choose different
> > > runtime suspend behavior. A user will be add in next patch.
> > > 
> > > This is mostly the same as nouveau_pr3_present().
> > 
> > Then it'd be nice to clean up the nouveau part, too?
> 
> nouveau_pr3_present() may call pci_d3cold_disable(), and my intention is to
> only check the presence of _PR3 (i.e. a dGPU) without touching anything.

It looks like Peter added that code with 279cf3f23870
("drm/nouveau/acpi: use DSM if bridge does not support D3cold").

I don't understand the larger picture, but it is somewhat surprising
that nouveau_pr3_present() *looks* like a simple predicate with no
side-effects, but in fact it disables the use of D3cold in some cases.

If the disable were moved to the caller, Kai-Heng's new interface
could be used both places.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
