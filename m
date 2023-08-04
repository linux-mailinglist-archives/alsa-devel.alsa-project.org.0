Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED970770175
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 15:28:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E742823;
	Fri,  4 Aug 2023 15:27:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E742823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691155680;
	bh=k1+bK+Z74TKcdEETTwtbHh/npYhGUJ9CYawmjiduM5o=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=trJZYYEW194tWjm+7m7WYfflxvJyAbUqgV+jFatWrILV4sVtT1TuyrwBncEX+fq77
	 ukrE5pfV1JF4AXfoZWLOuVUIZFZr7560AuzM+RsejLhADM7bqJTyKoSz+dBmNjT3Fe
	 Bj5fg/+9JDzjqShljDlKswPWJMoGI8/7KvYQEZIA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74C72F8016D; Fri,  4 Aug 2023 15:26:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA8D3F801D5;
	Fri,  4 Aug 2023 15:26:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C3ECF8025A; Fri,  4 Aug 2023 15:26:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0392FF8016D
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 15:26:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0392FF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=fcwZcQod
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691155597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+vFzhgPMq6RmjWAxry1cCHSkaVGuwWm6PYG6kighsCU=;
	b=fcwZcQod922KRcZzNP6PqVVCLXj1oMAthbUkKQrqV4vT+lc2hmxg9f3Ny/3MS9daSzyDb0
	jCi+6RaKCGab5SkLO91IInC9qpDbL4+1KBu0Sne1CQoogApsSSw2NLUkmIK0Gjj+SMJzt3
	GGFYF+MFtQ9Ne4mDoOAKCvG0eOXBkCQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-Pf6T7IrFMuuhFzjjM9JbPg-1; Fri, 04 Aug 2023 09:26:34 -0400
X-MC-Unique: Pf6T7IrFMuuhFzjjM9JbPg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D7B6868010;
	Fri,  4 Aug 2023 13:26:34 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD12B403162;
	Fri,  4 Aug 2023 13:26:33 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: lower "no backend DAIs enabled for ... Port" log
 severity
Date: Fri,  4 Aug 2023 15:26:28 +0200
Message-ID: <20230804132628.302385-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: WCCHLEG7OABPICS726NQ3BO7ULAGJE6L
X-Message-ID-Hash: WCCHLEG7OABPICS726NQ3BO7ULAGJE6L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WCCHLEG7OABPICS726NQ3BO7ULAGJE6L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If SNDRV_PCM_IOCTL_PREPARE is called when  the mixer settings linking
frontend and backend have not been setup yet this results in
e.g. the following errors getting logged:

[   43.244549]  Baytrail Audio Port: ASoC: no backend DAIs enabled for Baytrail Audio Port
[   43.244744]  Baytrail Audio Port: ASoC: error at dpcm_fe_dai_prepare on Baytrail Audio Port: -22

pipewire triggers this leading to 96 repeats of this in the log
after the user has logged into a GNOME session.

IMHO userspace should not be able to get the kernel to spam dmesg like
this. Lower the severity of the "no backend DAIs enabled" log message
for dai-s with the dynamic flag set to avoid this.

And also changes _soc_pcm_ret() to not log for -EINVAL errors, to fix
the other error. Userspace passing wrong parameters should not lead
to dmesg messages.

Link: https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/3407
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/soc-pcm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 8896227e4fb7..fdc1a1c654d6 100644
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
@@ -2466,7 +2467,11 @@ static int dpcm_fe_dai_prepare(struct snd_pcm_substream *substream)
 
 	/* there is no point preparing this FE if there are no BEs */
 	if (list_empty(&fe->dpcm[stream].be_clients)) {
-		dev_err(fe->dev, "ASoC: no backend DAIs enabled for %s\n",
+		if (fe->dai_link->dynamic)
+			dev_dbg(fe->dev, "ASoC: no backend DAIs enabled for %s\n",
+				fe->dai_link->name);
+		else
+			dev_err(fe->dev, "ASoC: no backend DAIs enabled for %s\n",
 				fe->dai_link->name);
 		ret = -EINVAL;
 		goto out;
-- 
2.41.0

