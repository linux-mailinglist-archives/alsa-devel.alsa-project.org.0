Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 421D16DCFF1
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 05:04:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E63CCEFF;
	Tue, 11 Apr 2023 05:03:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E63CCEFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681182265;
	bh=PEEjDh5vRQUe6RCR25+mKa6A3brQxTBagoH7rtGAOAY=;
	h=References:In-Reply-To:Date:Subject:To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=JFUTK+CAIaVBKBSzu+p7aGPaTavAcHtBkKQ52+9esXjVLWplrqqllUlW1sxRPkb1+
	 7EXBK+RJWpXlFm1NZbuAStI5Sq/UmeZjORy/7uVjv4/xHvH4IlHrkn/+CetNwnNxto
	 p/WPxXOMXWoo1MiZo5fkYzB/8PZzD/ivPgAixjc4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFBB2F8025E;
	Tue, 11 Apr 2023 05:03:33 +0200 (CEST)
References: <20230411003431.4048700-1-shraash@google.com>
In-Reply-To: <20230411003431.4048700-1-shraash@google.com>
Date: Mon, 10 Apr 2023 20:02:54 -0700
Subject: Re: [PATCH] ASoC: mediatek: common: Fix refcount leak in
 parse_dai_link_info
To: Aashish Sharma <shraash@google.com>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/23LQQX27Z3D2A2J3VUTARELW2QKIUSZG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168118221181.26.18238819171319479771@mailman-core.alsa-project.org>
From: Guenter Roeck via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Guenter Roeck <groeck@google.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Guenter Roeck <groeck@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel test robot <lkp@intel.com>, Julia Lawall <julia.lawall@inria.fr>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09721F8032B; Tue, 11 Apr 2023 05:03:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B06FF8023A
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 05:03:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B06FF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=p23peQSB
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-54c12009c30so241797377b3.9
        for <alsa-devel@alsa-project.org>;
 Mon, 10 Apr 2023 20:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1681182186; x=1683774186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/ZlRoiu1wIxay9eSAG+82IQcuZBJKitlsbCIfhB1ls=;
        b=p23peQSBESFfKBX5qzUaFFuQlNCoNnYCcRzo4X01hLqp5yyb/EXyJ5tARG/xr3o47a
         lsw0uM1NYxVK8XD6kyiKMF2RZlz7LESjvR01hLARpXLbsNuumYzza0kNrcjRoqaFadt7
         Dlu7zl5WXscb2tsuZ3fYxy9yyNkoV4HVWEO85924Cg2p9fCjRx8D0MMpx8uL6hZKsCts
         LHP+LWP5N5cFtRMFNzij1IKncHGBrOvocZnOiixo87iJwkQYGFqIgpndRoTPzZ/SrxvM
         J8a9GINg+YQf4YnNYojwcF2xXyphK+m5MBSHRscMbmYBUDPQSXMvM8tk0TIZWHwhRYHL
         vO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681182186; x=1683774186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/ZlRoiu1wIxay9eSAG+82IQcuZBJKitlsbCIfhB1ls=;
        b=5Xy0BtODNP8oOuQrkFvRmjwL2OJLmmDwUjJmU1RvCdvAXCpku8I/lETHEBabKe7QC/
         FmwgeeVFQtxxY77tdGCBbz8/Emr4yS7XCw65on0EZKur0UUSvuV8FGshC9QhuhGQkXw6
         UqkgGj9dNcKka7Z6Jsa0DnuPHQ68IEW9r/QlBqvcgUMaJMjmnYbapE7px30CwHnQ37q0
         FCm33Ust6oNLbrAUSj5iUENw2BVlskRKuefA1aEDKFhj4gs9SrHVlA9ELWyUCO1swQbg
         optoaamLfAbIAEHxwOJv9AbmDx2XBG5/g71XFsPabWGuMmcoXFPjHdgYeEhJplGSNOsI
         0Dfw==
X-Gm-Message-State: AAQBX9f3w+ipdq1d4gfF5dsL8mgE+jJyRx326TOQ8apjwQEkoUx0GkXW
	gOAm1/MlEnRhnkjRvcWK2QrRMwMaWZUnmKKswr+dvQ==
X-Google-Smtp-Source: 
 AKy350bGTe9O8VOwunq6lfwiyzTvnTDU4MVjsdYYrKAlp1XxALqKFbfbn4DnPg7sET9+7AXo84pBp+w0Qgzjnf7nl58=
X-Received: by 2002:a81:c509:0:b0:54c:2409:c306 with SMTP id
 k9-20020a81c509000000b0054c2409c306mr6819141ywi.6.1681182185494; Mon, 10 Apr
 2023 20:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230411003431.4048700-1-shraash@google.com>
In-Reply-To: <20230411003431.4048700-1-shraash@google.com>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 10 Apr 2023 20:02:54 -0700
Message-ID: 
 <CABXOdTcDfy3oDVy6+FAg+jkqnCJABOq=VokWQ1q4QByKbo5UJQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: common: Fix refcount leak in
 parse_dai_link_info
To: Aashish Sharma <shraash@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 23LQQX27Z3D2A2J3VUTARELW2QKIUSZG
X-Message-ID-Hash: 23LQQX27Z3D2A2J3VUTARELW2QKIUSZG
X-MailFrom: groeck@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Guenter Roeck <groeck@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel test robot <lkp@intel.com>, Julia Lawall <julia.lawall@inria.fr>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/23LQQX27Z3D2A2J3VUTARELW2QKIUSZG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 10, 2023 at 5:34=E2=80=AFPM Aashish Sharma <shraash@google.com>=
 wrote:
>
> Add missing of_node_put()s before the returns to balance
> of_node_get()s and of_node_put()s, which may get unbalanced
> in case the for loop 'for_each_available_child_of_node' returns
> early.
>
> Fixes: 4302187d955f ("ASoC: mediatek: common: add soundcard driver common=
 code")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Link: https://lore.kernel.org/r/202304090504.2K8L6soj-lkp@intel.com/
> Signed-off-by: Aashish Sharma <shraash@google.com>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  sound/soc/mediatek/common/mtk-soundcard-driver.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc=
/mediatek/common/mtk-soundcard-driver.c
> index 7c55c2cb1f21..738093451ccb 100644
> --- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
> +++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
> @@ -47,20 +47,26 @@ int parse_dai_link_info(struct snd_soc_card *card)
>         /* Loop over all the dai link sub nodes */
>         for_each_available_child_of_node(dev->of_node, sub_node) {
>                 if (of_property_read_string(sub_node, "link-name",
> -                                           &dai_link_name))
> +                                           &dai_link_name)) {
> +                       of_node_put(sub_node);
>                         return -EINVAL;
> +               }
>
>                 for_each_card_prelinks(card, i, dai_link) {
>                         if (!strcmp(dai_link_name, dai_link->name))
>                                 break;
>                 }
>
> -               if (i >=3D card->num_links)
> +               if (i >=3D card->num_links) {
> +                       of_node_put(sub_node);
>                         return -EINVAL;
> +               }
>
>                 ret =3D set_card_codec_info(card, sub_node, dai_link);
> -               if (ret < 0)
> +               if (ret < 0) {
> +                       of_node_put(sub_node);
>                         return ret;
> +               }
>         }
>
>         return 0;
> --
> 2.40.0.577.gac1e443424-goog
>
