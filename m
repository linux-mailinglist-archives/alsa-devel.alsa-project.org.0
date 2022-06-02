Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C66053B804
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 13:46:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 138D71728;
	Thu,  2 Jun 2022 13:45:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 138D71728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654170406;
	bh=Ay8HwpC2TcZmNQnrweearwEEkU1erIx4kCzMjwv6xTE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bmxvtsougV4xoxYkpAt/ZnaYf9lIEhi8SI9pabSz7vAxPp761vo49+vMOhGdPd/5i
	 rS7zw01HpCBuUYS761HvILa8Ud+TNSFC44FfR/CU6l1Bm851nzHvz0g1C1iwmVPex7
	 c1BJutabESbZfPwJcuu3FG8RfF2Rp/csQfZ8N9/4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C4A8F8025E;
	Thu,  2 Jun 2022 13:45:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AF39F80236; Thu,  2 Jun 2022 13:45:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72929F80089
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 13:45:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72929F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BbGlo5bK"
Received: by mail-pf1-x435.google.com with SMTP id z17so4543068pff.7
 for <alsa-devel@alsa-project.org>; Thu, 02 Jun 2022 04:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+d98QRju/iof/J3fqnwUoOBnWzIJ1MsMResY4ThMXQw=;
 b=BbGlo5bKFJ98FdM1OaSDYxQb5y8x7/n6+RNxsoobAWzJkuaAPlQoberr4i7ui0ZeWo
 m7mkIIC9PpknwkzVMuoVmmENO61cORNGJDsGXb99v+62IAkAbgJ9jpYYMemMdIrAvv98
 bqZTqBaYFYt+awEnpfswZXqwXZJsRAMTXoEPeKkBtOOr19C9AgZKkTZCXbgYvYpnbxi8
 eUfdf6Pb1ZiDwnzDOumHbZRtmQU/TkYa3xLRbIMKapFCTdFj0oLc/l3C5STXB8/E6/xB
 ojmj3dvE7WfO1EBWXpJ/8og1Ufuze3Zfahry58UBmL498SwhuRHvsklLkrQumYY01LwV
 fPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+d98QRju/iof/J3fqnwUoOBnWzIJ1MsMResY4ThMXQw=;
 b=EzH31HvE04ngtoNab4u1hyeURuOc7CS3mGqrkcuzOXC1AAMWzC2j6UJXtb5Hf9KFKQ
 Oz4j3qgeXhTNdc40roAFdUupzwFuJeVy7ZMORlVAeMEWNOz5Oyu4pus8Detco6T0i+D9
 +l/C6+sT8nqpWXzkCWI84HOznyipOTAdMWAjSbXjDcYwHvdDycdZchiQuEpJDTcgAkXB
 SdYO6iOW8RbRNteQ1NpJduz3UbFV/mblWGHRh+CSdtz4GeoQVndtlek3FFz7NPO4m1K7
 ma8RO21SQj1JWdmAySTx7Y6OU7rMLJqmPYYS+09oTQg8p0z7kqhhf/C0HMTrOUPRv12M
 show==
X-Gm-Message-State: AOAM532Y7x5DsiV2winYEVd3ezCnNJBi13OYq1ekZ2iCW9W/F6wyhlue
 GglrRBvucsLfrSlNzWRDU5w=
X-Google-Smtp-Source: ABdhPJyLq+i7vaKBUknNiqsbWkl+78YNSRhu19ou3RjHDXCtiMckU2vPaHBuflOii75VX75Ob3CuXw==
X-Received: by 2002:a63:ef41:0:b0:3fb:c201:797d with SMTP id
 c1-20020a63ef41000000b003fbc201797dmr4090679pgk.104.1654170339825; 
 Thu, 02 Jun 2022 04:45:39 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 s17-20020a170902c65100b0015ee60ef65bsm3221335pls.260.2022.06.02.04.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 04:45:39 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Cheng-Yi Chiang <cychiang@chromium.org>,
 Tzung-Bi Shih <tzungbi@google.com>, Guenter Roeck <groeck@chromium.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: cros_ec_codec: Fix refcount leak in
 cros_ec_codec_platform_probe
Date: Thu,  2 Jun 2022 15:45:29 +0400
Message-Id: <20220602114529.6303-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linmq006@gmail.com
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

of_parse_phandle() returns a node pointer with refcount
incremented, we should use of_node_put() on it when not need anymore.
Add missing of_node_put() to avoid refcount leak.

Fixes: format:b6bc07d4360d ("ASoC: cros_ec_codec: support WoV")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/codecs/cros_ec_codec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 8b0a9c788a26..11e7b3f6d410 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -995,6 +995,7 @@ static int cros_ec_codec_platform_probe(struct platform_device *pdev)
 			dev_dbg(dev, "ap_shm_phys_addr=%#llx len=%#x\n",
 				priv->ap_shm_phys_addr, priv->ap_shm_len);
 		}
+		of_node_put(node);
 	}
 #endif
 
-- 
2.25.1

