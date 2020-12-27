Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D432E32C0
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Dec 2020 22:14:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB858173E;
	Sun, 27 Dec 2020 22:13:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB858173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609103673;
	bh=ZGayqt2MdlT/EgXzClZD+4CtncCt9VspuiiPHxj5yXI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gsj/43Me4RkIL1hCyyq367gbkLmKKdmG2AwEhkn4N+ZYkk5A+xrctUpfc6SOaXExA
	 udEGEDzAy9MTNkF8iyR54IA8gesz6jccPQXBy9J+vPIiok5Lwg1nRvhLZPuVCg7tir
	 mUQqii7zB/YEW5lttQtNziDnK22QPiWE0ojsAwWA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08B63F800C8;
	Sun, 27 Dec 2020 22:12:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36623F80276; Sun, 27 Dec 2020 22:12:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12369F80085
 for <alsa-devel@alsa-project.org>; Sun, 27 Dec 2020 22:12:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12369F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="dWZ5HG5W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609103565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h6DblsvkQcBaI8Wi2z8PNad4xomPrNWUmS5lSu1NYpw=;
 b=dWZ5HG5Wk9OQ3JcXlUX0PLDAET/GnHInPVElBRXpz26HoGlzbm0jL22E3Ry3iqZT3cVEEf
 Ayz/+wBOdgl+X37kJsiOVr003h73/yOHe0W3hBkihw59aiTytaKZwLIgkv2fC+BKgobOu2
 fIPenTWg27MxC+OmlnPA2dUz0/Ahlks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-mPobGU11NJ-A6I5uw4mowA-1; Sun, 27 Dec 2020 16:12:40 -0500
X-MC-Unique: mPobGU11NJ-A6I5uw4mowA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9B03E75A;
 Sun, 27 Dec 2020 21:12:38 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-25.ams2.redhat.com [10.36.112.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B069C62A24;
 Sun, 27 Dec 2020 21:12:36 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 01/14] mfd: arizona: Add jack pointer to struct arizona
Date: Sun, 27 Dec 2020 22:12:19 +0100
Message-Id: <20201227211232.117801-2-hdegoede@redhat.com>
In-Reply-To: <20201227211232.117801-1-hdegoede@redhat.com>
References: <20201227211232.117801-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
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

The Linux Arizona driver uses the MFD framework to create several
sub-devices for the Arizona codec and then uses a driver per function.

The jack-detect support for the Arizona codec is handled by the
extcon-arizona driver. This driver exports info about the jack state
to userspace through the standard extcon sysfs class interface.

But standard Linux userspace does not monitor/use the extcon sysfs
interface for jack-detection.

Add a jack pointer to the shared arizona data struct, this allows
the ASoC machine driver to create a snd_soc_jack and then pass this
to the extcon-arizona driver to report jack-detect state, so that
jack-detection works with standard Linux userspace.

The extcon-arizona code already depends on (waits for with -EPROBE_DEFER)
the snd_card being registered by the machine driver, so this does not
cause any ordering issues.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 include/linux/mfd/arizona/core.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/mfd/arizona/core.h b/include/linux/mfd/arizona/core.h
index 6d6f96b2b29f..5eb269bdbfcb 100644
--- a/include/linux/mfd/arizona/core.h
+++ b/include/linux/mfd/arizona/core.h
@@ -115,6 +115,7 @@ enum arizona_type {
 #define ARIZONA_NUM_IRQ                   75
 
 struct snd_soc_dapm_context;
+struct snd_soc_jack;
 
 struct arizona {
 	struct regmap *regmap;
@@ -148,6 +149,7 @@ struct arizona {
 	bool ctrlif_error;
 
 	struct snd_soc_dapm_context *dapm;
+	struct snd_soc_jack *jack;
 
 	int tdm_width[ARIZONA_MAX_AIF];
 	int tdm_slots[ARIZONA_MAX_AIF];
-- 
2.28.0

