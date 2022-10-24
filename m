Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B0960F8AE
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 15:12:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 063AA2F6E;
	Thu, 27 Oct 2022 15:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 063AA2F6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666876343;
	bh=FKCfpZ3vKNsKl3535D48sO9oOlR9vGFlgliflUjjq28=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OvHNgvXd98Sp65knDCQB0yyqfqWd/AOqVM7tVeefzjIRzoOrKntMJusL/TCb7y1NZ
	 PvyjWYMNdVs4oncS714o0kKPEawX1WmV0TgGztmVwX9KJ4DQNJGdYwgoeRwl8iIzBj
	 WmmqDveaHymMNOm/XCqyWGf9+qJWkhKkNocBLe2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82DAAF80496;
	Thu, 27 Oct 2022 15:11:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 900CFF80533; Mon, 24 Oct 2022 19:42:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F52CF80240
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 19:42:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F52CF80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jNSWdfu1"
Received: by mail-ed1-x52f.google.com with SMTP id y69so13838380ede.5
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 10:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XVuWbfAQNF7o8tY+FUjntd4BtEqKHgEbwYupJmXfPzQ=;
 b=jNSWdfu1c1zIwJqfwTl2ypRfT5G0cT7KaHsjoZMSo5EX5QsBYFbu3oloYWzPxYuMqS
 alBRLws2jcsc/gf1nPOE64Mn2XKyFkRXVMaFq3WE+FvP77g6Rb+mhwPExUcm7peIB4vW
 ONiRssssRFy8nqxJESJEPy6RzuGsQuxdgq+vXhZGHcdtPDkPxSIdlD5D6vitU1TETMyl
 G3SNO0Ix3YeQP+T4Zz+tVz5v39pfX7tjLMHkw/RmJCXh4vFqRAddxirQfNNyfEOEsbH8
 xxjQoDK8SFI9/dNXvbjn3Bjejf0N7SirIMM6qY4wmYsOLV/397yPaB2mWSNqU+lnB6T9
 12Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XVuWbfAQNF7o8tY+FUjntd4BtEqKHgEbwYupJmXfPzQ=;
 b=vnE9ErKMjA13hGKdKlVwFSyJUP/oFJZ7ZednSGrmoWOU8W3HiNcYdDlTVd55yzOlpy
 xC74PIyjN40d+dNUcELXLWzRKAG0SXfT5Z1A+oaJDzWBcEd9pcCibcHLrtjVsVTq4pxo
 5ZtoYZ8/ZlveiOeXJ9BIVPF9p1Y9oF9VvMvYE0pvU8L5L7agaEHg6Yo319CUzsoGfir0
 Y9ZE74plAu+NDi+8BtoBeCXxovLTrOvmrQ0J5dyvI1SrItLJ4kgPjt+QGkZew/AqSfMv
 EFhQ9RfF+5jrbWhqO00nOpLAQeL/uqw9RSg/MECiuMOuplHc3cFGZXgBQFEd9tzfqKf/
 z2TA==
X-Gm-Message-State: ACrzQf04nBLsqLzP2f70kQbUReW+UXTsHb0kzZbvjwdmSm2SrdZMm+p+
 XZRSBtIAdA6kQNdbRpYrHOzqmLq6rzSC5wpz
X-Google-Smtp-Source: AMsMyM7LPndgC61ilqd4BgQfiaWkB0clqS6ENrbal3vIDrdwMTiaaYaVYxzrTfo1Ziq4jnC2G69I3w==
X-Received: by 2002:a05:6402:2794:b0:461:d60c:30c7 with SMTP id
 b20-20020a056402279400b00461d60c30c7mr4316218ede.392.1666633360755; 
 Mon, 24 Oct 2022 10:42:40 -0700 (PDT)
Received: from aw-m17.localdomain
 (cpc91250-cmbg18-2-0-cust153.5-4.cable.virginm.net. [82.8.243.154])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a17090640c700b0073d7bef38e3sm191219ejk.45.2022.10.24.10.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 10:42:40 -0700 (PDT)
From: Brent Mendelsohn <mendiebm@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: amd: yc: Add Alienware m17 R5 AMD into DMI table
Date: Mon, 24 Oct 2022 18:42:27 +0100
Message-Id: <20221024174227.4160-1-mendiebm@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 27 Oct 2022 15:11:26 +0200
Cc: Brent Mendelsohn <mendiebm@gmail.com>, broonie@kernel.org,
 mario.limonciello@amd.com, Syed.SabaKareem@amd.com
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

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216590
Signed-off-by: Brent Mendelsohn <mendiebm@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 2cb50d5cf1a9..a868a890f00c 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -185,6 +185,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "UM5302TA"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
+		}
+	},
 	{}
 };
 
-- 
2.37.3

