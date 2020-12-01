Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5242CA3BA
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 14:25:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E20217C4;
	Tue,  1 Dec 2020 14:24:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E20217C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606829107;
	bh=05IqQkYYtx7yVBkhV1sKnCol6I3wx97VPaj9k9sz9HQ=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GMauMy5ytD92x+5482Rsn2RPHS4ss4Ybw7eI8BUDWQN4ciJ3V0cqQoj+sQJkTDOCT
	 ZP6GOcYZ8ulpnNUDl2RqLMsaNbwDxUpuG5HfAuYTMZqkN1iINmVH6Wo5E5I3dmbo1s
	 j7nK4IDoB4zOyHZ8FWnTgGMag6xzg3sKZ/oTRDB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20A56F804E7;
	Tue,  1 Dec 2020 14:22:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4D99F804E0; Tue,  1 Dec 2020 14:22:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7093F804CA
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 14:21:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7093F804CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="bCh1RcV3"
Received: by mail-yb1-xb4a.google.com with SMTP id w8so2375632ybq.4
 for <alsa-devel@alsa-project.org>; Tue, 01 Dec 2020 05:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=JYH8VKIBKyMDH0Ua+cEyxJiCIfU2UCkNUgqzQ0+FSHQ=;
 b=bCh1RcV3lkdSB+ESsNi2IjgeDqgqSwlR5wBpVzHp+VsAVK0SCPKuB8xPvGe8iEfohB
 P/A9kfWqY/4O7UuVuj/1TZ/C4fNdHQL8HFH2WvBLD7NR8/+39m2hegnuDthtmLyFXMuw
 dTJYeyud2vhV1QTgS98OSZwDqAZUMUvpTbCHsaJgEVn3eJznfA5yJRVvj9QoaujSmsbX
 jERSeMIPZt7AivGDIBum0sZ73+LmUyyLye4Kcgjgb1579zAabx+AAm8eJrj82B8TEm9Y
 bL7u7NLg2irgh2v7tzOc26yGy2a+/xv5IMYqYox/bvNOgrsC/J+U6HdouTrK/hXWi1n2
 4gZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=JYH8VKIBKyMDH0Ua+cEyxJiCIfU2UCkNUgqzQ0+FSHQ=;
 b=AWWRsavXvhTlDhORhQvLZ29eNlX93/QCtjEpuSvquDJQDxjOQ89cBLTkaYuzvBSifO
 hppRin5iT5Mh3frUlY1KeNyXn50Ihbi0t105ESgyIEujiUt9azUXq9vAElWeJtU0n3GD
 cIq812B14njIcPw9nzPwGI6jQmg4Fjl/MJUGhgKISPHYUhD9TpBeqEXj1n/45wUmqNrb
 0GWHbiikZX9I72lFCZ6SxFsQtXATAfMUv6ShUWdNT/i+qWzgr6eWf0MGG7Y21UpRejyA
 U8u569pYdAoIHyeYuJtI0IPBiBJOjycnFKHbazy7tEHfT+tRFb6uewD3fwCmWm2XIEhB
 fa+g==
X-Gm-Message-State: AOAM530BNzcaI9pohi7CSbZ5t7SMQEhrQrcSOBj8+C5dputDgI3Y2leU
 xqluLHX07z2jbQuLvckRtbgAiepNKBQE
X-Google-Smtp-Source: ABdhPJzHFhzDxNs1EtHKiNCBDwNBT3/Igi8dCG5KZOj6ziQ/PXkFbKcM79RhH4DrGPZWaQVgKUT/qgmTFdyr
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a25:5689:: with SMTP id
 k131mr4997526ybb.257.1606828915829; Tue, 01 Dec 2020 05:21:55 -0800 (PST)
Date: Tue,  1 Dec 2020 21:21:25 +0800
In-Reply-To: <20201201132126.1676005-1-tzungbi@google.com>
Message-Id: <20201201132126.1676005-6-tzungbi@google.com>
Mime-Version: 1.0
References: <20201201132126.1676005-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH 5/6] ASoC: dt-bindings: mt8192-mt6359: add new compatible for
 using rt1015p
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
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

