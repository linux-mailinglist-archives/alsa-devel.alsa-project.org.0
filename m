Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DC53765DA
	for <lists+alsa-devel@lfdr.de>; Fri,  7 May 2021 15:14:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA9E21676;
	Fri,  7 May 2021 15:13:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA9E21676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620393265;
	bh=2tlPU058sVrrF6RxLSn5xZHPWyVrOQuOVgBWCoAeumA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iGzbDCe1p8Q9hG8jFmh8vh7jWKDglR8HyYcngwe/EhQwQ66Z7WxkkHalrXOfCcAOY
	 zzaZGGPGnducG65ic3u15z/YrFNj/u+Flr9pXPhyFLQowTgUh8tuff6TDWqTZ8FnIZ
	 O8YMR0+XgVEgTvfueMTq4PNgoL00MFXnzzVDZQNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A703F804AA;
	Fri,  7 May 2021 15:12:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2342DF8026A; Fri,  7 May 2021 15:11:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53A9EF80268
 for <alsa-devel@alsa-project.org>; Fri,  7 May 2021 15:11:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53A9EF80268
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="JO6m/dpI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620393107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vNiFgE7F+LWsoGuwhLVoS4DTmA0aw6t0bF6l+j5azsY=;
 b=JO6m/dpIdWAHkHL5u5N+b+K/enp2VTUvTdDy/9zcSispQuczEsnpbTmQoNERsFz1wQDKbx
 jVxOu8o80zJ8br9qh9MK5rIKQHWa7ibbpAEuwIvkgMvrvomWXm9Q/xvjDZEY7DGyNuNp//
 LnUMtgFGgKdRk7cdovkEqVHImMvH8Yw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-f3JCVSqEMHu7mncQZVbcZw-1; Fri, 07 May 2021 09:11:45 -0400
X-MC-Unique: f3JCVSqEMHu7mncQZVbcZw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E878801AF8;
 Fri,  7 May 2021 13:11:44 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-54.ams2.redhat.com [10.36.113.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 662155C255;
 Fri,  7 May 2021 13:11:43 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH alsa-ucm-conf 2/3] cht-bsw-rt5672: Add support for controlling
 speaker- and mic-mute LEDs
Date: Fri,  7 May 2021 15:11:38 +0200
Message-Id: <20210507131139.10231-3-hdegoede@redhat.com>
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

Add support for controlling speaker- and mic-mute LEDs using the new
snd_ctl_led kernel module for generic mute LED control.

Tested on a Thinkpad 10 tablet which has a detachable USB keyboard with
a speaker mute LED embedded in the volume-mute button and a mic mute
LED embedded in the mic-mute button.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/cht-bsw-rt5672/cht-bsw-rt5672.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/ucm2/cht-bsw-rt5672/cht-bsw-rt5672.conf b/ucm2/cht-bsw-rt5672/cht-bsw-rt5672.conf
index db2924f..c961967 100644
--- a/ucm2/cht-bsw-rt5672/cht-bsw-rt5672.conf
+++ b/ucm2/cht-bsw-rt5672/cht-bsw-rt5672.conf
@@ -6,3 +6,9 @@ SectionUseCase."HiFi" {
 	File "HiFi.conf"
 	Comment "Play HiFi quality Music"
 }
+
+FixedBootSequence [
+	exec "/sbin/modprobe snd_ctl_led"
+	sysw "-/class/sound/ctl-led/speaker/card${CardNumber}/attach:DAC1 Playback Switch"
+	sysw "-/class/sound/ctl-led/mic/card${CardNumber}/attach:ADC Capture Switch"
+]
-- 
2.31.1

