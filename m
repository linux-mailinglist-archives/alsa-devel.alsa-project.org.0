Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C4033013A
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Mar 2021 14:33:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63F061F09;
	Sun,  7 Mar 2021 14:32:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63F061F09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615124018;
	bh=p7VWHgR1ITEEX+8LlwQB+9+He2yowwjdKGL0H260rgc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WU2rU39hMzzH55S7Bib7P5ZkqeHYYLZLkx9cthJ0nTfRWzPvDnfashqVKvCXQxCo/
	 fQ4lWUVQVeJXqcGUo27pXTlYMIHviLLA4oYu8V2Y0B6Z3/30P7oVIHSA6/EBgJHvny
	 iFxPqzbaDQk5RthNQTS1Ckzcr33iI96gRV6+AVas=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1897DF80425;
	Sun,  7 Mar 2021 14:30:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D28EAF8025A; Sun,  7 Mar 2021 14:30:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FD8BF80275
 for <alsa-devel@alsa-project.org>; Sun,  7 Mar 2021 14:30:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FD8BF80275
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="bSabm9Uu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615123816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j/CX1bmk7VyVvG8DVLSSYlp5BHvTlqOBOy5C6FxS73U=;
 b=bSabm9UuPJelR9bY1iKZ3BYyJTHKPSoHwWGbeKxzixeVMex5tIXooyR+kMzsqH8tZ+sKNI
 Lcn3OHL4AAe0iyuib9m643u/89nZOpvb89SRapNMHXblJjCD/9OxkW3tEe9lZ6v2N6Uf70
 kiGS9Johqg645VIoITKKV2V4YcbHreU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-_64VhUY2NDK9J5FWvku3DQ-1; Sun, 07 Mar 2021 08:30:13 -0500
X-MC-Unique: _64VhUY2NDK9J5FWvku3DQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 209578143F0;
 Sun,  7 Mar 2021 13:30:12 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-90.ams2.redhat.com [10.36.112.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26BCB5C1CF;
 Sun,  7 Mar 2021 13:30:11 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib v3 4/5] mixer: simple - Add exceptions for some
 capture-vol-ctls which have a " Volume" suffix
Date: Sun,  7 Mar 2021 14:30:04 +0100
Message-Id: <20210307133005.30801-5-hdegoede@redhat.com>
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

sound/soc/codecs/rt5659.c
sound/soc/codecs/rt5660.c
sound/soc/codecs/rt5665.c
sound/soc/codecs/rt5668.c
sound/soc/codecs/rt5670.c
sound/soc/codecs/rt5682.c

Use the following troublesome capture-volume-control names:
"IN1 Boost Volume"
"IN2 Boost Volume"
"IN3 Boost Volume"
"STO1 ADC Boost Gain Volume"
"STO2 ADC Boost Gain Volume"
"Mono ADC Boost Gain Volume"

And sound/soc/codecs/es8316.c uses "ADC PGA Gain Volume".

Note how these are suffixed with just " Volume" instead of
"Capture Volume". Add these to the exceptions table,
so that the type correctly gets set to CTL_CAPTURE_VOLUME instead
of CTL_GLOBAL_VOLUME.

This correctly makes snd_mixer_selem_has_capture_volume() return true for
these (and makes snd_mixer_selem_has_common_volume() return false).

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 src/mixer/simple_none.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/src/mixer/simple_none.c b/src/mixer/simple_none.c
index 8f964959..de81966f 100644
--- a/src/mixer/simple_none.c
+++ b/src/mixer/simple_none.c
@@ -920,8 +920,15 @@ static const struct excep {
 	 */
 	{"Input Source", 12, CTL_CAPTURE_ROUTE},
 	/* Avoid these Capture Volume/Switch controls getting seen as GLOBAL VOL/SW */
+	{"ADC PGA Gain Volume", 12, CTL_CAPTURE_VOLUME},
 	{"Capture Volume", 7, CTL_CAPTURE_VOLUME},
 	{"Capture Switch", 7, CTL_CAPTURE_SWITCH},
+	{"IN1 Boost Volume", 9, CTL_CAPTURE_VOLUME},
+	{"IN2 Boost Volume", 9, CTL_CAPTURE_VOLUME},
+	{"IN3 Boost Volume", 9, CTL_CAPTURE_VOLUME},
+	{"Mono ADC Boost Gain Volume", 19, CTL_CAPTURE_VOLUME},
+	{"STO1 ADC Boost Gain Volume", 19, CTL_CAPTURE_VOLUME},
+	{"STO2 ADC Boost Gain Volume", 19, CTL_CAPTURE_VOLUME},
 	/* Playback Volume/Switch controls without a " Playback ..." suffix */
 	{"3D Control - Depth", 18, CTL_PLAYBACK_VOLUME},
 	{"3D Control Sigmatel - Depth", 27, CTL_PLAYBACK_VOLUME},
-- 
2.30.1

