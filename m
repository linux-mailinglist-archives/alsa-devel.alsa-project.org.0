Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A061CA547
	for <lists+alsa-devel@lfdr.de>; Fri,  8 May 2020 09:36:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAAC1185B;
	Fri,  8 May 2020 09:35:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAAC1185B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588923390;
	bh=b1/YLFC+l6epGRK0csxeBGfOSfYmlenINjpg49VDwYs=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kt+CEHjZ3sz9ZfoGypeRJyPo0Ff1wIeIaNmYwM3Ciph8OsAoww7/fkyQMp4putuO0
	 rDUqgASFXByIUhd3qsqvb3yot3yGvpcB9f52RKesD6ccavGapTROKojngmrxTgQ/nS
	 o5/iDOJHNjMtwMwZ6VFjUZcOccpIYATR2mZaXK1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF0ADF80299;
	Fri,  8 May 2020 09:33:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DFE6F80162; Thu,  7 May 2020 21:18:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0E4FF8011C
 for <alsa-devel@alsa-project.org>; Thu,  7 May 2020 21:17:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0E4FF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="F4e/oI0N"
Received: from embeddedor (unknown [189.207.59.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 94100208D6;
 Thu,  7 May 2020 19:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588879077;
 bh=b1/YLFC+l6epGRK0csxeBGfOSfYmlenINjpg49VDwYs=;
 h=Date:From:To:Cc:Subject:From;
 b=F4e/oI0NaaKvrBApNt24/dZC1saXWd8uYNKxsmU5yUG+byaspmcBnOEtx5MGTrRTT
 D+SWYBU9d7o55LtwkRevIdSjZlA3cqxe9Yn3Jhph1oHpckG7n8ViaUUFsKnsYQ48TJ
 0cGOJmJEepFSp37TN2BJZaM0vAUxKx2e+gdet7rs=
Date: Thu, 7 May 2020 14:22:23 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: Replace zero-length array with flexible-array
Message-ID: <20200507192223.GA16335@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 08 May 2020 09:33:05 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

sizeof(flexible-array-member) triggers a warning because flexible array
members have incomplete type[1]. There are some instances of code in
which the sizeof operator is being incorrectly/erroneously applied to
zero-length arrays and the result is zero. Such instances may be hiding
some bugs. So, this work (flexible-array member conversions) will also
help to get completely rid of those sorts of issues.

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 include/sound/control.h     |    2 +-
 include/sound/intel-nhlt.h  |    6 +++---
 sound/core/oss/pcm_plugin.h |    2 +-
 sound/usb/usx2y/usbusx2y.h  |    2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/sound/control.h b/include/sound/control.h
index 11feeee31e35..aeaed2a05bae 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -75,7 +75,7 @@ struct snd_kcontrol {
 	unsigned long private_value;
 	void *private_data;
 	void (*private_free)(struct snd_kcontrol *kcontrol);
-	struct snd_kcontrol_volatile vd[0];	/* volatile data */
+	struct snd_kcontrol_volatile vd[];	/* volatile data */
 };
 
 #define snd_kcontrol(n) list_entry(n, struct snd_kcontrol, list)
diff --git a/include/sound/intel-nhlt.h b/include/sound/intel-nhlt.h
index f657fd8fc0ad..743c2f442280 100644
--- a/include/sound/intel-nhlt.h
+++ b/include/sound/intel-nhlt.h
@@ -50,7 +50,7 @@ enum nhlt_device_type {
 
 struct nhlt_specific_cfg {
 	u32 size;
-	u8 caps[0];
+	u8 caps[];
 } __packed;
 
 struct nhlt_fmt_cfg {
@@ -60,7 +60,7 @@ struct nhlt_fmt_cfg {
 
 struct nhlt_fmt {
 	u8 fmt_count;
-	struct nhlt_fmt_cfg fmt_config[0];
+	struct nhlt_fmt_cfg fmt_config[];
 } __packed;
 
 struct nhlt_endpoint {
@@ -80,7 +80,7 @@ struct nhlt_endpoint {
 struct nhlt_acpi_table {
 	struct acpi_table_header header;
 	u8 endpoint_count;
-	struct nhlt_endpoint desc[0];
+	struct nhlt_endpoint desc[];
 } __packed;
 
 struct nhlt_resource_desc  {
diff --git a/sound/core/oss/pcm_plugin.h b/sound/core/oss/pcm_plugin.h
index 8d2f7a4e3ab6..46e273bd4a78 100644
--- a/sound/core/oss/pcm_plugin.h
+++ b/sound/core/oss/pcm_plugin.h
@@ -64,7 +64,7 @@ struct snd_pcm_plugin {
 	char *buf;
 	snd_pcm_uframes_t buf_frames;
 	struct snd_pcm_plugin_channel *buf_channels;
-	char extra_data[0];
+	char extra_data[];
 };
 
 int snd_pcm_plugin_build(struct snd_pcm_substream *handle,
diff --git a/sound/usb/usx2y/usbusx2y.h b/sound/usb/usx2y/usbusx2y.h
index e0f77172ce8f..144b85f57bd2 100644
--- a/sound/usb/usx2y/usbusx2y.h
+++ b/sound/usb/usx2y/usbusx2y.h
@@ -18,7 +18,7 @@ struct snd_usX2Y_AsyncSeq {
 struct snd_usX2Y_urbSeq {
 	int	submitted;
 	int	len;
-	struct urb	*urb[0];
+	struct urb	*urb[];
 };
 
 #include "usx2yhwdeppcm.h"

