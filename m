Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A47474249E
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 13:01:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8068D7F8;
	Thu, 29 Jun 2023 13:00:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8068D7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688036491;
	bh=SNuvCv0VFWJ1T/BA1jgFsWK/sbewukgBLN8NThITlGY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o5a5d+0NHP8Mw616cghbWVwqHLb59jxHaOGmgc3QJ9Ep3/ayUlzVLK6IuyEboKrE0
	 Bm0Ln5B4c5+Di72goQXmB2RkV33zVqqIPz98UXf8TsxhBror+d/Bw0ehKopC28/pyT
	 AFyhYN5PDGkQxo7TBiNrabtsqsy/lriR9xRqpwy4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25425F80212; Thu, 29 Jun 2023 13:00:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68E72F80212;
	Thu, 29 Jun 2023 13:00:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEA18F80246; Thu, 29 Jun 2023 13:00:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3AE8F80169
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 13:00:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3AE8F80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=IJJG70VR
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-66d6a9851f3so144183b3a.0
        for <alsa-devel@alsa-project.org>;
 Thu, 29 Jun 2023 04:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688036403; x=1690628403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNuvCv0VFWJ1T/BA1jgFsWK/sbewukgBLN8NThITlGY=;
        b=IJJG70VRTfv6SzZDiw5KgcGaeym0vz6jCVdSX8aL1AtgKYxIKxEz+FbieZyrRKMKt6
         XCNCfb6e0kP4qrLVYCOdleUjQ0iPjzq7WtSDVVd1E/SnYE0lqHji5iXyEH54McdjI3Q6
         aGP09g3gRxxOG3bTuanQqLSGUYvKcsHm5AbgJBGY2+BeZSDjm6FHWKrH5NokTFFFcK4n
         5M0DelgYVruwm87q4YsvLXl0PCpvA7mJRxPfLrw0EJJgh1S2hE6eMETfer+m2znDNGz+
         rx7t9Pn79B0zCEhWoBBcJnDez2ncEfQAzyDnYf6kYmZsBkPiLUqjN+/nFgPhNsy3lsLQ
         N82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688036403; x=1690628403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNuvCv0VFWJ1T/BA1jgFsWK/sbewukgBLN8NThITlGY=;
        b=OXexyYPzyehLMgpfWyMZOiew2DgXRPoWAvHse1D47rpXFi69yHqjD+QSSfOzcrYAlz
         OsaLHzxFc93JiZX3yQRE91QLVtHbwHeIUHx164qCo3XffSttxTH3XJYn6hm2QbSH8zds
         j2oYUoQW+fKg7/vaKor4/dfKk/Iqn0y66LgNHB9Nyi24i6TxESsfpL7BfCeYr5xagBAU
         GwQdZ7vE1dWJrw+Cl7u41Ao+6nQQf4Fd+9QIu+O+1on6uQLF6h9/ulgKQ0RvjBOWMM6c
         92gjErIevIlOxwxxhXWmhzbCtxX9McZR9ifYx+ZRE6mOSSPcW47vUG93pqfyAdfWVwO+
         RP4Q==
X-Gm-Message-State: AC+VfDy5uxfSnct8MYHF8CovyoB6uss5tcKnuxeLYY3lpjBSCxdcgOKi
	ZiUvHa68/g3Hf0vd+YzV9EEqUoQizXlZR9Pv6qE=
X-Google-Smtp-Source: 
 ACHHUZ4241Q0Xok00mtSesZ0ScAf8EpY8gqClpDPFmqvjMGqm+Sl0vzMI5IyImuqQIvVL0JNHSy7d4g+Mx22zwDE2r4=
X-Received: by 2002:a05:6a20:7295:b0:111:fba0:bd3b with SMTP id
 o21-20020a056a20729500b00111fba0bd3bmr45440823pzk.1.1688036403198; Thu, 29
 Jun 2023 04:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
 <1688002673-28493-4-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1688002673-28493-4-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 29 Jun 2023 07:59:53 -0300
Message-ID: 
 <CAOMZO5DPHmm7YuHBfYHpx2-g4R6t1BQ93GBAZvyyb_rBz7+hFg@mail.gmail.com>
Subject: Re: [PATCH 3/6] ASoC: fsl_easrc: define functions for memory to
 memory usage
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: WWZ4ZYWUUFCAHQ3542EECMB7QEFNZIJJ
X-Message-ID-Hash: WWZ4ZYWUUFCAHQ3542EECMB7QEFNZIJJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WWZ4ZYWUUFCAHQ3542EECMB7QEFNZIJJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Shengjiu,

On Wed, Jun 28, 2023 at 11:10=E2=80=AFPM Shengjiu Wang <shengjiu.wang@nxp.c=
om> wrote:
>
> ASRC can be used on memory to memory case, define several
> functions for m2m usage and export them as function pointer.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Could you please explain what is the benefit of using M2M in the EASRC driv=
er?

A few weeks ago, an imx8mn user reported that the EASRC with the
mainline kernel introduces huge delays.

Does M2M help with this aspect?

Thanks
