Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3912372217
	for <lists+alsa-devel@lfdr.de>; Mon,  3 May 2021 22:55:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA40F16A5;
	Mon,  3 May 2021 22:54:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA40F16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620075303;
	bh=MvY64cslqxvvQ5aECsu+fRYfvnVmyjbh1wsOH2AR6q0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LwilBKq/EOvhQnomnV+L3fXd3XDn448aHx9unyjHtHMBNVeIJ7WWhWPV3MX9AFMoD
	 0KgJzoDuFgGFbMVXEa20V1J4Hfl2t45Fym88OXumJxAvhuxPQpmVlZjX3asbjID50/
	 lWRkhpmOUj/2EcmKXeQyrbCzP4baLRhoCZvqGBIM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF0C7F80430;
	Mon,  3 May 2021 22:52:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4274F80279; Mon,  3 May 2021 22:52:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98617F8028D
 for <alsa-devel@alsa-project.org>; Mon,  3 May 2021 22:52:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98617F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="VPxwNz2D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620075162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G1J9wlfqifo9yOskr2L6kKwGnVgLunTYza73Z+xZb1o=;
 b=VPxwNz2DyrDdN/LJO6nsQ+AvW7/STj5f9cLyIRAn/EpemQOj5ICd/dG+RoJ9AvX7ug+qrl
 EyGVg2D3q08TWMWrWYSsNH02Ygcm0cXC8CfWm3F1v6L1PIxQ+U9/3kTYCp51+/B7de5vDm
 ssrtL2NmRieWb68ZXYMx2MF3VIDiHbI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-3RIvdVBtOaWwQbdHjZFXXg-1; Mon, 03 May 2021 16:52:40 -0400
X-MC-Unique: 3RIvdVBtOaWwQbdHjZFXXg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1683A107ACC7;
 Mon,  3 May 2021 20:52:40 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-158.ams2.redhat.com [10.36.112.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 368825C1C2;
 Mon,  3 May 2021 20:52:39 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 5/5] mixer: simple - Add exceptions for some Playback
 Switches with a " Channel Switch" suffix
Date: Mon,  3 May 2021 22:52:31 +0200
Message-Id: <20210503205231.167346-6-hdegoede@redhat.com>
In-Reply-To: <20210503205231.167346-1-hdegoede@redhat.com>
References: <20210503205231.167346-1-hdegoede@redhat.com>
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

Use the following troublesome playback-switch-control names:

"Headphone Channel Switch"
"HP Channel Switch"
"Speaker Channel Switch"

There are 2 problems with these names:

1. They are the mute controls for the matching:
"Headphone Playback Volume"
"HP Playback Volume"
"Speaker Playback Volume"
controls, to be properly paired, which is necessary for HW volume-control
support, the simple mixer code needs to recognize that the base-name for
these is e.g. "Headphone" not "Headphone Channel".

2. They are playback-switches, yet they get recognized as global-switches.

Add these to the exceptions table so that they get the proper basename
and type set.

Note we can NOT fix this by adding " Channel Switch" as a suffix to the
suffixes table, because the line-out output on these codecs has the
following controls:

"OUT Playback Switch"
"OUT Channel Switch"
"OUT Playback Volume"

Where the 2 switches describe mutes in 2 different places in the graph.

So if we were to add a " Channel Switch" suffix map to CTL_PLAYBACK_SWITCH
then we would get 2 CTL_PLAYBACK_SWITCH controls for the "OUT" mixer
element, which is not allowed.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 src/mixer/simple_none.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/src/mixer/simple_none.c b/src/mixer/simple_none.c
index de81966f..d5025f68 100644
--- a/src/mixer/simple_none.c
+++ b/src/mixer/simple_none.c
@@ -933,6 +933,9 @@ static const struct excep {
 	{"3D Control - Depth", 18, CTL_PLAYBACK_VOLUME},
 	{"3D Control Sigmatel - Depth", 27, CTL_PLAYBACK_VOLUME},
 	{"3D Control Sigmatel - Rear Depth", 32, CTL_PLAYBACK_VOLUME},
+	{"Headphone Channel Switch", 9, CTL_PLAYBACK_SWITCH},
+	{"HP Channel Switch", 2, CTL_PLAYBACK_SWITCH},
+	{"Speaker Channel Switch", 7, CTL_PLAYBACK_SWITCH},
 	/* Capture Volume/Switch controls without a " Capture ..." suffix */
 	{"ADC Boost Gain", 14, CTL_CAPTURE_VOLUME},
 	{"IN1 Boost", 9, CTL_CAPTURE_VOLUME},
-- 
2.31.1

