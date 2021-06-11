Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 617503A3F3E
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 11:41:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF6F9193A;
	Fri, 11 Jun 2021 11:40:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF6F9193A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623404462;
	bh=tWWzFWkQoilsn19hZjvlIlDlGcOFXhvl2Qt66A9RJiM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tVxrgSQ2FimnswPS82g27NGtkIyLDw3cSFAce/dJy71NL3lfVCFcGHd+PsZ3wTs/i
	 Hbh8dLgLvOgSons8ry0zMw1bBzwFtOFt9dgRgoaNlyZhQYSBSvw3dfa6cTiyRZ0yJ8
	 E4HT7IaAgx0SZ0e1P49uK7NMRo5LI/6LFLG/nisE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A586F804E4;
	Fri, 11 Jun 2021 11:38:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DE6EF804CB; Fri, 11 Jun 2021 11:37:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E35F5F800FC
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 11:37:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E35F5F800FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="0Q7gBIno"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="jKiNeb8g"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B08A61AC2;
 Fri, 11 Jun 2021 05:37:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 11 Jun 2021 05:37:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=5OiXjz2blseXL
 X6uOImQq7JNfbaDCn/Hk0nGyXH7Ewg=; b=0Q7gBInoWmRgAX1IxiHVYmjP05hK+
 CfNbB8hRO8Wu66dRgEGjU/wE3ums0n+7eJwSmIhYYzkRvcYYxwpfvTvCDZn7CtK/
 MGaNz8IZiqHf25OwQ0zNVKmoG3JpZhyTtHEb2d0/0X1EoNGhwpFhj+W9p/vnKLeA
 aWz6ckyZxXuPZQDXZvbi1xQ0SmZRJLFFrxghatNmgRSrRc/dIAXzX0nhC1+EA/Vp
 DsC7PHfLwt241TqgrVD8NM3ZMPePQrUznorsrU8clvkrNKakWX/wSKA45A3UxYBM
 hNknr94nSKMSmMQHHvO4bOt7xYG9fP3ZoAdGNj7ugMB9GTjoH16Mgvtfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=5OiXjz2blseXLX6uOImQq7JNfbaDCn/Hk0nGyXH7Ewg=; b=jKiNeb8g
 9PI2mjvq8SO0lMuNKh/CGZSMbgtbKTl8L5xSxAffQoVDwUNv7zGzb4ZwQcdaJe3u
 vVSNrlO4/13pKC5VtKOTLp7GiPTMpQEcX7Q5+LySemU8AA0YxX1urYDj2UfYAaLZ
 4oA2ZYHwCwKH1uibSlfzgyjYaNFbGSSETfKIVez9PBTWCx2kNpxlV3EmrQVekiQn
 aqVDbyhFh565QQ7bK7kYDbbvkhAXcAVrmSRk+h4vrlJeGCp6DGoE9DBnVxBLsSOI
 8+9GXEelw9srI5URHBltadUNkhVwTtNbN0s5xMFP2CzJ0Ujyx4NZNP9k5bZEL0Cz
 fsQGxCZoJXahbQ==
X-ME-Sender: <xms:4C7DYF5PdRWFpE_87FfNEqdHwCTSeg03gBx2pn8XGpPOXsh0sDJdmw>
 <xme:4C7DYC5b334PCwxsgw8EinQwPRZvnPrg_IJ6OYuVm3gTLBJ-JUYXe7yzKfuK3i7yb
 6AjjpQPZZe6Deim6cs>
X-ME-Received: <xmr:4C7DYMd-zZrrElLCNxRLFAIwLukDqaEaS1gBS6AQOZVGT9VRk8yeiC16n5i2HTgfZKPzdV4-AHZ7YFoEVruqZKOmR3vSc_uANpgB9S3L7Hrn_rQZgcpM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedujedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:4C7DYOIwvT_DUW1SPP4eXLZjAWCOk3n__LMK4b57r0EUchL_ep6mGw>
 <xmx:4C7DYJKgFGYlka39CeMroxF_sNqS1a--wn0lIJtLH9L8mNfG4SDcYQ>
 <xmx:4C7DYHwmiiKIXc4uIlWVrTqMHGQ3Elu_3E9NyE4W5wrlt-8Wpd9xPQ>
 <xmx:4S7DYHi2wELUJDisVwkvkhYqnoQPINwOCYA_w_LqkNFbuRUEhZ_FTQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Jun 2021 05:37:35 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 1/6] ALSA: bebob: fulfil device entries
