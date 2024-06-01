Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B70BA9077B6
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:02:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 868F3E68;
	Thu, 13 Jun 2024 18:02:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 868F3E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718294553;
	bh=QNSY4tvFcnrlWXrOTixpAfH09s2dQhFqt9qlP90Pgn0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nGA1GKEydkaT8KR8PJATXMnO49TsXb50dYV5kTtxPXPbcG/yewVoJafd/BMqhDMqi
	 kSTUptRe+3JwC6xjXMOKL1JvvHvPH3chtd3O/AhSXVh1QzsWZTlMgwAOwDDitttW4T
	 ZTLa4mhSXNWVLgEMUQg0pmsn7wFD1fdyfo+/yL6I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B8A0F80694; Thu, 13 Jun 2024 18:00:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48660F80690;
	Thu, 13 Jun 2024 18:00:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE861F8025A; Sun,  2 Jun 2024 00:55:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24A18F80236
	for <alsa-devel@alsa-project.org>; Sun,  2 Jun 2024 00:55:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24A18F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256
 header.s=bytemarkmx header.b=BVJQbnfu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=nRcJIf+1327Ly+8LDkevCngx/XaoRpszZ7qr61eLFfc=; b=BVJQbnfuGe4AuHf6
	DISGYwh+D3iB6Qa86StIXGTcZz9+C6KZ5ByH6m59t9S0hHGldBISDeRItuLzRsJnZ4oUSeR75pfK3
	FQhOGYosMfk6zKa5kg0V/s9+FISubLFU9krYl4M1roZS+DzCnWSM0E4x+qPoNDjavoPZMmxhrPDXu
	jHcru5r6J3A8RU6y7FSh6cfV0l5YU0dwT1mHlxnMkKDpP/NgTYSAL29VJmYedBNoj+/XkcZHfUMcs
	hndVPpO82Kx4PH+Cwpiv1JCEgkdHY7qa3rdgSOSUIgzX0m2VM80I0Nc4WZBJK4r57Fe320RWRQ0wE
	2V92mpyopI+RXvwMmg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sDXcn-003lZO-1h;
	Sat, 01 Jun 2024 22:54:58 +0000
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
Subject: [PATCH 1/3] ASoC: codecs: lpass-rx-macro: remove unused struct
 'rx_macro_reg_mask_val'
Date: Sat,  1 Jun 2024 23:54:44 +0100
Message-ID: <20240601225446.183505-2-linux@treblig.org>
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
Message-ID-Hash: 7UAYKD6W6FI3RA7JMKOJLUQM2APWZUQH
X-Message-ID-Hash: 7UAYKD6W6FI3RA7JMKOJLUQM2APWZUQH
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:00:41 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7UAYKD6W6FI3RA7JMKOJLUQM2APWZUQH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: "Dr. David Alan Gilbert" <linux@treblig.org>

'rx_macro_reg_mask_val' is unused since the original
commit af3d54b99764 ("ASoC: codecs: lpass-rx-macro: add support for
lpass rx macro").

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index f35187d69cac..dfb7e4c69683 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -463,12 +463,6 @@ static const struct comp_coeff_val comp_coeff_table[HPH_MODE_MAX][COMP_MAX_COEFF
 	},
 };
 
-struct rx_macro_reg_mask_val {
-	u16 reg;
-	u8 mask;
-	u8 val;
-};
-
 enum {
 	INTERP_HPHL,
 	INTERP_HPHR,
-- 
2.45.1

