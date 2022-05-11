Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0355232D7
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 14:18:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 556B41A93;
	Wed, 11 May 2022 14:17:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 556B41A93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652271502;
	bh=U9OTtT4RTP01G4lEzvbMVw89CbcO9NUfwW/n/acj2jw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sycfWGS8U6/cjlSvgb3F3xwAnvb1O9TjgxHrsodT4nkYCkP1YIIkDHMoi6lwQmzHh
	 Ja3sPV9ELjxBizQcabxA0ahR6mzCLkBOCu/9YHAm9VYeI1dbcF5cRPBDCa3uKjzwKn
	 FYnFMm65v0/KITrYhf6iNld7UCr/GjzeT9rl5ZMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 445B1F8053D;
	Wed, 11 May 2022 14:15:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19DBFF8015B; Wed, 11 May 2022 06:28:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1CDBF8015B;
 Wed, 11 May 2022 06:28:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1CDBF8015B
X-UUID: 04e415de8e494fb7b46be506744bcecd-20220511
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:ec7d6274-4638-45af-9412-a713e455b9ab, OB:0,
 LO
 B:10,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:95,FILE:0,RULE:Release_Ham,
 ACTION:release,TS:75
X-CID-INFO: VERSION:1.1.4, REQID:ec7d6274-4638-45af-9412-a713e455b9ab, OB:0,
 LOB:
 10,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_GS981B3D,
 ACTION:quarantine,TS:75
X-CID-META: VersionHash:faefae9, CLOUDID:4cbf5eb3-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:822dc0dceacc,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,File:nil
 ,QS:0,BEC:nil
X-UUID: 04e415de8e494fb7b46be506744bcecd-20220511
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1440560814; Wed, 11 May 2022 12:28:03 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 11 May 2022 12:28:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 11 May 2022 12:28:01 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, "Mark
 Brown" <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Javier Martinez Canillas <javierm@redhat.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sudeep Holla
 <sudeep.holla@arm.com>, Michal Suchanek <msuchanek@suse.de>, Shuai Xue
 <xueshuai@linux.alibaba.com>, Simon Trimmer <simont@opensource.cirrus.com>,
 Cristian Marussi <cristian.marussi@arm.com>, TingHan Shen
 <tinghan.shen@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov
 <bp@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Stultz
 <john.stultz@linaro.org>, Curtis Malainey <cujomalainey@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, YC Hung <yc.hung@mediatek.com>, 
 Tzung-Bi Shih <tzungbi@google.com>, Yang Yingliang
 <yangyingliang@huawei.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH v8 0/3] firmware: mtk: add adsp ipc protocol for SOF
Date: Wed, 11 May 2022 12:27:15 +0800
Message-ID: <20220511042718.4305-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Wed, 11 May 2022 14:14:58 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

This patch provides mediatek adsp ipc support for SOF.
ADSP IPC protocol offers (send/recv) interfaces using
mediatek-mailbox APIs.

This patch was tested and confirmed to work with SOF fw on 
MT8195 cherry board and MT8186 krabby board.

changes since v7:
- rebase to linux-next/next-22020504
- use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL in mtk-adsp-ipc.c 
- move mtk-adsp-ipc.c out from driver/firmware/mediatek
- add user of mtk-adsp-ipc.h in patchset 2 and 3.

changes since v6:
- rebase to matthias.bgg/linux.git, v5.18-next/soc
- Prefer "GPL" over "GPL v2" for MODULE_LICENSE

changes since v5:
- fix WARNING: modpost: missing MODULE_LICENSE() in drivers/mailbox
  /mtk-adsp-mailbox.o. Add MODULE_LICENSE in the last line.
- Due to WARNING: Missing or malformed SPDX-License-Identifier tag
  in line 1 in checkpatch, we don't remove SPDX-License in line 1.

changes since v4:
- add error message for wrong mbox chan

changes since v3:
- rebase on v5.16-rc8
- update reviewers

changes since v2:
- add out tag for two memory free phases

changes since v1:
- add comments for mtk_adsp_ipc_send and mtk_adsp_ipc_recv
- remove useless MODULE_LICENSE
- change label name to out_free

Allen-KH Cheng (1):
  ASoC: SOF: mediatek: Add ipc support for mt8195

TingHan Shen (1):
  firmware: mediatek: add adsp ipc protocol interface

Tinghan Shen (1):
  ASoC: SOF: mediatek: Add mt8186 ipc support

 drivers/firmware/Kconfig                      |   9 +
 drivers/firmware/Makefile                     |   1 +
 drivers/firmware/mtk-adsp-ipc.c               | 157 ++++++++++++++++++
 .../linux/firmware/mediatek/mtk-adsp-ipc.h    |  65 ++++++++
 sound/soc/sof/mediatek/Kconfig                |   1 +
 sound/soc/sof/mediatek/adsp_helper.h          |  12 +-
 sound/soc/sof/mediatek/mt8186/mt8186-loader.c |   5 +
 sound/soc/sof/mediatek/mt8186/mt8186.c        | 141 ++++++++++++++++
 sound/soc/sof/mediatek/mt8195/mt8195.c        | 138 ++++++++++++++-
 9 files changed, 518 insertions(+), 11 deletions(-)
 create mode 100644 drivers/firmware/mtk-adsp-ipc.c
 create mode 100644 include/linux/firmware/mediatek/mtk-adsp-ipc.h

-- 
2.18.0

