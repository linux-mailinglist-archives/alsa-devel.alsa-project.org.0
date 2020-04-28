Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 258F11BCF15
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 23:49:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C37FD169C;
	Tue, 28 Apr 2020 23:48:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C37FD169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588110584;
	bh=Eibu7ltdEXaFd8J0CWyq/u8+wuK2se+iUyrPK1bvzqk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H+dSKPuFQ844mCSAHHu+O9yf2hU3Qy0zNrA018dk/9On71hoi4nSi6EAyRskN+/vW
	 vt2MrPNkvlX85svvMODVZocCKHqxzCOVrq6qiB3MHrGlflOItd7UgKEIRDaDmy81QO
	 aP9tVAD9eTgO/SVAbQPIG17jA4oQ30ieYHLB9RAA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55BDFF80136;
	Tue, 28 Apr 2020 23:48:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCD38F80136; Tue, 28 Apr 2020 23:48:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA188F80136
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 23:48:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA188F80136
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MLi0U-1jlDUS435U-00HhCE; Tue, 28 Apr 2020 23:47:57 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: component: suppress uninitialized-variable warning
Date: Tue, 28 Apr 2020 23:47:31 +0200
Message-Id: <20200428214754.3925368-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:CwaJqqI8UP3UYQa9QLeTXBcxWgnAERLM8vCOxjOOEAo6dfRILDf
 LeO9h10wirIWDwv/JYCpujsz5ihmwXnxr5ZVnF6fjlXBTOrFpjkS7YaQllg/u4+ORwbI1DA
 kxCRbtdDyAV9QhcaU6Ziis4Gf2mVE3FsnWg1aXZZw9CUh5bIjY2/t57C93Zp4lBmTZ7TttH
 +ODOByIu1hjDFoMEOa2qA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6OOAtvjEG8Y=:39ln5prj9KTgnldiZQ01UN
 4E3DgmxckBBa2DYf+ZhSgu5LP8rnoU4Hn209TkYgCfE1JcUIQUVKc/WxtcufErSo5Cc7wuQ0C
 HzlYNLD3iSHxe5f1tCMwO8ru5sj5J/nmxJyQgnRJBVi8lw1vkMQkGitCz+OLeOY+Xkm7LQHj+
 V91Wxldp5CR+OCHKLSESyA5Nj6Rzkrh4nqMngtnppNsj2qvsL9xrnD2Iga7qBJaHX/dL+PStU
 dtKwcK1elD3BzM2KXiqaHTMVVuFlCz1zUpsUv/cikpiuzJamzjci0ZWzeBdl6RiWJiHjH+lsM
 hx3dh4hwNbG2rLrazrEwtbyddf5jJ/nAkstwqCtI0eLABTQw2U3fFUd8uTvw6hkJXQJy1RsHp
 6hfMFZo5TnxcX6XNMqRQ0wyGPO0xDafn/aDE0+zEY0JnYszQKfE85vev6MjWpsKXu8Vff+iY/
 CU4S0ZY0Dqo0udPP37uRzHRDaPBBCezqthWPPmnYPOxpIKRoZpQeqOxjJVqshsVgo/eS/XOhz
 sVaaRy6A9tzG6A/Fr3p6EEbmQlKG7/Coa6/JJX2HNLK7iCBoiqtV1Krye5+yFtr5g/qx44Vjn
 JI0JvW5voZeBQ7Z3Wg6rkaQwb4KjEIq8PIcqU6rHlwMQcACLtK1cKXHsD4RtvxI1cbLwsNrem
 gjSO8tyhRV/HJgNb/CJDwwLG3BcVxxs3gNsQHaCBW2oxsagTe4FiE7kCNQ96DGWhLp0m/g6HK
 cPul8V6+pl7neS9mdT0KYU4hbbof7Giftobzl2I8G7gB/qL5AIBUhBfchAoLWZkBBgZyLdXyK
 7RbxwSNM9GBeW26VXpc/C6BmMmULaQ6gPa4JRNaynwd9MnuCKQ=
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Shreyas NC <shreyas.nc@intel.com>
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

Old versions of gcc (tested on gcc-4.8) produce a warning for
correct code:

sound/soc/soc-compress.c: In function 'soc_compr_open':
sound/soc/soc-compress.c:75:28: error: 'component' is used uninitialized in this function [-Werror=uninitialized]
  struct snd_soc_component *component, *save = NULL;

Change the for_each_rtd_components() macro to ensure 'component'
gets initialized to a value the compiler does not complain about.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/sound/soc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 907afbc652f2..69a82487fa9b 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1179,7 +1179,7 @@ struct snd_soc_pcm_runtime {
 #define asoc_rtd_to_codec(rtd, n) (rtd)->dais[n + (rtd)->num_cpus]
 
 #define for_each_rtd_components(rtd, i, component)			\
-	for ((i) = 0;							\
+	for ((i) = 0, component = NULL;					\
 	     ((i) < rtd->num_components) && ((component) = rtd->components[i]);\
 	     (i)++)
 #define for_each_rtd_cpu_dais(rtd, i, dai)				\
-- 
2.26.0

