Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 842FC463B07
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 17:07:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CB3F22E9;
	Tue, 30 Nov 2021 17:06:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CB3F22E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638288459;
	bh=6Nui04VC+EclPqKvAyULiIiD/RZKglvh6skgELwCiHY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B4Fu/zY8dwKF687mdovcCTFyhTAhb+J8AFJxjmvdZSVyhDd6yip3sojs6wQrUyE4F
	 h90LnMuNcq3mn9yYQfqWjDtVtiVBS8HhFWMeTpC0MvIY1KpXuHye+wu7KZ50XJYoem
	 A4SgVFOf/gathx+Y4dvFOIu+kf2MRQCiN/xomDIE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C91F5F804FF;
	Tue, 30 Nov 2021 17:05:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C28EFF8032D; Tue, 30 Nov 2021 17:05:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB794F802C4
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 17:05:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB794F802C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="r5D0WzBw"
Received: by mail-wm1-x336.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso19947436wms.2
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 08:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OIAtVnx0ZzlGmfdsJR+Ltr1BjxuMXS7lSNZkDDd+8oo=;
 b=r5D0WzBwgwvEJ6qvAb7BParzqYivB9ouS4MM1hgX9ewjK+4Qt+7UHp/G2VN98fimd/
 ez3cnnPWNlFk1GS8ee2zvMSGNp72n9smLAo1lQB/YHHfmgHaN7VYM7oSPSF6o2HQZ/Vw
 uI7soY74pafLImmmT5SEw230VCq9hixIKgWWbIGz0gNo3GBowQhK3C6X26RhLRBJ11a8
 n2WipiZs4aYPgvG25D77SToLUsPTgOBFPcnSjejmOHHhHCErnQ999MGSHmH5HsWxq6pe
 dm9mafM038ERfza6Mo9kr5xW5F13r9R9kyfu6HwzH8CAB6QyUPloaeFIKBGVbFdrkEO3
 mnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OIAtVnx0ZzlGmfdsJR+Ltr1BjxuMXS7lSNZkDDd+8oo=;
 b=yYZs6eYaUIvKrntiNbU38f9Q5AzXj8mflaJgzZl4750DucCxj6DxfL6AG2tMYfIpLT
 Dj6xs+PzGIUTFkppzIJVVbdte9wz4nUkmWl6j7quAluEPjGfgngZ3iA4gOYZTNLhQCh5
 zxxXjLQYfycqwmEDmWrOGwWWDufhzFEWVsXp4t+oDeGSri5eYK+FAh3nHxyPxhzdEzxQ
 5xHZZq/t1xWk7Lnp9Rrb0Sdre/Gz4uPEijkH++ctdJYkRkdfuEHXFa/eDar/T2Xgb1W1
 ljyKcGqVOAGFhHPQ7CjX7NtPvy5jrzZu7HPEf0u71h27P00eoFFxMfYwUZWoT0YPn7hw
 Q9SA==
X-Gm-Message-State: AOAM5327mTc030OLtSSJv2c1uMkXwaEScCmNi4lbSZURXhVEPXcCJJ1W
 lwkTKTCaY9VvcISgJE2zKLzTnQ==
X-Google-Smtp-Source: ABdhPJwReuuxUsxNupkQZHuNCtvWOALK8zItA8DvAQk1ne0jY1pHEqrMNHn0ZRnUx0d1pg514SymPA==
X-Received: by 2002:a1c:9a89:: with SMTP id c131mr394569wme.80.1638288318600; 
 Tue, 30 Nov 2021 08:05:18 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id g18sm16719409wrv.42.2021.11.30.08.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 08:05:18 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 3/4] ASoC: codecs: wcd934x: return correct value from mixer put
Date: Tue, 30 Nov 2021 16:05:06 +0000
Message-Id: <20211130160507.22180-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211130160507.22180-1-srinivas.kandagatla@linaro.org>
References: <20211130160507.22180-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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

wcd934x_compander_set() currently returns zero eventhough it changes the value.
Fix this, so that change notifications are sent correctly.

Fixes: 1cde8b822332 ("ASoC: wcd934x: add basic controls")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 3294c685d4d8..6c468527fec6 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -3256,6 +3256,9 @@ static int wcd934x_compander_set(struct snd_kcontrol *kc,
 	int value = ucontrol->value.integer.value[0];
 	int sel;
 
+	if (wcd->comp_enabled[comp] == value)
+		return 0;
+
 	wcd->comp_enabled[comp] = value;
 	sel = value ? WCD934X_HPH_GAIN_SRC_SEL_COMPANDER :
 		WCD934X_HPH_GAIN_SRC_SEL_REGISTER;
@@ -3279,10 +3282,10 @@ static int wcd934x_compander_set(struct snd_kcontrol *kc,
 	case COMPANDER_8:
 		break;
 	default:
-		break;
+		return 0;
 	}
 
-	return 0;
+	return 1;
 }
 
 static int wcd934x_rx_hph_mode_get(struct snd_kcontrol *kc,
-- 
2.21.0

