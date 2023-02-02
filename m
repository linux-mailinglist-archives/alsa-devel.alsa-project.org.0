Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4D96883F7
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 17:18:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44FD3EBA;
	Thu,  2 Feb 2023 17:17:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44FD3EBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675354707;
	bh=4e6BC4NTOr3CWC6ti8Bb3vrMG2t91KKoYvhqNKu8ZOs=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=tmRquM1Vu/K3NnUhapSoLBy3m4bJy1s5dKtZhaPpl6WPDTwDQcbFXarnEBGfG1/He
	 PfRL+aNxrwK515JHXs+Wubkw6Lpp/+i/B0/O0FPr2RCcnkfPR88ZhdUdNd1hFHfUcZ
	 mrlv+Oqv3ajqD7u8jt0g9hMzrZodFBLRKh96a96o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0456F800E3;
	Thu,  2 Feb 2023 17:17:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B078F804C2; Thu,  2 Feb 2023 17:17:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57BB2F800ED
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 17:17:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57BB2F800ED
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=QskZxot5
Received: by mail-wm1-x32d.google.com with SMTP id bg26so1847455wmb.0
 for <alsa-devel@alsa-project.org>; Thu, 02 Feb 2023 08:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tM2tAG1KHS9gAyhcPLjkjYt8F4gMNaekAqdi+Z0D3jE=;
 b=QskZxot5mc2Exa8IWCLZzUy0ZgCN5SeK2vwVanKyB2t7of02G81jkeeZ/2Bzj7lfmm
 2siEjAcnKKBmmU+NNSxvq35ExnO+IKq1JiytOwRetZunBwuOXuBdHP+v2T/0QnfArYxL
 b4uRxVGr3Ta5mfPQ3az1H8E3HzVuK9SnsMsq9ArYDnmFyrX3bfmJENN9M0tnBt1pSnqd
 KaatnXYDhoUurnrXaq6szgyFW7CZenyM/A3vZ/1qqoas2SUy0uAdyewjiBH/VCzBAzOt
 h4OrQA/KW8RrhdN0a1as7vg4+4gFdK4ql0TK7adPFUlZY/cGovr5c4V1yUZ76c48blqk
 zhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tM2tAG1KHS9gAyhcPLjkjYt8F4gMNaekAqdi+Z0D3jE=;
 b=rByc+A2vUT4G9wcOMglqOgV8L/V3/K7Y7/TDq7bukm6wJ+LkjHiGBW7ytxaY758piI
 /XHe/8jiEE3URzsVtVuMj0x9dSQ/zNOOTv8khongtKJof7RSo46y4TDPFsnxtkt58yb1
 Sts2w+M/Sa2EQ9k4zvArfuRQEgum091v8sOeAyP8shD3C6GWS7AbtmNzvjVNwD6yqo+g
 L/c99U7RRh4Ar9wbGmwVGXANgGvq/7ZZmouVVfXhqLHYn57AGtYEBNeVDnMAekJstMhK
 UkkA5tiOOGCE+psc/FtRA0fKwBYSOdjzRy0l10y31ZYLviyFG1yFSRyUVfNsHfWIB7AC
 v1eA==
X-Gm-Message-State: AO0yUKWE/ZAZ2Dug7KUfFw2SG09PrhyDvxaDWwjfe4Zg84wjxe/brBpP
 PHoNyBCb17CCY+DaVgDhfno=
X-Google-Smtp-Source: AK7set+px4qLsaBOaUEfLm/zCt9ycrIHjHt1QgT6ErzvraazA3Tx2vnHVt3VDBi6Er2VVCrDXjc4dw==
X-Received: by 2002:a05:600c:3d06:b0:3df:dc0d:f0b3 with SMTP id
 bh6-20020a05600c3d0600b003dfdc0df0b3mr2521516wmb.9.1675354641972; 
 Thu, 02 Feb 2023 08:17:21 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c459100b003dee8c5d814sm5332469wmo.24.2023.02.02.08.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 08:17:21 -0800 (PST)
Date: Thu, 2 Feb 2023 15:17:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188: remove etdm dead code
Message-ID: <Y9upwNAzXzSxmiFo@kadam>
References: <20230202103704.15626-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202103704.15626-1-trevor.wu@mediatek.com>
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Feb 02, 2023 at 06:37:04PM +0800, Trevor Wu wrote:
> Some Smatch static checker warning like below was found.
> 
> sound/soc/mediatek/mt8188/mt8188-dai-etdm.c:2487
> mt8188_dai_etdm_parse_of()
> warn: 'ret' returned from snprintf() might be larger than 48
> 
>     2479         for (i = 0; i < MT8188_AFE_IO_ETDM_NUM; i++) {
>     2480                 dai_id = ETDM_TO_DAI_ID(i);
>     2481                 etdm_data = afe_priv->dai_priv[dai_id];
>     2482
>     2483                 ret = snprintf(prop, sizeof(prop),
>     2484                                "mediatek,%s-multi-pin-mode",
>     2485                                of_afe_etdms[i].name);
>     2486                 if (ret < 0) {
> --> 2487                         dev_err(afe->dev, "%s snprintf
> err=%d\n",
>     2488
> 
> In linux kernel, snprintf() never returns negatives. On the other hand,
> the format string like "mediatek,%s-multi-pin-mode" must be smaller
> than sizeof(prop)=48.
> 
> After discussing in the mail thread[1], I remove the dead code to fix
> the Smatch warnings.
> 
> [1]: https://lore.kernel.org/all/Y9EdBg641tJDDrt%2F@kili/
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---

Thanks!

Regards,
dan carpenter

