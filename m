Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FA45EB578
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 01:19:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2988A3E7;
	Tue, 27 Sep 2022 01:19:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2988A3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664234393;
	bh=Ve1292BFbx4M8vgKxaCxSGexhyBekTzktp5oNYWPKb8=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UsA83WslC+pHp2WjEzd0oIsYrAagZcczO/qHooVpuF7DLLmoNDX5lSWTBdz7ybvD9
	 3TGorhiFDgeRXCXwdt095UojEKxXm9E1osKDO5Pbiyc8TLUnWS85l+fKlaqHiKveyp
	 fbtSHaTj9CKQgE8VpFkzC9xogLUiwqmR+v5MFQvg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87108F802BE;
	Tue, 27 Sep 2022 01:18:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65F3EF8027D; Tue, 27 Sep 2022 01:18:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8955EF8011C
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 01:18:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8955EF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Nz6cDimD"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8AB69B812AA;
 Mon, 26 Sep 2022 23:18:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFEB4C433C1;
 Mon, 26 Sep 2022 23:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664234327;
 bh=Ve1292BFbx4M8vgKxaCxSGexhyBekTzktp5oNYWPKb8=;
 h=Date:From:To:Cc:Subject:From;
 b=Nz6cDimDIowy15ehXN7S8a3ttyMPzFNiN/Trx+4htJdmpst2LKfRaOuZiOvoEfnyb
 cptyIcVD6GrNIzuXUxowzxse3keIKNENcQ5fd64EzwRLHj41l45nuzTG6k+Yaqg/pf
 szCn1dm5yfeEAowiX0ThMouuWEKoGioh/TG/KGTEUgfIGydYARzBDutyzdQCJ1v8SN
 jWMyrbIy6tX03qaJYSEg2Ff3/huri6qMKVIe/V5AeZJW/Yd4M2cyyZyssN/HV4d4Py
 n2tiozKXEuZTTbyx6k0j4/8WusKNYvSmX2QQwulMMmyTdKOqazAsI1AHKlivOIYuoE
 xWRURrAPjchdQ==
Date: Mon, 26 Sep 2022 18:18:42 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH][next] ASoC: uapi: Replace zero-length arrays with
 __DECLARE_FLEX_ARRAY() helper
Message-ID: <YzIzUjUuJKf0mkKg@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: alsa-devel@alsa-project.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>
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

Zero-length arrays are deprecated and we are moving towards adopting
C99 flexible-array members, instead. So, replace zero-length arrays
declarations in anonymous union with the new __DECLARE_FLEX_ARRAY()
helper macro.

This helper allows for flexible-array members in unions.

Link: https://github.com/KSPP/linux/issues/193
Link: https://github.com/KSPP/linux/issues/227
Link: https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 include/uapi/sound/asoc.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/uapi/sound/asoc.h b/include/uapi/sound/asoc.h
index 053949287ce8..dd8ad790fc15 100644
--- a/include/uapi/sound/asoc.h
+++ b/include/uapi/sound/asoc.h
@@ -226,9 +226,9 @@ struct snd_soc_tplg_vendor_array {
 	__le32 type;	/* SND_SOC_TPLG_TUPLE_TYPE_ */
 	__le32 num_elems;	/* number of elements in array */
 	union {
-		struct snd_soc_tplg_vendor_uuid_elem uuid[0];
-		struct snd_soc_tplg_vendor_value_elem value[0];
-		struct snd_soc_tplg_vendor_string_elem string[0];
+		__DECLARE_FLEX_ARRAY(struct snd_soc_tplg_vendor_uuid_elem, uuid);
+		__DECLARE_FLEX_ARRAY(struct snd_soc_tplg_vendor_value_elem, value);
+		__DECLARE_FLEX_ARRAY(struct snd_soc_tplg_vendor_string_elem, string);
 	};
 } __attribute__((packed));
 
-- 
2.34.1

