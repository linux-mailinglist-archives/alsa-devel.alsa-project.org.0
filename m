Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C99527710D7
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Aug 2023 19:15:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE8257F8;
	Sat,  5 Aug 2023 19:14:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE8257F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691255748;
	bh=tMsDQWGArCqYUz25h05k2PlnQuKp5Pp7E5yrwUxhMCA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=q2O3+ZohSaRsoexDprgJKTEYUGlIpBmZoFKwvi/CxHIoCsokHKJk/RHN5eE+HHnLY
	 Y3nl3i2G4VYwVZ0XBfx/yujywV25RFdQ41Gyx5W86Smxjdar5+Ut6VpPPrmX1ryktW
	 9bHsa8Ezmirj0X1wuPvS/Uo8t7nhP6Pzw76xGsXc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 666E1F80425; Sat,  5 Aug 2023 19:14:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21961F801D5;
	Sat,  5 Aug 2023 19:14:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59596F8025A; Sat,  5 Aug 2023 19:14:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2224F8015B
	for <alsa-devel@alsa-project.org>; Sat,  5 Aug 2023 19:14:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2224F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=CNTqO4zN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691255681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GczfsjNiU8qmC/+ZpFSiEp1Z8D4ZMjmmL7Ud3QeoV2o=;
	b=CNTqO4zN2r5rhlnmNKjq6oRlK+pDA98FgKTN/16M0ipaInvrC5Jffd49AeHyjET3wkUmIq
	4ckm2No1Ng5uYg6aXlZXOhQzn0e4gjFtcDaHL6N918wMo/I5CVNw4vfmvpAFEYR8wswQMb
	dgQuWSDHM69ga753UaeIM1eKb7UBUak=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-l-b3S8cFMNmjH4d8uGw3rg-1; Sat, 05 Aug 2023 13:14:37 -0400
X-MC-Unique: l-b3S8cFMNmjH4d8uGw3rg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28DBF2A59556;
	Sat,  5 Aug 2023 17:14:37 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2284B1121314;
	Sat,  5 Aug 2023 17:14:35 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: lower "no backend DAIs enabled for ... Port" log
 severity
Date: Sat,  5 Aug 2023 19:14:35 +0200
Message-ID: <20230805171435.31696-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: J2AAP5Y3RL6K7FVCEKVQ2KXJAODQXGVD
X-Message-ID-Hash: J2AAP5Y3RL6K7FVCEKVQ2KXJAODQXGVD
X-MailFrom: hdegoede@redhat.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J2AAP5Y3RL6K7FVCEKVQ2KXJAODQXGVD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If SNDRV_PCM_IOCTL_PREPARE is called when the mixer settings linking
frontend and backend have not been setup yet this results in
e.g. the following errors getting logged:

[   43.244549]  Baytrail Audio Port: ASoC: no backend DAIs enabled for Baytrail Audio Port
[   43.244744]  Baytrail Audio Port: ASoC: error at dpcm_fe_dai_prepare on Baytrail Audio Port: -22

pipewire triggers this leading to 96 lines getting logged
after the user has logged into a GNOME session.

Change the actual "no backend DAIs enabled for ... Port" error to
dev_err_once() to avoid it getting repeated 48 times. While at it
also improve the error by hinting the user how to fix this.

To not make developing new UCM profiles harder, also log the error
at dev_dbg() level all the time (vs once). So that e.g. dyndbg can
be used to (re)enable the messages.

Also changes _soc_pcm_ret() to not log for -EINVAL errors, to fix
the other error getting logged 48 times. Userspace passing wrong
parameters should not lead to dmesg messages.

Link: https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/3407
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Switch the logging to a combination of dev_err_once() with
  improved log-message + dev_dbg() with shorter log message
---
 sound/soc/soc-pcm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 8896227e4fb7..3aa6b988cb4b 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -38,6 +38,7 @@ static inline int _soc_pcm_ret(struct snd_soc_pcm_runtime *rtd,
 	switch (ret) {
 	case -EPROBE_DEFER:
 	case -ENOTSUPP:
+	case -EINVAL:
 		break;
 	default:
 		dev_err(rtd->dev,
@@ -2466,8 +2467,11 @@ static int dpcm_fe_dai_prepare(struct snd_pcm_substream *substream)
 
 	/* there is no point preparing this FE if there are no BEs */
 	if (list_empty(&fe->dpcm[stream].be_clients)) {
-		dev_err(fe->dev, "ASoC: no backend DAIs enabled for %s\n",
-				fe->dai_link->name);
+		/* dev_err_once() for visibility, dev_dbg() for debugging UCM profiles */
+		dev_err_once(fe->dev, "ASoC: no backend DAIs enabled for %s, possibly missing ALSA mixer-based routing or UCM profile\n",
+			     fe->dai_link->name);
+		dev_dbg(fe->dev, "ASoC: no backend DAIs enabled for %s\n",
+			fe->dai_link->name);
 		ret = -EINVAL;
 		goto out;
 	}
-- 
2.41.0

