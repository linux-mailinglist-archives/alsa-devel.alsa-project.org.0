Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 530194F6F5F
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 02:57:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D50871738;
	Thu,  7 Apr 2022 02:56:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D50871738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649293060;
	bh=Xy8Cf+XOsCMJS3zqWOHPAsptjXbizJteN5uf2mtD8SI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZvBKalYfL8JyVSPu8GHFIGhLNdHXAr80NZ56pwLl4gqVZEBJKmtaroyrnpw4VGSJZ
	 50a62WPIxNRUDtmKx8E7ssj3r6LWotep+XDUE42EdrKxf6LwwPrkwB74/zqpmp+ieo
	 OQOVVdhr9GfTHVVE6MxjFEAI6zvozpyyIT9LxdLI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43651F8019B;
	Thu,  7 Apr 2022 02:56:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0522DF800D1; Thu,  7 Apr 2022 02:56:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE2C9F800D1
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 02:56:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE2C9F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="u/NP4XCY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DD33AB81E4E;
 Thu,  7 Apr 2022 00:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AC90C385A3;
 Thu,  7 Apr 2022 00:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649292993;
 bh=Xy8Cf+XOsCMJS3zqWOHPAsptjXbizJteN5uf2mtD8SI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u/NP4XCYxnKR/NalBRnfLkM/AJVcg2nyj5fYgQbFmk1Qrs7IVRMsA6vzxAQ5xTW/Y
 WiIxkBssB90B65WU/GOX9TeYNSX1hIqWmlVamDSh3qmCAyp1g/jHZNArymA9tiPLu5
 o/1xzrHbeQ6S2YIX7MuKOcEcbsKOiFIKLN+Gh9Q2S1ujZq+FwqyMEP/9yxkZ1IlOIF
 dJujodSyADUe0RPCuFbHEMexeZk6MXaHNUO4j0o3WljwCYv/G95EhchO0gPAV2p5fp
 ziclcxhSYKQ5Fyld8zuLAGXQSnB8j32ArLZXOtk994cNya8tySUMtjgTHHKaCEjFsH
 DF5Y7gPe9VqpQ==
Date: Thu, 7 Apr 2022 00:56:29 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v9 2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of
 speaker
Message-ID: <Yk42vX7gSZp9l8yW@google.com>
References: <20220406100514.11269-1-jiaxin.yu@mediatek.com>
 <20220406100514.11269-3-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220406100514.11269-3-jiaxin.yu@mediatek.com>
Cc: devicetree@vger.kernel.org, linmq006@gmail.com, nfraprado@collabora.com,
 alsa-devel@alsa-project.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
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

On Wed, Apr 06, 2022 at 06:05:12PM +0800, Jiaxin Yu wrote:
> MT8192 platform will use rt1015 or rt1015p codec, so through the
> snd_soc_of_get_dai_link_codecs() to complete the configuration
> of dai_link's codecs.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
