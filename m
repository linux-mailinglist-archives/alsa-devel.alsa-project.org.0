Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4457A28CBE5
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Oct 2020 12:42:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83541168A;
	Tue, 13 Oct 2020 12:42:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83541168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602585775;
	bh=KGnQd8MQizROEGVqO6LoZ2ESTC7FDdoCCXNt1igE99k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RtqkwOskuk2nZXW6QIB75WTD52d64qGWg7eLsh/IFwB4OiI8EcFITu2GQsKJ7kERl
	 ENIQo/SPMjPScBIhU1lYQ09lh6aXVGhtWgMwxROqxCnDBo/BNh2BT15M9gHaUAsh7p
	 4MhyvaljzrvAAHz6JiVobw7Tez5cCyMji7tzmPjc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A287F801D9;
	Tue, 13 Oct 2020 12:41:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3290F800CE; Tue, 13 Oct 2020 12:41:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20350F800CE
 for <alsa-devel@alsa-project.org>; Tue, 13 Oct 2020 12:41:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20350F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gyi1yunu"
Received: by mail-wr1-x441.google.com with SMTP id n18so23420064wrs.5
 for <alsa-devel@alsa-project.org>; Tue, 13 Oct 2020 03:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KGnQd8MQizROEGVqO6LoZ2ESTC7FDdoCCXNt1igE99k=;
 b=gyi1yunutoZhUD0/UEF8Y2W7tQM6TS5jmKeONpakXd2rTbWB+a2FoTlYShvboHRUjb
 o+OiIauitVyuRzkw2wlp8deQWzBGISweHB6VZlAgDRaF0NoeuVxg847l/A2/LVMRQJqe
 042rOdRRsmODzQaUz5KmsV7PXCm2iIfq/P9NJvooXN0tU08fjejHSQ+S9ueQ+aE27whw
 px2Vdl4kOBetB0bVfcXL//2xS1Y1bR9G5Y4/SYldp92Mjw39RR00M5wScVXdpvR7CZUV
 HboDSnXSXkCB4XgTJW74jjaWEffi5v3Pi6A7v7NtoKMWoS6bakwtXPTJFSMiRY2Akdqr
 3LJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KGnQd8MQizROEGVqO6LoZ2ESTC7FDdoCCXNt1igE99k=;
 b=cVWsBsYBNkbxeAY1Yh6GftIYBdViV6V6joEBo/cCZjkXgcLupLgiMCMG8VcSykXNRr
 CPC/lGQ5zFV7mqweJWMvvmdPquGA8Tkn70qnghkfxzHdiuejnSPs8VdjjeyyLqjjzKEn
 WVgJ81ZS7vrjhUPxMeHciGoEt5ZUqBsP+prg2wA5ZCIJdr3O7NIItktUA0sJK3/fdIHK
 gQDG5UKaa7I0OdV7DDOVi+WiMjgkd+/mD/oQ0GeTQYxL3XexfRyGu+uE8Ei2WsuRMT1V
 4jMAnepI1fzPisgYj9f+7ViRaYjsnIvNi66h/a4+CraAo+v6PtdzSReR/L07m6a+gCLB
 FiJg==
X-Gm-Message-State: AOAM530xEiVMocB4NDyG2cLgUN/MZG1y3VlFRrQwY7adB6r+0+vFKP1N
 9ZBppyGVDgp3CdMIYC24T9FLefh34l/g+q482Vc=
X-Google-Smtp-Source: ABdhPJwhYcYmIneqQARWgsNSZNyQDfcQXjguTWYNKrh+uvUlyMNyvJ07AParV+DeJy+VXRrdkVj2tk2+qAGXHb/6jhw=
X-Received: by 2002:adf:ec0e:: with SMTP id x14mr37900205wrn.204.1602585668012; 
 Tue, 13 Oct 2020 03:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <1602492582-3558-1-git-send-email-shengjiu.wang@nxp.com>
 <20201012190037.GB17643@Asurada-Nvidia>
In-Reply-To: <20201012190037.GB17643@Asurada-Nvidia>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Oct 2020 13:40:56 +0300
Message-ID: <CAEnQRZBrXNgMDNgQ=dMJfZQpZvdq6sUx2y21_fuk9teRd5UM0Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Add support for higher sample rates
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Tue, Oct 13, 2020 at 12:29 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> Hi Shengjiu,
>
> On Mon, Oct 12, 2020 at 04:49:42PM +0800, Shengjiu Wang wrote:
> > Add 88200Hz and 176400Hz sample rates support for TX.
> > Add 88200Hz, 176400Hz, 192000Hz sample rates support for RX.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
>
> Probably should put your own Signed-off at the bottom?

Hi Shengjiu,

Also please keep the original author of the patch. You can change that
using git commit --amend --author="Viorel Suman <viorel.suman@nxp.com>".

With that,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
