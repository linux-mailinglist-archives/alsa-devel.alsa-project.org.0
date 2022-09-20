Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A81885BDD96
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 08:47:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3976314E;
	Tue, 20 Sep 2022 08:46:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3976314E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663656440;
	bh=TpB47aUCzqiCyPjpS1wYT0J8wa/4cGV3EF0VnmhwBPI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ntZVe+hkcTebab2vl6uTxDhLqLWMBQrEb8v2qOus/8BfmcZM3W3ip3yI8hZkUjr1g
	 mdGXni2iAxYKP4eVcYE/iItp+7FnrF/oZSikFmRTpjo3JQ888D/w4KPmSCCRCyvE/d
	 nOHeqFWnM+urwuiRuB8NK4ZY97G7qWyLm/ntCvOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99D7FF800F2;
	Tue, 20 Sep 2022 08:46:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69378F80155; Tue, 20 Sep 2022 08:46:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 149FEF800F2
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 08:46:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 149FEF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="D7QDCFzb"
Received: by mail-pj1-x1036.google.com with SMTP id ge9so2037976pjb.1
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 23:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=NwDmfKE5iNHscSlvrWqERxCyMK8HOjlUkCCMjtuH/fY=;
 b=D7QDCFzbh+lreP/zatxT+fSjUWhVTWbIOl1ZvaPj5TvctZTcZLvKGdJKE9tYfwv7O5
 X/EeYFFzMavjzbiRmgLAZDFgcM+Rx3P2kHFDenxt35e7LJ8qT0Mo0g2SL/0n5p/bV8Nr
 2Sx8cmG00Fr8ExBRPcU7xH+1f/PLndikfFUi+z42+oafEmCYK1T4D4gGs+IyYOP148q+
 ps9V2woPavD0dJga8mlOcqjht+ds0kQMmUbnNA9HKJJooYUaypM1j8CbvbqWFmwfK1+z
 7ytAEiPHR8x/4g6VWcPWYPun7i3oBCpq+AKRn8FTNMPAIZEH+bZndq3REg3pTy4fapcd
 wjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=NwDmfKE5iNHscSlvrWqERxCyMK8HOjlUkCCMjtuH/fY=;
 b=dFKi2fwqIx0Tac3dA/oJ3hxsmOTROa6p89oDJ4cNx3RTRRap5NdMWZ/aKaRovP5A74
 5lHJfMBSGEd/3wfAFe68KVCs0cu8xbXqnMjVj69hDuzyrXRfSjhxqgk++ab4a9wspJsX
 4jVSmPwuwUQ3NsdRoQbzoQTMvzZQQgJOkqq+JRscoUmaB6dxwSTInpQjldxQH4ufc+ki
 Gf4vlZzZTSUqoBvJ+K8P7bmZumcpkzOzrMa3SOKSZ8G8pDBDS2w86u4sr60l5IpYTLCs
 hiiGxO3gpi9QUuZU/vdsWftd6P4lGMbGSpuA6lUqfVvZlbA7HhnYyQpxUDrJ41dcG9IF
 eSDQ==
X-Gm-Message-State: ACrzQf3IeGTKjoHnR9HKJhpxJAVgD467Llg/Op5Vl6nw41+YA8ZOBK2d
 M3tF3uF+inAd7L8usKWymATGm+l67iY=
X-Google-Smtp-Source: AMsMyM6UWf5IEM8Hs2pSoqZVB3IHIpTqtrOgOaGGe/Dr2xi+fKjh+FABf9k3jO6qxaQzPBoLy5zbGQ==
X-Received: by 2002:a17:902:ef93:b0:178:93cf:d267 with SMTP id
 iz19-20020a170902ef9300b0017893cfd267mr3382135plb.123.1663656371390; 
 Mon, 19 Sep 2022 23:46:11 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a655ac2000000b0043a09d5c32bsm636240pgt.74.2022.09.19.23.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 23:46:10 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: tiwai@suse.com
Subject: [PATCH linux-next] ALSA: es18xx: Remove the unneeded result variable
Date: Tue, 20 Sep 2022 06:46:05 +0000
Message-Id: <20220920064605.215318-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: ye xingchen <ye.xingchen@zte.com.cn>, alsa-devel@alsa-project.org,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org
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

From: ye xingchen <ye.xingchen@zte.com.cn>

Return the value inb() directly instead of storing it in another redundant
 variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 sound/isa/es18xx.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/isa/es18xx.c b/sound/isa/es18xx.c
index 3fcd168480b6..0a32845b1017 100644
--- a/sound/isa/es18xx.c
+++ b/sound/isa/es18xx.c
@@ -1344,11 +1344,8 @@ ES18XX_SINGLE("GPO1 Switch", 0, ES18XX_PM, 1, 1, ES18XX_FL_PMPORT),
 
 static int snd_es18xx_config_read(struct snd_es18xx *chip, unsigned char reg)
 {
-	int data;
-
 	outb(reg, chip->ctrl_port);
-	data = inb(chip->ctrl_port + 1);
-	return data;
+	return inb(chip->ctrl_port + 1);
 }
 
 static void snd_es18xx_config_write(struct snd_es18xx *chip,
-- 
2.25.1
