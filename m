Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F287851D6D6
	for <lists+alsa-devel@lfdr.de>; Fri,  6 May 2022 13:40:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FA3D176C;
	Fri,  6 May 2022 13:39:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FA3D176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651837241;
	bh=wVPIGd+idgNahQWNuvYs77aIB5HQzXLLG3Hsw/27/L4=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oQYs1RhbxqJ5n2ScJxYrC++f/JqNdwtxo84OarWXlLeOWk12y9WHERTOABhmQNhZP
	 Qj27xWgaxTglUR9VbQMB7DZOwyGHFjD2DVOTFPCNIGuuteECX+8YQKOQDRp4RnuTkS
	 rSWzqZWQzGqb2z4rSV70ltjqn3hVmlWai9BMAnzg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16FAFF80171;
	Fri,  6 May 2022 13:39:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E823F8014B; Fri,  6 May 2022 13:39:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9997CF800F0
 for <alsa-devel@alsa-project.org>; Fri,  6 May 2022 13:39:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9997CF800F0
X-UUID: 5cf4482705974597a43805780b255883-20220506
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:637941b4-cb86-4741-bcbd-b1ead3e81090, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:45
X-CID-INFO: VERSION:1.1.4, REQID:637941b4-cb86-4741-bcbd-b1ead3e81090, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:45
X-CID-META: VersionHash:faefae9, CLOUDID:806b7816-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,File:nil,QS:0
 ,BEC:nil
X-UUID: 5cf4482705974597a43805780b255883-20220506
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1297254437; Fri, 06 May 2022 19:39:25 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 6 May 2022 19:39:24 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 6 May 2022 19:39:24 +0800
Message-ID: <ef0c621760d63c28ad97d4b7e8bef34660ea079c.camel@mediatek.com>
Subject: Re: [RESEND PATCH v7 1/1] firmware: mediatek: add adsp ipc protocol
 interface
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 6 May 2022 19:39:24 +0800
In-Reply-To: <YnQ9h6k0yFN8f+Ui@kroah.com>
References: <20220505053048.13804-1-tinghan.shen@mediatek.com>
 <20220505053048.13804-2-tinghan.shen@mediatek.com>
 <YnQ9h6k0yFN8f+Ui@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: alsa-devel@alsa-project.org, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Tzung-Bi Shih <tzungbi@google.com>, Cristian
 Marussi <cristian.marussi@arm.com>, Michal Suchanek <msuchanek@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Sudeep Holla <sudeep.holla@arm.com>,
 Simon Trimmer <simont@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 John
 Stultz <john.stultz@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Borislav Petkov <bp@suse.de>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, YC Hung <yc.hung@mediatek.com>,
 linux-mediatek@lists.infradead.org,
 Curtis Malainey <cujomalainey@chromium.org>,
 Etienne Carriere <etienne.carriere@linaro.org>
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

Hi Greg,

