Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C06E4D0DCF
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 03:04:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C403B178D;
	Tue,  8 Mar 2022 03:03:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C403B178D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646705076;
	bh=+5Cyq8EnO4Z7dInU7QtRiRgZkFYM1vfMImCrh3hisB0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ax6YdmcY7TjO5XQTZIXDf+/XizvKcL2JMQgxeOnkqJ51AMLLJ/hr8HMfyuN7jgf8P
	 S5DWD7YtFWtetSkhB06veUr9sDuuZFqhSgZNo442UTnqMOGrWpgC0W4FY56322DGTh
	 QbgZLuOSNi8+XEN+CMqLlSN0tHIrHH2eCMrTefaE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45F87F80159;
	Tue,  8 Mar 2022 03:03:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7875F8013F; Tue,  8 Mar 2022 03:03:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62E9BF800E9
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 03:03:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62E9BF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ifIYXJSu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9DA12614D8;
 Tue,  8 Mar 2022 02:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA9CBC340E9;
 Tue,  8 Mar 2022 02:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646704995;
 bh=+5Cyq8EnO4Z7dInU7QtRiRgZkFYM1vfMImCrh3hisB0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ifIYXJSuREhd5QQVQga5BeJFLiCsR1g1uDKO0QrsvhcDiPk+KayzNVPr3R5uFxXtU
 0R6eiP6w+170ffXBRqJGHRvNYLoJzSG4/kYczFZ3cpe9K1Wz4yzz67smC/s7/7PJ1L
 Jdb9s7Al3sCILD4PNdpilQ46XSiBxZ9kMd1gRhnNmdeU6IBDiWraCMDiNWjFCHkJrV
 5I1IQ53j4itSWaaYX9T+ZfFY4xwY9ucEY5fRcFkw9F6ZHPS84yRaM+rFL/nN2Bm8Rp
 dYbSBVspq1f8xJ5h4ZkV9ElhpanKR2BFOllKBWJhmFmG49fTj0jBzfSr4LcA1ll8RD
 wp+cvIJn0ZKXg==
Date: Tue, 8 Mar 2022 10:03:10 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: Fix error handling in
 mt8183_da7219_max98357_dev_probe
Message-ID: <Yia5XgkGyLbIRc1f@google.com>
References: <20220307131924.9905-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220307131924.9905-1-linmq006@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Shunli Wang <shunli.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

On Mon, Mar 07, 2022 at 01:19:21PM +0000, Miaoqian Lin wrote:
> The device_node pointer is returned by of_parse_phandle()  with refcount
> incremented. We should use of_node_put() on it when done.
> 
> This function only calls of_node_put() in the regular path.
> And it will cause refcount leak in error paths.
> Fix this by calling of_node_put() in error handling too.
> 
> Fixes: ebbddc75bbe8 ("ASoC: Mediatek: MT8183: Add machine driver with DA7219")

I am not sure if the Fixes tag makes sense.  ebbddc75bbe8 is the first commit
for the file; however, we have some more commits in between tip and
ebbddc75bbe8.

> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

With the minor comment,
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
