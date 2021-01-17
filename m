Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7011B2F93CB
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Jan 2021 17:08:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D8D81755;
	Sun, 17 Jan 2021 17:07:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D8D81755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610899684;
	bh=xMU2mRmVunF1TNA3rUIIAU23bNeiA0dbJQGrPJV5Tso=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ldatjn9NgY+UOLyMP4493fLzS0Z+bxIFUkJ5Fc8WnWXBsFKWy8HqxmkWw5XnyU0hW
	 pyp68Hic1+wl+xu/DBw/VHty4sAW9R0E6/xP5u/cLPte948S6NN+5e/3Gd33YM8+3F
	 8A7gFpU29VHgU6K6iBWMCiF7PJYWYUzoBzsiXaD8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16D24F80115;
	Sun, 17 Jan 2021 17:06:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E047F804AD; Sun, 17 Jan 2021 17:06:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CFB5F80255
 for <alsa-devel@alsa-project.org>; Sun, 17 Jan 2021 17:06:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CFB5F80255
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="dUdgbUAA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610899571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QfffZkp6kc5D3emC3HTSADDepn8w8bDy1JhvkJWFPDM=;
 b=dUdgbUAADYjUMiHEOCuUYzxaP6kZ/44HTWPANLg3mPjfUvgX5aUMYCUQ4A0eW1ilYIe+tc
 2Gu1CXiGXe8h9bHXiiethjZrQSnAEdcUSHRDdyHJc459r0VKxocVhIpZG6yZVubmJUc0Og
 QGvIuHmiv4le3LTRvQGxRn/BCkUSxzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-07FWs_R6NA26QnzdUMq2iw-1; Sun, 17 Jan 2021 11:06:07 -0500
X-MC-Unique: 07FWs_R6NA26QnzdUMq2iw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B9D01800D42;
 Sun, 17 Jan 2021 16:06:05 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B37A5C233;
 Sun, 17 Jan 2021 16:06:01 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 01/12] mfd: arizona: Drop arizona-extcon cells
Date: Sun, 17 Jan 2021 17:05:44 +0100
Message-Id: <20210117160555.78376-2-hdegoede@redhat.com>
In-Reply-To: <20210117160555.78376-1-hdegoede@redhat.com>
References: <20210117160555.78376-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
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

The arizona jack-dection handling is being reworked so that the
codec-child-device drivers directly handle jack-detect themselves,
so it is no longer necessary to instantiate "arizona-extcon"
child-devices.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/mfd/arizona-core.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
index 75f1bc671d59..ce6fe6de34f8 100644
--- a/drivers/mfd/arizona-core.c
+++ b/drivers/mfd/arizona-core.c
@@ -881,11 +881,6 @@ static const char * const wm5102_supplies[] = {
 static const struct mfd_cell wm5102_devs[] = {
 	{ .name = "arizona-micsupp" },
 	{ .name = "arizona-gpio" },
-	{
-		.name = "arizona-extcon",
-		.parent_supplies = wm5102_supplies,
-		.num_parent_supplies = 1, /* We only need MICVDD */
-	},
 	{ .name = "arizona-haptics" },
 	{ .name = "arizona-pwm" },
 	{
@@ -898,11 +893,6 @@ static const struct mfd_cell wm5102_devs[] = {
 static const struct mfd_cell wm5110_devs[] = {
 	{ .name = "arizona-micsupp" },
 	{ .name = "arizona-gpio" },
-	{
-		.name = "arizona-extcon",
-		.parent_supplies = wm5102_supplies,
-		.num_parent_supplies = 1, /* We only need MICVDD */
-	},
 	{ .name = "arizona-haptics" },
 	{ .name = "arizona-pwm" },
 	{
@@ -939,11 +929,6 @@ static const char * const wm8997_supplies[] = {
 static const struct mfd_cell wm8997_devs[] = {
 	{ .name = "arizona-micsupp" },
 	{ .name = "arizona-gpio" },
-	{
-		.name = "arizona-extcon",
-		.parent_supplies = wm8997_supplies,
-		.num_parent_supplies = 1, /* We only need MICVDD */
-	},
 	{ .name = "arizona-haptics" },
 	{ .name = "arizona-pwm" },
 	{
@@ -956,11 +941,6 @@ static const struct mfd_cell wm8997_devs[] = {
 static const struct mfd_cell wm8998_devs[] = {
 	{ .name = "arizona-micsupp" },
 	{ .name = "arizona-gpio" },
-	{
-		.name = "arizona-extcon",
-		.parent_supplies = wm5102_supplies,
-		.num_parent_supplies = 1, /* We only need MICVDD */
-	},
 	{ .name = "arizona-haptics" },
 	{ .name = "arizona-pwm" },
 	{
-- 
2.28.0

