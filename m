Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E707A2A1F60
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Nov 2020 17:02:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 623C716AB;
	Sun,  1 Nov 2020 17:01:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 623C716AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604246546;
	bh=VLmd45+G/SH3+vLzOEqGIp5CD4jVfyKYAIaoVD1Y3dM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IfWimmb/edcLhmnnWNhGWpEwmR8C9MsU9GglALLsZuNxh98EgxQTYspgnkwiXjn9e
	 zjb/DVlSm8S6qMJZkxgbXiVYcj87hV01Kogh5ZrMlf1tXmJxlE0+iwW5tJ/R8Fkm0X
	 ND17OZEEd19D0Tj6D3HX/44tRZNt84A7Yn8zICHQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC249F80171;
	Sun,  1 Nov 2020 17:00:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E24EEF8012B; Sun,  1 Nov 2020 17:00:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 992C7F8012B
 for <alsa-devel@alsa-project.org>; Sun,  1 Nov 2020 17:00:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 992C7F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="GYZamvlH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604246446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=vgk9YLGxl+ilKw1iu6HtFxOj8hP02Lb3fum/BlBAQ6s=;
 b=GYZamvlH/4AG1M/SKfm12ffvarjkNMNNZy9xojqqwEg2P2SkEKABjNfKfaMXltsu0RqEvz
 2p0IP0s4URIJf8QszYnf5lQyCYXwLG6tidu3UEh1d4ytYt7P75BbzI8LxN/RX511actR8m
 OtUptjbzpgrCuUyU/eKTyAHKU37DvF4=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-vn7Y90hcOPCw-7VcyGGjBg-1; Sun, 01 Nov 2020 11:00:44 -0500
X-MC-Unique: vn7Y90hcOPCw-7VcyGGjBg-1
Received: by mail-oo1-f71.google.com with SMTP id f12so4601063oos.23
 for <alsa-devel@alsa-project.org>; Sun, 01 Nov 2020 08:00:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=vgk9YLGxl+ilKw1iu6HtFxOj8hP02Lb3fum/BlBAQ6s=;
 b=E8lt0/onLHkNHpUNhkadRg9320AbP+oblib2vk/n0yQnBGWowfOTxy6w+PUjNtCvrp
 D6LIXcQbiD7oI5dhvPVAlhe08QuaYKw8DGUMkfFxVFWj44n+izmSyR6/pAUxlOInokqt
 kv+G9PGp43AtgDsdpgM7nHLg5ZFMWIB/DXPDndwbfUO230uCi8PBvQiiHEkBDl9VXar4
 QzVizKMTs2zwjteffA6I6/4XxVDEljaBrTm2yWSRINA0RHR0Aa0pZHHf8ZK/E39jWF2a
 hkbevdwaiRvtio2OSmgAtT1t3VlomE13rRFtIshHeFGQnU+FymbyCE62SIi28Oh5BhGQ
 27sQ==
X-Gm-Message-State: AOAM531BiujdOTkN8I+nLb1pj2IjEzR6OfMLacSZeILvlUqbgXvVmtPK
 2KqAFpah7oIrptsLDt7lysJ8hdcJsrT3ohcYrTiTskqVRNpso5Et8j9gqhxLI92YH1hOIhYSk7l
 focTxDXR5szkmrDM91PVa+Do=
X-Received: by 2002:a4a:9806:: with SMTP id y6mr9128888ooi.45.1604246443588;
 Sun, 01 Nov 2020 08:00:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVyT7JnEH2SuCBhZK8HzwoPK0Mcb7KeVaGChmVC3EtVOOG9EZ3UBdgb3/gT//qUNh8YjQFnQ==
X-Received: by 2002:a4a:9806:: with SMTP id y6mr9128857ooi.45.1604246443225;
 Sun, 01 Nov 2020 08:00:43 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id m11sm2806572oop.6.2020.11.01.08.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2020 08:00:42 -0800 (PST)
From: trix@redhat.com
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 nsaenzjulienne@suse.de, f.fainelli@gmail.com, rjui@broadcom.com,
 sbranden@broadcom.com, ranjani.sridharan@linux.intel.com,
 sw0312.kim@samsung.com, kuninori.morimoto.gx@renesas.com
Subject: [PATCH] ASoC: bcm2835-i2s: remove unneeded semicolon
Date: Sun,  1 Nov 2020 08:00:37 -0800
Message-Id: <20201101160037.2295512-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Cc: alsa-devel@alsa-project.org, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

From: Tom Rix <trix@redhat.com>

A semicolon is not needed after a switch statement.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/soc/bcm/bcm2835-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
index dc34fe1559c6..c2f7631e8705 100644
--- a/sound/soc/bcm/bcm2835-i2s.c
+++ b/sound/soc/bcm/bcm2835-i2s.c
@@ -797,7 +797,7 @@ static bool bcm2835_i2s_volatile_reg(struct device *dev, unsigned int reg)
 		return true;
 	default:
 		return false;
-	};
+	}
 }
 
 static bool bcm2835_i2s_precious_reg(struct device *dev, unsigned int reg)
@@ -807,7 +807,7 @@ static bool bcm2835_i2s_precious_reg(struct device *dev, unsigned int reg)
 		return true;
 	default:
 		return false;
-	};
+	}
 }
 
 static const struct regmap_config bcm2835_regmap_config = {
-- 
2.18.1

