Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3C829BE3
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 18:12:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DFD4172F;
	Fri, 24 May 2019 18:12:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DFD4172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558714372;
	bh=Pbpb75kbZdiY/D7w2nQhJwvhGFLj5sun7xvOTyHakSk=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UtOK9CUJWirQadbTfuCYhi6feK13fZFVnBK8VQsAbAOi5WanFPDR+4aJTxG7NHfc9
	 cwXQD9gb5KblkS3m/HfRQv2jwlSFUaj2ZtVhmP8HmUBvVORYhHdqgJorxL+I3vsTsJ
	 CVdq7nijIXxR407bVBTb//wFDd00ZJ2NPy67w7kQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 976D7F80C0F;
	Fri, 24 May 2019 18:11:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AF3CF89630; Fri, 24 May 2019 18:11:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from gateway33.websitewelcome.com (gateway33.websitewelcome.com
 [192.185.146.87])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E831F806F7
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 18:10:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E831F806F7
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
 by gateway33.websitewelcome.com (Postfix) with ESMTP id 1EE2CB4FA38
 for <alsa-devel@alsa-project.org>;
 Fri, 24 May 2019 11:10:56 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id UCmVhnggGYTGMUCmVho5LS; Fri, 24 May 2019 11:10:56 -0500
X-Authority-Reason: nr=8
Received: from [189.250.47.159] (port=47748 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hUCmS-001c1Z-RV; Fri, 24 May 2019 11:10:55 -0500
Date: Fri, 24 May 2019 11:10:51 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Message-ID: <20190524161051.GA26061@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.47.159
X-Source-L: No
X-Exim-ID: 1hUCmS-001c1Z-RV
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.47.159]:47748
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 5
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [alsa-devel] [PATCH] ASoC: SOF: topology: Use struct_size() helper
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

Make use of the struct_size() helper instead of an open-coded version
in order to avoid any potential type mistakes, in particular in the
context in which this code is being used.

So, replace the following form:

sizeof(struct sof_ipc_ctrl_data) + sizeof(struct sof_ipc_ctrl_value_chan) *
	le32_to_cpu(mc->num_channels)

with:

struct_size(scontrol->control_data, chanv, le32_to_cpu(mc->num_channels))

and so on...

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 sound/soc/sof/topology.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index c88afa872a58..745cb875863c 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -442,9 +442,8 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 		return -EINVAL;
 
 	/* init the volume get/put data */
-	scontrol->size = sizeof(struct sof_ipc_ctrl_data) +
-			 sizeof(struct sof_ipc_ctrl_value_chan) *
-			 le32_to_cpu(mc->num_channels);
+	scontrol->size = struct_size(scontrol->control_data, chanv,
+				     le32_to_cpu(mc->num_channels));
 	scontrol->control_data = kzalloc(scontrol->size, GFP_KERNEL);
 	if (!scontrol->control_data)
 		return -ENOMEM;
@@ -501,9 +500,8 @@ static int sof_control_load_enum(struct snd_soc_component *scomp,
 		return -EINVAL;
 
 	/* init the enum get/put data */
-	scontrol->size = sizeof(struct sof_ipc_ctrl_data) +
-			 sizeof(struct sof_ipc_ctrl_value_chan) *
-			 le32_to_cpu(ec->num_channels);
+	scontrol->size = struct_size(scontrol->control_data, chanv,
+				     le32_to_cpu(ec->num_channels));
 	scontrol->control_data = kzalloc(scontrol->size, GFP_KERNEL);
 	if (!scontrol->control_data)
 		return -ENOMEM;
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
