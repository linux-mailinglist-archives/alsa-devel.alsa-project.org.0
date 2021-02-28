Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E937327352
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Feb 2021 17:15:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F6871680;
	Sun, 28 Feb 2021 17:14:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F6871680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614528949;
	bh=HwTvZYoUo2uSktneQ2wJY9UOM0nDnWw9kOjcmWlBh/8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NIlSsbWUQm+1pUyjNslYhs7wH9J84GfVK2Cv39/q+ZNgD0wkg+mFkTIrNCHJvCg/F
	 CFhvfMbl+7EV3SJqiLQnLR6La2XgA4sUe62NrUKe7VUftan2QlhxfXxiwJ2srNQ27I
	 6rOVFMPmbrUGnZJZrpSBJuyT+RZsfHzP5oRsDOhs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D907F8032C;
	Sun, 28 Feb 2021 17:13:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4284AF8032B; Sun, 28 Feb 2021 17:13:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40FDFF802CA
 for <alsa-devel@alsa-project.org>; Sun, 28 Feb 2021 17:13:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40FDFF802CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="e2Cj/wqG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614528796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iq9K1XL+5Xx2t2ocbqJbwkaPhir3n2G2A6GELJmn7tc=;
 b=e2Cj/wqGyGcLFwaB1/jHM1KzEkRSHkq4S3sZNzSI5hWgG626bEmJdqYof/zB6uk9u11YuW
 UxmTERQiEsNWX38qLUAH1jBT/7fz33zMlY2NSvihpDogvHp3q3BEWmIjesUxMKeFVWUXmN
 4GE52EHjLAKMQ7/sN70f04m+Tpmrb2w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-py1D0hXKNE2YKYAvNRUlAA-1; Sun, 28 Feb 2021 11:13:14 -0500
X-MC-Unique: py1D0hXKNE2YKYAvNRUlAA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F5BB107ACE8;
 Sun, 28 Feb 2021 16:13:13 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-42.ams2.redhat.com [10.36.112.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 133575D9CC;
 Sun, 28 Feb 2021 16:13:08 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib v2 3/3] mixer: Add exception for some
 capture-vol-ctls which have a " Volume" suffix
Date: Sun, 28 Feb 2021 17:13:04 +0100
Message-Id: <20210228161304.241288-4-hdegoede@redhat.com>
In-Reply-To: <20210228161304.241288-1-hdegoede@redhat.com>
References: <20210228161304.241288-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
"Capture Volume" add some special handling for this to the base_len()
function, which is responsbile for getting the control-type,
so that the type correctly gets set to CTL_CAPTURE_VOLUME instead of
CTL_GLOBAL_VOLUME.

This correctly makes snd_mixer_selem_has_capture_volume() return true for
these (and makes snd_mixer_selem_has_common_volume() return false).

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 src/mixer/simple_none.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/src/mixer/simple_none.c b/src/mixer/simple_none.c
index 262e3516..22154647 100644
--- a/src/mixer/simple_none.c
+++ b/src/mixer/simple_none.c
@@ -914,9 +914,13 @@ static const struct suf {
  */
 const char * const capture_volume_names[] = {
 	"ADC Boost Gain",
+	"ADC PGA Gain",
 	"IN1 Boost",
 	"IN2 Boost",
 	"IN3 Boost",
+	"Mono ADC Boost Gain",
+	"STO1 ADC Boost Gain",
+	"STO2 ADC Boost Gain",
 	NULL
 };
 #endif
@@ -944,6 +948,17 @@ static int base_len(const char *name, selem_ctl_type_t *type)
 			*type = CTL_CAPTURE_VOLUME;
 			return nlen;
 		}
+
+		/*
+		 * Sometimes these have a " Volume" suffix instead of a
+		 * " Capture Volume" suffix. Check for this so that we set
+		 * type to CTL_CAPTURE_VOLUME instead of CTL_GLOBAL_VOLUME.
+		 */
+		snprintf(buf, sizeof(buf), "%s Volume", capture_volume_names[i]);
+		if (!strcmp(name, buf)) {
+			*type = CTL_CAPTURE_VOLUME;
+			return nlen - strlen(" Volume");
+		}
 	}
 
 	p = suffixes;
-- 
2.30.1

