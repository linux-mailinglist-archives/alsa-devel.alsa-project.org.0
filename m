Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B21A7B8031
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 15:04:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8F2F839;
	Wed,  4 Oct 2023 15:03:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8F2F839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696424661;
	bh=zWOP0AVbKx31U0anPiTXOjk0OR4NF1ziZ/Fl3zTNXQ8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gXU0voPlrKSQ++Xseou4xy/0qKh17HxgR0ddytbXJBIEfiDNLl0MLjAVw1eQ7BMev
	 rZJYVT1OiXt2F6WyMcrRqmxY8VtsP4w8cbjdnplH17LgUBkCcXQ37DuO4FMLh7djYq
	 KtCga+UZRaH7fYruU+rUBqC6SR7byIzy3iaD/epw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38FD4F80166; Wed,  4 Oct 2023 15:03:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0040EF80310;
	Wed,  4 Oct 2023 15:03:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B37A3F8047D; Wed,  4 Oct 2023 15:03:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E823F80166
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 15:03:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E823F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kCluzWIL
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-533cbbd0153so3759287a12.0
        for <alsa-devel@alsa-project.org>;
 Wed, 04 Oct 2023 06:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696424588; x=1697029388;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcFoJma4HsSRYQOjS15Jla4T5NRg0e9bZhu1IrMhFVc=;
        b=kCluzWILFyll5yffvgzAcyp+UPzPUO0F2IL5gsgM4JqTmbgK6Oh3RES1EK91YAajmF
         3rM/bHjvpdamTeJlLhapfTlWQwiaZC3DviE8u/aGPdY7wt+S005NA89wsknVxgMzLNz6
         k8HYgIOTV9It/PTsYmAd5MLg091CusFioo/Ch2SQNNs78evNnzx8W2ggBeGCWZVS6O+/
         ebYZkEdFlhUyO/FplgteHp3K5rLvaQn/yJ/OkdxlNE0I/GKX0hEp0/Jjv2VezyfvTfFW
         WDglu6S2G7IJknFn/LGXcmQJK6iaEzaS2PgKtBS8Fs62LBRa6zdabnJBGYWdm2jjIteC
         iSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696424588; x=1697029388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZcFoJma4HsSRYQOjS15Jla4T5NRg0e9bZhu1IrMhFVc=;
        b=FtVkqAujGfQahVvA5NwUBTT9hL9b6CGt+okbp3EU9l1MCmwQ0/hnFS7ohbhfjk/rHl
         igGv46yDaV3YEIS5LJB2gPsjHJrVIJhEpNQcYb1eBDa0SwXxdNiyDYzHX6MXWab05Y9A
         UMdUl1ICpt9iwe1hrnLBQHK6WRzHWdMA3uCdOo5srfN0cXCkL5GKAr4g3ae2BI90DlNI
         KP3nve2AupGRVZovp6Ee9y33HnUQZHJfw79eJ4TjlZvkL8QzPNtM4ojj1MmOx6z3XmI0
         Ff9lXH79FEq0MOJMl9QRLrJaHtnBD8oJe+2g/qysRNQRwWrQqFg+nNIXqo04KQZqpOOe
         dD6A==
X-Gm-Message-State: AOJu0YzJ51RYq73SlhO8GY3dycTvupJTZNF2MDOte8YaTBSiym0lK6Ka
	jIzKGHxfZaw4xgo+oJAhXB/MV+5Ai41bJEK5suGXXQ==
X-Google-Smtp-Source: 
 AGHT+IHWViklCkFuofuCVXfDhfGBadhs+Z24ra+EL/fJ15/9k73iL5cn7B/Y01gFA1SHuQdewQRFGw==
X-Received: by 2002:a05:6402:205:b0:534:8bdf:a258 with SMTP id
 t5-20020a056402020500b005348bdfa258mr1969252edv.31.1696424587666;
        Wed, 04 Oct 2023 06:03:07 -0700 (PDT)
Received: from krzk-bin.. (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id
 m3-20020aa7d343000000b00530ccd180a3sm2394704edr.97.2023.10.04.06.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 06:03:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philippe Ombredanne <pombredanne@nexb.com>,
	Takashi Iwai <tiwai@suse.de>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] soundwire: fix initializing sysfs for same devices on
 different buses
Date: Wed,  4 Oct 2023 15:02:43 +0200
Message-Id: <20231004130243.493617-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QHGZBY3AZPKEYI3JBXCXEL5L37D536T7
X-Message-ID-Hash: QHGZBY3AZPKEYI3JBXCXEL5L37D536T7
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QHGZBY3AZPKEYI3JBXCXEL5L37D536T7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If same devices with same device IDs are present on different soundwire
buses, the probe fails due to conflicting device names and sysfs
entries:

  sysfs: cannot create duplicate filename '/bus/soundwire/devices/sdw:0:0217:0204:00:0'

The link ID is 0 for both devices, so they should be differentiated by
bus ID.  Add the bus ID so, the device names and sysfs entries look
like:

  sdw:1:0:0217:0204:00:0 -> ../../../devices/platform/soc@0/6ab0000.soundwire-controller/sdw-master-1/sdw:1:0:0217:0204:00:0
  sdw:3:0:0217:0204:00:0 -> ../../../devices/platform/soc@0/6b10000.soundwire-controller/sdw-master-3/sdw:3:0:0217:0204:00:0

Fixes: 7c3cd189b86d ("soundwire: Add Master registration")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Sending as RFT, because I did not test it on that many devices and
user-spaces.
---
 drivers/soundwire/slave.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index c1c1a2ac293a..4db43ea53d47 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -39,14 +39,14 @@ int sdw_slave_add(struct sdw_bus *bus,
 	slave->dev.fwnode = fwnode;
 
 	if (id->unique_id == SDW_IGNORED_UNIQUE_ID) {
-		/* name shall be sdw:link:mfg:part:class */
-		dev_set_name(&slave->dev, "sdw:%01x:%04x:%04x:%02x",
-			     bus->link_id, id->mfg_id, id->part_id,
+		/* name shall be sdw:bus:link:mfg:part:class */
+		dev_set_name(&slave->dev, "sdw:%01x:%01x:%04x:%04x:%02x",
+			     bus->id, bus->link_id, id->mfg_id, id->part_id,
 			     id->class_id);
 	} else {
-		/* name shall be sdw:link:mfg:part:class:unique */
-		dev_set_name(&slave->dev, "sdw:%01x:%04x:%04x:%02x:%01x",
-			     bus->link_id, id->mfg_id, id->part_id,
+		/* name shall be sdw:bus:link:mfg:part:class:unique */
+		dev_set_name(&slave->dev, "sdw:%01x:%01x:%04x:%04x:%02x:%01x",
+			     bus->id, bus->link_id, id->mfg_id, id->part_id,
 			     id->class_id, id->unique_id);
 	}
 
-- 
2.34.1

