Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E13D8C4F
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2019 11:15:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2280950;
	Wed, 16 Oct 2019 11:14:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2280950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571217312;
	bh=I/MWfBWgsVdIAu7+WjZd15kIYrAm9xV1USpVjVzbyTU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P9jXLDtftNjgGnbuBwzuInvh0+pRQg6lYvW8WU+nLZvDreecVTyk5+Fpvw1zQbyr3
	 hDpG+Ap4ncxiSzzaisAhnfAU36i0LBwKLGSPWOKDcrwYxBaFFPpn+ySUG2eRaHtaf+
	 TBQQAYEoAbLV6jgNVhIG9nRb/caQ/cLKZYT8GTmw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85B41F80362;
	Wed, 16 Oct 2019 11:13:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E53D1F80362; Wed, 16 Oct 2019 11:13:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 461BFF80276
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 11:13:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 461BFF80276
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=skidata.com header.i=@skidata.com
 header.b="MFzNP5io"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
 t=1571217202; x=1602753202;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kKIuy6KHImHHQv8CRduIvGuN6BHhgWA18/nOgMiEItI=;
 b=MFzNP5io9I/wqeMeaRMEaaFwJwHbk3VmtGF0RNIeDQmQmSKZ026Dz5qG
 57mQnhDEs2B0kf3CXqdBBew3LNSP44XZJYNUdZDODfdvaAFXtrYM5Bc/O
 QD2XEnxE9jTdr4xbXCcVRlAPxH9rUXSou8IRPsl7nbTjaMy5wbNEmdZ3n
 tPMN8aFQb6Vt7wKsmFAhBAErK5PWqZIojq4M9V9CF4fmzJGWaabWzMj4b
 gqQEFi8a9MKKAsG5AW+Ve9moMoohENnVL65v6DQ7u8djRU5e98wCoDUc/
 SozVO3HyFD1u028EU+/8gagYVhogiaykjM4at29TA+fGiO5qcPtA/bbTZ Q==;
IronPort-SDR: qNGUlV/AfLiwMs+w8r2vA/UExC2ZaWjO5V1PGrkkN2PW4suNle81PyESJSG1SHJoEx1+Cccpmq
 rb+mimXGlno5cekbWkx+/zEepLdrMNkoVJAARODs5e5rB9QZV5g/cCT/2VOq7lF8OKfE1KvGwn
 b8TLl7EIsFA9yvU6BteH1gx99B8yElHm1LK2vmz0wbmCkG9eMWbXdjYsJTN7Mwzg7vhMHUl3xi
 ra/UI6lVoyvtiDB6DtLVLVimLTfeNRgzJobvrhLnunlSsBYBfTTQzK0LCwm6QG+aNpwCPG618L
 o+E=
X-IronPort-AV: E=Sophos;i="5.67,303,1566856800"; d="scan'208";a="20289456"
From: Richard Leitner <richard.leitner@skidata.com>
To: <stable@vger.kernel.org>
Date: Wed, 16 Oct 2019 11:13:04 +0200
Message-ID: <20191016091304.15870-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
 sdex5srv.skidata.net (192.168.111.83)
Cc: alsa-devel@alsa-project.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Igor Opaniuk <igor.opaniuk@toradex.com>, broonie@kernel.org,
 festevam@gmail.com, Richard Leitner <richard.leitner@skidata.com>
Subject: [alsa-devel] [PATCH v5.3] ASoC: sgtl5000: add ADC mute control
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

From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>

Upstream commit 631bc8f0134a ("ASoC: sgtl5000: Fix of unmute outputs on
probe"), which is e9f621efaebd in v5.3 replaced snd_soc_component_write
with snd_soc_component_update_bits and therefore no longer cleared the
MUTE_ADC flag. This caused the ADC to stay muted and recording doesn't
work any longer. This patch fixes this problem by adding a Switch control
for MUTE_ADC.

commit 694b14554d75 ("ASoC: sgtl5000: add ADC mute control") upstream

This control mute/unmute the ADC input of SGTL5000
using its CHIP_ANA_CTRL register.

Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Reviewed-by: Igor Opaniuk <igor.opaniuk@toradex.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Link: https://lore.kernel.org/r/20190719100524.23300-5-oleksandr.suvorov@toradex.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Fixes: e9f621efaebd ("ASoC: sgtl5000: Fix of unmute outputs on probe")
---
 sound/soc/codecs/sgtl5000.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index 3f28e7862b5b..b65232521ea8 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -720,6 +720,7 @@ static const struct snd_kcontrol_new sgtl5000_snd_controls[] = {
 			SGTL5000_CHIP_ANA_ADC_CTRL,
 			8, 1, 0, capture_6db_attenuate),
 	SOC_SINGLE("Capture ZC Switch", SGTL5000_CHIP_ANA_CTRL, 1, 1, 0),
+	SOC_SINGLE("Capture Switch", SGTL5000_CHIP_ANA_CTRL, 0, 1, 1),
 
 	SOC_DOUBLE_TLV("Headphone Playback Volume",
 			SGTL5000_CHIP_ANA_HP_CTRL,
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
