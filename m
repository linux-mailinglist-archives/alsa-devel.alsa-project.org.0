Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1A8597EF5
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 09:06:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E3251638;
	Thu, 18 Aug 2022 09:06:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E3251638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660806416;
	bh=a+e+QGhn5sn3V7lUKOzpCWb+9pj3d5N7fTGM2cOhh+s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b3At/bC0j4Eeu5YlSO36dHpX46DjPfePq63TrkY8z3gZyHvyaMaEscLhAkI66HeMh
	 cp7ESgBrVTSvK9jxBnGhs5ieTjhlZvccYJYprt/mFaw1E5HOJG0HlgU5kqdYa7yGSo
	 5XXjgk7LKPMQZ+NNKBVO32qOG005ZzRejiwhfT2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C12DF804CF;
	Thu, 18 Aug 2022 09:05:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45205F800E9; Thu, 18 Aug 2022 09:05:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9EAAF800E9;
 Thu, 18 Aug 2022 09:05:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9EAAF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QODEiGDu"
Received: by mail-vs1-xe33.google.com with SMTP id o123so646813vsc.3;
 Thu, 18 Aug 2022 00:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=a+e+QGhn5sn3V7lUKOzpCWb+9pj3d5N7fTGM2cOhh+s=;
 b=QODEiGDu9p0FTrpyiABxU991BdJBWJE6MEs4yngJOvDM8mFSLvsM1NWLXQOHJiDQIZ
 3IyrYORBDWFDHi3WTZpY1mWH7s31gyxzupk4GHE5zgS0MnB6XJMBrhdY1MNEShjopoWv
 qRKOhLYKc2vvZoPXu+dCCJTIsboWwEmH0S2kAi6Ml6+7JitFCXniYbLO3TGc87lxen0k
 4ieh81NWgCDJ5rg7PxDrRmwB9TC+iiZsycaF2an30reNzWoV2GdDyNgkvo0a9x3bWQZ1
 9Eqgz3vLAIWcfMkrAW7U04NiZ9ao9R1ZDKc5PbA8cnFU9rjMzY4+lfmyTkuOoQ9mcZsD
 5q7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=a+e+QGhn5sn3V7lUKOzpCWb+9pj3d5N7fTGM2cOhh+s=;
 b=ya1NyHZXaJd8GDxG3n8kY90siXDf7FEC+Kf5LjlC9yAx8nCPA5M3j+ln1MuwbjiMvb
 AHWBxD/N+6SpR0D9t0FR8F8pDVnlBgrZQb9yQrsWh/qJAwEfU8VVJC6gvkDsuyG+iUdd
 x7tA6kSFYqk+jc1g1NfNjNSGHc4WALfVTVSHUaRE3lJclrz/mkxNwm0YxPzGfacNaBDi
 jg5HqrWbak3rvsfRGukNauyreFD6Idtauifhxa3XAS+vUbqYjp11JyJ81bECSpY396hD
 1jFDtuZkurBH7IAVVUk6nv7jeCt6lhqndkHDa9pjcaG2zI+6hoYQ+PlkkeUlCJpwhyYS
 ez7A==
X-Gm-Message-State: ACgBeo3lnGnQ531amIQSDPZhpjujI83vna2NeuwSgMPRQdXb59Meuu2j
 GhwpF1sAbu6Jy/IdKKWkczeI+6TfItn6pU7fh/g=
X-Google-Smtp-Source: AA6agR7cE2a2nGxJ/dDd1AfoOz28N0RchW4jLMnj1h1J1ZEbueTzietm5V7RSX4C/+cS+pEWw0zzGxbAmu1XKGsWLpU=
X-Received: by 2002:a67:c014:0:b0:388:daaf:5029 with SMTP id
 v20-20020a67c014000000b00388daaf5029mr660423vsi.65.1660806349462; Thu, 18 Aug
 2022 00:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <1660787634-28550-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1660787634-28550-1-git-send-email-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 18 Aug 2022 10:05:33 +0300
Message-ID: <CAEnQRZA=df7xMGvDLD-vcz16hdQBWq2u2xWD=Mo5054wQNrmEw@mail.gmail.com>
Subject: Re: [Sound-open-firmware] [RESEND PATCH v2 1/2] dt-bindings: dsp:
 fsl: Add SOF compatile string for i.MX8ULP
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 tiwai@suse.com, krzysztof.kozlowski+dt@linaro.org, festevam@gmail.com,
 sound-open-firmware@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 shengjiu.wang@gmail.com, ranjani.sridharan@linux.intel.com, linux-imx@nxp.com,
 devicetree@vger.kernel.org, s.hauer@pengutronix.de,
 peter.ujfalusi@linux.intel.com, robh+dt@kernel.org, daniel.baluta@nxp.com,
 linux-arm-kernel@lists.infradead.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 kernel@pengutronix.de, shawnguo@kernel.org
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

On Thu, Aug 18, 2022 at 5:12 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> Add SOF compatile string "fsl,imx8ulp-dsp" for supporting DSP
> device on i.MX8ULP platform.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
