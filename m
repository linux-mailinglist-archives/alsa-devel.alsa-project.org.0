Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFE5339CE7
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Mar 2021 09:25:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE55A18AD;
	Sat, 13 Mar 2021 09:24:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE55A18AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615623903;
	bh=pHhQeowJRFP8Kg5dqzOxnLZUfwkCM/EHGkdNGY3oxm4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OERUuxbwhZp6cg/nofN3ogVUAGdhHkb6n6H1/oOPnGsIuseSF0V2ad64btS5pzFym
	 PkDVykyyqoxgzKffjdhjuGeVTC/HyySdKSU808g2ZK5gtZQcIpbNNjeFC2eSVEADM9
	 ot/ItIOz5PSTNPadoZxNTqfwozu2FMb6EBX8c4/w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3BD6F80154;
	Sat, 13 Mar 2021 09:23:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34AB2F80227; Sat, 13 Mar 2021 09:23:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-m17635.qiye.163.com (mail-m17635.qiye.163.com
 [59.111.176.35])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5592FF80154
 for <alsa-devel@alsa-project.org>; Sat, 13 Mar 2021 09:23:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5592FF80154
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.231])
 by mail-m17635.qiye.163.com (Hmail) with ESMTPA id A99E4400159;
 Sat, 13 Mar 2021 16:23:13 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Wang Qing <wangqing@vivo.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] sound: soc: codecs: Remove unnecessary THIS_MODULE
Date: Sat, 13 Mar 2021 16:23:02 +0800
Message-Id: <1615623786-16302-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZSx1DTBhLSkoYS0IfVkpNSk5NSUhMQk9LSU9VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKSkNITVVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ORQ6Sjo5TD8LA1E5FwI#KDkQ
 IRNPCQ1VSlVKTUpOTUlITEJPSE1OVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlISllXWQgBWUFKTUJPNwY+
X-HM-Tid: 0a782aaead1cd991kuwsa99e4400159
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

As THIS_MODULE has been set in module_platform_driver(), so remove it.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 sound/soc/codecs/lpass-rx-macro.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index c9c21d22..5b9d4e9
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3585,7 +3585,6 @@ static const struct of_device_id rx_macro_dt_match[] = {
 static struct platform_driver rx_macro_driver = {
 	.driver = {
 		.name = "rx_macro",
-		.owner = THIS_MODULE,
 		.of_match_table = rx_macro_dt_match,
 		.suppress_bind_attrs = true,
 	},
-- 
2.7.4

