Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F158B19C929
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Apr 2020 20:52:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90C5E1685;
	Thu,  2 Apr 2020 20:51:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90C5E1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585853556;
	bh=Bk4ch/yDUqb7tamWaod8v/Byz7EYffLYkAk+QHbzyzA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rfBl2HS2QWvtkOoQRyPgTrlFdRgSFS8LQj1ob5xHAiHh3L4TI4sq8IFFnB4fOCPNk
	 tQMnZMvVaq3Lj6SJ6AUa4Kni57bo02cf9XHaR6AO7Pzu+03ZgRWyRaSzuB+Kcsf/P0
	 mLq4mzo7Ldlp9NsRJRahxCQqQ++NEtahcr8GZQVg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2386F80088;
	Thu,  2 Apr 2020 20:50:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0150AF80148; Thu,  2 Apr 2020 20:50:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A39FDF80141
 for <alsa-devel@alsa-project.org>; Thu,  2 Apr 2020 20:49:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A39FDF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="HQ3WHrDd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585853398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cm8fZ2Cid3taCZP/38yQM9usq3gZ/s0klQ6RZylg36U=;
 b=HQ3WHrDduY7rppnveodeZuUg1v+49LK6nI3pVp8D8FYXDX8X0uWLeAC9ZeW9guDWcuDtxn
 qz549DnyQkj4T2CbUqw5AKynTAlS/uU9TbAlztU8YEeUdK1vn/m46kDgVJ2JHkm35Y+tZU
 KnSkropT3e/WKS9oE2LTy8AvmU/wVls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-w1fB7xXbPlqfvZX0oufgOg-1; Thu, 02 Apr 2020 14:49:56 -0400
X-MC-Unique: w1fB7xXbPlqfvZX0oufgOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47AD48017FE;
 Thu,  2 Apr 2020 18:49:54 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-45.ams2.redhat.com [10.36.112.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4D2860BFB;
 Thu,  2 Apr 2020 18:49:52 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/2] ASoC: SOF: Turn "firmware boot complete" message into a
 dbg message
Date: Thu,  2 Apr 2020 20:49:48 +0200
Message-Id: <20200402184948.3014-2-hdegoede@redhat.com>
In-Reply-To: <20200402184948.3014-1-hdegoede@redhat.com>
References: <20200402184948.3014-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
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

Using a Canon Lake machine with the SOF driver causes dmesg to fill
up with a ton of these messages:

[  275.902194] sof-audio-pci 0000:00:1f.3: firmware boot complete
[  351.529358] sof-audio-pci 0000:00:1f.3: firmware boot complete
[  560.049047] sof-audio-pci 0000:00:1f.3: firmware boot complete
etc.

Since the DSP is powered down when not in used this happens everytime
e.g. a notification plays, polluting dmesg.

Turn this messages into a debug message, matching what the code already
does for the ""booting DSP firmware" message.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/sof/loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index fc4ab51bacf4..4760a9734585 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -603,7 +603,7 @@ int snd_sof_run_firmware(struct snd_sof_dev *sdev)
 =09}
=20
 =09if (sdev->fw_state =3D=3D SOF_FW_BOOT_COMPLETE)
-=09=09dev_info(sdev->dev, "firmware boot complete\n");
+=09=09dev_dbg(sdev->dev, "firmware boot complete\n");
 =09else
 =09=09return -EIO; /* FW boots but fw_ready op failed */
=20
--=20
2.26.0

