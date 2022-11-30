Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B5963D122
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Nov 2022 09:53:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6C7816C0;
	Wed, 30 Nov 2022 09:53:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6C7816C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669798432;
	bh=ZD05dzViZ2VqYhGHNxe/ZWN/ep90TQYNVCEphYqGbJg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JrI7kBMQBrBd0H3Qlm4OF3qLPoYb+54xU3ajrk9gIMoyU4PM+rhSJX9nttgCSt05S
	 hfzEZC8TKyqKJx4SI6HKPRIQ5Q8k0MR9HuZuTFWb10HTvfUsA/uU1XahQS4jZKR5nc
	 p1wtQ118j8BzK/5F+4IkWnlp5joUZxjd/1/33z20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2920EF803DD;
	Wed, 30 Nov 2022 09:52:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E37DF8023A; Wed, 30 Nov 2022 09:52:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from forward107o.mail.yandex.net (forward107o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::205])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BF7BF800B6
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 09:52:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BF7BF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ya.ru header.i=@ya.ru header.b="Gn9NKWz9"
Received: from iva6-2d18925256a6.qloud-c.yandex.net
 (iva6-2d18925256a6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:7594:0:640:2d18:9252])
 by forward107o.mail.yandex.net (Yandex) with ESMTP id D51B86AFDA53;
 Wed, 30 Nov 2022 11:52:47 +0300 (MSK)
Received: by iva6-2d18925256a6.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id lqMj3XNYOOs1-6dFSEKm8; Wed, 30 Nov 2022 11:52:47 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail;
 t=1669798367; bh=bZCTLXtQFo+GaP8dZv+seLgjwFmrfIcVegfPYvQtsqk=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=Gn9NKWz90ml+E9uvSL9IU2xYcXIuYxqiiwI5l5hTn5GjmIyMG8PVJMenUN/Fcy3cc
 vOW3oAi7/IcprqRlALyH0QxqIwuFW++H+JWn0v9MY1gTMKPmXPOjMrC4ruOpTO6Nnf
 09EgCmU5wREsU5I1fQmWlUTKRZXy7jVf1l0g5CHQ=
Authentication-Results: iva6-2d18925256a6.qloud-c.yandex.net;
 dkim=pass header.i=@ya.ru
From: Artem Lukyanov <dukzcry@ya.ru>
To: alsa-devel@alsa-project.org
Subject: [RESEND PATCH -next] ASoC: amd: yc: Add Xiaomi Redmi Book Pro 14 2022
 into DMI table
Date: Wed, 30 Nov 2022 11:52:47 +0300
Message-Id: <20221130085247.85126-1-dukzcry@ya.ru>
X-Mailer: git-send-email 2.36.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: broonie@kernel.org
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
index d9715bea965e..1f0b5527c594 100644
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

