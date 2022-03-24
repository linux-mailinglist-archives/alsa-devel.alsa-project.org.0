Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 120144E5FA9
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Mar 2022 08:47:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC14A174D;
	Thu, 24 Mar 2022 08:46:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC14A174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648108030;
	bh=p8qcVNPM2qOW9EQx6XQFqzBj4GCexX5/KhXigTDY4CM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d9pqH1LOcdyepH5TaymX/uVEAuYUDUSsTi6EiQqfj8g/PbXuD9of/PGELL2rLrsYc
	 wdTNmVrAouSYAitXxSFOBXsBeAcZXqonF1J5Rp14u41XhI+56tt4OPAEPxGvFkPwtf
	 0QuZOgxMQ1ZNuZJi1nfq794ZsJYwOiBnUI4JHXS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34BBCF804CA;
	Thu, 24 Mar 2022 08:45:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 257DEF804C3; Thu, 24 Mar 2022 08:45:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5225F80154
 for <alsa-devel@alsa-project.org>; Thu, 24 Mar 2022 08:45:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5225F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GkCctxK1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 13725B821FA;
 Thu, 24 Mar 2022 07:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EDB3C340EC;
 Thu, 24 Mar 2022 07:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648107933;
 bh=p8qcVNPM2qOW9EQx6XQFqzBj4GCexX5/KhXigTDY4CM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GkCctxK1ampcX4CHpJBsPTacJaKiSiD9/RE/8CD2xKcHSV/q0mM5WmjaEUhZc34qZ
 ZCNKp0AvyjR1swsxhK1oo+cKNBSfvyoeptu2eWERG+T3W0+lF8HxXxjWgHC5czisUK
 +VT/r0C2HyXF4wZwjyplE/43W/5OFZ6WYDogbHFQ+DathtKjpeSv0sfmBdV5De6471
 UTNm9aNRn6LEumumovVAKNSF83sQn5uUJUVjR+6ucDrdQvCQZeJmM8/WsmmonQ2aze
 U966/qim2RMx/7+bnPat763Lx5fHgddm4MsFNLhdQTll/Yk6c+Dex+W5SZDW2upnKh
 jSGpRXYWBE81A==
Date: Thu, 24 Mar 2022 15:45:29 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH v4 5/6] ASoC: mediatek: mt8195: add machine support for
 max98390 and rt5682
Message-ID: <Yjwhmacdw+birt0/@google.com>
References: <20220324053851.27350-1-trevor.wu@mediatek.com>
 <20220324053851.27350-6-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324053851.27350-6-trevor.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, miles.chen@mediatek.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
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

On Thu, Mar 24, 2022 at 01:38:50PM +0800, Trevor Wu wrote:
> This patch adds support for mt8195 board with mt6359, max98390 and
> rt5682.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
