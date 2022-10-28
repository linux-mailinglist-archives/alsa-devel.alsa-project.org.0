Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 806596130B5
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 07:49:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16F6B1657;
	Mon, 31 Oct 2022 07:48:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16F6B1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667198963;
	bh=OWqViSeibQeV8JEHBSuff0mFq/DQl6vlpe42WZ31Ke8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qD5zblPnwcgwdKPSzYkiJjGhVAYTxXeqw3EyjY3uYjbW5CEwlow+fTqzat7Ii8bMD
	 jwjGZosFQljzMPcjxH2SQyRi0AysMnwr+UZFaQdbUf4+HNky98GOYlLJLTW7zi8KDC
	 iUleT1jLFubo05wUnc9T3BhfxKCE8qCkIxAIsBqw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF44CF805A8;
	Mon, 31 Oct 2022 07:45:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 976EEF8025A; Fri, 28 Oct 2022 21:14:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75E0BF8016A
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 21:13:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75E0BF8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.b="iB/0wWsj"
Received: by mail-ej1-x635.google.com with SMTP id fy4so15175433ejc.5
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 12:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pbLU8G2nPUHM4Aab1zDWh7+8gBmTVjh77cKTi8zqoN8=;
 b=iB/0wWsjCnaggGgC/IT/FEvhnyhXnoD47LxIjJOB1HtLYBtTNgbRYrnvcSTVG659yR
 40c7ER61HF7eRuVIKqMstbMzUP1iSh6aCvp8Zx5ZfU0yyyF/98c0SncHaxIicILYnrk7
 gvkB4yXgIU9D7CD1UXfOMGShMGPIVvYTqkU+DcBYvHNsmrtoF3ez4Y23JDYiM13TE6t2
 +vAqNaUITbL9z+EnwnMt7D0c0Ve5r1rz/s1xwOYgC8zYcWK28vJ1mS/5FA4tZEMMG7O3
 6HwR512UXMTC0Af8L1CCXU2KyeAYDXds3FazhwL/Q4ZdSbWCnU7jhm01GuN42O0RYCL1
 2GPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pbLU8G2nPUHM4Aab1zDWh7+8gBmTVjh77cKTi8zqoN8=;
 b=OQsIs9PfNhQMVhv11pLDduwazXiy6V8T/+UxZUShsb0MQqfuaN/02Yys6XvVQSv8oR
 /nrt6yGLnJdleHfSKEQ35MHuKhnMpA6sL6P4nCibv7mtNni/Qfw7K+qpIYkv/Jp4vo28
 47+4hLy2TGPrVDGrN7xaLg9chjSFMzIu7ix9gFKcYyQFjEtux1yk+mdZUc/5Rw82GhkT
 vWvVUjseD1IggKIpLOfVjbh6P/5sccMRyIYij6EcOViqTLibM38yEVrWpaYR1BqI/zKK
 p2gUQQl12aYIrlOk5kd/1FnnFHR5cOZc1D2SvnxJLACplWm/c+jbWRd0Ky9z2DdxeH1v
 RCeQ==
X-Gm-Message-State: ACrzQf1qiAHFAAJoW3xtYdYriqbu1h1v4Hr0LRxDJB4NG2MEHKmxHOto
 1VBWxPJI1f6LhzHBK9q37Y8weg==
X-Google-Smtp-Source: AMsMyM5uCxbSrhg0tSnHUKHalAicTtK/sVJNhz5Eofzc65Oicx6YsX2ct3ebblLWKywVW+0w+4Vufg==
X-Received: by 2002:a17:906:d550:b0:7ad:a0df:d4c1 with SMTP id
 cr16-20020a170906d55000b007ada0dfd4c1mr780615ejc.210.1666984434295; 
 Fri, 28 Oct 2022 12:13:54 -0700 (PDT)
Received: from dtpc.zanders.be (78-22-137-109.access.telenet.be.
 [78.22.137.109]) by smtp.gmail.com with ESMTPSA id
 hr25-20020a1709073f9900b007aacfce2a91sm2568922ejc.27.2022.10.28.12.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 12:13:53 -0700 (PDT)
From: Maarten Zanders <maarten.zanders@mind.be>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: simple-mux: add read function
Date: Fri, 28 Oct 2022 21:13:01 +0200
Message-Id: <20221028191303.166115-1-maarten.zanders@mind.be>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 31 Oct 2022 07:45:34 +0100
Cc: alexandre.belloni@bootlin.com, Maarten Zanders <maarten.zanders@mind.be>,
 alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org
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

During initialisation DAPM tries to read the state of the MUX
being connected, resulting in this error log:
input-mux: ASoC: error at soc_component_read_no_lock on input-mux: -5

Provide a read function which allows DAPM to read the state of the
MUX.

Signed-off-by: Maarten Zanders <maarten.zanders@mind.be>
---
 sound/soc/codecs/simple-mux.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/simple-mux.c b/sound/soc/codecs/simple-mux.c
index d30c0d24d90a..bf67de12d20b 100644
--- a/sound/soc/codecs/simple-mux.c
+++ b/sound/soc/codecs/simple-mux.c
@@ -55,6 +55,14 @@ static int simple_mux_control_put(struct snd_kcontrol *kcontrol,
 					     e, NULL);
 }
 
+static unsigned int simple_mux_read(struct snd_soc_component *component,
+				    unsigned int reg)
+{
+	struct simple_mux *priv = snd_soc_component_get_drvdata(component);
+
+	return priv->mux;
+}
+
 static const struct snd_kcontrol_new simple_mux_mux =
 	SOC_DAPM_ENUM_EXT("Muxer", simple_mux_enum, simple_mux_control_get, simple_mux_control_put);
 
@@ -76,6 +84,7 @@ static const struct snd_soc_component_driver simple_mux_component_driver = {
 	.num_dapm_widgets	= ARRAY_SIZE(simple_mux_dapm_widgets),
 	.dapm_routes		= simple_mux_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(simple_mux_dapm_routes),
+	.read			= simple_mux_read,
 };
 
 static int simple_mux_probe(struct platform_device *pdev)
-- 
2.37.3

