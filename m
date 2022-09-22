Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5AB5E60F6
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Sep 2022 13:27:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A44BE1F2;
	Thu, 22 Sep 2022 13:26:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A44BE1F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663846053;
	bh=r0sKRJGzevBgLu3Rbdi7fUNAHgKJFzt2opqHR0c7spk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SCraNbAe/bGdKNefsnBsLBd0Bk+6CMujxKTmBGN7pnR/+79ixDmrnuYewebcTWqIn
	 XR6dqylzTnaZ0tHiDcFDYN4DvIPJXQfS4vEZechrS0YZNna09spRLAMtOo4yhPeUKZ
	 fbJuy1ZiRohBJnt1KamkuTXrTUaVML9tpAV+eeyE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FEA0F8030F;
	Thu, 22 Sep 2022 13:26:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93F0CF8027B; Thu, 22 Sep 2022 13:26:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 987DDF8012A
 for <alsa-devel@alsa-project.org>; Thu, 22 Sep 2022 13:26:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 987DDF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iRE4bI8A"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 06474B81AE4;
 Thu, 22 Sep 2022 11:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E81C433C1;
 Thu, 22 Sep 2022 11:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663845985;
 bh=r0sKRJGzevBgLu3Rbdi7fUNAHgKJFzt2opqHR0c7spk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iRE4bI8A+0TnU1wE7Y8MT4qGFHaCrSvtI83L17WLv8Efu67EmK61r7AvprBhit1/U
 fr+VL/x0UinsCEj1F7wbkhrvvCD8dcUJXTJhKQxZk+NStLPNKF86qOO++Xl6AOPuND
 cY+4r6dYgdIJuln4W/atj2FZ7zrtzjXW1MuzDufYESpEuu1wYVqGwsiZq9v5lP86mW
 n0qcCkKyFlXs5pbba3kb0fTaswhqW/ia066CwIY8xIKa5CdHp99qSXkaJ8DWqWYSbG
 P4Mu7ocJKB1E8dMCLbk1Zk9bPDgjao1CoOyk2fXQoUa0B6uf6mxGaykpVPw/5a9Q0F
 arknxZp/qNlJw==
Date: Thu, 22 Sep 2022 19:26:21 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195-mt6359: Use snd_soc_pm_ops
 instead of custom ops
Message-ID: <YyxGXXSp2JD9a6ah@google.com>
References: <20220922103502.49981-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922103502.49981-1-angelogioacchino.delregno@collabora.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
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

On Thu, Sep 22, 2022 at 12:35:02PM +0200, AngeloGioacchino Del Regno wrote:
> -static const struct dev_pm_ops mt8195_mt6359_pm_ops = {
> -	.poweroff = snd_soc_poweroff,
> -	.restore = snd_soc_resume,
> -};
> -
>  static struct platform_driver mt8195_mt6359_driver = {
>  	.driver = {
>  		.name = "mt8195_mt6359",
>  		.of_match_table = mt8195_mt6359_dt_match,
> -		.pm = &mt8195_mt6359_pm_ops,
> +		.pm = &snd_soc_pm_ops,

snd_soc_pm_ops[1] sets some more fields.  I'm not quite sure whether
it would introduce any side effect or not.  Perhaps Trevor could
provide some suggestions.

[1]: https://elixir.bootlin.com/linux/v5.19.10/source/sound/soc/soc-core.c#L2150
