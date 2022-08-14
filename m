Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 269915951CD
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 07:17:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66ABA1607;
	Tue, 16 Aug 2022 07:16:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66ABA1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660627036;
	bh=lgOOH+B5swTn1k7iQVN9xx1wsG5CEPE14E9lQQgILcY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tzukxeQz9cVbLbi3WgtB6l8ybzEFi+YeLggxUJjI9FiwacBYeuJZTBxtKV5ZStR/D
	 cXCmzHVaqe6AGo6OFnF2YWc8QUCbZ+UoLrLOASvVioBEYW4wPQkwk6HBtbi7Hpu+r/
	 5kI3N09Evd25u5wZHUk/Vc7gRaXrarFGi2UzkrL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEC9DF80095;
	Tue, 16 Aug 2022 07:16:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CBE5F804BD; Sun, 14 Aug 2022 10:05:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6945CF800CB
 for <alsa-devel@alsa-project.org>; Sun, 14 Aug 2022 10:05:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6945CF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="l/H4zND9"
Received: by mail-pg1-x532.google.com with SMTP id f65so4218913pgc.12
 for <alsa-devel@alsa-project.org>; Sun, 14 Aug 2022 01:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=rWqpd+TDL+uhqq+ZM31CgYmJ/5I6ggTeiRIyfhpx6YE=;
 b=l/H4zND9Wh9LsleFV38bwrmFAMETQ3dei02nqbrPEQvrkhn/Fo7NFXn6zZM3oca66Z
 dxpf7bLIId8OuGXf8/KlgKEHlTse4HJ9JJWFgYQQakC3KHFaJNFKSf4r07fZTh2ITGbI
 /ZqPN8tJLKWrBjlCyDXDTtwddtCZKs1wHYyahsF37u2TYduFpYKX4TV4WwkOH7p0Otlo
 dvUmdgeQARI21JkRN/hstcFfHE/iO4Dt7XBad2lRXDgXkDA+jqh9UZFY/5Bv8sBl59Yh
 u6/wzAYEXig+/+dj1erB+v2YtTgzAwlTOg3w2GgF2Vp+O/ewzAZ6wkWV45gP8flej8HE
 YMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=rWqpd+TDL+uhqq+ZM31CgYmJ/5I6ggTeiRIyfhpx6YE=;
 b=5hJ9Wd9oWgvG7G8VvgX22cR6d48HP5gIDqBzSqqQnOIQ0CynhQHEKmFZFX0pXNmNnZ
 VXDFJgAI6evVs1kMLueb4n7X9FWpi93QEdmI3jRlQjEo6TO/9z1qFQ5/YZd1sBLiebqm
 lvQtt2JlfuFFMY/LfPYyqH+dSZENMFVB+MY0cE8sgUuf+2q9etUbGHKBLKQB15qqBtjZ
 TQshP382yLm5pEl1lKteqhw8bpzX4VyG5JQiRzS+/DZF8QXXKNoC+GuKU5eiuDcVg1yw
 7fjFNGvbTXg9o4CDs5Ute7llxrJOgV5/PqqJLR/kQLXfOdOZKqdropOMzAUBPndpFTy0
 9fng==
X-Gm-Message-State: ACgBeo2Ffdpu1R0lybv4rG0HxC8NtA3jWDf28tZOPn1Ve5r96sbe/TUp
 5a7MAGqfPKIBkqO50ayzvTQat4E17CL0a32O
X-Google-Smtp-Source: AA6agR44dMyyhdx5CLh7qHEoCxg2XQP01uFUUC2ZHzsviRdJfYmkYA7pSnB/CVOgcsGZBfQVeVGwSw==
X-Received: by 2002:aa7:8e91:0:b0:52d:8ebf:29a4 with SMTP id
 a17-20020aa78e91000000b0052d8ebf29a4mr11407833pfr.1.1660464337507; 
 Sun, 14 Aug 2022 01:05:37 -0700 (PDT)
Received: from fedora.. ([103.159.189.159]) by smtp.gmail.com with ESMTPSA id
 l27-20020a63ba5b000000b0041d95d805d6sm4173032pgu.57.2022.08.14.01.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 01:05:37 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [RFC PATCH] Soundwire: Initialize multi_link with fwnode props
Date: Sun, 14 Aug 2022 14:04:15 +0600
Message-Id: <20220814080416.7531-1-khalid.masum.92@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 16 Aug 2022 07:16:15 +0200
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Khalid Masum <khalid.masum.92@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Len Brown <lenb@kernel.org>
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

According to the TODO, In sw_bus_master_add, bus->multi_link is to be
populated with properties from FW node props. Make this happen by 
creating a new fwnode_handle flag FWNODE_FLAG_MULTI_LINKED and use 
the flag to store the multi_link value from intel_link_startup. Use 
this flag to initialize bus->multi_link.

Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
---
I do not think adding a new flag for fwnode_handle is a good idea.
So, what would be the best way to initialize bus->multilink with 
fwnode props?

  -- Khalid Masum

 drivers/soundwire/bus.c   | 4 ++--
 drivers/soundwire/intel.c | 1 +
 include/linux/fwnode.h    | 1 +
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index a2bfb0434a67..80df1672c60b 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -74,9 +74,9 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 
 	/*
 	 * Initialize multi_link flag
-	 * TODO: populate this flag by reading property from FW node
 	 */
-	bus->multi_link = false;
+	bus->multi_link = (fwnode->flags & FWNODE_FLAG_MULTI_LINKED)
+		== FWNODE_FLAG_MULTI_LINKED;
 	if (bus->ops->read_prop) {
 		ret = bus->ops->read_prop(bus);
 		if (ret < 0) {
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 505c5ef061e3..034d1c523ddf 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1347,6 +1347,7 @@ int intel_link_startup(struct auxiliary_device *auxdev)
 		 */
 		bus->multi_link = true;
 		bus->hw_sync_min_links = 1;
+		dev->fwnode->flags |= FWNODE_FLAG_MULTI_LINKED;
 	}
 
 	/* Initialize shim, controller */
diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index 9a81c4410b9f..446a52744953 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -32,6 +32,7 @@ struct device;
 #define FWNODE_FLAG_NOT_DEVICE			BIT(1)
 #define FWNODE_FLAG_INITIALIZED			BIT(2)
 #define FWNODE_FLAG_NEEDS_CHILD_BOUND_ON_ADD	BIT(3)
+#define FWNODE_FLAG_MULTI_LINKED		BIT(4)
 
 struct fwnode_handle {
 	struct fwnode_handle *secondary;
-- 
2.37.1

