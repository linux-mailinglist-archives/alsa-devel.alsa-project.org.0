Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4352554CB30
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jun 2022 16:23:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C5871908;
	Wed, 15 Jun 2022 16:23:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C5871908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655303037;
	bh=+cDSM19XhnVItQmXe2GXVbX8IiIZwrvghbIjLeWagA4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AKIdfqxIEWZbcsxxfk5JcPbnKwcP5RvtoX5Mt9KBv/IDg07ADACS22S9fFhy0PizE
	 pAXod2+eEk8IboaIo66rM1/KH/YCSReQjZHz4nsVC7UmEbv11+dHgsCTQOFrAv9aAq
	 n6MZkE+HSE+T9Hw77VsNsWLCsSNZ7AgYIvvfKWdo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF209F8016C;
	Wed, 15 Jun 2022 16:22:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63515F80162; Wed, 15 Jun 2022 16:22:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A293F800B9
 for <alsa-devel@alsa-project.org>; Wed, 15 Jun 2022 16:22:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A293F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="T/uAnd4N"
Received: by mail-ej1-x62a.google.com with SMTP id bg6so23699344ejb.0
 for <alsa-devel@alsa-project.org>; Wed, 15 Jun 2022 07:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+cDSM19XhnVItQmXe2GXVbX8IiIZwrvghbIjLeWagA4=;
 b=T/uAnd4NRj5HaHVJL/NGW4xzIHjJ88SjHm1ylY4aca+8D6wfooiNh1pXFcmjxgVI5z
 oxoPES4Ga1RtHrg8cGHFuHkSH2f+OhwSwGTCIdhsCCYLUsxNmdilDkXJBny9cRAXwPZM
 bj8r9HZgGjAb5+5ooOWAC5V7AY+rgW6aZYN3JDn47Ts9R2AcZjZ3lDBwe9qmz0FuX73b
 Jfcp3Lz9OOReArTRl64Lor4pK9Gl2b8EG10faardk619owy9Pnf2EMV3tb3R3xjJeKiM
 R/q+Fh8c24KmtesrDZVl0JNopM0eMSrF15SULsMSyCvI4x6xfOthaOBHNdHq8n4QMJq9
 RjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+cDSM19XhnVItQmXe2GXVbX8IiIZwrvghbIjLeWagA4=;
 b=ov93i7r3RHkMN5WIuJ16TEFX1NEgveFS0f70k+MTW9Tk8SdFUImSwS6etix5lx/bcV
 SAIE7gQoaHOwROuyPuc5LKRJvkjjOlkeTI1Vlj4nfmSrDoW9FBZ/Iw4wlbbufYdhBurZ
 1wuF11psMWoev02EohmARvbx1U8/XLUyvpL4GkURgk+2CAgsB5UOWWOmvo4OwSjkUZ7V
 t1BULcWFMowzDP0putk+cYB2YEtIY1xwSooHWS385jArTJiSSqqrB8pr3kVVZ21xai0w
 h6slptya4l4KXXI02FPaOUD3NHrOnfNvkK7ecRdRqWfPf4UpSqmuMQJzBQdGbucGC8Ss
 kH7g==
X-Gm-Message-State: AJIora8lnu77MD9F+2krr+9aQICOSFxEvxChAHTPEjTa0NifPEPxwUWo
 XVJ1OgkL9l/1VTqFjfpMtq3mOD2Ye9mzzs5W0sQ=
X-Google-Smtp-Source: AGRyM1tK+gakBdNkEl/BCl5Wp6p+/qyTwlR5zO3bm+xtxartwOdF0AEvujrW1NR3rivDizKoWarT6AlmcqwpahefijQ=
X-Received: by 2002:a17:907:2d8d:b0:711:d1bd:d738 with SMTP id
 gt13-20020a1709072d8d00b00711d1bdd738mr70128ejc.658.1655302966907; Wed, 15
 Jun 2022 07:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <1655179884-12278-1-git-send-email-shengjiu.wang@nxp.com>
 <1655179884-12278-6-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1655179884-12278-6-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 15 Jun 2022 11:22:38 -0300
Message-ID: <CAOMZO5BRVBawK2PRvTazkQf-wExOuni9qD76Ha3FYmZZQyPRsg@mail.gmail.com>
Subject: Re: [PATCH 5/7] ASoC: fsl_sai: Move res variable to be global
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
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

On Tue, Jun 14, 2022 at 1:25 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> The resource info need to be accessed by hw_params()
> function for multi fifo case, the start address may
> be not the FIFO0. So move it to be global first.

Actually, it is not global. It is being added as a member of struct fsl_sai.

Please rephrase the Subject to:

ASoC: fsl_sai: Make res a member of struct fsl_sai

and then in the commit log:

"So move it to be a member of struct fsl_sai."
