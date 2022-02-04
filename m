Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B16BE4AC19B
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 15:47:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3982C1865;
	Mon,  7 Feb 2022 15:47:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3982C1865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644245279;
	bh=ZmTmZMCJMUQpHv0YIgLVACm1R/nnjIbYCmtniuvhL7I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dXDK04LrViecKIHuxUWrjz+hfiuOO3j+k2BAD1OhrCOXWaJ1LKUocS9XKDXXFK4zr
	 k0qXD7uLrmC97zPia7pd5POhHxNJ7uu2POrOq5evbQQ5i7DLKdlTotYCCQnNTyMy7y
	 abPK5aYNrkSW8wYYlO0mBQCB3H4wTAg8ZB+uObhU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49C0DF8051D;
	Mon,  7 Feb 2022 15:45:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5122DF80310; Fri,  4 Feb 2022 10:53:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E45F3F80083
 for <alsa-devel@alsa-project.org>; Fri,  4 Feb 2022 10:53:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E45F3F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="WDUvnWec"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1643968390; bh=LuyZYQHYhM7mDbz1CL5RgnP3xYkRgZlDQNSvjNOXph4=;
 h=From:To:Cc:Subject:Date;
 b=WDUvnWecUmePdGih1J3vLtPXuIautd/TGo6FSlu9tdW2q4LP4WNyBgGI0x77v3oD7
 p2/9r57QXimsxwnaphJrB+0BkHOCLIy+GxmB5AfdYvbvwnW/mQr7Jg15WAKvQLEOkf
 1riKOCdTsR5pDs6+I2CqvzNj7sj0SUXKPugxqpc8=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] ASoC: tas2770: Insert post reset delay
Date: Fri,  4 Feb 2022 10:53:01 +0100
Message-Id: <20220204095301.5554-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 07 Feb 2022 15:45:24 +0100
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Frank Shi <shifu0704@thundersoft.com>,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Ye Bin <yebin10@huawei.com>
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

Per TAS2770 datasheet there must be a 1 ms delay from reset to first
command. So insert delays into the driver where appropriate.

Fixes: 1a476abc723e ("tas2770: add tas2770 smart PA kernel driver")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
In previous submission of this patch some people got their copy
encrypted. That was by accident, pardon that. I have changed my email
provider since.

v1: https://lore.kernel.org/alsa-devel/20220201234612.74401-1-povik+lin@protonmail.com/

 sound/soc/codecs/tas2770.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index b52c0861edc8..b397a2122dd4 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -38,10 +38,12 @@ static void tas2770_reset(struct tas2770_priv *tas2770)
 		gpiod_set_value_cansleep(tas2770->reset_gpio, 0);
 		msleep(20);
 		gpiod_set_value_cansleep(tas2770->reset_gpio, 1);
+		usleep_range(1000, 2000);
 	}
 
 	snd_soc_component_write(tas2770->component, TAS2770_SW_RST,
 		TAS2770_RST);
+	usleep_range(1000, 2000);
 }
 
 static int tas2770_set_bias_level(struct snd_soc_component *component,
@@ -110,6 +112,7 @@ static int tas2770_codec_resume(struct snd_soc_component *component)
 
 	if (tas2770->sdz_gpio) {
 		gpiod_set_value_cansleep(tas2770->sdz_gpio, 1);
+		usleep_range(1000, 2000);
 	} else {
 		ret = snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
 						    TAS2770_PWR_CTRL_MASK,
@@ -529,8 +532,10 @@ static int tas2770_codec_probe(struct snd_soc_component *component)
 
 	tas2770->component = component;
 
-	if (tas2770->sdz_gpio)
+	if (tas2770->sdz_gpio) {
 		gpiod_set_value_cansleep(tas2770->sdz_gpio, 1);
+		usleep_range(1000, 2000);
+	}
 
 	tas2770_reset(tas2770);
 
-- 
2.33.0

