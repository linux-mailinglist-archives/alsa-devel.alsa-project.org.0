Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA68544B37
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 14:04:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 982321AF2;
	Thu,  9 Jun 2022 14:03:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 982321AF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654776242;
	bh=9JZCjkvTVfjGPVqKPogMAbZIF+T/yNx5zOjLX82040E=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qy3coa4hfx7REaQTqCdnDCOSwFlKrqWdLjEnUCfO3NAN7fDfMqEoWiIWX/XBaT7En
	 1oWel+L6Vz5uSVKtn8ecus26+yvIO2AclQevo5nybKY2KJovN7bOThAsfq2RprpuY6
	 WjnKJGujlOWrFKfVkTp7MEbNVMo+wbksrkgm+ApY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3365EF80240;
	Thu,  9 Jun 2022 14:02:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 294E0F800E9; Thu,  9 Jun 2022 14:02:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89D5DF800E9
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 14:02:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89D5DF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="bMA8DQvV"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="tqJaI5gj"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C09121FE2F;
 Thu,  9 Jun 2022 12:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654776142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZGSPuo2vpqvLeffnv7w5oiy6DcJZN1bqID0bC7Nuvns=;
 b=bMA8DQvVs/4AiJBcCqEN1k2zncU3Ql8H0NPhyny3xPAQYdZy4YLp/DPUXxylMChSH+wrCn
 tu8iyoNDANiN8NsCLSJ4GJgB6WRqcK7rPXoyEC67GMU2QN/W/CuV5Ed5mufvFk8Vm/UAmq
 oYSI9zrdexmPYRykQ3Ag1kwy3CDkcCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654776142;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZGSPuo2vpqvLeffnv7w5oiy6DcJZN1bqID0bC7Nuvns=;
 b=tqJaI5gjbIt5+3wlnGMzz4jBp5ugj5fLWfax0nFB8jefF4YOYSU9vcm2L78C8zyxzXEdUF
 2kQuffdMcCZ4H6Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8F36F13A8C;
 Thu,  9 Jun 2022 12:02:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +LrDGk7hoWL1MAAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 09 Jun 2022 12:02:22 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ASoC: topology: Drop superfluous check of
 CONFIG_SND_CTL_VALIDATION
Date: Thu,  9 Jun 2022 14:02:16 +0200
Message-Id: <20220609120219.3937-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220609120219.3937-1-tiwai@suse.de>
References: <20220609120219.3937-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The compiler must be clever enough to optimize out for the no-op when
CONFIG_SND_CTL_VALIDATION is disabled.  Let's drop the superfluous
check.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/soc-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 3f9d314fba16..b101db85446f 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -535,7 +535,7 @@ static int soc_tplg_kcontrol_bind_io(struct snd_soc_tplg_ctl_hdr *hdr,
 		 * return an -EINVAL error and prevent the card from
 		 * being configured.
 		 */
-		if (IS_ENABLED(CONFIG_SND_CTL_VALIDATION) && sbe->max > 512)
+		if (sbe->max > 512)
 			k->access |= SNDRV_CTL_ELEM_ACCESS_SKIP_CHECK;
 
 		ext_ops = tplg->bytes_ext_ops;
-- 
2.35.3

