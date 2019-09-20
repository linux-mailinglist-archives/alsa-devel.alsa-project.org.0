Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDE3B8EF3
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2019 13:26:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B34E11669;
	Fri, 20 Sep 2019 13:25:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B34E11669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568978769;
	bh=pmmYB0u5FlMglOe2UUMqVN54j/LmXAjyPssv8FPQy4o=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h5jPYjw203DikzzyNdrEQBdwaWWe9M8aBRiq5oLfjUcg5IY43/09pjs11wGHKANSV
	 sC/dfK0vc5BhxKRFD1AEo4ILcPhZ/8aw4ef0omY3LEq6DeMl0GNjLPZ9H6t33NMJhn
	 73420JWBJ4kpxMzhFWyeXXYRvCbUQAX7SCmvUNO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE6A8F805F7;
	Fri, 20 Sep 2019 13:23:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4323EF80506; Fri, 20 Sep 2019 13:23:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-ua1-x949.google.com (mail-ua1-x949.google.com
 [IPv6:2607:f8b0:4864:20::949])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B68FCF800C7
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 13:23:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B68FCF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Z/emBQL1"
Received: by mail-ua1-x949.google.com with SMTP id q34so1318741uad.13
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 04:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=hep84HJPFRulrNlOvjkEVuv4ZKit6N15wB3bwjarbgk=;
 b=Z/emBQL1DqYbcp89S3q7t12kkucc+TJR6Lf/05JnghF/PmEjCjm6ecHsL5yTFcDSkk
 BuZcZESP6hEYAJHAcAW9Yp0e3tPaBerzbVNJk2nlRgXIHArx9Iys8CbyGsPuB5Dt44kO
 coRvhwGfh/dDhPwPmPGe1FQMbd7ajJPPxnsa/4DS9RMLxt94ozQhTiffhJJjr/FVjCFu
 uz07pZ6ZeipethCmcPoLGJwl8B14I949pfK9ETmLU3DSXShuJG3ccwSR9OKSeuo8f2nl
 B5R8oB0yUfwYKuRosjJ2+okFqRTADxxPdFCOW8E1XvO00Wyy7iCv9u0WAG3jSFcuuc9/
 pUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=hep84HJPFRulrNlOvjkEVuv4ZKit6N15wB3bwjarbgk=;
 b=XZH50VX1zXvwot9RtIW5OygTjY9bKa3Pa2dmqz/E8ULDMEyUzEcZ7Mfcqe+r6zTpUk
 lJSXW/nTNd+IaT+jO2IfohbYeG3KRYsW/2huYDE3/y7jCXVhE0+c3aKquMJVH4LJLpPC
 gZM0cyXu1QLU9mP6wMUB+ZJre4bvNXV0i2fPkZhkPzOG+GufDGLScQSu8xoVi3DWpf73
 /UNIaEDe+zfxcKUhTBPJtEQ96KpCiH8gREmrYQ8lq55AqfewxXyiRsdXnxNLnRhRbR1I
 0v7+rN6bTvaseSYbghwp1H9R2WI/6uMXtF9fbglNGL3Q/GVWFDhYwul2tATefcPTQnxz
 XTNA==
X-Gm-Message-State: APjAAAUOTUIEqTmax4tjUtNp49O8iO+ubLRElFku1fjgC9Lt4AglhnBv
 0FWqhfHrXyV0bTRHPLu743QeqQ98Cjs6
X-Google-Smtp-Source: APXvYqzASBzoQOQzUuQD2pzeJ0aIjJs/JADydCufHOaFm1ObLphSnJcLphvmcVNa2p092vV8ySNsPfFUGDOT
X-Received: by 2002:a1f:ec5:: with SMTP id 188mr7841727vko.90.1568978612490;
 Fri, 20 Sep 2019 04:23:32 -0700 (PDT)
Date: Fri, 20 Sep 2019 19:23:20 +0800
Message-Id: <20190920112320.166052-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, tzungbi@google.com, robh+dt@kernel.org, dgreid@google.com
Subject: [alsa-devel] [PATCH] ASoC: dt-bindings: mt8183: add missing update
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Headset codec is optional.  Add missing update to DT binding document.

Fixes: a962a809e5e4 ("ASoC: mediatek: mt8183: make headset codec optional")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../bindings/sound/mt8183-mt6358-ts3a227-max98357.txt         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
index d6d5207fa996..17ff3892f439 100644
--- a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
+++ b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
@@ -2,9 +2,11 @@ MT8183 with MT6358, TS3A227 and MAX98357 CODECS
 
 Required properties:
 - compatible : "mediatek,mt8183_mt6358_ts3a227_max98357"
-- mediatek,headset-codec: the phandles of ts3a227 codecs
 - mediatek,platform: the phandle of MT8183 ASoC platform
 
+Optional properties:
+- mediatek,headset-codec: the phandles of ts3a227 codecs
+
 Example:
 
 	sound {
-- 
2.23.0.351.gc4317032e6-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
