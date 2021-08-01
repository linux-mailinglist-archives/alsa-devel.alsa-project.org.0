Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2390C3DCDDE
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Aug 2021 23:08:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3BFF17BE;
	Sun,  1 Aug 2021 23:07:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3BFF17BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627852085;
	bh=dEz5Y9wu3HlZQOcDvwcoD9f65tOds+pbMY6SGOgYM/k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D1HTl/EqqyJqReECpO8VvJ5sMb+3JHF9TkpLJcqkzzFOgjB+wcjEnjhtBd7F/NOet
	 ktN3/it/A6n3/+RPrKF3/bC4fDFGjUIUikUc+TPAFOaPc/QPyvVfpxB7lpMus1/d3D
	 VGVyfb/Z23Q0e+5dVquKYhdxk3o6xmmh+otG01bA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D5A5F804FF;
	Sun,  1 Aug 2021 23:04:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67581F804FF; Sun,  1 Aug 2021 23:04:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B0C0F804FD
 for <alsa-devel@alsa-project.org>; Sun,  1 Aug 2021 23:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B0C0F804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="T0dUYWj0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627851890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XmvorfxQlPiUKu74j7gCSj4Nq3j0U05mEAr1c2l+lEo=;
 b=T0dUYWj0zpqP0aw1MvutKPLngYrjWnDxJ5v8a7yzBsXcJhaIOscaqSWWFDcVk8lZsa2Lvp
 je2RLa6LbhnnUmylYVR9S0IlsCYnehdqwNvjcjabVi+P7EcgTB8x/pkI8Od4kXz9NfI8xf
 q348junEAnwO++sc/noYjSkF0iogzZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-buRfGC9OP_iVY82JwTXdvA-1; Sun, 01 Aug 2021 17:04:48 -0400
X-MC-Unique: buRfGC9OP_iVY82JwTXdvA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39C21107ACF5;
 Sun,  1 Aug 2021 21:04:47 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EA4E608BA;
 Sun,  1 Aug 2021 21:04:45 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 6/6] ASoC: Intel: bytcr_rt5640: Fix HP ElitePad 1000 G2 quirk
Date: Sun,  1 Aug 2021 23:04:31 +0200
Message-Id: <20210801210431.161775-7-hdegoede@redhat.com>
In-Reply-To: <20210801210431.161775-1-hdegoede@redhat.com>
References: <20210801210431.161775-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
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

The HP Elitepad 1000 G2 has 2 headset jacks:

1. on the dock which uses the output of the codecs built-in HP-amp +
the standard IN2 input which is always used with the headset-jack.

2. on the tablet itself, this uses the line-out of the codec, combined
with an external HP-amp + IN1 for the headset-mic.

Fix the HP ElitePad 1000 G2 to properly reflect this now that the
machine-driver supports this setup.

Note this also changes the mapping for the internal mic. from
IN1 (which was pointing to the 2nd headset-jack mic) to DMIC2
which is the actual input for the internal mics.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=213415
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 7bf848a07553..32afeaf6056b 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -644,8 +644,11 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "HP ElitePad 1000 G2"),
 		},
-		.driver_data = (void *)(BYT_RT5640_IN1_MAP |
-					BYT_RT5640_MCLK_EN),
+		.driver_data = (void *)(BYT_RT5640_DMIC2_MAP |
+					BYT_RT5640_MCLK_EN |
+					BYT_RT5640_LINEOUT |
+					BYT_RT5640_LINEOUT_AS_HP2 |
+					BYT_RT5640_HSMIC2_ON_IN1),
 	},
 	{	/* HP Pavilion x2 10-k0XX, 10-n0XX */
 		.matches = {
-- 
2.31.1

