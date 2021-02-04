Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D7130F210
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 12:27:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DA071744;
	Thu,  4 Feb 2021 12:26:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DA071744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612438024;
	bh=jRxQgez9zmOhJ14GpUGXFNjkM9kjmYRMxYmkzf2OvRE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=of7ue3dAoKWEthOWGYajW+oPbve7QrmxBTv6IJSvvAiQx+cbtyvBEfmwL6bjScpqX
	 1ffLaSjvdN6RmILnOjOBPOj1kaxrc2ob0o4R2NURM2vohzTvwoBwbN01ReRrteQctk
	 hicF3FmMQY7jQOCEN+3/TAsN7BxZ1RseBPgfLif4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C76E1F80254;
	Thu,  4 Feb 2021 12:25:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71CEDF8023E; Thu,  4 Feb 2021 12:25:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38899F80139
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 12:25:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38899F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="KE7C4E8p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612437914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r5n8wS89oxas5SDyM7yTM++Vb4GsS20JshNS5sVzlp0=;
 b=KE7C4E8pWYKu23JC9b+6SbHhl9yhrgJvJKlFqO51qmiXkvxi0gvSzzCAEwSNMnVDYsJ9oJ
 mHbcsNsjVV3YADROD8AuRV8wA3nGNp91KS+SuXiYuj/7+NSI6gs+XnJXG66OcMyg97PFP7
 XUJUxK3CsRIU+2vijiSyaCBskyk4Sas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-dJEROIWTN8msdJzPtL-OeQ-1; Thu, 04 Feb 2021 06:25:12 -0500
X-MC-Unique: dJEROIWTN8msdJzPtL-OeQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BC2A801964;
 Thu,  4 Feb 2021 11:25:10 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-112.ams2.redhat.com [10.36.112.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05A4A5D762;
 Thu,  4 Feb 2021 11:25:07 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 resend 01/13] mfd: arizona: Drop arizona-extcon cells
Date: Thu,  4 Feb 2021 12:24:50 +0100
Message-Id: <20210204112502.88362-2-hdegoede@redhat.com>
In-Reply-To: <20210204112502.88362-1-hdegoede@redhat.com>
References: <20210204112502.88362-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>
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
2.29.2