On Thu, 2022-05-05 at 23:11 +0200, Greg Kroah-Hartman wrote:
> On Thu, May 05, 2022 at 01:30:48PM +0800, Tinghan Shen wrote:
> > From: TingHan Shen <tinghan.shen@mediatek.com>
> > 
> > Some of mediatek processors contain
> > the Tensilica HiFix DSP for audio processing.
> > 
> > The communication between Host CPU and DSP firmware is
> > taking place using a shared memory area for message passing.
> > 
> > ADSP IPC protocol offers (send/recv) interfaces using
> > mediatek-mailbox APIs.
> > 
> > We use two mbox channels to implement a request-reply protocol.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > Signed-off-by: TingHan Shen <tinghan.shen@mediatek.com>
> > Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
> > Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> > Reviewed-by: YC Hung <yc.hung@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/firmware/Kconfig                      |   1 +
> >  drivers/firmware/Makefile                     |   1 +
> >  drivers/firmware/mediatek/Kconfig             |   9 +
> >  drivers/firmware/mediatek/Makefile            |   2 +
> >  drivers/firmware/mediatek/mtk-adsp-ipc.c      | 161 ++++++++++++++++++
> >  .../linux/firmware/mediatek/mtk-adsp-ipc.h    |  65 +++++++
> >  6 files changed, 239 insertions(+)
> >  create mode 100644 drivers/firmware/mediatek/Kconfig
> >  create mode 100644 drivers/firmware/mediatek/Makefile
> >  create mode 100644 drivers/firmware/mediatek/mtk-adsp-ipc.c
> >  create mode 100644 include/linux/firmware/mediatek/mtk-adsp-ipc.h
> > 
> > diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> > index d65964996e8d..c4d149b28944 100644
> > --- a/drivers/firmware/Kconfig
> > +++ b/drivers/firmware/Kconfig
> > @@ -300,6 +300,7 @@ source "drivers/firmware/cirrus/Kconfig"
> >  source "drivers/firmware/google/Kconfig"
> >  source "drivers/firmware/efi/Kconfig"
> >  source "drivers/firmware/imx/Kconfig"
> > +source "drivers/firmware/mediatek/Kconfig"
> >  source "drivers/firmware/meson/Kconfig"
> >  source "drivers/firmware/psci/Kconfig"
> >  source "drivers/firmware/smccc/Kconfig"
> > diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
> > index 4e58cb474a68..88fbdc110100 100644
> > --- a/drivers/firmware/Makefile
> > +++ b/drivers/firmware/Makefile
> > @@ -34,6 +34,7 @@ obj-$(CONFIG_GOOGLE_FIRMWARE)	+= google/
> >  obj-$(CONFIG_EFI)		+= efi/
> >  obj-$(CONFIG_UEFI_CPER)		+= efi/
> >  obj-y				+= imx/
> > +obj-y				+= mediatek/
> >  obj-y				+= psci/
> >  obj-y				+= smccc/
> >  obj-y				+= tegra/
> > diff --git a/drivers/firmware/mediatek/Kconfig b/drivers/firmware/mediatek/Kconfig
> > new file mode 100644
> > index 000000000000..6d1e580b967b
> > --- /dev/null
> > +++ b/drivers/firmware/mediatek/Kconfig
> > @@ -0,0 +1,9 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +config MTK_ADSP_IPC
> > +	tristate "MTK ADSP IPC Protocol driver"
> > +	depends on MTK_ADSP_MBOX
> > +	help
> > +	  Say yes here to add support for the MediaTek ADSP IPC
> > +	  between host AP (Linux) and the firmware running on ADSP.
> > +	  ADSP exists on some mtk processors.
> > +	  Client might use shared memory to exchange information with ADSP side.
> > diff --git a/drivers/firmware/mediatek/Makefile b/drivers/firmware/mediatek/Makefile
> > new file mode 100644
> > index 000000000000..4e840b65650d
> > --- /dev/null
> > +++ b/drivers/firmware/mediatek/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +obj-$(CONFIG_MTK_ADSP_IPC)		+= mtk-adsp-ipc.o
> > diff --git a/drivers/firmware/mediatek/mtk-adsp-ipc.c b/drivers/firmware/mediatek/mtk-adsp-ipc.c
> > new file mode 100644
> > index 000000000000..87cee61dbf32
> > --- /dev/null
> > +++ b/drivers/firmware/mediatek/mtk-adsp-ipc.c
> > @@ -0,0 +1,161 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2022 MediaTek Corporation. All rights reserved.
> > + * Author: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > + */
> > +
> > +#include <linux/firmware/mediatek/mtk-adsp-ipc.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mailbox_client.h>
> > +#include <linux/module.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +
> > +/*
> > + * mtk_adsp_ipc_send - send ipc cmd to MTK ADSP
> > + *
> > + * @ipc: ADSP IPC handle
> > + * @idx: index of the mailbox channel
> > + * @msg: IPC cmd (reply or request)
> > + *
> > + * Returns zero for success from mbox_send_message
> > + * negative value for error
> > + */
> > +int mtk_adsp_ipc_send(struct mtk_adsp_ipc *ipc, unsigned int idx, uint32_t msg)
> > +{
> > +	struct mtk_adsp_chan *adsp_chan;
> > +	int ret;
> > +
> > +	if (idx >= MTK_ADSP_MBOX_NUM)
> > +		return -EINVAL;
> > +
> > +	adsp_chan = &ipc->chans[idx];
> > +	ret = mbox_send_message(adsp_chan->ch, &msg);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/*
> > +	 * mbox_send_message returns non-negative value on success,
> > +	 * return zero for success
> > +	 */
> > +	return 0;
> 
> You already said this up in the function comments, no need to duplicate
> it again.
> 
> > +}
> > +EXPORT_SYMBOL(mtk_adsp_ipc_send);
> 
> EXPORT_SYMBOL_GPL()?  I have to ask, sorry.
> 
> thanks,
> 
> greg k-h

I'll update these parts in next version.
Thank you!


Best regards,
TingHan

