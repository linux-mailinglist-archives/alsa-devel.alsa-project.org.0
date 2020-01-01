Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5786812E013
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jan 2020 19:28:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D702916AE;
	Wed,  1 Jan 2020 19:28:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D702916AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577903337;
	bh=PRU91rJXmjsN1+qdWx52adeSBmC5TvEzT3hUFfC11TU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jqb8tqc6oulmzqaU9QdnbnFCgD8J3yBPSr1kQUtoWJaN0ebg4tJFMDNLjGpj9o8Fi
	 GlZ9nw9lqm+9bxdPUClEyjPOeRspoJ67SfByQkksMOhce2B+hh2bRbtZTMAKXXQnoZ
	 WAnYRjIas4sEEe5s5f9HZ0XpZCmi8XdtlNQPxXD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3144F80265;
	Wed,  1 Jan 2020 19:26:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE6DBF8015E; Wed,  1 Jan 2020 19:26:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3ECDF8011E
 for <alsa-devel@alsa-project.org>; Wed,  1 Jan 2020 19:26:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3ECDF8011E
X-IronPort-AV: E=Sophos;i="5.69,382,1571695200"; d="scan'208";a="334542271"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/AES128-SHA256;
 01 Jan 2020 19:26:23 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: "H. Peter Anvin" <hpa@zytor.com>
Date: Wed,  1 Jan 2020 18:49:40 +0100
Message-Id: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
Cc: linux-fbdev@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 alsa-devel@alsa-project.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH 00/10] use resource_size
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Use resource_size rather than a verbose computation on
the end and start fields.

The semantic patch that makes these changes is as follows:
(http://coccinelle.lip6.fr/)

<smpl>
@@
struct resource ptr;
@@

- ((ptr.end) - (ptr.start) + 1)
+ resource_size(&ptr)

@@
struct resource *ptr;
@@

- ((ptr->end) - (ptr->start) + 1)
+ resource_size(ptr)

@@
struct resource ptr;
@@

- ((ptr.end) + 1 - (ptr.start))
+ resource_size(&ptr)

@@
struct resource *ptr;
@@

- ((ptr->end) + 1 - (ptr->start))
+ resource_size(ptr)
</smpl>

---

 arch/mips/kernel/setup.c                  |    6 ++----
 arch/powerpc/platforms/83xx/km83xx.c      |    2 +-
 arch/powerpc/platforms/powernv/pci-ioda.c |    4 ++--
 arch/x86/kernel/crash.c                   |    2 +-
 drivers/net/ethernet/freescale/fman/mac.c |    4 ++--
 drivers/usb/gadget/udc/omap_udc.c         |    6 +++---
 drivers/video/fbdev/cg14.c                |    3 +--
 drivers/video/fbdev/s1d13xxxfb.c          |   16 ++++++++--------
 sound/drivers/ml403-ac97cr.c              |    4 +---
 sound/soc/sof/imx/imx8.c                  |    3 +--
 10 files changed, 22 insertions(+), 28 deletions(-)
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
