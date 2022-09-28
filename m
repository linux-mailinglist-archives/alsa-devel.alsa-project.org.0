Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 811865ED737
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Sep 2022 10:12:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31BC6E0F;
	Wed, 28 Sep 2022 10:11:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31BC6E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664352766;
	bh=nnLUK+aN6Lt3FvJaNIA3WC4W8c8pNG0EQHNGq3Mu/Eg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ciw3im0xr9lRMX+oFBMmSgg9XMRVUqc7IU61yGsTqBuRzylnzH4qQ6P7MsvWVrRxp
	 FxrT0YB0lUmsyrVLqURmmXpVH8PIbMtUsulDUVwmYfOay2SRs5Wi3KO23ZpKy72kpM
	 XNsgyLJDmhcGImtIT/sCpe4Z0QsEprxKybQ1rBmA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F3D3F804B3;
	Wed, 28 Sep 2022 10:11:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AC0FF80310; Wed, 28 Sep 2022 10:11:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95BA0F80109
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 10:11:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95BA0F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="O3rsUcKN"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 660DC6601FE2;
 Wed, 28 Sep 2022 09:11:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1664352700;
 bh=nnLUK+aN6Lt3FvJaNIA3WC4W8c8pNG0EQHNGq3Mu/Eg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=O3rsUcKN4/2DqQzIu/etACkLMGpcdqodkMhxuEPdRuji9Ulo/oURMEXpCsZlypIcL
 mphHF3ZtniQUis/9JfVp1PCZtT1mJTt5Vc2PBcUxSuFL8FnuvB+alC5Sv5PclBNnwA
 PsCaHE+IrViPcwWiT0zSSgPtP2tD1Su/qddiYf+HDrufIb8OnHPSSn5LM8eLbbAjSC
 u8PpT7aSZGXT1b5622YetAgmKFHSn2vDgQD+5khKfrGy5mE83NOWNZNhUURhAUG1BI
 UnNbipsBop4kwijBPWi3Gd/WGrFvr0pIlhRKVreQH1YcXRtPAi/wNdgYfHoLdm2qbc
 gYqFK7NFeHTiQ==
Message-ID: <ea20ff46-11fe-12c4-3e2a-5058f9065c60@collabora.com>
Date: Wed, 28 Sep 2022 10:11:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] ASoC: mediatek: mt8195: update audio tuner settings
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 matthias.bgg@gmail.com
References: <20220927151141.11846-1-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220927151141.11846-1-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Il 27/09/22 17:11, Trevor Wu ha scritto:
> Audio tuner is used to handle clock drift between 26M and APLL domain.
> 
> It's expected when abs(chg_cnt) equals to upper bound, tuner updates pcw
> setting automatically, and then abs(chg_cnt) decreases.
> In the stress test, we found abs(chg_cnt) possibly equals to 2 at the
> unexpected timing. This results in wrong pcw updating.
> Finally, abs(chg_cnt) will always be larger than upper bound,
> 
> As a result, we update the upper bound to 3 to handle the corner case.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


