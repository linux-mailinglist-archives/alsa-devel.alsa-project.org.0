Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F16A84F88F4
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 00:04:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A78F1887;
	Fri,  8 Apr 2022 00:03:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A78F1887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649369086;
	bh=7REwnRCWL+X+/erOVACD0vx8O/QM9s4GDT9qZ654vt4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p4s7KPdxgrACf6/JtyRu76ptRjN/GfkTJuyUDt9pDr6QHrK+rZGTb4JZfdoc40cSb
	 CwIskJr8N5892BVV4sQNZUsILd2LZA3K+hEy7rYBp/QoH3I1o6SwDa+NakMBggCI1/
	 QeOUUiM6VJhJaE2oi6KD7VPFtYUI8EdI9y1VD7UU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B743EF80054;
	Fri,  8 Apr 2022 00:03:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6CB9F80054; Fri,  8 Apr 2022 00:03:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A64A0F80054
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 00:03:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A64A0F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="fvM/2hwl"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 965F41F41F77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649369018;
 bh=7REwnRCWL+X+/erOVACD0vx8O/QM9s4GDT9qZ654vt4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fvM/2hwlOx04mVlDKKzyF4XI6AmYyyNtmpW5+LxeIgJOFPind/vscDXxG1ZUJcckX
 yhppYDiGwrNHaK2i+k+q1+Y7mUOBHPi7+tabnHQtgo3eaaWr2zGISidJfpleXo3XK8
 EUPUvNFoyelpDOLXbHz0nJfjw3we9J3Nx5WAmA5590UEOAHozbz34rWcKtof5A3Vi5
 BjNU1oTfFgv0lHK4CNQq16YAnOmmoTEsZqK/B79nWawlc1V5QR/7OxFkoZ/NlFYoWE
 Bn1R2mZ7u9w4aMGepLglH0twlvSnhdL6+uQKkmFhhYv1jP7BKcV/gt7WJUuCdpprvc
 wE60jue281WFQ==
Date: Thu, 7 Apr 2022 18:03:33 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v9 4/4] ASoC: mediatek: mt8192: support rt1015p_rt5682s
Message-ID: <20220407220333.v4enuv3mqzyrawkb@notapiano>
References: <20220406100514.11269-1-jiaxin.yu@mediatek.com>
 <20220406100514.11269-5-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220406100514.11269-5-jiaxin.yu@mediatek.com>
Cc: devicetree@vger.kernel.org, linmq006@gmail.com, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 Tzung-Bi Shih <tzungbi@kernel.org>, matthias.bgg@gmail.com, aaronyu@google.com,
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

On Wed, Apr 06, 2022 at 06:05:14PM +0800, Jiaxin Yu wrote:
> To support machine that only choose one of the rt5682s and rt5682 as
> headset codec, adds new compatible string "mt8192_mt6359_rt1015p_rt5682s".
> Meanwhile, using macros to simplifies card name and compatible name.

That first sentence is particularly confusing to me. Suggestion for the commit
message:

Add support for using the rt5682s codec together with rt1015p on mt8192-mt6359
machines. All configurations are shared with the rt5682 codec variant, so simply
select the SND_SOC_RT5682S config to ensure the codec is present and set the
correct card name. The codec will be linked to by pointing to it in the
headset-codec property in the devicetree.

While at it, also create macros for the names of the different codec variants
supported by this driver, as well as rename occurrences of rt1015p_rt5682 to
rt1015p_rt5682x, since they are shared between rt5682 and rt5682s.

> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas
