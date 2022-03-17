Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3865F4DC44A
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 11:52:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9D911943;
	Thu, 17 Mar 2022 11:51:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9D911943
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647514328;
	bh=KZmBzh0g7fh31Uux2XaPjJ672KEz3K8+xbFDHdajcWo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CGJwXYQWrio0LrHmdWPWNzsfnV3DjbOsj6dex05wHUJs7aJWHr8DzWdX3PhNnAYNL
	 Ax5kojABDMldSZW9cZIx0Up5D5A0nJ5hBnmN663O5GDHYwQszneNGdGtHYVIQh4a74
	 Yfd+7kKPzRWQrrT7HqI2l1h0IrtWvFGzwkIYdqMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3577DF8014C;
	Thu, 17 Mar 2022 11:51:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D49CF80125; Thu, 17 Mar 2022 11:51:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 749DAF80125
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 11:50:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 749DAF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dVE5pNc2"
Received: by mail-ej1-x635.google.com with SMTP id r13so9826562ejd.5
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 03:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KZmBzh0g7fh31Uux2XaPjJ672KEz3K8+xbFDHdajcWo=;
 b=dVE5pNc2uLKjdR6Hn4y4VHcCXBIgSt7AwoR19xYnhW+IX051fUoTEK/2DhvTC7mm7H
 91NGgNDnqvBXVnQA9eVQjCUqecf8qGXZkdntTB/JrKBQZMPO+UIZ0tS5pHGGueb3ItEM
 nGBhhrgATc1/h/pgpMgzNiifnJdVHF1Gadc87Boa6BE8ayhd/iiuxXZi4Tz/kznk+X2I
 fnagAYdL1HNAU+AHRjwWZ2Ow1vy7cCtAB99MqQrJi3+/yF4TSXreHyP3IGyPJTJLz93r
 0S8FWY1gHwd7yD2g9MwE6F6vVOCWeMYUfngcA/oKTSX3XBvuAbqz86zuT6BYWda6erWL
 aSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KZmBzh0g7fh31Uux2XaPjJ672KEz3K8+xbFDHdajcWo=;
 b=Qrcllpue4Kn4/NSKMwPoGvZIseqOTNzww8XrwD2bMRLpKMKzUlaegXe5b5upJdpp5u
 ivNZVMG/T4m2PHOz/BDPZl8KcuIBmOOh/O/qvhYdzUlCtS6ik0/9uOVVPHqHVZAtPtbP
 9U2iQW2m3dcAWEqwx3osYfvPueyYo0Lmwr1a0nr6uGUZdcMHrltINhNK35AbQt2fnqiQ
 jXKc/pIOfUxAEPi5li4ky1wibSFh7vC2zIYc+daT2h9RE7a9E17OkPCIz3HqMoc/QNZY
 hmNsVi/jxTzmJ1cDup796dUVUNstJpH5B+JMckOi2vkBZepmJnlOd1ntlDT7nubZTRiW
 th+g==
X-Gm-Message-State: AOAM532MxYpVNnGScoStbEsA8+J3MRd4zX5tToN1pEJLLI5y6EKUylI2
 Lsc0k8mPeTzFO4o2WsEPtIVHeeQbYAujsLRkr+E=
X-Google-Smtp-Source: ABdhPJz1dLjFVr15ZSB8rE/IA7xtmuIxUdcKJlREUgs294eudErB0vgAC4mFOs9FDwPmeTg8gweiWh1Df8EZLXt9WZE=
X-Received: by 2002:a17:906:d554:b0:6df:a6f8:799a with SMTP id
 cr20-20020a170906d55400b006dfa6f8799amr437899ejc.492.1647514254256; Thu, 17
 Mar 2022 03:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220317041806.28230-1-nicoleotsuka@gmail.com>
In-Reply-To: <20220317041806.28230-1-nicoleotsuka@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 17 Mar 2022 07:50:42 -0300
Message-ID: <CAOMZO5AzRY_tk_9NbMCCuO8vYOJnVwWfQWwURsWyU9u0L__Z2w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Shengjiu to maintainer list of
 sound/soc/fsl
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
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

Hi Nicolin,

On Thu, Mar 17, 2022 at 1:18 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> Shengjiu has been actively working on latest FSL platforms and
> keeping upstream effort as well, while I have been working on
> other subsystem lately and cannot guarantee audio patch review
> in the near term. So replacing with him in the maintainer list.
>
> Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>

Thanks for all your great work:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
