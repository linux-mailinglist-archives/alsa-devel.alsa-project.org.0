Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B232CA3D7
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 14:29:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0180617A2;
	Tue,  1 Dec 2020 14:28:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0180617A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606829387;
	bh=05IqQkYYtx7yVBkhV1sKnCol6I3wx97VPaj9k9sz9HQ=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BcBhunE8GohMdN46PUsRuEq05i1H1svuaeZAPfmvQEca2pR0QpFQnBH4I0DL3mK63
	 HDfsQgC5yMeZkZ2hFMIrQatW0B6Yfq1uV5yIgHPClxDDqFsqEk5vH+EGVFSgJbfx13
	 49KKCLDOuL/Nc2J+jJaX6mBH3nY/kufNyy/cZdKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E9EEF804E4;
	Tue,  1 Dec 2020 14:26:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64C40F804E4; Tue,  1 Dec 2020 14:26:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5501F804E1
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 14:26:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5501F804E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="gawY4KvQ"
Received: by mail-yb1-xb4a.google.com with SMTP id z83so2392258ybz.2
 for <alsa-devel@alsa-project.org>; Tue, 01 Dec 2020 05:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=JYH8VKIBKyMDH0Ua+cEyxJiCIfU2UCkNUgqzQ0+FSHQ=;
 b=gawY4KvQYxLnXVich4sbLw4qZ9XnWAQ4QG9MRpYRMH0NA364UkmMfMAXOyqTnz4HMB
 MRRtqt6Ca9aEuvg70c59TRXpiUL4Egt60CUyC6VrhSI07ZTSQ2eVNxUg2MxQkNITa2vf
 BvvVQ03fRcdoHp9v9Zk9zsTF9Teg1Ag1ysXQykRkrASYX6l+dHutNRUR5rS3wm2Ekgy0
 BVLtI0YI1+tIT2kcj72wExA4Hr28x5EIk8K1TQyWPPKxCq9C7jZcl351gk0jQ6HZqwS+
 jZSHcm76s7ONapIcKwWzAsiQcNKmKYhLufxermjPGeFuu8w1fH9+vFIb/vQYnU+laqQy
 HMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=JYH8VKIBKyMDH0Ua+cEyxJiCIfU2UCkNUgqzQ0+FSHQ=;
 b=HvNlDNEK5xzsSEn7Mo/cglQmDVwZZ8yYAz4cA/HZYoLnlgpKCjAjkdV4LX1G19xmU3
 JEK/S1uTAC9wZdw+Pt3BjLXRmB8f+BnjIf9MmJ+tBkk+Duz/KNeDdWrkeIEw6nQMyPb2
 YcMccEuIcW3t29ZenjUdWeRsQSJDyGT4MUJnk10mjDqtkvgZWeDRHHVZVSy35YvSqlbk
 r8RtyeuPRYCAH4kgVbPyOAPWSWzXWacXt1Mip68xMR4RRr+1YYDlJquixCQ/cxzL163E
 15k3x13e6+LiyvivX5x6Sz5o+Xjysbxz0EClHj9AUCEF2tDftQoAy9cJqt3/4drLTpm5
 jeMA==
X-Gm-Message-State: AOAM532JGFo9EGyiIWFe/ssKQsqt4EvrG3qXi2MrRvssakmvGUsLvRvJ
 O2LI7l7rk2MiiCeVFuRhACGWoqdiqCNn
X-Google-Smtp-Source: ABdhPJz2mgI11dnyDE96PGO73oIHHV1Zfer/vm0OidGuO2eh2yboOBrF6DVQOJRJR//vJyspsAv1lfxx3jbs
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a25:5ce:: with SMTP id
 197mr3913927ybf.53.1606829206732; 
 Tue, 01 Dec 2020 05:26:46 -0800 (PST)
Date: Tue,  1 Dec 2020 21:26:13 +0800
In-Reply-To: <20201201132614.1691352-1-tzungbi@google.com>
Message-Id: <20201201132614.1691352-6-tzungbi@google.com>
Mime-Version: 1.0
References: <20201201132614.1691352-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [RESEND PATCH 5/6] ASoC: dt-bindings: mt8192-mt6359: add new
 compatible for using rt1015p
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

Adds new compatible string "mt8192_mt6359_rt1015p_rt5682" for machines
with rt1015p and rt5682.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml           | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
index b336a42bbb16..bf8c8ba25009 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
@@ -15,7 +15,9 @@ description:
 
 properties:
   compatible:
-      const: mediatek,mt8192_mt6359_rt1015_rt5682
+    enum:
+      - mediatek,mt8192_mt6359_rt1015_rt5682
+      - mediatek,mt8192_mt6359_rt1015p_rt5682
 
   mediatek,platform:
     $ref: "/schemas/types.yaml#/definitions/phandle"
-- 
2.29.2.454.gaff20da3a2-goog

