Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5070F9A23C3
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2024 15:25:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9820A206;
	Thu, 17 Oct 2024 15:24:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9820A206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729171500;
	bh=Gz6h/cWpfDus+Fv6R8OuQ6KhEA0lGGLgJfyu+vZc1Ng=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XtX+2gVqgjqwJDA7xubG/ChOPue7ohKx0FERUre3MyodqW7vRByedk5jG2KdmTlcX
	 ZdMXyT2wGZecagFTGaS5kwINrFloPDqDJvYM1udTnmFApix7MZAaWV7zYTNEyBCVZk
	 MrRCrtdoJDJ2m4gIsMLOL2ZOLsuaYq206L0Rzjis=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C012EF805B5; Thu, 17 Oct 2024 15:24:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F33B3F805B0;
	Thu, 17 Oct 2024 15:24:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 029E1F80448; Thu, 17 Oct 2024 15:24:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21F60F80149
	for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2024 15:24:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21F60F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bol/0MVA
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2fb5fa911aaso14896821fa.2
        for <alsa-devel@alsa-project.org>;
 Thu, 17 Oct 2024 06:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729171461; x=1729776261;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gz6h/cWpfDus+Fv6R8OuQ6KhEA0lGGLgJfyu+vZc1Ng=;
        b=bol/0MVArLttH0t36eD8vgobPYtuFK3ihbBqkQ+iRC86/03qCTdmaZdAQyVxIfeWzq
         R+WiFACCLpr6Xn3BkmxXtcn3rQ0DNKnWXToCAcpBkh4sDCv8CcdGr+CcMFi/qL5uNPS+
         k7mpbiH16vqJhlUdecF72YPLZ0UAXFOq5hwmKOxdeAFLV30O+WXkpwqYOhHDdbvuDlLV
         E1Sec9kbpwFtU53Shhg+PMkknrhlXluRDu71hSZZyol8I/ODCGES7CDxWYoy1eW+sQRg
         uBzU9SId7gi83PpuXaqwLV6y5RcaFf772h/4THUacIF4EERRWki4thMilZlhF1NXY0qv
         IyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729171461; x=1729776261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gz6h/cWpfDus+Fv6R8OuQ6KhEA0lGGLgJfyu+vZc1Ng=;
        b=BMCFyFu3ljUf9ODcYK4JincL1p83dvN8qECIWrRduXzETiF/hhXjPyG/X4qldlBCFO
         Syj9Zi7qnIEpD2S4irgOXEmi9GNZ1ZCdi5LVvCNumRVX/PGNsJcS1GP6WYToBAlynm+Q
         ry/BJGimML+sSN7aEizPsC+Qzt/dzmrTxkEbWII6mvlhVeoleQPbBzM6TzL9AyOmcA34
         HCYx7/LvEg0NX2EzyXlHtHCcfvSE9k5xNyRuMDBGt8iwFb1krn3p/QWs70vyVb9RNzz7
         IDbdwucOT9N3ScDVAPumiF0Y5Fr1mfa9ik1G2D9UXeA8bTDJlV0fMx5rVAztDmHCAF2l
         i/gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAT99SGyiOKvs+bqBVh0/TsRMf5SNy41ktfSildctJTV8CItkMN+sqyC753n5zm2cGRMk4YWN0/IgG@alsa-project.org
X-Gm-Message-State: AOJu0Yxy1G/pqK284WyMCJoDijp1Bpm+pGfBuRMW0uaBbCIawc2nvsK1
	9mvlqvmlLBrAaNzGLXfKvRy4O5xRa/Ql9iSkmpCid1HPFYhRYlEfEFqRO/IZO+tYJr3Gfe6T9kO
	cjzUBwwm05hT58AHmKgt60UbFu/Y=
X-Google-Smtp-Source: 
 AGHT+IFD5qDdg80DA9mBb/Ba6kch83UqlhH3993pbPsJRFaEwYd7KQ9tdLLC5IVGXX1NzhH891rsRl8NvWZZ4Ml9Hqk=
X-Received: by 2002:a05:651c:1987:b0:2fb:4f8e:efd with SMTP id
 38308e7fff4ca-2fb4f8e10ebmr126203261fa.32.1729171460504; Thu, 17 Oct 2024
 06:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20241017071507.2577786-1-chancel.liu@nxp.com>
In-Reply-To: <20241017071507.2577786-1-chancel.liu@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 17 Oct 2024 16:25:18 +0300
Message-ID: 
 <CAEnQRZABGsL7rL+qrwNhyaYDX22D6M2fg=4RKRRRcOAXS9yKxg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_micfil: Add a flag to distinguish with
 different volume control types
To: Chancel Liu <chancel.liu@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: HTV6SI2BWMHXKFA3JBBS7V75IPA7TEJ4
X-Message-ID-Hash: HTV6SI2BWMHXKFA3JBBS7V75IPA7TEJ4
X-MailFrom: daniel.baluta@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HTV6SI2BWMHXKFA3JBBS7V75IPA7TEJ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Oct 17, 2024 at 10:15=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> =
wrote:
>
> On i.MX8MM the register of volume control has positive and negative
> values. It is different from other platforms like i.MX8MP and i.MX93
> which only have positive values. Add a volume_sx flag to use SX_TLV
> volume control for this kind of platform. Use common TLV volume control
> for other platforms.
>
> Fixes: cdfa92eb90f5 ("ASoC: fsl_micfil: Correct the number of steps on SX=
 controls")
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
