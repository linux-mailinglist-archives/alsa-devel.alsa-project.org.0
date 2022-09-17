Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FF55BB82D
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Sep 2022 14:25:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3662CAEA;
	Sat, 17 Sep 2022 14:25:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3662CAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663417554;
	bh=he7PC1SPBJz2FZeLrLRV2ckdFtszlUAL9yasCvOK6m4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ejh6bTnGZtGIigxxtwgBGp3xMekt63txE/3O6FxfJhLcl70LzNRffz01mYj8k2Ryu
	 fsuylX6fcYvaX+ZsqEMIA41ATX/BCFBxGU3vv0Kg7NPLDb0xd2ohnc239edP537huf
	 i5j/tQuJA41DTs82PFdDOV8VD3TcKZIpEH6No+Ec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97556F8047B;
	Sat, 17 Sep 2022 14:24:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAAEFF800E9; Sat, 17 Sep 2022 14:24:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85C3FF800E9
 for <alsa-devel@alsa-project.org>; Sat, 17 Sep 2022 14:24:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85C3FF800E9
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MV95B326yz14QQM;
 Sat, 17 Sep 2022 20:20:46 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 17 Sep 2022 20:24:48 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 17 Sep
 2022 20:24:47 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next 2/2] ALSA: mtpav: Switch to use list_for_each_entry()
 helper
Date: Sat, 17 Sep 2022 20:31:55 +0800
Message-ID: <20220917123155.1899689-2-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220917123155.1899689-1-yangyingliang@huawei.com>
References: <20220917123155.1899689-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Cc: tiwai@suse.com
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

Use list_for_each_entry() helper instead of list_for_each() and
list_entry() to simplify code a bit. No functional change.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 sound/drivers/mtpav.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/drivers/mtpav.c b/sound/drivers/mtpav.c
index f212f233ea61..717577e2a609 100644
--- a/sound/drivers/mtpav.c
+++ b/sound/drivers/mtpav.c
@@ -623,7 +623,6 @@ static int snd_mtpav_get_RAWMIDI(struct mtpav *mcard)
 	int rval;
 	struct snd_rawmidi *rawmidi;
 	struct snd_rawmidi_substream *substream;
-	struct list_head *list;
 
 	if (hwports < 1)
 		hwports = 1;
@@ -640,13 +639,15 @@ static int snd_mtpav_get_RAWMIDI(struct mtpav *mcard)
 	rawmidi = mcard->rmidi;
 	rawmidi->private_data = mcard;
 
-	list_for_each(list, &rawmidi->streams[SNDRV_RAWMIDI_STREAM_INPUT].substreams) {
-		substream = list_entry(list, struct snd_rawmidi_substream, list);
+	list_for_each_entry(substream,
+			    &rawmidi->streams[SNDRV_RAWMIDI_STREAM_INPUT].substreams,
+			    list) {
 		snd_mtpav_set_name(mcard, substream);
 		substream->ops = &snd_mtpav_input;
 	}
-	list_for_each(list, &rawmidi->streams[SNDRV_RAWMIDI_STREAM_OUTPUT].substreams) {
-		substream = list_entry(list, struct snd_rawmidi_substream, list);
+	list_for_each_entry(substream,
+			    &rawmidi->streams[SNDRV_RAWMIDI_STREAM_OUTPUT].substreams,
+			    list) {
 		snd_mtpav_set_name(mcard, substream);
 		substream->ops = &snd_mtpav_output;
 		mcard->ports[substream->number].hwport = translate_subdevice_to_hwport(mcard, substream->number);
-- 
2.25.1

