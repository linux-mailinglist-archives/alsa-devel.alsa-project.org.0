Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 849B34F819A
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 16:29:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1357417CC;
	Thu,  7 Apr 2022 16:28:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1357417CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649341752;
	bh=rvgOuVepiat93jjbiIHz1uDoVSPTzuq6D+lseJsHMlc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G5EpQUkY67jrfOB4iLgcbZpnOEZ9HsbqMgiYC56RBZXvjVE9HVUWKjuR/0x70o9Qd
	 17qVe+1L+gnxQebq7aToJ9y56jZWhLyu3ZJZckv8krCJW8SOgDH0uNRTjhDfIgOsNA
	 eShcXBJYcEgaowsWi4A4bq+MUMDpbshkoPpNbZSU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DBBDF8026A;
	Thu,  7 Apr 2022 16:28:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56CA2F8024C; Thu,  7 Apr 2022 16:28:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from fudo.makrotopia.org (fudo.makrotopia.org
 [IPv6:2a07:2ec0:3002::71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4440FF8012A;
 Thu,  7 Apr 2022 16:27:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4440FF8012A
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1ncT6r-0000NC-PG; Thu, 07 Apr 2022 16:27:41 +0200
Date: Thu, 7 Apr 2022 15:27:35 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH v7 0/1] firmware: mtk: add adsp ipc protocol for SOF
Message-ID: <Yk701wLNKQs1DEVx@makrotopia.org>
References: <20220407130338.28939-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220407130338.28939-1-allen-kh.cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel@vger.kernel.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, cujomalainey@google.com,
 Kevin Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

On Thu, Apr 07, 2022 at 09:03:37PM +0800, Allen-KH Cheng wrote:
> This patch provides mediatek adsp ipc support for SOF.
> ADSP IPC protocol offers (send/recv) interfaces using
> mediatek-mailbox APIs.
> 
> This patch was tested and confirmed to with SOF fw on MT8195
> cherry board.

... confirmed to **work** with ...
is probably what you meant to write here.


> 
> Based on matthias.bgg/linux.git, v5.18-next/soc
> changes since v6:
> - rebase to matthias.bgg/linux.git, v5.18-next/soc
> - Prefer "GPL" over "GPL v2" for MODULE_LICENSE
> 
> changes since v5:
> - fix WARNING: modpost: missing MODULE_LICENSE() in drivers/mailbox
>   /mtk-adsp-mailbox.o. Add MODULE_LICENSE in the last line.
> - Due to WARNING: Missing or malformed SPDX-License-Identifier tag
>   in line 1 in checkpatch, we don't remove SPDX-License in line 1.
> 
> changes since v4:
> - add error message for wrong mbox chan
> 
> changes since v3:
> - rebase on v5.16-rc8
> - update reviewers
> 
> changes since v2:
> - add out tag for two memory free phases
> 
> changes since v1:
> - add comments for mtk_adsp_ipc_send and mtk_adsp_ipc_recv
> - remove useless MODULE_LICENSE
> - change label name to out_free
> 
> 
> Allen-KH Cheng (1):
>   firmware: mediatek: add adsp ipc protocol interface
> 
>  drivers/firmware/Kconfig                      |   1 +
>  drivers/firmware/Makefile                     |   1 +
>  drivers/firmware/mediatek/Kconfig             |   9 +
>  drivers/firmware/mediatek/Makefile            |   2 +
>  drivers/firmware/mediatek/mtk-adsp-ipc.c      | 161 ++++++++++++++++++
>  .../linux/firmware/mediatek/mtk-adsp-ipc.h    |  65 +++++++
>  6 files changed, 239 insertions(+)
>  create mode 100644 drivers/firmware/mediatek/Kconfig
>  create mode 100644 drivers/firmware/mediatek/Makefile
>  create mode 100644 drivers/firmware/mediatek/mtk-adsp-ipc.c
>  create mode 100644 include/linux/firmware/mediatek/mtk-adsp-ipc.h
> 
> -- 
> 2.18.0
> 
