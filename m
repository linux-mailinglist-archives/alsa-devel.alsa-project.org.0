Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 194FB19C925
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Apr 2020 20:51:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94273167A;
	Thu,  2 Apr 2020 20:51:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94273167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585853511;
	bh=5r1l6P1uQQkjdEx5DN9qZjoq9P5V9mf+PAGriKMK9Yo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Kpo7mVUbaTDU/XmjBwuurGgHRU1kY7heDbiAK0gq2x9MMEQLnryBp4+keq1xivxwz
	 Uo/GYIP50a43KjC53ChZqRFTUEBbVj1cN6Ve4NFHzP2yvx/b+pVHHsBNvgM4idDt/8
	 holRsREIomQiQcpqrtBEEtcW6ZsOxsiwnNNoKG38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFEC7F80146;
	Thu,  2 Apr 2020 20:50:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB82BF80157; Thu,  2 Apr 2020 20:50:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A09F1F80088
 for <alsa-devel@alsa-project.org>; Thu,  2 Apr 2020 20:49:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A09F1F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="EJDUAn1p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585853397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kxt/zZJb4w1CvWDC/3nWHieiTPy/Gy2B2UFEsSx5iZE=;
 b=EJDUAn1pPMVN7UIVaCmGNhkMFaZ3fOShmIoTVHVk0bUceHdeJsphQjZ9gUt2QiiIBoL0L/
 ohYA58K5uh9pkQjcDV/G8DXfstYlyhn2Ebrd8sJpwI7RoMQlYmZZhYGpm5ea6aPZk+d/sm
 vHcM0fUNWAmJJhRS29ghx+LgABx7Lco=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-qTBJAG-ROAirgVkFDrU68Q-1; Thu, 02 Apr 2020 14:49:53 -0400
X-MC-Unique: qTBJAG-ROAirgVkFDrU68Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BA191926DA2;
 Thu,  2 Apr 2020 18:49:52 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-45.ams2.redhat.com [10.36.112.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16A3860BFB;
 Thu,  2 Apr 2020 18:49:49 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/2] ASoC: SOF: Fix "no reply expected" error during
 firmware-boot
Date: Thu,  2 Apr 2020 20:49:47 +0200
Message-Id: <20200402184948.3014-1-hdegoede@redhat.com>
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

At least on Canon Lake each time the SOF firmware is booted,
the following error is logged in dmesg:

[   36.711803] sof-audio-pci 0000:00:1f.3: error: no reply expected, receiv=
ed 0x0

Since the DSP is powered down when not in used this happens everytime
e.g. a notification plays, polluting dmesg with these false-positive
errors.

Add a check to snd_sof_ipc_reply() which makes it return success when
receiving an unexpected msg_id 0 during fw-boot, fixing these
false-positive errors being logged.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/sof/ipc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 78aa1da7c7a9..7303b3d42f12 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -312,6 +312,11 @@ int snd_sof_ipc_reply(struct snd_sof_dev *sdev, u32 ms=
g_id)
 {
 =09struct snd_sof_ipc_msg *msg =3D &sdev->ipc->msg;
=20
+=09/* Ignore msg_id 0 being send during fw-boot */
+=09if (msg->ipc_complete && sdev->fw_state =3D=3D SOF_FW_BOOT_IN_PROGRESS =
&&
+=09    msg_id =3D=3D 0)
+=09=09return 0;
+
 =09if (msg->ipc_complete) {
 =09=09dev_err(sdev->dev, "error: no reply expected, received 0x%x",
 =09=09=09msg_id);
--=20
2.26.0

