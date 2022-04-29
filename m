Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FB0514617
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 11:58:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1A6015C1;
	Fri, 29 Apr 2022 11:57:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1A6015C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651226280;
	bh=Zae9M9KlGhj6/eUBMx6a+ywbnf7kEaEHaOUbg50cWZw=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hkA2VW+RbUTDaSfLEv6fD95DFvNPfPK38zvra+3NM6m+9SwIblvyNgepK+FiX1288
	 +zynvtmkuFgg9CCjntXjahH59ZOM66BI9nyPwHGN2sQXFaj/+vwHqA5N+axjxwiiUg
	 zgEUNJywNaWqRFnFNiC2e+CDn4EKT1KnwUgb06to=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D320F80269;
	Fri, 29 Apr 2022 11:57:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4EC3F8025D; Fri, 29 Apr 2022 11:56:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EF2BF8007E
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 11:56:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EF2BF8007E
X-UUID: 4d656209bdc4489eb15392a127ed434f-20220429
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:b26a2fb7-58be-4091-9061-5c9a6135eae3, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:45
X-CID-INFO: VERSION:1.1.4, REQID:b26a2fb7-58be-4091-9061-5c9a6135eae3, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:45
X-CID-META: VersionHash:faefae9, CLOUDID:29e2f5c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,File:nil,QS:0
 ,BEC:nil
X-UUID: 4d656209bdc4489eb15392a127ed434f-20220429
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 330748639; Fri, 29 Apr 2022 17:56:45 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 29 Apr 2022 17:56:44 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Apr 2022 17:56:43 +0800
Message-ID: <2930dbe4b9e445e5d3d33a0c94fdd44d9eebae96.camel@mediatek.com>
Subject: Re: [v4 07/18] ASoC: mediatek: mt8186: support i2s in platform driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Fri, 29 Apr 2022 17:56:43 +0800
In-Reply-To: <YmqE+80xyBoIJvto@sirena.org.uk>
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
 <20220428093355.16172-8-jiaxin.yu@mediatek.com>
 <YmqE+80xyBoIJvto@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

On Thu, 2022-04-28 at 13:13 +0100, Mark Brown wrote:
> On Thu, Apr 28, 2022 at 05:33:44PM +0800, Jiaxin Yu wrote:
> 
> > +/* clock source control */
> > +static const char * const mt8186_i2s_src_str[] = {
> > +	"Master", "Slave"
> > +};
> > +
> > +static const struct soc_enum mt8186_i2s_src_enum[] = {
> > +	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(mt8186_i2s_src_str),
> > +			    mt8186_i2s_src_str),
> > +};
> 
> Not clear why this is user visible?  Shouldn't the machine driver be
> setting this.  Also please use more modern provider/consumer
> terminology
> for the clocking.
> 
Sorry, here are the controls left by debug, I should remove them.
Yes, I should use provider/consumer terminology for the clocking, just
link the SND_SOC_DAIFMT_CBP_CFC.

> > +static int mt8186_i2s_hd_set(struct snd_kcontrol *kcontrol,
> > +			     struct snd_ctl_elem_value *ucontrol)
> > +{
> > +		return -EINVAL;
> > +	}
> > +
> > +	i2s_priv->low_jitter_en = hd_en;
> > +
> > +	return 0;
> > +}
> 
> Same issue as on the other patch with the events - like I said there
> mixer-test will find a bunch of these issues for you.
Yes, I remember it.
Next I will continue to use mixer-test to check all of the mixer
controls.


