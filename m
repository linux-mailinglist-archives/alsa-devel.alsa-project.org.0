Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3C72FCD00
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 09:57:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA943180E;
	Wed, 20 Jan 2021 09:56:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA943180E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611133052;
	bh=j7oOjaHZeV8USRzlTZN9apxWbXR2p8BsUd/96DlLRuY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=owZkgUA0sjJdO4WXtyJ8EpGIogTn7YyBL8va0emHvZHaYzy9EQUO5/QalIDGiu1jz
	 pwlH37tCJP7NTC9E8dHz3puqHXPqXdZ4oWbKd82Kbng6qoXODuFPcp282gZeJGV3X8
	 Q/unPXxz7GbpBrsYIttgszXOHFZM3LteMv3HWnhM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A4CEF80164;
	Wed, 20 Jan 2021 09:56:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 548B7F8016E; Wed, 20 Jan 2021 09:55:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A689F8012C
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 09:55:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A689F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="FyDGme0Q"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="BWe84NmG"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D188411F4;
 Wed, 20 Jan 2021 03:55:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 20 Jan 2021 03:55:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=M15KRObdKkzWuLgeVvfY9un5oo
 OkucyYC/axHQDJIp8=; b=FyDGme0Q118FdgR0JGB0qZFaERd8x2LMudJ0E2Apf3
 6XkTHqhdya/WWCTCHHKS9edVAy6gvI3airIkyVsNxlXqKCiQE5F6ysNY+xT8COSd
 ZXqSLdidpSaUECt76/4C+WLjmCEV5nAx32yQYIjvdfAaz9qSGFtLZIVbumhMVkST
 I4/aHl8KrIFoZK/lVBoRedzVaLVnhL3JfGyvgZGllvSUYoevYiducZwU2VVTL8mH
 2ks5Qg5E5m8M5vocj1+bQYXgIobAPI+jb4zOvlPvGcnO8UXy7F7M4mu/a3jFmu/T
 RWkNXIpcSBT5d2w5WPsUEz2/9LX8Z/cI9smH4BnI2lQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=M15KRObdKkzWuLgeV
 vfY9un5ooOkucyYC/axHQDJIp8=; b=BWe84NmGPZREldqJieD2fMVKj4hrtCNz1
 JElk0Bv9WiyLZSdRZaCqIPSKm+Q76hHyW9GrbK2tM/xNr+k8E7Tonc/yDqoIjKDK
 AnY2XO94suMvuC35AMmJ08mBv3Cv6fcOw9TtZK1bfmKRpZ3Gafo6IHHEErL0Tm0r
 gowkzhbhkd41rYMumdPMPCfkU5vjb8tkYCgPJ+p8+9ufbIjRfJakhkyjapL52KJn
 CBgAL2e0U7beBmRk2NqYhLWedbtmuBFXgCMwQQr41+e3encRyDcwTHYuV2yu5Peg
 IzyW5+D7IJRl7us2EpykzHOuzlneKIomLGCTbfBM2mgG3Grv3iEwQ==
X-ME-Sender: <xms:EfAHYHhxUEcjirNu5-iHg0-ywmOZD7urHJXxzS_x_OciWNw-t68lHQ>
 <xme:EfAHYEA8yJVlfNHAszXZsQz51cyP8GNo5ijF4AurKdZLzj6L34gfBf_2cBaggyxIE
 at93amzkroxo3daDnE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddugdduvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepvddtgeegjeejte
 ejudffhfduvdefhfevhfelleevfeefhfelhefhgeeufeetvdehnecuffhomhgrihhnpehg
 ihhthhhusgdrtghomhenucfkphepuddukedrvdegfedrjeekrdehkeenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehs
 rghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:EfAHYHF_w64_Zg0SOxRmTJLXju7WuL_YYS68CSaT4ZJwl8jwEjtawQ>
 <xmx:EfAHYEQ1zMzjmZKkEoJtuKLA3pFZMLfHDF9KCNuzNxCS-oaWVyBxdQ>
 <xmx:EfAHYEyKwflLO5Vqqca3vaKBcsVZbBVTWG4Vj_iy1jG6T0RiJ82Gxg>
 <xmx:EvAHYKa5_LUSnm0Mg_0cCq4C8ep3jVCcyWHUnKLjN0G4WLNNWbt-yg>
