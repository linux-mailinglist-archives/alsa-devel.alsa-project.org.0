Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 212266350C1
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 07:59:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1BC31679;
	Wed, 23 Nov 2022 07:58:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1BC31679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669186761;
	bh=r/ZWaOzkICaOWA29IUcPYBvrYh6zYjqjR1AyqjfZyVo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qSRZEF+t543zkyz+/nxdvqbxo9tN1lP6xKKzaOCDHqDSCd600pprPIXOtMLWZE/Ad
	 F2W0S9+drRTeJdsxw5XDN6IAbtc+4BvVFCG5MVH0Jrsn2slLBSW8ylj3tYTZspJJg5
	 LnuVPFsezfDIZsN79ffiCrwxErN0itaRuifYR+Rk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71D17F80149;
	Wed, 23 Nov 2022 07:58:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5F0EF80249; Wed, 23 Nov 2022 07:58:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from forward107p.mail.yandex.net (forward107p.mail.yandex.net
 [77.88.28.115])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25710F8025D
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 07:58:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25710F8025D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ya.ru header.i=@ya.ru header.b="r1jDHg13"
Received: from iva7-38cb93e4c9b7.qloud-c.yandex.net
 (iva7-38cb93e4c9b7.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f93:0:640:38cb:93e4])
 by forward107p.mail.yandex.net (Yandex) with ESMTP id F2F035571B4A;
 Wed, 23 Nov 2022 09:58:20 +0300 (MSK)
Received: by iva7-38cb93e4c9b7.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id KwgoYe0Wc0U1-TuFqgunw; Wed, 23 Nov 2022 09:58:20 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail;
 t=1669186700; bh=jh3z3hjczYMaRA8RaOr60ciXZMX2vwU6+ry0WMXajcA=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=r1jDHg13ixu6+0PZtAdLLqD2JsvRg7n2bfFeV1OZgb//j+X9Z33jGbd7NJcP4tICM
 ZbczO9+UQ+gtXNdV80kFIcjhHfw5GDHBFkVSImcFF4BgWlknsbgNF4klUGJj7ZlB5L
 76Bj/8e19PHj/I3I/3ViYhaapkmFa+g9ej/weHK8=
Authentication-Results: iva7-38cb93e4c9b7.qloud-c.yandex.net;
 dkim=pass header.i=@ya.ru
From: Artem Lukyanov <dukzcry@ya.ru>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: amd: yc: Add Xiaomi Redmi Book Pro 14 2022 into DMI
 table
Date: Wed, 23 Nov 2022 09:58:20 +0300
Message-Id: <20221123065820.55159-1-dukzcry@ya.ru>
X-Mailer: git-send-email 2.36.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

This model requires an additional detection quirk to enable the
internal microphone - BIOS doesn't seem to support AcpDmicConnected
(nothing in acpidump output).

Signed-off-by: Artem Lukyanov <dukzcry@ya.ru>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index d9715bea9..1f0b5527c 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -213,6 +213,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TIMI"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Redmi Book Pro 14 2022"),
+		}
+	},
 	{}
 };
 
-- 
2.36.2

