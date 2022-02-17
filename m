Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 545804BA65D
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Feb 2022 17:48:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 273B61959;
	Thu, 17 Feb 2022 17:47:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 273B61959
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645116523;
	bh=tnaRQiRX9UVVHLLLvLS/SPFZL3pO+8DZc56LOK87eLw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iliuLvn+aK/RdSRS9kMGbROQ9BBFqL/A2u0nM+LE0ILnMNd3jNKMFgvIfZQ2oOQUM
	 Ri5U6RIxQDpNbnFrGWbZvlj09w0UtHcSekyOYHmEKfUj99YGL+V+ejVAcR5LQ7hlCJ
	 zV6mrHrf9jjH7S0z6qWFZT3uR6uof770lKLTGp7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67E04F80515;
	Thu, 17 Feb 2022 17:47:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42833F80246; Thu, 17 Feb 2022 14:28:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from 7.mo576.mail-out.ovh.net (7.mo576.mail-out.ovh.net
 [46.105.50.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46F3DF80118
 for <alsa-devel@alsa-project.org>; Thu, 17 Feb 2022 14:28:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46F3DF80118
Received: from player715.ha.ovh.net (unknown [10.109.156.73])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 322ED22057
 for <alsa-devel@alsa-project.org>; Thu, 17 Feb 2022 13:28:39 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
 (Authenticated sender: steve@sk2.org)
 by player715.ha.ovh.net (Postfix) with ESMTPSA id 427C6275AA832;
 Thu, 17 Feb 2022 13:28:26 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006e63af0f4-c81f-4ba4-8116-8bbaba4cb0a8,
 22612CF5F7DCE3600E782894758BDCCEF4E309CF) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From: Stephen Kitt <steve@sk2.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH] ASoC: SOF: Replace zero-length array with flexible-array
 member
Date: Thu, 17 Feb 2022 14:27:55 +0100
Message-Id: <20220217132755.1786130-1-steve@sk2.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5586152390832588312
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeekgdehvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuggftrfgrthhtvghrnhepleekieffleegledvfffhkeehleejfedtgeeuiedvleduffetfeetgeffudffkeevnecuffhomhgrihhnpeifihhkihhpvgguihgrrdhorhhgpdhkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdekvddrieehrddvhedrvddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrjeduhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghlshgrqdguvghvvghlsegrlhhsrgdqphhrohhjvggtthdrohhrgh
X-Mailman-Approved-At: Thu, 17 Feb 2022 17:46:58 +0100
Cc: alsa-devel@alsa-project.org,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, Stephen Kitt <steve@sk2.org>,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
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

There is a regular need in the kernel to provide a way to declare having
a dynamically sized set of trailing elements in a structure. Kernel code
should always use "flexible array members"[1] for these cases. The older
style of one-element or zero-length arrays should no longer be used[2].

This helps with the ongoing efforts to globally enable -Warray-bounds
and get us closer to being able to tighten the FORTIFY_SOURCE routines
on memcpy().

[1] https://en.wikipedia.org/wiki/Flexible_array_member
[2] https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays

Link: https://github.com/KSPP/linux/issues/78
Link: https://github.com/KSPP/linux/issues/180
Suggested-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 include/sound/sof/topology.h | 2 +-
 sound/soc/sof/topology.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/sof/topology.h b/include/sound/sof/topology.h
index d12736e14b69..adee6afd1490 100644
--- a/include/sound/sof/topology.h
+++ b/include/sound/sof/topology.h
@@ -237,7 +237,7 @@ struct sof_ipc_comp_process {
 	/* reserved for future use */
 	uint32_t reserved[7];
 
-	uint8_t data[0];
+	uint8_t data[];
 } __packed;
 
 /* frees components, buffers and pipelines
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index e72dcae5e7ee..1d119d1dd69d 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2164,7 +2164,7 @@ static int sof_process_load(struct snd_soc_component *scomp, int index,
 	 */
 	if (ipc_data_size) {
 		for (i = 0; i < widget->num_kcontrols; i++) {
-			memcpy(&process->data + offset,
+			memcpy(&process->data[offset],
 			       wdata[i].pdata->data,
 			       wdata[i].pdata->size);
 			offset += wdata[i].pdata->size;

base-commit: f71077a4d84bbe8c7b91b7db7c4ef815755ac5e3
-- 
2.27.0

