Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D86CD4D1A48
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 15:21:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68A761712;
	Tue,  8 Mar 2022 15:20:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68A761712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646749275;
	bh=aanfOJV7AC23VfwF3CLjCBUOEEseCGvDAuZZLOIGs2c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q9DoshjFGVhfWoM/QgKxV4EFgQnYg5qiXJHp/dYH96o1sW83SYNzBpRZbugDEN2io
	 Ac6408ElBY7UHfW6izE3yRqMSnfj7M1sy5RByaabDZePJf0NLtoE64LI8fyJ8Nzwlt
	 Osu3hCEjwLZXxh+LIIf+o7xjJ4FbEQ5HmAqMVhMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFB5BF800D2;
	Tue,  8 Mar 2022 15:20:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88298F8026A; Tue,  8 Mar 2022 15:20:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03551F800D1
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 15:19:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03551F800D1
X-QQ-mid: bizesmtp72t1646749192tnj1p904
Received: from localhost.localdomain ( [114.222.120.105])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 08 Mar 2022 22:19:45 +0800 (CST)
X-QQ-SSF: 01400000002000C0I000B00A0000000
X-QQ-FEAT: +frVms9LjlpphZQq1TQE4txJeZ4Ct3/bYc4jxNrpvjoCjzk7SUf7NebxCA01P
 SqFfMPXogaxMZBgwBM8mMxzg+qMKLZ1qcUesjS1rHrAHR731GMzCzQKkYxUgO59vdmQu4Ar
 PE91n0RUgDJpdi27EZ3cT5H2AswkNKZXnFE9lmWNBD2ELxAOO8lXE5Td5wfovy9ADqHEwJt
 eAaYj5K1fWAKnlPOR7B/cid/ne7kPk5PwZf7n3jW9xWmZGPoeqToL2BJQ8xJa+qP50eQ3Ze
 7iHHyi4SIeizTq+WIcgY59NN1Y6mhMjXJVXjMJkqGVLEzGcAyIRXTW+khgiwKF1MgWLNfVG
 7/TPmgklf/tTU3QG1FjuMVyotqLhgiWFQm+0FPg
X-QQ-GoodBg: 2
From: Lianjie Zhang <zhanglianjie@uniontech.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v3] ASoC: Intel: catpt: use asoc_substream_to_rtd()
Date: Tue,  8 Mar 2022 22:19:36 +0800
Message-Id: <20220308141936.59331-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Lianjie Zhang <zhanglianjie@uniontech.com>
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

Now we can use asoc_substream_to_rtd() macro,
let's use it.

Signed-off-by: Lianjie Zhang <zhanglianjie@uniontech.com>

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 939a9b801dec..a26000cd5ceb 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -74,7 +74,7 @@ static struct catpt_stream_template *catpt_topology[] = {
 static struct catpt_stream_template *
 catpt_get_stream_template(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtm = substream->private_data;
+	struct snd_soc_pcm_runtime *rtm = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtm, 0);
 	enum catpt_stream_type type;

@@ -593,7 +593,7 @@ static int catpt_component_pcm_construct(struct snd_soc_component *component,
 static int catpt_component_open(struct snd_soc_component *component,
 				struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtm = substream->private_data;
+	struct snd_soc_pcm_runtime *rtm = asoc_substream_to_rtd(substream);

 	if (!rtm->dai_link->no_pcm)
 		snd_soc_set_runtime_hwparams(substream, &catpt_pcm_hardware);
@@ -604,7 +604,7 @@ static snd_pcm_uframes_t
 catpt_component_pointer(struct snd_soc_component *component,
 			struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtm = substream->private_data;
+	struct snd_soc_pcm_runtime *rtm = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtm, 0);
 	struct catpt_stream_runtime *stream;
 	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
--
2.20.1



