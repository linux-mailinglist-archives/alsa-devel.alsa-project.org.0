Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD7E4D0299
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 16:21:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D029116FB;
	Mon,  7 Mar 2022 16:20:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D029116FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646666508;
	bh=Zs95eP1BilLHQkkVohzQtrENVHLlGGsc6C/CJDNHmLQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fo/Rm5+FGfgAEusF4/Ow/LqLU2i7oNDoU3GOIWFIyYCVaUjIwTL3GTK4JQnyOXqiX
	 5sWy0sMKBfGXRCZWMZsDqEpJtMc6jAJZZpcJlm/LNtr0ZnU8vanvva4Wsa7xHjlW3D
	 vnpYILb3KNJxRI9X+bxVLtfj6t3D+0bwkkol7+a4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E2DAF80124;
	Mon,  7 Mar 2022 16:20:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5103CF8013F; Mon,  7 Mar 2022 16:20:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25429F80124
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 16:20:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25429F80124
X-QQ-mid: bizesmtp90t1646666426tldfkns3
Received: from localhost.localdomain ( [114.222.120.105])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 07 Mar 2022 23:20:20 +0800 (CST)
X-QQ-SSF: 01400000002000C0I000B00A0000000
X-QQ-FEAT: FXvDfBZI5O5S/McaXi3cuxWk1Q1MS5RO0634j6zHeJ9soIovgRq6aHksoO4dB
 Fp+b/c1Eh+7wKGISBy/dpcDywCZoSh/PorAiLF2JoJLO/zfLzgBVRQo1jaSKywaWNMgfBmq
 udq3gkFSgNmO8wt6ba0wTPVfnJi1wxRu+JDGgGcyKcKLLmlXI9utNVYV+4Gdb01J9DOM6hi
 A+9wq3gOzss2m6x1WSlXjcatagVz19ri8Mb+WTlo/ZgI6cKrmML7DOgjmn4VWAHYVSYaogb
 /jFf5aS3soon7mlQzyf/euGpParnitMfQehTT29NK2NtN5XH0NYHDSe0vd1RzuSo/KnvyV/
 3SRYxUz/TAluAkQTabdsQUnw2K+c32319vcITKnvnSb+9v/9RI=
X-QQ-GoodBg: 2
From: Lianjie Zhang <zhanglianjie@uniontech.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v2] ASoC: Intel: catpt: use asoc_substream_to_rtd()
Date: Mon,  7 Mar 2022 23:19:39 +0800
Message-Id: <20220307151939.32870-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
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
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

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



