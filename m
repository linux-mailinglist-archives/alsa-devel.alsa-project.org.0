Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3504CA015
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:56:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BF361FEC;
	Wed,  2 Mar 2022 09:56:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BF361FEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646211416;
	bh=MtpcZIUr3vBAS7pr0HD1s9lnhGV9HRpj+Emyeag+DSU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LxzTbllIDJd5Fb0tJONYgooqO8XyH/eAzbMQv3lrLfyXA/TWsjTC3gD7RBevLCQ4s
	 RyCzFXLl3SbucxPfdIjK5yo4+HxBzJ7SlOl8eFaUQ0XN0aT6twDYmrGyAmvNFgYBHs
	 5an5yZUHNtvKOjfAJjwhVhz0cBRgL4zEwLF3bLjc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50367F80794;
	Wed,  2 Mar 2022 09:34:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32417F80154; Mon, 28 Feb 2022 12:09:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84FBAF80125
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 12:08:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84FBAF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hjvTHeqA"
Received: by mail-ej1-x634.google.com with SMTP id p14so23947501ejf.11
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 03:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HpiN/zwO1wBD5W8vJ5qwHzWs2Mz8GYwVSPoaDyTc8jQ=;
 b=hjvTHeqAC17Nm2rqJFqOWVUlo+eMrb6KCGjEjnmUhT0UbOoSD99k2xAziOpWZa+Icu
 SPp4Zg1lqK8FLNpUHi/iGpToynAZh7AAx7I6BqkiBOWQWPIrLjejJ7mt0E6lp79jr43P
 Z8Tz3UxSCHK1qzDcri6ZY14M8lx9G0bi6GCGQHl0DVbHpgXti6eqzCprjBZYIcyI1uce
 Dn/lOukn9J64/ASqyssuY+hk5ExgHfhAh8xyytTN1bW2SLq53AUCqmHXOqxQHzvGm8yg
 Hb8Tr+NdyPNcInoLFcy82stmYANyPP1+b2zh81uncpq/hmnHTquj2t004aepXQhNWxPC
 QShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HpiN/zwO1wBD5W8vJ5qwHzWs2Mz8GYwVSPoaDyTc8jQ=;
 b=URN0ECquN2nJqLFDb3e1cPXiDaYL+3mgv/s12UgwzwaPunJMyNyU4YJFXTmZMiOV45
 8irVEg0iVZyAugrPqcbX7o4OlmVXg+fLyCripAGwSoDS7QhC1gLHcou0VNkGxSdfXC5G
 E/ChLnH7Cm67TO39U1k3uGzJ/+K1VYrjBdPrUSECCjEN4lclO7gZ9sDPpsB1t69QR7U4
 uMdOhgC7U2lDEeN9LUqZxpMRmsUf83r1kXwDE65EAMJTW0H3cxcFK8IW2zBFdwdLrLoV
 4DRh4SYdwJB7oFTngy5S3rOEk9CJujYzFBlXlcJSHQqmiLGXSxbuz2b5v05mjAcaDiMr
 7NkQ==
X-Gm-Message-State: AOAM533XfODSLaFJfdqZ4wGTCwVceOG/19eNLlNihk3rB4kmUFJde0VI
 gPnF9udDuu2J/8Pr7fxEfjo/J9oPQ33HJH/vqXobFw==
X-Google-Smtp-Source: ABdhPJwIz1+OuMm91LqO5/9SwgL6U3RC8rZg6hPrO7zQUYJxh0T24GQzaSGRh+uNCyYPoPAvBQZaKw==
X-Received: by 2002:a17:906:3803:b0:6cf:56b9:60a9 with SMTP id
 v3-20020a170906380300b006cf56b960a9mr14108161ejc.716.1646046537823; 
 Mon, 28 Feb 2022 03:08:57 -0800 (PST)
Received: from localhost.localdomain (dhcp-077-250-038-153.chello.nl.
 [77.250.38.153]) by smtp.googlemail.com with ESMTPSA id
 z22-20020a17090655d600b006d229436793sm4209049ejp.223.2022.02.28.03.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 03:08:57 -0800 (PST)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 3/6] treewide: fix incorrect use to determine if list is empty
