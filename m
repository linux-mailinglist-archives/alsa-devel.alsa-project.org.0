Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DF04F88C9
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 23:25:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72333185C;
	Thu,  7 Apr 2022 23:24:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72333185C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649366733;
	bh=ZM2JW5hpiHTPcC5mYT0UabIz9BN1FEYm0emgVb8w8vQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gNBy26hffy9ofZIy9R+gl6V2XvBVhGZJX2lPpQ14AEadCAFtRUXAO1j/Wuyghhu+s
	 1qN/fDzRwFMbrzKYiIyLS9EZ8Om0T6kebwIgPlYD6/epHDBHSOIlKhhicXN5dqM10l
	 twUeTWasW1FtZNe3ROaF3c5JAVYCFIzL7JSF1WkM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB542F80085;
	Thu,  7 Apr 2022 23:24:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDBA8F8024C; Thu,  7 Apr 2022 23:24:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80197F8012A
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 23:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80197F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="LiryOxC+"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 9D6F51F46A45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649366665;
 bh=ZM2JW5hpiHTPcC5mYT0UabIz9BN1FEYm0emgVb8w8vQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LiryOxC+H+6BonxWrZ4+pNbcRKz86e6YgydNpcl43YPOLnyxpjUYiuoJfDqPbWNjP
 za8u8bpPBJ2SUcPe72Vh0zPerv8izJOtPuyw7OH62o+US/bHtLN2nWjGExklAJZa0O
 bn45EReCe/JewyiEtM9fqb8GTOeZuirZ3BEyzoZbSnk0Dw9ET+f7p7neAGzBslUxZu
 LiuamJvfs1iYdtbMoc+KagPnr+mPm1qTutqlk/ISg5k1/QqMJTQDK/yJekAndw4APh
 Ct6w5Zg6lWpsHRJalImfqOHkw9c3inpZsON6kjdmQHIRTNg2i7lOizfBqNpYmJRIUg
 Fl8PimTFnVqvA==
Date: Thu, 7 Apr 2022 17:24:20 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v9 2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of
 speaker
Message-ID: <20220407212420.tncc576jo5iwaqk7@notapiano>
References: <20220406100514.11269-1-jiaxin.yu@mediatek.com>
 <20220406100514.11269-3-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220406100514.11269-3-jiaxin.yu@mediatek.com>
Cc: devicetree@vger.kernel.org, linmq006@gmail.com, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
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

Hi Jiaxin,

On Wed, Apr 06, 2022 at 06:05:12PM +0800, Jiaxin Yu wrote:
> MT8192 platform will use rt1015 or rt1015p codec, so through the
> snd_soc_of_get_dai_link_codecs() to complete the configuration
> of dai_link's codecs.

Suggestion for the commit message:

As part of the refactoring to allow the same machine driver to be used for the
rt1015(p) and rt5682(s) codecs on the MT8192 platform, parse the rt1015(p)
codecs from the speaker-codecs property in the devicetree and wire them to the
I2S3 backend, instead of hardcoding the links and selecting through the
compatible.

> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

- Tested on mt8192-asurada-spherion (rt1015p and rt5682). All audio paths still
  work as previous to this refactor. And it's still possible to omit
  mediatek,hdmi-codec.

Thanks,
Nícolas
