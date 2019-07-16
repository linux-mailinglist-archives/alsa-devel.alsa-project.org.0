Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3916A5C1
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jul 2019 11:45:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C3E31696;
	Tue, 16 Jul 2019 11:44:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C3E31696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563270340;
	bh=qmgq5riaJtzcu3r+StvhjdVxXyPWbTv+1oOzIQNafkg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rv3oDL62SLCNRh/Aq++ruk6ADRAs3Phf4SEWYkoYVahpZQgcKsRDeKO5GRtGNDf2K
	 O4fIjLQfm027FABpQRxIuvcMh7j7Hfn8m8qBNlzCzAt1rnYa9zzJpOY4tlOJmpXgZm
	 wVAvSabVCWDbUO9rVYgUt7qOBw+AIIzs8fzg8dqM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DF72F803CF;
	Tue, 16 Jul 2019 11:43:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64487F802BC; Tue, 16 Jul 2019 11:43:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2CC3F800C6
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 11:43:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2CC3F800C6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H41dQvPR"
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BCB0D21842
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 09:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563268016;
 bh=sLeJAGoi6fbJl/VVolgOKFuiWf+MDSI1pIqVj9ar2uk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=H41dQvPRZCOK0u3tIALceDa7Ciy6R22No8F1DJDtPDfkbZP4yq1w0XbEDJrbs6iS9
 POZgDz1igIbMqcME5m6oISLkJPevFShbmL1IskR+AtZIaLXeOctT424c3b/ytZeBcH
 eWXObYMQJCCHGDE8YvqcLXDFg8s+2HQM1HC2NYzo=
Received: by mail-lj1-f178.google.com with SMTP id m8so19129166lji.7
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 02:06:55 -0700 (PDT)
X-Gm-Message-State: APjAAAXx4do+HobfhkkHqgRnf97hvtjyt45rtbdP7QDbqLeWQ9ItlwFR
 nXo9dLll0bNyHint6iU7crh/GvqBvc6YWaTmc4s=
X-Google-Smtp-Source: APXvYqxCZng3zYWjzQTjtV/26d0IoB6FVFDI634g+iFqqrBwpA0cXUo83GeZu94zDjolDmOXC59cJaRNhePVGSb8WVw=
X-Received: by 2002:a2e:7818:: with SMTP id t24mr16375828ljc.210.1563268014039; 
 Tue, 16 Jul 2019 02:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <1562989575-33785-1-git-send-email-wen.yang99@zte.com.cn>
 <1562989575-33785-3-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1562989575-33785-3-git-send-email-wen.yang99@zte.com.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 16 Jul 2019 11:06:43 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdY7xqcBJzU6pe1pSmpbNoBY6yh0rih2t4XGXaYWP3WfA@mail.gmail.com>
Message-ID: <CAJKOXPdY7xqcBJzU6pe1pSmpbNoBY6yh0rih2t4XGXaYWP3WfA@mail.gmail.com>
To: Wen Yang <wen.yang99@zte.com.cn>
Cc: wang.yi59@zte.com.cn, alsa-devel@alsa-project.org, xue.zhihong@zte.com.cn,
 sbkim73@samsung.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, s.nawrocki@samsung.com,
 cheng.shengyu@zte.com.cn
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: samsung: odroid: fix a
	double-free issue for cpu_dai
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sat, 13 Jul 2019 at 05:48, Wen Yang <wen.yang99@zte.com.cn> wrote:
>
> The cpu_dai variable is still being used after the of_node_put() call,
> which may result in double-free:
>
>         of_node_put(cpu_dai);            ---> released here
>
>         ret = devm_snd_soc_register_card(dev, card);
>         if (ret < 0) {
> ...
>                 goto err_put_clk_i2s;    --> jump to err_put_clk_i2s
> ...
>
> err_put_clk_i2s:
>         clk_put(priv->clk_i2s_bus);
> err_put_sclk:
>         clk_put(priv->sclk_i2s);
> err_put_cpu_dai:
>         of_node_put(cpu_dai);            --> double-free here
>
> Fixes: d832d2b246c5 ("ASoC: samsung: odroid: Fix of_node refcount unbalance")
> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Sangbeom Kim <sbkim73@samsung.com>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: alsa-devel@alsa-project.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  sound/soc/samsung/odroid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
