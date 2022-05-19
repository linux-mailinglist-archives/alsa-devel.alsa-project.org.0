Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6024452C9AD
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 04:14:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01A2FAEA;
	Thu, 19 May 2022 04:14:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01A2FAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652926497;
	bh=phmyvsTZoWdKV7uRW6vVNJ5PQLT+aOAqlOk0o1bKFJw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q37LC3q3RoudiTN8Xt2eyQFhq7eGcnuguC7kYJ7stX8cb9UDvmzBZYr2La5yYVjn8
	 TTMTFcTVOz6qqK+e3qgE6hsD9e0xIn3pCPjZJW0eBuI4jgEaSmHJv1/r8fBlTtNBe9
	 xB7mc427qRdtCKusxsBRVYNoSC2XS1mbv8wHrqHg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 968CAF8025D;
	Thu, 19 May 2022 04:13:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECCC8F80269; Thu, 19 May 2022 04:13:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72A36F800D1
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 04:13:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72A36F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oSrhapKL"
Received: by mail-pj1-x102d.google.com with SMTP id
 v5-20020a17090a7c0500b001df84fa82f8so3843722pjf.5
 for <alsa-devel@alsa-project.org>; Wed, 18 May 2022 19:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=iR1vyDMBro9x6LnGfqGQlvzCYtDWr1sZHPHxpHQE8Rs=;
 b=oSrhapKLlz7CT4Nz8DBVB2RpdyAiWXZ9b39FRnhHiwBYkY2Egmam3PdnUeYea7RMUi
 4LpZt0zpH+l1AKsBkh+u1Pxtyec/JEDEPry7vYMGoNtev/Iw1j0zvZBDD0gmmTjpAfxn
 1MmTWHfRN14FBo4QUg4BR41+HrqDnSfTxHdkEfPL4xuUjdxLgYEc9IwrpUGcV9qcEzxr
 nT8ENp30Z57KwJdzaaRRMoA7oTMFNCH1qIGAyl8Wqn9MDyHGq142lX/P+PxegFMhfiD7
 0YtjTmB+Ud+8erDfxkaiLPXKzo6LAzBsqfDPIX/cHDjvLSE6qIyI58h4YIj3Lgh0gj8j
 ITyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=iR1vyDMBro9x6LnGfqGQlvzCYtDWr1sZHPHxpHQE8Rs=;
 b=NO4g6/JO8li4GkcKjSkj7GLQCyTvF1+62/bfnnEHkRrdDoeCijwPpiX/DsB174syPX
 TxH2WeBtCQfR0Zl+ZbDoVayFgwAM/RUJs0ipKMkFkucc8fK5kcynBdt+IN0dFbmwI/Jx
 TG2ObbfJXKH8Vs8D09jw5hYYNeFvMkzhuKonL+fD5yFobp1soVi8XvQyXg++HMIIPdbH
 t9ZPd7LRnjvwAM19sTOSdbXJ7la1d/LfExh/6BpBoW7Po+IzeWTUUOGLzbPV9adPyiKV
 cdHRy8Cw0NoiCI7Jp+cl0f6VEnq6XsUek6bLzSKb5ZKMEBCiwIAPbITbteJnagORUfKe
 Hzfg==
X-Gm-Message-State: AOAM531wltv812LcE8KAd+Ad0vIvwifM3fjtbF9sXkgfT1i5z3XVw0HQ
 ol56lHYYLcYJLaLkxSnlIOI=
X-Google-Smtp-Source: ABdhPJxQMraZkaMnNRxglh/xUJ7JPSQMu6PA95nusyOA4sVUz+UJRi/+eh4oZ+526V/Wh2wce02DNw==
X-Received: by 2002:a17:902:7296:b0:151:62b1:e2b0 with SMTP id
 d22-20020a170902729600b0015162b1e2b0mr2575134pll.165.1652926427058; 
 Wed, 18 May 2022 19:13:47 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:568:8697:c74:ab15:730:f5f3])
 by smtp.gmail.com with ESMTPSA id
 je4-20020a170903264400b0015ebb3bf277sm2366603plb.238.2022.05.18.19.13.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 May 2022 19:13:46 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH 0/2] ASoC: rt9120: Fix 3byte read logic and optimize 'PWDN'
 control
Date: Thu, 19 May 2022 10:13:36 +0800
Message-Id: <1652926418-8519-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org,
 ritchie_hsieh@richtek.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 ChiYuan Huang <cy_huang@richtek.com>, allen_lin@richtek.com
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

From: ChiYuan Huang <cy_huang@richtek.com>

Hi,

This patch series try to fix two things.
- 3byte read logic bug
- Use regcache and pm_runtime to optimize 'PWDN' control

ChiYuan Huang (2):
  ASoC: rt9120: Fix 3byte read, valule offset typo
  ASoC: rt9120: Use pm_runtime and regcache to optimize 'pwdnn' logic

 sound/soc/codecs/rt9120.c | 113 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 106 insertions(+), 7 deletions(-)

-- 
2.7.4

