Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6270719ED5C
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Apr 2020 20:36:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1483167A;
	Sun,  5 Apr 2020 20:36:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1483167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586111813;
	bh=mao/9QpGMlDzNBq3i1KG4hpeGH1xnFkI7LIWAGhvZJE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XVTevYDw6MK5QOuAosD5O9X79+6+vh/9ANabkOGaQAe+Tpm+p4L55ALAou8h2Wkgt
	 Kmgwsu+p24cUjS8D4Z7k45gNyZUJ2xGVnLrq7hKO3L+bOlygF+gDA7aRKThNnu08nx
	 spaHTubRyS7S19X8FH8HSWn/1ZhXj2SreDzgARec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE543F801DA;
	Sun,  5 Apr 2020 20:35:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29DC6F80229; Sun,  5 Apr 2020 20:35:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 604E5F8015A
 for <alsa-devel@alsa-project.org>; Sun,  5 Apr 2020 20:35:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 604E5F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="FAPKzZKq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586111700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mao/9QpGMlDzNBq3i1KG4hpeGH1xnFkI7LIWAGhvZJE=;
 b=FAPKzZKqo1ACoSuX42ayb7V5JmFerdp8glxKxW9pTaOH6EIwESgl4FSZQq5JDk1rUHov8t
 NGTNMDEwi0AeXDAxHP0vHRZeSHxiVSkcDrmDZNZaUZtpts1ppV7aQuM4MC89acORFPPFDy
 FwSJ9U9l/DyZkJQsOxtkTL3gRLpugRo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-MjJtHHnRPJatWRYgH4Dg3Q-1; Sun, 05 Apr 2020 14:34:59 -0400
X-MC-Unique: MjJtHHnRPJatWRYgH4Dg3Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC2BD800D50;
 Sun,  5 Apr 2020 18:34:57 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-60.ams2.redhat.com [10.36.112.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B0BB98A51;
 Sun,  5 Apr 2020 18:34:56 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 1/5] bytcr-rt5651: Fix dmic check in HiFi-Components.conf
Date: Sun,  5 Apr 2020 20:34:50 +0200
Message-Id: <20200405183454.34515-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
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

The kernel sets cfg-mic:dmic not cfg-mic:dmic1 when a digital mic is
used. The wrong check for cfg-mic:dmic1 causes there to be no "Mic"
device at all, which causes the check for the ConflictingDevices section
of the HeadSet (mic) device to fail like e.g. so:

[hans@localhost ~]$ alsaucm -c bytcr-rt5651 set _verb HiFi set _enadev Spea=
ker
ALSA lib parser.c:1138:(verb_dev_list_add) error: unable to find device 'Mi=
c'
ALSA lib parser.c:1433:(parse_verb_file) error: device management error in =
verb 'HiFi'
ALSA lib main.c:962:(snd_use_case_mgr_open) error: failed to import bytcr-r=
t5651 use case configuration -2
alsaucm: error failed to open sound card bytcr-rt5651: No such file or dire=
ctory

This commit fixes this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/bytcr-rt5651/HiFi-Components.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ucm2/bytcr-rt5651/HiFi-Components.conf b/ucm2/bytcr-rt5651/HiF=
i-Components.conf
index 53ebcbe..d0a573e 100644
--- a/ucm2/bytcr-rt5651/HiFi-Components.conf
+++ b/ucm2/bytcr-rt5651/HiFi-Components.conf
@@ -34,11 +34,11 @@ If.headphones {
 =09}
 }
=20
-If.dmic1 {
+If.dmic {
 =09Condition {
 =09=09Type String
 =09=09Haystack "${CardComponents}"
-=09=09Needle "cfg-mic:dmic1"
+=09=09Needle "cfg-mic:dmic"
 =09}
 =09True {
 =09=09<codecs/rt5651/DigitalMic.conf>
--=20
2.26.0

