Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A50B44F938F
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 13:13:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3420F18F1;
	Fri,  8 Apr 2022 13:12:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3420F18F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649416380;
	bh=2HR4Re1Lb9mqEl0QgosfUK/xx8nRtewji7oxHFSlrMg=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=obyl2nJBs4XQYJ13h9VhOdDLHxEwq/dYBbXlDJPvFSmUz90EaSJZ9mgSJiqsEl1yz
	 EVi0Yn8qoO9KVTucil6atDGaj1SnnFPaz87sDQTkqMWd1nB6kudbdAgt/mZ0Wq7s4V
	 YYZUOjz2wAmUW9BhwBLCO4T298rtG83kQNwY4Abs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F01CF80311;
	Fri,  8 Apr 2022 13:12:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30A22F8014E; Fri,  8 Apr 2022 13:11:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61FD1F80054;
 Fri,  8 Apr 2022 13:11:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61FD1F80054
X-UUID: 4096078d201047d5b87b2fcebf145510-20220408
X-UUID: 4096078d201047d5b87b2fcebf145510-20220408
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 347008398; Fri, 08 Apr 2022 19:11:38 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 Apr 2022 19:11:37 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Apr 2022 19:11:37 +0800
Message-ID: <2ffb9949e47726d7c714666dc7755ed586720709.camel@mediatek.com>
Subject: Re: [PATCH v7 0/1] firmware: mtk: add adsp ipc protocol for SOF
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Daniel Golle <daniel@makrotopia.org>
Date: Fri, 8 Apr 2022 19:11:37 +0800
In-Reply-To: <Yk701wLNKQs1DEVx@makrotopia.org>
References: <20220407130338.28939-1-allen-kh.cheng@mediatek.com>
 <Yk701wLNKQs1DEVx@makrotopia.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel@vger.kernel.org, Kai
 Vehmanen <kai.vehmanen@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 cujomalainey@google.com, Kevin
 Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>, Pierre-Louis
 Bossart <pierre-louis.bossart@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-arm-kernel@lists.infradead.org,
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

Hi Daniel,

On Thu, 2022-04-07 at 15:27 +0100, Daniel Golle wrote:
> On Thu, Apr 07, 2022 at 09:03:37PM +0800, Allen-KH Cheng wrote:
> > This patch provides mediatek adsp ipc support for SOF.
> > ADSP IPC protocol offers (send/recv) interfaces using
> > mediatek-mailbox APIs.
> > 
> > This patch was tested and confirmed to with SOF fw on MT8195
> > cherry board.
> 
> ... confirmed to **work** with ...
> is probably what you meant to write here.
> 
> 

Yes, thanks for your reminder. 

It appears that for some reason I forgot to add this part.

We had tested ADSP IPC protocol with SOF in
github.com/thesofproject/sof/tree/mt8195/v0.4.

The other mailbox control is patchwork.kernel.org/patch/12728222/

Thanks,
Allen

> > 
> > Based on matthias.bgg/linux.git, v5.18-next/soc
> > changes since v6:
> > - rebase to matthias.bgg/linux.git, v5.18-next/soc
> > - Prefer "GPL" over "GPL v2" for MODULE_LICENSE
> > 
> > changes since v5:
> > - fix WARNING: modpost: missing MODULE_LICENSE() in drivers/mailbox
> >   /mtk-adsp-mailbox.o. Add MODULE_LICENSE in the last line.
> > - Due to WARNING: Missing or malformed SPDX-License-Identifier tag
> >   in line 1 in checkpatch, we don't remove SPDX-License in line 1.
> > 
> > changes since v4:
> > - add error message for wrong mbox chan
> > 
> > changes since v3:
> > - rebase on v5.16-rc8
> > - update reviewers
> > 
> > changes since v2:
> > - add out tag for two memory free phases
> > 
> > changes since v1:
> > - add comments for mtk_adsp_ipc_send and mtk_adsp_ipc_recv
> > - remove useless MODULE_LICENSE
> > - change label name to out_free
> > 
> > 
> > Allen-KH Cheng (1):
> >   firmware: mediatek: add adsp ipc protocol interface
> > 
> >  drivers/firmware/Kconfig                      |   1 +
> >  drivers/firmware/Makefile                     |   1 +
> >  drivers/firmware/mediatek/Kconfig             |   9 +
> >  drivers/firmware/mediatek/Makefile            |   2 +
> >  drivers/firmware/mediatek/mtk-adsp-ipc.c      | 161
> > ++++++++++++++++++
> >  .../linux/firmware/mediatek/mtk-adsp-ipc.h    |  65 +++++++
> >  6 files changed, 239 insertions(+)
> >  create mode 100644 drivers/firmware/mediatek/Kconfig
> >  create mode 100644 drivers/firmware/mediatek/Makefile
> >  create mode 100644 drivers/firmware/mediatek/mtk-adsp-ipc.c
> >  create mode 100644 include/linux/firmware/mediatek/mtk-adsp-ipc.h
> > 
> > -- 
> > 2.18.0
> > 

