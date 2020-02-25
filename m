Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D0816F0C5
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Feb 2020 22:00:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CF371699;
	Tue, 25 Feb 2020 21:59:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CF371699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582664400;
	bh=bUd27AwJqBzkc+a/YzHr6t7aDFALZiBJW37pwoR3XXw=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=LUZvp8a8D/Th5HXyKNBGU5nySk9zlsJQkQ6rexvjK/DZjDuNvL13lohSIo6BinqCZ
	 YCE2h7vP4nfv0m8C+jI9Ug4jEfUiJ3hA7N9duFm5hK8YCMD80gWm6eP0N35nWGr/5E
	 3r08Lhk8xKjs9TaYsW57yp61F1ZeH7OC01moXiBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BAAAF80090;
	Tue, 25 Feb 2020 21:58:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37BDDF8025E; Tue, 25 Feb 2020 21:58:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,FAKE_REPLY_C,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4CDEF80090
 for <alsa-devel@alsa-project.org>; Tue, 25 Feb 2020 21:57:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4CDEF80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Bxtqlrmx"
Received: from localhost (mobile-166-175-186-165.mycingular.net
 [166.175.186.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB8AE22464;
 Tue, 25 Feb 2020 20:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582664277;
 bh=bUd27AwJqBzkc+a/YzHr6t7aDFALZiBJW37pwoR3XXw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=BxtqlrmxhXqEjmzPLOMEH4gAcfxztB1ZobBuZtd6KtV8zavbIcXdKhoIqzNceIFRd
 gsfa1PMXi0a4n6ESV2XY98VfAkGfLzpPbHT71/C2Vscc04pgwcqC2ZEcr4posnKKcq
 W0dQ7tn9goQRnaQIP8dPPAK5YNcA5EZ3DkXlE/bY=
Date: Tue, 25 Feb 2020 14:57:55 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v3 0/8] PCI: add and use constant PCI_STATUS_ERROR_BITS
 and helper pci_status_get_and_clear_errors
Message-ID: <20200225205755.GA199380@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20ca7c1f-7530-2d89-40a6-d97a65aa25ef@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: alsa-devel@alsa-project.org,
 Realtek linux nic maintainers <nic_swsd@realtek.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 David Miller <davem@davemloft.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mirko Lindner <mlindner@marvell.com>
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

On Tue, Feb 25, 2020 at 03:03:05PM +0100, Heiner Kallweit wrote:
> Few drivers have own definitions for this constant, so move it to the
> PCI core. In addition there are several places where the following
> code sequence is used:
> 1. Read PCI_STATUS
> 2. Mask out non-error bits
> 3. Action based on set error bits
> 4. Write back set error bits to clear them
> 
> As this is a repeated pattern, add a helper to the PCI core.
> 
> Most affected drivers are network drivers. But as it's about core
> PCI functionality, I suppose the series should go through the PCI
> tree.

Makes good sense to me, thanks for doing this.

> v2:
> - fix formal issue with cover letter
> v3:
> - fix dumb typo in patch 7
> 
> Heiner Kallweit (8):
>   PCI: add constant PCI_STATUS_ERROR_BITS
>   PCI: add pci_status_get_and_clear_errors
>   r8169: use pci_status_get_and_clear_errors
>   net: cassini: use pci_status_get_and_clear_errors
>   net: sungem: use pci_status_get_and_clear_errors
>   net: skfp: use PCI_STATUS_ERROR_BITS
>   PCI: pci-bridge-emul: use PCI_STATUS_ERROR_BITS
>   sound: bt87x: use pci_status_get_and_clear_errors
> 
>  drivers/net/ethernet/marvell/skge.h       |  6 -----
>  drivers/net/ethernet/marvell/sky2.h       |  6 -----
>  drivers/net/ethernet/realtek/r8169_main.c | 15 +++++-------
>  drivers/net/ethernet/sun/cassini.c        | 28 ++++++++-------------
>  drivers/net/ethernet/sun/sungem.c         | 30 +++++++----------------
>  drivers/net/fddi/skfp/drvfbi.c            |  2 +-
>  drivers/net/fddi/skfp/h/skfbi.h           |  5 ----
>  drivers/pci/pci-bridge-emul.c             | 14 ++---------
>  drivers/pci/pci.c                         | 23 +++++++++++++++++
>  include/linux/pci.h                       |  1 +
>  include/uapi/linux/pci_regs.h             |  7 ++++++
>  sound/pci/bt87x.c                         |  7 +-----
>  12 files changed, 60 insertions(+), 84 deletions(-)
> 
> -- 
> 2.25.1
> 
> 
> 
