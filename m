Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C918467534C
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 12:16:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A1CC3160;
	Fri, 20 Jan 2023 12:15:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A1CC3160
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674213382;
	bh=pk0IDna2rdFOCASraCLd7evCkGbMHFk7ARo77hGlbMo=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BCxFihmjnxUi2oimebSB43cicyeQb1HnSMCr6kDxRhZqVgkitvA+sLRchq/Dk+sZj
	 NkKmLp0JbMRp+4kpgPaKxqJy/hppz+ohUHZ4CV6FYb1XqSUqBBqn+w2/fTopiESm43
	 90iX1TA67Zt3Rw602SXx9NWH4JzlLgMBGDAxz4E0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B6A5F80542;
	Fri, 20 Jan 2023 12:15:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6A67F80495; Fri, 20 Jan 2023 12:15:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26189F800F0
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 12:15:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26189F800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=K2MOTQvL
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E1AB96602D25;
 Fri, 20 Jan 2023 11:15:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1674213325;
 bh=pk0IDna2rdFOCASraCLd7evCkGbMHFk7ARo77hGlbMo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=K2MOTQvLN7GOlV57FsPI26ZCkig6YDHIcebXCASlOI+Dtrp0mjLBJCY6iy95WiFvl
 1mnskzibbi3R6xOjsgp1d8CLmRCYv94hF8xjwpcWPQ0xSHRc90X2XsfYNBxL+HZuJ3
 IJ+qtg9RzoV6K81BA87zEV9pQWcsZEKN2ysjtGynroVr7hYF2hsqD4Q5JC6iAltSmB
 xwnSWQrafRZ0QtcA/Psi//KI3ntUbP0OInTF52KXaU44UkekjRDP3Wge9BUTRne+Lg
 EV8p4arvjD/f0WjC8EAc6Qb+OW7TF5akWw32mYkdQbtjYvMMTaMzk/G/cqgeFLTnfI
 QftUW5bfliLTw==
Message-ID: <8f7bda23-7063-d2ff-9b5d-b1604052a502@collabora.com>
Date: Fri, 20 Jan 2023 12:15:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 2/3] iommu/sound: Use component_match_add_of helper
Content-Language: en-US
To: Sean Anderson <sean.anderson@seco.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
References: <20230119191040.1637739-1-sean.anderson@seco.com>
 <20230119191040.1637739-3-sean.anderson@seco.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230119191040.1637739-3-sean.anderson@seco.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Yong Wu <yong.wu@mediatek.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Il 19/01/23 20:10, Sean Anderson ha scritto:
> Convert users of component_match_add_release with component_release_of
> and component_compare_of to component_match_add_of.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> Acked-by: Mark Brown <broonie@kernel.org>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


