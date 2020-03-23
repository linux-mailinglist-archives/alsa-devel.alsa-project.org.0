Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4577918FDCB
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 20:38:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4A301614;
	Mon, 23 Mar 2020 20:37:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4A301614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584992305;
	bh=a8tCa/RBRjAsWpjAPWNMMwFREqgwfaMTJ0BFk6KhbcQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ctvea/3ZiMCHF7g/+k7u7rrQH/OtLm3aQfhxfxUC+RgfRowiNmJnulPl8CJCXIRP7
	 6GhDc8KBIGQ2/91ub7v4QpsbYYoVFavjSUenr5VGYCfNjG0fUckrka6ydXGLkY8Irj
	 CKqVXM4T69v4QwS02DlHSmHlXqk66Vk6jEHX/NWE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7F62F80158;
	Mon, 23 Mar 2020 20:36:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AD03F80158; Mon, 23 Mar 2020 20:36:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEE13F800B9
 for <alsa-devel@alsa-project.org>; Mon, 23 Mar 2020 20:36:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEE13F800B9
IronPort-SDR: q6l5Cbw2PaL6aQ91sBcusmhwt03ZjWsicPS7uqimElp4hQmd94n//r1HArhlVd9TgCnZ79A22j
 OMmNmOcUflEA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2020 12:36:34 -0700
IronPort-SDR: r117I0PqTTPRO++F03Fin58n7uUf3WMq/yGtziLeJPj3+0plZpFaTmfbhNmORI1yooniyINBMe
 Eklq5efP11lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,297,1580803200"; d="scan'208";a="249735086"
Received: from ykim11-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.34.170])
 by orsmga006.jf.intel.com with ESMTP; 23 Mar 2020 12:36:33 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: core: sysfs: show components string
Date: Mon, 23 Mar 2020 14:36:23 -0500
Message-Id: <20200323193623.3587-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Add attribute and show the components string. This is useful to see
what is provided to userspace and e.g. used by UCM to understand the
card configuration:

root@plb:~# more /sys/class/sound/card0/components
HDA:8086280b,80860101,00100000 cfg-spk:2 hs:rt711 spk:rt1308 mic:rt715

Note that the style uses what's recommended by checkpatch.pl and is
slightly different from other sysfs attributes.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/core/init.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/core/init.c b/sound/core/init.c
index b02a99766351..decaf944a8ad 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -695,9 +695,21 @@ card_number_show_attr(struct device *dev,
 
 static DEVICE_ATTR(number, 0444, card_number_show_attr, NULL);
 
+static ssize_t
+components_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct snd_card *card = container_of(dev, struct snd_card, card_dev);
+
+	return scnprintf(buf, PAGE_SIZE, "%s\n", card->components);
+}
+
+static DEVICE_ATTR_RO(components);
+
 static struct attribute *card_dev_attrs[] = {
 	&dev_attr_id.attr,
 	&dev_attr_number.attr,
+	&dev_attr_components.attr,
 	NULL
 };
 
-- 
2.20.1

