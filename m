Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC323164093
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 10:41:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37A0C16AC;
	Wed, 19 Feb 2020 10:40:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37A0C16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582105279;
	bh=OBZQzOG2R4XS20d7rA2EYccUz/uvYDmXFAWAKLRX6dY=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YMFClt3DJjyul76eRcWx5EISlEGsgIfAeN4uMdwItM00K/7mkM1nLgU4gFBVrmme8
	 cf5wAQERQFszxOLdC6nooVUH5213znshN/7J3x6d2KXa2OSLK2TGUAxzVWIPncZPoY
	 ZolLDSWIvbFAkguiF1VPhcJe5j7dsR92acxv+Q5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83698F80233;
	Wed, 19 Feb 2020 10:38:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 941D6F80233; Wed, 19 Feb 2020 10:38:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCCDDF801F4
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 10:38:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCCDDF801F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="G3FDYkqz"
Received: by mail-yb1-xb49.google.com with SMTP id 10so19681461ybj.16
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 01:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=PfxnM1OPCFMeeyxBGFe7FfHyay3SkeXUIwQbujCAFcs=;
 b=G3FDYkqz9PnILDVaOFoBqH4ELlxC6rsdB6UNLRA6+9tvXb2j4/j6eteYvTvV8lEyb1
 MBJBQSonmAhOv4yOoUJlSSLJc+mpj42ptDZ/p8iLZjoPTJ01xD1e/5UmAo0DPx9LqW5t
 vM4LuTf4deKaDvI6dg73qP7nuskQghmQqQm/iH2GcsG/APK5WfuJWTbDAIe9y3An2gES
 +adrNB3I1ZoIJpKSFVDHxpdDH91/ujWWeLRDy9/Byjz2VNH81tt+rgZtkQMNfcBDT+en
 FcyBHwKhuHaDvDZJnCcQbCfbVos/79LYHS8g8ewUsLeqQfXij8rVD0xxdP+TIh3AZI52
 vd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=PfxnM1OPCFMeeyxBGFe7FfHyay3SkeXUIwQbujCAFcs=;
 b=gY4OwiPIyaHnYkWy2z5qAot1X1A7uvRdXJ/03gHQWJSvZCZPJGlw+jB26mAVnIHkd2
 4M2ePHQWErYzEOez2DAlaTWJOdhvlwfXi/z5t82QWELO5vYePCEMFn+Ya48Bjr3cef89
 km24btYYGf0dPGZJN9Qc2vGDjM6D0tSyU2VcztBYtTTilwkKyjKaSGRgNjVAmeqAIJfx
 HJjlxnWPsIzsIt/b8cDNkjmwvowDnF0zt0ygfj5WjOP3uO5fygs9zkEQYquPp0S01NAv
 JVRF+FgOzEopaUiEHl5w8dIGLRc/x4VRFO3+SoVecNdCUSo0FlqaMdaJCTPzOKsygMV5
 BdoA==
X-Gm-Message-State: APjAAAXFSESgBSXW+OMGJ3kEUtBkflnGU5iDzBNXxQB1L9H0CsQjedb8
 W13YN8bsi1S1E2xcfqeV0ZhdjHcM5J4P
X-Google-Smtp-Source: APXvYqyyCa0omhPTEKNegysXWXOskjHYqFcsJ+Q3sNWdtfShf5IVar4flTcYrteEsh0l4irKey9zBRXFnlc6
X-Received: by 2002:a25:8892:: with SMTP id d18mr19870478ybl.397.1582105129540; 
 Wed, 19 Feb 2020 01:38:49 -0800 (PST)
Date: Wed, 19 Feb 2020 17:38:38 +0800
In-Reply-To: <20200219093839.6212-1-tzungbi@google.com>
Message-Id: <20200219170951.1.I61f6559a37a6a40a6fde0737cb16100fb17c0480@changeid>
Mime-Version: 1.0
References: <20200219093839.6212-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [RFC PATCH 1/2] ASoC: dapm: select sleep_state when initializing
 PINCTRL widget
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com, jiaxin.yu@mediatek.com
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

Selects sleep_state when initializing PINCTRL widget.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/soc-dapm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 34c832686637..59302cbcb04e 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3600,6 +3600,9 @@ snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 			ret = PTR_ERR(w->pinctrl);
 			goto request_failed;
 		}
+
+		/* set to sleep_state when initializing */
+		dapm_pinctrl_event(w, NULL, SND_SOC_DAPM_POST_PMD);
 		break;
 	case snd_soc_dapm_clock_supply:
 		w->clk = devm_clk_get(dapm->dev, w->name);
-- 
2.25.0.265.gbab2e86ba0-goog

