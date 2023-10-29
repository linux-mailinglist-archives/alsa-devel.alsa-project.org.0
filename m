Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 641067DACE4
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Oct 2023 15:56:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC689850;
	Sun, 29 Oct 2023 15:55:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC689850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698591410;
	bh=btxD72lpMzY3aJxfuNT5EYXr6BbJvuWnHu3lPrgdVT8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gvE2IbFYRegbADe3GNELb2G/eWkRsmRU10jNN2yE3g9Wh2rQOvCwnqLBtnRDXDOOp
	 Q9vN3nksZ9PCP64eAzg/EBOnt/XWCfK5cV2jeQ52F3h/FbLLdmSiO0oYae2yMi75Va
	 YT5V8lJnu6KTKBVZIIDpQhVU3imKbWAOkdl8k+Kk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29569F80431; Sun, 29 Oct 2023 15:55:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87A87F8016D;
	Sun, 29 Oct 2023 15:55:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13A2BF8020D; Sun, 29 Oct 2023 15:51:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50610F80152
	for <alsa-devel@alsa-project.org>; Sun, 29 Oct 2023 15:50:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50610F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=TSsL3SGm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698591013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mBc5E1xWYonXlxwl9lV0yPbwYoN0HhD73jZxdJzFetw=;
	b=TSsL3SGmtzv9OKUyOgCeccaX9WPzCsKGDL4XruGkFM3lEmyyPzuWJfwJcH4qGbxmSlbHYi
	jSFUqnm20zXqmcsbGMbnccrkf7uiGpOe8b2IQreYH49VDg0KrdMuEomJV9QmZTxj1gvRIW
	7k0i2y9nsOYdsaFFkGkCdBRqRiT7D1U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-CuUMr9cQO2KV8BFkLLGP1w-1; Sun, 29 Oct 2023 10:50:10 -0400
X-MC-Unique: CuUMr9cQO2KV8BFkLLGP1w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D16B685CBE3;
	Sun, 29 Oct 2023 14:50:09 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.84])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BDF33502D;
	Sun, 29 Oct 2023 14:50:08 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <bard.liao@intel.com>,
	alsa-devel@alsa-project.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH alsa-ucm-conf] codecs/es8316: Fix mono speaker settings from
 previous boot getting applied
Date: Sun, 29 Oct 2023 15:50:07 +0100
Message-ID: <20231029145007.24106-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: HCR6XRPQQ2XK75T5EVIJBI2WLYL4JRSF
X-Message-ID-Hash: HCR6XRPQQ2XK75T5EVIJBI2WLYL4JRSF
X-MailFrom: hdegoede@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HCR6XRPQQ2XK75T5EVIJBI2WLYL4JRSF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When codecs/es8316/MonoSpeaker.conf's EnableSeq was run last before
shutdown the 'Playback Polarity' and 'DAC Mono Mix Switch' controls for
Mono Speaker output get saved and restored on the next boot.

These settings are undone by the MonoSpeaker DisableSeq, but that never
runs when an updated kernel switches from the default "cfg-spk:1" in
components to "cfg-spk:2" for devices which do actually have 2 speakers,
which causes the ucm profile to use codecs/es8316/Speaker.conf instead.

Set the 'Playback Polarity' and 'DAC Mono Mix Switch' controls to their
defaults in codecs/es8316/EnableSeq.conf to avoid them getting stuck
in Mono mix mode in this scenario.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/codecs/es8316/EnableSeq.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ucm2/codecs/es8316/EnableSeq.conf b/ucm2/codecs/es8316/EnableSeq.conf
index b6c81d8..b75c4a7 100644
--- a/ucm2/codecs/es8316/EnableSeq.conf
+++ b/ucm2/codecs/es8316/EnableSeq.conf
@@ -22,4 +22,8 @@ EnableSequence [
 	# Setup muxes / switches
 	cset "name='Left Headphone Mixer Left DAC Switch' on"
 	cset "name='Right Headphone Mixer Right DAC Switch' on"
+
+	# Undo MonoSpeaker settings which may have been saved on shutdown
+	cset "name='Playback Polarity' 0"
+	cset "name='DAC Mono Mix Switch' off"
 ]
-- 
2.41.0

