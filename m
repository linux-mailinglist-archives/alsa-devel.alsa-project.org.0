Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FC1333DD8
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 14:25:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13F621769;
	Wed, 10 Mar 2021 14:25:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13F621769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615382751;
	bh=KMb8ucIffYgDmN6VvsdOQ/Oc9zpMgaPIG1XdHkqz0+4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AAwrNav6b1BOR4Unq/zlj0CCH33Bx658GfIKeABQFFmyml3yBcghRUVjjdrbf5eDb
	 YlCtp3pbzaYrStXZ+CDduUwH3YjniBRfChrczwhEZ0w6Tp5AzgfYJ1BaU0ycneQE7s
	 CKGCZmOsoa4Op/S2a/7iYG44Wjeb3mLcJhDmS+rw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44374F8014E;
	Wed, 10 Mar 2021 14:24:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97E54F801D8; Wed, 10 Mar 2021 14:24:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6150CF8012F
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 14:24:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6150CF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="YuU5aHpE"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D56364FD7;
 Wed, 10 Mar 2021 13:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1615382650;
 bh=KMb8ucIffYgDmN6VvsdOQ/Oc9zpMgaPIG1XdHkqz0+4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YuU5aHpEpOEnGe1rm8TgWNAaVK1qv6l6ziW4rrpUtCs7A+ym/sjDganpATKR3GiwF
 2m4XLYYKkAehauLvF+RrGJl1iOncpagCVQm3YWR97R90cWA4+NU7bmar8xnPylLH2b
 cXIa6Htqp91pRplTZxqaeZTnT5yba7YADJJY2s1M=
From: gregkh@linuxfoundation.org
To: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 5.10 02/49] [PATCH v2] ASoC: SOF: Intel: broadwell: fix mutual
 exclusion with catpt driver
Date: Wed, 10 Mar 2021 14:23:13 +0100
Message-Id: <20210310132322.027740959@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210310132321.948258062@linuxfoundation.org>
References: <20210310132321.948258062@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Ward <david.ward@ll.mit.edu>, stable@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

In v5.10, the "haswell" driver was replaced by the "catpt" driver, but
the mutual exclusion with the SOF driver was not updated. This leads
to errors with card names and UCM profiles not being loaded by
PulseAudio.

This fix should only be applied on v5.10-stable, the mutual exclusion
was removed in 5.11.

Reported-by: David Ward <david.ward@ll.mit.edu>
Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=211985
Fixes: 6cbfa11d2694 ("ASoC: Intel: Select catpt and deprecate haswell")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Acked-by: Mark Brown <broonie@kernel.org>
Cc: <stable@vger.kernel.org>
Cc: Sasha Levin <sashal@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 sound/soc/sof/intel/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -84,7 +84,7 @@ config SND_SOC_SOF_BAYTRAIL
 
 config SND_SOC_SOF_BROADWELL_SUPPORT
 	bool "SOF support for Broadwell"
-	depends on SND_SOC_INTEL_HASWELL=n
+	depends on SND_SOC_INTEL_CATPT=n
 	help
 	  This adds support for Sound Open Firmware for Intel(R) platforms
 	  using the Broadwell processors.