Date: Fri, 11 Jun 2021 18:37:25 +0900
Message-Id: <20210611093730.78254-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210611093730.78254-1-o-takashi@sakamocchi.jp>
References: <20210611093730.78254-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

Although unit directory in root directory of configuration ROM has the
same value (0x00a02d) for its specifier_id entry to express AV/C device,
it has two cases for the value (0x010001/0x014001) to version entry.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob.c | 30 +++++++++++++++++-------------
 sound/firewire/bebob/bebob.h |  9 ---------
 2 files changed, 17 insertions(+), 22 deletions(-)

diff --git a/sound/firewire/bebob/bebob.c b/sound/firewire/bebob/bebob.c
index 452317e53565..5ce25ddcbf5c 100644
--- a/sound/firewire/bebob/bebob.c
+++ b/sound/firewire/bebob/bebob.c
@@ -348,6 +348,22 @@ static const struct snd_bebob_spec spec_normal = {
 	.meter	= NULL
 };
 
+#define SPECIFIER_1394TA	0x00a02d
+
+// The immediate entry for version in unit directory differs depending on models:
+//  * 0x010001
+//  * 0x014001
+#define SND_BEBOB_DEV_ENTRY(vendor, model, data) \
+{ \
+	.match_flags	= IEEE1394_MATCH_VENDOR_ID | \
+			  IEEE1394_MATCH_MODEL_ID | \
+			  IEEE1394_MATCH_SPECIFIER_ID, \
+	.vendor_id	= vendor, \
+	.model_id	= model, \
+	.specifier_id	= SPECIFIER_1394TA, \
+	.driver_data	= (kernel_ulong_t)data \
+}
+
 static const struct ieee1394_device_id bebob_id_table[] = {
 	/* Edirol, FA-66 */
 	SND_BEBOB_DEV_ENTRY(VEN_EDIROL, 0x00010049, &spec_normal),
@@ -425,19 +441,7 @@ static const struct ieee1394_device_id bebob_id_table[] = {
 	/* Focusrite, SaffirePro 26 I/O */
 	SND_BEBOB_DEV_ENTRY(VEN_FOCUSRITE, 0x00000003, &saffirepro_26_spec),
 	/* Focusrite, SaffirePro 10 I/O */
-	{
-		// The combination of vendor_id and model_id is the same as the
-		// same as the one of Liquid Saffire 56.
-		.match_flags	= IEEE1394_MATCH_VENDOR_ID |
-				  IEEE1394_MATCH_MODEL_ID |
-				  IEEE1394_MATCH_SPECIFIER_ID |
-				  IEEE1394_MATCH_VERSION,
-		.vendor_id	= VEN_FOCUSRITE,
-		.model_id	= 0x000006,
-		.specifier_id	= 0x00a02d,
-		.version	= 0x010001,
-		.driver_data	= (kernel_ulong_t)&saffirepro_10_spec,
-	},
+	SND_BEBOB_DEV_ENTRY(VEN_FOCUSRITE, 0x000006, &saffirepro_10_spec),
 	/* Focusrite, Saffire(no label and LE) */
 	SND_BEBOB_DEV_ENTRY(VEN_FOCUSRITE, MODEL_FOCUSRITE_SAFFIRE_BOTH,
 			    &saffire_spec),
diff --git a/sound/firewire/bebob/bebob.h b/sound/firewire/bebob/bebob.h
index dff8e25c6ca3..c06579d9380e 100644
--- a/sound/firewire/bebob/bebob.h
+++ b/sound/firewire/bebob/bebob.h
@@ -253,13 +253,4 @@ extern const struct snd_bebob_spec maudio_special_spec;
 int snd_bebob_maudio_special_discover(struct snd_bebob *bebob, bool is1814);
 int snd_bebob_maudio_load_firmware(struct fw_unit *unit);
 
-#define SND_BEBOB_DEV_ENTRY(vendor, model, data) \
-{ \
-	.match_flags	= IEEE1394_MATCH_VENDOR_ID | \
-			  IEEE1394_MATCH_MODEL_ID, \
-	.vendor_id	= vendor, \
-	.model_id	= model, \
-	.driver_data	= (kernel_ulong_t)data \
-}
-
 #endif
-- 
2.30.2

