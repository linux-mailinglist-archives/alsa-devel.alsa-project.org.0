Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A373F79E347
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 11:14:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27E7993A;
	Wed, 13 Sep 2023 11:13:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27E7993A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694596470;
	bh=VG6V4ukHC529W2hH3FCZgm6FniJtv+CyYtQ7+HR3P5s=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nh6FLSgEo9UMzBchsoRw2h7IQLOt7IUVCCchOh1lruTwTgVfrKjL8lO/TR21M7fGV
	 dgbFNBJFZvZLg8pvrqcShajBnnyr119uv9umgAIRI076s79EpeRwCY4nZhZyEn3F/b
	 ZQBVdeiIvW5diYJU5TE2bD3/JE4tYx86qIbvRNhg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F7F1F80246; Wed, 13 Sep 2023 11:13:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 407C7F80246;
	Wed, 13 Sep 2023 11:13:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5DF9F80425; Wed, 13 Sep 2023 11:13:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94F4BF801F5
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 11:13:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94F4BF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fx1adWBz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694596409; x=1726132409;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VG6V4ukHC529W2hH3FCZgm6FniJtv+CyYtQ7+HR3P5s=;
  b=fx1adWBzFmqW/Ocs+5wyJ+KWdZuGloUPIP/s8N0QAMZ461mA0TM0DlpN
   6ZRcAohYuDh2nMvZE42mdGxRZqHT7OyKhIYBcKIos/9SE/FxLY3FfCTLB
   9AYGjoDtSk3QOCbzV9l27l5/JdyEWuIVGzmaborAxgxA9VGYFW43kkAUz
   vWhFTyTn358JtEZNMOZxIYOgUkb739CTJpc2lU9JNc+MvdZAKQsAdQXY6
   CIx/xRtdAxBy4NvhBad6tSkzY1+/lQyfgRkGAFnfH+E4Ff/Ay8Ziu7bQs
   ajmkkoftxSUD9J13TH6jDecKpJkJ6vRMMaKUfpkgKE57gxt59KaJwIz9K
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="378519728"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000";
   d="scan'208";a="378519728"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 02:13:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="737420904"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000";
   d="scan'208";a="737420904"
Received: from mduman-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.48.209])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 02:13:20 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	pierre-louis.bossart@linux.intel.com,
	tiwai@suse.com,
	perex@perex.cz,
	arnd@arndb.de
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	masahiroy@kernel.org
Subject: [PATCH] ASoC: hdac_hdmi: Remove temporary string use in
 create_fill_jack_kcontrols
Date: Wed, 13 Sep 2023 12:13:25 +0300
Message-ID: <20230913091325.16877-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KEVTPCTFFUGUSILIW6WOBU4Q5UF2BSJW
X-Message-ID-Hash: KEVTPCTFFUGUSILIW6WOBU4Q5UF2BSJW
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KEVTPCTFFUGUSILIW6WOBU4Q5UF2BSJW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is no need to use temporary strings to construct the kcontrol names,
devm_kasprintf can be used to replace the snprintf + devm_kstrdup pairs.

This change will also fixes the following compiler warning/error (W=1):

sound/soc/codecs/hdac_hdmi.c: In function ‘hdac_hdmi_jack_port_init’:
sound/soc/codecs/hdac_hdmi.c:1793:63: error: ‘ Switch’ directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Werror=format-truncation=]
 1793 |                         snprintf(kc_name, sizeof(kc_name), "%s Switch", xname);
      |                                                               ^~~~~~~
In function ‘create_fill_jack_kcontrols’,
    inlined from ‘hdac_hdmi_jack_port_init’ at sound/soc/codecs/hdac_hdmi.c:1871:8:
sound/soc/codecs/hdac_hdmi.c:1793:25: note: ‘snprintf’ output between 8 and 39 bytes into a destination of size 32
 1793 |                         snprintf(kc_name, sizeof(kc_name), "%s Switch", xname);
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

The warnings got brought to light by a recent patch upstream:
commit 6d4ab2e97dcf ("extrawarn: enable format and stringop overflow warnings in W=1")

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/codecs/hdac_hdmi.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 8b6b76029694..b9c5ffbfb5ba 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -1771,7 +1771,6 @@ static int create_fill_jack_kcontrols(struct snd_soc_card *card,
 {
 	struct hdac_hdmi_pin *pin;
 	struct snd_kcontrol_new *kc;
-	char kc_name[NAME_SIZE], xname[NAME_SIZE];
 	char *name;
 	int i = 0, j;
 	struct hdac_hdmi_priv *hdmi = hdev_to_hdmi_priv(hdev);
@@ -1785,14 +1784,14 @@ static int create_fill_jack_kcontrols(struct snd_soc_card *card,
 
 	list_for_each_entry(pin, &hdmi->pin_list, head) {
 		for (j = 0; j < pin->num_ports; j++) {
-			snprintf(xname, sizeof(xname), "hif%d-%d Jack",
-						pin->nid, pin->ports[j].id);
-			name = devm_kstrdup(component->dev, xname, GFP_KERNEL);
+			name = devm_kasprintf(component->dev, GFP_KERNEL,
+					      "hif%d-%d Jack",
+					      pin->nid, pin->ports[j].id);
 			if (!name)
 				return -ENOMEM;
-			snprintf(kc_name, sizeof(kc_name), "%s Switch", xname);
-			kc[i].name = devm_kstrdup(component->dev, kc_name,
-							GFP_KERNEL);
+
+			kc[i].name = devm_kasprintf(component->dev, GFP_KERNEL,
+						    "%s Switch", name);
 			if (!kc[i].name)
 				return -ENOMEM;
 
-- 
2.42.0

