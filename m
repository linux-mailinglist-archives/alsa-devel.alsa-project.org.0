Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B838117CE
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 13:02:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E39AF173B;
	Thu,  2 May 2019 13:01:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E39AF173B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556794964;
	bh=nUA/nTe5eUhqfh1XXQzs8M5srIY3P+rIpr81up1XQ/Y=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mu7dBP56kyfzIUCiST0GIU2QiFMFnHBHQaPkzgPLtNDZOg6gjvjC0CmxArOdWDoZt
	 JGyuAQ1UmPe4T6v/zs4PO2wX5B3XSNqzRME4Ud6YWs7gUuvsT60TKLRcflt/a0i3cX
	 bEwFnbRn6PVSyIoLZJQNQ3T0ek4ioCGp2xCLTKJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1780FF896C7;
	Thu,  2 May 2019 13:00:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A33CFF89693; Thu,  2 May 2019 13:00:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAD78F89693
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 13:00:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAD78F89693
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="J22u0mYx"
Received: from localhost.localdomain (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C1C132089E;
 Thu,  2 May 2019 11:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556794814;
 bh=895fio07835NYHHRyiZHbmTJnGQkN7WJR00Qv1UCV4E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J22u0mYxcdRaAI4AxmfAls0Da0bRJb/quhWbrcW2ziGzCOGUAZM4ydB2skMaQMRHw
 0R+1wIJCaBl6qRXmAoZvPz6YzqNA65QE6vZqtus8aFKfc8tADP/mz+qrDoVihJAGnK
 SHZjwj7TecEXmfvnqyUQtf0bB0AhOcCr1XD7SQRg=
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Date: Thu,  2 May 2019 16:29:17 +0530
Message-Id: <20190502105930.9889-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502105930.9889-1-vkoul@kernel.org>
References: <20190502105930.9889-1-vkoul@kernel.org>
MIME-Version: 1.0
Cc: Greg KH <gregkh@linuxfoundation.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Vinod Koul <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Shreyas NC <shreyas.nc@intel.com>
Subject: [alsa-devel] [PATCH 01/14] soundwire: fix kconfig help format
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

Move to help format instead of --help-- as that is not recommended and
this makes file consistent with other instance

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soundwire/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
index 84876a74874f..53b55b79c4af 100644
--- a/drivers/soundwire/Kconfig
+++ b/drivers/soundwire/Kconfig
@@ -28,7 +28,7 @@ config SOUNDWIRE_INTEL
 	select SOUNDWIRE_CADENCE
 	select SOUNDWIRE_BUS
 	depends on X86 && ACPI && SND_SOC
-	---help---
+	help
 	  SoundWire Intel Master driver.
 	  If you have an Intel platform which has a SoundWire Master then
 	  enable this config option to get the SoundWire support for that
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
