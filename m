Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4442DC346
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Dec 2020 16:39:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2D7F17FE;
	Wed, 16 Dec 2020 16:39:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2D7F17FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608133192;
	bh=dAPh8ZJGuLrb3eagfsITJU3Ex/lPNwUSYfLKN7rpEFg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SngnnemO4EFt1ApsvXWjm1i1JEGn4VBUPittQvP2bevkzZFbaxMhY0rHbdUO6PD+u
	 TSAyhTH6lgCMLWyjyhDEezaEkdmkeZ8SeyWCyb6E4HmqbX3j/JLpZ30DYlXJBHoNcA
	 ZraICiXQPzCz99Tiueth9JcbqEXVOmlilSbOBfac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8C58F80272;
	Wed, 16 Dec 2020 16:38:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E987F804BD; Wed, 16 Dec 2020 16:38:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F972F80276
 for <alsa-devel@alsa-project.org>; Wed, 16 Dec 2020 16:38:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F972F80276
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Burg6XN5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608133129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5PgrIfw1IxkkxPzFX12aQblm1NRfQqNfWU5IMNiJGH0=;
 b=Burg6XN5bELVGrEwl8KaCNC++PS5f4rZ3XisymCt+F8T9ekKabWmjrRxCN4EF2Q6vSu9WR
 0rcZm2BOx4YdJIylK+b00Yj3/k+JKDP4A4ChcJgYcknDatHWchL1DY/mzM2f1rHO7WFZVc
 HPvPmsBRdr4nvOxPQ6pkcA/FN/bgzX8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-N6FGe6nyPdWlFXEXKSbtOA-1; Wed, 16 Dec 2020 10:38:45 -0500
X-MC-Unique: N6FGe6nyPdWlFXEXKSbtOA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBA2D100559B;
 Wed, 16 Dec 2020 15:38:43 +0000 (UTC)
Received: from x1.localdomain (ovpn-116-64.ams2.redhat.com [10.36.116.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8DE460861;
 Wed, 16 Dec 2020 15:38:42 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH alsa-ucm-conf 3/3] chtnau8824: Add support for using the SOF
 driver
Date: Wed, 16 Dec 2020 16:38:38 +0100
Message-Id: <20201216153838.34945-3-hdegoede@redhat.com>
In-Reply-To: <20201216153838.34945-1-hdegoede@redhat.com>
References: <20201216153838.34945-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

The old (and currently the default) SST driver uses TDM 4 slots 24 bit
as wire format to the codec. Where as the new SOF driver uses standard
I2S 2 channel 24 bit.

Normally this should not impact the UCM settings, but on the NAU8824
the "DAC Right Channel Source" mixer setting must be set to 1 when
using TDM 4 slots and to 0 when using I2S 2 channel mode.

Getting this wrong (in either case) results in the right channel not
outputting any sound.

This commit introduces a RightOutputChannel variable which gets
set to 0/1 depending on the driver and then uses that for the
"DAC Right Channel Source" mixer setting so that we do the right
thing depending on the driver.

This has been tested on the following devices:

Medion E2215T:    Stereo speakers, analog mic
Medion E2228T:    Stereo speakers, stereo digital mics
Cube iWork 8 Air: Mono speaker, analog mic

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/chtnau8824/HiFi.conf            | 2 ++
 ucm2/codecs/nau8824/HeadPhones.conf  | 2 +-
 ucm2/codecs/nau8824/MonoSpeaker.conf | 2 +-
 ucm2/codecs/nau8824/Speaker.conf     | 2 +-
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/ucm2/chtnau8824/HiFi.conf b/ucm2/chtnau8824/HiFi.conf
index b36588f..7e6669c 100644
--- a/ucm2/chtnau8824/HiFi.conf
+++ b/ucm2/chtnau8824/HiFi.conf
@@ -1,6 +1,7 @@
 Define.Speaker "Speaker"
 Define.Mic "InternalMic"
 Define.SST "yes"
+Define.RightOutputChannel "1"
 
 If.Controls {
 	Condition {
@@ -9,6 +10,7 @@ If.Controls {
 	}
 	False {
 		Define.SST ""
+		Define.RightOutputChannel "0"
 	}
 }
 
diff --git a/ucm2/codecs/nau8824/HeadPhones.conf b/ucm2/codecs/nau8824/HeadPhones.conf
index 46ec5d7..81e6f1e 100644
--- a/ucm2/codecs/nau8824/HeadPhones.conf
+++ b/ucm2/codecs/nau8824/HeadPhones.conf
@@ -13,7 +13,7 @@ SectionDevice."Headphones" {
 
 	EnableSequence [
 		cset "name='DACL Channel Source' 0"
-		cset "name='DACR Channel Source' 1"
+		cset "name='DACR Channel Source' ${var:RightOutputChannel}"
 		cset "name='Headphone Switch' on"
 	]
 
diff --git a/ucm2/codecs/nau8824/MonoSpeaker.conf b/ucm2/codecs/nau8824/MonoSpeaker.conf
index 09edea5..098bf03 100644
--- a/ucm2/codecs/nau8824/MonoSpeaker.conf
+++ b/ucm2/codecs/nau8824/MonoSpeaker.conf
@@ -12,7 +12,7 @@ SectionDevice."Speaker" {
 
 	EnableSequence [
 		cset "name='DACL Channel Source' 0"
-		cset "name='DACR Channel Source' 1"
+		cset "name='DACR Channel Source' ${var:RightOutputChannel}"
 		# nau8824 mono speaker boards have the speaker on the right chan
 		cset "name='Speaker Left DACL Volume' 0"
 		cset "name='Speaker Left DACR Volume' 0"
diff --git a/ucm2/codecs/nau8824/Speaker.conf b/ucm2/codecs/nau8824/Speaker.conf
index 64d7eee..065a577 100644
--- a/ucm2/codecs/nau8824/Speaker.conf
+++ b/ucm2/codecs/nau8824/Speaker.conf
@@ -12,7 +12,7 @@ SectionDevice."Speaker" {
 
 	EnableSequence [
 		cset "name='DACL Channel Source' 0"
-		cset "name='DACR Channel Source' 1"
+		cset "name='DACR Channel Source' ${var:RightOutputChannel}"
 		cset "name='Speaker Left DACL Volume' 1"
 		cset "name='Speaker Left DACR Volume' 0"
 		cset "name='Speaker Right DACL Volume' 0"
-- 
2.28.0

