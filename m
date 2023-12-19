Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1191818787
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 13:34:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7085BE73;
	Tue, 19 Dec 2023 13:34:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7085BE73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702989267;
	bh=7NKhg5obM+s0oL664mB/5a46QblrPAxXzhShLvnuPYw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aSJgpIvYY/oPfB8g0RW/f0IHcunV0gmNLpT+o9NEobKQpuMZ9t46V7fD5Myh75Gan
	 3wBcaLR671UvXkeK3IbeHDUCWsFMhnwXYW6Vd5bDhCUjqp6cDAAJHPzbqyYZWcLw/a
	 y5x2JtJWzUH9Gv79n9lRbV8T1Mfd1ovhVwdCFq7g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A23CBF80570; Tue, 19 Dec 2023 13:33:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EB87F8057B;
	Tue, 19 Dec 2023 13:33:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CDE6F80425; Tue, 19 Dec 2023 13:33:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3FEDEF8016E
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 13:33:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FEDEF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=ahdnOp2O
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 54CBD9C3647;
	Tue, 19 Dec 2023 07:33:41 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id jrpdn9U1S8IU; Tue, 19 Dec 2023 07:33:41 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E1C1E9C3761;
	Tue, 19 Dec 2023 07:33:40 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com E1C1E9C3761
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1702989220; bh=L9fyx1ANJ3kXLP8U4FoaZxg/2SMf1sL/CK0Kn4GmqdU=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=ahdnOp2OUW4glfKyduGWTSlQgp8G9f3lJ7jAjalaLdg5QypVoh5UcnRW7NeST+WfA
	 Tlnl7i+2SkGD7+Dwt/ZfHtTq1lBKEsYGPJvYwV1Uv8e2ghRXFka6SG9GDOugKJoFlX
	 MQXEC0QG3+W5s09HISz3QaSggT1heF5iuhayEnjX5HkYl1MXwr5aJRIQ31A7NLtgut
	 4JnSrfAeseJakUINoDCUSrSggxJEqOE0gpqUEkn1FFgwmhw3RCa9aLJ0sZBq+kKl/v
	 L/N1Ur/PQ6ROSSmGRBh4OHigCQvRZY6yM29iLfM/AgVG4BosjcXqAAY36NTVo0NA0b
	 JqwmNTAr0WjOA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id rC0SJ-Kia_tG; Tue, 19 Dec 2023 07:33:40 -0500 (EST)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id C4EE49C3647;
	Tue, 19 Dec 2023 07:33:40 -0500 (EST)
Date: Tue, 19 Dec 2023 07:33:40 -0500 (EST)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	shengjiu wang <shengjiu.wang@gmail.com>,
	Xiubo Lee <Xiubo.Lee@gmail.com>,
	alsa-devel <alsa-devel@alsa-project.org>,
	Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinux.com>
Message-ID: 
 <580091239.284162.1702989220772.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <c8e151f8-1fda-41af-b591-d76a60487371@sirena.org.uk>
References: <20231215144005.934728-1-elinor.montmasson@savoirfairelinux.com>
 <20231215144005.934728-11-elinor.montmasson@savoirfairelinux.com>
 <d095614a-071c-4ee8-8e47-5bf073aaabea@kernel.org>
 <299362992.190017.1702892951148.JavaMail.zimbra@savoirfairelinux.com>
 <66caf181-dc54-4161-81db-e77932c33327@kernel.org>
 <c8e151f8-1fda-41af-b591-d76a60487371@sirena.org.uk>
Subject: Re: [PATCHv3 10/10] ASoC: bindings: fsl-asoc-card: add compatible
 for generic codec
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_4562 (ZimbraWebClient - GC112
 (Linux)/8.8.15_GA_4570)
Thread-Topic: ASoC: bindings: fsl-asoc-card: add compatible for generic codec
Thread-Index: I9jJoGD15RCxpNOc8GBxnNt7XaMtHA==
Message-ID-Hash: JDZQUZGVK7UYKJLWL6FTLDK3QOEDMCAR
X-Message-ID-Hash: JDZQUZGVK7UYKJLWL6FTLDK3QOEDMCAR
X-MailFrom: elinor.montmasson@savoirfairelinux.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JDZQUZGVK7UYKJLWL6FTLDK3QOEDMCAR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Monday, 18 December, 2023 15:04:42, Mark Brown wrote:
> On Mon, Dec 18, 2023 at 10:51:44AM +0100, Krzysztof Kozlowski wrote: 
> > On 18/12/2023 10:49, Elinor Montmasson wrote: 
> > Also, you add several new properties, so I really expect either 
> > converting old binding to DT schema first or adding new device in DT 
> > schema format. 
> 
> So long as the binding conversion can go through quickly... 

I can take some time next week to do the conversion, then I'll send this
additional commit in a v4 patch series.

> > > Is this compatible string not suitable ? 
> > > Should we rename it to something else, like "fsl,imx-audio-no-codec" ? 
> 
> > Maybe Mark or Rob will help here, but for me "imx-audio" is just way too 
> > generic. 
> 
> I think it's fine.

I will keep the compatible name to "fsl,imx-audio-generic" for now,
but if it is needed to change it, tell me and I will do it in
the v4 patch series.

Thank you for the review.

Best regards,
Elinor Montmasson
