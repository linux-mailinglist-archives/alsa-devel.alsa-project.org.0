Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B02E6330139
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Mar 2021 14:33:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 581841F25;
	Sun,  7 Mar 2021 14:32:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 581841F25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615123984;
	bh=b+s3OBotdKH5qg136xVspP+3hqETci4VM5OPwDEjIYA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L/buBTG5b0b8VCA3jLGYGx2vYhBP36E2aPnyXUe1ZHqVf4cPdQH1RjQJnkPecv906
	 RuWFM1NZRpH6MG/4xvTUP22zM2Vhp/tomdlJuc7HNhx/8ti53cWHibHCGGSxlJSoiQ
	 t7A9A/6ouurMUSnzewHQRUGu88LYYt/HeOQEjJzI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A33DF80424;
	Sun,  7 Mar 2021 14:30:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6816FF8032B; Sun,  7 Mar 2021 14:30:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E7C7F8025A
 for <alsa-devel@alsa-project.org>; Sun,  7 Mar 2021 14:30:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E7C7F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Z9/gWB3l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615123813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5B4hNxElmX8Qxaj9doCBhadPFHIDCtqOWrUg8cq2q4w=;
 b=Z9/gWB3l23mET4CVKocZecGuI2IWbJUwaSlMsk/Rtr0Inh2UNEa2pmnb0vZ806ucf3cmkv
 SR4SDtYKBF/uvBoVORg6wTrEvkEjn3dHnJVVXZxBbqSBk6YiqKF0AO6WzfsRj2Ap+DI67J
 Rn69VQ+ErGC2Fa+4WYy2wSHGZIDA6Hg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-FmIREiuTMt6cwwR-vROJeA-1; Sun, 07 Mar 2021 08:30:11 -0500
X-MC-Unique: FmIREiuTMt6cwwR-vROJeA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D150D18D6A2C;
 Sun,  7 Mar 2021 13:30:10 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-90.ams2.redhat.com [10.36.112.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12B295C1CF;
 Sun,  7 Mar 2021 13:30:09 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib v3 3/5] mixer: simple - Add exceptions for non "
 Volume" suffixed capture vol-ctls used in ASoC realtek codec drivers
Date: Sun,  7 Mar 2021 14:30:03 +0100
Message-Id: <20210307133005.30801-4-hdegoede@redhat.com>
In-Reply-To: <20210307133005.30801-1-hdegoede@redhat.com>
References: <20210307133005.30801-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>
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

The following ASoC codec drivers:

sound/soc/codecs/rt5640.c
sound/soc/codecs/rt5645.c
sound/soc/codecs/rt5651.c
sound/soc/codecs/rt5677.c

Use capture-volume-control names like: "IN1 Boost", note the missing
" Volume" suffix. This causes the mixer code to not identify these as
volume-controls, which causes some of the dB related sm_elem_ops to
return -EINVAL.

This in turn causes alsamixer to not show dB info and causes UCM profile
HW volume control support in pulseaudio to not work properly due to the
lacking dB scale info.

This cannot be fixed on the kernel side because the non " Volume" suffixed
names are used in UCM profiles currently shipping in alsa-ucm-conf.

Add these to the exceptions table, so that these correctly get identified
as CTL_CAPTURE_VOLUME controls.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 src/mixer/simple_none.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/src/mixer/simple_none.c b/src/mixer/simple_none.c
index b29554cb..8f964959 100644
--- a/src/mixer/simple_none.c
+++ b/src/mixer/simple_none.c
@@ -926,6 +926,11 @@ static const struct excep {
 	{"3D Control - Depth", 18, CTL_PLAYBACK_VOLUME},
 	{"3D Control Sigmatel - Depth", 27, CTL_PLAYBACK_VOLUME},
 	{"3D Control Sigmatel - Rear Depth", 32, CTL_PLAYBACK_VOLUME},
+	/* Capture Volume/Switch controls without a " Capture ..." suffix */
+	{"ADC Boost Gain", 14, CTL_CAPTURE_VOLUME},
+	{"IN1 Boost", 9, CTL_CAPTURE_VOLUME},
+	{"IN2 Boost", 9, CTL_CAPTURE_VOLUME},
+	{"IN3 Boost", 9, CTL_CAPTURE_VOLUME},
 	{NULL,}
 };
 #endif
-- 
2.30.1

