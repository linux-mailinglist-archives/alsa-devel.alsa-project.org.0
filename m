Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 724C719C93A
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Apr 2020 20:55:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F46E86F;
	Thu,  2 Apr 2020 20:54:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F46E86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585853740;
	bh=waijQgW3vHeK6a9MWnbh5dGEMmSbKogaOGcnoo5J5tQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Vbw03sxpv098EiSd/seenY8zCo6n1kl40v3m6HFgH8ttc0la9CfQhZ/CWshrwNyVN
	 YMW8Ltwvp7eYtIyEEbIkTohRjAiw1mR5VIBE6S2CFibzhbLHYpl6N+pzWz293O/sFx
	 ahOeU2aE56mVfErFjK/e77Z2Vsy9gS5G4g142HsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 517F4F80254;
	Thu,  2 Apr 2020 20:54:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 402F2F801F2; Thu,  2 Apr 2020 20:54:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEE1AF80140
 for <alsa-devel@alsa-project.org>; Thu,  2 Apr 2020 20:54:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEE1AF80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="T+IQ82sM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585853647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=waijQgW3vHeK6a9MWnbh5dGEMmSbKogaOGcnoo5J5tQ=;
 b=T+IQ82sMcAe+3+fBrO+yhv8A4zMLGiR2jIgpM43JSEORCPDstpR2GMGBj9qwlcjrx2pFiU
 6foXyePiheVGQOubC9qBGAkwiu6cI6HYUmexPJJTRgpR0W9H394BwVIz3MbFHV/rIuQv2b
 9mhtR9TaHv+4Eq1HdbVDF3vWRR4LdBw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-sd_WTfHyMrKo1ImvtMFP8g-1; Thu, 02 Apr 2020 14:54:05 -0400
X-MC-Unique: sd_WTfHyMrKo1ImvtMFP8g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC88D8024D4;
 Thu,  2 Apr 2020 18:54:03 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-45.ams2.redhat.com [10.36.112.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF1DB1036D00;
 Thu,  2 Apr 2020 18:54:00 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 flove@realtek.com, shumingf@realtek.com,
 Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 1/3] ASoC: Intel: atom: Take the drv->lock mutex before
 calling sst_send_slot_map()
Date: Thu,  2 Apr 2020 20:53:57 +0200
Message-Id: <20200402185359.3424-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>
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

sst_send_slot_map() uses sst_fill_and_send_cmd_unlocked() because in some
places it is called with the drv->lock mutex already held.

So it must always be called with the mutex locked. This commit adds missing
locking in the sst_set_be_modules() code-path.

Fixes: 24c8d14192cc ("ASoC: Intel: mrfld: add DSP core controls")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/atom/sst-atom-controls.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/atom/sst-atom-controls.c b/sound/soc/intel/ato=
m/sst-atom-controls.c
index baef461a99f1..2c3798034b1d 100644
--- a/sound/soc/intel/atom/sst-atom-controls.c
+++ b/sound/soc/intel/atom/sst-atom-controls.c
@@ -966,7 +966,9 @@ static int sst_set_be_modules(struct snd_soc_dapm_widge=
t *w,
 =09dev_dbg(c->dev, "Enter: widget=3D%s\n", w->name);
=20
 =09if (SND_SOC_DAPM_EVENT_ON(event)) {
+=09=09mutex_lock(&drv->lock);
 =09=09ret =3D sst_send_slot_map(drv);
+=09=09mutex_unlock(&drv->lock);
 =09=09if (ret)
 =09=09=09return ret;
 =09=09ret =3D sst_send_pipe_module_params(w, k);
--=20
2.26.0

