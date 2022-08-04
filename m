Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC91589C86
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Aug 2022 15:22:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ABA6844;
	Thu,  4 Aug 2022 15:22:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ABA6844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659619374;
	bh=RuN66LAJbR6LOOQJ7u7qt+fWz/JdCItaU51XHDObBMc=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bsdk53yhHbZHUHliBHoTiko321TGAuMLOyxn6CCbgQnGY7oFDmtVgVPfBoZgtz8dZ
	 zkat8jDX09FEX2CYzMTc3RMz1oGUyiZf680twSm5oZeVsXCvvutcpfo4zYk5tG1ZMZ
	 nxxpM1mQ03DxrNWK3oGjjMXsFDv87qnwM/miJxq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8E5AF80163;
	Thu,  4 Aug 2022 15:21:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65B21F8016A; Thu,  4 Aug 2022 15:21:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30827F8012F;
 Thu,  4 Aug 2022 15:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30827F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="VWhjnCUv"
X-UUID: 213add31d33945a38819f42a3dfed214-20220804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=uVtFVVLuXt+0fSxOSYxY3n4H8Cvla5xZWG2UKu1ZiHg=; 
 b=VWhjnCUvmL7QymBlM2fecfCfPSSvCKXOxs0QDGccgXjeut4HEH8Q0r0JV2aVqv2J5lfyQ+Qe+sclZUlB6ltEw73VXUOkb3GkHcGpEeOJoo+WNn+LbXACsiBA6WMfv4vC8XUpw+v9SlKn7LbQyzBOurY2XmPnk7MHhu62Vjw0Xpk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:1c1f87de-4c07-4941-8af2-e5151f4b8e59, OB:0,
 LO
 B:10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:51
X-CID-INFO: VERSION:1.1.8, REQID:1c1f87de-4c07-4941-8af2-e5151f4b8e59, OB:0,
 LOB:
 10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:51
X-CID-META: VersionHash:0f94e32, CLOUDID:28aa4cd0-a6cf-4fb6-be1b-c60094821ca2,
 C
 OID:d7cb05d0c70b,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 213add31d33945a38819f42a3dfed214-20220804
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <chunxu.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1476704101; Thu, 04 Aug 2022 21:21:39 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 4 Aug 2022 21:21:38 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 4 Aug 2022 21:21:37 +0800
Message-ID: <46f972f41a8c1bbfc2bfa42c431308f6b5fe2234.camel@mediatek.com>
Subject: Re: [PATCH 2/2] ASoC: SOF: mediatek: Add .of_machine_select field
 for mt8186
From: chunxu.li <chunxu.li@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Thu, 4 Aug 2022 21:21:37 +0800
In-Reply-To: <Yuu+elYxBv3xZ1O2@sirena.org.uk>
References: <20220804091359.31449-1-chunxu.li@mediatek.com>
 <20220804091359.31449-3-chunxu.li@mediatek.com>
 <Yuu+elYxBv3xZ1O2@sirena.org.uk>
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

On Thu, 2022-08-04 at 13:41 +0100, Mark Brown wrote:
> On Thu, Aug 04, 2022 at 05:13:59PM +0800, Chunxu Li wrote:
> 
> > +static struct snd_sof_of_mach sof_mt8186_machs[] = {
> > +	{
> > +		.board = "mediatek,mt8186",
> > +		.sof_tplg_filename = "sof-mt8186.tplg",
> 
> The mediatek,mt8186 compatible looks like a SoC compatible not a
> board
> compatible...

Our dts config as below:
kingler board:
compatible = "google,corsola", "google,kingler", "mediatek,mt8186";
krabby board:
compatible = "google,corsola", "google,krabby", "mediatek,mt8186";
they all use the same sof_tplg_filename, so i use "mediatek,mt8186" to
match these.

The original code looks like the following:
static struct snd_soc_acpi_mach sof_mt8186_machs[] = {
	{
		.board = "google,kingler",
		.sof_tplg_filename = "sof-mt8186.tplg",
	},
	{
		.board = "google,krabby",
		.sof_tplg_filename = "sof-mt8186.tplg",
	},
	{}
};

Which of the two approaches do you prefer?


