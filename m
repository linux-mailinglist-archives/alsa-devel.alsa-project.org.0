Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E5D49F7F2
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 12:10:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E45616F4;
	Fri, 28 Jan 2022 12:09:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E45616F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643368205;
	bh=Yhk155totF6KgZeBmJAqmlDg1W7BDXrLGlOGrEExZ+o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pKZWcS+ExXqshuOhQBGlDFQHOY3X40oj063Oqa+pCkaxv68dIQdiFthl0n+m4psNz
	 fyTRYyLxIphzIH41o7C/rpiskPq0dNF+SIpSx54kwb0bTwlhWJoYOvFh0UQuKO42ET
	 uvR4nWpnaIC8v1zbMj5bp4zlXpC4B0+PRaWUQZe4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7056CF804A9;
	Fri, 28 Jan 2022 12:08:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A6A5F80249; Fri, 28 Jan 2022 12:08:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82C14F800C0;
 Fri, 28 Jan 2022 12:08:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82C14F800C0
X-UUID: ae3f24dca0cb427bafa2b00e23b08309-20220128
X-UUID: ae3f24dca0cb427bafa2b00e23b08309-20220128
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <allen-kh.cheng@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 742471588; Fri, 28 Jan 2022 19:08:36 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 Jan 2022 19:08:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 28 Jan 2022 19:08:34 +0800
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v17 0/2] mtk: add ADSP mailbox controller for MT8195
Date: Fri, 28 Jan 2022 19:08:27 +0800
Message-ID: <20220128110829.17202-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, cujomalainey@google.com,
 Kevin Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-kernel@vger.kernel.org,
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

From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

Mediatek ADSP IPC is used to send notification or short message 
between processors with dsp. It will place the message to the
share buffer and will access the ADSP mailbox registers to kick
dsp. Two mailboxes used to send notification or short message 
between processors with dsp.

This patchset was tested and confirmed on MT8195 cherry board.

Based on linux-next

changes since v16:
- fix WARNING: modpost: missing MODULE_LICENSE() in drivers/mailbox
  /mtk-adsp-mailbox.o. Add MODULE_LICENSE in the last line.
- Due to WARNING: Missing or malformed SPDX-License-Identifier tag
  in line 1 in checkpatch, we don't remove SPDX-License in line 1.

changes since v15:
- add paragraphs to describe the config symbols fully

changes since v14:
- add inline for get_mtk_adsp_mbox_priv

changes since v13:
- rebase on v5.16-rc8
- add back ptr check from of_device_get_match_data

changes since v12:
- remove of_device_get_match_data ptr check:
  of_device_get_match_data(dev) will never going to return NULL.
  driver probe with compatible mediatek,mt8195-adsp-mbox.

changes since v11:
- remove useless MODULE_LICENSE

changes since v10:
- split up v9 into two separate submissions

changes since v9:
- rename adsp_mbox_chan_ops to mtk_adsp_mbox_chan_ops

changes since v8:
- remove struct adsp_mbox_ch_info
- add get_mtk_adsp_mbox_priv
- use mtk_adsp_mbox_priv va_mboxreg address in adsp mbox driver
- add struct mtk_adsp_mbox_cfg for DSP mbox register offset
- remove adsp mbox register offset hard code define
- remove mtk-adsp-ipc.h reference in adsp mbox driver

changes since v7:
- add mtk prefix for adsp ipc functions
- rename adsp_mbox_ch_info to mtk_adsp_mbox_ch_info
- remove incorrect reviewers in commit message

changes since v6:
- dt-bindings: change example dtsi node.
- rename config MTK_ADSP_IPC_MBOX to MTK_ADSP_MBOX
- remove unused variable
- add reviewers

changes since v5:
- remove some redundant code

changes since v4:
- use switch ... case in adsp_ipc_recv
- add error handling path for chan_name pointer
- refine some code to be concise

changes since v3:
- reorder MTK_ADSP_IPC_MBOX config
- remove some redundant code
- remove lock in mtk-adsp-mailbox

changes since v2:
- separate adsp_mailbox into two instances

changes since v1:
- fix dt_binding_check error

Allen-KH Cheng (2):
  dt-bindings: mailbox: add mtk adsp-mbox document
  mailbox: mediatek: add support for adsp mailbox controller

 .../bindings/mailbox/mtk,adsp-mbox.yaml       |  52 ++++++
 drivers/mailbox/Kconfig                       |   9 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/mtk-adsp-mailbox.c            | 176 ++++++++++++++++++
 4 files changed, 239 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
 create mode 100644 drivers/mailbox/mtk-adsp-mailbox.c

-- 
2.18.0

