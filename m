Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC463CCA2A
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Jul 2021 19:59:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 552BE1655;
	Sun, 18 Jul 2021 19:58:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 552BE1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626631174;
	bh=VNKz0tQ2phARM5JEN+h+0MDFE3H3qXiFXSSdw/QW2qM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YXI49RZznp96xX6UmziCnyRURp3hkZZ2B3A466bMMhb0A6Id+e9CyIprT0kkoDbFi
	 2VgrFSW0gwwwNl2nMDve0C3IVS5VjYYLWunT8OF5cF9iVwm/mIUTiLasGhCW+lP890
	 06MJwo6ojXm8n/m3NvoZG0Nfpt0yEuO42SdwFTDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE0A3F80423;
	Sun, 18 Jul 2021 19:58:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 399C7F80423; Sun, 18 Jul 2021 19:58:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88140F80141
 for <alsa-devel@alsa-project.org>; Sun, 18 Jul 2021 19:57:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88140F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="IVxQHDkc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626631077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C09BpuNzXzK4t0hQBUTNwlYuq6KValcz1xM5zBbzosI=;
 b=IVxQHDkcHPYLQkL9Gor2hSomprm7PB6x0Uf38c6FESktZo04GK0Vr2gs3aKSkiMmooMNTX
 RtrydTEKSUuSU2V66WoNPsCtRnEYGvrdRZ0xkZ1RULjWKon9xdp5ZTkRVPCZWMUY6zRLyN
 O44FwH/aPzeI1HSjbMwAihNl3J4wdOs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10--8G_-3VJNsa5yfF3rIsILg-1; Sun, 18 Jul 2021 13:57:55 -0400
X-MC-Unique: -8G_-3VJNsa5yfF3rIsILg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5995D802C80;
 Sun, 18 Jul 2021 17:57:54 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-58.ams2.redhat.com [10.36.112.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2701960871;
 Sun, 18 Jul 2021 17:57:53 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH alsa-ucm-conf 2/2] codecs/rt5640: Rename DAPM PIN switches to
 avoid having 2 Speaker and Headphones switches
Date: Sun, 18 Jul 2021 19:57:50 +0200
Message-Id: <20210718175750.12353-2-hdegoede@redhat.com>
In-Reply-To: <20210718175750.12353-1-hdegoede@redhat.com>
References: <20210718175750.12353-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, Dmitry Osipenko <digetx@gmail.com>,
 alsa-devel@alsa-project.org,
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

Now that we rename the mutes from their weird 'Channel Switch' postfix
to the standard 'Playback Switch' postfix we end up having 2 Switches
for the 'Speaker' resp. 'Headphones' volume controls, with 1 of the two
getting ignored by the alsa-lib mixer code because it is duplicate.

This is caused by the bytcr-rt5640 machine driver adding DAPM PIN
Switches which are named 'Headphone Switch' resp. 'Speaker Switch',
rename these to 'Headphone Output Switch' / 'Speaker Output Switch'
so that they get seen as separate controls by the alsa-lib mixer code.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/codecs/rt5640/init.conf | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/ucm2/codecs/rt5640/init.conf b/ucm2/codecs/rt5640/init.conf
index 38baee4..0756b4a 100644
--- a/ucm2/codecs/rt5640/init.conf
+++ b/ucm2/codecs/rt5640/init.conf
@@ -5,8 +5,13 @@ LibraryConfig.remap.Config {
 		"name='IN1 Boost'" "name='IN1 Boost Capture Volume'"
 		"name='IN2 Boost'" "name='IN2 Boost Capture Volume'"
 		"name='IN3 Boost'" "name='IN3 Boost Capture Volume'"
+		# Rename the 'Headphone Switch' DAPM PIN switch to avoid it getting
+		# grouped with 'Headphone Playback Volume'
+		"name='Headphone Switch'" "name='Headphone Output Switch'"
 		"name='HP Playback Volume'" "name='Headphone Playback Volume'"
 		"name='HP Channel Switch'" "name='Headphone Playback Switch'"
+		# Idem for the 'Speaker Switch'
+		"name='Speaker Switch'" "name='Speaker Output Switch'"
 		"name='Speaker Channel Switch'" "name='Speaker Playback Switch'"
 	}
 
-- 
2.31.1

