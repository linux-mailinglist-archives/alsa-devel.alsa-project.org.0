Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A73803765D5
	for <lists+alsa-devel@lfdr.de>; Fri,  7 May 2021 15:13:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A1D882A;
	Fri,  7 May 2021 15:13:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A1D882A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620393238;
	bh=qCpAX/bZsU9Io4kqcqJQIZxa121dTrsbUkNOLETBPJc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e2pankav0IgmRtS8NYKPpOUBebV4MqklwG4w40Ojrb5MXRtnS6QfFC1pHeZN4v6pb
	 o61UzNmdqO91eJViT6lKp92Na8v+naAKd+yTAkanm8kgedhy6LMNNAUstbs9+39vpX
	 UGPb5KgCbA2T920R3YJjqu1pguGfG9zbksWektP8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6350BF80475;
	Fri,  7 May 2021 15:12:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A9A3F80424; Fri,  7 May 2021 15:11:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58CD0F8026A
 for <alsa-devel@alsa-project.org>; Fri,  7 May 2021 15:11:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58CD0F8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="V4Ga1bki"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620393108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hf+EJYE7CvfnjExJhR6NESWsb74bKg9mMl3KVR5QzeQ=;
 b=V4Ga1bkitNj6CYBrA1QP9U11bBrIMG5Vn6xIOS6PSu1XdUjaKggZQI3+ReC6uh0Cbp97bh
 IMJoe95Es+bu8FyCvJfzFYqgJhUK+aleE5lVqTLBltF6yBPMhVvVnmpB2CQ1H82jk11IKX
 Q2NUnlRagj389rMZb5sW9oKGteKI7Wk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-ftNG_JBfOk2w4642CBpU3w-1; Fri, 07 May 2021 09:11:47 -0400
X-MC-Unique: ftNG_JBfOk2w4642CBpU3w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6E4710060C3;
 Fri,  7 May 2021 13:11:45 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-54.ams2.redhat.com [10.36.113.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C62645C1C5;
 Fri,  7 May 2021 13:11:44 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH alsa-ucm-conf 3/3] bytcr-rt5640: Add support for controlling a
 speaker-mute LED
Date: Fri,  7 May 2021 15:11:39 +0200
Message-Id: <20210507131139.10231-4-hdegoede@redhat.com>
In-Reply-To: <20210507131139.10231-1-hdegoede@redhat.com>
References: <20210507131139.10231-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>
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

Add support for controlling a speaker-mute LED using the new snd_ctl_led
kernel module for generic mute LED control.

Tested on a HP Pavilion X2 10-n000nd and a HP Pavilion X2 10-p002nd both of
which have a detachable USB keyboard with a speaker mute LED embedded in
the audio-mute button.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/bytcr-rt5640/bytcr-rt5640.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/ucm2/bytcr-rt5640/bytcr-rt5640.conf b/ucm2/bytcr-rt5640/bytcr-rt5640.conf
index af966ef..6b54d8f 100644
--- a/ucm2/bytcr-rt5640/bytcr-rt5640.conf
+++ b/ucm2/bytcr-rt5640/bytcr-rt5640.conf
@@ -4,3 +4,9 @@ SectionUseCase."HiFi" {
 	File "HiFi.conf"
 	Comment "Play HiFi quality Music"
 }
+
+FixedBootSequence [
+	exec "/sbin/modprobe snd_ctl_led"
+	sysw "-/class/sound/ctl-led/speaker/card${CardNumber}/attach:Speaker Channel Switch"
+	sysw "-/class/sound/ctl-led/speaker/card${CardNumber}/attach:HP Channel Switch"
+]
-- 
2.31.1

