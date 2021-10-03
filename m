Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B411F4201B0
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Oct 2021 15:24:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 041BC169B;
	Sun,  3 Oct 2021 15:24:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 041BC169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633267493;
	bh=n3hmngqel1Te10LDUKqpc8m8uN5zGOMjAnEiFKUAn20=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PAL640qFxDh7bGOyJOtfiNTXQ+wUQlDNS9Mt8sDGyV4pbKMPkAid7R/ZC+0X4+j8X
	 RRPYfXM8897/J6GoejiEup3PEqz0FVMe+nGzLqxCSZU/gaqeJe4NS6GbdwyAC5GILI
	 RssnRkwQMneCxQpjm8XA4H5kSs34TbAk72q1ppfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFBA6F804BD;
	Sun,  3 Oct 2021 15:23:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C723F804BB; Sun,  3 Oct 2021 15:23:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68B54F800ED
 for <alsa-devel@alsa-project.org>; Sun,  3 Oct 2021 15:23:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68B54F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="DlTBSCp2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633267383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yNCRNQP+uavnE1XmO1l+SsZtZq4/llL1p54XSzhoCO0=;
 b=DlTBSCp2eQK3LQ88ncmqbNm0NL56L4POg4mOhLnO4tbw6UeSJAOX8tc7xlbFq4TdRq5yUP
 BQwAGD4WgzH5I6/rZ/3h+F24knVX4bCl5JR6SYCSEgR3la4XlVkCW+gtGP0eeU/kyQ4EHQ
 6z6P53faJqzJepaTJ+3fT939iJg44uI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-tI79bbusMD6NauaB4bZtqQ-1; Sun, 03 Oct 2021 09:23:00 -0400
X-MC-Unique: tI79bbusMD6NauaB4bZtqQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2348F180830E;
 Sun,  3 Oct 2021 13:22:59 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 395B15D9DE;
 Sun,  3 Oct 2021 13:22:58 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: rt5651: Use IRQF_NO_AUTOEN when requesting the IRQ
Date: Sun,  3 Oct 2021 15:22:55 +0200
Message-Id: <20211003132255.31743-2-hdegoede@redhat.com>
In-Reply-To: <20211003132255.31743-1-hdegoede@redhat.com>
References: <20211003132255.31743-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
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

Use the new IRQF_NO_AUTOEN flag when requesting the IRQ, rather then
disabling it immediately after requesting it.

This fixes a possible race where the IRQ might trigger between requesting
and disabling it; and this also leads to a small code cleanup.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5651.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt5651.c b/sound/soc/codecs/rt5651.c
index fc0c83b73f09..93820561b9f5 100644
--- a/sound/soc/codecs/rt5651.c
+++ b/sound/soc/codecs/rt5651.c
@@ -2261,11 +2261,8 @@ static int rt5651_i2c_probe(struct i2c_client *i2c,
 
 	ret = devm_request_irq(&i2c->dev, rt5651->irq, rt5651_irq,
 			       IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
-			       | IRQF_ONESHOT, "rt5651", rt5651);
-	if (ret == 0) {
-		/* Gets re-enabled by rt5651_set_jack() */
-		disable_irq(rt5651->irq);
-	} else {
+			       | IRQF_ONESHOT | IRQF_NO_AUTOEN, "rt5651", rt5651);
+	if (ret) {
 		dev_warn(&i2c->dev, "Failed to reguest IRQ %d: %d\n",
 			 rt5651->irq, ret);
 		rt5651->irq = -ENXIO;
-- 
2.31.1

