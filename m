Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC452BB037
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 17:26:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7848917BB;
	Fri, 20 Nov 2020 17:25:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7848917BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605889560;
	bh=pvhn0QCdCkvGGSKnk7s/3kCGaDX+MblFh4AacTU7+js=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mdEz+GkZt3HUGMPnwf8BpLEOMRjsWMWbzqm/iH65LIKRBNSjbDlWQLI9OjwuXoyAC
	 tnvvhDwSZ96HQdYZAohjWHc/NlEgRi8PZldO3l+nt4P5A7vOZh6UBL3hg1sFKs2AWJ
	 LquaxCMxG7+/Qb5N4s8Z3UtBdUwE9A2OJK7jM0qc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD32EF8054A;
	Fri, 20 Nov 2020 17:18:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1922F80543; Fri, 20 Nov 2020 17:18:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B268F8053B
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 17:18:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B268F8053B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oZiW0oks"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 58E8824181;
 Fri, 20 Nov 2020 16:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605889126;
 bh=pvhn0QCdCkvGGSKnk7s/3kCGaDX+MblFh4AacTU7+js=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oZiW0oksOFuOn5yQIXcKJJ/KhsMzfZMlndCWn7h4QqM+peJL3sDwMvCwtBB5lryaE
 +nh8j7LRGi2n2QT25hPn6TN5Vq/G6bBys1JrZ6QPIcfHhJDic1Rd0euDP2kCcclYPd
 3UkTjcq164nq9agKNi5bMpEbqtxxDOLsjFivSiqA=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Subject: [PATCH 18/38] ASoC: da9055: skip of_device_id table when !CONFIG_OF
Date: Fri, 20 Nov 2020 17:16:32 +0100
Message-Id: <20201120161653.445521-18-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120161653.445521-1-krzk@kernel.org>
References: <20201120161653.445521-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
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

The driver can match by multiple methods.  Its of_device_id table is
referenced via of_match_ptr() so it will be unused for !CONFIG_OF
builds:

  sound/soc/codecs/da9055.c:1522:34: warning: ‘da9055_of_match’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/codecs/da9055.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/da9055.c b/sound/soc/codecs/da9055.c
index b0d9ca6de685..aed92f615b02 100644
--- a/sound/soc/codecs/da9055.c
+++ b/sound/soc/codecs/da9055.c
@@ -1519,11 +1519,13 @@ static const struct i2c_device_id da9055_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, da9055_i2c_id);
 
+#ifdef CONFIG_OF
 static const struct of_device_id da9055_of_match[] = {
 	{ .compatible = "dlg,da9055-codec", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, da9055_of_match);
+#endif
 
 /* I2C codec control layer */
 static struct i2c_driver da9055_i2c_driver = {
-- 
2.25.1

