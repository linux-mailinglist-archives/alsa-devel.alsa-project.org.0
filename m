Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E92D305645
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 09:58:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5C96173E;
	Wed, 27 Jan 2021 09:57:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5C96173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611737911;
	bh=ERtZ2MxKfWopX+8L6qVnPPg35Dmq8Yz9PQZXZO4hE80=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LoXB883H2vFQOq12JusHHL8391SCxiOtIn+XPn2/oMSEk7CJmN8+VcoeE5VlndjAO
	 9AqFY6rCNIJXPhpe3Ya6YIEsYZltbIDQD0Ctv75o/jhtxOyllK6hdPTzs07QGc7+n0
	 8tTZC3+WoBwPfoP8bdZ1sYcWTG86rchTPxv3lVyw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CA3AF80259;
	Wed, 27 Jan 2021 09:57:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44C4CF80259; Wed, 27 Jan 2021 09:56:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9846AF8011C
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 09:56:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9846AF8011C
Received: from [123.112.69.135] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1l4gd6-0001vh-Or; Wed, 27 Jan 2021 08:56:49 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org, tiwai@suse.de, perex@perex.cz,
 kai.vehmanen@linux.intel.com
Subject: [PATCH v9 0/1] audio jack software injection
Date: Wed, 27 Jan 2021 16:56:38 +0800
Message-Id: <20210127085639.74954-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

the changes in the v9:
 - move the "Phantom" jack comparison into the snd_jack_debugfs_add_inject_node(),
   then the comparison is only executed when SND_JACK_INJECTION_DEBUG is enabled.

the changes in the v8:
 - change "for (i = 0; i < strlen(tname); i++)" to "for (i = 0; tname[i]; i++)"
 - use CONFIG_SND_DEBUG to wrap some debugfs variable and struct members.

the changes in the v7:
 - change the format of the last part in jack-injection.rst
 - add dependence SND_DEBUG in the Kconfig
 - create debugfs_mount_dir/sound and debugfs_mount_dir/sound/cardN only SND_DEBUG is enabled
 - change simple_write_to_buffer(buf, count, ppos, from, count) to
   simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, from, count)
 - rewrite the function parse_mask_bits() according to v6's comment

the changes in the v6:
 - use the sizeof(buf) to replace the digits in the scnprintf
 - squash the document patch into the 0001-xxx.patch.


the changes in the v5:
 - add a Kconfig to enable/disable the jack injection feature
 - replace all kzalloc with local char[] in the debugfs fops
 - replace the chars of !isalnum() to '_' for the jack folder's name
 - squash all .c files patches into one patch
 - add a document to explain jack injection, for easier review, put
   the document in a standalone patch. If needed, will squash this
   patch to the previous one.
 

the changes in the v4:
 - change the sound-core to sound and change the sound_core_debugfs_root
   to sound_debugfs_root in the 0001-xxx.patch
 - change kzalloc/kfree to kvzalloc/kvfree in the debugfs fops for
   0001-xxx.patch and 0003-xxx.patch
 - And if needed, I could squash 4 patches into 1 patch before merging.

the changes in the v3 (for easy to review, divide change into 4 patches):
 - address the comment about the snd_jack_report() and _snd_jack_report(),
   the v2 design is hard to understand and is hard to review, in the v3,
   separate the jack_report to snd_jack_report() and snd_jack_inject_report(),
   hw jack events call snd_jack_report() as before, if a jack contains multi
   jack_kctl and the jack_kctl's sw_inject is enabled, the status and the
   related input-dev's events will not be reproted. The injection events call
   snd_jack_inject_report(). This change is squashed to 0001-xxx.patch,  the
   rest part of 0001-xxx.patch is same as v2.

 - address the comment about folders'name in the 0002-xxx.patch, so far, drop
   the '/', ',', '=' and ' ' from the folders' name.

 - address the comment about adding more debugfs nodes in the 0003-xxx.patch,
   it adds kctl_id, mask_bits, status and type.

 - address the comment about save-n-restore jack's hw status in the
   0004-xxx.patch, adding a hw_status_cache and save the last reported jack
   hw event, once the sw_inject is disabled, will restore all jack_kctl's
   state under the same snd_jack with hw_status_cache.
[snip]


the changes in the V2:
 - using debugfs instead of sysfs
 - using jack_ctrl to create a folder instead of snd_jack, since ASoC drivers
   could create multi jack_ctrls within a snd_jack
 - create a folder for each jack_ctrl instead for all jack_ctrls
[ snip ]

Hui Wang (1):
  alsa: jack: implement software jack injection via debugfs

 Documentation/sound/designs/index.rst         |   1 +
 .../sound/designs/jack-injection.rst          | 166 ++++++++++
 include/sound/core.h                          |   6 +
 include/sound/jack.h                          |   1 +
 sound/core/Kconfig                            |   9 +
 sound/core/init.c                             |  16 +
 sound/core/jack.c                             | 304 +++++++++++++++++-
 sound/core/sound.c                            |  13 +
 8 files changed, 512 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/sound/designs/jack-injection.rst

-- 
2.25.1

