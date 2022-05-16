Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA651528304
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 13:19:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29DB01684;
	Mon, 16 May 2022 13:19:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29DB01684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652699996;
	bh=i+A7XEcgsqs7AjWRmWvtq63K0PtN2tpmTvBhydzxduU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KqVQP8VSu7rfapOWLKpjTJUQVfwMgHs1eyIVdHAVBveEDcbmGblDg0F07qL1bM3ZJ
	 7Id5vNfhnFVNdYCbjZ90gv2gVNK3+mqdxJdcqUspkz40YDsbirlt5Rcq+hQlvi5Kao
	 BOrOmBHfhUgVKoNm7WUIBgNhM934jYox0YFrOoXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BAF8F80171;
	Mon, 16 May 2022 13:18:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36284F8014B; Mon, 16 May 2022 13:18:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1EA0F8012C
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 13:18:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1EA0F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LYQ5Gtiw"
Received: by mail-ej1-x632.google.com with SMTP id i27so27934256ejd.9
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 04:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pmfsIHbJLueJ35bgeNRJJDeDJTrJmP4/XqfMWtgXDDU=;
 b=LYQ5GtiwSVm7LNB+PreZgfk443WWrmBicaCw3pTCFbG34FCjiXhosbAYFm87ix7mRR
 DJbuykytG5jHe5EG6osBFZxVeuf8Z9hE8BDt9SzTkRybx6abf40mMW5G+xJSRv/p/a1f
 qTRa7keeTPtp1GGGOXHQM8N0eQoLXj7ea7UHeT88fG/iZdc4Xg9jPafY821hsfF0XHEy
 zJoRgyRZjzvJpPyk/BgrDPkinijKPpOc1RW0z0SVAEEADPXcaVQInavPQMoLhiRkc7Qu
 2Crt2OFfk1vkgIzdYsOgdea//NZRgRHX6lwxGlINBvHBd7IctLjbcdlueThFG4D5/uMU
 o+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pmfsIHbJLueJ35bgeNRJJDeDJTrJmP4/XqfMWtgXDDU=;
 b=xYoQVK0vvzK1Jda341a6QYsrY2O/yoD3KJXBUQXH+kr1MOvCtsAuPcCPPo+x/Jak8m
 hwCChm7FnLqD5lr5JX+7LMax5PoVhVnPagJ8h+bJdcBmOTlTE2Yw2K67amqYMTL67CEu
 S5OYrW0dgAUlq+wv3IjyD234+mQ/M92whXLUAsLnmsfp7q7q4Wog46QJGPKMpJJAhYGV
 2hMnxeGQFi2v+9tzd9k0GV3utnlChl4+nMpsthVjhnSdNK394rv+hgKjpc+2mMgHRsty
 K6id/Il2iUv4DF1/QK1HSmtrIDimyUMPWW61pZYzSMhU4GhXr239Q/8tyzAyk9JFyb4U
 KZ8g==
X-Gm-Message-State: AOAM533DqAXYJK9BfmIbe1ZjyruZ0pWOZJ7nLvjb3v5qBHKAGtloZPK/
 ZIDNIUJxX+ZEa2hIbvY2PpRFWB83bIF3vI0JPkc=
X-Google-Smtp-Source: ABdhPJwgrDSEMVCmTZL7/2CDNe+hDmsyDMJ6mbkGGNi7nbYA9oDjQdMYkNNbKIpX/huxznQlvqJnWRbR8UjgvHonpTk=
X-Received: by 2002:a17:907:7b9f:b0:6f4:d8c5:392c with SMTP id
 ne31-20020a1709077b9f00b006f4d8c5392cmr14484077ejc.652.1652699928032; Mon, 16
 May 2022 04:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <1652688372-10274-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1652688372-10274-1-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 16 May 2022 08:18:38 -0300
Message-ID: <CAOMZO5DB9xNfdqffk6k8vLaC6efvGPtUx7NaA5AF1BYL37yaOw@mail.gmail.com>
Subject: Re: [PATCH 0/3] ASoC: fsl_sai: Add support for i.MX8MM, MP, ULP
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
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

Hi Shengjiu,

On Mon, May 16, 2022 at 5:18 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> ASoC: fsl_sai: Add support for i.MX8MM, MP, ULP platforms
>
> Shengjiu Wang (3):
>   ASoC: fsl_sai: Add support for i.MX8MM
>   ASoC: fsl_sai: Add support for i.MX8M Plus
>   ASoC: fsl_sai: Add support for i.MX8ULP

For the series:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
