Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 471F2460ED7
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 07:41:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55B6D1770;
	Mon, 29 Nov 2021 07:40:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55B6D1770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638168103;
	bh=+I0ASTFL0VPbwT2J+bN9MQQXUQ3YW6p++gBV+HWVzlo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ixUYoY4vDciCinPGMjGmgf2W/D66voSTGdQCz1uvAG+aQ88LBJRqkahwk4OILDhRx
	 kaT/D/cfzNIWGi0TyGiOYWwOMXv/7n63VOgr9XB/UaeJteWIKrefPKHuuqaVboGrpO
	 Ms2bVGq1iYm+R9C8lZANJOjDYrvViQA/RW1+e/cs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B58DF80254;
	Mon, 29 Nov 2021 07:40:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2194FF80249; Mon, 29 Nov 2021 07:40:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10B26F800EE;
 Mon, 29 Nov 2021 07:40:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10B26F800EE
X-UUID: 28a4c85160b54425a552989a5c3cdd18-20211129
X-UUID: 28a4c85160b54425a552989a5c3cdd18-20211129
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <allen-kh.cheng@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 715309939; Mon, 29 Nov 2021 14:40:01 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Nov 2021 14:40:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 29 Nov 2021 14:40:00 +0800
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jassi Brar
 <jassisinghbrar@gmail.com>
Subject: [PATCH v7 0/3] This patches provide ADSP IPC support for MT8195
Date: Mon, 29 Nov 2021 14:39:51 +0800
Message-ID: <20211129063954.1616-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, cujomalainey@google.com,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-arm-kernel@lists.infradead.org, sound-open-firmware@alsa-project.org
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

Mediatek ADSP IPC is used to send notification or short message between
processors with dsp.·

It will place the message to the share buffer and will access the ADSP mailbox
registers to kick dsp.

Two mailboxes used to send notification or short message between processors with
dsp

changes since v6:
- dt-bindings: change example dtsi node.
- change config MTK_ADSP_IPC_MBOX to MTK_ADSP_MBOX
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

Allen-KH Cheng (3):
  dt-bindings: mediatek: add adsp-mbox document
  firmware: mediatek: add adsp ipc protocol interface
  mailbox: mediatek: add support for adsp mailbox controller

 .../bindings/mailbox/mtk,adsp-mbox.yaml       |  52 ++++++
 drivers/firmware/Kconfig                      |   1 +
 drivers/firmware/Makefile                     |   1 +
 drivers/firmware/mediatek/Kconfig             |   9 +
 drivers/firmware/mediatek/Makefile            |   2 +
 drivers/firmware/mediatek/mtk-adsp-ipc.c      | 138 ++++++++++++++
 drivers/mailbox/Kconfig                       |   7 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/mtk-adsp-mailbox.c            | 175 ++++++++++++++++++
 .../linux/firmware/mediatek/mtk-adsp-ipc.h    |  70 +++++++
 10 files changed, 457 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
 create mode 100644 drivers/firmware/mediatek/Kconfig
 create mode 100644 drivers/firmware/mediatek/Makefile
 create mode 100644 drivers/firmware/mediatek/mtk-adsp-ipc.c
 create mode 100644 drivers/mailbox/mtk-adsp-mailbox.c
 create mode 100644 include/linux/firmware/mediatek/mtk-adsp-ipc.h

-- 
2.18.0

