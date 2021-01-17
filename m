Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 294DD2F93D1
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Jan 2021 17:10:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECF441746;
	Sun, 17 Jan 2021 17:09:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECF441746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610899820;
	bh=XGXNZmMq8ksYf8KV0ggzwfe34OMPZJlkaJsv1KjhaKE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R4ACKD+amRBUaz8M/nJdWjZ5aTf91O3KZg5A6RBhQTkBM/Aq/t8KKBL/nJ22ai/oI
	 PRWnKTW7cunaAO6+NfAaAxMq6Hv9TBSG/xR9zk3fEVztYEOKJ7F8+gljGNDVakNYcZ
	 /SyDjK8yn5TIn1e/uoeo8HiAsH09YifGDdywS1c4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 840DCF804FB;
	Sun, 17 Jan 2021 17:06:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 029AEF804AD; Sun, 17 Jan 2021 17:06:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F929F804AD
 for <alsa-devel@alsa-project.org>; Sun, 17 Jan 2021 17:06:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F929F804AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="DLCvI89u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610899581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K2NIAqXzGtQ/Yp3TOL6d0KvlJeXz5Ru34NUuOvZJFWg=;
 b=DLCvI89u9eraQZ1ClbOmaxsxVXv8IUmPsAg5OmkaTjvyOkZSXNr3IAjChVqSr4Da1WR9nu
 TvGtcz327q/I/IjfsbAEjwn3vhVxFpjjmXKrevcYXB06scSwHQCDU5UMLndc+KsDf5qnQa
 LU9kiaWPpndw1dzr6/U4AcZAtV+6ZyY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-8sToW1UyPSGP499UDrA6oA-1; Sun, 17 Jan 2021 11:06:19 -0500
X-MC-Unique: 8sToW1UyPSGP499UDrA6oA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBF03806661;
 Sun, 17 Jan 2021 16:06:17 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D7065C266;
 Sun, 17 Jan 2021 16:06:15 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 05/12] ASoC: arizona-jack: Fix flags parameter to the
 gpiod_get("wlf, micd-pol") call
Date: Sun, 17 Jan 2021 17:05:48 +0100
Message-Id: <20210117160555.78376-6-hdegoede@redhat.com>
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

The initial value of the GPIO should match the info->micd_modes[0].gpio
value. arizona_extcon_probe() already stores the necessary flag in a
mode variable, but instead of passing mode as flags to the gpiod_get()
it was using a hardcoded GPIOD_OUT_LOW.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/arizona-jack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index 76aacbac5869..72d23b15108c 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -1510,7 +1510,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 		 */
 		info->micd_pol_gpio = gpiod_get_optional(arizona->dev,
 							 "wlf,micd-pol",
-							 GPIOD_OUT_LOW);
+							 mode);
 		if (IS_ERR(info->micd_pol_gpio)) {
 			ret = PTR_ERR(info->micd_pol_gpio);
 			dev_err(arizona->dev,
-- 
2.28.0

