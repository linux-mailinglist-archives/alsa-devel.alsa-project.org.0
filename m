Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9195EB4EC
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 00:59:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7A0182B;
	Tue, 27 Sep 2022 00:58:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7A0182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664233179;
	bh=xDYjoFR+NtGG53i9TMTNgZOELVNnrshin7Kn4ONKlzY=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UrpoOeW2eDv435A2y3sGb1MgIB41eQfalB7WUPdVzljqy6kJR4k9SDxlJRWdzKf0Z
	 XyKGXaEK0pxVtDb9dUT+PFlkdTi5pZzNYpYk3+6C61O4DC6BWx5cvGkY2+Xb4Qlp4n
	 QZscj6FN2AOMhZedo9kd705yPW79qq4KVoVAom/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10967F80510;
	Tue, 27 Sep 2022 00:58:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58A03F8027D; Tue, 27 Sep 2022 00:58:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A620F8027D
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 00:58:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A620F8027D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nbj97LKU"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7B1D4B81598;
 Mon, 26 Sep 2022 22:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8EBCC433D6;
 Mon, 26 Sep 2022 22:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664233103;
 bh=xDYjoFR+NtGG53i9TMTNgZOELVNnrshin7Kn4ONKlzY=;
 h=Date:From:To:Cc:Subject:From;
 b=nbj97LKUb6NIti9AtwZWlD4v8BVQ1Wh6mke62KVOELQdDAUJGJpOYxdkf129L43lR
 X+VkTgscuP4NlWdojyibYcOcW+ArKTQVhdI7RYhRXjVn8LJuMofZi4Ap/s5n67RUnj
 k8s+1IPYKS2BhVaM8EYtqhNyxVzuB4HtGWZmpkawV7FFLUA3gD3vsuHD0KT2aw0LFL
 byc2HwpWgw0agVPklgdpbbW0OXlaF4OsQgQxiPjkM84RSfyHSf55qtkXw9U84pSorN
 c2eJQIepC0mdx54aftNQowHrMLssVDKYI24NvkLOQfhmBhSc87iBkMOcAIp2/IsOA0
 yae3/wKpkKRSw==
Date: Mon, 26 Sep 2022 17:58:17 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH][next] ASoC: Intel: Skylake: Replace zero-length arrays with
 DECLARE_FLEX_ARRAY() helper
Message-ID: <YzIuiUul2CwPlkKh@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: alsa-devel@alsa-project.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>
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

Zero-length arrays are deprecated and we are moving towards adopting
C99 flexible-array members, instead. So, replace zero-length arrays
declarations in anonymous union with the new DECLARE_FLEX_ARRAY()
helper macro.

This helper allows for flexible-array members in unions.

Link: https://github.com/KSPP/linux/issues/193
Link: https://github.com/KSPP/linux/issues/226
Link: https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 sound/soc/intel/skylake/skl-topology.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-topology.h b/sound/soc/intel/skylake/skl-topology.h
index a5bccf2fcd88..017ac0ef324d 100644
--- a/sound/soc/intel/skylake/skl-topology.h
+++ b/sound/soc/intel/skylake/skl-topology.h
@@ -233,8 +233,8 @@ struct skl_uuid_inst_map {
 struct skl_kpb_params {
 	u32 num_modules;
 	union {
-		struct skl_mod_inst_map map[0];
-		struct skl_uuid_inst_map map_uuid[0];
+		DECLARE_FLEX_ARRAY(struct skl_mod_inst_map, map);
+		DECLARE_FLEX_ARRAY(struct skl_uuid_inst_map, map_uuid);
 	} u;
 };
 
-- 
2.34.1

