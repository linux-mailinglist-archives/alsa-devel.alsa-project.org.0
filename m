Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8991B65887E
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Dec 2022 02:58:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A734D362A;
	Thu, 29 Dec 2022 02:57:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A734D362A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672279114;
	bh=4HMDENSmqd+kqq2dbn76jDaJZw62Ut46vaeQZbPJ5vY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lGHd2rgQKIdWO57+fA1tuakE9axCV+fz1p+GwhvgzK5lZQgGJrPjMUCqcKIbENm0v
	 K1nwyy7Olnzb3tdWRDB4slhR+tshkwAtEq4jnhnUSSqnmS5l8WpwH+XNy/dMHqaSav
	 9KbiE7yCCFiY0DhqGFFCUv+GbPG7WxC9pbVafa8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 460F1F804D6;
	Thu, 29 Dec 2022 02:57:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DA2EF804CF; Thu, 29 Dec 2022 02:57:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 625C5F80424
 for <alsa-devel@alsa-project.org>; Thu, 29 Dec 2022 02:57:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 625C5F80424
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=RG4ggRpN
Received: by mail-pj1-x1031.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so17625816pjj.4
 for <alsa-devel@alsa-project.org>; Wed, 28 Dec 2022 17:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cnD/RzITAaCo0W/Xpw6ph61xIfFH2Lmi3380MMi1QTc=;
 b=RG4ggRpNeSoOzWnUX016p8CwEJhbOabHjHOTqhNIzt3ivuZtj8ZYXU4L89WV7lFpb4
 qW2CZwTwgCSTwVKKSb/dJCh8Xkws7oB6OfrDu5ivsgyvEcJOX68mbP1dHMUb2EyK2KrP
 Uf0QEB4vWpFptSOVCplCFt0s3Y8DvalzJuJhwMFyj3y24V/GJGTD5npKn9sdOdSEo+La
 gBlX2b+wweC3RLBba/CX9pfVQVLIWFVwWrCasoKoO6wEciAvSIcOa2s0onImpnoISWlW
 fVY8thwju+TyGgMULDo0WhVKbfc37ZCIw/86Wt4x8Dz2vtcpOXx1htxTppzM9aa4JzgP
 YG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cnD/RzITAaCo0W/Xpw6ph61xIfFH2Lmi3380MMi1QTc=;
 b=2rm84JEYVMv0lGCF0TPaLztBdimHtIm2RIsXWBed3J8/+vCQdlzoK8K0E5V1hnas5n
 qZo9opfdk9kryWkdkQyZwlh7PABERqm99mC5d1byn8yl4WXIQlqckADbn/yaFMIU++XH
 vhlnMt4WAdyxC5V84e+vw7sSA2Oj37T8RxKLeCHYwMVuFcTxD8nleu9SizlNn3DD9AIb
 GeYOp71WEInEVPbdEKxztNH2X5ra12rI4YkVt8aFUF0JxvGUn3bcZCyO/bl8LNtW03Wi
 hhrCdPvckj0PbXcVIotJiKxUtYzpKBuo27xs8SGNnBLJtTM9Drn4dNOwLby/k5eMckEU
 Aq4w==
X-Gm-Message-State: AFqh2kq7G2WDONH7xphTRfC6/QIW8WNYnxi7F1Nx6VufIwPFDjbifRf8
 mFhvuhDCBlRYGn2zcpUJpv/4vIa9O8uMxftajWTclA==
X-Google-Smtp-Source: AMrXdXsI6ey/ULconTSKs3/vGV6F5TB8gXUQvud4gm1EluTJ37vRcZf8qtnyAMaxz3lkrRm/egClTyLGtWuvT4fKlAk=
X-Received: by 2002:a17:902:ca93:b0:187:1b89:52da with SMTP id
 v19-20020a170902ca9300b001871b8952damr1324253pld.172.1672279052510; Wed, 28
 Dec 2022 17:57:32 -0800 (PST)
MIME-Version: 1.0
References: <20221228122230.3818533-1-tongjian@huaqin.corp-partner.google.com>
 <20221228122230.3818533-2-tongjian@huaqin.corp-partner.google.com>
 <cae5273e-aac5-0c4c-6686-fb2cbc5379e3@linaro.org>
In-Reply-To: <cae5273e-aac5-0c4c-6686-fb2cbc5379e3@linaro.org>
From: Jian Tong <tongjian@huaqin.corp-partner.google.com>
Date: Thu, 29 Dec 2022 09:57:21 +0800
Message-ID: <CAKKM_AVxcSW+ZaTbMuR-+=Fbkr64Arm2-3-MPWmoYV9Dpxkqdw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8186: support rt5682s_max98360
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 chunxu.li@mediatek.com, nfraprado@collabora.com, linux-kernel@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, jiaxin.yu@mediatek.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 ajye_huang@compal.corp-partner.google.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,
Yes, this is my full name.

Best regards,
tongjian


On Wed, Dec 28, 2022 at 8:37 PM Krzysztof Kozlowski <
krzysztof.kozlowski@linaro.org> wrote:

> On 28/12/2022 13:22, tongjian wrote:
> > Add support for using the rt5682s codec together with max98360a on
> > MT8186-MT6366-RT1019-RT5682S machines.
> >
> > Signed-off-by: tongjian <tongjian@huaqin.corp-partner.google.com>
>
> The author and SoB should be full name. Is this correct (full)
> transliteration of your name?
>
>
> Best regards,
> Krzysztof
>
>
