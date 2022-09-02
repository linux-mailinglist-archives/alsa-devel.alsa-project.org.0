Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B7F5AA6B1
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Sep 2022 05:59:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAB29164E;
	Fri,  2 Sep 2022 05:58:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAB29164E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662091157;
	bh=IVVO2fA60wdbWGCCowif814eNwLORqaGfv9j11sQ3cw=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tFqIeCZ1TVE3GfKn/8UaJRVRzXMNscwMe5YgT6XUjpLTeehEvVu2JtHCdFBu1X9C/
	 re3raRC5DgavdQtS4rpcWvtpqhR9vjUyUR56CSdBZJxYmg1181S9RyrCAN8njQ2QM4
	 uKGGtIsbd3jbku4qX42lpWDjQ1Me7hQTmuzssYmQ=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4095AF804E6;
	Fri,  2 Sep 2022 05:58:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50A00F8027B; Fri,  2 Sep 2022 05:58:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4578F80125;
 Fri,  2 Sep 2022 05:58:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4578F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="uj3PGtg1"
X-UUID: da09cccc653e46f6b7be9721aee07056-20220902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=O8ywcpytW9+OpMuNWQtzTY6IgtinF6jzWEGtK+dsF/k=; 
 b=uj3PGtg1vq9n5ZQu62whGkrs8WxuAFphNi4ABqaVKsGDHN7+X5cI5bBpbDcXVpOA6cnSj/8zqoxKkPeX35tIce4I/nsSwwQDXiwB/Jel3HJe7PFTOTg0gqYzlOasSMTpcaHEy1ZL45euZ8hSMwwY0BAIDbvWuSy8wjEgAmsgRSs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:4e92027a-b413-4de0-9a95-33606460dfc4, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18, CLOUDID:a01867d0-20bd-4e5e-ace8-00692b7ab380,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
 nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: da09cccc653e46f6b7be9721aee07056-20220902
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <chunxu.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1929600818; Fri, 02 Sep 2022 11:57:53 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 2 Sep 2022 11:57:52 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 2 Sep 2022 11:57:51 +0800
Message-ID: <9b3d787387685f2153fe7c99b77a8b8b482f8954.camel@mediatek.com>
Subject: Re: [PATCH v2 0/2] Introduce sof_of_machine_select
From: chunxu.li <chunxu.li@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Fri, 2 Sep 2022 11:57:51 +0800
In-Reply-To: <166128061023.1031684.5884182401063110421.b4-ty@kernel.org>
References: <20220805070449.6611-1-chunxu.li@mediatek.com>
 <166128061023.1031684.5884182401063110421.b4-ty@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, daniel.baluta@nxp.com,
 tinghan.shen@mediatek.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com,
 project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 peter.ujfalusi@linux.intel.com, linux-arm-kernel@lists.infradead.org,
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

On Tue, 2022-08-23 at 19:50 +0100, Mark Brown wrote:
> On Fri, 5 Aug 2022 15:04:47 +0800, Chunxu Li wrote:
> > From: "chunxu.li" <chunxu.li@mediatek.com>
> > 
> > Change since v1:
> >   - remove the callback of_machine_select defined in sof-priv.h
> >   - move sof_of_machine_select to common code, and called in
> >     sof_machine_check
> >   - rename .board field to .compatible in structure snd_sof_of_mach
> > 
> > [...]
> 
> Applied to
> 
>    
> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git__;!!CTRNKA9wMg0ARbw!wdXixJVRiZEF4J6bn68hzN7GZ5gAa67otOgycstenmVEsECqFl08ZMVP2aJBGVuvQg$
>   for-next
> 
> Thanks!
> 
> [1/2] ASoC: SOF: Introduce function sof_of_machine_select
>       commit: 6ace85b9838dc0162b474dbbbb6b388e7561f6a7
> [2/2] ASoC: SOF: mediatek: Add sof_mt8186_machs for mt8186
>       commit: 2dec9e09e955dfc4b7843fa4f9c09e7ee8931b1d
> 
> All being well this means that it will be integrated into the linux-
> next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual
> testing
> and review of the tree, please engage with people reporting problems
> and
> send followup patches addressing any issues that are reported if
> needed.
> 
> If any updates are required or you are submitting further changes
> they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when
> replying
> to this mail.
> 
> Thanks,
> Mark

Hi Mark,

It looks like the patch didn't applied success.

The patch link is 
https://patchwork.kernel.org/project/alsa-devel/patch/20220805070449.6611-2-chunxu.li@mediatek.com/

the merged link is 
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?id=6ace85b9838dc0162b474dbbbb6b388e7561f6a7

In sound/soc/sof/sof-audio.c the changes are:

 #include <linux/bitfield.h>
 #include "sof-audio.h"
+#include "sof-of-dev.h"
 #include "ops.h"
 
 static void sof_reset_route_setup_status(struct snd_sof_dev *sdev,
struct
 snd_sof_widget *widget)
@@ -784,6 +785,28 @@  int sof_dai_get_bclk(struct snd_soc_pcm_runtime
*rtd)
 }
 EXPORT_SYMBOL(sof_dai_get_bclk);
 
+static struct snd_sof_of_mach *sof_of_machine_select(struct
snd_sof_dev
 *sdev)
+{
+	struct snd_sof_pdata *sof_pdata = sdev->pdata;
+	const struct sof_dev_desc *desc = sof_pdata->desc;
+	struct snd_sof_of_mach *mach = desc->of_machines;
+
+	if (!mach)
+		return NULL;
+
+	for (; mach->compatible; mach++) {
+		if (of_machine_is_compatible(mach->compatible)) {
+			sof_pdata->tplg_filename = mach-
>sof_tplg_filename;
+			if (mach->fw_filename)
+				sof_pdata->fw_filename = mach-
>fw_filename;
+
+			return mach;
+		}
+	}
+
+	return NULL;
+}
+
 /*
  * SOF Driver enumeration.
  */
@@ -794,6 +817,7 @@  int sof_machine_check(struct snd_sof_dev *sdev)
 	struct snd_soc_acpi_mach *mach;
 
 	if (!IS_ENABLED(CONFIG_SND_SOC_SOF_FORCE_NOCODEC_MODE)) {
+		const struct snd_sof_of_mach *of_mach;
 
 		/* find machine */
 		mach = snd_sof_machine_select(sdev);
@@ -803,6 +827,12 @@  int sof_machine_check(struct snd_sof_dev *sdev)
 			return 0;
 		}
 
+		of_mach = sof_of_machine_select(sdev);
+		if (of_mach) {
+			sof_pdata->of_machine = of_mach;
+			return 0;
+		}
+


But the real applied is only one line as below.

 #include <linux/bitfield.h>
 #include "sof-audio.h"
+#include "sof-of-dev.h"
 #include "ops.h"


