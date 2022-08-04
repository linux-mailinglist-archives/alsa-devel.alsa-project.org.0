Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C44589D9D
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Aug 2022 16:37:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A1E341;
	Thu,  4 Aug 2022 16:36:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A1E341
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659623848;
	bh=Ga/otXN0bNRqkrg8vIyToZ5uuFB8nLKcep2QXlb5Tow=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c47vkUkVTosnGe4Hlgy1mBreFuqmN+RWj0ngaGELHh2938whGmKZB9AN/JbZlS2+O
	 abWUhwh1JnbrLwzNzq34A5Q3p0iRvKGM40NZYmvlqM8qaR1pdiuxpfbWDQysgnFZTz
	 1C6nW0nxhcBRzNqwv9WOD1Fq9fI7BM/jmigStNkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D534FF804BC;
	Thu,  4 Aug 2022 16:36:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23341F8016A; Thu,  4 Aug 2022 16:36:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30E79F8012F;
 Thu,  4 Aug 2022 16:36:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30E79F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="Yrnr5O0c"
X-UUID: 20fb53e69b5248c88cee12dc171a08ba-20220804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=K8H3C7vLWZ08jIC2f4kfLguCPNFh1PnkyOg0jzc2D8c=; 
 b=Yrnr5O0ciR1NM4ZK6yc+gph/jSgoB3/2BJjoGMByI0ZBsKlDW4zxhPYT8l1bcOAuhNcGzZmMdk70P02DgHgok+ajKjFg8DHcOnqHsvWHupaWz/2DeUCy3OcbwnsSnFjdGbpyvI+cc31dSqmotkzQU8uqOT21kQ5rikvsxEULoCY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:0040a9a0-cc2f-49d1-a232-c5de8ba9e55f, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:0f94e32, CLOUDID:2f524725-a982-4824-82d2-9da3b6056c2a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: 20fb53e69b5248c88cee12dc171a08ba-20220804
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <chunxu.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1014873863; Thu, 04 Aug 2022 22:36:10 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 4 Aug 2022 22:36:08 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 4 Aug 2022 22:36:07 +0800
Message-ID: <644d24503899e6ed8b6a7321979e11e46577a610.camel@mediatek.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: Introduce optional callback
 of_machine_select
From: chunxu.li <chunxu.li@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Thu, 4 Aug 2022 22:36:07 +0800
In-Reply-To: <YuvG4drwG/rYoozp@sirena.org.uk>
References: <20220804091359.31449-1-chunxu.li@mediatek.com>
 <20220804091359.31449-2-chunxu.li@mediatek.com>
 <YuvG4drwG/rYoozp@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, peter.ujfalusi@linux.intel.com,
 tinghan.shen@mediatek.com, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com, project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 yc.hung@mediatek.com, matthias.bgg@gmail.com,
 sound-open-firmware@alsa-project.org, daniel.baluta@nxp.com,
 linux-kernel@vger.kernel.org, angelogioacchino.delregno@collabora.com
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

On Thu, 2022-08-04 at 14:17 +0100, Mark Brown wrote:
> On Thu, Aug 04, 2022 at 05:13:58PM +0800, Chunxu Li wrote:
> 
> > @@ -284,6 +284,7 @@ struct snd_sof_dsp_ops {
> >  	void (*machine_unregister)(struct snd_sof_dev *sdev,
> >  				   void *pdata); /* optional */
> >  	struct snd_soc_acpi_mach * (*machine_select)(struct snd_sof_dev
> > *sdev); /*
> >  optional */
> > +	struct snd_sof_of_mach * (*of_machine_select)(struct
> > snd_sof_dev *sdev);
> 
> I don't understand why we pass this in as a function when as far as I
> can see it should always be the standard operation provided by the
> core
> - why not just always call the function?  We can tell at runtime if
> the
> system is using DT so there's no issue there and there shouldn't be
> any
> concerns with ACPI or other firmware interfaces.

Thanks for you advice, I'll remove the callback function, and directly
call sof_of_machine_select() in sof_machine_check() as following.

int sof_machine_check(struct snd_sof_dev *sdev)
{
snip...
	const struct snd_sof_of_mach *of_mach;
	/* find machine */
	mach = snd_sof_machine_select(sdev);
	if (mach) {
		sof_pdata->machine = mach;
		snd_sof_set_mach_params(mach, sdev);
		return 0;
	}

	
+	of_mach = sof_of_machine_select(sdev);
+	if (of_mach) {
+		sof_pdata->of_machine = of_mach;
+		return 0;
+	}
snip ...
}

