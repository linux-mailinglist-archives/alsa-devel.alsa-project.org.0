Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 636E32CA3DB
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 14:30:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4E1A17D7;
	Tue,  1 Dec 2020 14:29:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4E1A17D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606829401;
	bh=a45LvJEi5yUW32woI20swc9c1EFIK39Wx3AULm3q9Eg=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tcmYmrD2zbAzLz6kq/WGgVFuEDMh7glR8IBSUYrG2alwWTC+qCNheo85le0JjkRwh
	 ReO0BUKPDyOuJatAOq6/9+G8r7e/X60jAhLVPWPvZ2x6FHosLYI/Q/wiPH77P1yVem
	 czTVfyHgrVgnYmffxwjHOJNRSN8a7iri6+EX9ldA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DEDFF804EC;
	Tue,  1 Dec 2020 14:26:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6268F804E3; Tue,  1 Dec 2020 14:26:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91C17F804E0
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 14:26:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91C17F804E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="sYku0+yI"
Received: by mail-qt1-x84a.google.com with SMTP id t1so933304qtr.19
 for <alsa-devel@alsa-project.org>; Tue, 01 Dec 2020 05:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=YyZbO8wYD/ijX6J9aI2QPdV/RaONINl7Yn5VzMFPwgs=;
 b=sYku0+yIV+TpbWJs23S2nPniHCKLiIqZbltuaDx0QiZwXcTkCn4I3lEwMP64DZcTYE
 vKkE56FOjRuPVAIxPhZhSdsRVYMhWRU6S0AI474h68Tji0/RvTc8IapXx4IhZPlleZ5F
 OH+R9cWBXn/YXPniJubnJX4XQdqHeG/WIk6Os9yx9+0P9gH3sr/WJLJMwr50ZPvGH3x1
 PHhBnpJhoajXVbmY6ma7RYgf/eT/9sS4EhcO8CBKmyGh0qzBjvNmHqstppQK252Rf6gb
 o17zo98nGp/25YnbNyJI9GAnUfPV1Ah/oHH5KD1q6rh0jEkoCLBPedf7UPrz9/3XwMKl
 P6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=YyZbO8wYD/ijX6J9aI2QPdV/RaONINl7Yn5VzMFPwgs=;
 b=hBjAjmLqx/AJCC5bcEWN8YmbxaHf3N81EcLHlg0t1CutPT3V1z3WeVwpFm3yxdz8Wo
 VUnuSX3E/rlam1cMVSvdKBRqC6hCp5li7wvAh8XEMfVvriCGzPhir4W1fLc1/7RzhSvi
 vxBB0330ODq1pmaHVEt4pMOkCZiZj78dDkjC9sXTq76nI+WzKyP4T6EX+dmoN67OptUY
 4m/tCb/E+WQc20wn7MyFH7uQ883bovImTC6O/FO/UT4b85IzQApePOmu8G7volrzFBKm
 amYVzLY58Bkou2ptaJVL1rDd4f/oLeMDpivq+3ti5Edg+DNEVj9fQ3Zld7OfOK45ysg+
 goFg==
X-Gm-Message-State: AOAM530+XMn/P2z+ARyIL9qyuImYojbTlnZqiEQK/IPc2SfTc2CqSijE
 PDUARDy3fUlRb9UGS6zfzdwx8XIFbde/
X-Google-Smtp-Source: ABdhPJzbKgwauq201Rit1w4qEPd73jwpCpDpUdjUQsesLo5XUsbzwVoULzf/ttBPz6/cxR1bTNFkm7IAoABy
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a0c:916d:: with SMTP id
 q100mr2847720qvq.29.1606829203011; Tue, 01 Dec 2020 05:26:43 -0800 (PST)
Date: Tue,  1 Dec 2020 21:26:12 +0800
In-Reply-To: <20201201132614.1691352-1-tzungbi@google.com>
Message-Id: <20201201132614.1691352-5-tzungbi@google.com>
Mime-Version: 1.0
References: <20201201132614.1691352-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [RESEND PATCH 4/6] ASoC: dt-bindings: mt8192-mt6359: fix typo in the
 example
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tzungbi@google.com
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

Both driver "sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c"
and DT binding property use underscore version compatible string.

Fixes the typo in the example.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
index 342232a61cfb..b336a42bbb16 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
@@ -31,7 +31,7 @@ examples:
   - |
 
     sound: mt8192-sound {
-        compatible = "mediatek,mt8192-mt6359-rt1015-rt5682";
+        compatible = "mediatek,mt8192_mt6359_rt1015_rt5682";
         mediatek,platform = <&afe>;
         pinctrl-names = "aud_clk_mosi_off",
                         "aud_clk_mosi_on";
-- 
2.29.2.454.gaff20da3a2-goog

