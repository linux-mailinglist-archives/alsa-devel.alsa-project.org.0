Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DA8749A3D
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 13:09:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0340A7F1;
	Thu,  6 Jul 2023 13:08:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0340A7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688641756;
	bh=l6f7CvrBk+NT4XhMNt6CDGtlibYEUppIoPuK5XJa5tk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mA/vNItfy0Oo7SbVuPiLxLPYCUvNfyqHTVpAVNULlspHFDkQsfsyoe7SnF2yDZosW
	 vsrZHj/B8HVqZmyst99PhgtU/RSYFuIOftHN4iwwVjuGv81jXL9VvHYAsEiB3XoUE/
	 G5KHwEf/3OkO/k5/kO18+bUlSTZUbXuCSkb5cEBg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6EC0F80272; Thu,  6 Jul 2023 13:08:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49967F80125;
	Thu,  6 Jul 2023 13:08:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D90ACF80132; Thu,  6 Jul 2023 13:08:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C0F8F800E4
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 13:08:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C0F8F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=lpWMMMk4
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5344d45bfb0so24509a12.1
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jul 2023 04:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688641691; x=1691233691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G84Dw5Ig2Kfn04ePqxCMIByfKhRpoEBfGjJKCC/CPmY=;
        b=lpWMMMk4+M0UTvc4sZgFla6gp1hZlkV4OKhMXVYtfsGRR5RgjYLg8+nN57lnngqdDr
         roBBzjzs1kupP1nDWffXYGrAJSCQTf0NzR+moyuBLb05NGn+eACyWiSj7VHaR+70lUUj
         FBp+UVssD1OqIRFeOoQEnEaJaYnSqWz+ABco3/EWzVtaZtkc9Y3TuoHzObw1MtKte6qw
         LPt0Pd0oMmqXx8yXG0tsAUaYYL5E1WMWnf4grrV7EshAJjOb3mjlcau7K9mR1lGGB/Oy
         ISDa/m3wtaENvJrpUL6WXLSPEDRhI51vdn050i5eU/m6Xz0p88291mqwWp3J1DuV0SJe
         rh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688641691; x=1691233691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G84Dw5Ig2Kfn04ePqxCMIByfKhRpoEBfGjJKCC/CPmY=;
        b=CjCClCeAHBdAmFo8/YeQ6/KZs+dBa98gExgOOslVRycWQRGNACcidbs1xcAs2eBID1
         D6UU3e92bpjWLwWIihKUUCbRcg8tee6LCNsHPnju8AkO3BkRFDESP/i9DKjlYvG7By4l
         Alx6KZS68uaOGxBvENmQ2aVsMOVBCspBjnXtUGnnc1U1Nxukvtd4waxTeyxRYNAtqHcC
         6NlqLDWiVZPX/hO9K7xHEz5Nvv0XJNxwLTC9+08QiCKogALjXl3A56FwsWCOi7vn7pyS
         siRmE7iJB2ZEq0Mx8eZCUs9D6TVYpwfZ1Lm4P21F9IIBJllib5T3sCEMsDrh1F91jx6B
         bYxA==
X-Gm-Message-State: ABy/qLaLsd/2NC8r9wClAo7ci97CykSCG3XHdhOAR77+w/gWxsuX46a+
	stKjJhesLyXbCuES9ajS+QBm1tHeLuyrboHZKxs=
X-Google-Smtp-Source: 
 APBJJlEfvnVo+6BfRY2TBz2YQulzAtcJkrBgmENQyf9COZhtw1dVjiGfHsnITjVVTZiHpd0YcG9M9aXITp/zezUvGpQ=
X-Received: by 2002:a05:6a00:2d06:b0:66d:d03e:3493 with SMTP id
 fa6-20020a056a002d0600b0066dd03e3493mr1751099pfb.2.1688641691084; Thu, 06 Jul
 2023 04:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <1652963808-14515-1-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5DtpoH0dLDX3=Sv4UUpX_=66VEZPsJUWQNnYviApfMLKQ@mail.gmail.com>
 <20230706084706.bzwsbi3zisx5m5rl@fatal.se>
In-Reply-To: <20230706084706.bzwsbi3zisx5m5rl@fatal.se>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 6 Jul 2023 08:08:00 -0300
Message-ID: 
 <CAOMZO5CCdaodWQrHUQgMizoES=jfEtw-sNJZG-DJMpRD8tZW9g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode
To: Andreas Henriksson <andreas@fatal.se>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	=?UTF-8?Q?Hans_S=C3=B6derlund?= <hans.soderlund@realbit.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: UDG72P5K6YIUAPQZTFDPYYTXIVRSSWS3
X-Message-ID-Hash: UDG72P5K6YIUAPQZTFDPYYTXIVRSSWS3
X-MailFrom: festevam@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UDG72P5K6YIUAPQZTFDPYYTXIVRSSWS3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Andreas,

On Thu, Jul 6, 2023 at 5:47=E2=80=AFAM Andreas Henriksson <andreas@fatal.se=
> wrote:

> We've been working on an i.MX8MP where MCLK needs to be input and found
> that this enables the MCLK as output despite not having set the
> `fsl,sai-mclk-direction-output;` devicetree property in our DT.
> Reverting the patch fixes the issues for us.
>
> I have to say that the code comment made me a bit confused, but once
> I found the commit message I understood why this code existed.
> If this is really i.MX8MM specific maybe mention that in the code
> comment and please make the code actually only trigger on i.MX8MM.
> It seems to me like these all fulfill the current criteria:
> imx7ulp, imx8mq, imx8mm, imx8mp, imx8ulp, imx93
>
> Should I report this in bugzilla.kernel.org ?

Should we do a fix like this?

--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1453,7 +1453,7 @@ static int fsl_sai_probe(struct platform_device *pdev=
)

        /* Select MCLK direction */
        if (sai->mclk_direction_output &&
-           sai->soc_data->max_register >=3D FSL_SAI_MCTL) {
+           sai->soc_data->max_register >=3D FSL_SAI_MCTL &&
sai->mclk_direction_output) {
                regmap_update_bits(sai->regmap, FSL_SAI_MCTL,
                                   FSL_SAI_MCTL_MCLK_EN, FSL_SAI_MCTL_MCLK_=
EN);
        }
