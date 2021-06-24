Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B233B348C
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Jun 2021 19:17:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E0C083A;
	Thu, 24 Jun 2021 19:17:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E0C083A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624555071;
	bh=Hu8JaT9Km6GBXYrpmirJG9u8etu1H3SLUaxK17oMB2U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=brzurCWxRAV5ahFOWyQJAh6Wq25+wh12idVutp4YbZrV5JRQMmj241H2/XoRD8kOG
	 0byPBVIUGM+6ST/KFiq1qs78dEe1ZJqkrSVY26I7tJ+eibXO8omlQOAoAZtO4AMVZz
	 FFxNgHej1Dis7sDfkfIwoVhR57m/ByD4bbdCYUmM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBE9CF8026A;
	Thu, 24 Jun 2021 19:16:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4B5FF80268; Thu, 24 Jun 2021 19:16:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.nihaljere.xyz (nihaljere.xyz [142.11.196.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36A06F800E1
 for <alsa-devel@alsa-project.org>; Thu, 24 Jun 2021 19:16:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36A06F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nihaljere.xyz header.i=@nihaljere.xyz
 header.b="ldnKBOGc"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=20200619; bh=Hu8JaT9Km6G
 BXYrpmirJG9u8etu1H3SLUaxK17oMB2U=; h=date:subject:cc:to:from; 
 d=nihaljere.xyz;
 b=ldnKBOGcEBy679w7MSRWsTR3xMAzC/qZD36MYQihvfCnKd44Dq+
 fUPBLhS8W6LNMVt8BT622KgGImRxqVTLtOjJJ+22/FQ01U3nEEfeNU969JQKdEc+srnwCP
 EPtCbxHVWIXOLZSpQXzUm1c0Slb4d0kKjx0caXrrMsA7i3hF+o=
Received: from localhost (136-49-115-232.googlefiber.net [136.49.115.232])
 by vps.nihaljere.xyz (OpenSMTPD) with ESMTPSA id eb474e66
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 24 Jun 2021 12:16:06 -0500 (CDT)
From: Nihal Jere <nihal@nihaljere.xyz>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 1/2] control: fix typo
Date: Thu, 24 Jun 2021 12:15:59 -0500
Message-Id: <20210624171559.14003-1-nihal@nihaljere.xyz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Nihal Jere <nihal@nihaljere.xyz>
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

Signed-off-by: Nihal Jere <nihal@nihaljere.xyz>
---
 src/control/control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/control/control.c b/src/control/control.c
index 91415b51..3930c7b1 100644
--- a/src/control/control.c
+++ b/src/control/control.c
@@ -390,7 +390,7 @@ int snd_ctl_card_info(snd_ctl_t *ctl, snd_ctl_card_info_t *info)
 /**
  * \brief Get a list of element identifiers
  *
- * Before calling this function, memoru must be allocated using
+ * Before calling this function, memory must be allocated using
  * snd_ctl_elem_list_malloc().
  *
  * This function obtains data from the sound card driver and puts it
-- 
2.32.0

