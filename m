Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 420484D7B31
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 08:04:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B456D17A2;
	Mon, 14 Mar 2022 08:03:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B456D17A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647241455;
	bh=pvm/KgBDnzIKh347R/KZye+8mI7tPmKi9KRDC+Gg5o8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CD1k6y66w2M3SmOnFqbFqA9AnBXOPXlWHu2OIIcINVot/11EwE6cE/S+TA0Vyid2Y
	 4oG/l/w8UP1Eu+aukLmg7uzZY1E/XwBGIsSsNPP+MRCvAB7DcRH+QG+DD2moBff432
	 zYFLtAYLbZlTmKTDoy8+oCTD0izLlXBw8/WYkrDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47219F80570;
	Mon, 14 Mar 2022 07:59:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55597F80227; Fri, 11 Mar 2022 12:15:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lizzy.crudebyte.com (lizzy.crudebyte.com [91.194.90.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AA5FF80085
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 12:15:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AA5FF80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=crudebyte.com header.i=@crudebyte.com
 header.b="D1ru1+dv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=Ss8ETPefgdaXLbY9caJk2IDTTgCtxdbOIi5PTl6SeJU=; b=D1ru1+dvoMpCvyQnSVD7/rJFX9
 a5IatPaZCNCD9opk/LeNy6cujbEx16s/YZrzMTJ2sERpt29bpMw/SlkVuO+xHl1ppvdVAaaV3w+Xw
 gowZIfsaDzVgEGjGMgqFPIrYreG8cMMVtQMZIjzRQSPmlq/T5kWXR+dBXajY9/YcUcqA3k9hHMI2H
 1ROHBWJCTBAY7ksZRm/IcSWDW+l1I61s4cobgGl1FiSYa27uDZapFFqYXT+Hgu83Zgx1ed+SmaiEg
 r74bK5zceyCkd7PBtUTyvG2X9Uv9pZ38h1DjsZ7JA9W2NWvRfLtF6GIM3NI1ZEEB1EQXbuNwBjXBe
 TbozhPPg==;
From: Christian Schoenebeck <linux_oss@crudebyte.com>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] xen/grant-table: remove readonly parameter from
 functions
Date: Fri, 11 Mar 2022 12:14:28 +0100
Message-ID: <3814243.sK7fzVy7lh@silver>
In-Reply-To: <20220311103429.12845-3-jgross@suse.com>
References: <20220311103429.12845-1-jgross@suse.com>
 <20220311103429.12845-3-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Mailman-Approved-At: Mon, 14 Mar 2022 07:58:51 +0100
Cc: Latchesar Ionkov <lucho@ionkov.net>, alsa-devel@alsa-project.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-pci@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
 dri-devel@lists.freedesktop.org, Peter Huewe <peterhuewe@gmx.de>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-scsi@vger.kernel.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Takashi Iwai <tiwai@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-input@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 Eric Van Hensbergen <ericvh@gmail.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-block@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, xen-devel@lists.xenproject.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-integrity@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
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

On Freitag, 11. M=E4rz 2022 11:34:29 CET Juergen Gross wrote:
> The gnttab_end_foreign_access() family of functions is taking a
> "readonly" parameter, which isn't used. Remove it from the function
> parameters.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---

Acked-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

>  drivers/block/xen-blkfront.c                |  8 ++---
>  drivers/char/tpm/xen-tpmfront.c             |  2 +-
>  drivers/gpu/drm/xen/xen_drm_front_evtchnl.c |  2 +-
>  drivers/input/misc/xen-kbdfront.c           |  4 +--
>  drivers/net/xen-netfront.c                  | 13 ++++---
>  drivers/pci/xen-pcifront.c                  |  2 +-
>  drivers/scsi/xen-scsifront.c                |  4 +--
>  drivers/usb/host/xen-hcd.c                  |  4 +--
>  drivers/xen/gntalloc.c                      |  2 +-
>  drivers/xen/gntdev-dmabuf.c                 |  2 +-
>  drivers/xen/grant-table.c                   | 38 +++++++++------------
>  drivers/xen/pvcalls-front.c                 |  6 ++--
>  drivers/xen/xen-front-pgdir-shbuf.c         |  3 +-
>  include/xen/grant_table.h                   |  5 ++-
>  net/9p/trans_xen.c                          |  8 ++---
>  sound/xen/xen_snd_front_evtchnl.c           |  2 +-
>  16 files changed, 48 insertions(+), 57 deletions(-)


