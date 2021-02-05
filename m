Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D8F312003
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Feb 2021 21:41:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23593850;
	Sat,  6 Feb 2021 21:40:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23593850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612644097;
	bh=uT2XLMLZ2CoDWQOWMy9SNYn2r/8XmfqFjH0xs74UJTg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=T5cQGPDxiXzy8SzRFs5WxD/nj8i7vTlCke40RdMqTlUGTU1xK3xYDZGMbcoFDzNxr
	 rQAfVl2K1MYFKqa1UuSrGE58uT6uAdctETOYb3t9fkmuv5DT+m9hvjjRB30PkLZAB3
	 LWn86NvnstcAiDAkQbqcsAD+wFsHvCur/IDBY++k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFAA4F802E0;
	Sat,  6 Feb 2021 21:39:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58564F8015A; Fri,  5 Feb 2021 14:09:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from antares.kleine-koenig.org (antares.kleine-koenig.org
 [IPv6:2a01:4f8:c0c:3a97::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5CDAF80152
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 14:08:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5CDAF80152
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
 id D67A7AED6A1; Fri,  5 Feb 2021 14:08:50 +0100 (CET)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] coresight: etm4x: Fix merge resolution for amba rework
Date: Fri,  5 Feb 2021 14:08:47 +0100
Message-Id: <20210205130848.20009-1-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 06 Feb 2021 21:39:03 +0100
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Cornelia Huck <cohuck@redhat.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Linus Walleij <linus.walleij@linaro.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Eric Anholt <eric@anholt.net>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig.org@pengutronix.de>,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-rtc@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, Guenter Roeck <linux@roeck-us.net>,
 Mike Leach <mike.leach@linaro.org>, linux-watchdog@vger.kernel.org,
 alsa-devel@alsa-project.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 coresight@lists.linaro.org, Vladimir Zapolskiy <vz@mleia.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Matt Mackall <mpm@selenic.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dan Williams <dan.j.williams@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Leo Yan <leo.yan@linaro.org>, dmaengine@vger.kernel.org
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

This was non-trivial to get right because commits
c23bc382ef0e ("coresight: etm4x: Refactor probing routine") and
5214b563588e ("coresight: etm4x: Add support for sysreg only devices")
changed the code flow considerably. With this change the driver can be
built again.

Fixes: 0573d3fa4864 ("Merge branch 'devel-stable' of git://git.armlinux.org.uk/~rmk/linux-arm into char-misc-next")
Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
On Fri, Feb 05, 2021 at 12:07:09PM +0100, Greg Kroah-Hartman wrote:
> On Fri, Feb 05, 2021 at 11:56:15AM +0100, Uwe Kleine-König wrote:
> > I didn't compile test, but I'm willing to bet your resolution is wrong.
> > You have no return statement in etm4_remove_dev() but its return type is
> > int and etm4_remove_amba() still returns int but should return void.
> 
> Can you send a patch to fix this up?

Sure, here it comes. As I'm unsure if you want to squash it into the
merge or want to keep it separate I crafted a commit message. If you
prefer squashing feel free to do so.

This change corresponds to the merge resolution I suggested before.

Best regards
Uwe

 drivers/hwtracing/coresight/coresight-etm4x-core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index bc55b261af23..c8ecd91e289e 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1906,15 +1906,16 @@ static int __exit etm4_remove_dev(struct etmv4_drvdata *drvdata)
 	cpus_read_unlock();
 
 	coresight_unregister(drvdata->csdev);
+
+	return 0;
 }
 
-static int __exit etm4_remove_amba(struct amba_device *adev)
+static void __exit etm4_remove_amba(struct amba_device *adev)
 {
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(&adev->dev);
 
 	if (drvdata)
-		return etm4_remove_dev(drvdata);
-	return 0;
+		etm4_remove_dev(drvdata);
 }
 
 static int __exit etm4_remove_platform_dev(struct platform_device *pdev)
-- 
2.29.2

