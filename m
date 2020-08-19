Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E6024A1F9
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 16:46:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8A3E185F;
	Wed, 19 Aug 2020 16:46:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8A3E185F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597848416;
	bh=xOiuJWeNJlBrFfLxSP/Bhr1YWUzmYPKwt9KXNcztcL8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Wj05QsSWW+eoqG1+VYGL0fYQOPsjknYnc1BJ2mXnERM+t+E8A7JwsuGATinAKf+MP
	 ed8d8L5knBSgkf8ENo9qXmg/fiHm8U+g1G2H2UIQfyuyG2ewIihj/GDdPPMjttr3z4
	 1m36Cbd7lnLQf2XJaMlzUOVgR02cbvvflWaoSl/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDBCDF80216;
	Wed, 19 Aug 2020 16:45:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C4DCF80218; Wed, 19 Aug 2020 16:45:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF14EF800D3
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 16:45:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF14EF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Ecu/ODBI"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f3d3a780001>; Wed, 19 Aug 2020 07:43:04 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 19 Aug 2020 07:44:58 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 19 Aug 2020 07:44:58 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 19 Aug
 2020 14:44:54 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 19 Aug 2020 14:44:53 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f3d3ae20000>; Wed, 19 Aug 2020 07:44:52 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <tiwai@suse.com>, <perex@perex.cz>
Subject: [PATCH] ALSA: hda: avoid reset of sdo_limit
Date: Wed, 19 Aug 2020 20:14:33 +0530
Message-ID: <1597848273-25813-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1597848184; bh=r259BE/Wv/192bTP/TCyvzCie6DbWCgPuvthR/nJltQ=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 X-NVConfidentiality:MIME-Version:Content-Type;
 b=Ecu/ODBICncWcP0dg0JsCV7FRbRSnUqbk/Ft+GUPzyLqLLVoquI+v0jkGHvV/pJXk
 CBYqHC4HjwVrM1m9RYJi785xNN0M7UZS1A2gpYlMiF7TGlwd2NJzGeo71R8aDAGD2i
 wlH23T6yNpM4V/wmoCxc+J1s5KRTDVinuw6jcrLp42113HHq9f03zBlTkbkPXk5OKm
 xNrvv2oGHIq5qRgiWizdodtisOT9F8YpP8cEGnpaUqbszfT9NosHWoXXdy0kHPHE7+
 BpunBnyMDEjqos0NvUnRwoWzuozHoYw8P+mozSJq1jliIK0m4t/8j/+aUsz6tPOlXq
 D1SVhSTbwzA0g==
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 Sameer Pujar <spujar@nvidia.com>, yang.jie@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

By default 'sdo_limit' is initialized with a default value of '8'
as per spec. This is overridden in cases where a different value is
required. However this is getting reset when snd_hdac_bus_init_chip()
is called again, which happens during runtime PM cycle. Avoid reset
by not initializing to default value everytime.

Fixes: 67ae482a59e9 ("ALSA: hda: add member to store ratio for stripe control")
Cc: <stable@vger.kernel.org>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/hda/hdac_controller.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
index 011b17c..0e26e96 100644
--- a/sound/hda/hdac_controller.c
+++ b/sound/hda/hdac_controller.c
@@ -538,7 +538,8 @@ bool snd_hdac_bus_init_chip(struct hdac_bus *bus, bool full_reset)
 	 *   { ((num_channels * bits_per_sample * rate/48000) /
 	 *	number of SDOs) >= 8 }
 	 */
-	bus->sdo_limit = 8;
+	if (!bus->sdo_limit)
+		bus->sdo_limit = 8;
 
 	return true;
 }
-- 
2.7.4

