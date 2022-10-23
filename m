Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8A66091B4
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Oct 2022 09:47:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D734A63C;
	Sun, 23 Oct 2022 09:46:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D734A63C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666511232;
	bh=CsE49BkPVr3jhFK9Ntf9VWfJcZmMZVTCbR2H4Z7byLQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OonwgAS0Ke4YrB/QZlnrDlh8kp5aQs9c5JfKZ3K/TwbNA7xjnwrGYHcS+x9DAuFCS
	 ehPt5x2PH6fgRjmXGKmRS/yy3S3pKCSnK22ny4zAe2JEYkzqKPeNt+e8bwec1QEIq+
	 +0n0nx24TGEoA5cpx215rSs29oqDX7PQE89vZpDY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4140F803DB;
	Sun, 23 Oct 2022 09:46:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38BF6F801D5; Sun, 23 Oct 2022 09:46:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2390F801D5
 for <alsa-devel@alsa-project.org>; Sun, 23 Oct 2022 09:46:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2390F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HNX7B3LX"
Received: by mail-pf1-x42a.google.com with SMTP id f140so6543142pfa.1
 for <alsa-devel@alsa-project.org>; Sun, 23 Oct 2022 00:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q+3XI07NIU0r0BcSpY4o4wAED1j8IMzL6p8JlqJ+P7M=;
 b=HNX7B3LX5uGls5yoQ/5rcdO3NyrtZTcsWkpJx9uEferAxFEMGahSk77KWsyjQqM081
 SmHGfTKBcsKNRcnCMtbYzC8/QpkdGVvCB+DcTyYY5nzGGJMYLyY63doCjtrtagYKSqbQ
 72KKKHZQvFXE3hErYtcA+0HNZoqNXtZfwFCWW3mzNxmOInHiyLd2jX9gK2eYWnHL56dY
 6wUHiYGv02nGQ49T5B5Y4MEdC1rshkasUy6h29VDsZOXdecYgPtscpg17YkBPeLmj77x
 qV/SwnwvnB8CgsNWcl7X6G2uhmBG0gSJF8EqEQmVyrv389h15pcTgy83XkMOCb0cnIB8
 DA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q+3XI07NIU0r0BcSpY4o4wAED1j8IMzL6p8JlqJ+P7M=;
 b=JbtP5rgFHOEsWLeQkr/LUf/OWmoiYMOSLbaLzfk8rahRwotf9qPXdvnkENhR02+znW
 PK9fTOYmgDCsHZ5PX8D87AxgzKAv8wsTbCQ9KVHPRkwRnv8O0Ar16iJ6wuffivSIuN56
 ohyzX5SIgcrEKVfyi7pgNLcM6l3BNIYC2QtFJIDcH4gcfBbtPugPHuTT+VpGbnpAPSv1
 KjJqPZ6r4cOWOmHxcTaooYvK1B0O6QjSE4ySKImBQUJul2i3eTOrngL/v/V9tfSU+L6z
 BL2wiH5R06XZl9HchEwa/QjbWu1m2N7RXvIuex8INU+nQGowoYUgw29r8WpKCGXBZnSc
 d+FQ==
X-Gm-Message-State: ACrzQf1IAqtJwPqR+fe5hQGJfBq260azpq8umVG3c1uSh+E12c2CkMwe
 91mt8hbMLuVx7LlCj7xgfw==
X-Google-Smtp-Source: AMsMyM7hnbn4FtvSizf8k1Mr/Ab9tVqFbA04W4ZUETz4RdenA5XTA4G0THtH48QpRTXAq92reGBQTA==
X-Received: by 2002:a63:6505:0:b0:46e:d30b:8f9 with SMTP id
 z5-20020a636505000000b0046ed30b08f9mr6658694pgb.366.1666511164097; 
 Sun, 23 Oct 2022 00:46:04 -0700 (PDT)
Received: from localhost.localdomain ([121.34.154.42])
 by smtp.gmail.com with ESMTPSA id
 ge12-20020a17090b0e0c00b0020aa1bd91e4sm4101976pjb.4.2022.10.23.00.46.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 23 Oct 2022 00:46:03 -0700 (PDT)
From: Ban Tao <fengzheng923@gmail.com>
To: fengzheng923@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org
Subject: [PATCH v2] ASoC: sun50i-dmic: avoid unused variable warning for
 sun50i_dmic_of_match
Date: Sun, 23 Oct 2022 00:44:45 -0700
Message-Id: <1666511085-2748-1-git-send-email-fengzheng923@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: alsa-devel@alsa-project.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

In configurations with CONFIG_OF=n, we get a harmless build warning:

sound/soc/sunxi/sun50i-dmic.c:268:34: warning: unused variable
'sun50i_dmic_of_match' [-Wunused-const-variable]

Signed-off-by: Ban Tao <fengzheng923@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
v1->v2:Add "Acked-by" tag.
---
 sound/soc/sunxi/sun50i-dmic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index 86cff5a..62509cb 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -391,7 +391,7 @@ static const struct dev_pm_ops sun50i_dmic_pm = {
 static struct platform_driver sun50i_dmic_driver = {
 	.driver         = {
 		.name   = "sun50i-dmic",
-		.of_match_table = of_match_ptr(sun50i_dmic_of_match),
+		.of_match_table = sun50i_dmic_of_match,
 		.pm     = &sun50i_dmic_pm,
 	},
 	.probe          = sun50i_dmic_probe,
-- 
2.7.4

