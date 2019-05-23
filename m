Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC85A28CE6
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 00:25:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 294CC1677;
	Fri, 24 May 2019 00:24:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 294CC1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558650328;
	bh=owzEUUeYrq93flWlH/i/D4MB9d+8MeaSyIhrlX1DItE=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hPI8eVDOND/hAeBafm5iXrzID9LwDRdXECj/rbzp7NI3VqexfyoskOgobySPoYFYZ
	 C6jCfLToGrQWatkJpw8tsIde1QIcmIUdqrdOmxGPkiXscbUHojWKvSPevXqb/QTpId
	 UVa5cZX8XwmLB0ki1UW7g8tfm2Mai28ddflujT3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEACBF89674;
	Fri, 24 May 2019 00:23:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5185FF89674; Fri, 24 May 2019 00:23:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from gateway34.websitewelcome.com (gateway34.websitewelcome.com
 [192.185.149.105])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91C40F8079B
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 00:23:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91C40F8079B
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
 by gateway34.websitewelcome.com (Postfix) with ESMTP id AFFB32E111
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 17:23:36 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id Tw7chZRaednCeTw7chFKG2; Thu, 23 May 2019 17:23:36 -0500
X-Authority-Reason: nr=8
Received: from [189.250.47.159] (port=44754 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hTw7b-001I7r-DQ; Thu, 23 May 2019 17:23:35 -0500
Date: Thu, 23 May 2019 17:23:33 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Message-ID: <20190523222333.GA22695@embeddedor>
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
X-Exim-ID: 1hTw7b-001I7r-DQ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.47.159]:44754
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 7
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [alsa-devel] [PATCH] ASoC: Intel: Skylake: Use struct_size() helper
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

uuid_params->num_modules * sizeof(struct skl_mod_inst_map) + sizeof(uuid_params->num_modules)

with:

struct_size(params, u.map, uuid_params->num_modules)

and so on...

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 sound/soc/intel/skylake/skl-topology.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 389f1862bc43..c69d999d7bf1 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -941,9 +941,7 @@ static int skl_tplg_find_moduleid_from_uuid(struct skl *skl,
 
 	if (bc->set_params == SKL_PARAM_BIND && bc->max) {
 		uuid_params = (struct skl_kpb_params *)bc->params;
-		size = uuid_params->num_modules *
-			sizeof(struct skl_mod_inst_map) +
-			sizeof(uuid_params->num_modules);
+		size = struct_size(params, u.map, uuid_params->num_modules);
 
 		params = devm_kzalloc(bus->dev, size, GFP_KERNEL);
 		if (!params)
@@ -3315,7 +3313,7 @@ static int skl_tplg_get_int_tkn(struct device *dev,
 		struct snd_soc_tplg_vendor_value_elem *tkn_elem,
 		struct skl *skl)
 {
-	int tkn_count = 0, ret, size;
+	int tkn_count = 0, ret;
 	static int mod_idx, res_val_idx, intf_val_idx, dir, pin_idx;
 	struct skl_module_res *res = NULL;
 	struct skl_module_iface *fmt = NULL;
@@ -3323,6 +3321,7 @@ static int skl_tplg_get_int_tkn(struct device *dev,
 	static struct skl_astate_param *astate_table;
 	static int astate_cfg_idx, count;
 	int i;
+	size_t size;
 
 	if (skl->modules) {
 		mod = skl->modules[mod_idx];
@@ -3366,8 +3365,8 @@ static int skl_tplg_get_int_tkn(struct device *dev,
 			return -EINVAL;
 		}
 
-		size = tkn_elem->value * sizeof(struct skl_astate_param) +
-				sizeof(count);
+		size = struct_size(skl->cfg.astate_cfg, astate_table,
+				   tkn_elem->value);
 		skl->cfg.astate_cfg = devm_kzalloc(dev, size, GFP_KERNEL);
 		if (!skl->cfg.astate_cfg)
 			return -ENOMEM;
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
