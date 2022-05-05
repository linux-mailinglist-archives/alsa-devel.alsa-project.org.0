Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC57151CC3F
	for <lists+alsa-devel@lfdr.de>; Fri,  6 May 2022 00:36:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A6DD1820;
	Fri,  6 May 2022 00:35:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A6DD1820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651790189;
	bh=fIcmMOB4OTzUhPRJw5zxd1he8Ws9Ea91j5a5noC1OwA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pAPhzxXqXL4omRCwYWGpRcyEqz+vB8+qfihDxukclst7uJRVd1Ndi3k0bTEWMaoQJ
	 sqzaupAE9HaXMiAj0IOtZh7Su4ObrehvX6ENlu/O+eUpAbIjkyb2cg8Cvn+mtISv32
	 EYfRPs0qdw5tovMk/9H7Vl5RAxxQsPicoLzJRZwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B18EBF80506;
	Fri,  6 May 2022 00:34:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D02B0F800D3; Fri,  6 May 2022 00:34:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24252F800D3
 for <alsa-devel@alsa-project.org>; Fri,  6 May 2022 00:34:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24252F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="dDjiqn3i"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3CB3761F50;
 Thu,  5 May 2022 22:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4FAC385A4;
 Thu,  5 May 2022 22:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1651790084;
 bh=fIcmMOB4OTzUhPRJw5zxd1he8Ws9Ea91j5a5noC1OwA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dDjiqn3iXIxsl95pJLRm9hrJchx4WfXEocyDn8SVGogcQ5ZgMmKnU384LgZ4FZvGP
 cjgJqRC9zMQbrvZDuSbZJQboS77aP9g4SNbH88A0AC0dxpNfh0xc6f9SX6tp/JwV94
 q2boySmrpnWmzzZqy8AB0OIdh4Qd7DbjWk6tC+fI=
Date: Thu, 5 May 2022 23:10:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Subject: Re: [RESEND PATCH v7 1/1] firmware: mediatek: add adsp ipc protocol
 interface
Message-ID: <YnQ9UzeyMTkmyGgD@kroah.com>
References: <20220505053048.13804-1-tinghan.shen@mediatek.com>
 <20220505053048.13804-2-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505053048.13804-2-tinghan.shen@mediatek.com>
Cc: alsa-devel@alsa-project.org, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Tzung-Bi Shih <tzungbi@google.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Michal Suchanek <msuchanek@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Simon Trimmer <simont@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 John Stultz <john.stultz@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
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

On Thu, May 05, 2022 at 01:30:48PM +0800, Tinghan Shen wrote:
> From: TingHan Shen <tinghan.shen@mediatek.com>
> 
> Some of mediatek processors contain
> the Tensilica HiFix DSP for audio processing.
> 
> The communication between Host CPU and DSP firmware is
> taking place using a shared memory area for message passing.
> 
> ADSP IPC protocol offers (send/recv) interfaces using
> mediatek-mailbox APIs.
> 
> We use two mbox channels to implement a request-reply protocol.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Signed-off-by: TingHan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> Reviewed-by: YC Hung <yc.hung@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
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

Why do you have a .h file, and export symbols in your .c file, yet you
have no user of these symbols or header file?

Without a user, we can not take this, sorry.

This should just be one single .c file.

Also, why a whole subdirectory for just one .c file?

thanks,

greg k-h
