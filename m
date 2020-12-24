Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9A52E25DD
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Dec 2020 11:12:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47996181D;
	Thu, 24 Dec 2020 11:11:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47996181D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608804755;
	bh=jk84C/gXQWfSxwyZv4u6KNqaDONhowMuJ49YJKX+Ulw=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aBA/OgrlYAKpTKmQ7Nu3oIr/I2mLW9JGlJ5qt2JqDaB+ff9YHNwR0eeVc4JpdrYyr
	 JZSHsBesNZqzCaOKVaxcfmuX7LzR0ds3nQvT3fYLPVmiVMhSiXtu7jSYHJSl2VHe6h
	 do+9iFYo4x2q4XcS/XUbEuo812NSPLd5y9+ZmxuA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0E19F80232;
	Thu, 24 Dec 2020 11:10:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E08ADF80224; Thu, 24 Dec 2020 11:10:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B0BBF800CE
 for <alsa-devel@alsa-project.org>; Thu, 24 Dec 2020 11:10:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B0BBF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="IAfGl7dJ"
Received: by mail-yb1-xb49.google.com with SMTP id 203so2759408ybz.2
 for <alsa-devel@alsa-project.org>; Thu, 24 Dec 2020 02:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=44xpjyIWO8+cSQsl8sUCjKTlG4ZYpbwWNLTOsieSCR8=;
 b=IAfGl7dJmxrqV5q83CiHobNeG3M7YaBWv8dF48XXDDlloDwUC8PDJ1K/ajvVbAEHXs
 ATQWk7KA94GuZDC6a5wlJ7jqfs9aJEnQxvejMPXWgryk3u9zaZvqKJ9GBZ3enugg2yec
 /aoaAwFo2xa/yRD6cO6hX0cVsnXH5XdbnO4LnOV3quV6k6nc/qCAnlsPnOd4a62iMFEa
 kPaMT870tJkwX7Enl+5uCRDfxB+bErBJdLGh134U0CJEazI1nzhLQA/e7Md2IKMx0D3B
 02UNxkoRQB1msySuBWzf/1IYrg04Kza0BQefYUDzErwW0jlM7BtGGPPWfWZzCCVmliaN
 j/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=44xpjyIWO8+cSQsl8sUCjKTlG4ZYpbwWNLTOsieSCR8=;
 b=LAjf+dBchxHaOvRszLte03y0wEx0t4Hn28sp8PYaGKzY07eWOhzmMcvbadT3UhB6T8
 wMBDB5T4w5Ycw/r9pgs1v53EXGqxalbCgnwdeobK76QrJKiUvby6uRnTL14RhwMeErVP
 cJ42M+PTvdztswi/pUlft/4culVU6jYph/cLNtyY3g0jA8VpUWC3hoaJPz9SnK1/PTIH
 S8n8YXAkaT4nOJh7mSPDvA39Vn5rZ538bXIcyL9QOdclrjx9iz1HEjC9PIAupoIzxQfq
 oo5PVIpJNw745JFBvfIaMfoXZf2aVSnoewcVyWV5ESN65JBwUR1iGX3pWVFd+B0OIyRv
 CbBg==
X-Gm-Message-State: AOAM531zIxjBzLnUSbZZPnSCLbUjRDrhWk/yI/Gp9c7D69j93g1q7KEu
 zKQsX6CzjW2m8W54tVrsqefARpHgQtz5
X-Google-Smtp-Source: ABdhPJymcBipq7mmJtBZJbak2YhH6BS5uByqLGVhdsp4SXFyz82ZL9cW2iBXjxPZNxpmZW5IbVpaLnLP2V0+
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a25:318b:: with SMTP id
 x133mr39671234ybx.201.1608804650262; Thu, 24 Dec 2020 02:10:50 -0800 (PST)
Date: Thu, 24 Dec 2020 18:10:34 +0800
Message-Id: <20201224101034.3018244-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH] ASoC: rt1015: reset cali_done when suspending
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
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

Assuming the calibration state gets lost after system suspend.  Resets
cali_done when suspending.

The rt1015_priv is alloced by kzalloc.  No need to initialize cali_done
to 0 in component probe callback.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
The idea inspired from previous discussion:
(https://mailman.alsa-project.org/pipermail/alsa-devel/2020-December/178229.html)

The device could lose the calibration state after suspend/resume.  It
is better to reset the flag and get chance to calibrate again.

The patch applies after the series:
https://mailman.alsa-project.org/pipermail/alsa-devel/2020-December/178608.html

 sound/soc/codecs/rt1015.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index 4a9e2eaebe30..2dcb7b0fba60 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -1055,7 +1055,6 @@ static int rt1015_probe(struct snd_soc_component *component)
 
 	rt1015->component = component;
 	rt1015->bclk_ratio = 0;
-	rt1015->cali_done = 0;
 
 	INIT_DELAYED_WORK(&rt1015->flush_work, rt1015_flush_work);
 
@@ -1103,6 +1102,7 @@ static int rt1015_suspend(struct snd_soc_component *component)
 
 	regcache_cache_only(rt1015->regmap, true);
 	regcache_mark_dirty(rt1015->regmap);
+	rt1015->cali_done = 0;
 
 	return 0;
 }
-- 
2.29.2.729.g45daf8777d-goog

