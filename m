Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB95E20C963
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jun 2020 19:48:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93940165E;
	Sun, 28 Jun 2020 19:47:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93940165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593366517;
	bh=jRsGpx8tg7cQXB83P98wymo3DSoHLF8xNtfyJx2u0X8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gn+JUgFNr905KNyccycE+B3Ib/s07OWpAUMIstCrTk7GQw2O9oSNmm1L0pkm6BV+q
	 P4OVY5aLKglzGdc3Hg+1bUIv/R56JfpwGwkTP4ebK9XPpuAzt+CzRPjH9EGfZJYPbU
	 dMv2IEfdnYjsnlK4P1YvZ/ot1x45SnAUUJEenhMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 957C7F802D2;
	Sun, 28 Jun 2020 19:44:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAD1EF80253; Sun, 28 Jun 2020 19:44:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71B1EF800F0
 for <alsa-devel@alsa-project.org>; Sun, 28 Jun 2020 19:44:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71B1EF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="K40VvFJJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593366272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WWGm3198Dm1xpe7bsa+BO7zUZICM0e3RFV6MlnJGjck=;
 b=K40VvFJJWg74J63perAfEZ4eZ4uNPMfw1NEeSiPHuB2+bAbLsFU/r9gFaIPkSosJKpUyZF
 eVcGIIswBGrv/fT29TMk/c5XLDa772wvIMWTHbIUpKLYFOVQ9muW3THef4afqmv6KxfaWP
 4P6B0fPA+W+igPXW2Dsc0H655HXJWDY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-jNqGG7BmPtaKiRTJGlLRLg-1; Sun, 28 Jun 2020 13:44:29 -0400
X-MC-Unique: jNqGG7BmPtaKiRTJGlLRLg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9053580183C;
 Sun, 28 Jun 2020 17:44:28 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-41.ams2.redhat.com [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCEB95D9D5;
 Sun, 28 Jun 2020 17:44:27 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 5/5] chtrt5645: Restore stereo sound output when
 switching from MonoSpeaker to Headphones
Date: Sun, 28 Jun 2020 19:44:21 +0200
Message-Id: <20200628174421.115133-5-hdegoede@redhat.com>
In-Reply-To: <20200628174421.115133-1-hdegoede@redhat.com>
References: <20200628174421.115133-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
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

Commit fe3b0bdc2f43 ("chtrt5645: merge all possible configurations to
HiFi.conf") missed the part of the removed HiFi-mono-speaker-analog-mic.conf
file which restores stereo mixing (instead of mixing left + right to the
left DAC mixer output) when switching from the mono speaker setup to the
headphones output.

This was causing both left and right channels to only be played on the
left ear of the headphones. This commit fixes this.

Fixes: fe3b0bdc2f43 ("chtrt5645: merge all possible configurations to HiFi.conf")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/chtrt5645/HiFi.conf | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/ucm2/chtrt5645/HiFi.conf b/ucm2/chtrt5645/HiFi.conf
index 5d0e3bf..10b0a1c 100644
--- a/ucm2/chtrt5645/HiFi.conf
+++ b/ucm2/chtrt5645/HiFi.conf
@@ -93,6 +93,11 @@ SectionDevice."Speaker" {
 				cset "name='Stereo DAC MIXL DAC R1 Switch' 1"
 				cset "name='Stereo DAC MIXR DAC R1 Switch' 0"
 			]
+			DisableSequence [
+				# Undo monospeaker mixing
+				cset "name='Stereo DAC MIXL DAC R1 Switch' 0"
+				cset "name='Stereo DAC MIXR DAC R1 Switch' 1"
+			]
 		}
 	}
 
-- 
2.26.2