Date: Mon, 28 Feb 2022 12:08:19 +0100
Message-Id: <20220228110822.491923-4-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228110822.491923-1-jakobkoschel@gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:34 +0100
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx@lists.freedesktop.org, samba-technical@lists.samba.org,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, linux-cifs@vger.kernel.org,
 kvm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>,
 Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
 kgdb-bugreport@lists.sourceforge.net, bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-fsdevel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
 linux-block@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
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

The list iterator value will *always* be set by list_for_each_entry().
It is incorrect to assume that the iterator value will be NULL if the
list is empty.

Instead of checking the pointer it should be checked if
the list is empty.
In acpi_get_pmu_hw_inf() instead of setting the pointer to NULL
on the break, it is set to the correct value and leaving it
NULL if no element was found.

Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 arch/powerpc/sysdev/fsl_gtm.c            |  4 ++--
 drivers/media/pci/saa7134/saa7134-alsa.c |  4 ++--
 drivers/perf/xgene_pmu.c                 | 13 +++++++------
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_gtm.c b/arch/powerpc/sysdev/fsl_gtm.c
index 8963eaffb1b7..39186ad6b3c3 100644
--- a/arch/powerpc/sysdev/fsl_gtm.c
+++ b/arch/powerpc/sysdev/fsl_gtm.c
@@ -86,7 +86,7 @@ static LIST_HEAD(gtms);
  */
 struct gtm_timer *gtm_get_timer16(void)
 {
-	struct gtm *gtm = NULL;
+	struct gtm *gtm;
 	int i;

 	list_for_each_entry(gtm, &gtms, list_node) {
@@ -103,7 +103,7 @@ struct gtm_timer *gtm_get_timer16(void)
 		spin_unlock_irq(&gtm->lock);
 	}

-	if (gtm)
+	if (!list_empty(&gtms))
 		return ERR_PTR(-EBUSY);
 	return ERR_PTR(-ENODEV);
 }
diff --git a/drivers/media/pci/saa7134/saa7134-alsa.c b/drivers/media/pci/saa7134/saa7134-alsa.c
index fb24d2ed3621..d3cde05a6eba 100644
--- a/drivers/media/pci/saa7134/saa7134-alsa.c
+++ b/drivers/media/pci/saa7134/saa7134-alsa.c
@@ -1214,7 +1214,7 @@ static int alsa_device_exit(struct saa7134_dev *dev)

 static int saa7134_alsa_init(void)
 {
-	struct saa7134_dev *dev = NULL;
+	struct saa7134_dev *dev;

 	saa7134_dmasound_init = alsa_device_init;
 	saa7134_dmasound_exit = alsa_device_exit;
@@ -1229,7 +1229,7 @@ static int saa7134_alsa_init(void)
 			alsa_device_init(dev);
 	}

-	if (dev == NULL)
+	if (list_empty(&saa7134_devlist))
 		pr_info("saa7134 ALSA: no saa7134 cards found\n");

 	return 0;
diff --git a/drivers/perf/xgene_pmu.c b/drivers/perf/xgene_pmu.c
index 2b6d476bd213..e255f9e665d1 100644
--- a/drivers/perf/xgene_pmu.c
+++ b/drivers/perf/xgene_pmu.c
@@ -1460,7 +1460,8 @@ xgene_pmu_dev_ctx *acpi_get_pmu_hw_inf(struct xgene_pmu *xgene_pmu,
 	struct hw_pmu_info *inf;
 	void __iomem *dev_csr;
 	struct resource res;
-	struct resource_entry *rentry;
+	struct resource_entry *rentry = NULL;
+	struct resource_entry *tmp;
 	int enable_bit;
 	int rc;

@@ -1475,16 +1476,16 @@ xgene_pmu_dev_ctx *acpi_get_pmu_hw_inf(struct xgene_pmu *xgene_pmu,
 		return NULL;
 	}

-	list_for_each_entry(rentry, &resource_list, node) {
-		if (resource_type(rentry->res) == IORESOURCE_MEM) {
-			res = *rentry->res;
-			rentry = NULL;
+	list_for_each_entry(tmp, &resource_list, node) {
+		if (resource_type(tmp->res) == IORESOURCE_MEM) {
+			res = *tmp->res;
+			rentry = tmp;
 			break;
 		}
 	}
 	acpi_dev_free_resource_list(&resource_list);

-	if (rentry) {
+	if (!rentry) {
 		dev_err(dev, "PMU type %d: No memory resource found\n", type);
 		return NULL;
 	}
--
2.25.1

