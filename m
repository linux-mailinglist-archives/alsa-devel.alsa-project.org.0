Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 457A9565387
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 13:32:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C844C1725;
	Mon,  4 Jul 2022 13:31:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C844C1725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656934333;
	bh=36uDmK9PH0G8yS6UHFkRmA+PvoilvFykC3HZFSJl2GU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PvtKhHaSAgu9DPM+cEZkl2bWm0g4R3LxJU2pA3bC0zx0vh9aTDbgCz2gP/sM4Dk/v
	 3wd5i/n55z41RlMjM9IS17DBFXV/FG2pm05ItOMMPr2tFStP9Lh6CP4z2JlfvAnbBd
	 xZJx4nRBDcB9zAj8fBdcQ7Lz2TDE8is6edqLqmSA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EDFBF80602;
	Mon,  4 Jul 2022 13:23:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA1E2F80155; Sat,  2 Jul 2022 00:17:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20D61F8014E
 for <alsa-devel@alsa-project.org>; Sat,  2 Jul 2022 00:17:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20D61F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XN2WyF1Q"
Received: by mail-pf1-x431.google.com with SMTP id 128so3628383pfv.12
 for <alsa-devel@alsa-project.org>; Fri, 01 Jul 2022 15:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UgWJcwbsoftLUVFHLbhy6IyGKEbqgVdqVlFZm5JpsLw=;
 b=XN2WyF1QwopFqoEpu5tYQbVBW3Vk+1+wgZIlae/RmcP9K2H902xi3WU51XrcOPSAjp
 tgJCd7ZHKLWVXKHKXUhPR1qsPOX+pDMhAnXnG0BVkEw/3XGiGzVC+MSkZ4DeK/FS7QPZ
 9laKFtESlOlMHPBlzE86AQ08nWxQHoQUVohGOGk235AxQAeGwnh3weyMkKRQP2KeB6PB
 u7Mc4EWz71cbLV/Eo15AZMKfHMAce4AdQZn4iZ6noOJqVh13zSXsNvlC74Kz8yIjNSsz
 LDOVQLlIQAc4YjWR4t3T2jLeGru/KZBfNmHZsCIQSq0UDxvBZ2ZpXOprOFDxrhq43zW/
 ecTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UgWJcwbsoftLUVFHLbhy6IyGKEbqgVdqVlFZm5JpsLw=;
 b=CbGFXzFdqq/MYPzmO001wxa+qD/DHELLG6kHvd6Vu5aIqyhp/JWQkqvyzMv9rtpjdt
 XLXiD+vxxvFy5MtHK0yQ0XPNF8tetYH2Un6+BDEgh2hXe85d1DA2NGcFuMA+u61ztqgU
 qKBD9Iz77JAqCoCSQ1Lcgxj54ewWoC8K+EWe29conOwSNMGSyl+BEO11aycagWN0LUgn
 iI+GPpRuIdz3EsNtAaO1BLjOwg24ONpiuxaQUd4teKioMbdqHbXUoOzo2JyTwIAbO+zl
 pHKuEkZZlcaC/ATi6zQ+zNZYduG46WX0glMohJCZDdl0F7Sec4PzYb5SlQ+0aU7bS0Xs
 sYew==
X-Gm-Message-State: AJIora9feKzjrRZ7+wToIRUw4bgwd5xCBNs0xR8XoiZDKBcZJl6D6pUc
 ySbgTFGNSSvFtnBe64o04g5Yd6V9yf5Od4kgs6A=
X-Google-Smtp-Source: AGRyM1sSwwGtes7c8gkcSPhj3drf8sd+x0cQprxMXHoHTCU4CMwoUm33CQymd8nSzPsQynoaf5uqmufpVkBqWxGBiC8=
X-Received: by 2002:a05:6a00:1141:b0:528:2479:cc23 with SMTP id
 b1-20020a056a00114100b005282479cc23mr7638800pfm.27.1656713870620; Fri, 01 Jul
 2022 15:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <CADs9LoPZH_D+eJ9qjTxSLE5jGyhKsjMN7g2NighZ16biVxsyKw@mail.gmail.com>
 <15259e38-eccf-d294-a330-a48b5bbbdedf@linux.intel.com>
 <CADs9LoN-L0X1Dr1sP2K7xrcWm7dpHW6MhF47c2eBB0moLNnPRQ@mail.gmail.com>
 <18d3e724-e43f-c166-e322-26cc5e3890b7@linux.intel.com>
 <CADs9LoOZjK=cUuNSEELtgxYoA+yHVFKM_Y9YLcY74smqx8XsjQ@mail.gmail.com>
 <c554b69c-0c73-158d-85d8-95a0375babeb@linux.intel.com>
 <CADs9LoOOOXVC0p8R=b1y+Kfb1+ESEyMaVe9eoW=F5gdp0_GitQ@mail.gmail.com>
 <c4d32547-5f99-595e-21d3-fdb22a1af237@linux.intel.com>
In-Reply-To: <c4d32547-5f99-595e-21d3-fdb22a1af237@linux.intel.com>
From: Alex Natalsson <harmoniesworlds@gmail.com>
Date: Sat, 2 Jul 2022 01:17:38 +0300
Message-ID: <CADs9LoNMuwbiSfgF1buDoY6=ecpR-BuZvTgXbFxe3qyL1=roUQ@mail.gmail.com>
Subject: Re: Sound not working after commit
 bbf7d3b1c4f40eb02dd1dffb500ba00b0bff0303 on Amlogic A311D device
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 04 Jul 2022 13:23:02 +0200
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

> +       if (!fe_substream) {
> +               dev_err(fe->dev, "%s: fe_substream not initialized\n",
> __func__);
> +               return -EINVAL;
> +       }
> +       if (!be_substream) {
> +               dev_err(be->dev, "%s: be_substream not initialized\n",
> __func__);
> +               return -EINVAL;
> +       }
> +

Good) USB-audio is working)
May be and A311D internal sound card probably to repear too?))
Big Thanks!
