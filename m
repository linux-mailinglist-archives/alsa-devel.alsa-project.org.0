Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1234E5C89
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Mar 2022 01:58:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 655DC166F;
	Thu, 24 Mar 2022 01:57:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 655DC166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648083483;
	bh=56vaE5jbiPpw7MVnANHxMK6Guy2/JixLTTS08O3G2BE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BmpwZpE8AH8J2FBLyTG7idiWwzYqRcRhSfVAPYf5aXsZ4LbhcH8GWbWPaUqNd1HZZ
	 1jr69dDIFqthrMSAAW7wIViiVN/0Q/sU0r1RtwOueUuAYyVPHXDNbgcqjcYj40qPNh
	 8SVoWIHHwHFp2j576encDUzse280cfOwU73Aawqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEE73F80310;
	Thu, 24 Mar 2022 01:56:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07B45F802DB; Thu, 24 Mar 2022 01:56:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 011E9F800AA
 for <alsa-devel@alsa-project.org>; Thu, 24 Mar 2022 01:56:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 011E9F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JPSU4HvK"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 905F9B821DA;
 Thu, 24 Mar 2022 00:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACF7C340E8;
 Thu, 24 Mar 2022 00:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648083408;
 bh=56vaE5jbiPpw7MVnANHxMK6Guy2/JixLTTS08O3G2BE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JPSU4HvK4hOdpWGvKvRUp6oCwLtPlazGX4xUwQM1cIVgX9oUYZW2LQIWlIau0W8QW
 VavLtjNIDISByHRmgKPCYQ+wuFmTfgnEHELT9dZKRau/fut1ay3QTPjYUcffxizfvg
 iY26zm9V/Dcp30PLMpvtaKrEbxCDLxeAbSp++RGJCyIOhyfYNrpmkA2FpVrkIo07aO
 pabHz+aew5bG8U9q7T3RLImqkKKYgtrcblr9p805MDhZFjBlwPjc7NNZ+Tft7p+qJ/
 5jzm2ESZEohUxCnVjjSEC8pBu4dGHYb6iukxo394BfNk0RJcBt5DZAibFFR4hM8Q0f
 RkaqxPz5LoclA==
Date: Thu, 24 Mar 2022 08:56:43 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v6 2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of
 speaker
Message-ID: <YjvByyiuPWrVAFTW@google.com>
References: <20220323164442.921-1-jiaxin.yu@mediatek.com>
 <20220323164442.921-3-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220323164442.921-3-jiaxin.yu@mediatek.com>
Cc: devicetree@vger.kernel.org, linmq006@gmail.com, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org,
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

On Thu, Mar 24, 2022 at 12:44:40AM +0800, Jiaxin Yu wrote:
> MT8192 platform will use rt1015 or rt105p codec, so through the
> snd_soc_of_get_dai_link_codecs() to complete the configuration
> of dai_link's codecs.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Except the name: speaker-codec vs. speaker-codecs.  Have replied to the DT
bindings patch in the same series.
