Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7DC9077B8
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:02:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05E1715FA;
	Thu, 13 Jun 2024 18:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05E1715FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718294578;
	bh=ecpgpdxBFhv5hbq7XyFUS2efQdjYBNzzM28BA9baArg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rT+Z/bHANUbbJpZ2uEvt2EV+j02CFymoHZw3ayFvY8F63Jac5ANWJLrOHv8cdG3X3
	 Tck5/Hb5PlEhbBdRqmkX0f3kvW9gY43XjOnKQQUYGxwcaw/ruL2MpxBOAaHlGN6CKB
	 ni7Vw/KQey2NBE21i0+lDL75zCfR7t0i+3I/qEB0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4E49F806BA; Thu, 13 Jun 2024 18:00:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB2D6F806C5;
	Thu, 13 Jun 2024 18:00:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C942F8025A; Sun,  2 Jun 2024 00:55:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9775EF800FA
	for <alsa-devel@alsa-project.org>; Sun,  2 Jun 2024 00:55:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9775EF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256
 header.s=bytemarkmx header.b=jc4cgg1t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=10pbVTdAGHzcOVuExmt1SQ5n+7OnChaUdx77tcWXsVM=; b=jc4cgg1tNUqf8MA8
	jp1rKBA2MQRIB1z/j01oZOifsn0h9x9Khu/pBvVYhkadqQVF85bECQ9XZQkrx8Vn4vBckl2hPTFct
	eUMbIL3AftdP1cLHBGyANPBs8d8IT8oUGI9PwIF5p9RPJf39e29Tw6pE//O1tCComp3c/h51f95X0
	iej2zrD+0o1oSA+AsxBFcaGNC4nSFT23dTn1OTUtwyWvxp2rv7MKc9IrnZvnV6bU1NaS3i0NjZQwg
	UlPdUgJd7myY6bbY9ZCCkneP4i4dIWSYh4d09m29J/VlY7kUbVFC/RJCPMQaUKFkTGUjqd2sWXdTA
	0HqX43zm3DzOzJp1lw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sDXcw-003lZO-2w;
	Sat, 01 Jun 2024 22:55:07 +0000
From: linux@treblig.org
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	srinivas.kandagatla@linaro.org
Cc: alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 3/3] ASoC: codecs: cx2072x: remove unused struct
 'cx2072x_eq_ctrl'
Date: Sat,  1 Jun 2024 23:54:46 +0100
Message-ID: <20240601225446.183505-4-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240601225446.183505-1-linux@treblig.org>
References: <20240601225446.183505-1-linux@treblig.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: linux@treblig.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VTH3A4274C4JN2JNZSAHUHQTGLGDSDS2
X-Message-ID-Hash: VTH3A4274C4JN2JNZSAHUHQTGLGDSDS2
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:00:42 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VTH3A4274C4JN2JNZSAHUHQTGLGDSDS2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: "Dr. David Alan Gilbert" <linux@treblig.org>

'cx2072x_eq_ctrl' has been unused since the original
commit a497a4363706 ("ASoC: Add support for Conexant CX2072X CODEC").

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 sound/soc/codecs/cx2072x.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index e8e22b1a1963..8cfec8dcf839 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -63,11 +63,6 @@ static const DECLARE_TLV_DB_SCALE(adc_tlv, -7400, 100, 0);
 static const DECLARE_TLV_DB_SCALE(dac_tlv, -7400, 100, 0);
 static const DECLARE_TLV_DB_SCALE(boost_tlv, 0, 1200, 0);
 
-struct cx2072x_eq_ctrl {
-	u8 ch;
-	u8 band;
-};
-
 static const DECLARE_TLV_DB_RANGE(hpf_tlv,
 	0, 0, TLV_DB_SCALE_ITEM(120, 0, 0),
 	1, 63, TLV_DB_SCALE_ITEM(30, 30, 0)
-- 
2.45.1

