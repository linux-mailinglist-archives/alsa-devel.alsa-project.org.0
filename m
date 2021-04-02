Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B574352B41
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Apr 2021 16:11:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A208F16B0;
	Fri,  2 Apr 2021 16:10:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A208F16B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617372682;
	bh=9KZwjtLzdtkq/bkCcPkhFzfYzicgPXD2aMCgQwZ+Egg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D6aR4A5FU2czfaDCNWOww6ASp/mpAzGKAqZeRtGkvcwT9VQFf9I9XBhAnt35MLVaO
	 HKon4U2s99uwJj/qbsmYNPHPjh2Y2oaRjkdKortgqvBoGZIA8sWP+6DgZqNptph1JI
	 tHdniMjLuq31YkjrW8tYBaD51/OcW1HS70RKJYfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8D0BF804AE;
	Fri,  2 Apr 2021 16:08:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9C99F80430; Fri,  2 Apr 2021 16:08:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63789F800F5
 for <alsa-devel@alsa-project.org>; Fri,  2 Apr 2021 16:08:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63789F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="ChyedQaM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617372486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yupgr+dPktl52RsV/7IIxREVkeDIuIOkdDo+dkoT+pw=;
 b=ChyedQaMs6I7Yxmq2SnW8CfBj6Fqxk/5NKcyCTBVMwop+w43AjbG0S5mTyZ/h3Xvk3A6LC
 clIaqdjK931In7oWP3l+Y4KCvccBNc369VtGVzrwz65doOtBl9OfPlAO/5CAHJZIjrlcEf
 12luN983QZK2MYod4zfiFPCI2AQd8vE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-2J55ykNWOBKyIPX8h3aIHA-1; Fri, 02 Apr 2021 10:08:05 -0400
X-MC-Unique: 2J55ykNWOBKyIPX8h3aIHA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B780F180FCA1;
 Fri,  2 Apr 2021 14:08:03 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-163.ams2.redhat.com
 [10.36.112.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10DA710023B2;
 Fri,  2 Apr 2021 14:08:01 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH 5/6] ASoC: rt5670: Add a rt5670_components() helper
Date: Fri,  2 Apr 2021 16:07:46 +0200
Message-Id: <20210402140747.174716-6-hdegoede@redhat.com>
In-Reply-To: <20210402140747.174716-1-hdegoede@redhat.com>
References: <20210402140747.174716-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Oder Chiou <oder_chiou@realtek.com>, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org, Bard Liao <bard.liao@intel.com>
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

The rt5670 codec driver uses DMI quirks to configure the DMIC data-pins,
which means that it knows which DMIC interface is used on a specific
device.

ATM we duplicate this DMI matching inside the UCM profiles to select
the right DMIC interface. Add a rt5670_components() helper which the
machine-driver can use to set the components string of the card so
that UCM can get the info from the components string.

This way we only need to add new DMI quirks in one place.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5670.c | 39 +++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/rt5670.h |  2 ++
 2 files changed, 41 insertions(+)

diff --git a/sound/soc/codecs/rt5670.c b/sound/soc/codecs/rt5670.c
index dd69d874bad2..db7b33e8ce8a 100644
--- a/sound/soc/codecs/rt5670.c
+++ b/sound/soc/codecs/rt5670.c
@@ -3007,6 +3007,45 @@ static const struct dmi_system_id dmi_platform_intel_quirks[] = {
 	{}
 };
 
+const char *rt5670_components(void)
+{
+	unsigned long quirk;
+	bool dmic1 = false;
+	bool dmic2 = false;
+	bool dmic3 = false;
+
+	if (quirk_override) {
+		quirk = quirk_override;
+	} else {
+		dmi_check_system(dmi_platform_intel_quirks);
+		quirk = rt5670_quirk;
+	}
+
+	if ((quirk & RT5670_DMIC1_IN2P) ||
+	    (quirk & RT5670_DMIC1_GPIO6) ||
+	    (quirk & RT5670_DMIC1_GPIO7))
+		dmic1 = true;
+
+	if ((quirk & RT5670_DMIC2_INR) ||
+	    (quirk & RT5670_DMIC2_GPIO8))
+		dmic2 = true;
+
+	if (quirk & RT5670_DMIC3_GPIO5)
+		dmic3 = true;
+
+	if (dmic1 && dmic2)
+		return "cfg-spk:2 cfg-mic:dmics12";
+	else if (dmic1)
+		return "cfg-spk:2 cfg-mic:dmic1";
+	else if (dmic2)
+		return "cfg-spk:2 cfg-mic:dmic2";
+	else if (dmic3)
+		return "cfg-spk:2 cfg-mic:dmic3";
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(rt5670_components);
+
 static int rt5670_i2c_probe(struct i2c_client *i2c,
 		    const struct i2c_device_id *id)
 {
diff --git a/sound/soc/codecs/rt5670.h b/sound/soc/codecs/rt5670.h
index 6fb3c369ee98..5b230897f630 100644
--- a/sound/soc/codecs/rt5670.h
+++ b/sound/soc/codecs/rt5670.h
@@ -2024,4 +2024,6 @@ void rt5670_jack_suspend(struct snd_soc_component *component);
 void rt5670_jack_resume(struct snd_soc_component *component);
 int rt5670_set_jack_detect(struct snd_soc_component *component,
 	struct snd_soc_jack *jack);
+const char *rt5670_components(void);
+
 #endif /* __RT5670_H__ */
-- 
2.30.2

