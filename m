Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B19C6FE87
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 13:10:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F284E1766;
	Mon, 22 Jul 2019 13:09:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F284E1766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563793844;
	bh=SslHumAIWTXDUcxqG2MK0pX9EU+6ziQ6PcTaSPsiRKM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l9oNX/wdSXIFw7K05CiOyu2rd2SOP8ZyQcGfxT5oKinSw0kM1qi2/rPmQRoKo6NKB
	 x9GbFYn4P4ydH9Ht/dau1or4+qgKjM1r7eRJfEFGRxUsdXjRB4slLYare7RLAOtk9D
	 wuxoI7ZsJaM+d/VEJU8pPbNP20vyCBuEtFYCpoPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C14DAF80481;
	Mon, 22 Jul 2019 13:08:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECF69F8048D; Mon, 22 Jul 2019 13:08:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B678F800E8
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 13:08:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B678F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="XSeB4nIV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fkbDO6SEZODxro/YexMPjOtDygrKCoiW6Vz/vfK/gRc=; b=XSeB4nIV5SujmhyYiB9z6cvZY2
 GwCy2JZBbFsbYvMzD9Ls4+snegPYv5NF7wBPyOrHxESxAoq0phoWXKnFHjVifW6Tib21ueCQYLtsK
 b8eWoUZ8YquaXzITEwal3sg4uhbb/p8EKNqTceIVrG1auGwYtoz21TiSE+Tyz7Fgg0QQlHoFwGzKY
 9MQqr2Sxxad/780QIVcv1Nn4USFxdd3/sp40YDVFj9Q5Wo3ojzZ9J2uuXrinur0XoZabBhUKPZBod
 4ipxDqoeq0ljVOD6OwzgETGIpuK2HB3F7+fUlsBChBuw+Xy2gl2Mh0DKUgeUk2QJvMIiGH0d/f1gQ
 8J5Kon/A==;
Received: from 177.157.124.3.dynamic.adsl.gvt.net.br ([177.157.124.3]
 helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hpWAh-000254-B2; Mon, 22 Jul 2019 11:07:59 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hpWAa-00041b-Ct; Mon, 22 Jul 2019 08:07:52 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: 
Date: Mon, 22 Jul 2019 08:07:42 -0300
Message-Id: <45d57666e5738a0b85e948b0e94151fe1b1f9274.1563792334.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563792333.git.mchehab+samsung@kernel.org>
References: <cover.1563792333.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Jonathan Corbet <corbet@lwn.net>,
 netdev@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-doc@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>, "David S. Miller" <davem@davemloft.net>
Subject: [alsa-devel] [PATCH 15/22] docs: index.rst: don't use genindex for
	pdf output
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

The genindex logic is meant to be used only for html output, as
pdf build has its own way to generate indexes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/core-api/index.rst                  | 2 +-
 Documentation/driver-api/dmaengine/index.rst      | 2 +-
 Documentation/driver-api/soundwire/index.rst      | 2 +-
 Documentation/networking/device_drivers/index.rst | 2 +-
 Documentation/networking/index.rst                | 2 +-
 Documentation/sound/index.rst                     | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index dfd8fad1e1ec..fa16a0538dcb 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -49,7 +49,7 @@ Interfaces for kernel debugging
    debug-objects
    tracepoint
 
-.. only::  subproject
+.. only:: subproject and html
 
    Indices
    =======
diff --git a/Documentation/driver-api/dmaengine/index.rst b/Documentation/driver-api/dmaengine/index.rst
index 3026fa975937..b9df904d0a79 100644
--- a/Documentation/driver-api/dmaengine/index.rst
+++ b/Documentation/driver-api/dmaengine/index.rst
@@ -47,7 +47,7 @@ This book adds some notes about PXA DMA
 
    pxa_dma
 
-.. only::  subproject
+.. only::  subproject and html
 
    Indices
    =======
diff --git a/Documentation/driver-api/soundwire/index.rst b/Documentation/driver-api/soundwire/index.rst
index 6db026028f27..234911a0db99 100644
--- a/Documentation/driver-api/soundwire/index.rst
+++ b/Documentation/driver-api/soundwire/index.rst
@@ -10,7 +10,7 @@ SoundWire Documentation
    error_handling
    locking
 
-.. only::  subproject
+.. only::  subproject and html
 
    Indices
    =======
diff --git a/Documentation/networking/device_drivers/index.rst b/Documentation/networking/device_drivers/index.rst
index 2b7fefe72351..f724b7c69b9e 100644
--- a/Documentation/networking/device_drivers/index.rst
+++ b/Documentation/networking/device_drivers/index.rst
@@ -24,7 +24,7 @@ Contents:
    google/gve
    mellanox/mlx5
 
-.. only::  subproject
+.. only::  subproject and html
 
    Indices
    =======
diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
index a46fca264bee..6739066acadb 100644
--- a/Documentation/networking/index.rst
+++ b/Documentation/networking/index.rst
@@ -31,7 +31,7 @@ Contents:
    tls
    tls-offload
 
-.. only::  subproject
+.. only::  subproject and html
 
    Indices
    =======
diff --git a/Documentation/sound/index.rst b/Documentation/sound/index.rst
index 47b89f014e69..4d7d42acf6df 100644
--- a/Documentation/sound/index.rst
+++ b/Documentation/sound/index.rst
@@ -12,7 +12,7 @@ Linux Sound Subsystem Documentation
    hd-audio/index
    cards/index
 
-.. only::  subproject
+.. only::  subproject and html
 
    Indices
    =======
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
