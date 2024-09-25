Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D609985395
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2024 09:18:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3E35857;
	Wed, 25 Sep 2024 09:18:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3E35857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727248712;
	bh=JlqzkcI1dW2ynQ75PjrYYS6kdHiITrvjuZiQki7W53g=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Asd68f6T3U3h87XULDZtycfI9w+M8VUEZifAIlKsz6l93jYYuOSu8ZceodRtDcOqf
	 ynFPTdZ7+j5WdD9a/R+Eejj+R99wEoBMG7Gx3LUtOz/jlDKNS9FBYQhrb1S7xImhXn
	 mNilmsDdhypRaAc7Js8xAtIxt5yYFTAiWHQkrZv8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF459F805AA; Wed, 25 Sep 2024 09:18:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F5A1F80107;
	Wed, 25 Sep 2024 09:18:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5BB4F802DB; Wed, 25 Sep 2024 09:17:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8360F80107
	for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2024 09:17:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8360F80107
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0FA491A038D;
	Wed, 25 Sep 2024 09:17:49 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CB8DC1A0056;
	Wed, 25 Sep 2024 09:17:48 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 2B8AF183AD44;
	Wed, 25 Sep 2024 15:17:47 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 0/7] ASoC: fsl: add memory to memory function for ASRC
Date: Wed, 25 Sep 2024 14:55:09 +0800
Message-Id: <1727247316-16156-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: N2JJ6BFZJKTULLT2OVLHAN34HOYBDIPE
X-Message-ID-Hash: N2JJ6BFZJKTULLT2OVLHAN34HOYBDIPE
X-MailFrom: shengjiu.wang@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N2JJ6BFZJKTULLT2OVLHAN34HOYBDIPE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This function is base on the accelerator implementation
for compress API:
https://patchwork.kernel.org/project/alsa-devel/patch/20240731083843.59911-1-perex@perex.cz/
Add it to this patch set.

Audio signal processing also has the requirement for memory to
memory similar as Video.

This asrc memory to memory (memory ->asrc->memory) case is a non
real time use case.

User fills the input buffer to the asrc module, after conversion, then asrc
sends back the output buffer to user. So it is not a traditional ALSA playback
and capture case.

Because we had implemented the "memory -> asrc ->i2s device-> codec"
use case in ALSA.  Now the "memory->asrc->memory" needs
to reuse the code in asrc driver, so the patch 1 and patch 2 is for refining
the code to make it can be shared by the "memory->asrc->memory"
driver.

Other change is to add memory to memory support for two kinds of i.MX ASRC
modules.

changes in v4:
- remove the RFC tag, no comments receive in v3
- Add Jaroslav Kysela's patch in this patch set. because it may be
  better for reviewing in a full patch set.
- Fix the list_for_each_entry_reverse to list_for_each_entry_safe_reverse
- Fix some coding style issues in Jaroslav Kysela's patch

changes in v3:
- use Jaroslav's suggestion for header file compress_params.h (PATCH 01)
- remove the ASRC_OUTPUT_FORMAT/ASRC_OUTPUT_RATE definition
- remove ASRC_RATIO_MOD in this version because it uses .set_metadata()
  Will wait Jaroslav's update or other better method in the future.
- Address some comments from Pierre.

changes in v2:
- Remove the changes in compress API
- drop the SNDRV_COMPRESS_SRC_RATIO_MOD
- drop the SND_AUDIOCODEC_SRC and struct snd_dec_src
- define private metadata key value
  ASRC_OUTPUT_FORMAT/ASRC_OUTPUT_RATE/ASRC_RATIO_MOD

Jaroslav Kysela (1):
  ALSA: compress_offload: introduce accel operation mode

Shengjiu Wang (6):
  ALSA: compress: Add output rate and output format support
  ASoC: fsl_asrc: define functions for memory to memory usage
  ASoC: fsl_easrc: define functions for memory to memory usage
  ASoC: fsl_asrc_m2m: Add memory to memory function
  ASoC: fsl_asrc: register m2m platform device
  ASoC: fsl_easrc: register m2m platform device

 .../sound/designs/compress-accel.rst          | 136 ++++
 include/sound/compress_driver.h               |  46 ++
 include/uapi/sound/compress_offload.h         |  63 +-
 include/uapi/sound/compress_params.h          |  23 +-
 sound/core/Kconfig                            |   3 +
 sound/core/compress_offload.c                 | 351 ++++++++-
 sound/soc/fsl/Kconfig                         |   1 +
 sound/soc/fsl/Makefile                        |   2 +-
 sound/soc/fsl/fsl_asrc.c                      | 179 ++++-
 sound/soc/fsl/fsl_asrc.h                      |   2 +
 sound/soc/fsl/fsl_asrc_common.h               |  70 ++
 sound/soc/fsl/fsl_asrc_m2m.c                  | 727 ++++++++++++++++++
 sound/soc/fsl/fsl_easrc.c                     | 261 ++++++-
 sound/soc/fsl/fsl_easrc.h                     |   4 +
 14 files changed, 1851 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/sound/designs/compress-accel.rst
 create mode 100644 sound/soc/fsl/fsl_asrc_m2m.c

-- 
2.34.1

