Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB65330137
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Mar 2021 14:32:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4F211F05;
	Sun,  7 Mar 2021 14:31:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4F211F05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615123935;
	bh=8O0d/kNPgBpV5+yYxJPPAvEu1uKERHrms99Zk7cIPl0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mvfdjY2UWxOjGW50ScZV69DOoSVoZp+N4IlS2dVFrX5vd7kCVImjb1VS9kqg/5A6C
	 Fu58Q+i0WClSLflPP9otGAcCVj1YxfzNSIRBOOkKiAH67cNc/vQSCr8o9vanVXyX6z
	 yYYIGdRGW2juom7Tm4aRhefAJK6LLEm4rbW7C138=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0670CF800CC;
	Sun,  7 Mar 2021 14:30:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 373BCF8028B; Sun,  7 Mar 2021 14:30:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49452F80139
 for <alsa-devel@alsa-project.org>; Sun,  7 Mar 2021 14:30:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49452F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="V12NwWE8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615123816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9lj3yTk+vlO6dCXJo07zGOEEWDDRs84TfJ/OXTzWp/Y=;
 b=V12NwWE83r2sf+DC2A7Gp+ZN7tUYozeqYOdRaGugjAi4lZdRrWrf72uHhdM/UGP+AxE//Y
 3aHryhVG087C3YRzqL7li5XPBfuoyMoly1I40J6mAa/fTpZejwxZkNiidfW6BYEIiqO6y3
 RBrV1aA634grVE1ye5Ha/13kCt5iGd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-zWQLVDfuN5qlOWhi3ASqMg-1; Sun, 07 Mar 2021 08:30:14 -0500
X-MC-Unique: zWQLVDfuN5qlOWhi3ASqMg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3474E1005D4A;
 Sun,  7 Mar 2021 13:30:13 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-90.ams2.redhat.com [10.36.112.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6859A5C1CF;
 Sun,  7 Mar 2021 13:30:12 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib v3 5/5] mixer: simple - Add exceptions for some
 Playback Switches with a " Channel Switch" suffix
Date: Sun,  7 Mar 2021 14:30:05 +0100
Message-Id: <20210307133005.30801-6-hdegoede@redhat.com>
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
2.30.1

