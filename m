Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A2E7A1900
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 10:37:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92CF9E86;
	Fri, 15 Sep 2023 10:36:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92CF9E86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694767026;
	bh=2FskaFo8qwDDO6yYP86wIdsmK3SX+A6vwjdce4q1G7Y=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fXVRPT7kEa0PuBrKjSMpUIs0UiL102aj2OC0sqHQ6elLwmuo3kAm4+RMV//IFbP96
	 zwFsImpeSmZ2whL6V12ji/M/6AZKarRlZa4yc0QXQPmtToHETY1cWRvaVaql5bZLTx
	 v/aEA6P5ttz42hiVVlEwLVWYnp8+k+GYqcbOLEYk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B07C9F8055B; Fri, 15 Sep 2023 10:35:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4310DF8055B;
	Fri, 15 Sep 2023 10:35:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E7C9F80425; Fri, 15 Sep 2023 04:19:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73649F80141
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 04:18:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73649F80141
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowAAXH6MMvwNlW4gRDQ--.10658S2;
	Fri, 15 Sep 2023 10:18:53 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: cezary.rojewski@intel.com,
	pierre-louis.bossart@linux.intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	kuninori.morimoto.gx@renesas.com,
	brent.lu@intel.com,
	amadeuszx.slawinski@linux.intel.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] ASoC: hdaudio.c: Add missing check for devm_kstrdup
Date: Fri, 15 Sep 2023 02:13:44 +0000
Message-Id: <20230915021344.3078-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAAXH6MMvwNlW4gRDQ--.10658S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKr18KryUtF1ftr4kAF4rAFb_yoWfKrX_Cw
	4kCa1kuFyDXrsagw4qy3ySk3WFg3W7CFyUtr95tF9rA3s5Jw43Kr13trn5uay8XrZ2yr45
	ZF1qgr4xtr9rJjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkIecxEwVAFwVW8JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
	WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
	67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
	IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
	0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
	VjvjDU0xZFpf9x0JUHWlkUUUUU=
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-MailFrom: nichen@iscas.ac.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7HKCLJOO7HXSPKG77AVVC5Y7Q7NWZ4FZ
X-Message-ID-Hash: 7HKCLJOO7HXSPKG77AVVC5Y7Q7NWZ4FZ
X-Mailman-Approved-At: Fri, 15 Sep 2023 08:35:51 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7HKCLJOO7HXSPKG77AVVC5Y7Q7NWZ4FZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Because of the potential failure of the devm_kstrdup(), the 
dl[i].codecs->name could be NULL.
Therefore, we need to check it and return -ENOMEM in order to transfer
the error.

Fixes: 97030a43371e ("ASoC: Intel: avs: Add HDAudio machine board")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 sound/soc/intel/avs/boards/hdaudio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index cb00bc86ac94..8876558f19a1 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -55,6 +55,9 @@ static int avs_create_dai_links(struct device *dev, struct hda_codec *codec, int
 			return -ENOMEM;
 
 		dl[i].codecs->name = devm_kstrdup(dev, cname, GFP_KERNEL);
+		if (!dl[i].codecs->name)
+			return -ENOMEM;
+
 		dl[i].codecs->dai_name = pcm->name;
 		dl[i].num_codecs = 1;
 		dl[i].num_cpus = 1;
-- 
2.25.1

