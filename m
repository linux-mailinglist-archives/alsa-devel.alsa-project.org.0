Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6B8505E76
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Apr 2022 21:21:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A36716CC;
	Mon, 18 Apr 2022 21:20:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A36716CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650309706;
	bh=cV6+6Ey7LaeWZPNbriTRkorx1rxnHKeq4jFNbHhfmco=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nrQbQGn9NWi9eRp11Jsi1OXsgH72nSxQX34cwbrmMZIdEK7hOkKLcyiJ7o2dMNjT4
	 LvexzjycjnD0wL4s8ne1sHjOZF0bZaVrR7D+RkwJ/yK+itD43eruOXWCYiCRfbkIVj
	 MaM37biMcP9dHN6SeLXzzemzzSLas3t4rMN2ln/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D66CAF80311;
	Mon, 18 Apr 2022 21:20:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA926F8014E; Mon, 18 Apr 2022 21:20:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DBE4F800D8
 for <alsa-devel@alsa-project.org>; Mon, 18 Apr 2022 21:20:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DBE4F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="RfDcx726"
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-e5bdd14b59so5662243fac.11
 for <alsa-devel@alsa-project.org>; Mon, 18 Apr 2022 12:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=cV6+6Ey7LaeWZPNbriTRkorx1rxnHKeq4jFNbHhfmco=;
 b=RfDcx726fSOkgilqjNNFdffOGia7ENNZq4jw6/IpNvYS2X96nsaU6+CizR0R0lVpip
 8XykJfQitz8Tf+qkrUP2a8h38iE5MNquXTF+M+ZfjDZxGruX0RF3tzwfYMTFDUujup9v
 vn+q0L54b59gb0Tdjc5oAILmSZnZrXXSh+Oi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=cV6+6Ey7LaeWZPNbriTRkorx1rxnHKeq4jFNbHhfmco=;
 b=7W9jIGBORjP82h6aBCX6W/sYVoxt6gLho588pNqg9i/JBuOPRz6JkIIoO0B08e49/U
 yK04OHbkww3GBlkwjOUwP0PzfNa3Wi8yLH/dtPcMC9HXYV9Vtup6OQohw7kVP8UbDRlm
 avtzBkjgCH/NmV2WCMAf73pDzKOkmFik2ItQoh7SeJSCPQrjIH3ZeUy1DFBwB+eSUrNA
 sfSmvlF7fHJTLuYKK65WxVpB9P7gez9rFcEG94VmHb2T+rhLgRvNXtGoSr3oLIVPlfTP
 vBtPc2h0lbv/bicNGNALAU21dQzkG43b5ob+LwCnn9SNlvbLeyDeRpmLaWO3EpS4gXhl
 f6DQ==
X-Gm-Message-State: AOAM531LiOrt/jTcyzDyBiltPO0pQ5kQ0Qp35QD45ZQ0RIuceKAMvaEG
 ISm+nxoO1XtIHtqZfaYdeF/X8EviwfsDU/S4X0bfmQ==
X-Google-Smtp-Source: ABdhPJzNf95/lk0150+WJSd18uvW1W5pdHmDXYK3zhdw8hZZpUZtdsFX7flLJWCbzkVJnlE9bwIuyJ0EGf7AjX1fhe8=
X-Received: by 2002:a05:6870:3907:b0:e5:a6fd:4047 with SMTP id
 b7-20020a056870390700b000e5a6fd4047mr4742504oap.193.1650309637020; Mon, 18
 Apr 2022 12:20:37 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 Apr 2022 12:20:36 -0700
MIME-Version: 1.0
In-Reply-To: <1650285427-19752-8-git-send-email-quic_srivasam@quicinc.com>
References: <1650285427-19752-1-git-send-email-quic_srivasam@quicinc.com>
 <1650285427-19752-8-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 18 Apr 2022 12:20:36 -0700
Message-ID: <CAE-0n523c+X__wJwy=7e7WXGY3Crimne1-yUHM3Txf81n+bBVA@mail.gmail.com>
Subject: Re: [PATCH v13 7/7] pinctrl: qcom: Update clock voting as optional
To: Linus Walleij <linus.walleij@linaro.org>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 alsa-devel@alsa-project.org, 
 bgoswami@quicinc.com, bjorn.andersson@linaro.org, broonie@kernel.org, 
 devicetree@vger.kernel.org, judyhsiao@chromium.org, lgirdwood@gmail.com, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, quic_plai@quicinc.com, 
 quic_rohkumar@quicinc.com, robh+dt@kernel.org, srinivas.kandagatla@linaro.org, 
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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

Quoting Srinivasa Rao Mandadapu (2022-04-18 05:37:07)
> Update bulk clock voting to optional voting as ADSP bypass platform doesn't
> need macro and decodec clocks, as these macro and dcodec GDSC switches are
> maintained as power domains and operated from lpass clock drivers.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