Received: from workstation.flets-east.jp (y078058.dynamic.ppp.asahi-net.or.jp
 [118.243.78.58])
 by mail.messagingengine.com (Postfix) with ESMTPA id BDBD7108005C;
 Wed, 20 Jan 2021 03:55:44 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH] ALSA: control: remove limitation on the number of
 user-defined control element set per card
Date: Wed, 20 Jan 2021 17:55:41 +0900
Message-Id: <20210120085541.28607-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

ALSA control core allows usespace application to register control element
set by call of ioctl(2) with SNDRV_CTL_IOCTL_ELEM_ADD request. The added
control element set is called as 'user-defined'. Currently sound card has
limitation on the number of the user-defined control element set up
to 32.

The limitation is inconvenient to drivers in ALSA firewire stack since
the drivers expect userspace applications to implement function to
control device functionalities such as mixing and routing. As the
userspace application, snd-firewire-ctl-services project starts:
https://github.com/alsa-project/snd-firewire-ctl-services/

The project supports many devices supported by ALSA firewire stack. The
limitation is mostly good since routing and mixing controls can be
represented by control element set, which includes control element with
the same parameters. Nevertheless, it's actually inconvenient to device
which has many varied functionalities. For example, plugin effect such as
channel strip and reverb has many parameters. For the case, many control
elements are required to configure the parameters and control element set
cannot aggregates controls for the parameters. At present, below models
are implemented with the control elements and actually add control element
sets over 32:

 * Apogee Emsemble (snd-bebob-ctl-service)
 * TC Electronic Konnekt 24d (snd-dice-ctl-service)
 * TC Electronic Studio Konnekt 48 (snd-dice-ctl-service)
 * TC Electronic Konnekt Live (snd-dice-ctl-service)
 * TC Electronic Impact Twin (snd-dice-ctl-service)

It could be investigated to increase the number; e.g. quadruple to the
current (=128), however it's hard to find criteria about the number for
existent sound card. This commit just removes the limitation for the
reason. ALSA control core uses UINT_MAX as the maximum number of control
elements added to a sound card. It's limitation for both in-kernel driver
and userspace application.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/sound/core.h |  1 -
 sound/core/control.c | 13 -------------
 2 files changed, 14 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index 0462c577d7a3..6b443ce0acf8 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -100,7 +100,6 @@ struct snd_card {
 	struct rw_semaphore controls_rwsem;	/* controls list lock */
 	rwlock_t ctl_files_rwlock;	/* ctl_files list lock */
 	int controls_count;		/* count of all controls */
-	int user_ctl_count;		/* count of all user controls */
 	struct list_head controls;	/* all controls for this card */
 	struct list_head ctl_files;	/* active control files */
 
diff --git a/sound/core/control.c b/sound/core/control.c
index 5165741a8400..1bcef22713f4 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -18,8 +18,6 @@
 #include <sound/info.h>
 #include <sound/control.h>
 
-/* max number of user-defined controls */
-#define MAX_USER_CONTROLS	32
 #define MAX_CONTROL_COUNT	1028
 
 struct snd_kctl_ioctl {
@@ -539,7 +537,6 @@ static int snd_ctl_remove_user_ctl(struct snd_ctl_file * file,
 	ret = snd_ctl_remove(card, kctl);
 	if (ret < 0)
 		goto error;
-	card->user_ctl_count--;
 error:
 	up_write(&card->controls_rwsem);
 	return ret;
@@ -1435,13 +1432,6 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
 			return err;
 	}
 
-	/*
-	 * The number of userspace controls are counted control by control,
-	 * not element by element.
-	 */
-	if (card->user_ctl_count + 1 > MAX_USER_CONTROLS)
-		return -ENOMEM;
-
 	/* Check the number of elements for this userspace control. */
 	count = info->owner;
 	if (count == 0)
@@ -1534,9 +1524,6 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
 	 * applications because the field originally means PID of a process
 	 * which locks the element.
 	 */
-
-	card->user_ctl_count++;
-
  unlock:
 	up_write(&card->controls_rwsem);
 	return err;
-- 
2.27.0

