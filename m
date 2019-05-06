Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6720B14B94
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 16:11:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE09218CF;
	Mon,  6 May 2019 16:10:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE09218CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557151904;
	bh=Ym2qaLf0hacz46ytv7aHNhO+0W675T6/3FhqdhAvvBc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gOVkKRwP+xb5Dk8dx5P30TswSCGJSUtsS1avXUGyKrPXQAfs+5krHMWV7sDRlXlXp
	 gdRkgOJvHkYi9ss4DDpR4HWgiDToKINzVpW0rSz3uRe+tNBX2o0ufCsNQxhmyPSImj
	 hwnc5fqWredyJtujiD6xzROs3qTzRn5pIed/aGVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B17BF896FD;
	Mon,  6 May 2019 16:09:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80AAFF896F0; Mon,  6 May 2019 16:09:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E00E6F89673
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 16:09:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E00E6F89673
Received: from [123.123.251.121] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <hui.wang@canonical.com>)
 id 1hNeJU-0001SM-8j; Mon, 06 May 2019 14:09:53 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Mon,  6 May 2019 22:09:31 +0800
Message-Id: <20190506140932.7942-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.17.1
Subject: [alsa-devel] [PATCH v2 1/2] ALSA: hda/hdmi - Read the pin sense
	from register when repolling
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The driver will check the monitor presence when resuming from suspend,
starting poll or interrupt triggers. In these 3 situations, the
jack_dirty will be set to 1 first, then the hda_jack.c reads the
pin_sense from register, after reading the register, the jack_dirty
will be set to 0. But hdmi_repoll_work() is enabled in these 3
situations, It will read the pin_sense a couple of times subsequently,
since the jack_dirty is 0 now, It does not read the register anymore,
instead it uses the shadow pin_sense which is read at the first time.

It is meaningless to check the shadow pin_sense a couple of times,
we need to read the register to check the real plugging state, so
we set the jack_dirty to 1 in the hdmi_repoll_work().

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/patch_hdmi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 8b3ac690efa3..410d94301941 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1663,6 +1663,11 @@ static void hdmi_repoll_eld(struct work_struct *work)
 	container_of(to_delayed_work(work), struct hdmi_spec_per_pin, work);
 	struct hda_codec *codec = per_pin->codec;
 	struct hdmi_spec *spec = codec->spec;
+	struct hda_jack_tbl *jack;
+
+	jack = snd_hda_jack_tbl_get(codec, per_pin->pin_nid);
+	if (jack)
+		jack = jack->jack_dirty = 1;
 
 	if (per_pin->repoll_count++ > 6)
 		per_pin->repoll_count = 0;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
