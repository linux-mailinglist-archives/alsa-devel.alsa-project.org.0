Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B56FC9BFC
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Oct 2019 12:17:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D00DD1676;
	Thu,  3 Oct 2019 12:16:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D00DD1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570097833;
	bh=2XXhVgS7FIoQ8x2EnYiBkz2jhxc824G6kCUHiDQRcto=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cmFvkB03Sys01hSx4T0+0LkhUTIiTTm/gUaaeRQKV0UDWEKucNd1btAcUwpyCFBfp
	 atiyVaCm96r1JO5jn3tz1F03So0hjPGAXiYPdzO8DqbxzZ7myKzMcPysjza4t41GCy
	 9QARCWjjMGuVatVILNGHyXa9DERo4LOtt7QNfqYY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32F2BF805AF;
	Thu,  3 Oct 2019 12:14:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C43BF80506; Thu,  3 Oct 2019 12:14:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66754F80137
 for <alsa-devel@alsa-project.org>; Thu,  3 Oct 2019 12:14:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66754F80137
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E2359ABC4;
 Thu,  3 Oct 2019 10:14:35 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu,  3 Oct 2019 12:13:55 +0200
Message-Id: <0b89b4ea16a93f523105c81a2f718b0cd7ec66f2.1570097621.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191002081717.GA4015@kitsune.suse.cz>
References: <20191002081717.GA4015@kitsune.suse.cz>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Michal Suchanek <msuchanek@suse.de>
Subject: [alsa-devel] [PATCH v2 2/2] soundwire: depend on ACPI || OF
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

Now devicetree is supported for probing soundwire as well.

On platforms built with !ACPI !OF (ie s390x) the device still cannot be
probed and gives a build warning.

Cc: stable@vger.kernel.org
Fixes: a2e484585ad3 ("soundwire: core: add device tree support for slave devices")
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 drivers/soundwire/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
index c73bfbaa2659..c8c80df090d1 100644
--- a/drivers/soundwire/Kconfig
+++ b/drivers/soundwire/Kconfig
@@ -5,7 +5,7 @@
 
 menuconfig SOUNDWIRE
 	tristate "SoundWire support"
-	depends on ACPI
+	depends on ACPI || OF
 	help
 	  SoundWire is a 2-Pin interface with data and clock line ratified
 	  by the MIPI Alliance. SoundWire is used for transporting data
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
