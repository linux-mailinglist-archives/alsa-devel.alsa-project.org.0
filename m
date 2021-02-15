Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 483B531BB00
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Feb 2021 15:26:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C10A0167B;
	Mon, 15 Feb 2021 15:25:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C10A0167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613399175;
	bh=Y4mnOGdIkOVRxnY93hzkh0SfycjLfBvgIuVQL7RR+PE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dLB7+4jueN1EoA1nYUhrN4n4dJjp42NGpGj0tSpbJKEX7Eibo6KDxulPhdeJkQH+A
	 RIvfxNiH+xo4I/BQ2L+jY37/Jts0W3zyuoGVhdjNyKXX4tns4wqbBIKpgEtSVxBO+Q
	 qXxkSV9npID5CH9u2BunRkwxp/3aso3eLt0A9HCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D3D6F802A9;
	Mon, 15 Feb 2021 15:24:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68C66F80276; Mon, 15 Feb 2021 15:24:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1DC0F8026C
 for <alsa-devel@alsa-project.org>; Mon, 15 Feb 2021 15:24:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1DC0F8026C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="JgAInm3g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613399068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UitcAp3cUgKvV5y0duzcVJhUzRv8UhpNliTD04Wz0Jc=;
 b=JgAInm3guFr8Ab3+rO5yhRSOE9x6w5G1MTxCK/r7etQLfKGpdVgk8CopVDCkgrmz/6Tn/8
 Ru5IFCQEAvgE37XV6o9jPEgvgz17nV5K8oC3I3pq7ZIs61BpGnOUqZinfVN+Q48lsi43+i
 NFHVU3yjTfT6NKJ44+fHGt2hQEkLRRE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-c23LJxQhP625gBafVx4-pg-1; Mon, 15 Feb 2021 09:24:24 -0500
X-MC-Unique: c23LJxQhP625gBafVx4-pg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5729980196E;
 Mon, 15 Feb 2021 14:24:23 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-74.ams2.redhat.com [10.36.115.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C233519719;
 Mon, 15 Feb 2021 14:24:21 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Oder Chiou <oder_chiou@realtek.com>
Subject: [RFC 1/2] ASoC: Add new SOC_DOUBLE*_ACCESS() macros
Date: Mon, 15 Feb 2021 15:24:18 +0100
Message-Id: <20210215142419.308651-2-hdegoede@redhat.com>
In-Reply-To: <20210215142419.308651-1-hdegoede@redhat.com>
References: <20210215142419.308651-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Bard Liao <bard.liao@intel.com>
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

Add 3 new SOC_DOUBLE*_ACCESS() macros:

SOC_DOUBLE_ACCESS()
SOC_DOUBLE_EXT_ACCESS()
SOC_DOUBLE_TLV_ACCESS()

These work the same as their non _ACCESS postfixed counter-parts,
with an extra argument that allows specifying extra access flags.

This is meant to be used with the new SNDRV_CTL_ELEM_ACCESS_*_LED flags.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 include/sound/soc.h | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 3fa6c40a63b7..0136650466f3 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -100,12 +100,15 @@
 		{.reg = xreg, .rreg = xreg, .shift = xshift, \
 		 .rshift = xshift, .min = xmin, .max = xmax, \
 		 .platform_max = xmax, .invert = xinvert} }
-#define SOC_DOUBLE(xname, reg, shift_left, shift_right, max, invert) \
+#define SOC_DOUBLE_ACCESS(xname, reg, shift_left, shift_right, max, invert, elem_access) \
 {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE | (elem_access),\
 	.info = snd_soc_info_volsw, .get = snd_soc_get_volsw, \
 	.put = snd_soc_put_volsw, \
 	.private_value = SOC_DOUBLE_VALUE(reg, shift_left, shift_right, \
 					  max, invert, 0) }
+#define SOC_DOUBLE(xname, reg, shift_left, shift_right, max, invert) \
+	SOC_DOUBLE_ACCESS(xname, reg, shift_left, shift_right, max, invert, 0)
 #define SOC_DOUBLE_STS(xname, reg, shift_left, shift_right, max, invert) \
 {									\
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),		\
@@ -127,15 +130,19 @@
 	.get = snd_soc_get_volsw_range, .put = snd_soc_put_volsw_range, \
 	.private_value = SOC_DOUBLE_R_RANGE_VALUE(reg_left, reg_right, \
 					    xshift, xmin, xmax, xinvert) }
-#define SOC_DOUBLE_TLV(xname, reg, shift_left, shift_right, max, invert, tlv_array) \
+#define SOC_DOUBLE_TLV_ACCESS(xname, reg, shift_left, shift_right, max, invert, \
+			      tlv_array, elem_access) \
 {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
 	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
-		 SNDRV_CTL_ELEM_ACCESS_READWRITE,\
+		 SNDRV_CTL_ELEM_ACCESS_READWRITE |\
+		 (elem_access),\
 	.tlv.p = (tlv_array), \
 	.info = snd_soc_info_volsw, .get = snd_soc_get_volsw, \
 	.put = snd_soc_put_volsw, \
 	.private_value = SOC_DOUBLE_VALUE(reg, shift_left, shift_right, \
 					  max, invert, 0) }
+#define SOC_DOUBLE_TLV(xname, reg, shift_left, shift_right, max, invert, tlv_array) \
+	SOC_DOUBLE_TLV_ACCESS(xname, reg, shift_left, shift_right, max, invert, tlv_array, 0)
 #define SOC_DOUBLE_R_TLV(xname, reg_left, reg_right, xshift, xmax, xinvert, tlv_array) \
 {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
 	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
@@ -225,13 +232,18 @@
 	.info = snd_soc_info_volsw, \
 	.get = xhandler_get, .put = xhandler_put, \
 	.private_value = SOC_SINGLE_VALUE(xreg, xshift, xmax, xinvert, 0) }
-#define SOC_DOUBLE_EXT(xname, reg, shift_left, shift_right, max, invert,\
+#define SOC_DOUBLE_EXT_ACCESS(xname, reg, shift_left, shift_right, max, invert, elem_access,\
 	 xhandler_get, xhandler_put) \
 {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE | (elem_access),\
 	.info = snd_soc_info_volsw, \
 	.get = xhandler_get, .put = xhandler_put, \
 	.private_value = \
 		SOC_DOUBLE_VALUE(reg, shift_left, shift_right, max, invert, 0) }
+#define SOC_DOUBLE_EXT(xname, reg, shift_left, shift_right, max, invert,\
+		       xhandler_get, xhandler_put) \
+	SOC_DOUBLE_EXT_ACCESS(xname, reg, shift_left, shift_right, max, invert, 0,\
+			      xhandler_get, xhandler_put)
 #define SOC_DOUBLE_R_EXT(xname, reg_left, reg_right, xshift, xmax, xinvert,\
 	 xhandler_get, xhandler_put) \
 {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
-- 
2.30.1

