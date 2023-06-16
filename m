Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5096732899
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 09:16:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5EE085D;
	Fri, 16 Jun 2023 09:15:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5EE085D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686899795;
	bh=OaC1nUKdnxfa6K3QRDHYonpcCa70eHiwXnh/es/qfhs=;
	h=From:To:Cc:Subject:References:In-reply-to:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aazmqvLVJSXtP4AtEEZ0MvyyXrsqnSQXOBHceD4tlTfw5qIWXHvUb7UP8Q1ssgC37
	 Euyaeez/GI2QT9ifxuLgNAdxq9qs2ZBF6OkjVAjVlKNf+W6XVTrY2Ge2Nz0D4tOVTi
	 sS2rWpTsD5rDICwojOh/LwpxOToOBpgdRcint4J8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 014ADF80579; Fri, 16 Jun 2023 09:14:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B57A6F80579;
	Fri, 16 Jun 2023 09:14:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C460F80149; Fri, 16 Jun 2023 09:10:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81EE1F80130
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 09:10:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81EE1F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=XJNz+vis
Received: from localhost (unknown
 [IPv6:2a0c:5a83:9106:d00:27a:a702:1397:9647])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rcn)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 044206606F61;
	Fri, 16 Jun 2023 08:10:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686899443;
	bh=OaC1nUKdnxfa6K3QRDHYonpcCa70eHiwXnh/es/qfhs=;
	h=From:To:Cc:Subject:References:In-reply-to:Date:From;
	b=XJNz+vis7E9WaQQYxIJBmj7bz72IwFZpEksccqocNsKW7/KYpg9eyC3MRIVC+kZ7A
	 DyPFv4AIC45g4nR2msp6Ssh2XQ1gl9RecLkdhkrQbKlpQ7VeyPxNNE4h2VsMclujlf
	 0o9P/W2llNpjmjYbmBJKB+mwFc0Thou+gyKgCpA/jZ4+JWhKXqfE3O769mgDJEpN0n
	 3kieBNxZO0v48Hb4iMVFdc8gN0wfgS8wL5FNgwe7nOQv5g6l3pl2Z1j6AHLtz9e6Rg
	 rg2iyujO02hKA1mgzweTd06Fc4cYZsVhrkprCUdnuARHHg62hPag8ptEj6HT/GDhez
	 ZYw04T+FCYFug==
From: Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>, kernel@collabora.com, Jaroslav Kysela
 <perex@perex.cz>, Shuah Khan <shuah@kernel.org>, Takashi Iwai
 <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] kselftest/alsa: Increase kselftest timeout
References: <20221213183242.1908249-1-nfraprado@collabora.com>
 <2ee34e21-44bd-71e7-6da2-f4bea9a35452@linuxfoundation.org>
 <20230515094310.hulpyhhtb4sxxn7i@rcn-XPS-13-9305>
In-reply-to: <20230515094310.hulpyhhtb4sxxn7i@rcn-XPS-13-9305>
Date: Fri, 16 Jun 2023 09:10:39 +0200
Message-ID: 
 <87sfarj30w.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: ricardo.canuelo@collabora.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3SPDKBIKYRKAR75GGLIWL6SMZ6QRV3UP
X-Message-ID-Hash: 3SPDKBIKYRKAR75GGLIWL6SMZ6QRV3UP
X-Mailman-Approved-At: Fri, 16 Jun 2023 07:14:51 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3SPDKBIKYRKAR75GGLIWL6SMZ6QRV3UP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Shuah,

Gentle ping for this

On lun, may 15 2023 at 11:43:10, Ricardo Ca=C3=B1uelo <ricardo.canuelo@coll=
abora.com> wrote:
> Is there a downside to that? There'll be some tests that take more time,
> I don't think that's a problem with the tests or a reason to let them
> timeout. IMO it's the test framework which should adapt to the needs of
> different types of tests, and the solution provided by this patch is
> good enough, it addresses the problem for this particular test suite.
>
> If the solution is still unacceptable, do you have an alternative
> proposal in mind that we can try to implement?

There are some tests failing because of this and we're trying to address
these problems to clean up the regression results.

Thanks,
Ricardo
