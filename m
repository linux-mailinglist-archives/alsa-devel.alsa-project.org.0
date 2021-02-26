Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8B93264DA
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 16:43:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6CC51687;
	Fri, 26 Feb 2021 16:43:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6CC51687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614354235;
	bh=mLMZkkMl2Bzfh4IVGtjwkAGHpxCWtgNzpg3OrBejrjY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=INp3KjFtm7PjE0f3VWOkqjRR02X1+Y5DLZLupq5C8EZZ0l4wXbpBsBt5XZUeecjF/
	 Loa4RmRaOUQalrShpeQuqnsxzBGRwhymOmOWhEYGyh2HTr70R5RV3o9NRbRrmKaNr6
	 6t8GU0C4z+wEHsMtd041MYeOZEVWEDMiQiEFJE9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DDF0F80423;
	Fri, 26 Feb 2021 16:40:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A16CF802E0; Fri, 26 Feb 2021 16:40:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2825F8022D
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 16:40:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2825F8022D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="XuSgq4bt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614354039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xd0cfAOXRgCMojRzB8m8hWwaqiVPwUv6bqCEhkbVMI4=;
 b=XuSgq4btlPrmC/haGrfnlHg4GbEEAuUUwT+/ArjvckxxKNM8GRXh5BEHiLX3tBLDhpx50V
 9o8tU0JZmO7peN+MzVDEfSmsk//1zev1+9pYd0XsK6ket6RzaTc9n8GwmNWxhmsJ0mrLcf
 gJboZ4XymAw5wTa/H5OEofjCE8vBWP4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-_HkG8eZJNGKZ99YZkerU8w-1; Fri, 26 Feb 2021 10:40:35 -0500
X-MC-Unique: _HkG8eZJNGKZ99YZkerU8w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30BCB804045;
 Fri, 26 Feb 2021 15:40:34 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-36.ams2.redhat.com [10.36.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E63D131D8;
 Fri, 26 Feb 2021 15:40:32 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH alsa-ucm-conf 4/8] codecs/rt5640: Drop bogus 'DIG MIXL DAC L2
 Switch' setting
Date: Fri, 26 Feb 2021 16:40:21 +0100
Message-Id: <20210226154025.84828-5-hdegoede@redhat.com>
In-Reply-To: <20210226154025.84828-1-hdegoede@redhat.com>
References: <20210226154025.84828-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

The 'DIG MIXL DAC L2 Switch' path is only used for Digital Mixer Path
loopback, which we don't use. Drop it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/codecs/rt5640/EnableSeq.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/ucm2/codecs/rt5640/EnableSeq.conf b/ucm2/codecs/rt5640/EnableSeq.conf
index 4a355a5..223cceb 100644
--- a/ucm2/codecs/rt5640/EnableSeq.conf
+++ b/ucm2/codecs/rt5640/EnableSeq.conf
@@ -27,7 +27,6 @@ EnableSequence [
 	#cset "name='DAI select' 1"
 
 	cset "name='DAC2 Playback Switch' on"
-	cset "name='DIG MIXL DAC L2 Switch' on"
 
 	# Input Configuration
 	cset "name='Stereo ADC1 Mux' ADC"
-- 
2.30.1

