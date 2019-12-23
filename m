Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F247C1290F6
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Dec 2019 03:43:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 701A81686;
	Mon, 23 Dec 2019 03:43:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 701A81686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577069035;
	bh=7LEoTKGMcSZ7yD9MdQmpjY1SRClEgxuHMyEXpj94mnk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lubdu/4OaGLPh7uH4uh4PNwt4EB2l2lE7Ezslkb8zMicOgW0EKVzoAxUSGxmO5xP5
	 BT3TUz/ag1fyM1weJsxIzx3kfIi2mWagUAndX3oO0UbLyjIJn121CwiGfpTUrKCLTX
	 bGp2blO6PRoarpIVIAeDi+3VA9Aw+8dlOnpoCcrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C518F8028F;
	Mon, 23 Dec 2019 03:39:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AC94F80146; Mon, 23 Dec 2019 03:39:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4641DF80130
 for <alsa-devel@alsa-project.org>; Mon, 23 Dec 2019 03:39:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4641DF80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="IDydM7VJ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="s2COpDjn"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 122E221FFC;
 Sun, 22 Dec 2019 21:39:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 22 Dec 2019 21:39:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=2L06GNslLuWVa
 Vd2+7ghBW1mS7HfQ8i0pV4k2HJJBUc=; b=IDydM7VJ6P7lqcs0JfExXdMEXciff
 EvjvNjemg+8hiEW63yZZYaypr8mNTClUXl1tUn0oeSWcC0oLmdIvid4vo6uuivFd
 9IkFAm5E3haAwuWjh+smbOAyRzWlpn87Ber4TPi4LrF55kHLletQhomO9f2EtIx9
 M3MIVfMo3neWc1HHW70WrBCmVKgaXlrRwwv4dWh6w9sqhOM5Rp+iy8Hlay+Gsok2
 9jix+DdBHwOOUhMWZZppCMTQ/ZurWu7wUC+RLgWG3CZkr5IxzPEvQBcfFHxYJgjw
 8iZaf1gcXvSI8szLIcT59gfPWUkLyz5rLtG62nCR+OS/+mMU4S8zT1hJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=2L06GNslLuWVaVd2+7ghBW1mS7HfQ8i0pV4k2HJJBUc=; b=s2COpDjn
 4eGFxlagtuFLug/ffKjTVjFw4wC/TBLeHdCGNMFAy6ZpgZdCIxBCxXPGxRfGi8zb
 jPoxhXS4afKMxg4v/XfVg51wCMuS6tI7Q1mBpV6rzq/p7kiDBM1i403FglGBXpTv
 hqQHCexyjzage9TZdl2G7ip5xELbawyaGYLs/bO2T/RyiQqdi74rhf71Mp37IYSO
 pWK0xmvKwq1tGKxNMz71Jv4XcDHLnxsqQ5aRYsg29NO+fOtbHCO8UCQGETDU+vPX
 R8tRuNfk6CXJv05EY33xM9haDqlbhiAjUi214dxNqunydsg/QNN81MhR8S0zm5R/
 KPLAsPdoBKcPmA==
X-ME-Sender: <xms:4CgAXi-4BQZuUYXlDHWgfLkve049KNnu1BdRI-YMzMJrAeHNPQMhtA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdduledggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepud
X-ME-Proxy: <xmx:4CgAXvpjytTW26sdhESjrSddfjLLRDBhWR35pMu7vT_NK5OSRUz0xA>
 <xmx:4CgAXjpLYNvb8ek84ixZbXmOw_-b4IfS-pTPEl8CDX43t_VIDa_tFw>
 <xmx:4CgAXi2yTLnopFyAGSnCn5wO8PFp8OpZ-SrpzeCk6AfA6AyX94dEEQ>
 <xmx:4SgAXjMD10vkw72ZKT8sSueqwiGHwn9kzRctvALAcrp80btNafCyCg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 059D580060;
 Sun, 22 Dec 2019 21:39:27 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Date: Mon, 23 Dec 2019 11:39:20 +0900
Message-Id: <20191223023921.8151-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191223023921.8151-1-o-takashi@sakamocchi.jp>
References: <20191223023921.8151-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH for-5.6 3/4] ALSA: ctl: remove dimen member
	from elem_info structure
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The 'dimen' member of 'struct snd_ctl_elem_info' is designed to deliver
information to use an array of value as multi-dimensional values. This
feature is used just by echoaudio PCI driver, and fortunately it's not
used by the other applications than 'echomixer' in alsa-tools.

In a previous commit, usage of 'dimen' member is removed from echoaudio
PCI driver. Nowadays no driver/application use the feature.

This commit removes the member from structure.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/uapi/sound/asound.h |  6 +-----
 sound/core/control.c        | 32 --------------------------------
 2 files changed, 1 insertion(+), 37 deletions(-)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index efd9e1398e07..06033fc78ee4 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -1040,11 +1040,7 @@ struct snd_ctl_elem_info {
 		} enumerated;
 		unsigned char reserved[128];
 	} value;
-	union {
-		unsigned short d[4];		/* dimensions */
-		unsigned short *d_ptr;		/* indirect - obsoleted */
-	} dimen;
-	unsigned char reserved[64-4*sizeof(unsigned short)];
+	unsigned char reserved[64];
 };
 
 struct snd_ctl_elem_value {
diff --git a/sound/core/control.c b/sound/core/control.c
index 7a4d8690ce41..3fa1171dc1c2 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -758,36 +758,6 @@ static int snd_ctl_elem_list(struct snd_card *card,
 	return err;
 }
 
-static bool validate_element_member_dimension(struct snd_ctl_elem_info *info)
-{
-	unsigned int members;
-	unsigned int i;
-
-	if (info->dimen.d[0] == 0)
-		return true;
-
-	members = 1;
-	for (i = 0; i < ARRAY_SIZE(info->dimen.d); ++i) {
-		if (info->dimen.d[i] == 0)
-			break;
-		members *= info->dimen.d[i];
-
-		/*
-		 * info->count should be validated in advance, to guarantee
-		 * calculation soundness.
-		 */
-		if (members > info->count)
-			return false;
-	}
-
-	for (++i; i < ARRAY_SIZE(info->dimen.d); ++i) {
-		if (info->dimen.d[i] > 0)
-			return false;
-	}
-
-	return members == info->count;
-}
-
 static int snd_ctl_elem_info(struct snd_ctl_file *ctl,
 			     struct snd_ctl_elem_info *info)
 {
@@ -1280,8 +1250,6 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
 	if (info->count < 1 ||
 	    info->count > max_value_counts[info->type])
 		return -EINVAL;
-	if (!validate_element_member_dimension(info))
-		return -EINVAL;
 	private_size = value_sizes[info->type] * info->count;
 
 	/*
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
